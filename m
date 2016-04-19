From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 19 Apr 2016 16:19:39 +0300
Subject: [PATCH 3/4 v6] MAINTAINERS: Add maintainer for ARC PGU display
 controller
In-Reply-To: <1461071980-5916-1-git-send-email-abrodkin@synopsys.com>
References: <1461071980-5916-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1461071980-5916-4-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This updates MAINTEINERS file with information about maintainer of
ARC PGU display controller driver.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
---

No changes v5 -> v6.

No changes v4 -> v5.

No changes v3 -> v4.

No changes v2 -> v3.

No changes v1 -> v2.

 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1c32f8a..c5d1e6e 100644
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
2.5.5
