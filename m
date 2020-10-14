Return-Path: <SRS0=Sdks=DV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8824EC433DF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 18:56:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0377020691
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 18:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DSY0J9gl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0377020691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JcKtnPo1xx9W8uZwC37s29yfCEUy5rIhiFtn5zr6Gf0=; b=DSY0J9gldBotg5MBOYNjI8wWi
	5gTYehO0Ad7NlYqh9MsHIbjRvdbyS7JaHKu7lkgXuJHbh2YjezbQLVWH2e4EuQ+eA/adIrQAzCIcS
	w1DhU66AMp1KOj7C2mGTWwTUWOR4z1BlcdvwkHc8il1VMzvGewv2Wz1qUVkCJ1sdsyjJhslh1HUym
	UE5UdvryXPqr7LKRIufvLQSRVDkIZtAjHmg87zbaHJInJVVYR83uDhUei1WRG0p9mEgZxneAei/pm
	cdIaA3Dp72879qyqs1KnmKlAIKsYuH3KbFMq2U9YJIOpE0DgN4i4ZsB96cP8HYYhSo1b51778bP2+
	x0SG126zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSlwu-0007Cy-On; Wed, 14 Oct 2020 18:56:32 +0000
Received: from aposti.net ([89.234.176.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSlwo-0007Bk-UU; Wed, 14 Oct 2020 18:56:28 +0000
Date: Wed, 14 Oct 2020 20:56:01 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-Id: <DLG7IQ.15UXZI2H6RYC3@crapouillou.net>
In-Reply-To: <20201014101402.18271-19-Sergey.Semin@baikalelectronics.ru>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-19-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_145627_201082_2C4015D1 
X-CRM114-Status: GOOD (  14.72  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Mackerras <paulus@samba.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Wei Xu <xuwei5@hisilicon.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Kevin Hilman <khilman@baylibre.com>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@synopsys.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



Le mer. 14 oct. 2020 =E0 13:14, Serge Semin =

<Sergey.Semin@baikalelectronics.ru> a =E9crit :
> In accordance with the Generic EHCI/OHCI bindings the corresponding =

> node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Let's fix the DTS files, which have the nodes defined =

> with
> incompatible names.
> =

> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> =

> ---
> =

> Please, test the patch out to make sure it doesn't brake the =

> dependent DTS
> files. I did only a manual grepping of the possible nodes =

> dependencies.
> ---
>  arch/arc/boot/dts/axs10x_mb.dtsi               | 4 ++--
>  arch/arc/boot/dts/hsdk.dts                     | 4 ++--
>  arch/arc/boot/dts/vdk_axs10x_mb.dtsi           | 2 +-
>  arch/arm/boot/dts/bcm5301x.dtsi                | 4 ++--
>  arch/arm/boot/dts/bcm53573.dtsi                | 4 ++--
>  arch/arm/boot/dts/hisi-x5hd2.dtsi              | 4 ++--
>  arch/arm/boot/dts/lpc18xx.dtsi                 | 4 ++--
>  arch/arm/boot/dts/stm32mp151.dtsi              | 4 ++--
>  arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 4 ++--
>  arch/arm64/boot/dts/hisilicon/hip06.dtsi       | 4 ++--
>  arch/arm64/boot/dts/hisilicon/hip07.dtsi       | 4 ++--
>  arch/mips/boot/dts/ingenic/jz4740.dtsi         | 2 +-
>  arch/mips/boot/dts/ingenic/jz4770.dtsi         | 2 +-

For jz4740.dtsi and jz4770.dtsi:
Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

>  arch/mips/boot/dts/mti/sead3.dts               | 2 +-
>  arch/mips/boot/dts/ralink/mt7628a.dtsi         | 2 +-
>  arch/powerpc/boot/dts/akebono.dts              | 6 +++---
>  16 files changed, 28 insertions(+), 28 deletions(-)
> =

> diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi =

> b/arch/arc/boot/dts/axs10x_mb.dtsi
> index 99d3e7175bf7..b64435385304 100644
> --- a/arch/arc/boot/dts/axs10x_mb.dtsi
> +++ b/arch/arc/boot/dts/axs10x_mb.dtsi
> @@ -87,13 +87,13 @@ gmac: ethernet@18000 {
>  			mac-address =3D [00 00 00 00 00 00]; /* Filled in by U-Boot */
>  		};
> =

> -		ehci@40000 {
> +		usb@40000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D < 0x40000 0x100 >;
>  			interrupts =3D < 8 >;
>  		};
> =

> -		ohci@60000 {
> +		usb@60000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D < 0x60000 0x100 >;
>  			interrupts =3D < 8 >;
> diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
> index dcaa44e408ac..fdd4f7f635d3 100644
> --- a/arch/arc/boot/dts/hsdk.dts
> +++ b/arch/arc/boot/dts/hsdk.dts
> @@ -234,7 +234,7 @@ phy0: ethernet-phy@0 { /* Micrel KSZ9031 */
>  			};
>  		};
> =

> -		ohci@60000 {
> +		usb@60000 {
>  			compatible =3D "snps,hsdk-v1.0-ohci", "generic-ohci";
>  			reg =3D <0x60000 0x100>;
>  			interrupts =3D <15>;
> @@ -242,7 +242,7 @@ ohci@60000 {
>  			dma-coherent;
>  		};
> =

> -		ehci@40000 {
> +		usb@40000 {
>  			compatible =3D "snps,hsdk-v1.0-ehci", "generic-ehci";
>  			reg =3D <0x40000 0x100>;
>  			interrupts =3D <15>;
> diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi =

> b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
> index cbb179770293..90a412026e64 100644
> --- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
> +++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
> @@ -46,7 +46,7 @@ ethernet@18000 {
>  			clock-names =3D "stmmaceth";
>  		};
> =

> -		ehci@40000 {
> +		usb@40000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D < 0x40000 0x100 >;
>  			interrupts =3D < 8 >;
> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi =

> b/arch/arm/boot/dts/bcm5301x.dtsi
> index 0016720ce530..bf5656d79a55 100644
> --- a/arch/arm/boot/dts/bcm5301x.dtsi
> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
> @@ -261,7 +261,7 @@ usb2: usb2@21000 {
> =

>  			interrupt-parent =3D <&gic>;
> =

> -			ehci: ehci@21000 {
> +			ehci: usb@21000 {
>  				#usb-cells =3D <0>;
> =

>  				compatible =3D "generic-ehci";
> @@ -283,7 +283,7 @@ ehci_port2: port@2 {
>  				};
>  			};
> =

> -			ohci: ohci@22000 {
> +			ohci: usb@22000 {
>  				#usb-cells =3D <0>;
> =

>  				compatible =3D "generic-ohci";
> diff --git a/arch/arm/boot/dts/bcm53573.dtsi =

> b/arch/arm/boot/dts/bcm53573.dtsi
> index 4af8e3293cff..51546fccc616 100644
> --- a/arch/arm/boot/dts/bcm53573.dtsi
> +++ b/arch/arm/boot/dts/bcm53573.dtsi
> @@ -135,7 +135,7 @@ usb2: usb2@4000 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> =

> -			ehci: ehci@4000 {
> +			ehci: usb@4000 {
>  				compatible =3D "generic-ehci";
>  				reg =3D <0x4000 0x1000>;
>  				interrupt-parent =3D <&gic>;
> @@ -155,7 +155,7 @@ ehci_port2: port@2 {
>  				};
>  			};
> =

> -			ohci: ohci@d000 {
> +			ohci: usb@d000 {
>  				#usb-cells =3D <0>;
> =

>  				compatible =3D "generic-ohci";
> diff --git a/arch/arm/boot/dts/hisi-x5hd2.dtsi =

> b/arch/arm/boot/dts/hisi-x5hd2.dtsi
> index 3ee7967c202d..693b85b2cc7d 100644
> --- a/arch/arm/boot/dts/hisi-x5hd2.dtsi
> +++ b/arch/arm/boot/dts/hisi-x5hd2.dtsi
> @@ -452,14 +452,14 @@ gmac1: ethernet@1841000 {
>  			status =3D "disabled";
>  		};
> =

> -		usb0: ehci@1890000 {
> +		usb0: usb@1890000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D <0x1890000 0x1000>;
>  			interrupts =3D <0 66 4>;
>  			clocks =3D <&clock HIX5HD2_USB_CLK>;
>  		};
> =

> -		usb1: ohci@1880000 {
> +		usb1: usb@1880000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0x1880000 0x1000>;
>  			interrupts =3D <0 67 4>;
> diff --git a/arch/arm/boot/dts/lpc18xx.dtsi =

> b/arch/arm/boot/dts/lpc18xx.dtsi
> index 10b8249b8ab6..82ffd7b0ad8a 100644
> --- a/arch/arm/boot/dts/lpc18xx.dtsi
> +++ b/arch/arm/boot/dts/lpc18xx.dtsi
> @@ -121,7 +121,7 @@ mmcsd: mmcsd@40004000 {
>  			status =3D "disabled";
>  		};
> =

> -		usb0: ehci@40006100 {
> +		usb0: usb@40006100 {
>  			compatible =3D "nxp,lpc1850-ehci", "generic-ehci";
>  			reg =3D <0x40006100 0x100>;
>  			interrupts =3D <8>;
> @@ -133,7 +133,7 @@ usb0: ehci@40006100 {
>  			status =3D "disabled";
>  		};
> =

> -		usb1: ehci@40007100 {
> +		usb1: usb@40007100 {
>  			compatible =3D "nxp,lpc1850-ehci", "generic-ehci";
>  			reg =3D <0x40007100 0x100>;
>  			interrupts =3D <9>;
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi =

> b/arch/arm/boot/dts/stm32mp151.dtsi
> index bfe29023fbd5..576f7da564c5 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1404,7 +1404,7 @@ ethernet0: ethernet@5800a000 {
>  			status =3D "disabled";
>  		};
> =

> -		usbh_ohci: usbh-ohci@5800c000 {
> +		usbh_ohci: usb@5800c000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0x5800c000 0x1000>;
>  			clocks =3D <&rcc USBH>;
> @@ -1413,7 +1413,7 @@ usbh_ohci: usbh-ohci@5800c000 {
>  			status =3D "disabled";
>  		};
> =

> -		usbh_ehci: usbh-ehci@5800d000 {
> +		usbh_ehci: usb@5800d000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D <0x5800d000 0x1000>;
>  			clocks =3D <&rcc USBH>;
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi =

> b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> index 12bc1d3ed424..a4acecb75c89 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> @@ -585,7 +585,7 @@ pcie: pcie@9860000 {
>  			status =3D "disabled";
>  		};
> =

> -		ohci: ohci@9880000 {
> +		ohci: usb@9880000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0x9880000 0x10000>;
>  			interrupts =3D <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> @@ -600,7 +600,7 @@ ohci: ohci@9880000 {
>  			status =3D "disabled";
>  		};
> =

> -		ehci: ehci@9890000 {
> +		ehci: usb@9890000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D <0x9890000 0x10000>;
>  			interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/hisilicon/hip06.dtsi =

> b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
> index 50ceaa959bdc..1226440d54ad 100644
> --- a/arch/arm64/boot/dts/hisilicon/hip06.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
> @@ -373,7 +373,7 @@ refclk: refclk {
>  			#clock-cells =3D <0>;
>  		};
> =

> -		usb_ohci: ohci@a7030000 {
> +		usb_ohci: usb@a7030000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0x0 0xa7030000 0x0 0x10000>;
>  			interrupt-parent =3D <&mbigen_usb>;
> @@ -382,7 +382,7 @@ usb_ohci: ohci@a7030000 {
>  			status =3D "disabled";
>  		};
> =

> -		usb_ehci: ehci@a7020000 {
> +		usb_ehci: usb@a7020000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D <0x0 0xa7020000 0x0 0x10000>;
>  			interrupt-parent =3D <&mbigen_usb>;
> diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi =

> b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
> index 4773a533fce5..93f99a5255ac 100644
> --- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
> @@ -1253,7 +1253,7 @@ uart0: uart@602b0000 {
>  			status =3D "disabled";
>  		};
> =

> -		usb_ohci: ohci@a7030000 {
> +		usb_ohci: usb@a7030000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0x0 0xa7030000 0x0 0x10000>;
>  			interrupt-parent =3D <&mbigen_usb>;
> @@ -1262,7 +1262,7 @@ usb_ohci: ohci@a7030000 {
>  			status =3D "disabled";
>  		};
> =

> -		usb_ehci: ehci@a7020000 {
> +		usb_ehci: usb@a7020000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D <0x0 0xa7020000 0x0 0x10000>;
>  			interrupt-parent =3D <&mbigen_usb>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi =

> b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> index 1520585c235c..b989ff62ffbc 100644
> --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> @@ -281,7 +281,7 @@ dmac: dma-controller@13020000 {
>  		clocks =3D <&cgu JZ4740_CLK_DMA>;
>  	};
> =

> -	uhc: uhc@13030000 {
> +	uhc: usb@13030000 {
>  		compatible =3D "ingenic,jz4740-ohci", "generic-ohci";
>  		reg =3D <0x13030000 0x1000>;
> =

> diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi =

> b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> index fa11ac950499..e45c03038826 100644
> --- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> @@ -417,7 +417,7 @@ dmac1: dma-controller@13420100 {
>  		interrupts =3D <23>;
>  	};
> =

> -	uhc: uhc@13430000 {
> +	uhc: usb@13430000 {
>  		compatible =3D "generic-ohci";
>  		reg =3D <0x13430000 0x1000>;
> =

> diff --git a/arch/mips/boot/dts/mti/sead3.dts =

> b/arch/mips/boot/dts/mti/sead3.dts
> index 192c26ff1d3d..1cf6728af8fe 100644
> --- a/arch/mips/boot/dts/mti/sead3.dts
> +++ b/arch/mips/boot/dts/mti/sead3.dts
> @@ -56,7 +56,7 @@ gic: interrupt-controller@1b1c0000 {
>  		interrupt-parent =3D <&cpu_intc>;
>  	};
> =

> -	ehci@1b200000 {
> +	usb@1b200000 {
>  		compatible =3D "generic-ehci";
>  		reg =3D <0x1b200000 0x1000>;
> =

> diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi =

> b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> index 892e8ab863c5..45bf96a3d17a 100644
> --- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> @@ -275,7 +275,7 @@ usb_phy: usb-phy@10120000 {
>  		reset-names =3D "host", "device";
>  	};
> =

> -	ehci@101c0000 {
> +	usb@101c0000 {
>  		compatible =3D "generic-ehci";
>  		reg =3D <0x101c0000 0x1000>;
> =

> diff --git a/arch/powerpc/boot/dts/akebono.dts =

> b/arch/powerpc/boot/dts/akebono.dts
> index df18f8dc4642..343326c30380 100644
> --- a/arch/powerpc/boot/dts/akebono.dts
> +++ b/arch/powerpc/boot/dts/akebono.dts
> @@ -126,7 +126,7 @@ SATA0: sata@30000010000 {
>  			interrupts =3D <93 2>;
>  		};
> =

> -		EHCI0: ehci@30010000000 {
> +		EHCI0: usb@30010000000 {
>  			compatible =3D "ibm,476gtr-ehci", "generic-ehci";
>  			reg =3D <0x300 0x10000000 0x0 0x10000>;
>  			interrupt-parent =3D <&MPIC>;
> @@ -140,14 +140,14 @@ SD0: sd@30000000000 {
>  			interrupt-parent =3D <&MPIC>;
>  		};
> =

> -		OHCI0: ohci@30010010000 {
> +		OHCI0: usb@30010010000 {
>  			compatible =3D "ibm,476gtr-ohci", "generic-ohci";
>  			reg =3D <0x300 0x10010000 0x0 0x10000>;
>  			interrupt-parent =3D <&MPIC>;
>  			interrupts =3D <89 1>;
>  			};
> =

> -		OHCI1: ohci@30010020000 {
> +		OHCI1: usb@30010020000 {
>  			compatible =3D "ibm,476gtr-ohci", "generic-ohci";
>  			reg =3D <0x300 0x10020000 0x0 0x10000>;
>  			interrupt-parent =3D <&MPIC>;
> --
> 2.27.0
> =




_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
