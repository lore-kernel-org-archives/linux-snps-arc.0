From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 16 Jan 2017 12:57:53 -0800
Subject: [PATCH 0/4] ARC rework SMP boot waiting to handle IO-Coherency case
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1484600277-32345-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC SMP supports halt-on-reset and run-on-reset for non master cores.
run-on-reset is applicable for internal bitfiles as well as debugger
assisted boots (where all cores are started together)

run-on-reset uses a poll-shared-flag-in-mem-n-spin approach which is not
efficient and moreover is wrong when IO-Coherency is being setup by Master
in early boot, expecting absolutely NO noise on coherency unit by other cores.

To solve this we wither need to move all the SLC/IOC setup code in head.S
which is super pain, or we make run-to-reset behave as if halt-on-reset with
hardware assist to resume the non masters at right time.

Vineet Gupta (4):
  ARC: smp-boot: waiting API for run-from-reset need not jump to entry
    point
  ARC: smp-boot: run-on-reset: add callback to allow non masters to wait
  ARCv2: smp: MCIP: remove debug aid to halt all cores when one halts
  ARCv2: smp-boot: MCIP: use Inter-Core-Debug unit to kick start non
    master cpus

 arch/arc/include/asm/mcip.h |  1 +
 arch/arc/include/asm/smp.h  |  3 +++
 arch/arc/kernel/head.S      | 14 +++++++-------
 arch/arc/kernel/mcip.c      | 34 ++++++++++++++++++++++++++++++----
 arch/arc/kernel/smp.c       | 15 +++++++++++++--
 5 files changed, 54 insertions(+), 13 deletions(-)

-- 
2.7.4
