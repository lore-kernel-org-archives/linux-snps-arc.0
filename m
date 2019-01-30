From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 30 Jan 2019 16:47:52 +0000
Subject: [PATCH 2/5] ARCv2: introduce unaligned access under a Kconfig
 option
References: <20190129104942.31705-1-Eugeniy.Paltsev@synopsys.com>
 <20190129104942.31705-3-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075014642D58D@US01WEMBX2.internal.synopsys.com>
 <1548866682.29008.31.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014642D8B6@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 1/30/19 8:44 AM, Eugeniy Paltsev wrote:
>> I'd prefer to change the define of STATUS_AD_MASK itself and keep all of this
>> unchanged !
>>
> Actually I'd prefer to leave STATUS_AD_MASK untouched. Otherwise we will implicitly assign
> wrong value to STATUS_AD_MASK which is quite misleading.
>
> BTW, STATUS_AD_MASK is used in ASM code in v2 patch and it shouldn't be dependent on
> CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS.

Agree !

-Vineet
