From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 22 Dec 2016 17:00:59 -0800
Subject: [PATCH] arc: enable unaligned access in kernel mode
In-Reply-To: <1482320454-5731-1-git-send-email-abrodkin@synopsys.com>
References: <1482320454-5731-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3d30577c-3994-a1b4-385f-38094f7f7f36@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/21/2016 03:40 AM, Alexey Brodkin wrote:
> This enables misaligned access handling even in kernel mode.
> Some wireless drivers (ath9k-htc and mt7601u) use misaligned accesses
> here and there and to cope with that without fixing stuff in the drivers
> we're just gracefully handling it on ARC.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: John Crispin <john at phrozen.org>
> ---
>  arch/arc/kernel/unaligned.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arc/kernel/unaligned.c b/arch/arc/kernel/unaligned.c
> index abd961f3e763..58b7415e47ca 100644
> --- a/arch/arc/kernel/unaligned.c
> +++ b/arch/arc/kernel/unaligned.c
> @@ -205,8 +205,8 @@ int misaligned_fixup(unsigned long address, struct pt_regs *regs,
>  	struct disasm_state state;
>  	char buf[TASK_COMM_LEN];
>  
> -	/* handle user mode only and only if enabled by sysadmin */
> -	if (!user_mode(regs) || !unaligned_enabled)
> +	/* handle only if enabled by sysadmin */
> +	if (!unaligned_enabled)

This in theory seems OK but AFAIKR we discussed this internally for STAR
9000974739- [openwrt/AXS101] unaligned access on connection of the first wireless
client

One of the crash logs had Interrupt Active while failing to emulate unaligned
access - despite this patch.

> [ECR   ]: 0x00230400 => Misaligned r/w from 0x9e67a22b
> [   51.630000] [EFA   ]: 0x9e67a22b
> [   51.630000] [BLINK ]: br_multicast_add_group+0x246/0x284
> [   51.630000] [ERET  ]: br_multicast_add_group+0xae/0x284
> [   51.650000] [STAT32]: 0x0000020e : K       A1 E2 E1
                                               ^^^^

It seemed to me at the time that allowing this from kernel mode might require more
things - like not allowing preemption or disabling further interrupts ? I looked
in CRM but can't find more details - do u remember !

Can we try and reproduce that new-issue-after-patch or perhaps just add this patch
as it is and deal with any fallouts later ?

-Vineet

>  		return 1;
>  
>  	if (no_unaligned_warning) {
> 
