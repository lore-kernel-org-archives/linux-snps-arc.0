Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CA9C4332F
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Nov 2023 22:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBHJwlieV5F9tgWC6m4LyH3XtTZXjVEVW+wwEkcI7WU=; b=rPrsYIrUQr8r3S
	X9Wj0AmXj+Ay/qLR6sxH0mqWok1DHnOCYx6SdqtANmNhk2+IRwY45qRIFFC0qYNjWJuKo2biZOqRF
	PhXpTNB9ZzHAHT0j5mnnPqUBNl88wnDhJf+aZf7DiXpiq5SOxccVe8dtqNcvZrOtM7LSg4lhHf4Xp
	tGEHjclTInzLlfjox6v86QXL6DnLjUZOeicYPvFQFWAKrbHyhdq4WE+E8fmA9WuCL/KbX8aapgK7f
	zfNM41JMlhsMiMmF8fwhsqjulb0u5CjkSom2AE/7+RS4owpiJaHzA8LrvZcS8w851XNS+PW9K/1t1
	tITidEQmcrCPZACWG4kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qz2Gn-00CE5Y-1T;
	Fri, 03 Nov 2023 22:04:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qz2Gk-00CE3r-1t
	for linux-snps-arc@lists.infradead.org;
	Fri, 03 Nov 2023 22:03:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699049037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rXpne+78UGenenxYxx9+jLWMRynS8s68tp81l2tHoL4=;
	b=IdMprQ0xA6T2hFeeeHJ/9kuegBHcZEq9WQghye+QUoGISj7MhFS2ac3iN0QPXa4Qr1AvQ5
	nqnn47VW8E0VFHpQZrOT7QuC7MHQTIyBt21Y3CRYuTNko1Y25x2R1f6EdgBaW4K9Ai937D
	YJu5CGC0iJYdSPBRJ9cFbBwSTmELh4c=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-CCQZa7JtOoW0lKS54p8mcQ-1; Fri, 03 Nov 2023 18:03:56 -0400
X-MC-Unique: CCQZa7JtOoW0lKS54p8mcQ-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2803ea89cefso2093052a91.2
        for <linux-snps-arc@lists.infradead.org>; Fri, 03 Nov 2023 15:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699049035; x=1699653835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXpne+78UGenenxYxx9+jLWMRynS8s68tp81l2tHoL4=;
        b=hgGE6Nx+zNlqXSOUsdzGh72v1sOzpmQg8X7wXlHvvcdCjkt40TWKtoI2N638WKbGBw
         Ymsb8fLzK5gB9CaKTA+s0FrvvU8TzqwG+TGiKW7obNdm7mBTKIGsJzBT7K0QThlUQvfb
         cbAYQUbxQmMS5M5MsswTpnbav8RKphaLlMnq3/CpGdppUj96Hlc8tpjbLXshdFutGjwP
         qMbtv5Gk0ybHDaY0ZXNPH1P3tZu1rLRsqN/bP4r7MQtI7QnkKSA4ubya1D0wtCmU3q4/
         Le6pauf//evuezGVtPEI6H7h8IYVYRWOY4ST2x31vpWHnvPUireIZC3ex86o1MW6DgNd
         2vOA==
X-Gm-Message-State: AOJu0YzIyKS/Xb8/99WkOujL7emnuVVKUDhRBAl58eS8IyCJyyNJkvBy
	5rVrzy+hbL7hgJbcbUSBgB8MYBwV1uPMOk700/OUSw66spKnIzJTOfBmhicp9c0Kynf0PonZ7c0
	h/IvNPYDwTyYRyCEDrRIYOHo146y8yoW6
X-Received: by 2002:a17:90a:7547:b0:280:2609:6d47 with SMTP id q65-20020a17090a754700b0028026096d47mr15580973pjk.19.1699049035276;
        Fri, 03 Nov 2023 15:03:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS5Dh794kn050Jmor3G/4m9PpE2w1GtTAul8MncDw85TpgTEhPbh0ocZRGWoVXSassV2SO7A==
X-Received: by 2002:a17:90a:7547:b0:280:2609:6d47 with SMTP id q65-20020a17090a754700b0028026096d47mr15580944pjk.19.1699049034936;
        Fri, 03 Nov 2023 15:03:54 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id v3-20020a17090ad58300b00280976d4ce3sm1815162pju.37.2023.11.03.15.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 15:03:54 -0700 (PDT)
Date: Fri, 3 Nov 2023 15:03:53 -0700
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
Subject: Re: [PATCH RFC 03/17] of: Use -ENODEV consistently in
 of_iommu_configure()
Message-ID: <4iktbjhxkddukf7vywxquz5ffgik73wdw7p7rdqhsbsumhzhsl@y6u7tjbczafc>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <3-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <3-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_150358_719709_1A176241 
X-CRM114-Status: GOOD (  18.74  )
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
> 
> There is no reason to check dev->bus, if err=0 at this point then the
> called configure functions thought there was an iommu and we should try to
> probe it. Remove it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/of_iommu.c | 42 +++++++++++++---------------------------
>  1 file changed, 13 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index e2fa29c16dd758..4f77495a2543ea 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -17,7 +17,7 @@
>  #include <linux/slab.h>
>  #include <linux/fsl/mc.h>
>  
> -#define NO_IOMMU	1
> +#define NO_IOMMU	-ENODEV
>  

With this the following can be simplified in of_iommu_configure_dev_id:

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 4f77495a2543..b9b995712029 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -61,7 +61,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
 			 "iommu-map-mask", &iommu_spec.np,
 			 iommu_spec.args);
 	if (err)
-		return err == -ENODEV ? NO_IOMMU : err;
+		return err;
 
 	err = of_iommu_xlate(dev, &iommu_spec);
 	of_node_put(iommu_spec.np);



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
