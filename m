From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 17 May 2019 12:32:03 -0700
Subject: [PATCH 0/5] Rewrite ARCv2 interrupt/expecption entry code
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1558121528-30184-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This was along pending todo item to remove the copy-paste from NO_AUTOSAVE
support as well use LDD/STD instructions for better generated code.

Thx,
-Vineet

Vineet Gupta (5):
  ARCv2: entry: comments about hardware auto-save on taken interrupts
  ARCv2: entry: push out the Z flag unclobber from common
    EXCEPTION_PROLOGUE
  ARCv2: entry: avoid a branch
  ARCv2: entry: rewrite to enable use of double load/stores LDD/STD
  ARC: entry: EV_Trap expects r10 (vs. r9) to have exception cause

 arch/arc/include/asm/entry-arcv2.h   | 361 ++++++++++++++++++-----------------
 arch/arc/include/asm/entry-compact.h |   4 +-
 arch/arc/include/asm/linkage.h       |  18 ++
 arch/arc/kernel/asm-offsets.c        |   7 +
 arch/arc/kernel/entry-arcv2.S        |   4 +-
 arch/arc/kernel/entry.S              |   4 +-
 arch/arc/mm/tlbex.S                  |  11 ++
 7 files changed, 232 insertions(+), 177 deletions(-)

-- 
2.7.4
