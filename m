From: marc.zyngier@arm.com (Marc Zyngier)
Date: Mon, 11 Apr 2016 15:43:11 +0100
Subject: [PATCH v8 3/3] irqchip: add nps Internal and external irqchips
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E9D47D@us01wembx1.internal.synopsys.com>
References: <1459707299-31564-1-git-send-email-noamca@mellanox.com>
 <1459707299-31564-4-git-send-email-noamca@mellanox.com>
 <570B9E46.7050402@arm.com>
 <HE1PR05MB1625D947050070BDA6E92557AA940@HE1PR05MB1625.eurprd05.prod.outlook.com>
 <570BA01F.2060100@arm.com>
 <HE1PR05MB16250C8C5CC09899BB36D84EAA940@HE1PR05MB1625.eurprd05.prod.outlook.com>
 <570BA277.5090202@arm.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E9D47D@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <570BB7FF.2070306@arm.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On 11/04/16 15:09, Vineet Gupta wrote:
> On Monday 11 April 2016 06:41 PM, Marc Zyngier wrote:
>>>>> It doesn't mean I really approve of it. The default domain thing is
>>>>> going to end-up biting you in the rear. But hey, better having this
>>>>> supported upstream than leaving these patches up in the air...
> 
> Hi Marc,
> 
> Aside of this - there's been serious rework of ARC intc / timers code spurred by
> some of your comments for this irqchip driver.
> 
> - We now probe timers via DT (so timer irq comes off of DT as well)
> - We have now switched to linear irq domain (vs. legacy)
> 
> IMHO a bunch of ugliness / non-desirability remains (there's likely more)
> - calling irq_set_default_host()
> - calling irq_create_mapping with NULL for IPIs
> 
> I really want to do things in better way - make it more modern ... hence would
> request you to please take a look at my latest series (I can post the patches here
> if that helps - although it felt I was spamming you and you got pissed off or
> something and were not responding of late :-)

No, it is just that my bandwidth has been max'd out over the past few
months. There is only so many patches I can look at while still being
able to write some code myself, and I may have flagged your emails as
"things to look at when I have time", which may not have happened in a
timely manner - sorry about that.

Just keep me on CC when you repost them, and I'll try to be a bit more
reactive.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
