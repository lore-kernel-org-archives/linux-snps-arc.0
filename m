From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 6 Jul 2018 13:05:07 +0000
Subject: [PATCH] ARC: prevent showing irrelevant exception info in
 signal message
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA230750110F64810@us01wembx1.internal.synopsys.com>
References: <20180629193907.17227-1-Eugeniy.Paltsev@synopsys.com>
 <924308fe-efb3-45f7-b5cb-45d876021f32@synopsys.com>
 <1530615475.30574.52.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA230750110F64810@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1530882306.12870.13.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Thu, 2018-07-05@14:26 -0700, Vineet Gupta wrote:
> On 07/03/2018 03:57 AM, Eugeniy Paltsev wrote:
> > On Mon, 2018-07-02@10:57 -0700, Vineet Gupta wrote:
> > > +CC Al
> > > 
> > > On 06/29/2018 12:39 PM, Eugeniy Paltsev wrote:
> > > > We process signals in the end of syscall/exception handler.
> > > > It the signal is fatal we print register's content using
> > > > show_regs function. show_regs() also prints information about
> > > > last exception happened.
> > > > 
> > > > In case of multicore system we can catch the situation when we
> > > > will print wrong information about exception. See the example:
> > > > ______________________________
> > > > CPU-0: started to handle page fault
> > > > CPU-1: sent signal to process, which is executed on CPU-0
> > > > CPU-0: ended page fault handle. Started to process signal before
> > > >        returnig to userspace. Process signal, which is send from
> > > >        CPU-0. As th signal is fatal we call show_regs().
> > > >        show_regs() will show information about last exception
> > > >        which is *page fault* (instead of "trap" which is used for
> > > >        signals and happened on CPU-0)
> > > > 
> > > > So we will get message like this:
> > > >     /home/waitpid02
> > > >   potentially unexpected fatal signal 8.
> > > >   Path: /home/waitpid02
> > > >   CPU: 0 PID: 100 Comm: waitpid02 Not tainted 4.10.0-rc4 #2
> > > >   task: 9f11c200 task.stack: 9f3ae000
> > > > 
> > > >   [ECR   ]: 0x00050200 => Invalid Write @ 0x00000000 by insn @ 0x000123ec
> > > >   [EFA   ]: 0x00000000
> > > >   [BLINK ]: 0x123ea
> > > >   [ERET  ]: 0x123ec
> > > >     @off 0x123ec in [/home/waitpid02]
> > > >     VMA: 0x00010000 to 0x00016000
> > > >   [STAT32]: 0x80080882 : IE U
> > > >   BTA: 0x000123ea  SP: 0x5ffd3db0  FP: 0x00000000
> > > >   LPS: 0x20031684 LPE: 0x2003169a LPC: 0x00000006
> > > >   [-----other-info-----]
> > > > 
> > > > This message is confusing because it show information about page fault
> > > > ( [ECR   ]: 0x00050200 => Invalid Write ) which is absolutely irrelevant
> > > > to signal.
> > > 
> > > Agreed this is misleading. @Al, is there a way to identify process termination
> > > from signals because it did something wrong vs. say unhandled signal. For former,
> > > we want to dump additional info in show_regs() such as PC / Fault addres etc and
> > > not in other scenario.
> > > 
> > > > This situation was reproduced with waitpid02 LTP test.
> > > > _____________________________
> > > > 
> > > > So remove printing information about exceptions from show_regs()
> > > > to avoid confusing messages. Print information about exceptions
> > > > only in required places instead of show_regs()
> > > > 
> > > > Now we don't print information about exceptions if signal is simply
> > > > send by another userspace app. So in case of waitpid02 we will print
> > > > next message:
> > > > _____________________________
> > > >     ./waitpid02
> > > >   potentially unexpected fatal signal 8.
> > > >   [STAT32]: 0x80080082 : IE U
> > > >   BTA: 0x20000fc4	 SP: 0x5ff8bd64	 FP: 0x00000000
> > > >   LPS: 0x200524a0	LPE: 0x200524b6	LPC: 0x00000006
> > > >   [-----other-info-----]
> > > > _____________________________
> > > 
> > > The prints I'm seeing now, for a segv from NULL pointer access is even more
> > > confusing !
> > > There's a mixup of prints....
> > > 
> > > -------------------->8--------------------
> > > Path: /segv
> > > CPU: 0 PID: 70 Comm: segv Not tainted 4.17.0+ #412
> > > 
> > > [ECR   ]: 0x00050200 => Invalid Write @ 0x00000000 by insn @ 0x000103ac
> > > [EFA   ]: 0x00000000
> > > [BLINK ]: 0x20047bb0
> > > [ERET  ]: 0x103ac
> > >     @off 0x103ac in [/segv]
> > >     VMA: 0x00010000 to 0x00012000
> > > 
> > > potentially unexpected fatal signal 11.
> > > [STAT32]: 0x80080882 : IE U    
> > > BTA: 0x00010398     SP: 0x5fc95e1c     FP: 0x5fc95e20
> > > LPS: 0x20039ffc    LPE: 0x2003a000    LPC: 0x00000000
> > > r00: 0x00000001    r01: 0x5fc95e94    r02: 0x00000000   
> > > r03: 0x00000064    r04: 0x80808080    r05: 0x2f2f2f2f   
> > > ...
> > > -------------------->8--------------------
> > > 
> > > and for the process killed by signal 8, we get below.
> > > 
> > > -------------------->8--------------------
> > > [ARCLinux]# kill -8 71
> > > [ARCLinux]# potentially unexpected fatal signal 8.
> > > [STAT32]: 0x80080882 : IE U    
> > > BTA: 0x20020660     SP: 0x5fbcddec     FP: 0x5fbcde1c
> > > LPS: 0x20039ffc    LPE: 0x2003a000    LPC: 0x00000000
> > > r00: 0xfffffdfc    r01: 0x5fbcddf0    r02: 0x00000000   
> > > r03: 0x00000008    r04: 0x80808080    r05: 0x2f2f2f2f   
> > > r06: 0x7a2f5f4a    r07: 0x00000000    r08: 0x00000065   
> > > ...
> > > 
> > > 
> > > [1]+  Floating point exception   ./sleep
> > > -------------------->8--------------------
> > > I'm not sure whats the improvement here vs. the status quo.
> > 
> > Why do you think this is confusing?
> > The main change is that we don't print exception registers for signal based kill.
> 
> For the pure signal based termination, what is the point of printing the rest of
> registers. If you say "it is to give a feel of what the userspace was doing at the
> time...." then we are lacking the most crucial piece which is the PC at the time
> (i.e. ERET placeholder).

We can disable printing the rest of registers by setting "print-fatal-signals" to 0
by default. In that case we will print rest of registers only for exceptions
happened in kernel space (when die() function is called)

So in case of setting "print-fatal-signals" to 0 we will get following messages:

NULL pointer access from user space:
---------->8-------------
# ./arc_hell &
# Path: /root/arc_hell
CPU: 0 PID: 79 Comm: arc_hell Not tainted 4.17.0+ #10

[ECR   ]: 0x00050100 => Invalid Read @ 0x00000000 by insn @ 0x2003a35c
[EFA   ]: 0x00000000
[BLINK ]: 0x20039ef8
[ERET  ]: 0x2003a35c
    @off 0x2e35c in [/lib/libuClibc-1.0.18.so]
    VMA: 0x2000c000 to 0x20072000

[1]+  Segmentation fault         ./arc_hell
---------->8-------------

Process killed by signal 11 via 'kill -s 11':
---------->8-------------
# sleep 1000 &
[1]+  Segmentation fault         sleep 1000
---------->8-------------



Probably the best variant is to print only information about unexpected exception
from exception handler and leave printing ECR/EFA/BLINK/ERET in show_regs().

So in case of exception based signal we will print from exception handler
something like that:
---------->8-------------
Unexpected exception: Invalid Read @ 0x00000000 by insn @ 0x2003a35c
---------->8-------------

Other information will be print in show_regs (only if "print-fatal-signals"
is enabled):
---------->8-------------
potentially unexpected fatal signal 11.
Path: /root/arc_hell
CPU: 0 PID: 79 Comm: arc_hell Not tainted 4.17.0+ #10
[ECR   ]: 0x00050100
[EFA   ]: 0x00000000
[BLINK ]: 0x20039ef8
[ERET  ]: 0x2003a35c
    @off 0x2e35c in [/lib/libuClibc-1.0.18.so]
    VMA: 0x2000c000 to 0x20072000
[STAT32]: 0x80080882 : IE U
BTA: 0x00010398     SP: 0x5fc95e1c     FP: 0x5fc95e20
LPS: 0x20039ffc    LPE: 0x2003a000    LPC: 0x00000000
r00: 0x00000001    r01: 0x5fc95e94    r02: 0x00000000
r03: 0x00000064    r04: 0x80808080    r05: 0x2f2f2f2f
...
---------->8-------------


> > Moreover, new behavior is more like x86-64 behavior. See the example:
> 
> For a null pointer based termination, we now have a ugly looking "potentially
> unexpected..." print in the middle of reg file dump, that is not what x86 does.
> Anyways, that print It is undesirable, but not a deal breaker.  The issue is point
> above, can we remedy it.
> 
> BTW in your original patch, for a null pointer access, the printing code now
> allocates 2 pages, in each of show_xxx routines and the one in show_regs() is now
> pointless, as it is not used there at all there - so please fix that as well.

Thanks for pointing, will fix in v2 patch.

> -Vineet
> 
-- 
 Eugeniy Paltsev
