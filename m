From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 20 Dec 2018 18:48:06 +0000
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
 <87va3oqsks.fsf@oldenburg2.str.redhat.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501464238AD@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/20/18 4:40 AM, Florian Weimer wrote:
> * Adhemerval Zanella:
>
>> The only advantage of using a larger sigset_t from glibc standpoint is if
>> kernel ever change it maximum number of supported signals it would not be
>> a ABI change (it would be if glibc provided sigset_t need to be extended).
> It's not just the kernel.  We might want to restore additional state in
> sigsetjmp, and historically, the excess signal space in sigset_t has
> provided a way to do that even if there is no other space left in the
> jump buffer.

And that additional state is architectural state (more FPU regs etc etc) or
something libc generic. On both counts, that doesn't sound like a clean interface
design !
