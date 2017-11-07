From: pmladek@suse.com (Petr Mladek)
Date: Tue, 7 Nov 2017 14:04:54 +0100
Subject: [PATCH v2 2/2] console: don't select first registered console if
 stdout-path used
In-Reply-To: <1504720637.30546.7.camel@synopsys.com>
References: <20170828165807.8408-1-Eugeniy.Paltsev@synopsys.com>
 <20170828165807.8408-3-Eugeniy.Paltsev@synopsys.com>
 <20170905145405.GH8741@pathway.suse.cz>
 <1504720637.30546.7.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171107130454.GD2652@pathway.suse.cz>
To: linux-snps-arc@lists.infradead.org

Hi Eigeniy,

I am sorry for the late response. The problem is far from
trivial. I am getting snowed under many other tasks as well.


On Wed 2017-09-06 17:57:18, Eugeniy Paltsev wrote:
> Hi Petr,
> 
> On Tue, 2017-09-05@16:54 +0200, Petr Mladek wrote:
> > On Mon 2017-08-28 19:58:07, Eugeniy Paltsev wrote:
> > > In the current implementation we take the first console that
> > > registers if we didn't select one.
> > >?
> > > But if we specify console via "stdout-path" property in device tree
> > > we don't want first console that registers here to be selected.
> > > Otherwise we may choose wrong console - for example if some console
> > > is registered earlier than console is pointed in "stdout-path"
> > > property because console pointed in "stdout-path" property can be add as
> > > preferred quite late - when it's driver is probed.
> >?
> > register_console() is really twisted function. I would like to better
> > understand your problems before we add yet another twist there.
> >?
> > Could you please be more specific about your problems?
> > What was the output of "cat /proc/consoles" before and after the fix?
> > What exactly started and stopped working?
> 
> Ok, I faced with several problems when I tried to use stdout-path and this
> patch solves all of them.
> There is the description of some of the problems:
> 
> -----------------------------------------------------------------------------------
> Problem 1: choosing wrong serial console device
> 
> Context:
> Serial console device specified via "stdout-path" property in device tree,
> support for console on virtual terminal is disabled (CONFIG_VT_CONSOLE is
> not selected, CONFIG_VT is selected)
> 
> In this case wrong console device can be selected.
> 
> Example:
> Device tree:
> -------------->8--------
> chosen {
> ????bootargs = ""
> ????stdout-path = &serial_1;
> };
> 
> serial_0: uart-0 at ... {} /* FAIL: serial_0 is used as console (ttyS0) as it is
> ?????????????????????????* probed earlier */
> serial_1: uart-1 at ... {}
> -------------->8--------
>
> # cat /proc/consoles
> ttyS0????????????????-W- (EC???a)????4:64????/* FAIL: ttyS0 is used instead of?
> ??????????????????????????????????????????????* ttyS1 */

I guess that you know this. But let's be sure that we
understand the problem the same way.

The fact that ttyS0 was registered means that register_console()
was called for ttyS0 before __add_preferred_console() was called
for ttyS1 (defined as stdout-path).

__add_preferred_console() sets "preferred_console". This causes that
register_console() sets "has_preferred" and waits for the configured
console.

The preferred console from the device three seems to be add this way:

+ uart_add_one_port()
  + of_console_check()
    + add_preferred_console()
      + __add_preferred_console()


If I get this properly, uart_add_one_port() is called when
the serial port is probed. It calls add_preferred_console()
when the port really exists. IMHO, this is the root of
the problem. It is too late because register_console()
enables another console as a fallback in the meantime.

[Later realized that the commit 05fd007e46296afb24 ("console:
don't prefer first registered if DT specifies stdout-path")
basically confirmed this.].


BTW: Your solution with the check of "of_stdout" in
register_console() looks like a hack to me. A cleaner
solution would have been to call add_preferred_console()
earlier from the "of" code. For example, from
of_alias_scan() when "stdout-path" is analyzed and
"of_stdout" is set.

Note that similar solution is used for the console defined
via spcr. See add_preferred_console() in parse_spcr().


BTW2: Also note the following condition in of_console_check()

	if (!dn || dn != of_stdout || console_set_on_cmdline)
		return false;

It means that the console defined in the device three (stdout-path)
is ignored when there is console= defined on the command line.

Your patch did not break this logic but might have made wrong
assumptions. In this case, has_preferred should not be set
because of of_stdout.

This is another reason why a solution on the "of" code side
might have been cleaner.


> This FAIL happens because we take the first registered console if we didn't select
> a console via "console=" option in bootargs.
> 
> After my patch-v2:
> # cat /proc/consoles
> ttyS1????????????????-W- (EC p a)????4:67

> 
> -----------------------------------------------------------------------------------
> Problem 2: printing early boot messages twice and pause in boot messages printing
> 
> Context:
> We use early console. Serial console device (and early console device) specified
> via "stdout-path" property in device tree.?
> Support for console on virtual terminal is enabled (CONFIG_VT_CONSOLE=y)
> 
> In this case early boot messages will be printed twice - firstly by
> bootconsole and after that by 'real' serial console.
> Also we will get pause in boot messages printing - as bootconsole will be disabled
> mush earlier than 'real' serial console is enabled.
> 
> Example:
> -------------->8--------
> chosen {
> ????bootargs = "earlycon"
> ????stdout-path = &serial_3;
> };
> 
> serial_3: uart-3 at ... {}?
> -------------->8--------
> 
> So output of serial console will be be like that:
> -------------->8--------
> XXX - early boot messages, printed by bootconsole
> ????- FAIL: pause in boot messages printing
> XXX - FAIL: again early boot messages, printed by serial console
> YYY - rest of boot messages, printed by serial console
> -------------->8--------
> 
> So the order of enabling/disabling consoles will be like that:
> -------------->8--------
> bootconsole [uart0] enabled
> console [tty0] enabled??????????????/* As no console is select 'tty0' was taken */

There is a special hack in param_setup_earlycon(). It allows to
mention just "earlycon" in the device tree. The particular
early console is must be compatible with the one defined
as stdout-path.

Well, I am not sure why ttyS0 is used instead of ttyS3 as
the earlycon. One possibility is that ttyS0 passes
fdt_node_check_compatible() in early_init_dt_scan_chosen_stdout().
Another possibility is that CONFIG_ACPI_SPCR_TABLE was enabled,
earlycon_init_is_deferred was set, and the deferred handling
caused fallback to ttyS0.


> bootconsole [uart0] disabled????????/* As we have real (tty0) console we disable
> ?????????????????????????????????????* all bootconsoles */


This is one big and old problem of console registration code.
console->match() function has side-effects. Therefore we could
not easily match early consoles with the real consoles. Therefore
we do not know when it is the right time to disable the boot
console. The current code disables all boot consoles when
the real, so-called preferred, console is registered.

The preferred console is the last one on the command line.
In this case, it is ttyS0 because it thinks that there is
no preferred console.

A proper solution is to rework the console matching mechanism
and allow to match early and real consoles. It is a lot of work.


> console [ttyS3] enabled?????????????/* We take ttyS3 but don't reset its?
> ?????????????????????????????????????* CON_PRINTBUFFER flag (as there is NO enabled
> 				?????* bootconsoles) */

The "sad" thing is that the race with early console helped
to register the configured ttyS3 instead of ttyS0.

> -------------->8--------
> 
> 
> # cat /proc/consoles
> ttyS3????????????????-W- (EC p a)????4:67
> tty0?????????????????-WU (E?????)????4:1
> 
> As you can see CON_PRINTBUFFER flag (p) set for ttyS3 - that is wrong.

Well, is this really wrong? The early console was ttyS0 and the final
one ttyS3. These should be different devices. Therefore the messages
should not be duplicated.


> After my patch-v2:
> # cat /proc/consoles
> ttyS3????????????????-W- (EC???a)????4:67
> tty0?????????????????-WU (E??p??)????4:1

I think that this is actually worse. You will miss many messages
on the ttyS3 console.
 
> 
> These are the problems I have faced but these are NOT THE ONLY POSSIBLE problems
> because current behavior is quite unstable and unpredictable.

Yes, I know and we should do something about it. The problem is that
probably no-one really understand the code and historic aspects.
People just added hacks when they needed something. These were
rejected when they caused regressions.

I am trying to get the picture and eventually put the code into
a shape. But it seems to be a long term task.


> And of course I would prefer to use simple solution from v1 patch version
> but in this case we will face with someone complaining about "tty0".
> 
> So all comments and suggestions are more than welcome.
?
> > > We retain previous behavior for tty0 console (if "stdout-path" used)
> > > as a special case:
> > > tty0 will be registered even if it was specified neither
> > > in "bootargs" nor in "stdout-path".
> > > We had to retain this behavior because a lot of ARM boards (and some
> > > powerpc) rely on it.
> >?
> > My main concern is the exception for "tty". Yes, it was regiression
> > reported in the commit c6c7d83b9c9e6a8b3e ("Revert "console: don't
> > prefer first registered if DT specifies stdout-path""). But is this
> > the only possible regression?
> >?
> >?
> > All this is about the fallback code that tries to enable all
> > consoles until a real one with tty binding (newcon->device)
> > is enabled.
> >?
> > v1 version of you patch disabled this fallback code when a console
> > was defined by stdout-path in the device tree. This emulates
> > defining the console by console= parameter on the command line.
> >?
> > It might make sense until some complains that a console is not
> > longer automatically enabled while it was before. But wait.
> > Someone already complained about "tty0". We can solve this
> > by adding an exception for "tty0". And if anyone else complains
> > about another console, we might need more exceptions.
> >
> > We might endup with so many exceptions that the fallback code
> > will be always used. But then we are back in the square
> > and have the original behavior before your patch.
> >?
> 
> Yes, I understand your concerns.
> 
> But I also have another concern: If we decide to left current behavior untouched
> (like after reverting patch 05fd007e4629)
> more and more boards and devices will use current broken stdout-path behavior in?
> any form and in the results we will get the situation when we can't fix
> stdout-path behavior at all - because every change will break something somewhere.

I see the point. I am only afraid that it is already too late, see below.


> (05fd007e4629 patch do absolutely the same as v1 version of my patch)

It is clear that we have already been there and people complained.
The question is if there is another way out.

IMHO, the most important thing is to allow matching the various
aliases, early, and real consoles without side-effects.
This should allow to:

    + Disable boot console exactly when the related real console
      is registered. It would remove the problems with duplicated
      or missing messages.

    + Do more conservative changes in the fallback console
      registration. For example, allow to register ttyX as
      a fallback but wait for the right ttySY that is defined
      in stdout-path.

    + Make the console registration more predictable and reliable
      in general.


I am sorry that I do not have a better answer for you at the moment.
But I really do not like your patches. They are hacks (adding
exceptions) into already hacky code. The first version was
the same as an already reverted commit. The second version tried
to work around the regression but it seemed to change the behavior
as well.

A workaround should be to define the console on the command like.
This would disable the fallback registration.

Best Regards,
Petr
