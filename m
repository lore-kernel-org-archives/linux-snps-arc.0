From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue,  2 Jul 2019 19:40:33 +0300
Subject: [PATCH] ARC: [haps] Add Virtio support
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190702164033.43933-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As a preparation for QEMU usage for ARC let's add basic Virtio-MMIO
peripherals support for the platform we're going to use.

For now we add 5 Virtio slots in .dts and enable block and network devices
via Virtio-MMIO.

Note even though typically Virtio register set fits in 0x200 bytes
we "allocate" here 0x2000 so that it matches ARC's default 8KiB page size
and so remapping of that area is done clearly.

We also enable DEVTMPFS automount for more convenient use
of external root file-stystem. Before that we used to use built-in
Initramfs which didn't automount DEVTMPFS anyways so we didn't need
that option, while now it starts making sense.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Rob Herring <robh+dt at kernel.org>
---
 arch/arc/boot/dts/haps_hs.dts      | 30 ++++++++++++++++++++++++++++++
 arch/arc/configs/haps_hs_defconfig |  5 ++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arc/boot/dts/haps_hs.dts b/arch/arc/boot/dts/haps_hs.dts
index 1ebfa046492b..44bc522fdec8 100644
--- a/arch/arc/boot/dts/haps_hs.dts
+++ b/arch/arc/boot/dts/haps_hs.dts
@@ -62,5 +62,35 @@
 			#interrupt-cells = <1>;
 			interrupts = <20>;
 		};
+
+		virtio0: virtio at f0100000 {
+			compatible = "virtio,mmio";
+			reg = <0xf0100000 0x2000>;
+			interrupts = <31>;
+		};
+
+		virtio1: virtio at f0102000 {
+			compatible = "virtio,mmio";
+			reg = <0xf0102000 0x2000>;
+			interrupts = <32>;
+		};
+
+		virtio2: virtio at f0104000 {
+			compatible = "virtio,mmio";
+			reg = <0xf0104000 0x2000>;
+			interrupts = <33>;
+		};
+
+		virtio3: virtio at f0106000 {
+			compatible = "virtio,mmio";
+			reg = <0xf0106000 0x2000>;
+			interrupts = <34>;
+		};
+
+		virtio4: virtio at f0108000 {
+			compatible = "virtio,mmio";
+			reg = <0xf0108000 0x2000>;
+			interrupts = <35>;
+		};
 	};
 };
diff --git a/arch/arc/configs/haps_hs_defconfig b/arch/arc/configs/haps_hs_defconfig
index b117e6c16d41..436f2135bdc1 100644
--- a/arch/arc/configs/haps_hs_defconfig
+++ b/arch/arc/configs/haps_hs_defconfig
@@ -35,10 +35,12 @@ CONFIG_INET=y
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
 CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
-# CONFIG_BLK_DEV is not set
+CONFIG_VIRTIO_BLK=y
 CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
 # CONFIG_NET_VENDOR_ARC is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
 # CONFIG_NET_VENDOR_INTEL is not set
@@ -68,6 +70,7 @@ CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
+CONFIG_VIRTIO_MMIO=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
-- 
2.16.2
