From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 20 Dec 2018 13:06:51 +0100
Subject: ARC vs. generic sigaction (was Re: [PATCH 08/21] ARC: Linux
 Syscall Interface)
In-Reply-To: <4c3af320-cf35-f914-8bc3-a4c290b8e12b@linaro.org>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-9-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182324560.30183@digraph.polyomino.org.uk>
 <5f512e48-e7fc-2233-febd-2e6a8bc2311b@synopsys.com>
 <05069752-0a66-d6ca-e249-5c702eec4e99@synopsys.com>
 <17fcd9f0-9843-8700-c936-7ab1eb8f2fd2@linaro.org>
 <906931a6-a281-8994-718f-da203890e7e9@synopsys.com>
 <4c3af320-cf35-f914-8bc3-a4c290b8e12b@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAK8P3a3Fg0Y9Os3YP21VXbidPZaV+k10YELd8e=2RWi7nbqT1g@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Dec 20, 2018 at 12:19 PM Adhemerval Zanella
<adhemerval.zanella@linaro.org> wrote:
> On 19/12/2018 20:23, Vineet Gupta wrote:
> > On 12/19/18 2:00 PM, Adhemerval Zanella wrote:
> >> One possibility is to define an arch-specific __sigset_t.h with a custom
> >> _SIGSET_NWORDS value and add an optimization on Linux sigaction.c to check
> >> if both kernel_sigaction and glibc sigaction share same size and internal
> >> layout to use the struct as-is for syscall instead of copy to a temporary
> >> value (similar to what we used to have on getdents).  ARC would still have
> >> arch-specific code and would be the only ABI to have a different sigset_t
> >> though.
> >
> > I don't like ARC to single out either. But as Joseph suggests could this be
> > starting point for arches of future. Assuming it does, would rather see this or
> > the approach Joseph alluded to earlier [1]
> >
> > [1] http://lists.infradead.org/pipermail/linux-snps-arc/2018-December/005122.html
> >
> >>
> >> However I *hardly* think sigaction is a hotspot in real world cases, usually
> >> the signal action is defined once or in a very limited number of times.  I am
> >> not considering synthetic benchmarks, specially lmbench which in most cases
> >> does not measure any useful metric.
> >
> > I tend to disagree. Coming from embedded linux background, I've found it immensely
> > useful to compare 2 minimal systems: especially when distos, out-of-box packages,
> > fancy benchmarks don't even exist.
> >
> > At any rate, my disagreement with status quo is not so much of optimize for ARC,
> > but rather pointless spending of electrons. When we know that there are 64 signals
> > at max, which need 64-bits, why bother shuffling around 1k bits, specially when
> > one is starting afresh and there's no legacy crap getting in the way.
> >
> > The case of adding more signals in future is indeed theoretically possible but
> > that will be an ABI change anyways.
>
> The only advantage of using a larger sigset_t from glibc standpoint is if
> kernel ever change it maximum number of supported signals it would not be
> a ABI change (it would be if glibc provided sigset_t need to be extended).
>
> My point was that this change would hardly help in performance or memory
> utilization due the signal set common utilization in exported and internal
> API.  But at the same time the signal set hasn't been changed for a *long* time
> and I don't see indication that it will any time soon. So a new architecture
> might indeed assume it won't change and set its default to follow Linux user
> ABI.

I just checked again what we actually use in the kernel.
With very few exceptions, all architectures in current kernels use

#define _NSIG             64
#define _NSIG_WORDS       (_NSIG / _NSIG_BPW)
typedef struct {
    /* this sucks for big-endian 32-bit compat mode */
    unsigned long sig[_NSIG_WORDS];
} sigset_t;

The only two exceptions I see are:

- alpha uses a scalar 'unsigned long' instead of the struct+array, but
  the effect is the same layout.
- For unknown reasons, all three MIPS ABIs now use _NSIG=128.
  This changed during linux-2.1.x from 65, to 32 and then the current
  value...

All users of sigset_t that I could find in the kernel just check
the size argument to ensure it matches _NSIG, and return
EINVAL otherwise.

      Arnd
