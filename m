From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 11 Sep 2017 09:33:14 -0700
Subject: [PATCH] ARC: reset: remove the misleading v1 suffix all over
In-Reply-To: <1505125697.26622.22.camel@pengutronix.de>
References: <1504202767-17361-1-git-send-email-vgupta@synopsys.com>
 <1505125697.26622.22.camel@pengutronix.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f741e437-e0bc-f235-53ff-2489eadfe7fe@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/11/2017 03:28 AM, Philipp Zabel wrote:
> Hi Vineet,
>
> [added Eugeniy to Cc]
>
> On Thu, 2017-08-31@11:06 -0700, Vineet Gupta wrote:
>> There is no plan yet to do a v2 board. And even if we were to do it
>> only some IPs would actually change, so it be best to add suffixes at
>> that point, not now !
>>
>> Cc: Philipp Zabel <p.zabel at pengutronix.de>
>> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
>> ---
>> P.S. Philip, if you and Eugeniy are OK, can this be please squashed
>> with his original patch since it has not yet been merged etc.
> This had been merged into arm-soc already, and by now is merged into
> mainline. We could try to queue this as a fix for 4.14.

OK - do you want a respin ?

>
> [...]
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -34,11 +34,11 @@ config RESET_BERLIN
>>   	help
>>   	  This enables the reset controller driver for Marvell Berlin
>> SoCs.
>>   
>> -config RESET_HSDK_V1
>> -	bool "HSDK v1 Reset Driver"
>> +config RESET_SNPS_HSDK
> I suggest to drop the _SNPS part, we don't do it for the other drivers
> either, and so far I'm not afraid of conflicts with other reset
> controllers that may be called HSDK.

It was not so much about namespace conflict but calling out that this is SNPS part !
But I'm fine with what you suggest, since the updated menu string does have it.

Thx,
-Vineet
