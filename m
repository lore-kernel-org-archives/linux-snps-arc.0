From: sboyd@codeaurora.org (Stephen Boyd)
Date: Tue, 19 Dec 2017 11:11:42 -0800
Subject: [PATCH 0/4] ARC: Set initial core pll output frequency via DTS
In-Reply-To: <20171209135918.16720-1-Eugeniy.Paltsev@synopsys.com>
References: <20171209135918.16720-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171219191142.GC7997@codeaurora.org>
To: linux-snps-arc@lists.infradead.org

On 12/09, Eugeniy Paltsev wrote:
> Set initial core pll output frequency on HSDK and AXS103 via
> "assigned-clock-rates" property in device tree.  
> It will be applied at the core pll driver probing.
> 
> Eugeniy Paltsev (4):
>   ARC: [plat-hsdk]: Set initial core pll output frequency
>   ARC: [plat-hsdk]: Get rid of core pll frequency set in platform code
>   ARC: [plat-axs103]: Set initial core pll output frequency
>   ARC: [plat-axs103] refactor the quad core DT quirk code
> 

Patches look good to me.

Acked-by: Stephen Boyd <sboyd at codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
