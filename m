From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 28 Dec 2015 16:05:32 +0530
Subject: [PATCH v5 04/20] clocksource: Add NPS400 timers driver
In-Reply-To: <5680FA14.4010107@linaro.org>
References: <1451222619-3610-5-git-send-email-noamc@ezchip.com>
 <201512272200.4NfpC6DB%fengguang.wu@intel.com>
 <HE1PR02MB13872391DF4E87BD2A7B7EC6D6FA0@HE1PR02MB1387.eurprd02.prod.outlook.com>
 <5680FA14.4010107@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56811074.9020102@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Monday 28 December 2015 02:30 PM, Daniel Lezcano wrote:
>>> reproduce:
>>>        # save the attached .config to linux build tree
>>>       make ARCH=i386
>>
>> This is meant for ARC only (not i386), I will add to the Kconfig file a
>> dependency on my platform.
> 
> Hi Noam,
> 
> for compilation test coverage it would be nice to not restrict the to ARC only but
> change the write_aux_reg to a common name across the different arch if possible.
> 
>   -- Daniel

Hi Daniel,

AUX registers is a ARC specific mechanism used to access some of the core
functionality (intc, caches, ....) which other arches likely do via MMIO. I don't
think a generic abstraction exists. And IMHO it doesn't make sense to invent one
given this may not map directly to other arches.

This was one of the key reasons arc intc/timers were not added to drivers/* in
first place.

I do agree with compilation test coverage aspect though.
Maybe we add a *hack* to include/soc/nps/common.h

#ifndef __ARC__
#define  write_aux_reg(r, v)
#define  read_aux_reg(r) 0
#endif

What say you ?

-Vineet
