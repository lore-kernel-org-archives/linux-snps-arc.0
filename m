From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:10:58 +0530
Subject: [RFC 00/17] ARC Dwarf unwinder improvements
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi guys,

In light of perf -g stalling (as unwinder was taking ~3million cycles for non
existent entries), I've revamped the dwarf unwinder.

There are some optim tweaks and much of it is "De-generalization" for things
which we can safely assume on ARC.

Crude Instrumentation shows following improvements per unwinder call:
 - Avg time come down from ~4650 cycles to ~2794 cycles (+40%)
 - Max time come down 9793 cycles to 5987 cycles

This is on a SMP FPGA config @ 75 MHz

It seems much of time (65%) is taken for binary lookup thru ~12k FDE entries,
roughly 13 lookups, each likely a dcache miss.


git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc   # topic-unwinder-rework-4-instrument

-Vineet

Vineet Gupta (17):
  ARC: dw2 unwind: Elide generation of const propagated clones
  ARC: dw2 unwind: remove unused cruft
  ARC: dw2 unwind: Remove handling of for signal frame
  ARC: dw2 unwind: Remove FP based unwinding
  ARC: dw2 unwind: Better printing
  ARC: dw2 unwind: Don't verify Main FDE Table size everytime
  ARC: dw2 unwind: Refactor the FDE lookup table (eh_frame_header) code
  ARC: dw2 unwind: Don't verify FDE lookup table metadata
  ARC: dw2 unwind: Use striaght forward code to implement binary lookup
  ARC: dw2 unwind: CIE parsing/validation done only once at startup
  ARC: dw2 unwind: Elide REG_INVALID check
  ARC: dw2 unwind: Elide a loop if DW_CFA_register not present
  ARC: dw2 unwind: Assume all regs to be unsigned long
  ARC: dw2 unwind: No need for __get_user
  ARC: dw2 unwind: Single exit point for instrumentation
  ARC: dw2 unwind: skip regs not updated
  xxx: instrument

 arch/arc/include/asm/unwind.h |  47 +--
 arch/arc/kernel/Makefile      |   1 +
 arch/arc/kernel/unwind.c      | 806 ++++++++++++++++--------------------------
 3 files changed, 313 insertions(+), 541 deletions(-)

-- 
1.9.1
