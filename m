From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 19 Dec 2018 09:58:34 -0800
Subject: ARC vs. generic sigaction (was Re: [PATCH 08/21] ARC: Linux Syscall
 Interface)
In-Reply-To: <5f512e48-e7fc-2233-febd-2e6a8bc2311b@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-9-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182324560.30183@digraph.polyomino.org.uk>
 <5f512e48-e7fc-2233-febd-2e6a8bc2311b@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <05069752-0a66-d6ca-e249-5c702eec4e99@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 6:39 PM, Vineet Gupta wrote:
>>> diff --git a/sysdeps/unix/sysv/linux/arc/sigaction.c b/sysdeps/unix/sysv/linux/arc/sigaction.c
>> Why do you need this, rather than using the unified version (possibly with 
>> a few macros defined first)?
>
> The only syscall ABI requirement is that we pass our our own SA_RESTORER stub
> (rather than inject one in kernel, and deal with cache sync etc etc). Indeed the
> common code can be used - likely was not the case when I started with ARC port, or
> more likely the port that I started ARC port from ;-)
> 
> I'll update this.

I took a stab at this but not really happy with taking this approach.

(1). Common code assumes disparate kernel and userland sigaction struct even
though there's no reason for a *new* port to be: its not like all glibc code is
shared/common although I agree it is best to do so as much as possible
So this requires explicit copy over of 1 struct into other, when it could have
been avoided altogether for some cases atleast (!SA_RESTORER).

(2)  Linux kernel asm-generic syscall ABI expects sigset_t to be 2 words

| kernel: include/uapi/asm-generic/signal.h
|
| #define _NSIG		64
| typedef struct {
|	unsigned long sig[_NSIG_WORDS];
| } sigset_t;

And that is what we pretend at the time of syscall itself, e.g. snippet below from
generic sigaction()

|     /* XXX The size argument hopefully will have to be changed to the
|     real size of the user-level sigset_t.  */
|   result = INLINE_SYSCALL_CALL (rt_sigaction, sig,
|				act ? &kact : NULL,
|				oact ? &koact : NULL, STUB(act) _NSIG / 8);
                                                                ^^^^^^^^^

However glibc assumes sigset_to to be 128 words which is fine, however the memcpy
for 256 words seems pointless when kernel is not supposed to be even looking at
beyond 2nd word (although I realize my SA_RESTORE case was doing the implicit copy
as well)

(3) Consider me a micro-optimization freak :-) but this memcpy seems waste of
cycles and will atleast show up LMBench lat_sig <install> micro-benchmarks.


I don't have strong feelings either ways, but wanted to express my concerns anyways.

Thx,
-Vineet
