From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 10 Nov 2016 17:44:54 +0100
Subject: [PATCH v2 11/11] Kbuild: enable -Wmaybe-uninitialized warnings by
 default
In-Reply-To: <20161110164454.293477-1-arnd@arndb.de>
References: <20161110164454.293477-1-arnd@arndb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161110164454.293477-12-arnd@arndb.de>
To: linux-snps-arc@lists.infradead.org

Previously the warnings were added back at the W=1 level and above,
this now turns them on again by default, assuming that we have addressed
all warnings and again have a clean build for v4.10.

I found a number of new warnings in linux-next already and submitted
bugfixes for those. Hopefully they are caught by the 0day builder
in the future as soon as this patch is merged.

Signed-off-by: Arnd Bergmann <arnd at arndb.de>
---
Please check if there are any remaining warnings with this
patch before applying.

The one known issue right now is commit 32cb7d27e65d ("iio:
maxim_thermocouple: detect invalid storage size in read()"), which
is currently in linux-next but not yet in mainline.

There are a couple of warnings that I get with randconfig builds,
and I have submitted patches for all of them at some point and
will follow up on them to make sure they get addressed eventually.
---
 scripts/Makefile.extrawarn | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 7fc2c5a..7c321a6 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -60,8 +60,6 @@ endif
 KBUILD_CFLAGS += $(warning)
 else
 
-KBUILD_CFLAGS += $(call cc-disable-warning, maybe-uninitialized)
-
 ifeq ($(cc-name),clang)
 KBUILD_CFLAGS += $(call cc-disable-warning, initializer-overrides)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-value)
-- 
2.9.0
