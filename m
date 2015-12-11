From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 11 Dec 2015 16:49:10 +0530
Subject: [PATCH 0/3] ARC perf interrpt fixes
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449832753-6767-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Thomas, Marc, Peter

Fixed a bunch of perf interrupt issues in ARC port.
Apologies for extraneous CC. I think I'm doing the right thing here, and things
start to work after these patches, but still running by domain experts to keep
them in loop :-)

Thx,
-Vineet

Vineet Gupta (3):
  ARCv2: intc: Fix random perf irq disabling in SMP setup
  ARC: intc: No need to clear IRQ_NOAUTOEN
  ARCv2: perf: Ensure perf intr gets enabled on all cores

 arch/arc/kernel/intc-arcv2.c | 15 +++++++++++++--
 arch/arc/kernel/irq.c        | 13 ++++++++-----
 arch/arc/kernel/perf_event.c | 32 +++++++++-----------------------
 3 files changed, 30 insertions(+), 30 deletions(-)

-- 
1.9.1
