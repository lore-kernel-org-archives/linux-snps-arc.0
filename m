From: marex@denx.de (Marek Vasut)
Date: Thu, 15 Nov 2018 06:03:20 +0100
Subject: [PATCH] u-boot: Add mkenvimage tool
In-Reply-To: <CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
References: <20181115040043.9326-1-abrodkin@synopsys.com>
 <CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2c011907-e4f6-2b16-e0b8-714db476130e@denx.de>
To: linux-snps-arc@lists.infradead.org

On 11/15/2018 05:57 AM, Khem Raj wrote:
> On Wed, Nov 14, 2018 at 8:00 PM Alexey Brodkin
> <alexey.brodkin@synopsys.com> wrote:
>>
>> This utility is used for creation of images containing
>> usable in run-time U-Boot environment.
>>
>> As of today this utility is added per-board like here [1]
>> for Intel Edison board, here [2] for Altera's SoCFPGA and
>> I may guess there're others so instead of adding another one for
>> ARC why don't we package it for each and everyone.
>>
>> [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
>> [2] https://github.com/kraj/meta-altera/blob/master/recipes-bsp/u-boot/u-boot-mkenvimage_v2016.11.bb
> 
> If this is applicable/works for all u-boot based machines then I think it makes
> sense to have it on OE-core.

It is.

>> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
>> Cc: Alexander Kanavin <alexander.kanavin at linux.intel.com>
>> Cc: Richard Purdie <richard.purdie at linuxfoundation.org>
>> Cc: Otavio Salvador <otavio at ossystems.com.br>
>> Cc: Ross Burton <ross.burton at intel.com>
>> Cc: Marek Vasut <marex at denx.de>

Reviewed-by: Marek Vasut <marex at denx.de>

That said, could the recipe for mkimage and mkenvimage be somehow
deduplicated ? There seems to be a lot of common stuff.

>> ---
>>  .../u-boot/u-boot-mkenvimage_2018.07.bb            | 27 ++++++++++++++++++++++

btw why was U-Boot not updated using AUH to 2018.09/2018.11 ?

-- 
Best regards,
Marek Vasut
