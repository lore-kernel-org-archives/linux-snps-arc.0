From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 20 Dec 2018 19:25:00 +0000
Subject: ARC vs. generic sigaction (was Re: [PATCH 08/21] ARC: Linux
 Syscall Interface)
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-9-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182324560.30183@digraph.polyomino.org.uk>
 <5f512e48-e7fc-2233-febd-2e6a8bc2311b@synopsys.com>
 <05069752-0a66-d6ca-e249-5c702eec4e99@synopsys.com>
 <17fcd9f0-9843-8700-c936-7ab1eb8f2fd2@linaro.org>
 <906931a6-a281-8994-718f-da203890e7e9@synopsys.com>
 <4c3af320-cf35-f914-8bc3-a4c290b8e12b@linaro.org>
 <CAK8P3a3Fg0Y9Os3YP21VXbidPZaV+k10YELd8e=2RWi7nbqT1g@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501464238D5@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/20/18 4:07 AM, Arnd Bergmann wrote:
> All users of sigset_t that I could find in the kernel just check
> the size argument to ensure it matches _NSIG, and return
> EINVAL otherwise.

Indeed that was one of the very first problem ARC glibc port ran into with stock
sizeof(sigset_t) passed in sigaction syscall.
