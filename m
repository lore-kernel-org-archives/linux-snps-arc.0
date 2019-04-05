From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Sat,  6 Apr 2019 01:47:15 +0300
Subject: [PATCH] busybox: Enable domain search list support
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190405224715.1321-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This option is enabled by default in Busybox and becomes
useful in networks with internal resources becasue allows
to use much shorter names.

E.g. instead of "server.internal.company.com" it's possible
to use just "server" if DHCP server is configured with:
---------------------------->8-----------------------
option domain-search "internal.company.com";
---------------------------->8-----------------------

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 493db28e86..0b27fcd4b3 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -989,7 +989,6 @@ CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
 # CONFIG_FEATURE_UDHCP_PORT is not set
 CONFIG_UDHCP_DEBUG=0
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
-# CONFIG_FEATURE_UDHCP_RFC3397 is not set
 # CONFIG_FEATURE_UDHCP_8021Q is not set
 CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -b"
 
-- 
2.16.2
