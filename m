Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B53C4167B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Nov 2023 06:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xURbhDgw9VKqX//VEdfip6bzGEpDW4n6xf6SHRYr1Vg=; b=Jx0wtBcZEArW5R
	iC5J6jrVRLtY0NZoFuWOTKfLNko1IZ+V2pYSjg85W/aNVPDTUQzbJ2UH67xo6pVMCb0CtvcNllT/w
	CRnG8CTmgeSmLxM6rlFSMtMD0fCkcxbv6HNgMjiKXgou3/YenbAcS6HudKtZTrL9ayau2kfWy2smc
	fyvZk7Pw5fRZzV3F2jMpuxRCYHyO35Vp8oycEN2VFPHMVr/PoKmOpv/Fn0dgJ22/B4qLnjE5Espsu
	XtqM4oYW2mffL4u0H65ZeuQJgpap4i480TC8fSIA1+xx7sbpD+BhCFfSZdhEWZ0kJquTpv6te8DRo
	DrLkBmw8x8xW5oPkOyAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Di7-007BDm-25;
	Wed, 29 Nov 2023 06:06:11 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Di5-007BBW-2B
	for linux-snps-arc@lists.infradead.org;
	Wed, 29 Nov 2023 06:06:10 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5ce16bc121aso68692487b3.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 28 Nov 2023 22:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701237965; x=1701842765; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BFBgGZHgdrEFpnu/cpKOcJzser1reIBdXzg/6fniV64=;
        b=TbwqyZtgeDzUrxgq8BQX+grkf8Js4e0FKeeFrvAZJqHVReB4NJi0PV7/0HrCYKWcEV
         ChsfaOJcYJz9eo8rx37T7Nzi6FpJVD+NSU3BDLRpwSaOdXzdxWNO07J+zuGrmsAo7JxP
         hn2zQ4Oy4Z0J+DZ8JcRs3HTz5e1cyYmqukW1EFRqJ7YES9WhLT5LUW1+4vp+5io3JNO6
         vLzMSUzAuH+nNMbmJMOA3wB9qFN6D8fGeRz5yr1/aPkYVMFREg0KLwkDeA5wzzeis2vd
         4WaQ2EKMfOSSq91847+rAHzQ6Tt5D4Scmc0Lo5ctclqaDPT+rAMy2XW1Nztt2fetA6Nz
         qhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701237965; x=1701842765;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFBgGZHgdrEFpnu/cpKOcJzser1reIBdXzg/6fniV64=;
        b=sYJvY1oYPwDJ7g+J5DZHCzSJzG8W6aROIAtqnJ/Bejxyd38nXY1X17epmicRMIKSxv
         ++yb75xZlW9sir5eJAruxGVdSeVlyYy/7/xslolK/18wand9nitXvYw4vSUmmENTeOnG
         3LTnuIDUs2vNHQTebwRUY7uRxhPhzajI4HurLvMxL+AfjuBTZAMTmEuZSKQ4diAqJtQK
         9bzttSjSsSfsZ3KYfWgBmk3OG3ma+nqeDYLQf6/Zhm6J2Ltelx/v0jG+Y6j8J41Gxf5J
         7E/6KBL/wi20A7i+j1zFeUG7U2pwjM27dOYSR7dFEbNaH4G83zSFfANkqofhenjIybFi
         IhIA==
X-Gm-Message-State: AOJu0YycCXhcSdTz254dy2e+DZJhq04KMlRh9GCrpjy+xnvX2ohVV645
	97d6c+DqzdvCvSuWhp/Hp9FD/cEo8viX
X-Google-Smtp-Source: AGHT+IG4ZcbE3hB8V6+vKX0zxYUr0OpHfbf/WNlvcGBdlOoo8eTYBCxtpp+7m/8KdVPZTHDTWhORx94znMfW
X-Received: from morats.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:d9e])
 (user=moritzf job=sendgmr) by 2002:a25:c044:0:b0:db5:1f69:704e with SMTP id
 c65-20020a25c044000000b00db51f69704emr38263ybf.1.1701237964651; Tue, 28 Nov
 2023 22:06:04 -0800 (PST)
Date: Wed, 29 Nov 2023 06:06:03 +0000
In-Reply-To: <4-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Mime-Version: 1.0
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com> <4-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Message-ID: <20231129060603.hxtmbsefxurxnwkh@google.com>
Subject: Re: [PATCH 04/10] iommu: Mark dev_iommu_get() with lockdep
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
X-CRM114-CacheID: sfid-20231128_220609_784322_C010C5BF 
X-CRM114-Status: GOOD (  15.22  )
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

On Tue, Nov 28, 2023 at 08:48:00PM -0400, Jason Gunthorpe wrote:
> Allocation of dev->iommu must be done under the
> iommu_probe_device_lock. Mark this with lockdep to discourage future
> mistakes.

> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Tested-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 2 ++
>   1 file changed, 2 insertions(+)

> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 0d25468d53a68a..4323b6276e977f 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -334,6 +334,8 @@ static struct dev_iommu *dev_iommu_get(struct device  
> *dev)
>   {
>   	struct dev_iommu *param = dev->iommu;

> +	lockdep_assert_held(&iommu_probe_device_lock);
> +
>   	if (param)
>   		return param;

> --
> 2.42.0


Reviewed-by: Moritz Fischer <moritzf@google.com>

Cheers,
Moritz

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
