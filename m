Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEB6C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sun, 23 Jan 2022 12:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18xJRBTeXrZKr0A/a3OWsNUqHXWg4/qBjZFNZ85SiWA=; b=D5QYwp4KRtjpp7
	oP3oLCRZcVz1fc4OEZSwDkS3ya5YyWSNh22escjC4DT0Iz9j5kim+ks8jEJVk/GE2yTPVHfO2rova
	ppL9taDm0GCxlpyhwQ6hycJ7OC+MDDH4dZl4Ea7bQx39bZ+SBpsks5NzuRPK2uvOd9bzZ1sc7OQ2O
	PjVy+Dgl+8XSmTD72yoWSJgyFzLgPBgbVLTyJzI+IJ4CePsFIJX4eJ0bt5KHRa8puX0l/3Eph7e/m
	c0E61leA7EvxHgQma/VOabKJ9muti/fKhAjV/gu1v19tUDBthCSuWbqgTPNPBLAOUnWbcZWyun4gj
	UZjSvsJTPPa+bFOWLhLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBcNC-000oGH-TY; Sun, 23 Jan 2022 12:53:34 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBcMw-000oD7-P3; Sun, 23 Jan 2022 12:53:21 +0000
Received: from desktop ([188.192.136.49]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mm9NA-1mTn9l3vO4-00iEJV; Sun, 23 Jan 2022 13:53:14 +0100
From: "Adrian Schmutzler" <mail@adrianschmutzler.de>
To: "'Hauke Mehrtens'" <hauke@hauke-m.de>,
	<openwrt-devel@lists.openwrt.org>
Cc: <Alexey.Brodkin@synopsys.com>,
	<linux-snps-arc@lists.infradead.org>
References: <20220122192426.13455-1-hauke@hauke-m.de>
In-Reply-To: <20220122192426.13455-1-hauke@hauke-m.de>
Subject: RE: [PATCH] arc770: Remove arc770 target
Date: Sun, 23 Jan 2022 13:53:13 +0100
Message-ID: <003201d81058$2f0801d0$8d180570$@adrianschmutzler.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Content-Language: de
Thread-Index: AQKnSGB0rUdpv73YjkTlOd/w+P7ceqrSH4JA
X-Provags-ID: V03:K1:8oSfQX9AXJtUybOuZ9fjvcB40YqAF4YyHJ8xWQ8NODv6rY0epsP
 H87hysvia7yRfIHfN/CmDb3SQuBosHcSqnzXg5hpmunSIvuAXncc/YYwAxSvPg4ELLc9aPu
 K/C54m+FMHsIHNnd3UFKIUTHp7dnOfu30NHXq5jGXq5jVAf0XFjHihuL3F4NDLkZ5Fo00ez
 2u2Of8YBFzi1Ka/SM7PbA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9El29WfxZ6A=:RF81LKitLg+91Wr8EqosN6
 c/u31ImCFlUtv9HWdcrrfT4BAkbclh20o9jfbxjumtGmz7yHwFp6pGlukGkuccb3OtTfu5gYn
 i4ltiDUlBx7lQyF9LFKG+OxyjtMmQ/LeYfV+0Cwgi8kNL2kQ61yWTkSzJRNjK8d46E6n7khyo
 yth0uqw9QR2jvxlntz+D6Ha6Z7doSuKd9qh+wSokifC8FDG9MW2iZhTwywTUPKvMYYt/xWq5J
 Pnc5NA/RfufPSrI73P5hyZasR/JvK5ZGa/ZYe+zVjk520ksINfAqYy+qnz6p0Uczqrs6Bmxzl
 UqGEBDZU1R8Y+HZC2JLW9WDlZ5dAT/LdHYAW+2DSr2upk92A8FyfqimaZNVvmEUqbafF5q8cD
 e2FHYhEerRY0pvmtpTWWxqmpMAYrWu/Y5X9ONIpr775Xuc3w+9NEYO8+K/u83L9kl89nCUigC
 WF1TrscGMTMOgyMkbvrIxVrCha11qnemHOsC2d05PYczrVzQONds0zq3U+fG7N0t3mBKVtzrd
 BOcWEWKn+Wbq9kAoX7cDrJrxh/ouguHevhATQZ5Yg8xctC3gjVkFPPJD2eRjKGIjDoBi8fet/
 8SHEwLBymLC/EQKsE5OC5Nlh2jIbfiDWuXQHb8hw4nEXQCJ3gMxIg7DElncAc7llXdRs0VT2r
 j3wOnRw6bvMr8K5YwNd5NaYCQtLU6wa2wOVFLHhSGSeMcEN0v4pv9FidWZnBFL3LLLvrV7zvu
 iBnf1IXHGJ4ruWDe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_045319_207487_8C3BE6F5 
X-CRM114-Status: GOOD (  26.65  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

> -----Original Message-----
> From: openwrt-devel [mailto:openwrt-devel-bounces@lists.openwrt.org]
> On Behalf Of Hauke Mehrtens
> Sent: Samstag, 22. Januar 2022 20:24
> To: openwrt-devel@lists.openwrt.org
> Cc: Alexey.Brodkin@synopsys.com; linux-snps-arc@lists.infradead.org;
> Hauke Mehrtens <hauke@hauke-m.de>
> Subject: [PATCH] arc770: Remove arc770 target
> 
> The arc700 target is not booting up since some time, see here:
> https://github.com/foss-for-synopsys-dwc-arc-
> processors/toolchain/issues/400
> 
> It looks like there is a problem in the toolchain when using glibc.
> 
> Currently no one is working on fixing this problem, remove the target
> instead. This target also does not have many users we are aware of.
> 
> If someone wants to have this target back, feel free to add a fixed
version of
> this target again.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Acked-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>

> ---
>  package/devel/perf/Makefile                   |   2 +-
>  target/linux/arc770/Makefile                  |  22 --
>  .../arc770/base-files/etc/board.d/02_network  |  17 --
>  target/linux/arc770/config-5.4                | 195 ------------------
>  .../arc770/generic/profiles/00-default.mk     |  13 --
>  target/linux/arc770/generic/target.mk         |   8 -
>  target/linux/arc770/image/Config.in           |   5 -
>  target/linux/arc770/image/Makefile            |  84 --------
>  .../arc770/image/gen_axs10x_sdcard_img.sh     |  29 ---
>  target/linux/arc770/image/uEnv.txt            |   7 -
>  ...c-Disable-frame-filtering-completely.patch |  31 ---
>  11 files changed, 1 insertion(+), 412 deletions(-)  delete mode 100644
> target/linux/arc770/Makefile  delete mode 100644 target/linux/arc770/base-
> files/etc/board.d/02_network
>  delete mode 100644 target/linux/arc770/config-5.4  delete mode 100644
> target/linux/arc770/generic/profiles/00-default.mk
>  delete mode 100644 target/linux/arc770/generic/target.mk
>  delete mode 100644 target/linux/arc770/image/Config.in
>  delete mode 100644 target/linux/arc770/image/Makefile
>  delete mode 100755 target/linux/arc770/image/gen_axs10x_sdcard_img.sh
>  delete mode 100644 target/linux/arc770/image/uEnv.txt
>  delete mode 100644 target/linux/arc770/patches-5.4/700-stmmac-Disable-
> frame-filtering-completely.patch
> 
> diff --git a/package/devel/perf/Makefile b/package/devel/perf/Makefile
> index bbf3aaf9ceac..9efd8f56e6b9 100644
> --- a/package/devel/perf/Makefile
> +++ b/package/devel/perf/Makefile
> @@ -27,7 +27,7 @@ include $(INCLUDE_DIR)/nls.mk  define Package/perf
>    SECTION:=devel
>    CATEGORY:=Development
> -  DEPENDS:= +libelf +libdw +PACKAGE_libunwind:libunwind +libpthread
> +librt +objdump @!IN_SDK @!TARGET_arc770 @KERNEL_PERF_EVENTS
> +  DEPENDS:= +libelf +libdw +PACKAGE_libunwind:libunwind +libpthread
> + +librt +objdump @!IN_SDK @KERNEL_PERF_EVENTS
>    TITLE:=Linux performance monitoring tool
>    VERSION:=$(LINUX_VERSION)-$(PKG_RELEASE)
>    URL:=http://www.kernel.org
> diff --git a/target/linux/arc770/Makefile b/target/linux/arc770/Makefile
> deleted file mode 100644 index 1320c8283ba3..000000000000
> --- a/target/linux/arc770/Makefile
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only -# -# Copyright (C) 2015
> OpenWrt.org
> -
> -include $(TOPDIR)/rules.mk
> -
> -ARCH:=arc
> -BOARD:=arc770
> -BOARDNAME:=Synopsys DesignWare ARC 770D -SUBTARGETS:=generic
> -
> -KERNEL_PATCHVER:=5.4
> -
> -DEVICE_TYPE:=basic
> -
> -define Target/Description
> -	Synopsys DesignWare boards
> -endef
> -
> -include $(INCLUDE_DIR)/target.mk
> -
> -$(eval $(call BuildTarget))
> diff --git a/target/linux/arc770/base-files/etc/board.d/02_network
> b/target/linux/arc770/base-files/etc/board.d/02_network
> deleted file mode 100644
> index c90f3fb6a695..000000000000
> --- a/target/linux/arc770/base-files/etc/board.d/02_network
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -#
> -# Copyright (C) 2015 OpenWrt.org
> -#
> -
> -. /lib/functions/uci-defaults.sh
> -
> -board_config_update
> -
> -case "$(board_name)" in
> -snps,axs101)
> -	ucidef_set_interface_lan "eth0" "dhcp"
> -	;;
> -esac
> -
> -board_config_flush
> -
> -exit 0
> diff --git a/target/linux/arc770/config-5.4
b/target/linux/arc770/config-5.4
> deleted file mode 100644 index 4cd5f195e698..000000000000
> --- a/target/linux/arc770/config-5.4
> +++ /dev/null
> @@ -1,195 +0,0 @@
> -# CONFIG_16KSTACKS is not set
> -CONFIG_ARC=y
> -CONFIG_ARCH_32BIT_OFF_T=y
> -CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
> -CONFIG_ARCH_HAS_DMA_COHERENT_TO_PFN=y
> -CONFIG_ARCH_HAS_DMA_PREP_COHERENT=y
> -CONFIG_ARCH_HAS_PTE_SPECIAL=y
> -CONFIG_ARCH_HAS_SETUP_DMA_OPS=y
> -CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
> -CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
> -CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
> -CONFIG_ARC_BUILTIN_DTB_NAME=""
> -CONFIG_ARC_CACHE=y
> -CONFIG_ARC_CACHE_LINE_SHIFT=5
> -CONFIG_ARC_CACHE_PAGES=y
> -# CONFIG_ARC_CACHE_VIPT_ALIASING is not set -#
> CONFIG_ARC_COMPACT_IRQ_LEVELS is not set -# CONFIG_ARC_CPU_750D
> is not set -CONFIG_ARC_CPU_770=y -CONFIG_ARC_CURR_IN_REG=y -
> CONFIG_ARC_DBG=y -# CONFIG_ARC_DBG_TLB_PARANOIA is not set -
> CONFIG_ARC_DW2_UNWIND=y -CONFIG_ARC_EMUL_UNALIGNED=y -#
> CONFIG_ARC_FPU_SAVE_RESTORE is not set -
> CONFIG_ARC_HAS_DCACHE=y -# CONFIG_ARC_HAS_DCCM is not set -
> CONFIG_ARC_HAS_ICACHE=y -# CONFIG_ARC_HAS_ICCM is not set -
> CONFIG_ARC_HAS_LLSC=y -CONFIG_ARC_HAS_SWAPE=y
> -CONFIG_ARC_KVADDR_SIZE=256
> -# CONFIG_ARC_METAWARE_HLINK is not set
> -# CONFIG_ARC_MMU_V1 is not set
> -# CONFIG_ARC_MMU_V2 is not set
> -CONFIG_ARC_MMU_V3=y
> -# CONFIG_ARC_PAGE_SIZE_16K is not set
> -# CONFIG_ARC_PAGE_SIZE_4K is not set
> -CONFIG_ARC_PAGE_SIZE_8K=y
> -CONFIG_ARC_PLAT_AXS10X=y
> -# CONFIG_ARC_PLAT_EZNPS is not set
> -# CONFIG_ARC_PLAT_TB10X is not set
> -CONFIG_ARC_TIMERS=y
> -CONFIG_AXS101=y
> -CONFIG_CC_HAS_KASAN_GENERIC=y
> -# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3 is not set -
> CONFIG_CLKDEV_LOOKUP=y -CONFIG_CLONE_BACKWARDS=y -
> CONFIG_COMMON_CLK=y -CONFIG_COMPAT_32BIT_TIME=y -
> CONFIG_CPU_NO_EFFICIENT_FFS=y -CONFIG_CRC16=y -
> CONFIG_CRYPTO_CRC32C=y -CONFIG_CRYPTO_HASH=y -
> CONFIG_CRYPTO_HASH2=y -CONFIG_CRYPTO_RNG2=y -
> CONFIG_DMA_DIRECT_REMAP=y -CONFIG_DMA_REMAP=y -
> CONFIG_DTC=y -CONFIG_DWMAC_ANARION=y -
> CONFIG_DWMAC_GENERIC=y -CONFIG_DW_APB_ICTL=y -
> CONFIG_EXT4_FS=y -# CONFIG_EZNPS_GIC is not set -
> CONFIG_FIXED_PHY=y -CONFIG_FS_IOMAP=y -CONFIG_FS_MBCACHE=y -
> CONFIG_FW_LOADER_PAGED_BUF=y -CONFIG_GENERIC_ALLOCATOR=y -
> CONFIG_GENERIC_ATOMIC64=y -CONFIG_GENERIC_CLOCKEVENTS=y -
> CONFIG_GENERIC_CSUM=y -CONFIG_GENERIC_FIND_FIRST_BIT=y -
> CONFIG_GENERIC_IRQ_CHIP=y -CONFIG_GENERIC_IRQ_SHOW=y -
> CONFIG_GENERIC_PCI_IOMAP=y -CONFIG_GENERIC_SCHED_CLOCK=y -
> CONFIG_GENERIC_SMP_IDLE_THREAD=y -CONFIG_GPIOLIB=y -
> CONFIG_GPIO_DWAPB=y -CONFIG_GPIO_GENERIC=y -#
> CONFIG_GPIO_SNPS_CREG is not set -CONFIG_HANDLE_DOMAIN_IRQ=y -
> CONFIG_HAS_DMA=y -CONFIG_HAS_IOMEM=y -
> CONFIG_HAVE_ARCH_KGDB=y -CONFIG_HAVE_ARCH_TRACEHOOK=y -
> CONFIG_HAVE_CLK=y -CONFIG_HAVE_CLK_PREPARE=y -
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
> -CONFIG_HAVE_FUTEX_CMPXCHG=y
> -CONFIG_HAVE_IOREMAP_PROT=y
> -CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
> -CONFIG_HAVE_NET_DSA=y
> -CONFIG_HAVE_OPROFILE=y
> -CONFIG_HAVE_PCI=y
> -CONFIG_HAVE_PERF_EVENTS=y
> -CONFIG_HZ_PERIODIC=y
> -CONFIG_INITRAMFS_SOURCE=""
> -CONFIG_IRQCHIP=y
> -CONFIG_IRQ_DOMAIN=y
> -CONFIG_IRQ_WORK=y
> -CONFIG_ISA_ARCOMPACT=y
> -# CONFIG_ISA_ARCV2 is not set
> -CONFIG_JBD2=y
> -CONFIG_KALLSYMS=y
> -CONFIG_KERNEL_GZIP=y
> -CONFIG_LIBFDT=y
> -CONFIG_LINUX_LINK_BASE=0x80000000
> -CONFIG_LINUX_RAM_BASE=0x80000000
> -CONFIG_LOCK_DEBUGGING_SUPPORT=y
> -CONFIG_MDIO_BUS=y
> -CONFIG_MDIO_DEVICE=y
> -CONFIG_MEMFD_CREATE=y
> -CONFIG_MFD_SYSCON=y
> -CONFIG_MIGRATION=y
> -CONFIG_MMC=y
> -CONFIG_MMC_BLOCK=y
> -CONFIG_MMC_DW=y
> -# CONFIG_MMC_DW_BLUEFIELD is not set
> -# CONFIG_MMC_DW_EXYNOS is not set
> -# CONFIG_MMC_DW_HI3798CV200 is not set
> -# CONFIG_MMC_DW_K3 is not set
> -CONFIG_MMC_DW_PLTFM=y
> -CONFIG_MMC_SDHCI=y
> -CONFIG_MMC_SDHCI_PLTFM=y
> -CONFIG_MODULES_USE_ELF_RELA=y
> -CONFIG_NATIONAL_PHY=y
> -CONFIG_NEED_DMA_MAP_STATE=y
> -CONFIG_NEED_PER_CPU_KM=y
> -CONFIG_NET_PTP_CLASSIFY=y
> -# CONFIG_NET_VENDOR_ARC is not set
> -# CONFIG_NET_VENDOR_BROADCOM is not set -#
> CONFIG_NET_VENDOR_INTEL is not set -# CONFIG_NET_VENDOR_MARVELL
> is not set -# CONFIG_NET_VENDOR_MICREL is not set -#
> CONFIG_NET_VENDOR_NATSEMI is not set -#
> CONFIG_NET_VENDOR_QUALCOMM is not set -#
> CONFIG_NET_VENDOR_ROCKER is not set -#
> CONFIG_NET_VENDOR_SAMSUNG is not set -#
> CONFIG_NET_VENDOR_SEEQ is not set -# CONFIG_NET_VENDOR_VIA is not
> set -# CONFIG_NET_VENDOR_WIZNET is not set -
> CONFIG_NO_IOPORT_MAP=y -CONFIG_OF=y -CONFIG_OF_ADDRESS=y -
> CONFIG_OF_EARLY_FLATTREE=y -CONFIG_OF_FLATTREE=y -
> CONFIG_OF_GPIO=y -CONFIG_OF_IRQ=y -CONFIG_OF_KOBJ=y -
> CONFIG_OF_MDIO=y -CONFIG_OF_NET=y -CONFIG_PAGE_POOL=y
> -CONFIG_PGTABLE_LEVELS=2
> -CONFIG_PHYLIB=y
> -CONFIG_PHYLINK=y
> -CONFIG_PPS=y
> -CONFIG_PREEMPT=y
> -CONFIG_PREEMPTION=y
> -CONFIG_PREEMPT_COUNT=y
> -# CONFIG_PREEMPT_NONE is not set
> -CONFIG_PREEMPT_RCU=y
> -CONFIG_PTP_1588_CLOCK=y
> -CONFIG_RATIONAL=y
> -CONFIG_REGMAP=y
> -CONFIG_REGMAP_MMIO=y
> -CONFIG_RESET_AXS10X=y
> -CONFIG_RESET_CONTROLLER=y
> -CONFIG_RESET_SIMPLE=y
> -CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
> -CONFIG_SERIAL_8250_DW=y
> -CONFIG_SERIAL_8250_DWLIB=y
> -CONFIG_SERIAL_8250_NR_UARTS=4
> -CONFIG_SERIAL_8250_RUNTIME_UARTS=4
> -CONFIG_SERIAL_ARC=y
> -CONFIG_SERIAL_ARC_CONSOLE=y
> -CONFIG_SERIAL_ARC_NR_PORTS=1
> -CONFIG_SERIAL_MCTRL_GPIO=y
> -CONFIG_SERIAL_OF_PLATFORM=y
> -CONFIG_SRCU=y
> -CONFIG_STACKTRACE=y
> -CONFIG_STMMAC_ETH=y
> -CONFIG_STMMAC_PLATFORM=y
> -# CONFIG_STMMAC_SELFTESTS is not set
> -CONFIG_SWPHY=y
> -CONFIG_SYSCTL_ARCH_UNALIGN_ALLOW=y
> -CONFIG_SYSCTL_ARCH_UNALIGN_NO_WARN=y
> -CONFIG_TASKS_RCU=y
> -CONFIG_TICK_CPU_ACCOUNTING=y
> -CONFIG_TIMER_OF=y
> -CONFIG_TIMER_PROBE=y
> -CONFIG_TREE_SRCU=y
> -CONFIG_UNINLINE_SPIN_UNLOCK=y
> -CONFIG_USB_SUPPORT=y
> diff --git a/target/linux/arc770/generic/profiles/00-default.mk
> b/target/linux/arc770/generic/profiles/00-default.mk
> deleted file mode 100644
> index 02404305d4b9..000000000000
> --- a/target/linux/arc770/generic/profiles/00-default.mk
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only -# -# Copyright (C) 2015
> OpenWrt.org
> -
> -define Profile/Default
> -	NAME:=Default Profile (all drivers)
> -	PACKAGES:= kmod-usb-ohci kmod-usb2 kmod-ath9k-htc wpad-basic-
> wolfssl
> -endef
> -
> -define Profile/Default/Description
> -	Default package set compatible with most boards.
> -endef
> -$(eval $(call Profile,Default))
> diff --git a/target/linux/arc770/generic/target.mk
> b/target/linux/arc770/generic/target.mk
> deleted file mode 100644
> index 5a7595d65a94..000000000000
> --- a/target/linux/arc770/generic/target.mk
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -BOARDNAME:=Generic
> -FEATURES += ramdisk usb ext4
> -
> -define Target/Description
> -	Build firmware images for generic ARC 770D based boards.
> -endef
> -
> -
> diff --git a/target/linux/arc770/image/Config.in
> b/target/linux/arc770/image/Config.in
> deleted file mode 100644
> index 52f68ba24145..000000000000
> --- a/target/linux/arc770/image/Config.in
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -config AXS10X_SD_BOOT_PARTSIZE
> -	int "Boot (SD Card) filesystem partition size (in MB)"
> -	depends on TARGET_arc770
> -	default 20
> -
> diff --git a/target/linux/arc770/image/Makefile
> b/target/linux/arc770/image/Makefile
> deleted file mode 100644
> index 4cb9364ef3f6..000000000000
> --- a/target/linux/arc770/image/Makefile
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only -# -# Copyright (C) 2016
> OpenWrt.org
> -
> -include $(TOPDIR)/rules.mk
> -include $(INCLUDE_DIR)/image.mk
> -
> -# On ARC initramfs is put before entry point and so entry point moves -#
in
> memory from build to built. Thus we need to extract EP from vmlinux -#
> every time before generation of uImage.
> -kernel_ep = `$(KERNEL_CROSS)readelf -h $(1) | grep "Entry point address"
|
> grep -o 0x.*`
> -
> -define Build/patch-dtb
> -	$(STAGING_DIR_HOST)/bin/patch-dtb $@
> $(DTS_DIR)/$(DEVICE_DTS).dtb
> -endef
> -
> -ifneq ($(CONFIG_TARGET_ROOTFS_INITRAMFS),)
> -# Root FS built-in
> -define Device/vmlinux
> -	KERNEL_SUFFIX := .elf
> -	KERNEL := kernel-bin | patch-dtb
> -	KERNEL_INITRAMFS_NAME = vmlinux-initramfs.elf
> -endef
> -
> -define Device/nsim
> -	$(call Device/vmlinux)
> -	DEVICE_VENDOR := Synopsys
> -	DEVICE_MODEL := nSIM
> -	DEVICE_PROFILE := nsim
> -	DEVICE_DTS := nsim_700
> -endef
> -TARGET_DEVICES += nsim
> -endif
> -
> -# Root FS on SD-card
> -KERNEL_LOADADDR := 0x80000000
> -DEVICE_DTS_LIST:= axs101 nsim_700
> -FAT32_BLOCK_SIZE=1024
> -FAT32_BLOCKS=$(shell echo
> $$(($(CONFIG_AXS10X_SD_BOOT_PARTSIZE)*1024*1024/$(FAT32_BLOCK_SI
> ZE))))
> -
> -define Image/Prepare
> -	# Build .dtb for all boards we may run on
> -	$(foreach dts,$(DEVICE_DTS_LIST),
> -		$(call
> Image/BuildDTB,$(DTS_DIR)/$(dts).dts,$(DTS_DIR)/$(dts).dtb)
> -	)
> -endef
> -
> -define Image/Build/SDCard
> -	rm -f $(KDIR_TMP)/$(IMG_PREFIX)-$(PROFILE)-boot.img
> -	mkfs.fat $(KDIR_TMP)/$(IMG_PREFIX)-$(PROFILE)-boot.img -C
> $(FAT32_BLOCKS)
> -	mkimage -C none -A arc -T script -d uEnv.txt $(BIN_DIR)/uEnv.scr
> -	mcopy -i $(KDIR_TMP)/$(IMG_PREFIX)-$(PROFILE)-boot.img
> $(BIN_DIR)/uEnv.scr ::boot.scr
> -	mcopy -i $(KDIR_TMP)/$(IMG_PREFIX)-$(PROFILE)-boot.img
> $(DTS_DIR)/*.dtb ::
> -	mcopy -i $(KDIR_TMP)/$(IMG_PREFIX)-$(PROFILE)-boot.img
> $(BIN_DIR)/$(IMG_PREFIX)-uImage ::uImage
> -
> -	./gen_axs10x_sdcard_img.sh \
> -		$(BIN_DIR)/$(IMG_PREFIX)-$(PROFILE)-sdcard-vfat-$(1).img
> \
> -		$(KDIR_TMP)/$(IMG_PREFIX)-$(PROFILE)-boot.img \
> -		$(KDIR)/root.$(1) \
> -		$(CONFIG_AXS10X_SD_BOOT_PARTSIZE) \
> -		$(CONFIG_TARGET_ROOTFS_PARTSIZE)
> -
> -ifneq ($(CONFIG_TARGET_IMAGES_GZIP),)
> -	gzip -f9n $(BIN_DIR)/$(IMG_PREFIX)-$(PROFILE)-sdcard-vfat-
> $(1).img
> -endif
> -endef
> -
> -define Image/BuildKernel
> -	# Build unified uImage
> -	$(call Image/BuildKernel/MkuImage, \
> -		none, $(KERNEL_LOADADDR),$(call
> kernel_ep,$(KDIR)/vmlinux.elf) , \
> -		$(KDIR)/vmlinux, \
> -		$(BIN_DIR)/$(IMG_PREFIX)-uImage \
> -	)
> -endef
> -
> -define Image/Build
> -	$(call Image/Build/$(1),$(1))
> -	$(call Image/Build/SDCard,$(1))
> -	dd if=$(KDIR)/root.$(1) of=$(BIN_DIR)/$(IMG_PREFIX)-root.$(1)
> bs=128k conv=sync
> -	$(call Image/Gzip,$(BIN_DIR)/$(IMG_PREFIX)-root.$(1))
> -endef
> -
> -$(eval $(call BuildImage))
> diff --git a/target/linux/arc770/image/gen_axs10x_sdcard_img.sh
> b/target/linux/arc770/image/gen_axs10x_sdcard_img.sh
> deleted file mode 100755
> index 12ead10dbe98..000000000000
> --- a/target/linux/arc770/image/gen_axs10x_sdcard_img.sh
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0-only -# -# Copyright (C) 2016
> OpenWrt.org
> -
> -set -x
> -[ $# -eq 5 ] || {
> -    echo "SYNTAX: $0 <file> <bootfs image> <rootfs image> <bootfs size>
> <rootfs size>"
> -    exit 1
> -}
> -
> -OUTPUT="$1"
> -BOOTFS="$2"
> -ROOTFS="$3"
> -BOOTFSSIZE="$4"
> -ROOTFSSIZE="$5"
> -
> -head=4
> -sect=63
> -
> -set $(ptgen -o $OUTPUT -h $head -s $sect -l 1024 -t c -p ${BOOTFSSIZE}M
-t
> 83 -p ${ROOTFSSIZE}M)
> -
> -BOOTOFFSET="$(($1 / 512))"
> -BOOTSIZE="$(($2 / 512))"
> -ROOTFSOFFSET="$(($3 / 512))"
> -ROOTFSSIZE="$(($4 / 512))"
> -
> -dd bs=512 if="$BOOTFS" of="$OUTPUT" seek="$BOOTOFFSET"
> conv=notrunc -dd bs=512 if="$ROOTFS" of="$OUTPUT"
> seek="$ROOTFSOFFSET" conv=notrunc diff --git
> a/target/linux/arc770/image/uEnv.txt b/target/linux/arc770/image/uEnv.txt
> deleted file mode 100644
> index 53632e8bb66a..000000000000
> --- a/target/linux/arc770/image/uEnv.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -setenv kernel_addr_r 0x82000000
> -setenv fdt_addr_r 0x83000000
> -setenv loadkernel fatload mmc 0 \${kernel_addr_r} uImage -setenv loaddtb
> fatload mmc 0 \${fdt_addr_r} \${dts} -setenv bootargs
> earlycon=uart8250,mmio32,0xe0022000,115200n8 console=ttyS3,115200n8
> root=/dev/mmcblk0p2 rootwait print-fatal-signals=1 -setenv uenvcmd run
> loadkernel\; run loaddtb\; bootm \${kernel_addr_r} - \${fdt_addr_r} -run
> uenvcmd diff --git a/target/linux/arc770/patches-5.4/700-stmmac-Disable-
> frame-filtering-completely.patch b/target/linux/arc770/patches-5.4/700-
> stmmac-Disable-frame-filtering-completely.patch
> deleted file mode 100644
> index 9adfcb1be2cb..000000000000
> --- a/target/linux/arc770/patches-5.4/700-stmmac-Disable-frame-filtering-
> completely.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 0031b9011cb2b2b1de4dbb4f9620303aec760db4 Mon Sep 17 00:00:00
> 2001
> -From: Alexey Brodkin <abrodkin@synopsys.com>
> -Date: Wed, 27 Jul 2016 11:33:14 +0300
> -Subject: [PATCH] stmmac: Disable frame filtering completely
> -
> -For some [still unknown] reason in ARC SDP boards -DW GMAC doesn't
> enter promiscuous mode if eth0 gets -added to the br-lan interface before
> Ethernet PHY finishes -autonegotiation (PHY gets reset on DW GMAC start).
> -
> -As a work-around we completely disable frame filtering -in GMAC hardware
> which gives us working bridge that consists -of eth0 and wlan0 (USB Wi-Fi
> dongle). I.e. we finally have -working "Dumb AP" setup made of ARC AXS10x
> boards.
> -
> -Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ----
> - drivers/net/ethernet/stmicro/stmmac/common.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> ---- a/drivers/net/ethernet/stmicro/stmmac/common.h
> -+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> -@@ -42,7 +42,7 @@
> - #define STMMAC_GET_ENTRY(x, size)	((x + 1) & (size - 1))
> -
> - #undef FRAME_FILTER_DEBUG
> --/* #define FRAME_FILTER_DEBUG */
> -+#define FRAME_FILTER_DEBUG
> -
> - /* Extra statistic and debug information exposed by ethtool */
> - struct stmmac_extra_stats {
> --
> 2.30.2
> 
> 
> _______________________________________________
> openwrt-devel mailing list
> openwrt-devel@lists.openwrt.org
> https://lists.openwrt.org/mailman/listinfo/openwrt-devel


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
