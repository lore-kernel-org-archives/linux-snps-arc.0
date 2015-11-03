From: noamc@ezchip.com (Noam Camus)
Date: Tue, 3 Nov 2015 14:02:52 +0000
Subject: [PATCH v1 16/20] ARC: [plat-eznps] Use dedicated cpu_relax()
In-Reply-To: <20151102092142.GL17308@twins.programming.kicks-ass.net>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-17-git-send-email-noamc@ezchip.com>
 <20151102092142.GL17308@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB114146CFA891AF9010C8EE61D62B0@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

From: Peter Zijlstra [mailto:peterz@infradead.org] 
Sent: Monday, November 02, 2015 11:22 AM


> At which point you might want to revisit:

> arch/arc/include/asm/processor.h:#define cpu_relax_lowlatency() cpu_relax()
Thanks, I will define this as barrier since cpu_relax() may take out current logical CPU for many cycles.
