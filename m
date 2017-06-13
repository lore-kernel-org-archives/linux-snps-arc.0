From: noamca@mellanox.com (Noam Camus)
Date: Tue, 13 Jun 2017 17:03:48 +0300
Subject: [PATCH v2 04/12] ARC: Allow irq threading
In-Reply-To: <1497362636-30353-1-git-send-email-noamca@mellanox.com>
References: <1497362636-30353-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1497362636-30353-5-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

Working with NPS400 we noticed that there is a possibility of L1
interrupt nesting that may run out kernel stack.
The scenario include serving invoke_softirqs() from irq_exit()
and once local_irq_enable() called can hit another one before we
managed to restore last one and pop some place from kernel stack.

Serving softirqs at dedicated kernel thread may mitigate this.
We see that many architectures, including x86, behave like this.

Note 1: All interrupts which must be non threaded
should be marked IRQF_NO_THREAD.
Note 2: using kernel param "threadirqs" is needed to actually
turn this on. This configuration is only a preperation.

Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 arch/arc/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index a545969..f464f97 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -33,6 +33,7 @@ config ARC
 	select HAVE_OPROFILE
 	select HAVE_PERF_EVENTS
 	select HANDLE_DOMAIN_IRQ
+	select IRQ_FORCED_THREADING
 	select IRQ_DOMAIN
 	select MODULES_USE_ELF_RELA
 	select NO_BOOTMEM
-- 
1.7.1
