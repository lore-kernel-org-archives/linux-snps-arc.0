From: joe@perches.com (Joe Perches)
Date: Mon, 18 Jun 2018 13:07:32 -0700
Subject: [PATCH] ARC: dts: Remove leading 0x from node unit addresses
In-Reply-To: <20180618191645.15247-1-krzk@kernel.org>
References: <20180618191645.15247-1-krzk@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8268db75d4698a4fba9aa11de7e8f6d6f20a0515.camel@perches.com>
To: linux-snps-arc@lists.infradead.org

On Mon, 2018-06-18@21:16 +0200, Krzysztof Kozlowski wrote:
> Remove leading 0x from all node unit addresses with a sed command:
> 
>     sed -E -i -e "s/@0x([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" arch/arc/boot/dts/*.dts*
> 
> This fixes DTC warnings like:
> 
>     Warning (unit_address_format): /cpu_card/dw-apb-gpio at 0x2000: unit name should not have leading "0x"

Do all of these need fixing?

Aren't there dozens of these in arch/arm and elsewhere too?

$ git grep -i -P "@0x([0-9a-f]+)\s*\{" -- "*.dt*"|cat
arch/arc/boot/dts/abilis_tb10x.dtsi:		spi0: spi at 0xFE010000 {
arch/arc/boot/dts/abilis_tb10x.dtsi:		spi1: spi at 0xFE011000 {
arch/arc/boot/dts/axc001.dtsi:		dw-apb-gpio at 0x2000 {
arch/arc/boot/dts/axc001.dtsi:		debug_uart: dw-apb-uart at 0x5000 {
arch/arc/boot/dts/axc001.dtsi:	mb_intc: dw-apb-ictl at 0xe0012000 {
arch/arc/boot/dts/axc003.dtsi:		dw-apb-gpio at 0x2000 {
arch/arc/boot/dts/axc003.dtsi:		debug_uart: dw-apb-uart at 0x5000 {
arch/arc/boot/dts/axc003.dtsi:	mb_intc: dw-apb-ictl at 0xe0012000 {
arch/arc/boot/dts/axc003_idu.dtsi:		dw-apb-gpio at 0x2000 {
arch/arc/boot/dts/axc003_idu.dtsi:		debug_uart: dw-apb-uart at 0x5000 {
arch/arc/boot/dts/axc003_idu.dtsi:	mb_intc: dw-apb-ictl at 0xe0012000 {
arch/arc/boot/dts/axs10x_mb.dtsi:		ethernet at 0x18000 {
arch/arc/boot/dts/axs10x_mb.dtsi:		ehci at 0x40000 {
arch/arc/boot/dts/axs10x_mb.dtsi:		ohci at 0x60000 {
arch/arc/boot/dts/axs10x_mb.dtsi:		mmc at 0x15000 {
arch/arc/boot/dts/axs10x_mb.dtsi:		uart at 0x20000 {
arch/arc/boot/dts/axs10x_mb.dtsi:		uart at 0x21000 {
arch/arc/boot/dts/axs10x_mb.dtsi:		uart at 0x22000 {
arch/arc/boot/dts/axs10x_mb.dtsi:		i2c at 0x1d000 {
arch/arc/boot/dts/axs10x_mb.dtsi:		i2c at 0x1f000 {
arch/arc/boot/dts/axs10x_mb.dtsi:			eeprom at 0x54{
arch/arc/boot/dts/axs10x_mb.dtsi:			eeprom at 0x57{
arch/arc/boot/dts/vdk_axc003.dtsi:		debug_uart: dw-apb-uart at 0x5000 {
arch/arc/boot/dts/vdk_axc003.dtsi:	mb_intc: dw-apb-ictl at 0xe0012000 {
arch/arc/boot/dts/vdk_axc003_idu.dtsi:		debug_uart: dw-apb-uart at 0x5000 {
arch/arc/boot/dts/vdk_axc003_idu.dtsi:	mb_intc: dw-apb-ictl at 0xe0012000 {
arch/arc/boot/dts/vdk_axs10x_mb.dtsi:		ethernet at 0x18000 {
arch/arc/boot/dts/vdk_axs10x_mb.dtsi:		ehci at 0x40000 {
arch/arc/boot/dts/vdk_axs10x_mb.dtsi:		uart at 0x20000 {
arch/arc/boot/dts/vdk_axs10x_mb.dtsi:		uart at 0x21000 {
arch/arc/boot/dts/vdk_axs10x_mb.dtsi:		uart at 0x22000 {
arch/arc/boot/dts/vdk_axs10x_mb.dtsi:		mmc at 0x15000 {
arch/arc/boot/dts/vdk_axs10x_mb.dtsi:	uio_ev: uio at 0xD0000000 {
arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts:						bootloaderenv at 0x100000 {
arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts:						bootloaderenvred at 0x140000 {
arch/arm/boot/dts/atlas7.dtsi:			pmipc at 0x13240000 {
arch/arm/boot/dts/atlas7.dtsi:			gnssmfw at 0x18100000 {
arch/arm/boot/dts/atlas7.dtsi:			gpum at 0x13000000 {
arch/arm/boot/dts/atlas7.dtsi:			sdr at 0x13010000 {
arch/arm/boot/dts/atlas7.dtsi:			memory-controller at 0x10800000 {
arch/arm/boot/dts/atlas7.dtsi:			retain at 0x188D0000 {
arch/arm/boot/dts/dm8148-evm.dts:		partition at 0x80000 {
arch/arm/boot/dts/dm8148-evm.dts:		partition at 0x1c0000 {
arch/arm/boot/dts/dm8148-evm.dts:		partition at 0x280000 {
arch/arm/boot/dts/dm8148-evm.dts:		partition at 0x780000 {
arch/arm/boot/dts/dm8168-evm.dts:		partition at 0x80000 {
arch/arm/boot/dts/dm8168-evm.dts:		partition at 0x1c0000 {
arch/arm/boot/dts/dm8168-evm.dts:		partition at 0x280000 {
arch/arm/boot/dts/dm8168-evm.dts:		partition at 0x780000 {
arch/arm/boot/dts/keystone-k2e-netcp.dtsi:		pdsp0 at 0x2a10000 {
arch/arm/boot/dts/keystone-k2hk-netcp.dtsi:		pdsp0 at 0x2a10000 {
arch/arm/boot/dts/keystone-k2l-netcp.dtsi:		pdsp0 at 0x2a10000 {
arch/arm/boot/dts/socfpga.dtsi:		l3regs at 0xff800000 {
arch/arm/boot/dts/spear300.dtsi:		shirq: interrupt-controller at 0x50000000 {
arch/arm/boot/dts/spear310.dtsi:		shirq: interrupt-controller at 0xb4000000 {
arch/arm/boot/dts/spear320.dtsi:		shirq: interrupt-controller at 0xb3000000 {
arch/arm64/boot/dts/exynos/exynos5433.dtsi:		sysmmu_scaler_0: sysmmu at 0x15040000 {
arch/arm64/boot/dts/exynos/exynos5433.dtsi:		sysmmu_scaler_1: sysmmu at 0x15050000 {
arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi:			partition at 0x0 {
arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi:			partition at 0x6000000 {
arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi:			partition at 0x6800000 {
arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi:			partition at 0x7fe0000 {
arch/xtensa/boot/dts/xtfpga-flash-16m.dtsi:			partition at 0x0 {
arch/xtensa/boot/dts/xtfpga-flash-16m.dtsi:			partition at 0x400000 {
arch/xtensa/boot/dts/xtfpga-flash-16m.dtsi:			partition at 0xa00000 {
arch/xtensa/boot/dts/xtfpga-flash-16m.dtsi:			partition at 0xfe0000 {
arch/xtensa/boot/dts/xtfpga-flash-4m.dtsi:			partition at 0x0 {
arch/xtensa/boot/dts/xtfpga-flash-4m.dtsi:			partition at 0x3f0000 {
