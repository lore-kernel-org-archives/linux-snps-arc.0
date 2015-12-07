From: noamc@ezchip.com (Noam Camus)
Date: Mon, 7 Dec 2015 11:19:28 +0000
Subject: [PATCH v3 04/18] irqchip: add nps Internal and external irqchips
In-Reply-To: <56608AFF.80302@arm.com>
References: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
 <1448974985-11487-5-git-send-email-noamc@ezchip.com>
 <565DA0B6.5080903@arm.com>
 <DB5PR02MB114150510832BA29D46A8A4AD60E0@DB5PR02MB1141.eurprd02.prod.outlook.com>
 <56608AFF.80302@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB114151DD38ACFD58CFFDB2C3D6090@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

From: Marc Zyngier [mailto:marc.zyngier@arm.com] 
Sent: Thursday, December 03, 2015 8:34 PM

>>> Silly question: why cannot you just write the actual instruction 
>>> instead of shoving the instruction like this? Also, .inst would be 
>>> more appropriate...
>> [Noam Camus] Since this is instruction that yet is not part of 
>> up-streamed binutils of ARC.  Now ARC maintainer can build our kernel 
>> with generic ARC toolchain.

>OK. If you decide to carry on using this, I'd still recommend using .inst instead of .word, so that you can get a proper disassembly.
Seem to me that ".inst" is ARM Machine directive.

>Also, can you always tell the per-cpu property of your interrupt based on its number? If you can, then it is fine.
Yes I can, and I am using this knowledge.

>Your alternative is to use irq_domain_add_linear, for example, and to make sure that you always refer to the hw number when manipulating the HW. You will quickly notice that the Linux IRQ number has nothing to do with the HW one, and you'll be able to quickly iron out the bugs.

Indeed when I moved from legacy to linear map I had to call irq_create_mapping() for my percpu IRQs and that's it.
Thanks

-Noam
