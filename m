From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 19 May 2016 11:54:49 +0530
Subject: [GIT PULL] ARC updates for 4.7-rc1
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <573D5C31.8010100@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

We have a relatively big changeset for ARC for 4.7.

The highlight is support for EZChip (now Mellanox) NPS-400 network processor, a
400-Gb throughput C-programmable packet processor based on ARC700 cores from
Synopsys (http://www.mellanox.com/related-docs/prod_npu/PB_NPS-400.pdf)

Also present are irqchip and clocksource drivers for NPS as agreed with respective
maintainers to go via ARC tree due to an soc header dependency.
I have the needed ACKs from Jason, Marc, Daniel. You might run into a trivial
merge conflict in drivers/irqchip/*

This EZChip platform support required some deep changes in ARC architecture code
and also opportunity to cleanup past sins (legacy irq domains, missing irq domain
lookup, hard coded timer irqs...)

Please pull.

Thx,
-Vineet

--------->
The following changes since commit 44549e8f5eea4e0a41b487b63e616cb089922b99:

  Linux 4.6-rc7 (2016-05-08 14:38:32 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.7-rc1

for you to fetch changes up to 776d7f1694a7d678291354a05f0243965708306a:

  arc: axs103_smp: Fix CPU frequency to 100MHz for dual-core (2016-05-18 10:50:18
+0530)

----------------------------------------------------------------
ARC updates for 4.7-rc1

- Support for EZChip (now Mellanox) NPS-400 Network processor based on ARC700
    http://www.mellanox.com/related-docs/prod_npu/PB_NPS-400.pdf
- NPS interrupt controller and clocksource drivers
- ARC timers probed off DT
- ARC iqrchips switching to linear domain (upgrade from legacy domains)

----------------------------------------------------------------
Alexey Brodkin (4):
      ARC: use fixed frequencies in arc_set_early_base_baud()
      ARC: Don't try to use value of top level clock-frequency in DT
      ARC: RIP arc_{get|set}_core_freq() clk API
      arc: axs103_smp: Fix CPU frequency to 100MHz for dual-core

Jose Abreu (1):
      arc: axs10x: Add DT bindings for I2S PLL Clock

Noam Camus (18):
      ARC: clockevent: switch to cpu notifier for clockevent setup
      ARC: clockevent: Prepare for DT based probe
      Documentation: Add EZchip vendor to binding list
      soc: Support for EZchip SoC
      clocksource: Add NPS400 timers driver
      irqchip: add nps Internal and external irqchips
      ARC: clean out UAPI byteorder.h clean off Kconfig symbol
      ARC: Make vmalloc size configurable
      ARC: rwlock: disable interrupts in !LLSC variant
      ARC: Mark secondary cpu online only after all HW setup is done
      ARC: [plat-eznps] Add eznps board defconfig and dts
      ARC: [plat-eznps] Add eznps platform
      ARC: [plat-eznps] Use dedicated user stack top
      ARC: [plat-eznps] Use dedicated atomic/bitops/cmpxchg
      ARC: [plat-eznps] Use dedicated SMP barriers
      ARC: [plat-eznps] Use dedicated identity auxiliary register.
      ARC: [plat-eznps] Use dedicated COMMAND_LINE_SIZE
      ARC: Add eznps platform to Kconfig and Makefile

Tal Zilcer (1):
      ARC: [plat-eznps] Use dedicated cpu_relax()
