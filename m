Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6C2C4167B
	for <linux-snps-arc@archiver.kernel.org>; Fri,  1 Dec 2023 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAeyN6EszkbuXYs4PpAVGhiEA6AOVq0H8V27YSa1csg=; b=qgeGtdy5BGPT+o/no1c9LpG2zW
	mvinhjrpB2UGDv1Jze/imy+vfe4+7Vjwx1hB4VOc/PxYtqCODJj6h72K0bkhyiNHSPEgTBKboc6Mx
	KX9h37F+hZkzr25eNFZJT5XbSOiqHt6RaU2lUphpIDW73QWHWdvn78d22ItRu9dhL3prslimiDiCL
	NDFaPPCFKDX6J7k6y2UMImeFb0meSz16f+IEETCS+3b9O3rL3EunfoxfGcif04TQODkH/zsfasvLt
	NEORFsBnrBwL7DzG/NSWsvEaKoSo+DqAHZyXWfnsgWe2RMFegSE1rifX8XTbY/YpHXwg0pGywPCbw
	WNY+lSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r91bo-00DJX9-0Q;
	Fri, 01 Dec 2023 11:23:00 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r91bj-00DJVQ-06;
	Fri, 01 Dec 2023 11:22:56 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bc8b7d8ffso2926488e87.0;
        Fri, 01 Dec 2023 03:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701429769; x=1702034569; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDYTbMEHTA+PA+CkrLL7nufZCEtkNLGajLlCGSCmAZE=;
        b=AiAVrk/0QM8H/2tyTYxlBD6S3yVlaiqdo7pCIi9EzITvC/h+RS7iM0kG0/NBU0gkQS
         Fv7e/pFQbSKLUTzrtU9l/kyFSFvDRiMPm6QrSgZRkubjhvK6yDxsKypo7a8+lvSIaqDt
         bV26CctQolm+VXxnTvl8Gzk44tfcpZG9DuHQh/IqvUg51ZXpPnXirkTWMsWc5tNjyg7D
         VqsKmCwGJUk9wn24pBDcMznpBnkqrrBPCUcq+mU6bobqDBKU+7uwdILtC844CeD25A+r
         GlZ2KsfNEuVVdRTKlB4J8KAJZfFU6uzXLu3oZWiQFtR6lEI1U1GdH3676skZXZPaZuuL
         WEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701429769; x=1702034569;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDYTbMEHTA+PA+CkrLL7nufZCEtkNLGajLlCGSCmAZE=;
        b=bck3+yNiN/QAk2h9rEGXc4yVD8+peFwmVoj9Q/QN8tAJd/1GiVH+nC0fX1mOuU0ktJ
         eYaM/Vl8SzGT8s4+al1avQq4kdHsv4r1E3j/zvuYnytHTEsYekb8kRu/hOiaU0bmM55T
         j3Lo8XyrB4Kg+BK9hBJaFml5lPCAXu1a6jjlsQ1tZ0ixeSziGaAOxBsSvmxt+fRJOGPq
         VuoDHrspdDqqe6kXynvFIVU6m+Wtup+f52KePnuuzeb2dlCo4YWOBzSeivsMqkmaUuYX
         k28VNvI7pOzRTsDo/xr85BKCtXLumjZ7oJb1rcxJ1qs7A1NW9Olqua+VMKsg4QgVxnaJ
         cckg==
X-Gm-Message-State: AOJu0Yz9eQU3f85xWTqdEcERyio0/Yn5sshA4AvxoJMh1y2YiowwE79d
	AO8eODU1yI7qhsQAik5nNR8=
X-Google-Smtp-Source: AGHT+IF/kNTDoQQTbuA8uVZADKdRmi7YjxqAP2WFPIMlihKsslpNF/yUJ1acTPp4hs3YLYpCcnqKnw==
X-Received: by 2002:a05:6512:488:b0:50b:d764:2916 with SMTP id v8-20020a056512048800b0050bd7642916mr403101lfq.174.1701429768197;
        Fri, 01 Dec 2023 03:22:48 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r3-20020aa7d143000000b0053de19620b9sm1523779edo.2.2023.12.01.03.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 03:22:47 -0800 (PST)
Date: Fri, 1 Dec 2023 12:22:45 +0100
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
Message-ID: <ZWnCBTWcxqJfemvR@orome.fritz.box>
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <8-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <ZWdlcboM4Xzs38NI@orome.fritz.box>
 <20231129192603.GA1387263@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20231129192603.GA1387263@nvidia.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_032255_094464_F9F9617F 
X-CRM114-Status: GOOD (  37.90  )
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
Content-Type: multipart/mixed; boundary="===============1141273405782669049=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--===============1141273405782669049==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TpTVMO/RkXn9/fAN"
Content-Disposition: inline


--TpTVMO/RkXn9/fAN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 03:26:03PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 29, 2023 at 05:23:13PM +0100, Thierry Reding wrote:
> > > diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/t=
egra186.c
> > > index 533f85a4b2bdb7..3e4fbe94dd666e 100644
> > > --- a/drivers/memory/tegra/tegra186.c
> > > +++ b/drivers/memory/tegra/tegra186.c
> > > @@ -111,21 +111,21 @@ static void tegra186_mc_client_sid_override(str=
uct tegra_mc *mc,
> > >  static int tegra186_mc_probe_device(struct tegra_mc *mc, struct devi=
ce *dev)
> > >  {
> > >  #if IS_ENABLED(CONFIG_IOMMU_API)
> > > -	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> > >  	struct of_phandle_args args;
> > >  	unsigned int i, index =3D 0;
> > > +	u32 sid;
> > > =20
> > > +	WARN_ON(!tegra_dev_iommu_get_stream_id(dev, &sid));
> >=20
> > I know the code previously didn't check for any errors, but we may want
> > to do so now. If tegra_dev_iommu_get_stream_id() ever fails we may end
> > up writing some undefined value into the override register.
>=20
> My assumption was it never fails otherwise this probably already
> doesn't work?

I guess the point I was trying to make is that previously we would not
have written anything to the stream ID register and so ignoring the
error here might end up writing to a register that previously we would
not have written to. Looking at the current code more closely I see now
that the reason why we wouldn't have written to the register is because
we would've crashed before.

So I think this okay.

>=20
> > I'm also unsure if WARN_ON() is appropriate here. I vaguely recall that
> > ->probe_device() was called for all devices on the bus and not all of
> > them may have been associated with the IOMMU. Not all of them may in
> > fact access memory in the first place.
>=20
> So you are thinkin that of_parse_phandle_with_args() is a NOP
> sometimes so it will tolerate the failure?
>=20
> Seems like the best thing to do is just continue to ignore it then?

Yeah, exactly. It would've just skipped over everything, basically.

> > Perhaps I'm misremembering and the IOMMU core now takes care of only
> > calling this when fwspec is indeed valid?
>=20
> Can't advise, I have no idea what tegra_mc_ops is for :)

In a nutshell, it's a hook that allows us to configure the memory
controller when a device is attached to the IOMMU. The memory controller
contains a set of registers that specify which memory client uses which
stream ID by default. For some devices this can be overridden (which is
where tegra_dev_iommu_get_stream_id() comes into play in those drivers)
and for other devices we can't override, which is when the memory
controller defaults come into play.

Anyway, I took a closer look at this and ran some tests. Turns out that
tegra186_mc_probe_device() really only gets called for devices that have
their fwspec properly initialized anyway, so I don't think there's
anything special we need to do here.

Strictly from a static analysis point of view I suppose we could now
have a situation that sid is uninitialized when the call to
tegra_dev_iommu_get_stream_id() fails and so using it in the loop is not
correct, theoretically, but I think that's just not a case that we'll
ever hit in practice.

So either way is fine with me. I have a slight preference for just
returning 0 in case tegra_dev_iommu_get_stream_id() fails, because it's
simple to do and avoids any of these (theoretical) ambiguities. So
whichever way you decide:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--TpTVMO/RkXn9/fAN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVpwgIACgkQ3SOs138+
s6HXLg/9HWFRkWBCsjCmwhdNLy/49eLCajrcOU069eBFBS0YM+rhIa4d/XwXv96C
WEC1AzUuDGAVKvfWbkjzCOtBKr+o0psunt8sHYRX+PtyekOF270j3ud+7Ny/6dQk
Ca9GevvG0yyYfEcSiowRZXKSzrhj4OSDS83QJbmBiyw3+VyA25+zO/C+Lzib1mG9
2Kn+od5hqOQFqylwazJAZy358DzVSmyF6iSR0kbmS5mvNrtWS/dT4Zeh2raYJgRn
MF+f0u+1M8i7Iv65/I5sG83I086p9ictlV1qkMGHY01q7uCAo5p2EM6KlP8Qv/N1
W+DZQpciP9+ENmkcYjEiNEnNw4efMQThCtXbB4VYxb8Jo/To8eV2/sOGUoLdhwWV
H8tPPCBfzYtSAsSNXpYK8gWQXCfaHjuO3SFe0itosbSHYw4x+SoECXTVi8L6GBwV
jDEYuyrcakUhR+vsxuOXlP4TzcIiNoCf1lO8LnfWVjoHcA/1dG1uA6Bup6CtNe+A
lS3xMmMXDVdZS49hw5EvUTd7Liu+si9RzLkmv4IGWBXlL01VTFYRygKZ1lZLKgPP
lZWUFLZPunTK7Mlew7PLW7GJg1MzsEkM3htQmVfWzPL7D95RKk3ufiOimGdzknro
ZaxbslDQOTUAoqgnKVnmzMJbfR+HTasb+X8EuoCb4G9dHDEPq1g=
=hKzE
-----END PGP SIGNATURE-----

--TpTVMO/RkXn9/fAN--


--===============1141273405782669049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============1141273405782669049==--

