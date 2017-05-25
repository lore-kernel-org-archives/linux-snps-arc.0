From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 25 May 2017 11:10:20 +0000
Subject: [PATCH 07/10] ARC: [plat-eznps] disabled stall counter due to a
 HW bug
In-Reply-To: <1495679660-9598-8-git-send-email-noamca@mellanox.com>
References: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
 <1495679660-9598-8-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495710620.5393.29.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

On Thu, 2017-05-25@05:34 +0300, Noam Camus wrote:
> From: Noam Camus <noamca at mellanox.com>
> 
> This counter represents threshold for consecutive stall that which
> trigger HW threads scheduling.
> Low values of this counter cause downgrade in performance
> and in the worst case even a livelock.
> 
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

Even though I don't know your architecture this change doesn't
make enough sense to me in absence of better explanation of what is
really done here.

I.e. how removal of those 2 lines above improve your situation.

-Alexey
