From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 10:53:57 -0800
Subject: [PATCH 0/2] ARC show_regs fixes
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545159239-30628-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Vineet Gupta (2):
  ARC: show_regs: avoid page allocator
  ARC: show_regs: fix lockdep splat for good

 arch/arc/kernel/troubleshoot.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

-- 
2.7.4
