Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7AAC4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Nov 2023 08:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFnbPfpTmk1BnPgBBfue/TDljj9915XGmKMBbGJ31ys=; b=wNkZrPKhGvGZTm
	kJ3C4LOFmG1Uc8Qs+2opaji6MErPgd5wcd12T1WqRQHEACrUV+nUcpSNvDq36lEOj1nu6C5Hn2HAk
	fPjoE4BdF325xYgJ9f6uEUoo0FgnyY6YZbOU5rKC92/VLZmmoEvRX2VdbBqdorwRSgojvr1kOXX5k
	HF2vzgSjzbX8J4oB/mrzIsNg1vxkY0r1OzmmtJ/BwcPK8Mzq0MJzs17RaFbA/9cYlCxOslXLKyR8v
	r4wP15TIYO3B8h+n7mSUpH1laRjddEH62vZymb1YDlMG6poEE3BBkBoT+NU8xne/fLqaVEGAJAlJY
	5gBZRcc7pdm/G+33gKAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0dm4-003GZ0-0a;
	Wed, 08 Nov 2023 08:18:56 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0dm0-003GXA-2M;
	Wed, 08 Nov 2023 08:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699431532; x=1730967532;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o4b+vqtKY9OOVsB1rEVpRTkAptYNaJoA44xLfvE+DI0=;
  b=Quu8QugOE4Cv9TYmdnDyRrA8nVedqC3uIIXwW6uwAZIj/wmTXV6KP8lu
   z0j//AUxn8eIVW5qlfxODVzTtXrXqYwBdPcTpuXaipAT2Wov07Cjjt/b4
   AEuRQyEmiyPey8PZSObJ+OGQRSZGXeAUgExRWivGeWxTSrMikKc8J5D17
   ohziUPO0G6Zf561DE6Dbc2JC9Rd3Quie+7SMqXLgDedfJox8yE6MH17pb
   vmPQ0UCIgqvD5uZ9B1FaALg/Yipu09YKZAh6KHtzlSopsx+irKfjIVMTB
   sAWlRBr+v5YQt9N+bidNxLtZ5ehFrRCAeb9dnyNlFwHwggx7g+RifTHco
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="420823093"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="420823093"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 00:18:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="828883803"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="828883803"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.63]) ([10.254.215.63])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 00:18:32 -0800
Message-ID: <f7e69801-e651-471d-9768-43ddf1702f91@linux.intel.com>
Date: Wed, 8 Nov 2023 16:18:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: Re: [PATCH RFC 17/17] iommu: Mark dev_iommu_priv_set() with a lockdep
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, acpica-devel@lists.linuxfoundation.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Frank Rowand
 <frowand.list@gmail.com>, Hanjun Guo <guohanjun@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Christoph Hellwig <hch@lst.de>,
 iommu@lists.linux.dev, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Hector Martin
 <marcan@marcan.st>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Krishna Reddy <vdumpa@nvidia.com>, Vineet Gupta <vgupta@kernel.org>,
 virtualization@lists.linux-foundation.org, Wei Liu <wei.liu@kernel.org>,
 Will Deacon <will@kernel.org>
References: <17-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <17-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_001852_786760_485263C0 
X-CRM114-Status: GOOD (  13.36  )
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2023/11/4 0:45, Jason Gunthorpe wrote:
> A perfect driver would only call dev_iommu_priv_set() from its probe
> callback. We've made it functionally correct to call it from the of_xlate
> by adding a lock around that call.
> 
> lockdep assert that iommu_probe_device_lock is held to discourage misuse.
> 
> Exclude PPC kernels with CONFIG_FSL_PAMU turned on because FSL_PAMU uses a
> global static for its priv and abuses priv for its domain.
> 
> Remove the pointless stores of NULL, all these are on paths where the core
> code will free dev->iommu after the op returns.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/amd/iommu.c                   | 2 --
>   drivers/iommu/apple-dart.c                  | 1 -
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 -
>   drivers/iommu/arm/arm-smmu/arm-smmu.c       | 1 -
>   drivers/iommu/intel/iommu.c                 | 2 --
>   drivers/iommu/iommu.c                       | 9 +++++++++
>   drivers/iommu/omap-iommu.c                  | 1 -
>   include/linux/iommu.h                       | 5 +----
>   8 files changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
