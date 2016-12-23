From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 22 Dec 2016 16:34:02 -0800
Subject: [PATCH 2/2] arc: Fix xCCM size check
In-Reply-To: <1482415750-5471-3-git-send-email-abrodkin@synopsys.com>
References: <1482415750-5471-1-git-send-email-abrodkin@synopsys.com>
 <1482415750-5471-3-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <75d86ac5-ed58-99d4-3c6b-97d56b90ed36@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/22/2016 06:09 AM, Alexey Brodkin wrote:
> CONFIG_ARC_ICCM_SZ in menuconfig is specified in kB while
> "cpu->Xccm.sz" contains value in bytes thus direct comparison fails
> leading to boot-time panic like that:
> ----------------------->8---------------------
> IDENTITY        : ARCVER [0x52] ARCNUM [0x1] CHIPID [ 0x0]
> processor [1]   : ARC HS38 R2.1 (ARCv2 ISA)
> Timers          : Timer0 Timer1 Local-64-bit-Ctr (not used)
> ISA Extn        : atomic ll64 unalign (not used)
>                 : mpy[opt 9] div_rem norm barrel-shift swap minmax swape
> BPU             : full match, cache:2048, Predict Table:16384
> MMU [v0]        : 0k PAGE, JTLB 0 (0x0), uDTLB 0, uITLB 0
> I-Cache         : N/A
> D-Cache         : N/A
> Peripherals     : 0xf0000000, IO-Coherency (disabled)
> Vector Table    : 0x80000000
> FPU             : SP DP
> DEBUG           : ActionPoint smaRT RTT
> Extn [CCM]      : DCCM @ e0000000, 256 KB / ICCM: @ 60000000, 256 KB
> OS ABI [v4]     : 64-bit data any register aligned
> Extn [SMP]      : ARConnect (v2): 2 cores with IPI IDU DEBUG GFRC
> Kernel panic - not syncing: Linux built with incorrect DCCM Size
>
> ---[ end Kernel panic - not syncing: Linux built with incorrect DCCM Size
> ----------------------->8---------------------
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Igor Guryanov <guryanov at synopsys.com>
> Cc: stable at vger.kernel.org
> ---
>  arch/arc/kernel/setup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> index ee574f37f365..601dab6fe5e0 100644
> --- a/arch/arc/kernel/setup.c
> +++ b/arch/arc/kernel/setup.c
> @@ -333,12 +333,12 @@ static void arc_chk_core_config(void)
>  	if ((unsigned int)__arc_dccm_base != cpu->dccm.base_addr)
>  		panic("Linux built with incorrect DCCM Base address\n");
>  
> -	if (CONFIG_ARC_DCCM_SZ != cpu->dccm.sz)
> +	if (CONFIG_ARC_DCCM_SZ != TO_KB(cpu->dccm.sz))

Could we just avoid this existing TO_KB non sense in multiple places by keeping
the *ccm.sz unit consistent with CONFIG_ARC_*CCM_SZ ?
so
-            cpu->iccm.sz = 4096 << iccm.sz;    /* 8K to 512K */
+            cpu->iccm.sz = 4 << iccm.sz;    /* 8K to 512K */

Since we only want to keep ccm size to kb granularity

And while at it, rename @sz placeholder in bcr_(i|d)ccm_arc(v2,compact) to sz_k

-Vineet

>  		panic("Linux built with incorrect DCCM Size\n");
>  #endif
>  
>  #ifdef CONFIG_ARC_HAS_ICCM
> -	if (CONFIG_ARC_ICCM_SZ != cpu->iccm.sz)
> +	if (CONFIG_ARC_ICCM_SZ != TO_KB(cpu->iccm.sz))
>  		panic("Linux built with incorrect ICCM Size\n");
>  #endif
>  
