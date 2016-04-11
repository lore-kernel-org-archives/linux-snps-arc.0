From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 11 Apr 2016 14:09:58 +0000
Subject: [PATCH v8 3/3] irqchip: add nps Internal and external irqchips
References: <1459707299-31564-1-git-send-email-noamca@mellanox.com>
 <1459707299-31564-4-git-send-email-noamca@mellanox.com>
 <570B9E46.7050402@arm.com>
 <HE1PR05MB1625D947050070BDA6E92557AA940@HE1PR05MB1625.eurprd05.prod.outlook.com>
 <570BA01F.2060100@arm.com>
 <HE1PR05MB16250C8C5CC09899BB36D84EAA940@HE1PR05MB1625.eurprd05.prod.outlook.com>
 <570BA277.5090202@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E9D47D@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Monday 11 April 2016 06:41 PM, Marc Zyngier wrote:
>> >> It doesn't mean I really approve of it. The default domain thing is
>> >> going to end-up biting you in the rear. But hey, better having this
>> >> supported upstream than leaving these patches up in the air...

Hi Marc,

Aside of this - there's been serious rework of ARC intc / timers code spurred by
some of your comments for this irqchip driver.

- We now probe timers via DT (so timer irq comes off of DT as well)
- We have now switched to linear irq domain (vs. legacy)

IMHO a bunch of ugliness / non-desirability remains (there's likely more)
- calling irq_set_default_host()
- calling irq_create_mapping with NULL for IPIs

I really want to do things in better way - make it more modern ... hence would
request you to please take a look at my latest series (I can post the patches here
if that helps - although it felt I was spamming you and you got pissed off or
something and were not responding of late :-)

git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git   #for-next

Pray tell me, what is not right and I'm all up for fixing it

Thx,
-Vineet
