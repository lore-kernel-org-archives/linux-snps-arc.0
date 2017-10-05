From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 5 Oct 2017 06:04:44 -0700
Subject: [PATCH v3] ARC: [plat-hsdk]: Add reset controller node to manage
 ethernet reset
In-Reply-To: <20170922164911.1125-1-Eugeniy.Paltsev@synopsys.com>
References: <20170922164911.1125-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <64d3fb1d-8d6e-3c5f-f143-c3e6a205a95b@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,

On 09/22/2017 09:49 AM, Eugeniy Paltsev wrote:
> DW ethernet controller on HSDK hangs sometimes after SW reset, so
> add reset node to make possible to reset DW ethernet controller HW.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> Changes v2 -> v3:
>    * Remove v1 suffix as we finaly got rid of v1 suffix in reset
>      driver and docs.
>    * Rename reset node to "reset-controller" for consistency with
>      the other bindings.
> 
> Changes v1 -> v2:
>    * Enable HSDK reset driver in hsdk_defconfig

Revisiting this given that changes to driver have been merged upstream: we 
currently carry a reset workaround for axs+ethernet, i.e. your patch

     ARC: [plat-axs103] Add temporary quirk to reset ethernet IP

But there's nothing similar for HSDK. IOW, we don't need to revert anything foro 
hsdk, after this gets applied ?

-Vineet
