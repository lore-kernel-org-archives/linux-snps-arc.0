From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 19 Dec 2018 14:23:49 -0800
Subject: ARC vs. generic sigaction (was Re: [PATCH 08/21] ARC: Linux
 Syscall Interface)
In-Reply-To: <17fcd9f0-9843-8700-c936-7ab1eb8f2fd2@linaro.org>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-9-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182324560.30183@digraph.polyomino.org.uk>
 <5f512e48-e7fc-2233-febd-2e6a8bc2311b@synopsys.com>
 <05069752-0a66-d6ca-e249-5c702eec4e99@synopsys.com>
 <17fcd9f0-9843-8700-c936-7ab1eb8f2fd2@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <906931a6-a281-8994-718f-da203890e7e9@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/19/18 2:00 PM, Adhemerval Zanella wrote:
> 
> 
> One possibility is to define an arch-specific __sigset_t.h with a custom 
> _SIGSET_NWORDS value and add an optimization on Linux sigaction.c to check
> if both kernel_sigaction and glibc sigaction share same size and internal
> layout to use the struct as-is for syscall instead of copy to a temporary
> value (similar to what we used to have on getdents).  ARC would still have
> arch-specific code and would be the only ABI to have a different sigset_t
> though.

I don't like ARC to single out either. But as Joseph suggests could this be
starting point for arches of future. Assuming it does, would rather see this or
the approach Joseph alluded to earlier [1]

[1] http://lists.infradead.org/pipermail/linux-snps-arc/2018-December/005122.html

> 
> However I *hardly* think sigaction is a hotspot in real world cases, usually
> the signal action is defined once or in a very limited number of times.  I am
> not considering synthetic benchmarks, specially lmbench which in most cases
> does not measure any useful metric. 

I tend to disagree. Coming from embedded linux background, I've found it immensely
useful to compare 2 minimal systems: especially when distos, out-of-box packages,
fancy benchmarks don't even exist.

At any rate, my disagreement with status quo is not so much of optimize for ARC,
but rather pointless spending of electrons. When we know that there are 64 signals
at max, which need 64-bits, why bother shuffling around 1k bits, specially when
one is starting afresh and there's no legacy crap getting in the way.

The case of adding more signals in future is indeed theoretically possible but
that will be an ABI change anyways.

> Even for other sigset_t usage case I still
> think an arch-specific definition should not make much difference:
> 
>   1. setcontext: it would incur just in larger ucontext_t (kernel get/set
>      mask is done using kernel expected size).  Also, taking in consideration
>      these interfaces were removed from POSIX.1-2008, the inherent performance
>      issues (signal set/restore will most likely dominate the overhead), and
>      some implementation issues (BZ#18135 for instance), I would say to not
>      bother to optimize it.
> 
>   2. pselect, ppoll, epoll_pwait, posix_spawn (posix_spawnattr_t), sig*: 
>      for functions that accept sigset as an argument it would incur in just
>      larger memory utilization without much performance overhead. Again,
>      runtime for these calls would be mostly dominate by syscall overhead
>      or kernel wait-time for events.
> 
>   3. raise, etc: for function that might allocate a sigset_t internally it
>      will similar to 2.

I agree that that in libc, pretty much anything will be dominated by syscall
overhead, but still...


> Now, if ARC intention is just to follow generic glibc linux ABI definitions,
> it could just define its sigaction as (not tested):

Indeed the ABI is etched in stone and I have a very similar code now, with slight
difference.

> * sysdeps/unix/sysv/linux/arc/sigaction.c
> 
> ---
> #define SA_RESTORER 0x04000000
> #include <kernel_sigaction.h>
> 
> extern void restore_rt (void) asm ("__restore_rt") attribute_hidden;
> 
> #define SET_SA_RESTORER(kact, act)                      \
>   (kact)->sa_flags = (act)->sa_flags | SA_RESTORER;     \
>   (kact)->sa_restorer = &__default_rt_sa_restorer

+#define SET_SA_RESTORER(kact, act)				\
+ ({								\
+   if (!((kact)->sa_flags & SA_RESTORER))			\
+     {								\
+       (kact)->sa_restorer = __default_rt_sa_restorer;		\
+       (kact)->sa_flags |= SA_RESTORER;			\
+     }								\
+   else							\
+     (kact)->sa_restorer = (act)->sa_restorer;			\
+ })

> 
> #define RESET_SA_RESTORER(act, kact)                    \
>   (act)->sa_restorer = (kact)->sa_restorer
> 
> static void __default_rt_sa_restorer(void)
> {
>   INTERNAL_SYSCALL_DECL (err);
>   INTERNAL_SYSCALL_CALL (__NR_rt_sigreturn, err);
> }
> 
> #include <sysdeps/unix/sysv/linux/sigaction.c>
