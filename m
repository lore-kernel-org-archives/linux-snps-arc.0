From: adhemerval.zanella@linaro.org (Adhemerval Zanella)
Date: Wed, 19 Dec 2018 20:00:46 -0200
Subject: ARC vs. generic sigaction (was Re: [PATCH 08/21] ARC: Linux
 Syscall Interface)
In-Reply-To: <05069752-0a66-d6ca-e249-5c702eec4e99@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-9-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182324560.30183@digraph.polyomino.org.uk>
 <5f512e48-e7fc-2233-febd-2e6a8bc2311b@synopsys.com>
 <05069752-0a66-d6ca-e249-5c702eec4e99@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <17fcd9f0-9843-8700-c936-7ab1eb8f2fd2@linaro.org>
To: linux-snps-arc@lists.infradead.org



On 19/12/2018 15:58, Vineet Gupta wrote:
> On 12/18/18 6:39 PM, Vineet Gupta wrote:
>>>> diff --git a/sysdeps/unix/sysv/linux/arc/sigaction.c b/sysdeps/unix/sysv/linux/arc/sigaction.c
>>> Why do you need this, rather than using the unified version (possibly with 
>>> a few macros defined first)?
>>
>> The only syscall ABI requirement is that we pass our our own SA_RESTORER stub
>> (rather than inject one in kernel, and deal with cache sync etc etc). Indeed the
>> common code can be used - likely was not the case when I started with ARC port, or
>> more likely the port that I started ARC port from ;-)
>>
>> I'll update this.
> 
> I took a stab at this but not really happy with taking this approach.
> 
> (1). Common code assumes disparate kernel and userland sigaction struct even
> though there's no reason for a *new* port to be: its not like all glibc code is
> shared/common although I agree it is best to do so as much as possible
> So this requires explicit copy over of 1 struct into other, when it could have
> been avoided altogether for some cases atleast (!SA_RESTORER).
> 
> (2)  Linux kernel asm-generic syscall ABI expects sigset_t to be 2 words
> 
> | kernel: include/uapi/asm-generic/signal.h
> |
> | #define _NSIG		64
> | typedef struct {
> |	unsigned long sig[_NSIG_WORDS];
> | } sigset_t;
> 
> And that is what we pretend at the time of syscall itself, e.g. snippet below from
> generic sigaction()
> 
> |     /* XXX The size argument hopefully will have to be changed to the
> |     real size of the user-level sigset_t.  */
> |   result = INLINE_SYSCALL_CALL (rt_sigaction, sig,
> |				act ? &kact : NULL,
> |				oact ? &koact : NULL, STUB(act) _NSIG / 8);
>                                                                 ^^^^^^^^^
> 
> However glibc assumes sigset_to to be 128 words which is fine, however the memcpy
> for 256 words seems pointless when kernel is not supposed to be even looking at
> beyond 2nd word (although I realize my SA_RESTORE case was doing the implicit copy
> as well)
> 
> (3) Consider me a micro-optimization freak :-) but this memcpy seems waste of
> cycles and will atleast show up LMBench lat_sig <install> micro-benchmarks.
> 
> 
> I don't have strong feelings either ways, but wanted to express my concerns anyways.
> 

One possibility is to define an arch-specific __sigset_t.h with a custom 
_SIGSET_NWORDS value and add an optimization on Linux sigaction.c to check
if both kernel_sigaction and glibc sigaction share same size and internal
layout to use the struct as-is for syscall instead of copy to a temporary
value (similar to what we used to have on getdents).  ARC would still have
arch-specific code and would be the only ABI to have a different sigset_t
though.

However I *hardly* think sigaction is a hotspot in real world cases, usually
the signal action is defined once or in a very limited number of times.  I am
not considering synthetic benchmarks, specially lmbench which in most cases
does not measure any useful metric. Even for other sigset_t usage case I still
think an arch-specific definition should not make much difference:

  1. setcontext: it would incur just in larger ucontext_t (kernel get/set
     mask is done using kernel expected size).  Also, taking in consideration
     these interfaces were removed from POSIX.1-2008, the inherent performance
     issues (signal set/restore will most likely dominate the overhead), and
     some implementation issues (BZ#18135 for instance), I would say to not
     bother to optimize it.

  2. pselect, ppoll, epoll_pwait, posix_spawn (posix_spawnattr_t), sig*: 
     for functions that accept sigset as an argument it would incur in just
     larger memory utilization without much performance overhead. Again,
     runtime for these calls would be mostly dominate by syscall overhead
     or kernel wait-time for events.

  3. raise, etc: for function that might allocate a sigset_t internally it
     will similar to 2.

Now, if ARC intention is just to follow generic glibc linux ABI definitions,
it could just define its sigaction as (not tested):

* sysdeps/unix/sysv/linux/arc/sigaction.c

---
#define SA_RESTORER 0x04000000
#include <kernel_sigaction.h>

extern void restore_rt (void) asm ("__restore_rt") attribute_hidden;

#define SET_SA_RESTORER(kact, act)                      \
  (kact)->sa_flags = (act)->sa_flags | SA_RESTORER;     \
  (kact)->sa_restorer = &__default_rt_sa_restorer

#define RESET_SA_RESTORER(act, kact)                    \
  (act)->sa_restorer = (kact)->sa_restorer

static void __default_rt_sa_restorer(void)
{
  INTERNAL_SYSCALL_DECL (err);
  INTERNAL_SYSCALL_CALL (__NR_rt_sigreturn, err);
}

#include <sysdeps/unix/sysv/linux/sigaction.c>
---
