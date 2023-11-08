Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59F9C4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Nov 2023 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWo3C+OVPNPBn5g8XhrRoh9Ncu+OkOfbIsklveWGLgc=; b=hU07vNY/HSQvrH
	0CNGSlo1n7kA9da3TRiSLqbygwbMS8EYpCxzXfBDahzKoInVP17fNRuMPsxz9ErlHMyT7iA8lp3/3
	yN0r/7Ps6ZqE5sYzMuBRmPuE/WVD4bsGHD0FhH1p8CnBMme67WkXYPOx4BoBWvGbaLzrOgooNALTe
	0Cu+nL12ZUkdFUupFgufKId9/GfGiNZDlQ0vXokmxudPILs/eourUT6non6NXylei0hhQoBLEHvLW
	a0lv6SP4WCQE8QzyA1LSpLbrqrMPDfVadEv06Oma6FR7rbPAXubjsUABtSqZpX2/KoiE0tQahmhJU
	BRuizn3CmHH/ob4UXk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0lGC-004HQS-2V;
	Wed, 08 Nov 2023 16:18:32 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0lG7-004HOk-2v;
	Wed, 08 Nov 2023 16:18:29 +0000
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6ce31c4a653so4325318a34.3;
        Wed, 08 Nov 2023 08:18:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699460305; x=1700065105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYkPle1MdHD/QkRy5uvWyvoGAuw8CDQwR9sXIE03ZSs=;
        b=whms3sArhyNjrDY23AJf2Qty9CrmhWM0wZ96/iMxSmcgY164r0tHFyZSvyKLC8rnOg
         b1JULbbLFr6nrPdgBXXOPbzudE+mReIH/R6Mux5pApphazN2kVOaraDwoASe2rPFrdEl
         X69Zbdf2juWAQoY7HNlNgdv7Jcn0LNJPLmKxHZ6699SDA9dPMiJtbINSHTX3lzIcmwOL
         z7yUHbIPSh0q0UY3Pf3/oSyLzYQ+fPhexCDwvnO+7Gv4PLjg1e+mL7QD+fPuGKRQmXqU
         GgrNjdWFw0WmLZejIz5035AsNW66yoKlEtgdPCd7dQQAq9sytZ68HayJZ4vdK0v4Lcrl
         uYew==
X-Gm-Message-State: AOJu0YwgkLYZNANJbdzoIO3okiyFCMomyZ9HAuymR4tObg+F2kQ+eZUC
	56V1xHnA9UAFnxdBAuS66A==
X-Google-Smtp-Source: AGHT+IHdx3/gHf0uiMEsZF6g8NbonKAcCJCMoAU+4cEwM7tQNoaEke7MS1G/3+EpNqOeJUuZFsInWw==
X-Received: by 2002:a05:6830:4394:b0:6d5:4daf:9894 with SMTP id s20-20020a056830439400b006d54daf9894mr2008363otv.7.1699460305289;
        Wed, 08 Nov 2023 08:18:25 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ew20-20020a0568303d9400b006b89dafb721sm1939661otb.78.2023.11.08.08.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 08:18:24 -0800 (PST)
Received: (nullmailer pid 2333673 invoked by uid 1000);
	Wed, 08 Nov 2023 16:18:22 -0000
Date: Wed, 8 Nov 2023 10:18:22 -0600
From: Rob Herring <robh@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linuxfoundation.org, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Lu Baolu <baolu.lu@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Frank Rowand <frowand.list@gmail.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Len Brown <lenb@kernel.org>, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org, 
	linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Hector Martin <marcan@marcan.st>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Sven Peter <sven@svenpeter.dev>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Krishna Reddy <vdumpa@nvidia.com>, Vineet Gupta <vgupta@kernel.org>, 
	virtualization@lists.linux-foundation.org, Wei Liu <wei.liu@kernel.org>, 
	Will Deacon <will@kernel.org>, Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: Re: [PATCH RFC 01/17] iommu: Remove struct iommu_ops *iommu from
 arch_setup_dma_ops()
Message-ID: <20231108161822.GC2254211-robh@kernel.org>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <1-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_081827_946305_C7909892 
X-CRM114-Status: GOOD (  13.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Nov 03, 2023 at 01:44:46PM -0300, Jason Gunthorpe wrote:
> This is not being used to pass ops, it is just a way to tell if an
> iommu driver was probed. These days this can be detected directly via
> device_iommu_mapped(). Call device_iommu_mapped() in the two places that
> need to check it and remove the iommu parameter everywhere.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/arc/mm/dma.c               |  2 +-
>  arch/arm/mm/dma-mapping-nommu.c |  2 +-
>  arch/arm/mm/dma-mapping.c       | 10 +++++-----
>  arch/arm64/mm/dma-mapping.c     |  4 ++--
>  arch/mips/mm/dma-noncoherent.c  |  2 +-
>  arch/riscv/mm/dma-noncoherent.c |  2 +-
>  drivers/acpi/scan.c             |  3 +--
>  drivers/hv/hv_common.c          |  2 +-
>  drivers/of/device.c             |  2 +-

Acked-by: Rob Herring <robh@kernel.org>

>  include/linux/dma-map-ops.h     |  4 ++--
>  10 files changed, 16 insertions(+), 17 deletions(-)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
