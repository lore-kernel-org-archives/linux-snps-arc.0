From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 19 Feb 2016 16:03:54 +0300
Subject: [PATCH 4/4] MAINTAINERS: Add maintainer for ARC PGU display controller
In-Reply-To: <1455887034-7739-1-git-send-email-abrodkin@synopsys.com>
References: <1455887034-7739-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1455887034-7739-5-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This updates MAINTEINERS file with information about maintainer of
ARC PGU display controller driver.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 28cd72b..26ac58c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -847,6 +847,12 @@ S:	Maintained
 F:	drivers/net/arcnet/
 F:	include/uapi/linux/if_arcnet.h
 
+ARC PGU DRM DRIVER
+M:	Alexey Brodkin <abrodkin at synopsys.com>
+S:	Supported
+F:	drivers/gpu/drm/arc/
+F:	Documentation/devicetree/bindings/display/snps,arcpgu.txt
+
 ARM HDLCD DRM DRIVER
 M:	Liviu Dudau <liviu.dudau at arm.com>
 S:	Supported
-- 
2.5.0
