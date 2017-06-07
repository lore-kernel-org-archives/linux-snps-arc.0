From: noamca@mellanox.com (Noam Camus)
Date: Wed, 7 Jun 2017 11:14:24 +0000
Subject: [PATCH v2 11/11] ARC: [plat-eznps] Handle memory error as an
 exception
References: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
 <1495954328-28736-12-git-send-email-noamca@mellanox.com>
 <ef2527da-03a3-d60e-f5dd-e5b5932d43d0@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <AM5PR0502MB299687067469E99F1A7A509EAAC80@AM5PR0502MB2996.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

> From: Noam Camus 
> Sent: Wednesday, June 7, 2017 9:08 AM
>To: 'Vineet Gupta' <Vineet.Gupta1 at synopsys.com>; linux-snps-arc at lists.infradead.org
>Cc: linux-kernel at vger.kernel.org; Elad Kanfi <eladkan at mellanox.com>
>Subject: RE: [PATCH v2 11/11] ARC: [plat-eznps] Handle memory error as an exception

>>From: Vineet Gupta [mailto:Vineet.Gupta1 at synopsys.com] 
>>Sent: Wednesday, June 7, 2017 1:11 AM
>...
>>> +
>>> +config EZNPS_MEM_ERROR
>>> +       bool "ARC-EZchip Memory error as an exception"
>>> +       depends on ARC_PLAT_EZNPS
>>> +       default n

>>So you set default to "n" - thus by default it works for the simulator not silicon ?
>Correct, this way I "align" Sim environment to react as close as possible to how it work with silicon.

Sorry, but It is not correct.
Default is for silicon where it is naturally emits machine check and unlike simulator do not need OS to redirect the ISR L2 to machine check handler.
Above motivation of "align" is true, but default is silicon and not sim, as I wrote in my original configuration help.
Please re-update this CONFIG help section.

Thanks
-Noam
