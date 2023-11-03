Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEEFC4332F
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Nov 2023 21:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQimzLF5vkx8z9t8JEUeH05DxurmIZdspuXzW4l+f74=; b=gwK1LaTMrGEiCn
	qXsLZxMEEaiovj0eNA8JQkF+K/Cr5RTkAr+BwlHPU5dDDJErUIoxtveVJNOSinEwcuqf5Hun94ymg
	KtIBQbJGvx3yWLAbA9EIYFtBv/Tm2pq5Ha/ZVy2em7vm/81lww4oKYJvge1IqeQ/+yX+QdEsRSdEX
	fZhOcuo10CRKNiL4FBEbcvxgGoLkSaGhg2DQe2BxzoSorW78JSIFOAqiBTzlZiwxbx788URKIhNMX
	P6MGP7rRXmotA0p0Wgw1RX9MkdGbwR7yIuy179AKgEBJtrQYeDNw/yqMrq4U6em8XH2C2VjM7r5Ag
	yyCDvz+mzsAkg2WTrPgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qz212-00CCpo-2T;
	Fri, 03 Nov 2023 21:47:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qz20y-00CCns-1j
	for linux-snps-arc@lists.infradead.org;
	Fri, 03 Nov 2023 21:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699048059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F+aB8ULpCtjf+Gcfe540UtUd+NJKrSGjq+RpmL2JNA8=;
	b=RgRwyvVZweBgVGAk6L6MhvfxHJGscaB6d5jr81JqVo4s0w9hsRIIEJlnDURFJdyV/1J0iz
	/c/m5cNh+TfxAKUfmrEmNmD4fs0wdbDaZnpOKBltp0OAevh4Ooh51xDB1BjBakijtxwsnp
	7VVb4wGJKRJUy+7aoZL0i1bFIvOldb8=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-9dKKQhIBNFSk-SH5s-F9PA-1; Fri, 03 Nov 2023 17:47:37 -0400
X-MC-Unique: 9dKKQhIBNFSk-SH5s-F9PA-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1cc3ad55c75so20177605ad.0
        for <linux-snps-arc@lists.infradead.org>; Fri, 03 Nov 2023 14:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699048057; x=1699652857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+aB8ULpCtjf+Gcfe540UtUd+NJKrSGjq+RpmL2JNA8=;
        b=V9ObAn2kYGkB18/UyNPb2bZZpCumye7Vw8zxA8nEfl6I0QEj6ohJEeHP/SZ8aSQW6V
         dVWtGk856U/jwiAiycQwVDyQY7Yi8MvHJ+cc0WLMBnrE5xDn1qepjmqIO0KZIhTLt75z
         ndkPslOx37OgDyRjX+39RX4dR6GxmdZCqgSS83B5BcPQorkWy4zoiGRwUjJ9vFUDfODa
         K1GuZ2g/rwgB9hzCNPrcgeI/8V3ykhhIQ+TJ5ZhilccQaY7Hd/9c7/6LfPYULX5VV1Ha
         ZPT+Ltc5y3bb8ep0yq0BQ9LWLqPY38UsVJ/deC2QLOhJjpXUXWfKD9MndHpoa8aVh6tT
         GJCw==
X-Gm-Message-State: AOJu0YxVioV44BqmLyVo4P+5cqFmVt1skAzYYt2riVEtlxVhN92wBbEP
	efVmQ9fZNo+/Mz2+bhfj7kpC41DANVnouUSfCOXGGfLd5AIKDNNgxmvwfAoudC+ymAnatpT9Ujj
	mr2FetVak5Ow01mKCXRUYftB3h1BFcbbM
X-Received: by 2002:a17:902:d28b:b0:1c7:755d:ccc8 with SMTP id t11-20020a170902d28b00b001c7755dccc8mr17083761plc.29.1699048056768;
        Fri, 03 Nov 2023 14:47:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdAXninLAKiU84+Ewx4UvETdEvykTsgu1OMaAqceXcjYCMbCq9Ef0fn5aeDPHxQVvb9/cevQ==
X-Received: by 2002:a17:902:d28b:b0:1c7:755d:ccc8 with SMTP id t11-20020a170902d28b00b001c7755dccc8mr17083727plc.29.1699048056432;
        Fri, 03 Nov 2023 14:47:36 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b001cc2c7a30f2sm1807591plg.155.2023.11.03.14.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 14:47:35 -0700 (PDT)
Date: Fri, 3 Nov 2023 14:47:35 -0700
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
Subject: Re: [PATCH RFC 02/17] of: Do not return struct iommu_ops from
 of_iommu_configure()
Message-ID: <2qhocnpfy4lbmfm4erccztrwoec5sjphvktcyvxdb75qbjyozu@aht6gj2zzuhj>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <2-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <ld3rrnpix5x5kirfjlk6oafhoikkge4fgvcljhmiljuqge5266@asdcw5cfp53e>
MIME-Version: 1.0
In-Reply-To: <ld3rrnpix5x5kirfjlk6oafhoikkge4fgvcljhmiljuqge5266@asdcw5cfp53e>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_144740_645496_01E5DC6B 
X-CRM114-Status: GOOD (  21.46  )
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

On Fri, Nov 03, 2023 at 02:42:01PM -0700, Jerry Snitselaar wrote:
> On Fri, Nov 03, 2023 at 01:44:47PM -0300, Jason Gunthorpe wrote:
> > Nothing needs this pointer. Return a normal error code with the usual
> > IOMMU semantic that ENODEV means 'there is no IOMMU driver'.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  drivers/iommu/of_iommu.c | 29 ++++++++++++++++++-----------
> >  drivers/of/device.c      | 22 +++++++++++++++-------
> >  include/linux/of_iommu.h | 13 ++++++-------
> >  3 files changed, 39 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > index 157b286e36bf3a..e2fa29c16dd758 100644
> > --- a/drivers/iommu/of_iommu.c
> > +++ b/drivers/iommu/of_iommu.c
> > @@ -107,20 +107,26 @@ static int of_iommu_configure_device(struct device_node *master_np,
> >  		      of_iommu_configure_dev(master_np, dev);
> >  }
> >  
> > -const struct iommu_ops *of_iommu_configure(struct device *dev,
> > -					   struct device_node *master_np,
> > -					   const u32 *id)
> > +/*
> > + * Returns:
> > + *  0 on success, an iommu was configured
> > + *  -ENODEV if the device does not have any IOMMU
> > + *  -EPROBEDEFER if probing should be tried again
> > + *  -errno fatal errors
> 
> It looks to me like it will only return 0, -ENODEV, or -EPROBEDEFER
> with other -errno getting boiled down to -ENODEV.
> 

Ah, I should've looked at the next patch first. So, never mind on this
and the question about the dev_dbg.


Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
