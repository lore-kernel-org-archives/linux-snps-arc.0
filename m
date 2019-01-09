From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 9 Jan 2019 13:49:44 -0800
Subject: ARC vs. generic sigaction (was Re: [PATCH 08/21] ARC: Linux
 Syscall Interface)
In-Reply-To: <b2e37aa4-fd4b-a873-8d5b-097fb4c08b8e@linaro.org>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-9-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182324560.30183@digraph.polyomino.org.uk>
 <5f512e48-e7fc-2233-febd-2e6a8bc2311b@synopsys.com>
 <05069752-0a66-d6ca-e249-5c702eec4e99@synopsys.com>
 <17fcd9f0-9843-8700-c936-7ab1eb8f2fd2@linaro.org>
 <906931a6-a281-8994-718f-da203890e7e9@synopsys.com>
 <4c3af320-cf35-f914-8bc3-a4c290b8e12b@linaro.org>
 <ded903aa-f5a0-4422-fa40-bca32ebabbfa@synopsys.com>
 <1e84ae34-0091-aedf-d198-fa5d2a91ad67@linaro.org>
 <6a793c13-5c05-cd46-4d59-e23d762ed353@synopsys.com>
 <b2e37aa4-fd4b-a873-8d5b-097fb4c08b8e@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <793c4b24-d8a8-d142-5fa5-301794df613b@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/21/18 4:05 AM, Adhemerval Zanella wrote:
>> Thing is ARC signal return depends on a restorer. Meaning !SA_RESTORER doesn't
>> effectively exist (between libc and kernel). We currently honor user provided
>> value, instead we could simply overwrite it with default_rt_restorer and on the
>> way out, zero it out to avoid leaking the glibc guts to curious users.
>>
> Yes, this is what I suggest ARC should do.

So I was able to

(1) switch ARC to __sigset_t [2] vs. [128]

(2) create a generic patch to breakout struct sigaction into bits/sigaction-arch.h
(3) update generic __libc_sigaction to avoid itemized copy if sa_mask, sa_flags et
    al offsets matched for struct kernel_signal and struct sigaction
(4) create arc/bits/sigaction-arch.h

However it turned out to be futile as the passthru won't work anyways :-(
@act in sigaction(sig, act, oact) is a const and can't be modified in place for
sticking in sa_restorer for kernel, thus needs to be copied over anyways.

This means we have [1] but have to drop [2-4]. Oh well !
