Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63589C4167B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Nov 2023 20:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idSt1J8B448bTYM/OyIPp9GCwRbTiwC5r70wUJDS1wM=; b=DFgTliQnSBqtBY
	FjhQryjSQ8Qr17pnCiEJXjb8iklVrQdOuZ2r4TCGyH6GBa5BtabQMi5XUGMX+Apv4/2n9e3H9dVh9
	2/p47/iiulJ2P93S08CuLAv9GTb2CGNkoUOuxufJ1ZLkongg0/POnxapK35GuHHe5UqqhivHIPDzj
	WOWDeDt0fsJJQ53CsotF2KNfAyBHPclmNVE0V7Kmb+owvyychvGNsLBnGf3xeoXuaQe6pPwUhyjyp
	1chKlmWpUg6NT/7FE8w7SyzGzqlFoDE5bPa4rWQ4CznF0KVDT65rvVU3Gb1nfgFPO269WjgvX0nDV
	jaNZPnNsMmcW1G/gW4Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dTA-00EfD6-2w;
	Mon, 13 Nov 2023 20:23:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dT5-00EfC0-2L
	for linux-snps-arc@lists.infradead.org;
	Mon, 13 Nov 2023 20:23:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699907014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=UDz++v728cnjhBP5mHYKtusMPfGvPebQ2vefvEtyu2yOvPumEttY9cJ1kovly7+R5iRQOB
	YyeudiBEdTNh5w21tWRNPYKpHXj1LSfXS5jAtvD1H6m0/nvgtRfvt6YOzriZKEv7MTbCc4
	VY+0SGAR/lnTFLOSlskIg3+CjYUCfvE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-Dcuudqu1M5-J-99yclhHNQ-1; Mon, 13 Nov 2023 15:23:33 -0500
X-MC-Unique: Dcuudqu1M5-J-99yclhHNQ-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-41e58a33efaso58139631cf.2
        for <linux-snps-arc@lists.infradead.org>; Mon, 13 Nov 2023 12:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699907013; x=1700511813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=EabiMcWJ6/yd8xXIzjPbik/LtSi2/xM6QS5iQJIpFs7FbbUrr+4twJb+TlgQ4x0aGg
         bcbxzeESl5JjtHnZtdnqcwn+MXFdWgsIOQQBQCiBduSkuWMsVlwuAt6/6/9Zjv/++09+
         6Y6PTx++TYxFxl6l3ExEo3eJbFm9/yD11/D2l3TV/+jyYiwuACu2dA/4ZbZQRzgQyqVJ
         7oNHcXYdUf+gIrZbkAJrfn379PPWYF8MXbRIjDMIX0qIpE7sWLlXxV4lbbno65EQ3GZw
         ojdrjsnaB2TmQbzIy4HmEtOTnmljD7+LpPB5gkizbzaKybCNDzkWMtS57UiDsWgnGmGt
         kfog==
X-Gm-Message-State: AOJu0Yxq0+CxnaEEqkt0PXk1wwrxMZIYjzPKIWv59XpeTqsBmS3NJxuj
	hgtpSbwreB8UMkCSBYLpQzSl2q+eXMHh+RB3TXI7d+imiIFukMm88WTwKWTuv/9UIBoxUd7ci8s
	yIZjn3EV2CSMZik3fVUS2qJGx4l3UpVQv
X-Received: by 2002:ac8:7dcb:0:b0:41c:c489:5737 with SMTP id c11-20020ac87dcb000000b0041cc4895737mr181029qte.52.1699907013276;
        Mon, 13 Nov 2023 12:23:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETLe6ua2NZBk5C5HvQsSQRhq7xoJL++WLnwlLCZjQoU3YIRy9czQKgZx9fuBDkEqY7LDc6Jg==
X-Received: by 2002:ac8:7dcb:0:b0:41c:c489:5737 with SMTP id c11-20020ac87dcb000000b0041cc4895737mr180976qte.52.1699907013032;
        Mon, 13 Nov 2023 12:23:33 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id z10-20020ac8710a000000b004196a813639sm2177639qto.17.2023.11.13.12.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:23:32 -0800 (PST)
Date: Mon, 13 Nov 2023 13:23:31 -0700
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
Subject: Re: [PATCH RFC 15/17] iommu: Add ops->of_xlate_fwspec()
Message-ID: <j56kfjb5dt3drcxh56lyc4om3qjnwddot2i5f62f6u6gwefj7i@rxmgclwaevf4>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <15-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <15-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_122335_880117_B53B579B 
X-CRM114-Status: UNSURE (   6.62  )
X-CRM114-Notice: Please train this message.
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

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
