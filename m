From: sboyd@codeaurora.org (Stephen Boyd)
Date: Tue, 19 Apr 2016 18:54:51 -0700
Subject: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
In-Reply-To: <5715F6AC.7090501@synopsys.com>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
 <20160415234631.GB4690@codeaurora.org>
 <5714B763.8010109@synopsys.com> <5714C9BA.8040004@synopsys.com>
 <5715F6AC.7090501@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160420015451.GH15324@codeaurora.org>
To: linux-snps-arc@lists.infradead.org

On 04/19, Jose Abreu wrote:
> 
> @Stephen: can you give some input so that I can submit a v6?
> 

I don't prefer putting the second register in the same DT node,
but that's really up to the DT reviewers to approve such a
design. The current binding has been acked by Rob right?

Assuming the new binding is acked/reviewed then that solution is
fine.

Otherwise, I still prefer two DTS files for the two different FPGA
versions. At the least, please use ioremap for any pointers that
you readl/writel here.

Beyond that, we should have a fixed rate source clk somewhere in
the software view of the clk tree, because that reflects reality.
Hardcoding the parent rate in the structure works, but doesn't
properly express the clk tree.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
