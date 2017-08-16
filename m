From: alex.g@adaptrum.com (Alexandru Gagniuc)
Date: Wed, 16 Aug 2017 15:15:15 -0700
Subject: [PATCH v3 1/2] ARC: [plat-sim] Add .compatible property for Adaptrum
 Anarion SOC
In-Reply-To: <20170816221516.13609-1-alex.g@adaptrum.com>
References: <20170816221516.13609-1-alex.g@adaptrum.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170816221516.13609-2-alex.g@adaptrum.com>
To: linux-snps-arc@lists.infradead.org

Anarion does not require any special configuration during early boot.
This is compatible with nsim, hence-why it is added here.

As development continues, should we need to add any drivers via
Kconfig, we can do that by adding and sourcing a "Kconfig.anarion".
This approach was chosen --as opposed to adding plat-anarion/--
because it doesn't add a bunch of extra files.

Signed-off-by: Alexandru Gagniuc <alex.g at adaptrum.com>
---
 arch/arc/plat-sim/platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/plat-sim/platform.c b/arch/arc/plat-sim/platform.c
index 5cda56b..a5dbfab 100644
--- a/arch/arc/plat-sim/platform.c
+++ b/arch/arc/plat-sim/platform.c
@@ -21,6 +21,7 @@
 
 static const char *simulation_compat[] __initconst = {
 #ifdef CONFIG_ISA_ARCOMPACT
+	"adaptrum,arc-anarion",
 	"snps,nsim",
 	"snps,nsimosci",
 #else
-- 
2.9.3
