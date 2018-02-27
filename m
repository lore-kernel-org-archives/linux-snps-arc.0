From: Jisheng.Zhang@synaptics.com (Jisheng Zhang)
Date: Tue, 27 Feb 2018 11:02:45 +0800
Subject: [PATCH 0/2 v3] mmc: dw_mmc: Fix DTO/STO timeout overflow
 calculation
In-Reply-To: <20180226143413.44134-1-Evgeniy.Didin@synopsys.com>
References: <20180226143413.44134-1-Evgeniy.Didin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180227110245.6d78ff23@xhacker.debian>
To: linux-snps-arc@lists.infradead.org

On Mon, 26 Feb 2018 17:34:11 +0300 Evgeniy Didin  wrote:

> For some 32-bit architectures calculation of DTO and STO timeout can be incorrect
> due to multiply overflow. Lets prevent this by casting multiply and result to u64.
> 
> Suggested by Jisheng Zhang.
> Switch DIV_ROUND_UP macro to DIV_ROUND_UP_ULL is not reasonable
> because overflow happens on multiply and DIV_ROUND_UP_ULL helps
> with sum overflow.

hmmm, I mean something as below:

-cto_ms = DIV_ROUND_UP(MSEC_PER_SEC * cto_clks * cto_div, host->bus_hz);
+cto_ms = DIV_ROUND_UP_ULL((u64)MSEC_PER_SEC * cto_clks * cto_div, host->bus_hz);

This could avoid build error in arm case.

> 
> ---
> Changes since v2:
> -add fix for cto_ms
> 
> Evgeniy Didin (2):
>   mmc: dw_mmc: Fix the DTO timeout overflow calculation for 32-bit
>     systems
>   mmc: dw_mmc: Fix the CTO overflow calculation for 32-bit systems

These two patches could be folded into one patch?

Thanks
