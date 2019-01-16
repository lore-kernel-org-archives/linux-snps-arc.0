From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 16 Jan 2019 08:21:25 -0800
Subject: [PATCH] etnaviv: allow to build on ARC
In-Reply-To: <20190114163157.20114-1-Eugeniy.Paltsev@synopsys.com>
References: <20190114163157.20114-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190116162125.GA16326@infradead.org>
To: linux-snps-arc@lists.infradead.org

On Mon, Jan 14, 2019@07:31:57PM +0300, Eugeniy Paltsev wrote:
> ARC HSDK SoC has Vivante GPU IP so allow build etnaviv for ARC.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  drivers/gpu/drm/etnaviv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/Kconfig b/drivers/gpu/drm/etnaviv/Kconfig
> index 342591a1084e..49a9957c3373 100644
> --- a/drivers/gpu/drm/etnaviv/Kconfig
> +++ b/drivers/gpu/drm/etnaviv/Kconfig
> @@ -2,7 +2,7 @@
>  config DRM_ETNAVIV
>  	tristate "ETNAVIV (DRM support for Vivante GPU IP cores)"
>  	depends on DRM
> -	depends on ARCH_MXC || ARCH_DOVE || ARM || COMPILE_TEST
> +	depends on ARCH_MXC || ARCH_DOVE || ARM || ARC || COMPILE_TEST

Is there any reason to not just remove the dependencies entirely?
It seems like it could literally build everywhere, and who knows what
other SOCs the IP blocks end up in sooner or later?
