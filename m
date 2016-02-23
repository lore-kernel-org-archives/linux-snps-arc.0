From: noamca@mellanox.com (Noam Camus)
Date: Tue, 23 Feb 2016 10:58:29 +0000
Subject: Interesting csd deadlock on ARC
In-Reply-To: <20160223103950.GJ6356@twins.programming.kicks-ass.net>
References: <56C6BA82.1060909@synopsys.com> <56CBEC66.2030401@synopsys.com>
 <20160223095824.GH6356@twins.programming.kicks-ass.net>
 <56CC32A3.5020804@synopsys.com>
 <20160223103950.GJ6356@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <HE1PR05MB162584392E880F4306659593AAA40@HE1PR05MB1625.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Peter Zijlstra [mailto:peterz at infradead.org] 
>Sent: Tuesday, February 23, 2016 12:40 PM

>The only requirement for irq_work is that it runs after the NMI completes and runs from regular IRQ context. >There are no strict interrupt priority requirements, only that it happens.

We here already use self IPI and irq_work on ARC (with no NMI concerns).
Please see patch at:
https://github.com/EZchip/linux/commit/e42556738e610295f917c79dae166373cd11de88

Noam
