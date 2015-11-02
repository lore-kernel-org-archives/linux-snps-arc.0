From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 2 Nov 2015 16:26:32 +0530
Subject: [PATCH v1 11/20] ARC: [plat-eznps] Add eznps platform
In-Reply-To: <1446297327-16298-12-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-12-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56374160.5070002@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Saturday 31 October 2015 06:45 PM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
> 
> This platform include boards:
> 	Hardware Emulator (HE)
> 	Simulator based upon nSIM.
> 
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> ---
>  MAINTAINERS                             |    6 +
>  arch/arc/plat-eznps/Kconfig             |   34 ++++
>  arch/arc/plat-eznps/Makefile            |    7 +
>  arch/arc/plat-eznps/entry.S             |   76 +++++++++


When trying to build with 2015.06 BE tools,

../arch/arc/plat-eznps/entry.S: Assembler messages:
../arch/arc/plat-eznps/entry.S:51: Error: bad instruction `sr
(1<<28),[(0xFFFFF800+0x024)]'
make[3]: *** [arch/arc/plat-eznps/entry.o] Error 1
make[2]: *** [arch/arc/plat-eznps] Error 2
