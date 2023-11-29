Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A31BC4167B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Nov 2023 06:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjPVVBS1esHqULIgpYzuysRUuZ6QXjqjp9BevwFGM5o=; b=kc1CFYQsRVZmG+
	ozEJC37+7ufwzh5CRbI36la8Vu4e93T2515EpCUSiWsUlraq/pHzxyJmq4x1nqRrgiV4qYSMMqpj3
	5Emz0OUP8Lwcb5vRTv5ldXTfeUyHG3bTRMuccBTgWcOFHe37TCMLhc5/3Jdu/Rr53BZb1LnMfh6gw
	zCv+WhHxJyTKEjSmyEu3lviANBLYhP4Q/7ze6CoDkGRyrUQj7CJFFyOnnmDSly1sVspduwPfVvzbB
	yS6F2WsnsDjqsk0YBSlh9GvH3XYupFvsojbbox27Jged1IW8AwkSxGl/Kjx+ORYPQ5Lr4vX1rW/oo
	Ugx/+G3gRRSFG9ieVwRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Dl4-007BeA-1v;
	Wed, 29 Nov 2023 06:09:14 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Dkz-007BcF-0F
	for linux-snps-arc@lists.infradead.org;
	Wed, 29 Nov 2023 06:09:11 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5ca2a6f07b6so93427187b3.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 28 Nov 2023 22:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701238147; x=1701842947; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KtrAPaslMvSrZFznq3cpY4nyS514mOCdxUhLK1bsTtI=;
        b=DJ2VEso2sYPPmOyuvX4coVlifbiEMRRb8P0dciioZGPqB9HXB4H0mzLPGpH0vmcCp1
         ZvjJ0x+wTSxngsvmktPJ6uz4oit1bzAKxPuAbxWx1Io5c7cJ3WfP8DZUAyD9UeDUc0WO
         UbLfzLKYgtSf4KxRWtNX7RdIahoIsF/wH4DZjGj8cX+XhTDwBhdkmvnOejG+Se/gJbpt
         NyGv8zMjC3zvsK8D1HIvzTZhAFcF9p9aJR1/2oG/4J2qRf59ueSmyProlcrXvCWws6u/
         mx1rtF5YNdiRC9vdsdmzR5i3XEx8GuYamq+atrokZRvIGMb8jz5DzPWPymFScw7CBXrk
         sHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701238147; x=1701842947;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KtrAPaslMvSrZFznq3cpY4nyS514mOCdxUhLK1bsTtI=;
        b=mwRcTWYteCtNuFIaRMM9a92iOIbnVMvYSfndfMMEKj/ekLPrIrqzwonEvW4Xkpf4ue
         AOMQdp0WQT/nlTlgGq0O+krt7K1VO4nADxg81qGuzzEeGVRPdsRo85UXhB8bWSpABCBz
         Xer6yBilC2UrSS7GzAcmUGZkK2IA3ZcFQcX/HPnQKK5hSaRDH0OInEkdhT1gMEJVAF1E
         sYdO6nIZVZQeEoV8PSnCnSlnajnuOsXFOj2+Jwj35+5ksiqJY77pmrruvwgKRVzX0l43
         7HuFHylKomBiz4WnqCyN0SRgWW2+CKjtZcbNRCQ4VjLvhb7+ecP6Hv7Z8lgdAvhP6VuC
         jgiw==
X-Gm-Message-State: AOJu0YyyxePiAk6pH6MkrA062YRdv+XS6Zi1PqLTmGlEbDuonbgtmPXN
	JmXP4okNEyGAWFh7FyZ3U4QZmBQoqaWV
X-Google-Smtp-Source: AGHT+IErKpR33sSuZDb458AGzbTTTl+rmkeUZNxvoUYyius6/ySrcsirHg/Fcs0NR9CFHutX0EyL3PHfE3h2
X-Received: from morats.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:d9e])
 (user=moritzf job=sendgmr) by 2002:a25:3741:0:b0:db5:2a4:aef1 with SMTP id
 e62-20020a253741000000b00db502a4aef1mr107973yba.13.1701238147290; Tue, 28 Nov
 2023 22:09:07 -0800 (PST)
Date: Wed, 29 Nov 2023 06:09:06 +0000
In-Reply-To: <7-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Mime-Version: 1.0
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com> <7-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Message-ID: <20231129060906.qti7uztsk2u7ehlp@google.com>
Subject: Re: [PATCH 07/10] acpi: Do not return struct iommu_ops from acpi_iommu_configure_id()
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
X-CRM114-CacheID: sfid-20231128_220909_112005_A3BF8A83 
X-CRM114-Status: GOOD (  22.14  )
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

On Tue, Nov 28, 2023 at 08:48:03PM -0400, Jason Gunthorpe wrote:
> Nothing needs this pointer. Return a normal error code with the usual
> IOMMU semantic that ENODEV means 'there is no IOMMU driver'.

> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Tested-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/acpi/scan.c | 29 +++++++++++++++++------------
>   1 file changed, 17 insertions(+), 12 deletions(-)

> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 444a0b3c72f2d8..340ba720c72129 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1562,8 +1562,7 @@ static inline const struct iommu_ops  
> *acpi_iommu_fwspec_ops(struct device *dev)
>   	return fwspec ? fwspec->ops : NULL;
>   }

> -static const struct iommu_ops *acpi_iommu_configure_id(struct device  
> *dev,
> -						       const u32 *id_in)
> +static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
>   {
>   	int err;
>   	const struct iommu_ops *ops;
> @@ -1577,7 +1576,7 @@ static const struct iommu_ops  
> *acpi_iommu_configure_id(struct device *dev,
>   	ops = acpi_iommu_fwspec_ops(dev);
>   	if (ops) {
>   		mutex_unlock(&iommu_probe_device_lock);
> -		return ops;
> +		return 0;
>   	}

>   	err = iort_iommu_configure_id(dev, id_in);
> @@ -1594,12 +1593,14 @@ static const struct iommu_ops  
> *acpi_iommu_configure_id(struct device *dev,

>   	/* Ignore all other errors apart from EPROBE_DEFER */
>   	if (err == -EPROBE_DEFER) {
> -		return ERR_PTR(err);
> +		return err;
>   	} else if (err) {
>   		dev_dbg(dev, "Adding to IOMMU failed: %d\n", err);
> -		return NULL;
> +		return -ENODEV;
>   	}
> -	return acpi_iommu_fwspec_ops(dev);
> +	if (!acpi_iommu_fwspec_ops(dev))
> +		return -ENODEV;
> +	return 0;
>   }

>   #else /* !CONFIG_IOMMU_API */
> @@ -1611,10 +1612,9 @@ int acpi_iommu_fwspec_init(struct device *dev, u32  
> id,
>   	return -ENODEV;
>   }

> -static const struct iommu_ops *acpi_iommu_configure_id(struct device  
> *dev,
> -						       const u32 *id_in)
> +static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
>   {
> -	return NULL;
> +	return -ENODEV;
>   }

>   #endif /* !CONFIG_IOMMU_API */
> @@ -1628,7 +1628,7 @@ static const struct iommu_ops  
> *acpi_iommu_configure_id(struct device *dev,
>   int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
>   			  const u32 *input_id)
>   {
> -	const struct iommu_ops *iommu;
> +	int ret;

>   	if (attr == DEV_DMA_NOT_SUPPORTED) {
>   		set_dma_ops(dev, &dma_dummy_ops);
> @@ -1637,10 +1637,15 @@ int acpi_dma_configure_id(struct device *dev,  
> enum dev_dma_attr attr,

>   	acpi_arch_dma_setup(dev);

> -	iommu = acpi_iommu_configure_id(dev, input_id);
> -	if (PTR_ERR(iommu) == -EPROBE_DEFER)
> +	ret = acpi_iommu_configure_id(dev, input_id);
> +	if (ret == -EPROBE_DEFER)
>   		return -EPROBE_DEFER;

> +	/*
> +	 * Historically this routine doesn't fail driver probing due to errors
> +	 * in acpi_iommu_configure_id()
> +	 */
> +
>   	arch_setup_dma_ops(dev, 0, U64_MAX, attr == DEV_DMA_COHERENT);

>   	return 0;
> --
> 2.42.0


Reviewed-by: Moritz Fischer <moritzf@google.com>

Cheers,
Moritz

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
