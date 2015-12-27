From: noamc@ezchip.com (Noam Camus)
Date: Sun, 27 Dec 2015 15:23:31 +0200
Subject: [PATCH v5 12/20] ARC: [plat-eznps] Add eznps board defconfig and dts
In-Reply-To: <1451222619-3610-1-git-send-email-noamc@ezchip.com>
References: <1451222619-3610-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1451222619-3610-13-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

Adding default configuration file and DTS file

Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 arch/arc/boot/dts/eznps.dts    |   94 ++++++++++++++++++++++++++++++++++++++++
 arch/arc/configs/nps_defconfig |   85 ++++++++++++++++++++++++++++++++++++
 2 files changed, 179 insertions(+), 0 deletions(-)
 create mode 100644 arch/arc/boot/dts/eznps.dts
 create mode 100644 arch/arc/configs/nps_defconfig

diff --git a/arch/arc/boot/dts/eznps.dts b/arch/arc/boot/dts/eznps.dts
new file mode 100644
index 0000000..2434948
--- /dev/null
+++ b/arch/arc/boot/dts/eznps.dts
@@ -0,0 +1,94 @@
+/*
+ * Copyright(c) 2015 EZchip Technologies.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * The full GNU General Public License is included in this distribution in
+ * the file called "COPYING".
+ */
+
+/dts-v1/;
+
+/include/ "skeleton.dtsi"
+
+/ {
+	compatible = "ezchip,arc-nps";
+	clock-frequency = <83333333>;	/* 83.333333 MHZ */
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&intc>;
+	present-cpus = "0-1,16-17";
+	possible-cpus = "0-4095";
+
+	aliases {
+		ethernet0 = &gmac0;
+		pll = &sysclk;
+	};
+
+	chosen {
+		bootargs = "earlycon=uart8250,mmio32be,0xf7209000,115200n8 console=ttyS0,115200n8";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;	/* 512M */
+	};
+
+	clocks {
+		sysclk: sysclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <83333333>;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		/* child and parent address space 1:1 mapped */
+		ranges;
+
+		intc: interrupt-controller {
+			compatible = "ezchip,nps400-ic";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		timer {
+			compatible = "ezchip,nps400-timer";
+			clocks = <&sysclk>;
+			clock-names="sysclk";
+			interrupts = <3>;
+		};
+
+		uart at f7209000 {
+			compatible = "snps,dw-apb-uart";
+			device_type = "serial";
+			reg = <0xf7209000 0x100>;
+			interrupts = <6>;
+			clocks = <&sysclk>;
+			clock-names="baudclk";
+			baud = <115200>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			native-endian;
+		};
+
+		gmac0: ethernet at f7470000 {
+			compatible = "ezchip,nps-mgt-enet";
+			reg = <0xf7470000 0x1940>;
+			interrupts = <7>;
+			/* Filled in by U-Boot */
+			mac-address = [ 00 C0 00 F0 04 03 ];
+		};
+	};
+};
diff --git a/arch/arc/configs/nps_defconfig b/arch/arc/configs/nps_defconfig
new file mode 100644
index 0000000..13a67ac
--- /dev/null
+++ b/arch/arc/configs/nps_defconfig
@@ -0,0 +1,85 @@
+CONFIG_CROSS_COMPILE="arceb-linux-"
+# CONFIG_LOCALVERSION_AUTO is not set
+# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_SYSCTL_SYSCALL=y
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_TIMERFD is not set
+# CONFIG_EVENTFD is not set
+# CONFIG_AIO is not set
+CONFIG_EMBEDDED=y
+CONFIG_PERF_EVENTS=y
+# CONFIG_COMPAT_BRK is not set
+CONFIG_KPROBES=y
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARC_PLAT_EZNPS=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=4096
+CONFIG_ARC_CACHE_LINE_SHIFT=5
+# CONFIG_ARC_CACHE_PAGES is not set
+# CONFIG_ARC_HAS_LLSC is not set
+CONFIG_ARC_VMALLOC_SIZE=192
+CONFIG_ARC_EMUL_UNALIGNED=y
+CONFIG_ARC_UBOOT_SUPPORT=y
+CONFIG_PREEMPT=y
+CONFIG_NET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=1
+CONFIG_BLK_DEV_RAM_SIZE=2048
+CONFIG_NETDEVICES=y
+CONFIG_NETCONSOLE=y
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_WLAN is not set
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=1
+CONFIG_SERIAL_8250_RUNTIME_UARTS=1
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_OF_PLATFORM=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_DNOTIFY is not set
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
+CONFIG_DEBUG_INFO=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_MEMORY_INIT=y
+CONFIG_ENABLE_DEFAULT_TRACERS=y
-- 
1.7.1
