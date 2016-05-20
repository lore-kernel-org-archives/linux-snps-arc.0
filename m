From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 20 May 2016 09:33:02 +0530
Subject: [GIT PULL] ARC updates for 4.7-rc1
In-Reply-To: <CA+55aFyQ7bzCJ9owuhe9Lmgozhc-_qkjts0majgHqUzY9kQf1Q@mail.gmail.com>
References: <573D5C31.8010100@synopsys.com>
 <CA+55aFyQ7bzCJ9owuhe9Lmgozhc-_qkjts0majgHqUzY9kQf1Q@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <573E8C76.2030801@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 20 May 2016 02:04 AM, Linus Torvalds wrote:
> On Wed, May 18, 2016 at 11:24 PM, Vineet Gupta
> <Vineet.Gupta1@synopsys.com> wrote:
>>
>> The highlight is support for EZChip (now Mellanox) NPS-400 network processor [..]
> 
> Oh, and that brought in the
> 
>     drivers/irqchip/irq-eznps.c
> 
> driver that is compile-test enabled.
> 
> And that driver is not 64-bit clean:
> 
>   In file included from drivers/irqchip/irq-eznps.c:39:0:
>   include/soc/nps/common.h: In function ?nps_host_reg_non_cl?:
>   include/soc/nps/common.h:148:9: warning: cast to pointer from
> integer of different size [-Wint-to-pointer-cast]
>     return (void *)reg_address.value;
>            ^
>   include/soc/nps/common.h: In function ?nps_host_reg?:
>   include/soc/nps/common.h:162:9: warning: cast to pointer from
> integer of different size [-Wint-to-pointer-cast]
>     return (void *)reg_address.value;
>            ^
> 
> so it needs to either be disabled or fixed. Annoying everybody else
> with warnings is not an option.

Sorry about that. We already have a fix from Arnd which was just waiting for
things to settle down per discussion here:

https://lkml.org/lkml/2016/5/13/132

I guess it was wrong call on my part to not include it in this pull request.

Another lesson learnt to not add other subsys stuff via your tree. I should have
merged the new soc header in 4.6 and paved way for NPS changes via other trees.
Live and learn !

Is inline patch below OK or else I can send a pull request:

----------->
>From 69d911ecf3e2a0dd6bf99b2e5c36fbabf09dfa75 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 12 May 2016 23:03:35 +0200
Subject: [PATCH] irqchip: nps: add 64BIT dependency

The newly added nps irqchip driver causes build warnings on ARM64.

include/soc/nps/common.h: In function 'nps_host_reg_non_cl':
include/soc/nps/common.h:148:9: warning: cast to pointer from integer of different
size [-Wint-to-pointer-cast]

As the driver is only used on ARC, we don't need to see it without
COMPILE_TEST elsewhere, and we can avoid the warnings by only
building on 32-bit architectures even with CONFIG_COMPILE_TEST.

Acked-by: Marc Zyngier <narc.zyngier at arm.com>
Signed-off-by: Arnd Bergmann <arnd at arndb.de>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 drivers/irqchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 1ab632a94db3..8e97c2ab560c 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -247,6 +247,7 @@ config MVEBU_ODMI

 config EZNPS_GIC
 	bool "NPS400 Global Interrupt Manager (GIM)"
+	depends on ARC || (COMPILE_TEST && !64BIT)
 	select IRQ_DOMAIN
 	help
 	  Support the EZchip NPS400 global interrupt controller
-- 
2.5.0
