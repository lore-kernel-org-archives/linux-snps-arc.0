From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 25 May 2017 11:00:59 +0000
Subject: [PATCH 06/10] ARC: [plat-eznps] Fix TLB Errata
In-Reply-To: <1495679660-9598-7-git-send-email-noamca@mellanox.com>
References: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
 <1495679660-9598-7-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495710058.5393.23.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

On Thu, 2017-05-25@05:34 +0300, Noam Camus wrote:
> From: Noam Camus <noamca at mellanox.com>
> 
> Due to a HW bug in NPS400 we get from time to time false TLB miss.
> Workaround this by validating each miss.
> 
> Signed-off-by: Noam Camus <noamca at mellanox.com>
> ---
> ?arch/arc/mm/tlbex.S |???10 ++++++++++
> ?1 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
> index b30e4e3..1d48723 100644
> --- a/arch/arc/mm/tlbex.S
> +++ b/arch/arc/mm/tlbex.S
> @@ -274,6 +274,13 @@ ex_saved_reg1:
> ?.macro COMMIT_ENTRY_TO_MMU
> ?#if (CONFIG_ARC_MMU_VER < 4)
> ?
> +#ifdef CONFIG_EZNPS_MTM_EXT
> +	/* verify if entry for this vaddr+ASID already exists */
> +	sr????TLBProbe, [ARC_REG_TLBCOMMAND]
> +	lr????r0, [ARC_REG_TLBINDEX]
> +	bbit0 r0, 31, 88f
> +#endif

That's funny. I think we used to have something like that in the past.


> ?	/* Get free TLB slot: Set = computed from vaddr, way = random */
> ?	sr??TLBGetIndex, [ARC_REG_TLBCOMMAND]
> ?
> @@ -287,6 +294,9 @@ ex_saved_reg1:
> ?#else
> ?	sr TLBInsertEntry, [ARC_REG_TLBCOMMAND]
> ?#endif
> +#ifdef CONFIG_EZNPS_MTM_EXT
> +88:
> +#endif

Not sure if label itself required wrapping in ifdefs. It just makes code bulkier
and harder to read.

-Alexey
