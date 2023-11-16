Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB01C54FB9
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Nov 2023 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QIRzWlk5FBaBrZCiaRVL6uVZzruhm2eg+qgg086vjHE=; b=Xa1F5K7eYnArrU
	XqR1jGVS+GrYqZzTO1ZTAUD96xGoKyQV84abYtzk7bhSGI58IHig0bL1LH02VMUhhDotNshmItRAn
	aQJUO1PgJ/IZBkaGc9okX2UI6cQcTDJh8uAZsp3i9d+QuIHCpiowtT0l08Or3svyV+ByfjMq4B/6f
	EogleKxWkGwJspdGnDl4FjNOMmSV4B5//7bRFOv1SDZ1evAlFnDY7EJSEBRfUGNDn6MIbteWMVgY+
	UWX9TgvcnkfimqnnBuG8/2cFc6o2It5jTVevN1/czqX2NlsLNfbSvllKfjF8iyhUhJWtyOtmhbJiY
	ouk+/ahsSU5bYKfD4Eaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3dTy-003iQy-2b;
	Thu, 16 Nov 2023 14:36:38 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3dTu-003iPK-2l;
	Thu, 16 Nov 2023 14:36:36 +0000
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6ce2c5b2154so450885a34.3;
        Thu, 16 Nov 2023 06:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700145392; x=1700750192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQe83AHexfh3GazMLDTY5AyEL167MohegfRBMKLl7I8=;
        b=gRsxU+dJa1YJoRRRnkRYNixDzsgUI/Ku6nWS763qt+NONL16wr/WKSA+ow1fu3tysa
         CUc4QnFm01dkgsojB/IN6/Nmxhv0eP51viUhs6QPAvUh0Yak0+c9RuFg6dX33WENCbWp
         69X+l69YqrnnAFvm7pk62fkawPduqpmcyUoziBery4ySx1SHWmuaPv+L3s0aPYFPg6tv
         q5wfct8xcEd2tOoiZ6BH1mYmCMiqQKo2/s/uGJ/GRNBVuGGBrzetu4F37VQ0i8xQ9YhT
         tIOU4dG8XV0mBLsUclhh8zye7jvMxPqjfMqmksnjgpYvR5hU0nTcgtRhCdF5rbqaD3s/
         wcWQ==
X-Gm-Message-State: AOJu0Yxz8OoOy7FrFcUbFwC8nrFiTn/r1T+j5Bqh7iW977CjgSjQJpzO
	fbgEp4v1xqFYXg1Y3O+l36E=
X-Google-Smtp-Source: AGHT+IHU4Lxx+/myT+H5YB5iQwSXHLDIA41zmD2u+pjBktk3mb+GPBhIH+yVJJ2/AO7NCTzQtZy56A==
X-Received: by 2002:a05:6830:10c7:b0:6c4:ae52:9599 with SMTP id z7-20020a05683010c700b006c4ae529599mr9476568oto.7.1700145392505;
        Thu, 16 Nov 2023 06:36:32 -0800 (PST)
Received: from localhost ([2600:380:7a60:430d:7a98:972a:884d:31ff])
        by smtp.gmail.com with ESMTPSA id l2-20020a9d7082000000b006cd099bb052sm912460otj.1.2023.11.16.06.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 06:36:32 -0800 (PST)
Date: Thu, 16 Nov 2023 06:36:30 -0800
From: Moritz Fischer <mdf@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Haiyang Zhang <haiyangz@microsoft.com>, iommu@lists.linux.dev,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
	linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>, patches@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Krishna Reddy <vdumpa@nvidia.com>, Vineet Gupta <vgupta@kernel.org>,
	virtualization@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Will Deacon <will@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Moritz Fischer <mdf@kernel.org>,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 12/17] iommu: Make iommu_ops_from_fwnode() static
Message-ID: <ZVYo7s_dV9HDm1qU@archbook>
References: <0-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
 <12-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_063634_896196_5D4CFC96 
X-CRM114-Status: GOOD (  17.36  )
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

On Wed, Nov 15, 2023 at 10:06:03AM -0400, Jason Gunthorpe wrote:
> There are no external callers now.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Moritz Fischer <mdf@kernel.org>
> ---
>  drivers/iommu/iommu.c | 3 ++-
>  include/linux/iommu.h | 7 -------
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 5af98cad06f9ef..ea6aede326131e 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2928,7 +2928,8 @@ bool iommu_default_passthrough(void)
>  }
>  EXPORT_SYMBOL_GPL(iommu_default_passthrough);
>  
> -const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
> +static const struct iommu_ops *
> +iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
>  {
>  	const struct iommu_ops *ops = NULL;
>  	struct iommu_device *iommu;
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 72ec71bd31a376..05c5ad6bad6339 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -831,7 +831,6 @@ static inline void iommu_fwspec_free(struct device *dev)
>  	dev->iommu->fwspec = NULL;
>  }
>  int iommu_fwspec_add_ids(struct device *dev, u32 *ids, int num_ids);
> -const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode);
>  int iommu_fwspec_append_ids(struct iommu_fwspec *fwspec, u32 *ids, int num_ids);
>  
>  static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
> @@ -1187,12 +1186,6 @@ static inline int iommu_fwspec_add_ids(struct device *dev, u32 *ids,
>  	return -ENODEV;
>  }
>  
> -static inline
> -const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
> -{
> -	return NULL;
> -}
> -
>  static inline int
>  iommu_dev_enable_feature(struct device *dev, enum iommu_dev_features feat)
>  {
> -- 
> 2.42.0
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
