From: noamc@ezchip.com (Noam Camus)
Date: Sat, 31 Oct 2015 15:15:08 +0200
Subject: [PATCH v1 01/20] Documentation: Add EZchip vendor to binding list
In-Reply-To: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446297327-16298-2-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

Add EZchip to vendor prefixes list.
EZchip introduce the NPS platform for the ARC architecture.

Signed-off-by: Noam Camus <noamc at ezchip.com>
Cc: Rob Herring <robh+dt at kernel.org>
Cc: Pawel Moll <pawel.moll at arm.com>
Cc: Mark Rutland <mark.rutland at arm.com>
Cc: Kumar Gala <galak at codeaurora.org>
---
 Documentation/devicetree/bindings/arc/eznps.txt    |    7 +++++++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 2 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arc/eznps.txt

diff --git a/Documentation/devicetree/bindings/arc/eznps.txt b/Documentation/devicetree/bindings/arc/eznps.txt
new file mode 100644
index 0000000..f8b5e9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arc/eznps.txt
@@ -0,0 +1,7 @@
+EZchip NPS Network Proccessor Platforms Device Tree Bindings
+---------------------------------------------------------------------------
+
+Appliance main board with NPS400 ASIC.
+
+Required root node properties:
+    - compatible = "ezchip,arc-nps";
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 82d2ac9..5a752cc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -80,6 +80,7 @@ eukrea  Eukr??a Electromatique
 everest	Everest Semiconductor Co. Ltd.
 everspin	Everspin Technologies, Inc.
 excito	Excito
+ezchip	EZchip Semiconductor
 fcs	Fairchild Semiconductor
 firefly	Firefly
 fsl	Freescale Semiconductor
-- 
1.7.1
