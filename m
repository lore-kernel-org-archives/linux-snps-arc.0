From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 28 Jun 2016 10:00:56 +0530
Subject: [PATCH] arc: warn only once if DW2_UNWIND is disabled
In-Reply-To: <1466668839-28210-1-git-send-email-abrodkin@synopsys.com>
References: <1466668839-28210-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5771FD80.1090906@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 23 June 2016 01:30 PM, Alexey Brodkin wrote:
> If CONFIG_ARC_DW2_UNWIND is disabled every time arc_unwind_core()
> gets called following message gets printed in debug console:
> ----------------->8---------------
> CONFIG_ARC_DW2_UNWIND needs to be enabled
> ----------------->8---------------
> 
> That message makes sense if user indeed wants to see a backtrace or
> get nice function call-graphs in perf but what if user disabled
> unwinder for the purpose? Why pollute his debug console?
> 
> So instead we'll warn user about possibly missing feature once and
> let him decide if that was what he or she really wanted.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: stable at vger.kernel.org  [3.18+]

Does this really need to be stable backport ?

> ---
>  arch/arc/kernel/stacktrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arc/kernel/stacktrace.c b/arch/arc/kernel/stacktrace.c
> index e0efff1..b9192a6 100644
> --- a/arch/arc/kernel/stacktrace.c
> +++ b/arch/arc/kernel/stacktrace.c
> @@ -142,7 +142,7 @@ arc_unwind_core(struct task_struct *tsk, struct pt_regs *regs,
>  	 * prelogue is setup (callee regs saved and then fp set and not other
>  	 * way around
>  	 */
> -	pr_warn("CONFIG_ARC_DW2_UNWIND needs to be enabled\n");
> +	pr_warn_once("CONFIG_ARC_DW2_UNWIND needs to be enabled\n");
>  	return 0;
>  
>  #endif
> 
