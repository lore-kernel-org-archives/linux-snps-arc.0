From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 25 May 2017 11:04:13 +0000
Subject: [PATCH 03/10] ARC: typo fix in mm/fault.c
In-Reply-To: <1495679660-9598-4-git-send-email-noamca@mellanox.com>
References: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
 <1495679660-9598-4-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495710253.5393.24.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

On Thu, 2017-05-25@05:34 +0300, Noam Camus wrote:
> From: Liav Rehana <liavr at mellanox.com>
> 
> Signed-off-by: Liav Rehana <liavr at mellanox.com>
> Signed-off-by: Noam Camus <noamca at mellanox.com>
> ---
> ?arch/arc/mm/fault.c |????2 +-
> ?1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
> index 162c975..a0b7bd6 100644
> --- a/arch/arc/mm/fault.c
> +++ b/arch/arc/mm/fault.c
> @@ -207,7 +207,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
> ?	/* Are we prepared to handle this kernel fault?
> ?	?*
> ?	?* (The kernel has valid exception-points in the source
> -	?*??when it acesses user-memory. When it fails in one
> +	?*??when it accesses user-memory. When it fails in one
> ?	?*??of those points, we find it in a table and do a jump
> ?	?*??to some fixup code that loads an appropriate error
> ?	?*??code)

Reviewed-by: Alexey Brodkin <abrodkin at synopsys.com>
