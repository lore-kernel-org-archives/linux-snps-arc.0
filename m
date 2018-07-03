From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 3 Jul 2018 10:57:56 +0000
Subject: [PATCH] ARC: prevent showing irrelevant exception info in
 signal message
In-Reply-To: <924308fe-efb3-45f7-b5cb-45d876021f32@synopsys.com>
References: <20180629193907.17227-1-Eugeniy.Paltsev@synopsys.com>
 <924308fe-efb3-45f7-b5cb-45d876021f32@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1530615475.30574.52.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Mon, 2018-07-02@10:57 -0700, Vineet Gupta wrote:
> +CC Al
> 
> On 06/29/2018 12:39 PM, Eugeniy Paltsev wrote:
> > We process signals in the end of syscall/exception handler.
> > It the signal is fatal we print register's content using
> > show_regs function. show_regs() also prints information about
> > last exception happened.
> > 
> > In case of multicore system we can catch the situation when we
> > will print wrong information about exception. See the example:
> > ______________________________
> > CPU-0: started to handle page fault
> > CPU-1: sent signal to process, which is executed on CPU-0
> > CPU-0: ended page fault handle. Started to process signal before
> >        returnig to userspace. Process signal, which is send from
> >        CPU-0. As th signal is fatal we call show_regs().
> >        show_regs() will show information about last exception
> >        which is *page fault* (instead of "trap" which is used for
> >        signals and happened on CPU-0)
> > 
> > So we will get message like this:
> >     /home/waitpid02
> >   potentially unexpected fatal signal 8.
> >   Path: /home/waitpid02
> >   CPU: 0 PID: 100 Comm: waitpid02 Not tainted 4.10.0-rc4 #2
> >   task: 9f11c200 task.stack: 9f3ae000
> > 
> >   [ECR   ]: 0x00050200 => Invalid Write @ 0x00000000 by insn @ 0x000123ec
> >   [EFA   ]: 0x00000000
> >   [BLINK ]: 0x123ea
> >   [ERET  ]: 0x123ec
> >     @off 0x123ec in [/home/waitpid02]
> >     VMA: 0x00010000 to 0x00016000
> >   [STAT32]: 0x80080882 : IE U
> >   BTA: 0x000123ea  SP: 0x5ffd3db0  FP: 0x00000000
> >   LPS: 0x20031684 LPE: 0x2003169a LPC: 0x00000006
> >   [-----other-info-----]
> > 
> > This message is confusing because it show information about page fault
> > ( [ECR   ]: 0x00050200 => Invalid Write ) which is absolutely irrelevant
> > to signal.
> 
> Agreed this is misleading. @Al, is there a way to identify process termination
> from signals because it did something wrong vs. say unhandled signal. For former,
> we want to dump additional info in show_regs() such as PC / Fault addres etc and
> not in other scenario.
> 
> > This situation was reproduced with waitpid02 LTP test.
> > _____________________________
> > 
> > So remove printing information about exceptions from show_regs()
> > to avoid confusing messages. Print information about exceptions
> > only in required places instead of show_regs()
> > 
> > Now we don't print information about exceptions if signal is simply
> > send by another userspace app. So in case of waitpid02 we will print
> > next message:
> > _____________________________
> >     ./waitpid02
> >   potentially unexpected fatal signal 8.
> >   [STAT32]: 0x80080082 : IE U
> >   BTA: 0x20000fc4	 SP: 0x5ff8bd64	 FP: 0x00000000
> >   LPS: 0x200524a0	LPE: 0x200524b6	LPC: 0x00000006
> >   [-----other-info-----]
> > _____________________________
> 
> The prints I'm seeing now, for a segv from NULL pointer access is even more
> confusing !
> There's a mixup of prints....
> 
> -------------------->8--------------------
> Path: /segv
> CPU: 0 PID: 70 Comm: segv Not tainted 4.17.0+ #412
> 
> [ECR   ]: 0x00050200 => Invalid Write @ 0x00000000 by insn @ 0x000103ac
> [EFA   ]: 0x00000000
> [BLINK ]: 0x20047bb0
> [ERET  ]: 0x103ac
>     @off 0x103ac in [/segv]
>     VMA: 0x00010000 to 0x00012000
> 
> potentially unexpected fatal signal 11.
> [STAT32]: 0x80080882 : IE U    
> BTA: 0x00010398     SP: 0x5fc95e1c     FP: 0x5fc95e20
> LPS: 0x20039ffc    LPE: 0x2003a000    LPC: 0x00000000
> r00: 0x00000001    r01: 0x5fc95e94    r02: 0x00000000   
> r03: 0x00000064    r04: 0x80808080    r05: 0x2f2f2f2f   
> ...
> -------------------->8--------------------
> 
> and for the process killed by signal 8, we get below.
> 
> -------------------->8--------------------
> [ARCLinux]# kill -8 71
> [ARCLinux]# potentially unexpected fatal signal 8.
> [STAT32]: 0x80080882 : IE U    
> BTA: 0x20020660     SP: 0x5fbcddec     FP: 0x5fbcde1c
> LPS: 0x20039ffc    LPE: 0x2003a000    LPC: 0x00000000
> r00: 0xfffffdfc    r01: 0x5fbcddf0    r02: 0x00000000   
> r03: 0x00000008    r04: 0x80808080    r05: 0x2f2f2f2f   
> r06: 0x7a2f5f4a    r07: 0x00000000    r08: 0x00000065   
> ...
> 
> 
> [1]+  Floating point exception   ./sleep
> -------------------->8--------------------
> I'm not sure whats the improvement here vs. the status quo.

Why do you think this is confusing?
The main change is that we don't print exception registers for signal based kill.

Moreover, new behavior is more like x86-64 behavior. See the example:

NULL pointer access on x86-64:
-------------------->8--------------------
hell[3925]: segfault at 0 ip 00007f621eb56c41 sp 00007ffcaa5951b8 error 4 in libc-2.26.so[7f621ea01000+1ac000]
potentially unexpected fatal signal 11.
CPU: 1 PID: 3925 Comm: hell Not tainted 4.16.13-200.fc27.x86_64 #1
Hardware name: Dell Inc. Latitude 7480/00F6D3, BIOS 1.9.3 03/09/2018
RIP: 0033:0x7f621eb56c41
RSP: 002b:00007ffcaa5951b8 EFLAGS: 00010283
RAX: 000000000000000e RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 00000000016eb260 RDI: 0000000000000000
RBP: 00007ffcaa5951f0 R08: 0000000000000003 R09: 0000000000000077
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffcaa5952d0 R14: 0000000000000000 R15: 0000000000000000
FS:  00007f621efbf4c0(0000) GS:ffff8f6abe480000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 00000004556a4005 CR4: 00000000003606e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
-------------------->8--------------------

Process killed by signal 11 on x86-64:
-------------------->8--------------------
potentially unexpected fatal signal 11.
CPU: 0 PID: 3998 Comm: sh Not tainted 4.16.13-200.fc27.x86_64 #1
Hardware name: Dell Inc. Latitude 7480/00F6D3, BIOS 1.9.3 03/09/2018
RIP: 0033:0x7fc0b13d744e
RSP: 002b:00007fffba851e30 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: 0000000000000003 RBX: 000055b3e21256a0 RCX: 00007fc0b13d744e
RDX: 0000000000000241 RSI: 000055b3e2125540 RDI: ffffffffffffff9c
RBP: 00007fffba851f40 R08: 0000000000000020 R09: 0000000000000000
R10: 00000000000001b6 R11: 0000000000000246 R12: 000000000000000a
R13: 0000000000000003 R14: 0000000000000001 R15: 000055b3e2125540
FS:  00007fc0b1cdb740(0000) GS:ffff8f6abe400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff33d403000 CR3: 00000003dc7ea004 CR4: 00000000003606f0
-------------------->8--------------------


NOTE: in both cases (ARC and x86-64) "/proc/sys/kernel/print-fatal-signals" was
set to "1"

-- 
 Eugeniy Paltsev
