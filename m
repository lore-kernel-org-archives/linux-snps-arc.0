From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 22 Feb 2018 14:26:44 +0000
Subject: [BUG] ARCv2: MCIP: GFRC: mcip cmd/readback concurrency
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1519309604.2982.27.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

To read any data from ARconnect we have special interface
which includes two AUX registers: MCIP_CMD and MCIP_READBACK.
We write command to MCIP_CMD and read data from MCIP_READBACK
after that.

We have only one instance of this registers per cluster, so we need
to held global lock before access them. This lock is defined
in arch/arc/kernel/mcip.c


To read GFRC value we also use?MCIP_CMD/MCIP_READBACK pair, but?
we take only local lock instead of global 'mcip_lock' lock:

---------->[drivers/clocksource/arc_timer.c]<----------
static u64 arc_read_gfrc(struct clocksource *cs)
{
	unsigned long flags;
	u32 l, h;

	local_irq_save(flags);

	__mcip_cmd(CMD_GFRC_READ_LO, 0);
	l = read_aux_reg(ARC_REG_MCIP_READBACK);

	__mcip_cmd(CMD_GFRC_READ_HI, 0);
	h = read_aux_reg(ARC_REG_MCIP_READBACK);

	local_irq_restore(flags);

	return (((u64)h) << 32) | l;
}
-------------------------->8---------------------------

So we can break any command (like inter core interrupt send)
which uses MCIP_CMD/MCIP_READBACK pair when we read time from GFRC. 

One possible solution is to create function like gfrc_read() in mcip.c
which will use global 'mcip_lock' and call it from current 'arc_read_gfrc'
function.

Or we can create a wrapper like 'mcip_read' in?arch/arc/kernel/mcip.c
with next functionality:
------->8--------
u32 mcip_read(u32 cmd)
{
	u32 ret;

	raw_spin_lock_irqsave(&mcip_lock);

	__mcip_cmd(cmd, 0);
	ret = read_aux_reg(ARC_REG_MCIP_READBACK);

	raw_spin_unlock_irqrestore(&mcip_lock);

	return ret;
}
------->8--------

-- 
?Eugeniy Paltsev
