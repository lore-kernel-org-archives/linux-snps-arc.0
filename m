From: paul.burton@imgtec.com (Paul Burton)
Date: Wed, 6 Sep 2017 11:13:12 -0700
Subject: [PATCH v2 2/2] console: don't select first registered console if
 stdout-path used
In-Reply-To: <1504720637.30546.7.camel@synopsys.com>
References: <20170828165807.8408-1-Eugeniy.Paltsev@synopsys.com>
 <20170905145405.GH8741@pathway.suse.cz>
 <1504720637.30546.7.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1562700.gjTWZ2LiPg@np-p-burton>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,

On Wednesday, 6 September 2017 10:57:18 PDT Eugeniy Paltsev wrote:
> > > We retain previous behavior for tty0 console (if "stdout-path" used)
> > > as a special case:
> > > tty0 will be registered even if it was specified neither
> > > in "bootargs" nor in "stdout-path".
> > > We had to retain this behavior because a lot of ARM boards (and some
> > > powerpc) rely on it.
> >
> > My main concern is the exception for "tty". Yes, it was regiression
> > reported in the commit c6c7d83b9c9e6a8b3e ("Revert "console: don't
> > prefer first registered if DT specifies stdout-path""). But is this
> > the only possible regression?
> >
> > All this is about the fallback code that tries to enable all
> > consoles until a real one with tty binding (newcon->device)
> > is enabled.
> >
> > v1 version of you patch disabled this fallback code when a console
> > was defined by stdout-path in the device tree. This emulates
> > defining the console by console= parameter on the command line.
> >
> > It might make sense until some complains that a console is not
> > longer automatically enabled while it was before. But wait.
> > Someone already complained about "tty0". We can solve this
> > by adding an exception for "tty0". And if anyone else complains
> > about another console, we might need more exceptions.
> >
> > We might endup with so many exceptions that the fallback code
> > will be always used. But then we are back in the square
> > and have the original behavior before your patch.
> 
> Yes, I understand your concerns.
> 
> But I also have another concern: If we decide to left current behavior
> untouched (like after reverting patch 05fd007e4629)
> more and more boards and devices will use current broken stdout-path
> behavior in any form and in the results we will get the situation when we
> can't fix stdout-path behavior at all - because every change will break
> something somewhere. 
> (05fd007e4629 patch do absolutely the same as v1 version of my patch)
> 
> > This is why I would like to know more info about your problem.
> > We need to decide if it is more important than a regression.
> > Or if it can be fixed another way.

After the troubles with commit 05fd007e4629 ("console: don't prefer first 
registered if DT specifies stdout-path") I took an alternate approach: rather 
than preventing the first console being registered, I instead prevent the 
bootconsole from being unregistered until we see the stdout-path console 
probed.

For my systems, where there are 3 consoles involved, this is how it goes:

 - The 8250 earlycon is our boot console.

 - tty0 (from CONFIG_VT) comes along & gets registered fairly early, and
   becomes the "proper" console. With current mainline this causes the boot
   console to be unregistered & lose output over the UART for a while.

 - Eventually ttyS0, the proper 8250 console, gets registered & we re-gain
   UART output. If the system died between the tty0 & ttyS0 registering, it
   dies silently.

With my current approach the difference is that the boot console sticks around 
until the last step where ttyS0 is registered (or until the late_initcall 
stage if ttyS0 never registers). This solves my problem - would it solve 
yours?

I haven't submitted this patch yet, but you can find it here in a v4.13 based 
downstream if you want to give it a try:

  https://git.linux-mips.org/cgit/linux-mti.git/commit/?
h=eng-201705051946&id=dd144b12c899b591c0370715328199bc958878fe

Thanks,
    Paul
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20170906/5600b677/attachment.sig>
