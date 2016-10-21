From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 21 Oct 2016 14:20:55 -0700
Subject: [PATCH] ARC: build: don't force usage of llock and swape instructions
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477084855-24017-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This is because some old ARC750 cores lack these instructions.

We now rely on the default for the toolchain driver:
-mcpu=A7 won't enable those, while -mcpu=archs will as these
instructions are baseline (and thus is not impacted with this change).

If some arc700 based cpu does have them, it can override the driver
defaults in it's one level up build system.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 Rules.mak | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Rules.mak b/Rules.mak
index 8d0e66a49b72..cc1545c81f40 100644
--- a/Rules.mak
+++ b/Rules.mak
@@ -507,7 +507,6 @@ ifeq ($(TARGET_ARCH),c6x)
 endif
 
 ifeq ($(TARGET_ARCH),arc)
-	CPU_CFLAGS-y += -mlock -mswape
 	CPU_CFLAGS-$(CONFIG_ARC_CPU_700) += -mA7
 	CPU_CFLAGS-$(CONFIG_ARC_CPU_HS) += -mcpu=archs
 	CPU_LDFLAGS-y += $(CPU_CFLAGS) -marclinux
-- 
2.7.4
