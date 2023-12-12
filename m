Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F60DC4332F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Dec 2023 09:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GUiGWPXKEuDUnDVxo9YrSrwSmsy2kjYfW5u759EJMg=; b=Jffh8WqDkkTxcM
	W17jcL2L6o6DsInhqs0g2hIT3rcu85AHIGUcKcnRCxUkOSvuRsKSP1xGsWAzeosImcJJ8REITcxNP
	Rurcn3jQcTj7X8udH75SNVNa0bQIEmJPc5voz0uf2EB3z00yY5b4StWZZqVasvjxcqDoV9gqkxHNR
	fXb2qxRNz7+kqFPSpwZGVgMEAW8c5Y+s3MEkQj1OukjzFGpC4o4JoAGtgtHmX8T0KP9hwRqZNLcZ0
	V2FIAMl5qtZugrAn/VW9JB1fwCz34TwM7pC9IVwNPFKavSc0FM2QQdumX68bmKwGg7XjK4axePr1r
	5C9BqwfGIglGJRTHXXiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyvO-00B9OB-3B;
	Tue, 12 Dec 2023 09:19:34 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyvI-00B9J7-2Z;
	Tue, 12 Dec 2023 09:19:30 +0000
Received: from 8bytes.org (p4ffe1e67.dip0.t-ipconnect.de [79.254.30.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 985681A4F1D;
	Tue, 12 Dec 2023 10:19:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1702372767;
	bh=bEwFfSnf2RFnsUSszwfjtJnyVAQAG+2ku4jSVsqYtho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abG4gKivOGRZ/AI3r3S4ykAogD7/67qJfPpecLXixxPdCLvNaaHplc2zY7kr49dVW
	 //lK3CmDXn8kgeq/V0CZR9ktKlB8X0k+ITJm0ltQTznpuMo6Vb74aQpMwh3nTTGVkp
	 Vy6AfWo4XcQNBdkAhhR+006eTJRikgSpnu1zxfyJ76UClAzcqQ5x8fI3bS/syUfk5j
	 4EzlogNC4F5cinu2gbIPFhhEV/M0hyHlrd2XxZSENppE6ttNDQtHQ8JgEKvxnsEjaT
	 tGQK7YmKPtfzARKk+wVIW1dNCyoJC63TSQbXOzaQtz4LM+81hJrx/weWcfjW4iINH9
	 K1OBYT39fG51A==
Date: Tue, 12 Dec 2023 10:19:25 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@gmail.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
	David Woodhouse <dwmw2@infradead.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Haiyang Zhang <haiyangz@microsoft.com>, iommu@lists.linux.dev,
	Jon Hunter <jonathanh@nvidia.com>,
	Karol Herbst <kherbst@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Laxman Dewangan <ldewangan@nvidia.com>, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
	linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Lyude Paul <lyude@redhat.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	nouveau@lists.freedesktop.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vineet Gupta <vgupta@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Hector Martin <marcan@marcan.st>, Moritz Fischer <mdf@kernel.org>,
	Moritz Fischer <moritzf@google.com>, patches@lists.linux.dev,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Rob Herring <robh@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 0/7] IOMMU related FW parsing cleanup
Message-ID: <ZXglne-jYLXHZbtn@8bytes.org>
References: <0-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_011929_011427_B8228687 
X-CRM114-Status: UNSURE (   8.85  )
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

On Thu, Dec 07, 2023 at 02:03:07PM -0400, Jason Gunthorpe wrote:
> Jason Gunthorpe (7):
>   iommu: Remove struct iommu_ops *iommu from arch_setup_dma_ops()
>   iommmu/of: Do not return struct iommu_ops from of_iommu_configure()
>   iommu/of: Use -ENODEV consistently in of_iommu_configure()
>   iommu: Mark dev_iommu_get() with lockdep
>   iommu: Mark dev_iommu_priv_set() with a lockdep
>   acpi: Do not return struct iommu_ops from acpi_iommu_configure_id()
>   iommu/tegra: Use tegra_dev_iommu_get_stream_id() in the remaining
>     places

Applied, thanks.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
