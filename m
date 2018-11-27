From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 27 Nov 2018 22:12:55 +0300
Subject: [PATCH] u-boot-tools: Improve build preparation
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181127191255.39052-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Even though we're not going to build here real U-Boot binary
it is still required to "configure" U-Boot to get get to the
tools building.

We used to use "sandbox_defconfig" for that purpose but
since U-Boot v2018.11 it started to cause problems [1] due to [2].

So to have less dependencies let's create super minimalistic
configuration which is good enough to allow us to run "make tools".

[1] http://errors.yoctoproject.org/Errors/Details/202185/
[2] http://git.denx.de/?p=u-boot.git;a=commitdiff;h=a4958a71017fb142542f977c843c5fce769fc6ea

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Richard Purdie <richard.purdie at linuxfoundation.org>
Cc: Otavio Salvador <otavio at ossystems.com.br>
Cc: Martin Jansa <martin.jansa at gmail.com>
Cc: Andrea Galbusera <gizero at gmail.com>
Cc: Ross Burton <ross.burton at intel.com>
Cc: Tom Rini <trini at konsulko.com>
Cc: Marek Vasut <marex at denx.de>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
index 127c4c15d1..d1cfea05f5 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
@@ -18,14 +18,11 @@ EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" H
 EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 
 do_compile () {
-	oe_runmake sandbox_defconfig
-
-	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
-	# generating it requires bin2header tool, which for target build
-	# is built with target tools and thus cannot be executed on host.
-	sed -i "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" .config
-
-	oe_runmake cross_tools NO_SDL=1
+	# Create the simplest configuration which is just enough
+	# to get to the building of tools.
+	echo "CONFIG_SYS_TEXT_BASE=0" > .config
+	oe_runmake olddefconfig
+	oe_runmake cross_tools
 }
 
 do_install () {
-- 
2.16.2
