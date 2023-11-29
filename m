Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC5CC4167B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Nov 2023 06:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRDc+3aRBfxVZKys7xM7EiR20R9f1BaATuU1TiNILBA=; b=W7DWsgWj9R8NRu
	0TCsqRYygX7c1hrvTWrrRQngE6zNUdlTkVh1VJWZ8i8ArtCVqQyCSiaFRr/IxMfAFb0d24PXODYpa
	Zzlj7iCM3fLqIlbKpqtRu3SDoy+ThrlB81QBBBZql3TQ0QxyhnmPzH+7Ec0nvTxJUCK2a2erhFq9u
	qaGCK5iM8WeaccnO8Jfb/T1UuHdiAdXz3XAubEt5Q9kxLygR2gJR19xnnRKL88tnDgQfTWBx7MdMa
	xDi+zKl6VZTnvJBd/djyRNtVP9antiD+vDqWXf2XEockL3r22bSKpq+eikjK3OiRVB5Otcu6mBarB
	1KMAEnU7y6TGR4mXAHsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Du5-007CYO-1G;
	Wed, 29 Nov 2023 06:18:33 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Du0-007CVB-1y
	for linux-snps-arc@lists.infradead.org;
	Wed, 29 Nov 2023 06:18:31 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-db402e6f61dso7437438276.3
        for <linux-snps-arc@lists.infradead.org>; Tue, 28 Nov 2023 22:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701238707; x=1701843507; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8J4qMZXxn7dMNLyiBgKsZSJFUlenzauaBGTwqmqEkBs=;
        b=p5IYh5/meUWdrf1OHd6tub5A6iJ+wvBYKR+vJ129N/RUeBSmKvfdUDRj1PcX518/Eg
         ABqWKCirOKqhAZG+EZW5N/1eXxPNZIHx7VbYYny7ufVCZ4viqZlOT99RqCPuxnkscJxE
         XdHewNLzh+VRmul6NWGt24JGe2wBjuVzvIrnEG02fWr6VIQ/U8zO7BePdycd/ZT7awhw
         13uoPh3d0mVGrnQYJXJwkSUo7Nb30mzrljkGlwlwg4H7XvznHiklfCRD4knZ1FCoLjjz
         r213qPYeQNPsV6hz1TXuWv6alxX4mAY77VJeXDbjVTWEnj4mXZi9MRJ+6ncYThan2/KV
         Bfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701238707; x=1701843507;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8J4qMZXxn7dMNLyiBgKsZSJFUlenzauaBGTwqmqEkBs=;
        b=Tn0pXr06d08JsuRK4sHkGAFNUqste8mmEpVtMZCONm/EPp3qYBCZTVgWwQdJArRw24
         vr89xOjETr60IIBiMw2lfBvZDVd50Cum67C9/UXmuk/iNSCoo5FDEkdU0O9rEr3b+6L8
         GIiTP4yvakM22yK/2CXp1sms2S20qaloFDKp1CFKwQ9ZWbkPRNgX2Hai1IJl/5UrlexO
         LXjtXNv/5kSbjA4RwXFL6wQo1fmGASB+iXTyC6Teldxbc3kkWAFSetfgjjfIzD7KhBh9
         y5BWIS++X2RoFXsm1C4tDp4TDWAjjp3xX6XAkYUDoJ+uhahadKcOYspi5Sqb2VmoAhOi
         3A4A==
X-Gm-Message-State: AOJu0YyqrZRR0mXQeNAhl2mOULA9rDthkUoYPoAFvM0sFxmP0ZokxmXS
	llveWA8W+OgLozX1K7PYMhBSdeKjWGkU
X-Google-Smtp-Source: AGHT+IFcUygGdfS95PQxvEDzLlpossLvNyVov+P9EiIyJqoPwhfNYT1rdzAgRP7ca8iJPDCSOmBZ7cELCldp
X-Received: from morats.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:d9e])
 (user=moritzf job=sendgmr) by 2002:a25:d287:0:b0:db3:8b00:22eb with SMTP id
 j129-20020a25d287000000b00db38b0022ebmr482941ybg.6.1701238706756; Tue, 28 Nov
 2023 22:18:26 -0800 (PST)
Date: Wed, 29 Nov 2023 06:18:25 +0000
In-Reply-To: <9-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Mime-Version: 1.0
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com> <9-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Message-ID: <20231129061825.altvhmgltws2bvhh@google.com>
Subject: Re: [PATCH 09/10] ACPI: IORT: Cast from ULL to phys_addr_t
From: Moritz Fischer <moritzf@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Danilo Krummrich <dakr@redhat.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org, 
	dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	David Woodhouse <dwmw2@infradead.org>, Frank Rowand <frowand.list@gmail.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Haiyang Zhang <haiyangz@microsoft.com>, iommu@lists.linux.dev, 
	Jon Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>, 
	Karol Herbst <kherbst@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Laxman Dewangan <ldewangan@nvidia.com>, Len Brown <lenb@kernel.org>, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org, 
	linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, nouveau@lists.freedesktop.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Sven Peter <sven@svenpeter.dev>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vineet Gupta <vgupta@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Christoph Hellwig <hch@lst.de>, 
	Jerry Snitselaar <jsnitsel@redhat.com>, Hector Martin <marcan@marcan.st>, Moritz Fischer <mdf@kernel.org>, 
	patches@lists.linux.dev, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Rob Herring <robh@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_221828_650271_5737ED94 
X-CRM114-Status: GOOD (  16.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Nov 28, 2023 at 08:48:05PM -0400, Jason Gunthorpe wrote:
> gcc on i386 (when compile testing) warns:

This is a weird test. The Makefile for drivers/acpi/arm64 is conditional
on CONFIG_ARM64. How does this happen?

> 8->8
obj-$(CONFIG_ARM64)		+= arm64/
> 8->8


>   drivers/acpi/arm64/iort.c:2014:18: warning: implicit conversion  
> from 'unsigned long long' to 'phys_addr_t' (aka 'unsigned int') changes  
> value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
>                             local_limit =  
> DMA_BIT_MASK(ncomp->memory_address_limit);

> Because DMA_BIT_MASK returns a large ULL constant. Explicitly truncate it
> to phys_addr_t.

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/acpi/arm64/iort.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index 6496ff5a6ba20d..bdaf9256870d92 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -2011,7 +2011,8 @@ phys_addr_t __init  
> acpi_iort_dma_get_max_cpu_address(void)

>   		case ACPI_IORT_NODE_NAMED_COMPONENT:
>   			ncomp = (struct acpi_iort_named_component *)node->node_data;
> -			local_limit = DMA_BIT_MASK(ncomp->memory_address_limit);
> +			local_limit = (phys_addr_t)DMA_BIT_MASK(
> +				ncomp->memory_address_limit);
>   			limit = min_not_zero(limit, local_limit);
>   			break;

> @@ -2020,7 +2021,8 @@ phys_addr_t __init  
> acpi_iort_dma_get_max_cpu_address(void)
>   				break;

>   			rc = (struct acpi_iort_root_complex *)node->node_data;
> -			local_limit = DMA_BIT_MASK(rc->memory_address_limit);
> +			local_limit = (phys_addr_t)DMA_BIT_MASK(
> +				rc->memory_address_limit);
>   			limit = min_not_zero(limit, local_limit);
>   			break;
>   		}
> --
> 2.42.0


Cheers,
Moritz

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
