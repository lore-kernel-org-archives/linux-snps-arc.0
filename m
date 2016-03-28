From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 28 Mar 2016 14:36:37 +0300
Subject: [PATCH 3/5 v5] MAINTAINERS: Add maintainer for ARC PGU display
 controller
In-Reply-To: <1459164999-11850-1-git-send-email-abrodkin@synopsys.com>
References: <1459164999-11850-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1459164999-11850-4-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This updates MAINTEINERS file with information about maintainer of
ARC PGU display controller driver.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
---

No changes v4 -> v5.

No changes v3 -> v4.

No changes v2 -> v3.

No changes v1 -> v2.

 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea1d1de..0dcba67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -827,6 +827,12 @@ S:	Maintained
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
