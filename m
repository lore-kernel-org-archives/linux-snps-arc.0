From: noamc@ezchip.com (Noam Camus)
Date: Wed, 4 Nov 2015 12:38:36 +0000
Subject: [PATCH v1 11/20] ARC: [plat-eznps] Add eznps platform
In-Reply-To: <56374160.5070002@synopsys.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-12-git-send-email-noamc@ezchip.com>
 <56374160.5070002@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB1141A703C5EA9BA593018AE8D62A0@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Vineet Gupta [mailto:Vineet.Gupta1 at synopsys.com] 
>Sent: Monday, November 02, 2015 12:57 PM


>When trying to build with 2015.06 BE tools,

>../arch/arc/plat-eznps/entry.S: Assembler messages:
>../arch/arc/plat-eznps/entry.S:51: Error: bad instruction `sr (1<<28),[(0xFFFFF800+0x024)]'
>make[3]: *** [arch/arc/plat-eznps/entry.o] Error 1
>make[2]: *** [arch/arc/plat-eznps] Error 2


I managed to reproduced this one.
The AUX address is S12 and assembler failed when I provided the address this way.
When I used (-0x800+0x024) it passed build.

Thanks
-Noam
