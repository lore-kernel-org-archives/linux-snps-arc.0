From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 5 Feb 2019 16:59:20 +0000
Subject: [PATCH] ARC: fix actionpoints configuration detection
References: <20190204184151.9113-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014642EC15@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 2/4/19 10:41 AM, Eugeniy Paltsev wrote:
> Fix reversed logic while actionpoints configuration (full/min)
> detection.
>
> Fixies: 7dd380c338f1e ("ARC: boot log: print Action point details")
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

LGTM.

Thx,
-vineet


> ---
>  arch/arc/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> index feb90093e6b1..def19b0ef8c6 100644
> --- a/arch/arc/kernel/setup.c
> +++ b/arch/arc/kernel/setup.c
> @@ -212,7 +212,7 @@ static void read_arc_build_cfg_regs(void)
>  	READ_BCR(ARC_REG_AP_BCR, ap);
>  	if (ap.ver) {
>  		cpu->extn.ap_num = 2 << ap.num;
> -		cpu->extn.ap_full = !!ap.min;
> +		cpu->extn.ap_full = !ap.min;
>  	}
>  
>  	READ_BCR(ARC_REG_SMART_BCR, bcr);
