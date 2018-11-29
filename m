From: khilman@baylibre.com (Kevin Hilman)
Date: Thu, 29 Nov 2018 11:18:01 -0800
Subject: [PATCH] ARC: change defconfig defaults to ARCv2
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA230750146419633@US01WEMBX2.internal.synopsys.com>
References: <20181127222045.18491-1-khilman@baylibre.com>
 <C2D7FE5348E1B147BCA15975FBA230750146419633@US01WEMBX2.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7h36rjae1i.fsf@baylibre.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

Vineet Gupta <vineet.gupta1 at synopsys.com> writes:

> On 11/27/18 2:21 PM, Kevin Hilman wrote:
>> Change the default defconfig (used with 'make defconfig') to the ARCv2
>> nsim_hs_defconfig, and also switch the default Kconfig ISA selection to
>> ARCv2.
>>
>> This allows several default defconfigs (e.g. make defconfig, make
>> allnoconfig, make tinyconfig) to all work with ARCv2 by default.
>>
>> Signed-off-by: Kevin Hilman <khilman at baylibre.com>
>
> Applied to for-curr

If it's not too late, could you tag this for stable?

Even though this is not technicall a regression, Greg said (in a
different thread) he'd be willing to accept this for stable if it fixes
the builders like kernelCI.

Thanks,

Kevin
