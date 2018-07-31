From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 31 Jul 2018 14:26:32 -0700
Subject: ARC show_regs() triggers preempt debug splat, lockdep
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5c3cfd4d-46d2-d817-a29a-1890d84c1fbb@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Peter, Al,

Reaching out about a problem I understand, but not quite sure how to fix it.
Its the weird feeling of how was this working all along, if at all.

With print-fatal-signals enabled, there's CONFIG_DEBUG_PREEMPT splat all over,
even with a simple single threaded segv inducing program (console log below). This
originally came to light with a glibc test suite tst-tls3-malloc which is a
multi-threaded monster.

ARC show_regs() is a bit more fancy as it tries to print the executable path,
faulting vma name (in case it was a shared lib etc). This involves taking a bunch
of customary locks which seems to be tripping the debug infra.

The preemption disabling around show_regs() in core signal handling seem to have
been introduced back in 2009 by 3a9f84d354ce1 ("signals, debug: fix BUG: using
smp_processor_id() in preemptible code in print_fatal_signal()") and the fact it
it there still implies it is needed in general.

Possible solutions are to
(1) override this by re-enabling preemption in ARC show_regs()
(2) rip out all the mm access and hence locks from ARC show_regs()
...

Thx,
-Vineet

---------------------------->8---------------------------------
# ./segv   # access invalid address 0x62345678
potentially unexpected fatal signal 11.
BUG: sleeping function called from invalid context at ../kernel/fork.c:979
in_atomic(): 1, irqs_disabled(): 0, pid: 57, name: segv
no locks held by segv/57.
Preemption disabled at:
[<8182f17e>] get_signal+0x4a6/0x7c4
CPU: 0 PID: 57 Comm: segv Not tainted 4.17.0+ #23

Stack Trace:
  arc_unwind_core.constprop.1+0xd0/0xf4
  __might_sleep+0x1f6/0x234
  mmput+0x18/0xc0
  show_regs+0x2c/0x36c
  get_signal+0x4ac/0x7c4
  do_signal+0x30/0x224
  resume_user_mode_begin+0x90/0xd8

Path: /segv
CPU: 0 PID: 57 Comm: segv Tainted: G        W         4.17.0+ #23

[ECR   ]: 0x00050200 => Invalid Write @ 0x62345678 by insn @ 0x0001035c
[EFA   ]: 0x62345678
[BLINK ]: 0x2003a53a
[ERET  ]: 0x1035c
    @off 0x1035c in [/segv]
    VMA: 0x00010000 to 0x00012000
[STAT32]: 0x80080882 : IE U
BTA: 0x00010344	 SP: 0x5fa8fdd0	 FP: 0x5fa8fdd4
LPS: 0x20014464	LPE: 0x20014468	LPC: 0x00000000
...
---------------------------->8---------------------------------
