From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed,  6 Feb 2019 20:22:26 +0300
Subject: [RFC 0/2] ARC: rework U-boot arguments handling
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190206172228.9261-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Eugeniy Paltsev (2):
  ARC: U-boot: check arguments paranoidly
  ARC: U-boot: check magic number passed from u-boot

 arch/arc/kernel/head.S  |  7 ++--
 arch/arc/kernel/setup.c | 91 +++++++++++++++++++++++++++++++++++++------------
 2 files changed, 74 insertions(+), 24 deletions(-)

-- 
2.14.5
