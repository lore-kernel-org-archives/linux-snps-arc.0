Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C43C4332F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Nov 2023 20:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idSt1J8B448bTYM/OyIPp9GCwRbTiwC5r70wUJDS1wM=; b=0gqoJSZdvYqVwP
	vDwyRLss7Yka3IwnDkHyb4JMEEcQw2QUTi0p8xpxRbITn5Zpg9r5PG8jNl3M9djsUHcaYQgfeHCuU
	/s05/t3Hdk16Crma8Dh7cDrGeYvdqiBt5bfaN/Gwuz8xj8C94xdb5lmis0VNdX8hs7yH7Ftnjs0bo
	kniU3c7cjX1bAoFukf/FsM5cGHEeJqrBurgd3aTN+lcoOR7AQEVGXJ1Mnc5w+9xRpPGB0D62Vs+3+
	A1Mpu568790jPzg+PNzEVlMDAoP8B7+LIzwFK3TRjpMaWM4y4D2Eqp+pIcEadeGtk3d54eCPnRikN
	8E7x4tCODA5v7AEy/NuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dOj-00Eelv-27;
	Mon, 13 Nov 2023 20:19:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dOh-00EekQ-1K
	for linux-snps-arc@lists.infradead.org;
	Mon, 13 Nov 2023 20:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699906741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=N5VtVlBdaqEHuY492h0JjSZZ1GoadmiXVvQacaWoxj2HA0hDf+7JoRGQmhSc6tMG8eHHxm
	Y6pRHz+Ac3Wx+fw18gXjwFpsF2ut/krpKaI3duXVxjIyACFDCoSo8ypz5URFWFPcOBsIE5
	OcHlYzvyTQZf9VYrtmBFr9xLFUuHqko=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-XOeLQqcdMsa2Ms625viFwQ-1; Mon, 13 Nov 2023 15:18:59 -0500
X-MC-Unique: XOeLQqcdMsa2Ms625viFwQ-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-41b83b8dbe1so58232911cf.1
        for <linux-snps-arc@lists.infradead.org>; Mon, 13 Nov 2023 12:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906739; x=1700511539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=MBVdm2dbh2VFSEgbwqXt48fsa+sCecqU9pqZuC0PVbIfVy4lH442l8EhdGp77T80kN
         HmqP1q1pjNokaKqLntcPrQYcqls1f3klGykGsVMmpA8cM2uN3c7UcXXTyLOLuJ5bKm1G
         OnUXDLLHT3rmznslFyv+z+0g8ZNhGa4Zm4Cs2w2p3hL6OwnvAUDxUI3gmlSX2ux+uXvo
         Gh3pTuHHyrW3K3P6Djy8a2ho8YAOslGuI4/n3qhRPqoRM+8N+RyEBe6kiORGIZtZWHuU
         SpVvxxrPIL56JZVe7PyijtoJ0WVZBYMiOzfI/ljBosHJgya4gNeWnnPp0wvyrYXLoIHG
         i2mg==
X-Gm-Message-State: AOJu0YyMxrLfxdX70AUN/KQxBU4Js2WWB1H4ow7xZtKDRloy5ks3PFRl
	Alvc3IZ63ST9MtXX9D6H2xpNS9XhnU+GBd2s73DSb2HFU1LZG5iTarHljAXd6a10Z97pljyLHe/
	7Ud4X8pq4agH33uMyuCd9w9VxNO4gpKXH
X-Received: by 2002:a05:622a:1908:b0:41c:b6cf:a49e with SMTP id w8-20020a05622a190800b0041cb6cfa49emr292158qtc.10.1699906739321;
        Mon, 13 Nov 2023 12:18:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ4aN/cKUvDweqjuNq1K11+iEyXGsjit6950JrTQD9aZT2d8xoiBctpmKNKw2vmVX7XqpdQA==
X-Received: by 2002:a05:622a:1908:b0:41c:b6cf:a49e with SMTP id w8-20020a05622a190800b0041cb6cfa49emr292104qtc.10.1699906739106;
        Mon, 13 Nov 2023 12:18:59 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id j5-20020ac84f85000000b00405502aaf76sm2177375qtw.57.2023.11.13.12.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:18:58 -0800 (PST)
Date: Mon, 13 Nov 2023 13:18:57 -0700
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
Subject: Re: [PATCH RFC 14/17] iommu: Remove pointless iommu_fwspec_free()
Message-ID: <22mlpmrdftubxzr46qci26p3aqojvv5p4ffroshlzubtwcw5cr@jwcl5scuttdi>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <14-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <14-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_121903_521344_7AE1DEA5 
X-CRM114-Status: UNSURE (   6.67  )
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
