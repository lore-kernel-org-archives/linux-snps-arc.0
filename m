Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7FEC4332F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Nov 2023 20:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idSt1J8B448bTYM/OyIPp9GCwRbTiwC5r70wUJDS1wM=; b=czXx5hIHtJNzWd
	T8HWIjP0TE0wTPcy1N7Y7L8I7TsStEGghacPyI94blD9RwiV4e4oZ0QOKNS97mfwEbmRKwsoquDcJ
	Gce5z164UjUTur2C3NieVsvrvMFyp+vkq8k1hjYbxNjH3yRVbokReJdDq18dX2UQOyqe0prZS0WoN
	lXciv9f3bMSQh9/xqk2XVCaI0CbnBFQ8VFtk4cQZ3ZlUhgo9rwovFFH0gpyys8TIzULhnrOIYeYqi
	A/pF7uU4ezICBSJGROStL8hUotHdeiQgxK2fpyc9hTsj/npYo8ps2xYnaE5/2dqsDosVCc7GlbgoU
	lN/ct0eh7k4sGfCmJFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dCH-00EcTr-1R;
	Mon, 13 Nov 2023 20:06:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dCD-00EcSX-0Z
	for linux-snps-arc@lists.infradead.org;
	Mon, 13 Nov 2023 20:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699905968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=GzyzED5HYzF4rvyrbEXuum1zn5kLd+ca4p2b9B2YPFJXo/eG+/WFvae3SribMTd/gNLQZU
	wZpIJKkOCKqLpk/8/3il0yaEjGdTxJQ4TWAH5amwcrV+t8I8rjuKHp2Rte9KvvF8KYWpTY
	tFCv6cVrXg2T6AwXA9oYZRNpRQALSoM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-50E_2tRDONyN8aMcd0tgVQ-1; Mon, 13 Nov 2023 15:06:07 -0500
X-MC-Unique: 50E_2tRDONyN8aMcd0tgVQ-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-66fa17e145aso59444626d6.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 13 Nov 2023 12:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905966; x=1700510766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=abi4ihjO4ptxKvmfsziiFTC/uhqu7sEPe9eEiJFIwa2VqhnlDJaD3Ay0XNRLBfoozH
         Wu24jAF11R0M+TVI8D7oQ92JQbfBt4I8FvceLdAWZCojsW9z86OIyQfdayan9WKnYwMy
         CbtXa4r3oprKDeq2l9vtaOcQEWT2SfBTl0WnoLU5GZVcekB1EbanmTCi65vdVr8EpXmR
         cTtwybWa6GbcO0CC6+rYN15JD2SsRcOMKsaiOZdWfSXWIKKORha+CJ9H9qqW6bZJebNZ
         DirR3FCN1dGhQrbJASbnmmqjkkyxpp2g2p/53W7KCqiMmIMuCpMyduiRyfiemRrjRvPu
         sMfw==
X-Gm-Message-State: AOJu0YyIzF2oJRgsIth9GKAWYmGj9pIEf23oZO8S14iVJhzbI17xxPri
	lISD0Ae2O22vnFlQKjWJhqZlVJwjoutFttczdHRchETyaE4MWmiaPCarI2feY0KGPOyzaJNimGP
	45KfgWzTig+RtERL2P3JfdspVOBugNOFM
X-Received: by 2002:ad4:53c6:0:b0:63f:80a0:4eea with SMTP id k6-20020ad453c6000000b0063f80a04eeamr283853qvv.24.1699905966599;
        Mon, 13 Nov 2023 12:06:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHU546dToL/RnbvSEEgGYhgfAOuTUeuUj6W3IfV3UEMZ3+1fSCYuM0AW5xrguKdlx+xfhHm1A==
X-Received: by 2002:ad4:53c6:0:b0:63f:80a0:4eea with SMTP id k6-20020ad453c6000000b0063f80a04eeamr283817qvv.24.1699905966425;
        Mon, 13 Nov 2023 12:06:06 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id q8-20020a0ce208000000b00647386a3234sm2299097qvl.85.2023.11.13.12.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:06:06 -0800 (PST)
Date: Mon, 13 Nov 2023 13:06:04 -0700
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
Subject: Re: [PATCH RFC 13/17] iommu: Remove dev_iommu_fwspec_set()
Message-ID: <fussoe3f2shd222d2lwvcts3odhnyuvfxpgv6c3k2d4udxu3uv@db53jszpgq7v>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <13-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <13-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_120609_287290_C82629B9 
X-CRM114-Status: UNSURE (   6.95  )
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
