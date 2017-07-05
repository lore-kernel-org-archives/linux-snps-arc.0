From: jh80.chung@samsung.com (Jaehoon Chung)
Date: Wed, 05 Jul 2017 18:13:35 +0900
Subject: [PATCH] arc: remove num-slots from arc platforms
In-Reply-To: <1499245508.4224.13.camel@synopsys.com>
References: <1499238645-29178-1-git-send-email-shawn.lin@rock-chips.com>
 <CGME20170705090517epcas3p4887844d6e0e08a0f6a69697a17032975@epcas3p4.samsung.com>
 <1499245508.4224.13.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <60e74059-85ab-3cb9-1008-57bb1ba496a6@samsung.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,

On 07/05/2017 06:05 PM, Alexey Brodkin wrote:
> Hi Shawn,
> 
> On Wed, 2017-07-05@15:10 +0800, Shawn Lin wrote:
>> dwmmc driver deprecated num-slots and plan to get rid
>> of it finally. Just move a step to cleanup it from DT.
> 
> Hm, that's interesting.
> In our upcoming devboard (HSDK, see
> http://lists.infradead.org/pipermail/linux-snps-arc/2017-July/002667.html)
> we do use 2 slots of DW MobileStorage controller (even though it's not yet
> mentioned in its .dts).

I didn't see about multiple slot for dwmmc controller.

> 
> So the question is if multi-slot support gets removed from dwmmc driver or
> it's just a .dts option gets obsoleted. In latter case I'm wondering how to
> enable a second slot in dwmmc driver (will it just auto-probe it etc)?

In dwmmc controller, already removed the multiple slot concept.

Best Regards,
Jaehoon Chung

> 
> -Alexey
> 
