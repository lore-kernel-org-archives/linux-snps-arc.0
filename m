From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 27 Sep 2017 11:07:34 -0700
Subject: [PATCH] ARC: reset: remove the misleading v1 suffix all over
In-Reply-To: <1505385897.10100.4.camel@pengutronix.de>
References: <1504202767-17361-1-git-send-email-vgupta@synopsys.com>
 <1505125697.26622.22.camel@pengutronix.de>
 <f741e437-e0bc-f235-53ff-2489eadfe7fe@synopsys.com>
 <1505385897.10100.4.camel@pengutronix.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ef62e890-e35a-e6fd-d8a4-9c2fbeaf8b9e@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Philipp,

On 09/14/2017 03:44 AM, Philipp Zabel wrote:
> On Mon, 2017-09-11@09:33 -0700, Vineet Gupta wrote:
>> On 09/11/2017 03:28 AM, Philipp Zabel wrote:
>>> Hi Vineet,
>>>
>>> [added Eugeniy to Cc]
>>>
>>> On Thu, 2017-08-31@11:06 -0700, Vineet Gupta wrote:
>>>> There is no plan yet to do a v2 board. And even if we were to do
>>>> it
>>>> only some IPs would actually change, so it be best to add suffixes
>>>> at
>>>> that point, not now !
>>>>
>>>> Cc: Philipp Zabel <p.zabel at pengutronix.de>
>>>> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
>>>> ---
>>>> P.S. Philip, if you and Eugeniy are OK, can this be please
>>>> squashed
>>>> with his original patch since it has not yet been merged etc.
>>>
>>> This had been merged into arm-soc already, and by now is merged into
>>> mainline. We could try to queue this as a fix for 4.14.
>>
>> OK - do you want a respin ?
>>
>>>
>>> [...]
>>>> --- a/drivers/reset/Kconfig
>>>> +++ b/drivers/reset/Kconfig
>>>> @@ -34,11 +34,11 @@ config RESET_BERLIN
>>>>  ??	help
>>>>  ??	??This enables the reset controller driver for Marvell
>>>> Berlin
>>>> SoCs.
>>>>    
>>>> -config RESET_HSDK_V1
>>>> -	bool "HSDK v1 Reset Driver"
>>>> +config RESET_SNPS_HSDK
>>>
>>> I suggest to drop the _SNPS part, we don't do it for the other
>>> drivers
>>> either, and so far I'm not afraid of conflicts with other reset
>>> controllers that may be called HSDK.
>>
>> It was not so much about namespace conflict but calling out that this
>> is SNPS part !
>> But I'm fine with what you suggest, since the updated menu string does
>> have it.
> 
> Ok, thanks. No need for a respin, I can fix it up as I apply it.


How/when do you plan to get his merged. Perhaps I can work with a non-mutable 
branch from you to base my changes off of ?

Thx,
-Vineet
