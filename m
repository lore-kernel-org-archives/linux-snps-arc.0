From: marc.zyngier@arm.com (Marc Zyngier)
Date: Mon, 11 Apr 2016 13:53:26 +0100
Subject: [PATCH v8 3/3] irqchip: add nps Internal and external irqchips
In-Reply-To: <1459707299-31564-4-git-send-email-noamca@mellanox.com>
References: <1459707299-31564-1-git-send-email-noamca@mellanox.com>
 <1459707299-31564-4-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <570B9E46.7050402@arm.com>
To: linux-snps-arc@lists.infradead.org

On 03/04/16 19:14, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
> 
> Adding EZchip NPS400 support.
> Internal interrupts are handled by Multi Thread Manager (MTM)
> Once interrupt is serviced MTM is acked for deactivating the interrupt.
> External interrupts are handled by MTM as well as at Global Interrupt
> Controller (GIC) e.g. serial and network devices.
> 
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> Cc: Thomas Gleixner <tglx at linutronix.de>
> Cc: Jason Cooper <jason at lakedaemon.net>
> Cc: Marc Zyngier <marc.zyngier at arm.com>
> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>

Acked-by: Marc Zyngier <marc.zyngier at arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
