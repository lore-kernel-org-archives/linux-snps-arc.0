From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 14 Mar 2018 16:36:16 +0000
Subject: arc_usr_cmpxchg and preemption
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1521045375.11552.27.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

While debugging a segfault of user-space app on system without atomic ops
(I mean LLOCK/SCOND) I understood the root-cause is in implementation
of kernel's __NR_arc_usr_cmpxchg syscall which is supposed to emulate mentioned
atomic ops for user-space.

So here's a problem.

1. User-space app [via libc] triggers __NR_arc_usr_cmpxchg syscall,
   we enter arc_usr_cmpxchg()which basically does:
   ---------------------------->8-------------------------------
     preempt_disable();
     __get_user(uval, uaddr);
     __put_user(new, uaddr);
     preempt_enable();
   ---------------------------->8-------------------------------

2. Most of the time everything is fine because __get_user()/__put_user()
   for ARC is just LD/ST.

3. Rarely user's variable is situated in not yet allocated page.
   Here I mean copy-on-write case, when a page has read-only flag in TLB.
   In that case __get_user() succeeds but __put_user() causes Privilege
   Violation exception and we enter do_page_fault() where new page allocation
   with proper access bits is supposed to happen... but that never happens
   because with preempt_disable() we set in_atomic() which set
   faulthandler_disabled() and so we exit early from page fault handler
   effectively with nothing done, i.e. user's variable is left unchanged
   which in its turn causes very strange problems later down the line because
   we don't notify user-space app about failed data modification.

The simplest fix is to not mess with preemption:
   ---------------------------->8-------------------------------
diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
index 5ac3b547453f..d1713d8d3981 100644
--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -63,8 +63,6 @@ SYSCALL_DEFINE3(arc_usr_cmpxchg, int *, uaddr, int, expected, int, new)
        if (!access_ok(VERIFY_WRITE, uaddr, sizeof(int)))
                return -EFAULT;
 
-       preempt_disable();
-
        if (__get_user(uval, uaddr))
                goto done;
 
@@ -74,8 +72,6 @@ SYSCALL_DEFINE3(arc_usr_cmpxchg, int *, uaddr, int, expected, int, new)
        }
 
 done:
-       preempt_enable();
-
        return uval;
 }
   ---------------------------->8-------------------------------

But I'm not really sure how safe is that.
Especially if we think about PREEMPT_RT for example.

Any thoughts?

-Alexey

P.S. In our emulation of unaligned access we don't seem to disable preemption so
it might be a good idea to "align" syscall implementation is both cases.
