From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 26 May 2016 17:53:29 +0000
Subject: [PATCH 1/1] net: nps_enet: Disable interrupts before napi
 reschedule
In-Reply-To: <1464264006-26627-1-git-send-email-eladkan@mellanox.com>
References: <1464264006-26627-1-git-send-email-eladkan@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464285174.4578.36.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Elad,

On Thu, 2016-05-26@15:00 +0300, Elad Kanfi wrote:
> From: Elad Kanfi <eladkan at mellanox.com>
> 
> Since NAPI works by shutting down event interrupts when theres
> work and turning them on when theres none, the net driver must
> make sure that interrupts are disabled when it reschedules polling.
> By calling napi_reschedule, the driver switches to polling mode,
> therefor there should be no interrupt interference.
> Any received packets will be handled in nps_enet_poll by polling the HW
> indication of received packet until all packets are handled.
> 
> Signed-off-by: Elad Kanfi <eladkan at mellanox.com>
> Acked-by: Noam Camus <noamca at mellanox.com>
> ---
> ?drivers/net/ethernet/ezchip/nps_enet.c |????4 +++-
> ?1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ezchip/nps_enet.c b/drivers/net/ethernet/ezchip/nps_enet.c
> index 085f912..06f0317 100644
> --- a/drivers/net/ethernet/ezchip/nps_enet.c
> +++ b/drivers/net/ethernet/ezchip/nps_enet.c
> @@ -205,8 +205,10 @@ static int nps_enet_poll(struct napi_struct *napi, int budget)
> ?		?* re-adding ourselves to the poll list.
> ?		?*/
> ?
> -		if (priv->tx_skb && !tx_ctrl_ct)
> +		if (priv->tx_skb && !tx_ctrl_ct) {
> +			nps_enet_reg_set(priv, NPS_ENET_REG_BUF_INT_ENABLE, 0);
> ?			napi_reschedule(napi);
> +		}
> ?	}
> ?
> ?	return work_done;

We just bumped into the same problem (data exchange hangs on the very first "ping")
with released Linux v4.6 and linux-next on our nSIM OSCI virtual platform.

I believe it was commit?05c00d82f4d1 ("net: nps_enet: bug fix - handle lost tx interrupts")
that introduced the problem. At least reverting it I got networking working.

And indeed that patch fixes mentioned issue.
In other words...

Tested-by: Alexey Brodkin <abrodkin at synopsys.com>

P.S. Given my observation is correct please add following to your commit
message if you ever do a respin:
------------------>8---------------
Fixes: 05c00d82f4d1 ("net: nps_enet: bug fix - handle lost tx interrupts")

Cc: <stable at vger.kernel.org> # 4.6.x
------------------>8---------------
