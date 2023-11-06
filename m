Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE8DC4167D
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Nov 2023 07:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cy+JIsBxy//57C9P9n1q/ECYK9V/MZEkcUXrEy5LwXI=; b=UhDVUQQih5f2nW
	FRIMvOIqZ4s3QwJuv0KlhciEJxuO0FC6F/zmmrHXH3JgAHClwPQZyHfJtZc5PDYzJoc22c6VCldEW
	crb7PNcn4L45ZKZ/SKdkqHMSLkGldF16XaijYpP/a2Dik8PiPdztyyv9tTPbjhRobpwsGTcBL6KvM
	2TRLMw4x2Z7MIAa5d+VH+Lat2C8XI4Ts4XxYz2VP7ZpgVciyJEDTH9o2mEYxpU3JgdKnLOgN3zusy
	6NESkhJEe6q06x6p9DXQwwwfau4Lov9Hw3F4sENwFMr0FaNbwXw0KpGUbnFb5oiJTJxGumW6XRM/C
	Gbv60JxxvDuTjvPlLklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qztrh-00FzZS-28;
	Mon, 06 Nov 2023 07:17:41 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qztre-00FzY8-0F;
	Mon, 06 Nov 2023 07:17:39 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4BBAD6732D; Mon,  6 Nov 2023 08:17:33 +0100 (CET)
Date: Mon, 6 Nov 2023 08:17:33 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linuxfoundation.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
	linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Krishna Reddy <vdumpa@nvidia.com>, Vineet Gupta <vgupta@kernel.org>,
	virtualization@lists.linux-foundation.org,
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: Re: [PATCH RFC 01/17] iommu: Remove struct iommu_ops *iommu from
 arch_setup_dma_ops()
Message-ID: <20231106071733.GA17258@lst.de>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com> <1-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_231738_253258_3A943557 
X-CRM114-Status: GOOD (  13.28  )
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

On Fri, Nov 03, 2023 at 01:44:46PM -0300, Jason Gunthorpe wrote:
> This is not being used to pass ops, it is just a way to tell if an
> iommu driver was probed. These days this can be detected directly via
> device_iommu_mapped(). Call device_iommu_mapped() in the two places that
> need to check it and remove the iommu parameter everywhere.

Yes, that's much better than exposing the iommu ops to a place that
should not care about them:

Acked-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
