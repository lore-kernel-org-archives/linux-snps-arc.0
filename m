From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 28 Aug 2017 15:03:57 -0700
Subject: [PATCH] ARC fix for 4.13-final
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1503957838-21505-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Could you please add this ARC fixlet - which is a regression from pull req of
last week - but only shows up in our out of tree platform (slated for next
window).

Thx,
-Vineet

Alexey Brodkin (1):
  ARCv2: SMP: Mask only private-per-core IRQ lines on boot at core intc

 arch/arc/kernel/intc-arcv2.c   | 11 +++++++++--
 arch/arc/kernel/intc-compact.c |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.7.4
