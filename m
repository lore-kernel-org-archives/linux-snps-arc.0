From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 25 Aug 2017 14:18:45 -0700
Subject: [PATCH v3 0/2] Add platform support for Adaptrum Anarion SOC
In-Reply-To: <20170816221516.13609-1-alex.g@adaptrum.com>
References: <20170816221516.13609-1-alex.g@adaptrum.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3c7af613-3807-9ca0-a395-4b40566f07f6@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/16/2017 03:15 PM, Alexandru Gagniuc wrote:
> Changes since v2:
>   * Changed compatible binding of uart[1-3] to "ns16550" (they are not DW UARTs)
>   * Add support under plat-nsim instead of creating a new stub platform
>   * Changed board model to "adaptrum,endor-fpga" to allow LEDE scripts to ID the board
>   * Prefix compatible binding with 'arc-'

Can you provide an updated version soon - it would be nice if it made into next 
merge window !

> 
> Changes since v1:
>   * Updated CPU core clock to 24 MHz to match HW changes.
> 
> Alexandru Gagniuc (2):
>    ARC: [plat-sim] Add .compatible property for Adaptrum Anarion SOC
>    ARC: DTS: Add device-tree for Anarion-based development board
> 
>   arch/arc/boot/dts/adaptrum_anarion.dtsi     | 110 ++++++++++++++++++++++++++++
>   arch/arc/boot/dts/adaptrum_anarion_fpga.dts |  51 +++++++++++++
>   arch/arc/plat-sim/platform.c                |   1 +
>   3 files changed, 162 insertions(+)
>   create mode 100644 arch/arc/boot/dts/adaptrum_anarion.dtsi
>   create mode 100644 arch/arc/boot/dts/adaptrum_anarion_fpga.dts
> 
