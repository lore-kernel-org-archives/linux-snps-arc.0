Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AE0C4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Nov 2023 16:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvbHCeT1DR8cT0+SuIg64F8e/r3b+AuhLJXHDTFzJEs=; b=VO2IyzicrBwfAF
	S3InpTKP3vylOgnGgSx+pbfVbmxbFrUgpi07Ot4k5g8AxEH3vTQp32JFSxF2mK/UkxtV3xBX9MfLI
	USYF/1PEAivonLlJlvjzlFg1jRSODoYRLnwMtsPIIfP0PF8MlvGZDr61pQla45zcr+wSi504CAIdD
	aHrKMT1/7oeDORMo5k7kibIQEIg3euSOT6cFMiKZA2qfg7jAwMtGaJcKd6Q/PWkbom7B809uSNIwV
	ymLHPViyV759YYV1pDx9ziDk2La6YSb7r8WRUsGuDwgz1PD/xRJuaaGU+EXHTudSooCOArfarcsAh
	EDsVZpMVpFrgcL042fXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0lEv-004HE6-2w;
	Wed, 08 Nov 2023 16:17:13 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0lEq-004HCY-2X;
	Wed, 08 Nov 2023 16:17:10 +0000
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5869914484fso3854513eaf.0;
        Wed, 08 Nov 2023 08:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699460226; x=1700065026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhueBKTq066e4mLfKHRgK40ZdUHgCtrKWznR5J+LNwA=;
        b=VX8wwls2D3my3lMSfidmDj55UkfPKVHaYDoZO87dHJzZLHa98LD3mxxsXy2cVkG5nj
         87gMSZhLNNDsgsFObOho4NuLeml1Lwq5qq5kkJG5u4Xsl3QsqrbQ8mMLwkv7mQ9iBgU5
         2aCS597foEb3y9E94GVCcTy+YlGbBLGt/GJw4Z6T6VPHzJNDUOPU71ObmovWxnNpU9z7
         RkERdUfizVCCM+R4VL+ONViHFtVrUnDL9RGpAMjBNcFz/hRgyuDQSEZQ05N4jqTUfzZ1
         EsT38/L0/W91oZ3Sz35EogZY5K3ulujBw+ei0aK/a4b7cjDUunJPJWz/WM8SVzML1294
         flag==
X-Gm-Message-State: AOJu0YwthOYU91F2da45HRptkUafcFbCLE6NazRN6Jcd4OZxReKIMuhN
	Tekjm2weIm6FEQdhoPN76A==
X-Google-Smtp-Source: AGHT+IFe/wqQx7jqSarQLsP5AynmlF1OwPY0v3LIXJSKefg7OTaZGlvutVeUSHDrZS8dzbY2HrAlbA==
X-Received: by 2002:a4a:c208:0:b0:581:ff36:702b with SMTP id z8-20020a4ac208000000b00581ff36702bmr2227049oop.8.1699460225482;
        Wed, 08 Nov 2023 08:17:05 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b24-20020a9d6b98000000b006bf0f95f702sm1914773otq.64.2023.11.08.08.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 08:17:04 -0800 (PST)
Received: (nullmailer pid 2331961 invoked by uid 1000);
	Wed, 08 Nov 2023 16:17:02 -0000
Date: Wed, 8 Nov 2023 10:17:02 -0600
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
Subject: Re: [PATCH RFC 02/17] of: Do not return struct iommu_ops from
 of_iommu_configure()
Message-ID: <20231108161702.GB2254211-robh@kernel.org>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <2-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_081708_821904_DD11324F 
X-CRM114-Status: GOOD (  11.51  )
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

On Fri, Nov 03, 2023 at 01:44:47PM -0300, Jason Gunthorpe wrote:
> Nothing needs this pointer. Return a normal error code with the usual
> IOMMU semantic that ENODEV means 'there is no IOMMU driver'.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/of_iommu.c | 29 ++++++++++++++++++-----------
>  drivers/of/device.c      | 22 +++++++++++++++-------

Acked-by: Rob Herring <robh@kernel.org>

>  include/linux/of_iommu.h | 13 ++++++-------
>  3 files changed, 39 insertions(+), 25 deletions(-)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
