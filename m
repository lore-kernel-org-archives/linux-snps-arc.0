From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 29 Apr 2016 16:19:36 +0530
Subject: [PATCH 2/2 v2] ARC: [axs10x] Specify reserved memory for frame
 buffer
In-Reply-To: <1461853196-15599-3-git-send-email-abrodkin@synopsys.com>
References: <1461853196-15599-1-git-send-email-abrodkin@synopsys.com>
 <1461853196-15599-3-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57233C40.9040909@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 28 April 2016 07:49 PM, Alexey Brodkin wrote:
> Even though for AXS101 (which sorts ARC770 CPU) IOC is not
> an option for a sake of keeping one DT description for the
> base-board (axs10x_mb.dtsi) we're still defining reserved
> memory location in the very end of DDR.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>

Acked-by: Vineet Gupta <vgupta at synopsys.com>
