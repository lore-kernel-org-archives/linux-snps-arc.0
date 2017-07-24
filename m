From: alex.g@adaptrum.com (Alexandru Gagniuc)
Date: Mon, 24 Jul 2017 10:38:25 -0700
Subject: ARC770: "unexpected IRQ trap at vector 00" during boot
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2b9507b2-58b7-1739-23df-973e7c865ef3@adaptrum.com>
To: linux-snps-arc@lists.infradead.org

Hi,

I'm getting a storm of these messages when trying to boot an in-house 
ASIC with an ARC770. This only happens with an ethernet cable plugged 
in. I've learned that the actual interrupt number is 21. The issue is 
that the irq_find_mapping() in __handle_domain_irq() fails to find a 
mapping for vector 21, and the remaining logic will brainlessly print 
out '0' as the interrupt number (which is of course, bass-ackwards).

This happens very early in the boot process, right after interrupts are 
globally enabled. IRQ 21 is the correct IRQ vector for the ethernet 
controller, but I don't understand why the IRQ vector is unmasked before 
the ethernet driver is loaded. This is a chicken and egg problem, since 
we have no control over the state of the ethernet before the driver is 
actually loaded.

I'm hoping someone might be able to point me in the right directions, 
since at this point, I'm not sure if this is a devicetree problem, 
hardware bug, or linux bug.

Alex


# Appendix A: Relevant devicetree bindings:

/ {
	model = "adaptrum,anarion";
	compatible = "snps,nsim";
	#address-cells = <1>;
	#size-cells = <1>;
	interrupt-parent = <&core_intc>;

	chosen {
		bootargs = "earlycon console=ttyS0,115200n8";
		stdout-path = "serial0:115200n8";
	};

	aliases {
		serial0 = &uart0;
	};

	soc {
		compatible = "simple-bus";
		device_type = "soc";
		#address-cells = <1>;
		#size-cells = <1>;
		ranges;

		core_clk: core_clk {
			#clock-cells = <0>;
			compatible = "fixed-clock";
			clock-frequency = <12000000>;
		};

		core_intc: interrupt-controller {
			compatible = "snps,arc700-intc";
			interrupt-controller;
			#interrupt-cells = <1>;
		};

		uart0: serial at f2202100 {
			compatible = "ns16550";
			reg = <0xf2202100 0x20>;
			interrupts = <8>;
			reg-shift = <2>;
			reg-io-width = <4>;
			clock-frequency = <192000000>;
		};


		gmac1: ethernet at f2014000 {
			compatible = "snps,dwmac";
			reg = <0xf2014000 0x4000>;

			interrupt-parent = <&core_intc>;
			interrupts = <21>;
			interrupt-names = "macirq";

			clocks = <&core_clk>;
			clock-names = "stmmaceth";

			snps,pbl = <32>;
			status = "disabled";
		};
	};

};

&gmac1 {
	phy-mode = "rgmii";
	status = "okay";
};
