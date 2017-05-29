From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 29 May 2017 15:15:15 +0000
Subject: [PATCH v2 07/11] ARC: [plat-eznps] disabled stall counter due
 to a HW bug
In-Reply-To: <1495954328-28736-8-git-send-email-noamca@mellanox.com>
References: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
 <1495954328-28736-8-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1496070914.7990.19.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

On Sun, 2017-05-28@09:52 +0300, Noam Camus wrote:
> From: Noam Camus <noamca at mellanox.com>
> 
> This counter represents threshold for consecutive stall that which
> trigger HW threads scheduling.
> When this feature is enabled low values of this counter cause
> downgrade in performance and in the worst case even a livelock.
> 
> Remove those couple of lines and resort to HW reset value i.e.
> this feature is disabled (.sten field equals 0).

Looks like you made a change I was asking for here.
But there's no mention of the change so it's easy to not note
that change. Not critical but please add a changelog next time?
even if it's only a comment message that was modified since
the previous revision.

Otherwise...

Reviewed-by: Alexey Brodkin <abrodkin at synopsys.com>

> Signed-off-by: Noam Camus <noamca at mellanox.com>
> ---
> ?arch/arc/plat-eznps/mtm.c |????2 --
> ?1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arc/plat-eznps/mtm.c b/arch/arc/plat-eznps/mtm.c
> index aaaaffd..e0cb36b 100644
> --- a/arch/arc/plat-eznps/mtm.c
> +++ b/arch/arc/plat-eznps/mtm.c
> @@ -119,8 +119,6 @@ void mtm_enable_core(unsigned int cpu)
> ?	mt_ctrl.value = 0;
> ?	mt_ctrl.hsen = 1;
> ?	mt_ctrl.hs_cnt = MT_CTRL_HS_CNT;
> -	mt_ctrl.sten = 1;
> -	mt_ctrl.st_cnt = MT_CTRL_ST_CNT;
> ?	mt_ctrl.mten = 1;
> ?	write_aux_reg(CTOP_AUX_MT_CTRL, mt_ctrl.value);
> ?
