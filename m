Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AE8C4167B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Nov 2023 11:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8qFqd5bB/gSc/1pG0Urbh3qpfMPuPhn2WX6/4Mz+HUo=; b=RgUZyCaevWyIXF
	1gz7fF1IrqJ4lOwpJgmdR7Swn1uPs3tOdmZwrhxkSXxYrfriKCzfcVZEcaT6HJKNA08RhElBocAoq
	hFyaJIflC9qEZ/4Pfl9gfpWj+TGpu65qr5nxF/xcLoXB3KJr/oTOw83hiUqvAClPvvIj7XIAC3PB1
	GsFO6jdbkSeCOzL9dOw4RCYdE4DqnDmkGvH3wSC53Rh3ZLPjId826/CGRtJmm/kk0KsRXXnn6WTBm
	7fgxTlymbI4xTt9buSDoPUvLii8U5IoF/mTwoa9Xj3dZsytPdEHSBdxkeA8X6HHJZGJsdWQ9JlVBF
	2gCB7UtKooiJ+AMpyOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8eyO-00AXpd-0R;
	Thu, 30 Nov 2023 11:12:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8eyJ-00AXoo-1f;
	Thu, 30 Nov 2023 11:12:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98D2961E51;
	Thu, 30 Nov 2023 11:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC73C433C7;
	Thu, 30 Nov 2023 11:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701342762;
	bh=GGfXE9jnMr/28RJ1AbOcy/7HFYYF7xL3m95Mfm15Tps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hS29cAaeUtXdeK+kiZWZ8qW3M4rlyGHM7IrFWTDxn8Nt0aXiAvnbAmRc/aoZ3Gp0j
	 V7SRDf/8hQJMNOEslGbmVEQwuQ3v/n0aab4QU6apKhqRzbBW1fGVCc4o5+lNiYt0iI
	 /7/amZz6HtQ5TNJ7z/1iEkJX2GzxXQ/d0Y8W3VVN2EeZqpbt6InWklo12ZeEHk9H/Z
	 dLnoiGTasJF7l2Ws/GUmhIMMkZ/lsrZ8w7RC7r6TB1mn3zon1xzXFqjFmv6WUa2sKK
	 u5jJfB5MNcKrcJC5o7DP2m9wYEaZRsNjXWMH0W1KpYnQMkdMULlFup8a//0ud2c0XX
	 Dh6gxHxqd0DdA==
Date: Thu, 30 Nov 2023 12:12:26 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-hyperv@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Hanjun Guo <guohanjun@huawei.com>, linux-riscv@lists.infradead.org,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Christoph Hellwig <hch@lst.de>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Wei Liu <wei.liu@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Dexuan Cui <decui@microsoft.com>,
	Russell King <linux@armlinux.org.uk>,
	Jon Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev, Danilo Krummrich <dakr@redhat.com>,
	nouveau@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
	Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Will Deacon <will@kernel.org>, Sven Peter <sven@svenpeter.dev>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Vineet Gupta <vgupta@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Moritz Fischer <mdf@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Vinod Koul <vkoul@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Hector Martin <marcan@marcan.st>, linux-mips@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, asahi@lists.linux.dev,
	Sudeep Holla <sudeep.holla@arm.com>, dmaengine@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 10/10] ACPI: IORT: Allow COMPILE_TEST of IORT
Message-ID: <ZWhuGl1l5V5b+w4P@lpieralisi>
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <10-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <ZWc0qPWzNWPkL8vt@lpieralisi>
 <20231129191240.GZ436702@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231129191240.GZ436702@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_031243_638621_64C64411 
X-CRM114-Status: GOOD (  37.77  )
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

On Wed, Nov 29, 2023 at 03:12:40PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 29, 2023 at 01:55:04PM +0100, Lorenzo Pieralisi wrote:
> 
> > I don't think it should be done this way. Is the goal compile testing
> > IORT code ? 
> 
> Yes
> 
> > If so, why are we forcing it through the SMMU (only because
> > it can be compile tested while eg SMMUv3 driver can't ?) menu entry ?
> 
> Because something needs to select it, and SMMU is one of the places
> that are implicitly using it.
> 
> It isn't (and shouldn't be) a user selectable kconfig. Currently the
> only thing that selects it is the ARM64 master kconfig.

I never said it should be a user selectable kconfig. I said that
I don't like using the SMMU entry (only) to select it just because
that entry allows COMPILE_TEST.

> > This looks a bit artificial (and it is unclear from the Kconfig
> > file why only that driver selects IORT, it looks like eg the SMMUv3
> > does not have the same dependency - there is also the SMMUv3 perf
> > driver to consider).
> 
> SMMUv3 doesn't COMPILE_TEST so it picks up the dependency transitivity
> through ARM64. I'm not sure why IORT was put as a global ARM64 kconfig
> dependency and not put in the places that directly need it.

Because IORT is used by few ARM64 system IPs (that are enabled by
default, eg GIC), it makes sense to have a generic ARM64 select (if ACPI).

> "perf driver" ? There is a bunch of GIC stuff that uses this too but I
> don't know if it compile tests.

"SMMUv3 perf driver" drivers/perf/arm_smmuv3_pmu.c

> > Maybe we can move IORT code into drivers/acpi and add a silent config
> > option there with a dependency on ARM64 || COMPILE_TEST.
> 
> That seems pretty weird to me, this is the right way to approach it,
> IMHO. Making an entire directory condition is pretty incompatible with
> COMPILE_TEST as a philosophy.

That's not what I was suggesting. I was suggesting to move iort.c (or
some portions of it) into drivers/acpi if we care enough to compile test
it on arches !ARM64.

It is also weird to have a file in drivers/acpi/arm64 that you want
to compile test on other arches IMO (and I don't think it is very useful
to compile test it either).

> > Don't know but at least it is clearer. As for the benefits of compile
> > testing IORT code - yes the previous patch is a warning to fix but
> > I am not so sure about the actual benefits.
> 
> IMHO COMPILE_TEST is an inherently good thing. It makes development
> easier for everyone because you have a less fractured code base to
> work with.

I am talking about IORT code, not COMPILE_TEST as a whole.

I am not sure what "less fractured" means in this context.

Anyway - it is not a big deal either way but I don't like selecting
ACPI_IORT only on kconfig entries that allow COMPILE_TEST to implicitly
compile test it so *if* we want to do it we will have to do it
differently.

Thanks,
Lorenzo

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
