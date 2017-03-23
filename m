From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 23 Mar 2017 10:37:51 -0700
Subject: [PATCH] arc: vdk: Fix support of UIO
In-Reply-To: <1490290485-16332-1-git-send-email-abrodkin@synopsys.com>
References: <1490290485-16332-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b2d81e8a-b2d0-0eb0-295a-f91fb58f4563@synopsys.com>
To: linux-snps-arc@lists.infradead.org

+CC Jos !

-Vineet

On 03/23/2017 10:34 AM, Alexey Brodkin wrote:
> MotherBoard section has its "ranges" set to 0xE000_0000-0xF000_0000.
> But UIO node maps 4 different areas in different memory locations
> and all outside MB's ranges.
>
> That obviously breaks UIO mappings in runtime.
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Ruud Derwig <rderwig at synopsys.com>
> Cc: stable at vger.kernel.org
> ---
>  arch/arc/boot/dts/vdk_axs10x_mb.dtsi | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
> index f0df59b23e21..459fc656b759 100644
> --- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
> +++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
> @@ -112,13 +112,19 @@
>  			interrupts = <7>;
>  			bus-width = <4>;
>  		};
> +	};
>  
> -		/* Embedded Vision subsystem UIO mappings; only relevant for EV VDK */
> -		uio_ev: uio at 0xD0000000 {
> -			compatible = "generic-uio";
> -			reg = <0xD0000000 0x2000 0xD1000000 0x2000 0x90000000 0x10000000 0xC0000000 0x10000000>;
> -			reg-names = "ev_gsa", "ev_ctrl", "ev_shared_mem", "ev_code_mem";
> -			interrupts = <23>;
> -		};
> +	/*
> +	 * Embedded Vision subsystem UIO mappings; only relevant for EV VDK
> +	 *
> +	 * This node is intentionally put outside of MB above becase
> +	 * it maps areas outside of MB's 0xEz-0xFz.
> +	 */
> +	uio_ev: uio at 0xD0000000 {
> +		compatible = "generic-uio";
> +		reg = <0xD0000000 0x2000 0xD1000000 0x2000 0x90000000 0x10000000 0xC0000000 0x10000000>;
> +		reg-names = "ev_gsa", "ev_ctrl", "ev_shared_mem", "ev_code_mem";
> +		interrupt-parent = <&mb_intc>;
> +		interrupts = <23>;
>  	};
>  };
