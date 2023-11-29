Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689A9C10DAA
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Nov 2023 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqqhcjACHblQg8gpY9Y06KEAE8UD0wnTH1XzhexRpBg=; b=JO6DnzPDRpiGyPk0AhiZfHAuV5
	B5loxeOuArtjdRq1pLfff+bMdDKXErtPoL8PcigOMq8u9X6rLGkg0EgHooB7ESiA3G8K6MhkTDusK
	xV5MLc89ps4xcKbupELe+fLUTournGYRCePoHBlF2FHDyLMfxFxfVcr2Q/iC7e8AEWCI1SQbTlDI4
	x7l+epMIQtcA+PgaXgP6T9qRRnSNxrDw4+dMx8//sPlT+OR1DspDUnhm5lEllQqXGQKcL88y+mlLD
	pLFbMsGhfJ78t0cjEZ69GCxAhZv8+dRnCMrNfZURRJCktGBSegInSeGhFg5P68slpW9oYPTLHxc2E
	PP0LkdtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NLQ-008sLd-2S;
	Wed, 29 Nov 2023 16:23:24 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NLM-008sKD-1u;
	Wed, 29 Nov 2023 16:23:22 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c8879a1570so88771721fa.1;
        Wed, 29 Nov 2023 08:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701274997; x=1701879797; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BE4DN2NIJid+M8TUF/vMVc9hXeYzBXdHSi7xojD4wk4=;
        b=eEDbGDj5PLAWKrzI0Hna+DO0q1MfzPB2D9gKqE5gP6R2efz5EY7CQYfunPgZQ13pQ0
         jhfUU+oOBaz5Uaq1Nvd+OBTlFDo2DY1WHXgWM+tkBSPE1A7Dv61p0WkrsPdrV34BrOa2
         j2sgqaLMdPV2ovklVlYTNmuhWTuIETpeYadgrSkqOLrnw7wuD7q9Udz9+zmyyL7gWSMO
         GFIXIxWn8lGr0ejmXb6FgPcxJSx9uu+rqEAj2l8BPwguQkMZHeJhLVs4NABTWJBZ7HQU
         YW1hPc4JlsKb+NMNpTZ8rxNuCaIYaW6f8MnwFj5HabzOBZr1Sdc/W4U1iAnXIDgZJzcT
         r/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701274997; x=1701879797;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BE4DN2NIJid+M8TUF/vMVc9hXeYzBXdHSi7xojD4wk4=;
        b=RiJdOp4ku4dQO9fYtwQEcJKOlxjpdWP4CdcDkpi3EFxEo20bCqx8MkXey0tnnb2IX+
         QglPKEDdDQAlO5r7NwHFeNzGD0euEbGJlKa2dvWbU6/zth86Sz+kxYJcQN5X+U4GXmVV
         fXi7LAuFmMkgQUkSU4jHRY4HLrTIT76In/EEozO++FGDeaWE2zHFQ4lKod8CnvdaG22t
         zSAIIsSmN4qfdhDs9jnaBXk2L8krbR/c7uH8NP1qLFW8l2k4swHtHn59RR/Dh76rBWQh
         wLFupfrfS+xF8oLglB9K8nP12PppUPCECe/EoE3fKF4y+nDfwTTSOuOTBghKq9SXsx15
         3E/A==
X-Gm-Message-State: AOJu0YxmIBWEBmdTbaFt1raF/Q5OMT+v0PchDPrO5MUEDoWRAF2e3pnF
	DEyaQeSDg1XpBiGsUjnu6L8=
X-Google-Smtp-Source: AGHT+IFpkXFRA9JtjkMulyQU+vE6lllIuj8DaTvHOgPc7kkDjVJCH1EZdgBzk/x+Nxw/nDpm1ZgC3Q==
X-Received: by 2002:a2e:9557:0:b0:2c9:b623:ddf1 with SMTP id t23-20020a2e9557000000b002c9b623ddf1mr3708530ljh.51.1701274997225;
        Wed, 29 Nov 2023 08:23:17 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c501000b00407b93d8085sm2743768wmr.27.2023.11.29.08.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 08:23:16 -0800 (PST)
Date: Wed, 29 Nov 2023 17:23:13 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@gmail.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
	David Woodhouse <dwmw2@infradead.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Haiyang Zhang <haiyangz@microsoft.com>, iommu@lists.linux.dev,
	Jon Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
	Karol Herbst <kherbst@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Laxman Dewangan <ldewangan@nvidia.com>, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
	linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	nouveau@lists.freedesktop.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vineet Gupta <vgupta@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Hector Martin <marcan@marcan.st>, Moritz Fischer <mdf@kernel.org>,
	patches@lists.linux.dev,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 08/10] iommu/tegra: Use tegra_dev_iommu_get_stream_id()
 in the remaining places
Message-ID: <ZWdlcboM4Xzs38NI@orome.fritz.box>
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <8-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <8-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_082320_632493_7A6BECB9 
X-CRM114-Status: GOOD (  27.03  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3208141500712078438=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--===============3208141500712078438==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OR6CuieIvqboqm08"
Content-Disposition: inline


--OR6CuieIvqboqm08
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 08:48:04PM -0400, Jason Gunthorpe wrote:
> This API was defined to formalize the access to internal iommu details on
> some Tegra SOCs, but a few callers got missed. Add them.
>=20
> The helper already masks by 0xFFFF so remove this code from the callers.
>=20
> Suggested-by: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/dma/tegra186-gpc-dma.c                  |  8 +++-----
>  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c |  7 ++-----
>  drivers/memory/tegra/tegra186.c                 | 12 ++++++------
>  3 files changed, 11 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dm=
a.c
> index fa4d4142a68a21..88547a23825b18 100644
> --- a/drivers/dma/tegra186-gpc-dma.c
> +++ b/drivers/dma/tegra186-gpc-dma.c
> @@ -1348,8 +1348,8 @@ static int tegra_dma_program_sid(struct tegra_dma_c=
hannel *tdc, int stream_id)
>  static int tegra_dma_probe(struct platform_device *pdev)
>  {
>  	const struct tegra_dma_chip_data *cdata =3D NULL;
> -	struct iommu_fwspec *iommu_spec;
> -	unsigned int stream_id, i;
> +	unsigned int i;
> +	u32 stream_id;
>  	struct tegra_dma *tdma;
>  	int ret;
> =20
> @@ -1378,12 +1378,10 @@ static int tegra_dma_probe(struct platform_device=
 *pdev)
> =20
>  	tdma->dma_dev.dev =3D &pdev->dev;
> =20
> -	iommu_spec =3D dev_iommu_fwspec_get(&pdev->dev);
> -	if (!iommu_spec) {
> +	if (!tegra_dev_iommu_get_stream_id(&pdev->dev, &stream_id)) {
>  		dev_err(&pdev->dev, "Missing iommu stream-id\n");
>  		return -EINVAL;
>  	}
> -	stream_id =3D iommu_spec->ids[0] & 0xffff;
> =20
>  	ret =3D device_property_read_u32(&pdev->dev, "dma-channel-mask",
>  				       &tdma->chan_mask);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> index e7e8fdf3adab7a..b40fd1dbb21617 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> @@ -28,16 +28,13 @@ static void
>  gp10b_ltc_init(struct nvkm_ltc *ltc)
>  {
>  	struct nvkm_device *device =3D ltc->subdev.device;
> -	struct iommu_fwspec *spec;
> +	u32 sid;
> =20
>  	nvkm_wr32(device, 0x17e27c, ltc->ltc_nr);
>  	nvkm_wr32(device, 0x17e000, ltc->ltc_nr);
>  	nvkm_wr32(device, 0x100800, ltc->ltc_nr);
> =20
> -	spec =3D dev_iommu_fwspec_get(device->dev);
> -	if (spec) {
> -		u32 sid =3D spec->ids[0] & 0xffff;
> -
> +	if (tegra_dev_iommu_get_stream_id(device->dev, &sid)) {
>  		/* stream ID */
>  		nvkm_wr32(device, 0x160000, sid << 2);

We could probably also remove the comment now since the function and
variable names make it obvious what's being written here.

>  	}
> diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra=
186.c
> index 533f85a4b2bdb7..3e4fbe94dd666e 100644
> --- a/drivers/memory/tegra/tegra186.c
> +++ b/drivers/memory/tegra/tegra186.c
> @@ -111,21 +111,21 @@ static void tegra186_mc_client_sid_override(struct =
tegra_mc *mc,
>  static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *=
dev)
>  {
>  #if IS_ENABLED(CONFIG_IOMMU_API)
> -	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>  	struct of_phandle_args args;
>  	unsigned int i, index =3D 0;
> +	u32 sid;
> =20
> +	WARN_ON(!tegra_dev_iommu_get_stream_id(dev, &sid));

I know the code previously didn't check for any errors, but we may want
to do so now. If tegra_dev_iommu_get_stream_id() ever fails we may end
up writing some undefined value into the override register.

I'm also unsure if WARN_ON() is appropriate here. I vaguely recall that
->probe_device() was called for all devices on the bus and not all of
them may have been associated with the IOMMU. Not all of them may in
fact access memory in the first place.

Perhaps I'm misremembering and the IOMMU core now takes care of only
calling this when fwspec is indeed valid?

Thierry

--OR6CuieIvqboqm08
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVnZW8ACgkQ3SOs138+
s6H3xA/+PnJPzNAATgGeEaxpY8VPfo7h0kY98vc1QYnUCiV46yzQPUq+/nVkkq24
ybBtQ8hr0vl4ZxtflekHYxb0WsXO560ODmmckXEYPWRfVyxckFz+CRyvDx+zxyxJ
d/TtD8p0l6DGFlZGume2h/cDafF5+3td2JEJ2vEfu0tMmRLIFC7L+Pj2IB4/Fz21
2M6M6T0Al7obecinfW9jzg00G20RybQSrdPq+H9z3BNhOXGKy+1fjIzCsnr4H0gD
kE4WooU9uLbMdpEYYZ8idqC1OieIr6p2IF802/4/TAvWHreHlH7uPcDRry8rxkwQ
j0CAwBlcvLLtLj2pw7kYgxMpXwahgXSuhxX42CXDWsUUW4mxiZkvG0o8Cv2EGtSD
emTIMrC3w1R2MSemI8+RQdOHhOnTNC0sADGo9EyurPrYC9TzwqTOPI35kNqJ8ZAw
zCmhDKieZM9dxlOdFrpC+eLz8eVEjo5oV+OchMT6k8nw7TkD6dGHBOJlDhQeJNWZ
tZBnlBamoEmlD5Kz/Oe90S47MnYtx8EX7o9bpEV6/ZO13P+F07rasP3l6hCJuybO
c2YAeCxY8cuwHLnIJZTm3hR7UU9PQwPn4utolLuSqaXkL5wSdVr+1eZyTye25W0J
CSzMCL3SkMgfKaZ7L6ptSRFtOWxiH6943ahvYpDBXlgEp/R9aVg=
=ORi/
-----END PGP SIGNATURE-----

--OR6CuieIvqboqm08--


--===============3208141500712078438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============3208141500712078438==--

