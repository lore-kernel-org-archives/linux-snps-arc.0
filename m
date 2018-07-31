From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 31 Jul 2018 15:32:49 -0700
Subject: ARC show_regs() triggers preempt debug splat, lockdep
In-Reply-To: <5c3cfd4d-46d2-d817-a29a-1890d84c1fbb@synopsys.com>
References: <5c3cfd4d-46d2-d817-a29a-1890d84c1fbb@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f05b18a2-b6d3-ae6d-d358-4b2b5ae5250a@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 07/31/2018 02:26 PM, Vineet Gupta wrote:
> Hi Peter, Al,
> 
> Reaching out about a problem I understand, but not quite sure how to fix it.
> Its the weird feeling of how was this working all along, if at all.
> 
> With print-fatal-signals enabled, there's CONFIG_DEBUG_PREEMPT splat all over,
> even with a simple single threaded segv inducing program (console log below). This
> originally came to light with a glibc test suite tst-tls3-malloc which is a
> multi-threaded monster.
> 
> ARC show_regs() is a bit more fancy as it tries to print the executable path,
> faulting vma name (in case it was a shared lib etc). This involves taking a bunch
> of customary locks which seems to be tripping the debug infra.
> 
> The preemption disabling around show_regs() in core signal handling seem to have
> been introduced back in 2009 by 3a9f84d354ce1 ("signals, debug: fix BUG: using
> smp_processor_id() in preemptible code in print_fatal_signal()") and the fact it
> it there still implies it is needed in general.
> 
> Possible solutions are to
> (1) override this by re-enabling preemption in ARC show_regs()
> (2) rip out all the mm access and hence locks from ARC show_regs()
> ...

I investigated a bit more and it seems the story is more complicated and there are
2 distinct issues.

1. print-fatal-signals ENABLED: induces the show_regs() issue of __might_sleep()
with preemption_disabled(). This happens with simplest of programs

2. print-fatal-signals DISABLED: this causes glibc testsuite tst-tls3-malloc to
barf still, see below. This is a multi-threaded test where one thread is serving a
page fault, gets scheduled out and other thread observes the signal and decides to
exit (this is UP kernel BTW)


------------------->8------------------
# while true; do ./tst-tls3-malloc ; done
Didn't expect signal from child: got `Segmentation fault'
^C
============================================
WARNING: possible recursive locking detected
4.17.0+ #25 Not tainted
--------------------------------------------
tst-tls3-malloc/510 is trying to acquire lock:
606c7728 (&mm->mmap_sem){++++}, at: __might_fault+0x28/0x5c

but task is already holding lock:
606c7728 (&mm->mmap_sem){++++}, at: do_page_fault+0x9c/0x2a0

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&mm->mmap_sem);
  lock(&mm->mmap_sem);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

1 lock held by tst-tls3-malloc/510:
 #0: 606c7728 (&mm->mmap_sem){++++}, at: do_page_fault+0x9c/0x2a0

stack backtrace:
CPU: 0 PID: 510 Comm: tst-tls3-malloc Not tainted 4.17.0+ #25

Stack Trace:
  arc_unwind_core.constprop.1+0xd0/0xf4
  __lock_acquire+0x586/0x142c
  lock_acquire+0x36/0x4c
  __might_fault+0x42/0x5c
  exit_robust_list+0x40/0x19c
  mm_release+0xce/0xf4
  do_exit+0x554/0x780
  do_group_exit+0x22/0x84
  get_signal+0x196/0x79c
  do_signal+0x30/0x224
  resume_user_mode_begin+0x90/0xd8

Timed out: killed the child process
------------------->8------------------
