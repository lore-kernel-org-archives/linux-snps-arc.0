From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 28 Feb 2019 19:24:43 +0000
Subject: [PATCH] ARCv2: Add explcit unaligned access support (and
 ability to disable too)
References: <20190228174742.GA18868@roeck-us.net>
 <C2D7FE5348E1B147BCA15975FBA2307501464380DE@US01WEMBX2.internal.synopsys.com>
 <20190228185929.GA9842@roeck-us.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501464381EE@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 2/28/19 10:59 AM, Guenter Roeck wrote:
>> Once the patch hits mainline you could use that. In the mean time I'll back out
>> the "detector" as it might trip other people too.
>>
> Can you possibly use $(cc-option,-mno-unaligned-access), or would that
> defeat the purpose ?
>

Indeed I was looking into Kconfig documentation and found something similar.
However there's an anti-dependency. It is enabled by default and can only be
disabled with $(cc-option,-mno-unaligned-access)
So guess we will have to change  ARC_USE_UNALIGNED_MEM_ACCESS to
ARC_*LACKS*_UNALIGNED_MEM_ACCESS

I'll tinker a bit and post an update soon.

-Vineet
