From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 6 Sep 2017 17:57:18 +0000
Subject: [PATCH v2 2/2] console: don't select first registered console
 if stdout-path used
In-Reply-To: <20170905145405.GH8741@pathway.suse.cz>
References: <20170828165807.8408-1-Eugeniy.Paltsev@synopsys.com>
 <20170828165807.8408-3-Eugeniy.Paltsev@synopsys.com>
 <20170905145405.GH8741@pathway.suse.cz>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1504720637.30546.7.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Petr,

On Tue, 2017-09-05@16:54 +0200, Petr Mladek wrote:
> On Mon 2017-08-28 19:58:07, Eugeniy Paltsev wrote:
> > In the current implementation we take the first console that
> > registers if we didn't select one.
> >?
> > But if we specify console via "stdout-path" property in device tree
> > we don't want first console that registers here to be selected.
> > Otherwise we may choose wrong console - for example if some console
> > is registered earlier than console is pointed in "stdout-path"
> > property because console pointed in "stdout-path" property can be add as
> > preferred quite late - when it's driver is probed.
>?
> register_console() is really twisted function. I would like to better
> understand your problems before we add yet another twist there.
>?
> Could you please be more specific about your problems?
> What was the output of "cat /proc/consoles" before and after the fix?
> What exactly started and stopped working?

Ok, I faced with several problems when I tried to use stdout-path and this
patch solves all of them.
There is the description of some of the problems:

-----------------------------------------------------------------------------------
Problem 1: choosing wrong serial console device

Context:
Serial console device specified via "stdout-path" property in device tree,
support for console on virtual terminal is disabled (CONFIG_VT_CONSOLE is
not selected, CONFIG_VT is selected)

In this case wrong console device can be selected.

Example:
Device tree:
-------------->8--------
chosen {
????bootargs = ""
????stdout-path = &serial_1;
};

serial_0: uart-0 at ... {} /* FAIL: serial_0 is used as console (ttyS0) as it is
?????????????????????????* probed earlier */
serial_1: uart-1 at ... {}
-------------->8--------

# cat /proc/consoles
ttyS0????????????????-W- (EC???a)????4:64????/* FAIL: ttyS0 is used instead of?
??????????????????????????????????????????????* ttyS1 */


This FAIL happens because we take the first registered console if we didn't select
a console via "console=" option in bootargs.

After my patch-v2:
# cat /proc/consoles
ttyS1????????????????-W- (EC p a)????4:67


-----------------------------------------------------------------------------------
Problem 2: printing early boot messages twice and pause in boot messages printing

Context:
We use early console. Serial console device (and early console device) specified
via "stdout-path" property in device tree.?
Support for console on virtual terminal is enabled (CONFIG_VT_CONSOLE=y)

In this case early boot messages will be printed twice - firstly by
bootconsole and after that by 'real' serial console.
Also we will get pause in boot messages printing - as bootconsole will be disabled
mush earlier than 'real' serial console is enabled.

Example:
-------------->8--------
chosen {
????bootargs = "earlycon"
????stdout-path = &serial_3;
};

serial_3: uart-3 at ... {}?
-------------->8--------

So output of serial console will be be like that:
-------------->8--------
XXX - early boot messages, printed by bootconsole
????- FAIL: pause in boot messages printing
XXX - FAIL: again early boot messages, printed by serial console
YYY - rest of boot messages, printed by serial console
-------------->8--------

So the order of enabling/disabling consoles will be like that:
-------------->8--------
bootconsole [uart0] enabled
console [tty0] enabled??????????????/* As no console is select 'tty0' was taken */
bootconsole [uart0] disabled????????/* As we have real (tty0) console we disable
?????????????????????????????????????* all bootconsoles */
console [ttyS3] enabled?????????????/* We take ttyS3 but don't reset its?
?????????????????????????????????????* CON_PRINTBUFFER flag (as there is NO enabled
				?????* bootconsoles) */
-------------->8--------


# cat /proc/consoles
ttyS3????????????????-W- (EC p a)????4:67
tty0?????????????????-WU (E?????)????4:1

As you can see CON_PRINTBUFFER flag (p) set for ttyS3 - that is wrong.

After my patch-v2:
# cat /proc/consoles
ttyS3????????????????-W- (EC???a)????4:67
tty0?????????????????-WU (E??p??)????4:1


These are the problems I have faced but these are NOT THE ONLY POSSIBLE problems
because current behavior is quite unstable and unpredictable.

And of course I would prefer to use simple solution from v1 patch version
but in this case we will face with someone complaining about "tty0".

So all comments and suggestions are more than welcome.

?
> > We retain previous behavior for tty0 console (if "stdout-path" used)
> > as a special case:
> > tty0 will be registered even if it was specified neither
> > in "bootargs" nor in "stdout-path".
> > We had to retain this behavior because a lot of ARM boards (and some
> > powerpc) rely on it.
>?
> My main concern is the exception for "tty". Yes, it was regiression
> reported in the commit c6c7d83b9c9e6a8b3e ("Revert "console: don't
> prefer first registered if DT specifies stdout-path""). But is this
> the only possible regression?
>?
>?
> All this is about the fallback code that tries to enable all
> consoles until a real one with tty binding (newcon->device)
> is enabled.
>?
> v1 version of you patch disabled this fallback code when a console
> was defined by stdout-path in the device tree. This emulates
> defining the console by console= parameter on the command line.
>?
> It might make sense until some complains that a console is not
> longer automatically enabled while it was before. But wait.
> Someone already complained about "tty0". We can solve this
> by adding an exception for "tty0". And if anyone else complains
> about another console, we might need more exceptions.
>
> We might endup with so many exceptions that the fallback code
> will be always used. But then we are back in the square
> and have the original behavior before your patch.
>?

Yes, I understand your concerns.

But I also have another concern: If we decide to left current behavior untouched
(like after reverting patch 05fd007e4629)
more and more boards and devices will use current broken stdout-path behavior in?
any form and in the results we will get the situation when we can't fix
stdout-path behavior at all - because every change will break something somewhere.

(05fd007e4629 patch do absolutely the same as v1 version of my patch)

> This is why I would like to know more info about your problem.
> We need to decide if it is more important than a regression.
> Or if it can be fixed another way.
>?
> Best Regards,
> Petr
--?
?Eugeniy Paltsev
