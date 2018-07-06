From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 6 Jul 2018 16:35:21 +0000
Subject: [PATCH v2] ARC: Configure APB GPIO controller on ARC HSDK platform
In-Reply-To: <5f3c59cdf0f4eb8bf22ca27031187fd866ffbecc.1530872741.git.gustavo.pimentel@synopsys.com>
References: <5f3c59cdf0f4eb8bf22ca27031187fd866ffbecc.1530872741.git.gustavo.pimentel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1b200ba226f7e509049f0ffbf4478ca0d80a67b0.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Gustavo,

On Fri, 2018-07-06@11:32 +0100, Gustavo Pimentel wrote:
> In case of HSDK we have intermediate INTC in for of DW APB GPIO controller
> which is used as a de-bounce logic for interrupt wires that come from
> outside the board.
> 
> We cannot use existing "irq-dw-apb-ictl" driver here because all input
> lines are routed to corresponding output lines but not muxed into one
> line (this is configured in RTL and we cannot change this in software).
> 
> But even if we add such a feature to "irq-dw-apb-ictl" driver that won't
> benefit us as higher-level INTC (in case of HSDK it is IDU) anyways has
> per-input control so adding fully-controller intermediate INTC will only
> bring some overhead on interrupt processing but no other benefits.
> 
> Thus we just do one-time configuration of DW APB GPIO controller and
> forget about it.
> 
> Based on implementation available on arch/arc/plat-axs10x/axs10x.c file.
> 
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel at synopsys.com>

Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
