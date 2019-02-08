From: bruce.ashfield@gmail.com (Bruce Ashfield)
Date: Fri, 8 Feb 2019 10:15:32 -0500
Subject: [linux-yocto] [PATCH] ARC: Add nsimhs- and hsdk-standard configs
In-Reply-To: <20190208142940.12691-1-abrodkin@synopsys.com>
References: <20190208142940.12691-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CADkTA4Ny7Q5-+68HS8bwDfa3sx86YA3kMZMmLwoDDNMNk2Gq0A@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Feb 8, 2019 at 9:29 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> With ARC support ramping-up in upstream OE we're ready to
> build more complicated distributions and linux-yocto is
> a nice and configurable base for that.
>
> This commit adds support of 1 simulated board (nSIM) and
> the mast affordable and powerful to date development board (HSDK).
>
> Once Qemu port for ARC is functional (it's being actively developed now)
> we'll switch from nSIM to Qemu.
>
> Still it would be really good to keep nSIM support in linux-yocto for now
> as it allows for simpler testing as compared to real HW.

Looks good to me, the configs make sense and are clean.

I'd put this on master so it would be available for the 5.x -dev
kernel (and then any
future versions I release). If you want to test it on other versions
(i.e. 4.19), let me
know and I can put it there as well.

Bruce

>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Bruce Ashfield <bruce.ashfield at windriver.com>
> ---
>  arch/arc/arc.cfg               |  8 ++++++
>  arch/arc/arc.scc               |  5 ++++
>  bsp/hsdk/hsdk-standard.scc     |  7 +++++
>  bsp/hsdk/hsdk.cfg              | 61 ++++++++++++++++++++++++++++++++++++++++++
>  bsp/hsdk/hsdk.scc              |  7 +++++
>  bsp/nsimhs/nsimhs-standard.scc |  7 +++++
>  bsp/nsimhs/nsimhs.cfg          |  9 +++++++
>  bsp/nsimhs/nsimhs.scc          |  1 +
>  8 files changed, 105 insertions(+)
>  create mode 100644 arch/arc/arc.cfg
>  create mode 100644 arch/arc/arc.scc
>  create mode 100644 bsp/hsdk/hsdk-standard.scc
>  create mode 100644 bsp/hsdk/hsdk.cfg
>  create mode 100644 bsp/hsdk/hsdk.scc
>  create mode 100644 bsp/nsimhs/nsimhs-standard.scc
>  create mode 100644 bsp/nsimhs/nsimhs.cfg
>  create mode 100644 bsp/nsimhs/nsimhs.scc
>
> diff --git a/arch/arc/arc.cfg b/arch/arc/arc.cfg
> new file mode 100644
> index 00000000..761f3ed9
> --- /dev/null
> +++ b/arch/arc/arc.cfg
> @@ -0,0 +1,8 @@
> +CONFIG_ARC=y
> +CONFIG_HIGH_RES_TIMERS=y
> +
> +CONFIG_ARC_CACHE=y
> +
> +# Enable unwinding
> +CONFIG_ARC_DBG=y
> +CONFIG_ARC_DW2_UNWIND=y
> diff --git a/arch/arc/arc.scc b/arch/arc/arc.scc
> new file mode 100644
> index 00000000..bcc7c330
> --- /dev/null
> +++ b/arch/arc/arc.scc
> @@ -0,0 +1,5 @@
> +# patches are for everyone, but the kconfig data is just for ARC builds.
> +if [ "$KARCH" = "arc" ]; then
> +       kconf hardware arc.cfg
> +       include cfg/timer/hz_100.scc
> +fi
> diff --git a/bsp/hsdk/hsdk-standard.scc b/bsp/hsdk/hsdk-standard.scc
> new file mode 100644
> index 00000000..29c46047
> --- /dev/null
> +++ b/bsp/hsdk/hsdk-standard.scc
> @@ -0,0 +1,7 @@
> +define KMACHINE hsdk
> +define KTYPE standard
> +define KARCH arc
> +
> +include ktypes/standard/standard.scc
> +
> +include hsdk.scc
> diff --git a/bsp/hsdk/hsdk.cfg b/bsp/hsdk/hsdk.cfg
> new file mode 100644
> index 00000000..6d439021
> --- /dev/null
> +++ b/bsp/hsdk/hsdk.cfg
> @@ -0,0 +1,61 @@
> +# ARCv2 ISA
> +CONFIG_ISA_ARCV2=y
> +
> +# HSDK custom SoC
> +CONFIG_ARC_SOC_HSDK=y
> +CONFIG_SMP=y
> +
> +# Build default .dtb inside kernel image as a good starting point
> +CONFIG_ARC_BUILTIN_DTB_NAME="hsdk"
> +
> +# Enable passing command-line and .dtb from U-Boot
> +CONFIG_ARC_UBOOT_SUPPORT=y
> +
> +# Auto-selected by U-Boot support but if it is enabled slave cores won't start
> +# CONFIG_ARC_SMP_HALT_ON_RESET is not set
> +
> +# Serial port
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_DW=y
> +CONFIG_SERIAL_OF_PLATFORM=y
> +
> +# DesignWare MobileStorage AKA DW MMC
> +CONFIG_MMC=y
> +CONFIG_MMC_SDHCI=y
> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_DW=y
> +
> +# We use non-standard link base 0x9z to accommodate DCCM mapped to 0x8z
> +# on cores 1 & 3.
> +# Though we move xCCMs to 0x6z on early boot and may use all avaialble DDR
> +# starting from normal 0x8z thus LINUX_RAM_BASE.
> +CONFIG_LINUX_LINK_BASE=0x90000000
> +CONFIG_LINUX_RAM_BASE=0x80000000
> +
> +# Ethernet
> +CONFIG_NET_VENDOR_STMICRO=y
> +CONFIG_STMMAC_ETH=y
> +CONFIG_STMMAC_PLATFORM=y
> +CONFIG_MICREL_PHY=y
> +
> +# GPIO
> +CONFIG_GPIOLIB=y
> +CONFIG_GPIO_SYSFS=y
> +CONFIG_GPIO_DWAPB=y
> +
> +# Video
> +CONFIG_DRM=y
> +CONFIG_DRM_UDL=y
> +CONFIG_FB=y
> +CONFIG_FRAMEBUFFER_CONSOLE=y
> +
> +# Required for SOFTLOCKUP_DETECTOR
> +CONFIG_DEBUG_KERNEL=y
> +
> +# Soft lock-up detector
> +CONFIG_SOFTLOCKUP_DETECTOR=y
> +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
> +
> +# Performance counters
> +CONFIG_PERF_EVENTS=y
> diff --git a/bsp/hsdk/hsdk.scc b/bsp/hsdk/hsdk.scc
> new file mode 100644
> index 00000000..2cfcb654
> --- /dev/null
> +++ b/bsp/hsdk/hsdk.scc
> @@ -0,0 +1,7 @@
> +include features/input/input.scc
> +include features/usb/ehci-hcd.scc
> +include features/usb/ohci-hcd.scc
> +
> +include cfg/usb-mass-storage.scc
> +
> +kconf hardware hsdk.cfg
> diff --git a/bsp/nsimhs/nsimhs-standard.scc b/bsp/nsimhs/nsimhs-standard.scc
> new file mode 100644
> index 00000000..da749cd0
> --- /dev/null
> +++ b/bsp/nsimhs/nsimhs-standard.scc
> @@ -0,0 +1,7 @@
> +define KMACHINE nsimhs
> +define KTYPE standard
> +define KARCH arc
> +
> +include ktypes/standard/standard.scc
> +
> +include nsimhs.scc
> diff --git a/bsp/nsimhs/nsimhs.cfg b/bsp/nsimhs/nsimhs.cfg
> new file mode 100644
> index 00000000..2475825d
> --- /dev/null
> +++ b/bsp/nsimhs/nsimhs.cfg
> @@ -0,0 +1,9 @@
> +# ARCv2 ISA
> +CONFIG_ISA_ARCV2=y
> +
> +# Legacy ARC UART
> +CONFIG_SERIAL_ARC=y
> +CONFIG_SERIAL_ARC_CONSOLE=y
> +
> +# Built-in .dtb
> +CONFIG_ARC_BUILTIN_DTB_NAME="nsim_hs"
> diff --git a/bsp/nsimhs/nsimhs.scc b/bsp/nsimhs/nsimhs.scc
> new file mode 100644
> index 00000000..93a3ab1b
> --- /dev/null
> +++ b/bsp/nsimhs/nsimhs.scc
> @@ -0,0 +1 @@
> +kconf hardware nsimhs.cfg
> --
> 2.16.2
>
> --
> _______________________________________________
> linux-yocto mailing list
> linux-yocto at yoctoproject.org
> https://lists.yoctoproject.org/listinfo/linux-yocto



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
