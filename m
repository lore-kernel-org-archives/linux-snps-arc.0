Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4FCC4332F
	for <linux-snps-arc@archiver.kernel.org>; Sat,  4 Nov 2023 00:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWnb7w/LaOs2f7wnZMEs68eURF5sP+OhNQHa9p4tqqg=; b=tn1MijJn4buXBH
	5Di4zpXESU1OGlMKN49/ACnrmhJLy0/jW/KA2qe3krx1y7Yuvwo1Co80prAQrZdi5ZXNpqwcNO0xB
	7MoJ5alG4lQ2HSWU2RIH6HZfNWyMMLCMZwYM8erAqKew0fys0tjcjpwbSpcUuPfEFtIRl/og6J+yP
	9otZD3q2alIyo1It0MyEWuesneyDxZQSLEXSBZBXACdOjpxOfHYC/VUlq9r0+a+wdVbhqaGa+kp5w
	Exml9A9nNYoieG/UaHtDs8hRaGubQaAfOQDZb60sFW2AbLTwzJ1yOaBBGvkKsMNasTRywri8eFTc5
	S0bM7ZtWCUAZ8ijRZqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qz4pe-00CPPU-2O;
	Sat, 04 Nov 2023 00:48:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qz4pc-00CPNz-1G
	for linux-snps-arc@lists.infradead.org;
	Sat, 04 Nov 2023 00:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699058887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mWMUyNNUnPsRLjoGsaCfd4VrJc7Ffw/kOlF19kCtm60=;
	b=dD5GlHUiQzmymUVI966xfWvX1xbKMXd1Jo7daOWQM37jLQoHVGHa4rNDOHluSlhAmP952K
	agy7FsG5Ht8Vl0FOMce2Ve14BhJc+vpJFSJ9m6atO/g16PbEjsrIXOXFJ+1KN3te/982e6
	Qyjs4levQw1lPVYCvS9EQcHSWMgNSwQ=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-hWxvWsgSNwy0hH564-LCLA-1; Fri, 03 Nov 2023 20:48:04 -0400
X-MC-Unique: hWxvWsgSNwy0hH564-LCLA-1
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3b3e82429edso3627859b6e.2
        for <linux-snps-arc@lists.infradead.org>; Fri, 03 Nov 2023 17:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699058883; x=1699663683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWMUyNNUnPsRLjoGsaCfd4VrJc7Ffw/kOlF19kCtm60=;
        b=QHclOka7InZv/9crzix2L1G0FG+l9ASrqRRJC6F5R+mJUbsN/iX7zhii9zCDbOPSXp
         MOzQjZkl2MHS7RjPHZkN5hA+cI6nOC+TSDaUG7AW0UrPHRbLnaM7rBAuAwUIqKh/zBm8
         JwgwUomRpGkD3GiVE/vyqC6psDFe82gsgqYOmo6nIBJxPEF7XnXX6pfo5KRkQwV7OvDx
         R+wi8wvHcp0bOZlA41saaEdxFnx+f2yyYzP0t3xLqG4OsLhb6N5CUa2/B9WWJITA/JbV
         w4UEwhsIis+I4RpimjWkWWQoYnx3jBtQC5EtSvOTm4RJj9bsS4qI1+iCMlQdz3KjCJg7
         ypDQ==
X-Gm-Message-State: AOJu0YwVDCVSC4CwBiJ0oJV29cIyu+diGeWtwFt3c2zhrZ47K6yno1an
	Vs/dqwX1KFW4fttsd5hAUAYUFazHMOS33336ITDQwBVNmFX7ubBNmNEV45Qd4k2jdIGaRw9PT//
	rKL0NMaEL4ebPhNOb97Z/2kwBbqee74Eq
X-Received: by 2002:a05:6808:2e90:b0:3b5:95eb:f76e with SMTP id gt16-20020a0568082e9000b003b595ebf76emr2039986oib.24.1699058883444;
        Fri, 03 Nov 2023 17:48:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbl3cnWwz1S+869RAlRQHhIhHXgs+QsQ+oiCvUWDqrKYbBZJdPrVYEi95zUnZ7fv/l03IwvA==
X-Received: by 2002:a05:6808:2e90:b0:3b5:95eb:f76e with SMTP id gt16-20020a0568082e9000b003b595ebf76emr2039947oib.24.1699058883200;
        Fri, 03 Nov 2023 17:48:03 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id n23-20020a635c57000000b005b458aa0541sm1838143pgm.15.2023.11.03.17.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 17:48:02 -0700 (PDT)
Date: Fri, 3 Nov 2023 17:48:01 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linuxfoundation.org, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Lu Baolu <baolu.lu@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Frank Rowand <frowand.list@gmail.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hector Martin <marcan@marcan.st>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Krishna Reddy <vdumpa@nvidia.com>, 
	Vineet Gupta <vgupta@kernel.org>, virtualization@lists.linux-foundation.org, 
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: Re: [PATCH RFC 04/17] acpi: Do not return struct iommu_ops from
 acpi_iommu_configure_id()
Message-ID: <xvgdxrlcpvafst6qypgwehtleaihsedgoiat6akv6au2j4xrjw@rk4dl4xbnq6o>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <4-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <4-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_174808_527222_57A1802D 
X-CRM114-Status: GOOD (  16.51  )
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

On Fri, Nov 03, 2023 at 01:44:49PM -0300, Jason Gunthorpe wrote:
> Nothing needs this pointer. Return a normal error code with the usual
> IOMMU semantic that ENODEV means 'there is no IOMMU driver'.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/acpi/scan.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 

...

>  #else /* !CONFIG_IOMMU_API */
> @@ -1623,7 +1624,7 @@ static const struct iommu_ops *acpi_iommu_configure_id(struct device *dev,
>  int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
>  			  const u32 *input_id)
>  {
> -	const struct iommu_ops *iommu;
> +	int ret;
>  
>  	if (attr == DEV_DMA_NOT_SUPPORTED) {
>  		set_dma_ops(dev, &dma_dummy_ops);
> @@ -1632,10 +1633,15 @@ int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
>  
>  	acpi_arch_dma_setup(dev);
>  
> -	iommu = acpi_iommu_configure_id(dev, input_id);
> -	if (PTR_ERR(iommu) == -EPROBE_DEFER)
> +	ret = acpi_iommu_configure_id(dev, input_id);
> +	if (ret == -EPROBE_DEFER)
>  		return -EPROBE_DEFER;
>  
                return ret; ?

> +	/*
> +	 * Historically this routine doesn't fail driver probing due to errors
> +	 * in acpi_iommu_configure()

              acpi_iommu_configure_id()

> +	 */
> +
>  	arch_setup_dma_ops(dev, 0, U64_MAX, attr == DEV_DMA_COHERENT);
>  
>  	return 0;
> -- 
> 2.42.0
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
