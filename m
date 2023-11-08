Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCF8C4167B
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Nov 2023 16:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQhKv8C/T1DN9uv515f3wXoA0j8aQ8p8PXzeVoFN/Ic=; b=2etVY1Tn6W18OR
	IPdkoIBmzJ1kUw9ruvaabKKEcjlME1S5eULJJjqh5tqZo7/9+zLKNI4zFfBECaBku8n42WWohbsPF
	ONqhtZj8b3cpBmEjr85u55RO60jJ39yk6T/IzvSZRHDzAzOtMSlO6ijHJ5Cz5rzp1yF9jIZ3HnsFQ
	+Nqhe393rK2gbakzIWRfX8Mji0BNXIOI2/82HQet0krPuoIdY/jq+bKxPTvGXJpBm0xD0PR8psvKv
	/3JCaUDaaouTHRiSWl/YfqmeZWs2/1qqS3D7/l9wpG0EdvltPIAHesSHUzOjkhvWLXoKBr6v8m08B
	S7feUE2gRivme7G5//bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0l9n-004Geu-0Z;
	Wed, 08 Nov 2023 16:11:55 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0l9i-004Gd1-27;
	Wed, 08 Nov 2023 16:11:51 +0000
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3b6a837a2e1so1343992b6e.0;
        Wed, 08 Nov 2023 08:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699459901; x=1700064701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egO/3A8usR47pYsFMHy7at49a3WUUkqONQqbQuU8j7Y=;
        b=k+JUR8WdFhjyZyBP3Tck8NXvEFgdFnKh+2IIJc1ILLU/qsPw43efpcszyIAuflKBCX
         jnDBg2omts9FRzlg9ruJY/qN6G2NUwsCQ9ypzxQR6+JZKyN3YxftznhBMo+tuQZ6af45
         ujyorfOlh8fnKjEC4L5WH/ZIWcFIivwQwxLITrTT1GVWkd9CDRyjk0TpE3eR8xXkQTdF
         oyrbO0EIOg+hSzydpdKUbaypcyHKX/xrhgA4PcwnINVnHDQCqNwzYk6EBY1qHX6SqSEo
         /uCqya9Kmfzv7j6/Zl6SFksBOuzyO5eeEW3WQEyAJjdp9+7Y/E+kmJrRIiMMWlf7ONhC
         d3jQ==
X-Gm-Message-State: AOJu0YxtNECux6mJGfVsOakuhCZ5tWleIymEkl6ShOvurF91uFZHylSq
	bj6dXSHyG4E6QOdUmaOdSA==
X-Google-Smtp-Source: AGHT+IFG1ydbraxTf3qUlkUHE402Zq2u5RjAY4fdhcYCPQiBAZE+mNt+Ni+JkQlZMBRuNIEkL2d3Ow==
X-Received: by 2002:a05:6808:15a8:b0:3a9:cfb5:4641 with SMTP id t40-20020a05680815a800b003a9cfb54641mr3241896oiw.48.1699459901513;
        Wed, 08 Nov 2023 08:11:41 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bg42-20020a05680817aa00b003afc33bf048sm1959000oib.2.2023.11.08.08.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 08:11:40 -0800 (PST)
Received: (nullmailer pid 2284755 invoked by uid 1000);
	Wed, 08 Nov 2023 16:11:38 -0000
Date: Wed, 8 Nov 2023 10:11:38 -0600
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
Subject: Re: [PATCH RFC 03/17] of: Use -ENODEV consistently in
 of_iommu_configure()
Message-ID: <20231108161138.GA2254211-robh@kernel.org>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <3-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_081150_690353_4A862402 
X-CRM114-Status: GOOD (  13.69  )
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

On Fri, Nov 03, 2023 at 01:44:48PM -0300, Jason Gunthorpe wrote:
> Instead of returning 1 and trying to handle positive error codes just
> stick to the convention of returning -ENODEV. Remove references to ops
> from of_iommu_configure(), a NULL ops will already generate an error code.

nit: "iommu: of: ..." or "iommu/of: " for the subject. "of: ..." is 
generally drivers/of/.

> 
> There is no reason to check dev->bus, if err=0 at this point then the
> called configure functions thought there was an iommu and we should try to
> probe it. Remove it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/of_iommu.c | 42 +++++++++++++---------------------------
>  1 file changed, 13 insertions(+), 29 deletions(-)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
