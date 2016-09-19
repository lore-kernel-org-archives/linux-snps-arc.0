From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 19 Sep 2016 14:49:30 -0700
Subject: [PATCH 0/3] ARC unwinder switch to .eh_frame
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1474321773-18166-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel,

Give these a shot and let me know if they work fine for you.
I'm working on some more improvements to unwinder which will follow
a bit later.

Thx,
-Vineet

Vineet Gupta (3):
  ARC: module: support R_ARC_32_PCREL relocation
  ARC: dw2 unwind: factor CIE specifics for .eh_frame/.debug_frame
  ARC: dw2 unwind: switch to .eh_frame based unwinding

 arch/arc/Makefile             |  2 ++
 arch/arc/include/asm/elf.h    |  3 +--
 arch/arc/kernel/entry.S       | 12 ------------
 arch/arc/kernel/module.c      | 19 ++++++++-----------
 arch/arc/kernel/unwind.c      | 24 +++++++++++++++++-------
 arch/arc/kernel/vmlinux.lds.S | 15 +++++----------
 6 files changed, 33 insertions(+), 42 deletions(-)

-- 
2.7.4
