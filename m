Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72169C4167B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Nov 2023 20:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idSt1J8B448bTYM/OyIPp9GCwRbTiwC5r70wUJDS1wM=; b=3yvvbue/DaTWtq
	0oZTAycBS64y6Vy4XfIzvnfp3Ei8yzXuvBTaWJmsBPo+jpP9q8PUq/dPcld27jp06xWw/QX5iVSZD
	oxOK5EffjaEYAfnItPSbl+64zSpMKdQHLkWxCJxDZvQsbrsZ/euAm9tE+f3LsncroG3PtMjJ2SQGs
	ese9GUXigEq/ploCospVvYC+x6Fi3z507DqJ3rU1UGKVta2Cp1B9sOMSZKCmRiHlkSiJq23dTRVga
	deTyKTQ377Jcs52n2+vTj159cM0q/owoc7p6oAJqdIZzGGIHRQ0i4fLTHJTsMpcdxllhNbIw50wT5
	pR0TOR+oUC80H3IlCvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dGn-00Ed5y-2i;
	Mon, 13 Nov 2023 20:10:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dGk-00Ed52-1p
	for linux-snps-arc@lists.infradead.org;
	Mon, 13 Nov 2023 20:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699906249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=QGe6EE3zOefLH2kPi6UKDDT3iO73btX3a9tV6mk0qqII8gXZ8Wjf35PMq/w9X+zLsxrCda
	W8KuMPIxM4pZVaxWHQI1rUluoWutBu/GTIQwMdTVi+swOcWjnAmS1KnVfultb75ASfjkBl
	CrITElY1CEN4i8dkPb2sXh1OBrVA1ng=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-dWbCn8kSN0WeLfpcrI0RgQ-1; Mon, 13 Nov 2023 15:10:46 -0500
X-MC-Unique: dWbCn8kSN0WeLfpcrI0RgQ-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7789a691086so580919585a.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 13 Nov 2023 12:10:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906246; x=1700511046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=voHQP/EHiQUDF9u53x2evfaG1sPmBmxUTCqK5n5YNZqZ6BOucVi8kXBbjUlT9NLoc7
         GACkn3et+BONZmoa+N6bgjYcG0vALo02d3NBdGZVVnMIexV6JyxhG87ht909d27FkWsr
         UzZlx10Gr8Iq/pshBDb5uv/zMyKpbKxVKwKdLTk2IreHV7q1MIAJDvaypT8m/xbod90r
         KdjjxivMeCly/v9UQ23AmYcqzQld/WKQbXKD4dyGLuMPVz9tzaiwrNYUuQTueAEHwIJT
         Vglbu9OurlIsCVABAbgAzVbjAPGiXdE0WEjNRjYo0rarTgMo7fXwwAu9s9XAWiWWBx5S
         WIJA==
X-Gm-Message-State: AOJu0YztyVkcqV4iDIdwEhV7cF3LONwKYnrMhu7cwYEg431Fz54fI7yp
	jcj3Ziwx9BRfKbM9cIViP4ycnVjmVbQxbiG3eJB4spzKeYFFfV8vZiH2Sa2V6C5zEPfMyAMfm+n
	NMCzNYrQYla0yojPJbJeWldRVYiPwJq7E
X-Received: by 2002:a05:620a:3710:b0:776:fb0c:6b5c with SMTP id de16-20020a05620a371000b00776fb0c6b5cmr322006qkb.13.1699906245964;
        Mon, 13 Nov 2023 12:10:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTedyYglCJvmi92iRdR2D4BIAbVzeajOKcDR1OXvlL6dJaLGV+tVe1Q6WIBYPyxZBc3gPFSw==
X-Received: by 2002:a05:620a:3710:b0:776:fb0c:6b5c with SMTP id de16-20020a05620a371000b00776fb0c6b5cmr321979qkb.13.1699906245767;
        Mon, 13 Nov 2023 12:10:45 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id o6-20020a05620a130600b007742bc74184sm2112406qkj.110.2023.11.13.12.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:10:45 -0800 (PST)
Date: Mon, 13 Nov 2023 13:10:44 -0700
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
Subject: Re: [PATCH RFC 05/17] iommu: Make iommu_fwspec->ids a distinct
 allocation
Message-ID: <bhbvxv5bt7b5tad27cuvy6efpkg2fwxx2delgcmnsd7sttqngl@irtpllmr7wq4>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <5-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <5-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_121050_673361_823E6069 
X-CRM114-Status: UNSURE (   6.48  )
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
