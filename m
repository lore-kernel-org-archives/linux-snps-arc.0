From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Mon, 28 Dec 2015 11:55:44 +0100
Subject: [PATCH v5 04/20] clocksource: Add NPS400 timers driver
In-Reply-To: <56811074.9020102@synopsys.com>
References: <1451222619-3610-5-git-send-email-noamc@ezchip.com>
 <201512272200.4NfpC6DB%fengguang.wu@intel.com>
 <HE1PR02MB13872391DF4E87BD2A7B7EC6D6FA0@HE1PR02MB1387.eurprd02.prod.outlook.com>
 <5680FA14.4010107@linaro.org> <56811074.9020102@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56811530.7070504@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 12/28/2015 11:35 AM, Vineet Gupta wrote:
> On Monday 28 December 2015 02:30 PM, Daniel Lezcano wrote:
>>>> reproduce:
>>>>         # save the attached .config to linux build tree
>>>>        make ARCH=i386
>>>
>>> This is meant for ARC only (not i386), I will add to the Kconfig file a
>>> dependency on my platform.
>>
>> Hi Noam,
>>
>> for compilation test coverage it would be nice to not restrict the to ARC only but
>> change the write_aux_reg to a common name across the different arch if possible.
>>
>>    -- Daniel
>
> Hi Daniel,
>
> AUX registers is a ARC specific mechanism used to access some of the core
> functionality (intc, caches, ....) which other arches likely do via MMIO. I don't
> think a generic abstraction exists. And IMHO it doesn't make sense to invent one
> given this may not map directly to other arches.
>
> This was one of the key reasons arc intc/timers were not added to drivers/* in
> first place.
>
> I do agree with compilation test coverage aspect though.
> Maybe we add a *hack* to include/soc/nps/common.h
>
> #ifndef __ARC__
> #define  write_aux_reg(r, v)
> #define  read_aux_reg(r) 0
> #endif
>
> What say you ?

Yes that's an alternative.

Perhaps instead of the __ARC__:

/*
  * Define dummy macros to let different architectures to
  * compile test some drivers, eg. the timer.
  */
#ifndef write_aux_reg
#define write_aux_reg(r, v)
#endif

#ifndef read_aux_reg
#define read_aux_reg(r) 0
#endif

Now that header must be included always *after* asm/arcregs.h.

Not sure this kind of implicit ordering is not prone to bug.

-- 
  <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
