From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 20 Dec 2017 14:49:52 -0800
Subject: [PATCH 0/2] ARC __builtin_trap handling
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1513810194-8377-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Vineet Gupta (2):
  ARC: handle gcc generated __builtin_trap()
  ARC: handle gcc generated __builtin_trap for older compiler

 arch/arc/kernel/traps.c        | 14 ++++++++++++++
 arch/arc/kernel/troubleshoot.c |  3 +++
 2 files changed, 17 insertions(+)

-- 
2.7.4
