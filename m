Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5F2C072A2
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Nov 2023 20:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8zxKCLI8YHE2mbkxrlKHifuG/gWoA9zDjKQDSbty0Y=; b=cFATcAaDs5fiSt
	6U0kx5A+6ehSGTMCtJsOpnt0ERYtTTV97ZTKgBiW/8efOo9eNzoh2mHgje9SAr7jfRru0dDnCLyDf
	o5VeKyLSt6mnEHUSPd2jRF9x4HsJ02pHk9+vR79QJCS6EKvKu9HPLFzSUDw113fyvvUmhUxYPpDFz
	HFs1uqUii+JQvTHy1zckNR1gdnMMImRwZ7SyzCuBWI6FSfwrYRLudGW1WNwjIrG4O3RE1II0/czdA
	8BCrtBJc844TmvDUfSAKjQvUtd+eXYAp2sncZpCf4VIbbNtZjsyki7Ba7R3VCPVMW+z/XEWN5rKQb
	YSNEPk69vv0BhUmk3quA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3MQo-001fQX-0t;
	Wed, 15 Nov 2023 20:24:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3MQj-001fPd-1y;
	Wed, 15 Nov 2023 20:24:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FE5F1595;
	Wed, 15 Nov 2023 12:24:52 -0800 (PST)
Received: from [10.57.83.164] (unknown [10.57.83.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2ED0A3F6C4;
	Wed, 15 Nov 2023 12:23:57 -0800 (PST)
Message-ID: <6442d24b-6352-46e9-89e0-72d4a493f77c@arm.com>
Date: Wed, 15 Nov 2023 20:23:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/17] Solve iommu probe races around iommu_fwspec
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Dexuan Cui <decui@microsoft.com>,
 devicetree@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, Hanjun Guo <guohanjun@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, iommu@lists.linux.dev,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Hector Martin
 <marcan@marcan.st>, Palmer Dabbelt <palmer@dabbelt.com>,
 patches@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Krishna Reddy <vdumpa@nvidia.com>, Vineet Gupta <vgupta@kernel.org>,
 virtualization@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
 Will Deacon <will@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>, Jerry Snitselaar <jsnitsel@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, Zhenhua Huang <quic_zhenhuah@quicinc.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Rob Herring <robh@kernel.org>
References: <0-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
 <1316b55e-8074-4b2f-99df-585df2f3dd06@arm.com> <ZVTlYqnnHQUKG6T8@nvidia.com>
Content-Language: en-GB
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <ZVTlYqnnHQUKG6T8@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_122409_766877_062E217E 
X-CRM114-Status: GOOD (  31.03  )
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

On 2023-11-15 3:36 pm, Jason Gunthorpe wrote:
> On Wed, Nov 15, 2023 at 03:22:09PM +0000, Robin Murphy wrote:
>> On 2023-11-15 2:05 pm, Jason Gunthorpe wrote:
>>> [Several people have tested this now, so it is something that should sit in
>>> linux-next for a while]
>>
>> What's the aim here? This is obviously far, far too much for a
>> stable fix,
> 
> To fix the locking bug and ugly abuse of dev->iommu?

Fixing the locking can be achieved by fixing the locking, as I have now 
demonstrated.

> I wouldn't say that, it is up to the people who care about this to
> decide. It seems alot of people are hitting it so maybe it should be
> backported in some situations. Regardless, we should not continue to
> have this locking bug in v6.8.
> 
>> but then it's also not the refactoring we want for the future either, since
>> it's moving in the wrong direction of cementing the fundamental brokenness
>> further in place rather than getting any closer to removing it.
> 
> I haven't seen patches or an outline on what you have in mind though?
> 
> In my view I would like to get rid of of_xlate(), at a minimum. It is
> a micro-optimization I don't think we need. I see a pretty
> straightforward path to get there from here.

Micro-optimisation!? OK, I think I have to say it. Please stop trying to 
rewrite code you don't understand.

> Do you also want to get rid of iommu_fwspec, or at least thin it out?
> That seems reasonable too, I think that becomes within reach once
> of_xlate is gone.
> 
> What do you see as "cemeting"?

Most of this series constitutes a giant sweeping redesign of a whole 
bunch of internal machinery to permit it to be used concurrently, where 
that concurrency should still not exist in the first place because the 
thing that allows it to happen also causes other problems like groups 
being broken. Once the real problem is fixed there will be no need for 
any of this, and at worst some of it will then actually get in the way.

I feel like I've explained it many times already, but what needs to 
happen is for the firmware parsing and of_xlate stage to be initiated by 
__iommu_probe_device() itself. The first step is my bus ops series (if 
I'm ever allowed to get it landed...) which gets to the state of 
expecting to start from a fwspec. Then it's a case of shuffling around 
what's currently in the bus_type dma_configure methods such that point 
is where the fwspec is created as well, and the driver-probe-time work 
is almost removed except for still deferring if a device is waiting for 
its IOMMU instance (since that instance turning up and registering will 
retrigger the rest itself). And there at last, a trivial lifecycle and 
access pattern for dev->iommu (with the overlapping bits of iommu_fwspec 
finally able to be squashed as well), and finally an end to 8 long and 
unfortunate years of calling things in the wrong order in ways they were 
never supposed to be.

Thanks,
Robin.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
