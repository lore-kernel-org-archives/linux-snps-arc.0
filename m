From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 12 Feb 2019 17:34:13 +0000
Subject: [PATCH 1/2] ARC: U-boot: check arguments paranoidly
References: <20190212153932.28371-1-Eugeniy.Paltsev@synopsys.com>
 <20190212153932.28371-2-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075014643364E@US01WEMBX2.internal.synopsys.com>
 <1549992326.27724.98.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014643369A@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 2/12/19 9:25 AM, Eugeniy Paltsev wrote:
>> This is technically changing the ABI - I think we don't need to enforce this -
>> keep ignoring this
> I think it's better to add this check:
>  * This check doesn't break backward compatibility. ARC U-boot pass zero to r1
>    from the beginnings, I specially checked this. So we doesn't change ABI,
>    we only document it ;) 

OK good.

>  * By adding this check we can cheap and easily minimize problems in JTAG case.

Prior to your patch this register was irrelevant - it didn't matter for jtag or
uboot cause what its value was since it was not being checked at all. Now you
enforce this be 0. Simple reasoning tells me it will likely cause problems, if
any, but won't reduce them at all. So I'd insist we keep ignoring it even if uboot
was zeroing it out. Atleast this leaves the door open any future changes.
