Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D4FC4167B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Nov 2023 19:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WefUXyfXEbyGP3lmHgVkbrJKHNmDIgOsObb5C58ivRU=; b=zGiNFtTgExjo++
	jlDgIgTrUm8FetgtePYO8eRRUi068AFsvSxPHfkU2q3WgR17uGTn29Vm7gc0VK9sFJa1mRHF9rARw
	5BLQ/JPP0QF6bVJtBHdJGXgdkXvfu+kXp8eLC6ds1/j3VgDeSs2ReYAzdk7bRW61fzZ6S8Nl3oKXx
	mV9oYzDEcq5eSQIYgYHUmizlUi2YcjWHugl3VxABIhe9TyyTnAIEBboOlh+feJ/qW9fU16BFefOk0
	7g2ydZtUaLIojdge+UmNu8b5/QSvb7MPpoAEVG+8+0pQVo3M0qUPjvRnpYtu/W6aARUSMAN+SoyRr
	SEyl23agJPtZit3twz5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8PrR-0098Nq-29;
	Wed, 29 Nov 2023 19:04:37 +0000
Received: from mail-mw2nam12on20631.outbound.protection.outlook.com ([2a01:111:f400:fe5a::631] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8PrP-0098Ly-1H;
	Wed, 29 Nov 2023 19:04:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQn+n75YyQqwgtUyJN4Z7tqwUm2afev+zaDmQV4YvYiF3e25rDyjXDHyrXokDxP6buOsZTthZrwqWkuFwiTKAljWQIof6hquzOCSlI3tn09CYVW/JSgWg5aVnCQ+1IQiecGZLJ/pS7VyCBR1eSY4PuTOY98McS96FiQdYGHGK3ueuKrH4/HTZgr0AN8GgkmZFELxFgRNl2DHzgDLsgqAERnhzvaKWICp6Ie2k0hNIu12a9TqhpCxJsKljLPPlwDvWKSnhbfoAWg7FR9JvaSehripW/wyJIADsBsMH3LYtmA1kJe+NzvsesRwPW7OCtTC/4NrKn0gRn6ohaVLdY48gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnJz3rd9akWljR03xoJWxhQ9viEtvd0BRZBs/NFeJvo=;
 b=T28tlhhz0cb+am/Y6oRCEEOYrYesdtQW8BZucCSmvm4Gf6hzYxlyy0C3qSSkpvZkk36u3ObMhVudYa5AwZpAhioskM7f0ZFdKDHwIwrENABpDt8kqiobOVKSgj3VDo6ZTUW2yCUWlB4rtaztLOyhASMqMpjA1s3JX2nfi0ffvEk3+osdm7qfwEMxS3ovQOVKrVM4YReWD9RsOQEdBEhh89JjOuGsisyDkhXyFclK12+z8mVF2AkYy+1QVNlpEkwzWBd2qbfb7iclbxPNC0sUaF6ng/GUKGLVCFkilLCMRXCV1RDxNO8CeqBQVkgYAe5SnBL9LTF1TDbskVWC6ox78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnJz3rd9akWljR03xoJWxhQ9viEtvd0BRZBs/NFeJvo=;
 b=QrGFMQA4iMP8Wck1b/iPqzTcGcmS4t5rBcAlzK711TkvJwwHidjAG5EPQROoKQ70wwIgOb4lGilrvEPl9YDagGaB9Ik3rgqCR6KpIDCc3esCEkvNuUdOc1Pg1OohfjiwECiT933iyU0DL0vP8wcBm9fjdBcnvoftgLyfsgHJkdumaZhgA0XUFzMObh7VeQuCcsp+pAZH1wXrd3g9yH3OaNRaDsLfB1MRAb6/HI5PWN4tqqjgIWN4yVdRgG4BoDmG+TiuhJXqARJQS7E9/8iRbL1VSXziSe+41HkZuYUf+PAITAke5T/mluRYaxLuaxrzTG9nNRgNPO8L7H+pW4rkhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH2PR12MB4875.namprd12.prod.outlook.com (2603:10b6:610:35::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 19:04:24 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 19:04:24 +0000
Date: Wed, 29 Nov 2023 15:04:23 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: David Airlie <airlied@gmail.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
	David Woodhouse <dwmw2@infradead.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Haiyang Zhang <haiyangz@microsoft.com>, iommu@lists.linux.dev,
	Jon Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
	Karol Herbst <kherbst@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Laxman Dewangan <ldewangan@nvidia.com>, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
	linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	nouveau@lists.freedesktop.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vineet Gupta <vgupta@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Hector Martin <marcan@marcan.st>, Moritz Fischer <mdf@kernel.org>,
	patches@lists.linux.dev,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Rob Herring <robh@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 06/10] iommu: Replace iommu_device_lock with
 iommu_probe_device_lock
Message-ID: <20231129190423.GY436702@nvidia.com>
References: <6-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <788519ac-9ad7-459c-a57d-bfe1ec96db3e@arm.com>
Content-Disposition: inline
In-Reply-To: <788519ac-9ad7-459c-a57d-bfe1ec96db3e@arm.com>
X-ClientProxiedBy: DM6PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:5:bc::46) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH2PR12MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a526538-107f-4943-f967-08dbf10e0069
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VVmDavWiyQxxlsJUv56RzJ2UQIyjdgSyookmaLSqP8AGbnModIyi0BvWZIM5nyvAtassCobmSjERp1HP0AuY+CV3k3e2e3RusTU+0ExlxBPCkTJjumTmBNyzUASsEJ1KFkiAEdGSG7yEEbwjx1nt8Y9YUTuUoZiH7KMEr5b3GiWj2begTA1RiUN9YGutkZC1tDbkIaDIvJYm48K4pt/I0dzewwBJ9Q71CH+zdsN4Xm+7be2z5wza+D0ZwhTtGTD3BW11O2jdm6yDo7053btxMZ4zKzvtPjUIrOCWBdWbML4W+SADDL/mJcPY1KM4mZV24VCre4yEJ+jR3az3keqkfR4rpILYEB5uOGdhRqlXM2rEJDIVklDMdWmOKtVdYPEfINkbinA6qwfZKWG4Oo7NbDTX9IRZX2MdMQ0k8wM9Q6RsyCxuBfMSU6///bGbzin7c2AAd3mpWoNkVPmhUxH/7wWEOkUfCu9Yjbm+W49i8o6ES4DFUYo2yAWpRyE35w2cNVhPIQn2yhAM01gUNEuKe7ufO8aMR7boPjZAm3duMaHjoobsl3JHr1oZgbnJ2PvVGN4tDXtc9dKkUXHia+dJ5+QDqdJSzNlkCM2uWt+vCsn2BHJoCgEqv0P6FsZXc1r8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(1076003)(2616005)(8676002)(6506007)(7366002)(7406005)(8936002)(86362001)(5660300002)(53546011)(4326008)(478600001)(6486002)(66476007)(6916009)(66946007)(54906003)(316002)(66556008)(7416002)(38100700002)(83380400001)(2906002)(6512007)(41300700001)(33656002)(36756003)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JvDSgHIZJl9L23pkRsSE8MXrYjjlQg4+8vOE3HMOQTe8eACJscZ5o2vkDp+R?=
 =?us-ascii?Q?XQ/GBD59Qvp9iT0g394o40HCZ7iyatkSx2FTD76fu7yhdxyf4vttn6Bcduvm?=
 =?us-ascii?Q?PPCjnUbMWO1wRV49vaRkZsT3ZenGlkaRLO11hJO3priALurDqmDitjATau+B?=
 =?us-ascii?Q?LOPl2YiWZRcwgB+X+CH33G1HGGr6kILVO6HhqQvTUkV0p+o8h5ZxryFpCUS/?=
 =?us-ascii?Q?8hOOIO1AuEhCwvyIIh3A0nXrQqFhw1o4TjSI6HVwtNHI5VjHME7uWlEVgYoW?=
 =?us-ascii?Q?/+9OkNjnmirIxnWGCpgMTqjkteq4loUOYQpiRW3UMwBxbMmbUWVdaSh5y3/V?=
 =?us-ascii?Q?pgyPorR+IdD7GNBHBhuO+5PuRFY+Ru6GZp/a4FiErCeh6Z5VOG4czpy4bRFb?=
 =?us-ascii?Q?CZK3F2bCzyqfsu2AiOIAkRqyQgtmKS5ne0bgcDOuCtETQ00k8f6X6CW+qmzR?=
 =?us-ascii?Q?RWPrN0/qnGZo6EdI9hvIuA3jsJ3cr3gcT7bk/cQh7jlwaReFFDuq/tCr+D56?=
 =?us-ascii?Q?EGMt4m6Izyl1dZUn5T1NlPhC1KJAmQuibyrV/L3oWQ5A67b/glJLQYZyi2wS?=
 =?us-ascii?Q?Ywjk0foY+LnrHituiv6+PWi6anvoH6t8bBkzkbGanZRNuj4U60ha9kLLw9QM?=
 =?us-ascii?Q?bCU9TZrDn5MQRPTXGQyleVwTMwx8scjFsx007APtZGgOczIJG0CnPwzCl6c7?=
 =?us-ascii?Q?WeEe/sKjre/mNs51kHyHxMSy8w3gF1DxjYCxoCv2XdngxPZJHsXFsd9hvj7p?=
 =?us-ascii?Q?e8qpEzcrYmbiXAHvMWy4FDUWb40/skd3KSINg6r8rnkPkCFFrNt9xkSShpv5?=
 =?us-ascii?Q?fFxwjNvV5ANW9uKT4wV5SLs1JmZHDi57oKyn3Lzip/T7GYiFhRvFnc+fd+uN?=
 =?us-ascii?Q?3bqrOE/YXpJ0DicCpXJd6c4bdAhO/YkrsGrlFzIgBFBk7TAYWsm9Ng+svZ01?=
 =?us-ascii?Q?aQlIwqk15XEVo81C4xKzQ5aPp5YEcesT1mBAwZCLio1lMbAU8zONrIfPQzgz?=
 =?us-ascii?Q?yqNVx6hGJnVOkkCT5aMgKKw/Pg2eAOIuUrTpbPYXYmnIS6qYuwvhV9s+EBJS?=
 =?us-ascii?Q?gsVon+tPplThuubGQppTLAJ4xMhNwW8zZLV4C2GgA6HA5isrZQvoMecE8n00?=
 =?us-ascii?Q?B2i+uf86enF0OQISjRrYe12299UAS46M/VpY3XE7HGh+dyEe8CzjjtFndM7S?=
 =?us-ascii?Q?d/SNzjCO+q+TOv5aGlqRAjHIMSge9FvgSRIeU0ITCweonxYJ1VEQxJ0Xdp9U?=
 =?us-ascii?Q?UmGKCZTfNNqn9bunpcR/uwKecn8y7bpt5nXuswu3m8T6LKEJ/ZK2SZZdBmV2?=
 =?us-ascii?Q?A+7ULBrU3Qy+5YqwhVIekPHSBbf4rC8NTKavIoa9CkwS0ZmQjp4ZlTFpcRPu?=
 =?us-ascii?Q?OZmbMo1zLmYfz8KD4Q+Vh3G+6FlzP3KN19eneWsqjqz+Zto6Af+yl1fmNwvE?=
 =?us-ascii?Q?hnQ9tvvpMLy2QFFC3psZCskM+zpfZ2cF0i6sKAfNFppevBftAcatEvIRXCM0?=
 =?us-ascii?Q?B5C3BR+NRZHwtLp/zCJof3QgEHO2/hz2Nz+d4hhzoNT+gjxWE016hvCUgSyS?=
 =?us-ascii?Q?isGgNNck2OsNEuCO4FWAv8pf+BjBDqOefL5ApNRb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a526538-107f-4943-f967-08dbf10e0069
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 19:04:24.3875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOzgwny9Glf/bwrIspiQt3TeF+85jcAvrLkFqH0+YnEgg/8/kROnD1ILWM7/gA8A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4875
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_110435_454953_D9C7CA1F 
X-CRM114-Status: GOOD (  21.56  )
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

On Wed, Nov 29, 2023 at 05:58:08PM +0000, Robin Murphy wrote:
> On 29/11/2023 12:48 am, Jason Gunthorpe wrote:
> > The iommu_device_lock protects the iommu_device_list which is only read by
> > iommu_ops_from_fwnode().
> > 
> > This is now always called under the iommu_probe_device_lock, so we don't
> > need to double lock the linked list. Use the iommu_probe_device_lock on
> > the write side too.
> 
> Please no, iommu_probe_device_lock() is a hack and we need to remove the
> *reason* it exists at all.

Yes, I agree that goal is good

However, it is doing a lot of things, removing it is not so easy.

One thing it is quietly doing is keeping the ops and iommu_device
pointers alive during the entire probe process against(deeply broken,
but whatever) concurrent iommu driver removal.

It is also protecting access to dev->iommu_group during the group
formation process.

So, it is a little more complex. My specific interest was to make it
not a spinlock.

> And IMO just because iommu_present() is
> deprecated doesn't justify making it look utterly nonsensical - in no way
> does that have any relationship with probe_device, much less need to
> serialise against it!

The naming is poor now, I agree, but it is not nonsensical since it
still holds the correct lock for the data it is accessing.

Thanks,
Jason

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
