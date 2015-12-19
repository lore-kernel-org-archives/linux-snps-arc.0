From: noamc@ezchip.com (Noam Camus)
Date: Sat, 19 Dec 2015 09:30:26 +0000
Subject: [PATCH v4 05/19] irqchip: add nps Internal and external irqchips
In-Reply-To: <567434DF.2030201@arm.com>
References: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
 <1450228238-4499-6-git-send-email-noamc@ezchip.com>
 <56712F50.6050404@arm.com>
 <DB5PR02MB1141324364E0253DAA030DF1D6E10@DB5PR02MB1141.eurprd02.prod.outlook.com>
 <5673EC2D.5040307@arm.com>
 <DB5PR02MB1141A1E0BE574A713957650BD6E10@DB5PR02MB1141.eurprd02.prod.outlook.com>
 <567434DF.2030201@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB11415D584CC523B99476DEB1D6E20@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Marc Zyngier [mailto:marc.zyngier at arm.com] 
>Sent: Friday, December 18, 2015 6:31 PM

>> Note that I am working with ARC (seem alike) here and we do not define 
>> CONFIG_HANDLE_DOMAIN_IRQ and do not implement set_handle_irq().
>> 
>> So for ARC this reverse mapping is something we can leave without 
>> (maybe because we are kind of a legacy domain).

>Yeah, I just located the crap: arch_do_IRQ() happily takes a hwirq (the vector number), and uses that as a Linux IRQ. This looks a lot like ARM pre-DT, about 10 years ago.

>Well, time to meet the 21st century. If you intend to use DT, please fix your arch port. Otherwise, just hardcode everything in your platform and don't pretend to support device tree.

Thank you very much. 
I have the complete picture now.

Will discuss with ARC maintainer and see what best way to do this change. 

-Noam
