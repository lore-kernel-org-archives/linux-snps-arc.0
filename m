From: noamc@ezchip.com (Noam Camus)
Date: Tue, 3 Nov 2015 15:59:59 +0000
Subject: [PATCH v1 11/20] ARC: [plat-eznps] Add eznps platform
In-Reply-To: <56374160.5070002@synopsys.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-12-git-send-email-noamc@ezchip.com>
 <56374160.5070002@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB11419F2B0F641AB8C8A94ABAD62B0@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Vineet Gupta [mailto:Vineet.Gupta1 at synopsys.com] 
>Sent: Monday, November 02, 2015 12:57 PM


>When trying to build with 2015.06 BE tools,

>../arch/arc/plat-eznps/entry.S: Assembler messages:
>../arch/arc/plat-eznps/entry.S:51: Error: bad instruction `sr (1<<28),[(0xFFFFF800+0x024)]'
>make[3]: *** [arch/arc/plat-eznps/entry.o] Error 1
>make[2]: *** [arch/arc/plat-eznps] Error 2

Need more info since I tried it locally with no success.
Can you try this single line on separate assembly test file.
I will then try such synthetic case here.
Please supply command line as well for GCC/AS. 

-Noam
