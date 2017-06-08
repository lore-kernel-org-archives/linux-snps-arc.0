From: noamca@mellanox.com (Noam Camus)
Date: Thu,  8 Jun 2017 18:20:27 +0300
Subject: [PATCH 03/11] ARC: Allow irq threading
In-Reply-To: <1496935235-46507-1-git-send-email-noamca@mellanox.com>
References: <1496935235-46507-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1496935235-46507-4-git-send-email-noamca@mellanox.com>
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
index 92c9128..dc1df6f 100644
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
