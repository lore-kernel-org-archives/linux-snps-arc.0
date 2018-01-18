From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 18 Jan 2018 19:11:01 +0000
Subject: [PATCH] ARC: Add a knob to control usage of dual-issue
In-Reply-To: <7d97edc0-d0ee-326b-bcd2-c6731aa953b2@synopsys.com>
References: <20180118134831.41489-1-abrodkin@synopsys.com>
 <7d97edc0-d0ee-326b-bcd2-c6731aa953b2@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1516302661.8324.32.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Thu, 2018-01-18@10:54 -0800, Vineet Gupta wrote:
> On 01/18/2018 05:48 AM, Alexey Brodkin wrote:
> > HS48 core starts with dual-issue enabled but in some cases like
> > debugging as well as benchmarking it might be useful to disable
> > dual-issue for a particular run.
> > 
> > Note:
> >    1. To disable dual-issue user has to change a value of a global variable
> >       in target's memory right before start of Linu kernel execution
> >       (most probably via JTAG)
> > 
> >    2. Disabling happens very early on boot and to get it back enabled it's
> >       required to restart Linux kernel. I.e. with this change we don't allow
> >       toggling dual-issue state in random moments of run-time
> 
> But we need access to a debugger anyways to change this global variable.
> If you already have that won't it be better to change the aux register itself from 
> the debugger itself.
> I don't really see how the global variable way of toggle adds any value here ?

I think there's some sense in a global variable.

1. Not sure if OpenOCD/GDB pair for ARC allows to read/write random AUX regs.
   Probably allows but I guess we'll need a new .xml description which lists EXEC_CTRL
   AUX reg. Correct me if I'm wrong here.

2. If somebody wants to disable dual-issue persistently (here I mean building an image
   which had dual-issue disabled and there's no need to alter anything after image loading)
   then it's possible just to change a simple and very obvious line in arch/arc/kernel/setup.c
   other than trying to guess what could be good place in sources to stick that AUX reg write.
   Note we don't explicitly do reads of AUX_EXEC_CTRL instead we just use READ_BCR macro so
   for newcomers it might not be immediately obvious what to do and where.
   Add the fact that logic of the flag is reversed...

-Alexey
