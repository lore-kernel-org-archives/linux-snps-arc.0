From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 31 Mar 2017 12:01:23 +0300
Subject: [PATCH 0/2] axs103: Add support of v1.1 firmware
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1490950885-9791-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Even though from software developer PoV not much has changed in v1.1 firmware
for axs103 board still there's an important modification introduced by
SNPS hardware team: slave cores kick-start procedure now differs and we need
to accommodate this change in U-Boot.

Alexey Brodkin (2):
  axs103: Clean-up smp_kick_all_cpus()
  axs103: Support slave core kick-start on axs103 v1.1 firmware

 board/synopsys/axs10x/axs10x.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

-- 
2.7.4
