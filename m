From: adhemerval.zanella@linaro.org (Adhemerval Zanella)
Date: Thu, 20 Dec 2018 18:06:44 -0200
Subject: ARC vs. generic sigaction (was Re: [PATCH 08/21] ARC: Linux
 Syscall Interface)
In-Reply-To: <ded903aa-f5a0-4422-fa40-bca32ebabbfa@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-9-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182324560.30183@digraph.polyomino.org.uk>
 <5f512e48-e7fc-2233-febd-2e6a8bc2311b@synopsys.com>
 <05069752-0a66-d6ca-e249-5c702eec4e99@synopsys.com>
 <17fcd9f0-9843-8700-c936-7ab1eb8f2fd2@linaro.org>
 <906931a6-a281-8994-718f-da203890e7e9@synopsys.com>
 <4c3af320-cf35-f914-8bc3-a4c290b8e12b@linaro.org>
 <ded903aa-f5a0-4422-fa40-bca32ebabbfa@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1e84ae34-0091-aedf-d198-fa5d2a91ad67@linaro.org>
To: linux-snps-arc@lists.infradead.org



On 20/12/2018 17:23, Vineet Gupta wrote:
> On 12/20/18 3:19 AM, Adhemerval Zanella wrote:
>>>> #define SET_SA_RESTORER(kact, act)                      \
>>>>   (kact)->sa_flags = (act)->sa_flags | SA_RESTORER;     \
>>>>   (kact)->sa_restorer = &__default_rt_sa_restorer
>>> +#define SET_SA_RESTORER(kact, act)				\
>>> + ({								\
>>> +   if (!((kact)->sa_flags & SA_RESTORER))			\
>>> +     {								\
>>> +       (kact)->sa_restorer = __default_rt_sa_restorer;		\
>>> +       (kact)->sa_flags |= SA_RESTORER;			\
>>> +     }								\
>>> +   else							\
>>> +     (kact)->sa_restorer = (act)->sa_restorer;			\
>>> + })
>> What is so special about ARC sa_restorer that an application should provide
>> an specialized one?
> 
> Its the other way around. Only if application provides it's own restorer, we honor
> it, otherwise default restorer is used. This logic goes back many many years ago
> to how ARC uClibc did this and likely inherited it from the port it was copied
> from. But I don't know if say POSIX allows apps to provide their own restorer or
> not. We could very well remove it; although per other discussion if we intend to
> use the same struct sigaction for kernel/userland, the placeholder would exist and
> we could choose to just ignore it.
> 

The 'should' should be indeed 'might' in my question. And SA_RESTORER is a Linux
specific ABI not intended to be used by applications, so my question is in fact
what kind of specialized sa_restorer applications might provided that would
require the libc to honour it. 

The placeholder existence is not an issue itself (POSIX states the minimum
fields sigaction should provide, not its specific fields neither their
layout).

> 
>> Can't it follow other abi where they issue __NR_sigreturn
>> for !SA_SIGINFO or __NR_rt_sigreturn otherwise?
> 
> With Linux UAPI ABI, __NR_sigreturn doesn't exist, but your concern is about
> restorer ?

Right, so ARC at least is not pulling old compat stuff. Is it safe to just zero
the sa_restorer for sa_flags without SA_RESTORER?

> 
>> As for other architecture I do think we should hide the sa_restorer usage
>> from application.
> 
> As mentioned above, the placeholder could exist, we can choose to ignore it.
