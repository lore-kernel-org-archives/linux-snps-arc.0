From: marex@denx.de (Marek Vasut)
Date: Wed, 19 Apr 2017 12:17:52 +0200
Subject: [PATCH] ehci-ppc4xx: Prepare for usage of readl()/writel()
 accessors
In-Reply-To: <53952174-5c87-4844-44f0-ed323bc374e3@denx.de>
References: <1492445597-32034-1-git-send-email-abrodkin@synopsys.com>
 <53952174-5c87-4844-44f0-ed323bc374e3@denx.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <aadbf39f-1291-8c42-70dc-e0ec8be9ec7e@denx.de>
To: linux-snps-arc@lists.infradead.org

On 04/19/2017 12:05 PM, Stefan Roese wrote:
> On 17.04.2017 18:13, Alexey Brodkin wrote:
>> We used to have opencoded ehci_readl()/writel() which required no
>> external functions to be called.
>>
>> Now with attempt to switch to generic readl()/writel() accessors
>> we see a missing declaration of those accessors in ehci-ppc4xx.
>> Something like that happens if applied
>> http://patchwork.ozlabs.org/patch/726714/:
>> ---------------->8---------------
>>   CC      drivers/usb/host/ehci-ppc4xx.o
>> drivers/usb/host/ehci-ppc4xx.c: In function 'ehci_hcd_init':
>> drivers/usb/host/ehci-ppc4xx.c:23:3: warning: implicit declaration of
>> function 'readl' [-Wimplicit-function-declaration]
>>    HC_LENGTH(ehci_readl(&(*hccr)->cr_capbase)));
>>    ^
>> ---------------->8---------------
>>
>> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
>> Cc: Tom Rini <trini at konsulko.com>
>> Cc: Marek Vasut <marex at denx.de>
>> Cc: Stefan Roese <sr at denx.de>
>> ---
>>  drivers/usb/host/ehci-ppc4xx.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/host/ehci-ppc4xx.c
>> b/drivers/usb/host/ehci-ppc4xx.c
>> index 9aee3ff786cb..9d235776428e 100644
>> --- a/drivers/usb/host/ehci-ppc4xx.c
>> +++ b/drivers/usb/host/ehci-ppc4xx.c
>> @@ -8,6 +8,7 @@
>>   */
>>  #include <common.h>
>>  #include <usb.h>
>> +#include <asm/io.h>
>>
>>  #include "ehci.h"
>>
>>
> 
> Alexey, thanks for looking into this:
> 
> Reviewed-by: Stefan Roese <sr at denx.de>

Applied, thanks.

-- 
Best regards,
Marek Vasut
