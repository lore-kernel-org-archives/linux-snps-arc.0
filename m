From: keescook@chromium.org (Kees Cook)
Date: Mon, 5 Aug 2019 13:18:14 -0700
Subject: [PATCH] ARC: unwind: Mark expected switch fall-throughs
In-Reply-To: <20190805193232.GA12826@embeddedor>
References: <20190805193232.GA12826@embeddedor>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201908051318.5B1EB8106@keescook>
To: linux-snps-arc@lists.infradead.org

On Mon, Aug 05, 2019@02:32:32PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warnings (Building: haps_hs_defconfig arc):
> 
> arch/arc/kernel/unwind.c:827:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
> arch/arc/kernel/unwind.c:836:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo at embeddedor.com>

Reviewed-by: Kees Cook <keescook at chromium.org>

-Kees

> ---
>  arch/arc/kernel/unwind.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
> index c2663fce7f6c..445e4d702f43 100644
> --- a/arch/arc/kernel/unwind.c
> +++ b/arch/arc/kernel/unwind.c
> @@ -826,7 +826,7 @@ static int processCFI(const u8 *start, const u8 *end, unsigned long targetLoc,
>  			case DW_CFA_def_cfa:
>  				state->cfa.reg = get_uleb128(&ptr.p8, end);
>  				unw_debug("cfa_def_cfa: r%lu ", state->cfa.reg);
> -				/*nobreak*/
> +				/* fall through */
>  			case DW_CFA_def_cfa_offset:
>  				state->cfa.offs = get_uleb128(&ptr.p8, end);
>  				unw_debug("cfa_def_cfa_offset: 0x%lx ",
> @@ -834,7 +834,7 @@ static int processCFI(const u8 *start, const u8 *end, unsigned long targetLoc,
>  				break;
>  			case DW_CFA_def_cfa_sf:
>  				state->cfa.reg = get_uleb128(&ptr.p8, end);
> -				/*nobreak */
> +				/* fall through */
>  			case DW_CFA_def_cfa_offset_sf:
>  				state->cfa.offs = get_sleb128(&ptr.p8, end)
>  				    * state->dataAlign;
> -- 
> 2.22.0
> 

-- 
Kees Cook
