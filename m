Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFFAC4167B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Nov 2023 19:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8cHK5sWwXhEPwqZsWfVzYLGuuYYqlpypH6XFOmQ3AI=; b=2NC6q6phiHumnO
	FsFEtYZxB8nwjH5Qlj46vkEjG7BVTpmovHCpdSO6xiVqyFbsQ20jFG7JaFZ111Gv9UepCBQQ+kxYc
	GFtPxNr7MI1lItF2lPu5Myqa7IUNlKEmjQP5QCNDd9GDTNm4jQdBHI2Zn0lDfUTdDYQsu24xHFdHv
	mxlg6Ana2oQCyiv9GzRDOa9WOvDZZ0m4eAEyl38/eTcPXGFP+AzvZnqbQ5zGHfn3cGlMl9BLkmQA/
	jiXZT5r1KAp5BNrQmhqioJw/pgRwPFu3pZafsm5D9EdWSAgVWe88fZ6VtypHq6/hRnKU3iXa/YQmQ
	iT6MEQ+aaczCtDwD3w9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8PzY-0098m6-2S;
	Wed, 29 Nov 2023 19:13:00 +0000
Received: from mail-dm6nam12on20622.outbound.protection.outlook.com ([2a01:111:f400:fe59::622] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8PzV-0098jU-17;
	Wed, 29 Nov 2023 19:12:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6hxVfmUjjEuqTBqaCAYRAM0E0LDeM4TpWMrYtd791GVUlK3KiYiwIKFTP7Vjqk2z8dbC+hxgn74nzTszp8FYM13La1mKoXiXIAGGcNVL65TS30KyvePdt+FapBBg+Nfg9ZNX1VuITo4k9Sha5VOk+gS7UxA6JC0ZZ8PLpxm6LnX3A4iQpyMf+EKg1Khu6A2pc0jRju7Q0Fm5JFzENG3TpIysxsecpjs4D4aqsy4ENUJResOz5/Xd4GYef1ko4hAFHxJdrTSC3VIF4U/SBjWZzpsVMe2e6iZzAZXEXTlgmetW7IoMHxw+ERPrdymidqmjzO9DkiTEHgQWX3E2HE1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oRi0X7Z+CVID+a5f01o+nJgINmOdAMsllIivpcTTwc=;
 b=n/HwMtMpyIdFoaWX0xa+a95uX7hYXutD9/Ev/JoOmmVn+9z0GdkFN3fbgdDiGt6V4KMUuCwFs/50vsvJSg2Xx3a0UCoqzpQ6irAvYAVTaa49+1T6Wz8zuEmFfkHenF4tl+zZouq8YzbBuFAFGcxuc3CokOfiFYG6wYInDvWQahaXbv7lWP40vlnUvLmZGK7u7VUt8Ipd4dR3snOt2TZdU8eaAzBCU+SCgT5ya4FyObgVP2z4E/xs4Zb4EyeKdixdSH1Otfd0BtEkrUPD6RTl/ModHg8o9qSSnSROR0I0RnFXHyN4vIWtePVrE12Lt7XA8LY0LU29ZF17SuuFClfCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oRi0X7Z+CVID+a5f01o+nJgINmOdAMsllIivpcTTwc=;
 b=KQKMRZoSEGIgCmQ1QU1LpCRcjpQQ43qDJq+QqXSQfiV9msw+EnHwPf+quQs0/ShQ8Qe1q5KD/FlVWpZLIbreZdqNK/deLAyWERb5iC/T20ucoo2oyn1PftyuvaenognnuRnuPfxGsaS84s1QcuHdnfVS+uAZypkscTae0z4AerNbzGKGOQg4pLZkteAivHQOzFXaWmKWfjiUXS+3kcdIxgM7Wo8URt2dcNaAReekDcxfI1d76q6k6XdmRiAv+K2glnt2xEQoa/8h+uDHm+c8cAsWQyvRQKNM0Tmw+MApy4PM5k2joL/+BB9wvngjNHU6dKSxRx9M2T1AS/11Cgjtcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW4PR12MB6777.namprd12.prod.outlook.com (2603:10b6:303:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 19:12:42 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 19:12:42 +0000
Date: Wed, 29 Nov 2023 15:12:40 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
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
	Lyude Paul <lyude@redhat.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	nouveau@lists.freedesktop.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
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
Subject: Re: [PATCH 10/10] ACPI: IORT: Allow COMPILE_TEST of IORT
Message-ID: <20231129191240.GZ436702@nvidia.com>
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <10-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <ZWc0qPWzNWPkL8vt@lpieralisi>
Content-Disposition: inline
In-Reply-To: <ZWc0qPWzNWPkL8vt@lpieralisi>
X-ClientProxiedBy: DS7PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:5:3b7::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: f29d6354-59a7-4ad4-6f6c-08dbf10f293d
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ExDWOZFwbwr4uBJPZTe+8wCrRLsSk6NO2vBqyLJ5irF+/V4yig47BnO1UFbDUFO8OzBu3S6EDHoAqvZ+nEpVfiDpuuA4Fgp+KnveFie2ZrkPuNHUSKZiid8egjeG4KyQzw630cIiMFYi8e96mBimGty6Vx/gtVqNpxcu6NglFm3hdSfMT6aRNKqNhvlnZdbwLYrE+g9JRGU2CC/KOdQPg6F+cA5ljB88oBR9LqXj+aF44c+DcTtukpHKB6bCWNejxqhCqiJ0qK7lUcofaKMN87n5reAP5qboezDnt2soqeVYwrjTLNKF1RqJ0W1keM8ncTArVG88nGcrDJaIupMRHVu+1Lmxnc1V4WpbgnwcmP5e94Pq9CwcyOFSR3Fxe1/1T5ivu3B3m+jGHRjsnvaxluPdvebGZdt2krq5mrNzLdB0ZiTUPFEwfIkiUJ77vG12gkVQGI/JEemfllZKzNpwIWKdBJvC5m3ETHvPILZEjtdsBqtfHH/BS/YGImXmpnuuqvUQhEDL8g2vr5Lx88lhCTfjzBbav0i/2k0oBZv7pSBf4pOoB83UgcEgdafSrBvM0L+Ku/98fzYAQ7dw9XScFLCQri56rMD6OLqhaORetczb31ys18HuzDoRyVSX9AVyyEZzA+30O8LXr9MFAeO7I+JHH86NUozkNlbvSONZNwM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(346002)(136003)(396003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(451199024)(1800799012)(26005)(41300700001)(6512007)(1076003)(6506007)(2616005)(83380400001)(7416002)(38100700002)(36756003)(33656002)(86362001)(7366002)(4326008)(5660300002)(8676002)(6486002)(66476007)(2906002)(7406005)(66946007)(66556008)(316002)(478600001)(8936002)(6916009)(54906003)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vj96jybg72mZ/SKZ6PzFTRZ3q/YC80Fc2fbDFczKHOWaoyB3YhDMxdCb3eNp?=
 =?us-ascii?Q?hv0kj98lZg4siUDT08EEKBGygAUXFjz7H1Nln0ePNQQcrm3dSl1sT9Cg3oeZ?=
 =?us-ascii?Q?Mgn+Hr3cmLRMwnAUiXS+hAaw4gMP3JweOYaSzWQkA2Ojr6eTVfcblu/XTgx1?=
 =?us-ascii?Q?bgLqQE468kgBBVs0PB+Y3NwUphgfUZYhmvwJpYLdoPyR8jq46aflF6ljvdgM?=
 =?us-ascii?Q?7PnsnBt4WBd+IEu+R96dT5vCFlbgI2+ZFvBE6+K+DFyeBav/0/Rk0f+2Sl6F?=
 =?us-ascii?Q?99UmU+HkzrjQcTD5dz+cJj6sEBjJxr0Kr/IguQM93FKxHlqFni79t3IvpRLr?=
 =?us-ascii?Q?xoPH2d6eOujfq5TU4pBmh9dDWLNB5SGW2+cyKNBtTSZgKC68Ek5oP5i5TWu2?=
 =?us-ascii?Q?05a6inWh28dJ6stcOlVQsTKJ7s/sHqCFfT64zjXGTn4cvL87nTWgjg6NzdO0?=
 =?us-ascii?Q?6912qn1UmBgsm3tAZkkzJoQlnX+JuaWFeskmlbr6d8TiMsUBRfA3mCYpFGfh?=
 =?us-ascii?Q?BfMfj/OkUjx1sh8I+j6Oe+ExxdMBmsmjdVhcbgUMiu7vHk39/ftkCri5edls?=
 =?us-ascii?Q?JcC3kZq/oJV3IDa6wbkQRjTY2Six76tzs4UsqrX2igdTE6So5+jgoJYpkMKg?=
 =?us-ascii?Q?5EA4ZWLXopfyteuCr3y//vlWl2LQ4eChAJ1HZyB2uQdV7CO0JiYJRCUOgJvE?=
 =?us-ascii?Q?XygnTGiqQJrCMkJ1uKyrqkVuyk57/FegCKD2cXYzSo0deCKjU1/15K68A3G8?=
 =?us-ascii?Q?ylkkos3/4t6qNKfpfAmO7lZ15QJRQlo16JF4c2zHQhWTCsUJtHFfGVYnGSW+?=
 =?us-ascii?Q?sodpm/1K2Q7OHym33v3qM1VdrQKh3ffn8qlV3s8JWqYq+8b22mgLZynvHl4C?=
 =?us-ascii?Q?LZFWDGwHMBaiJegiyOrm5/kz+zHw0Yh+wEukFrOX/OGs/9XFaNN31yBemB4z?=
 =?us-ascii?Q?Bhe16EqoHV3uIepIfRGJvyNlKcJI7oJ8EphOe//EMdZnXj/yqoJmDi6bmnSW?=
 =?us-ascii?Q?a98uClorYaaLh43yUZhreAJG5CRYoiiK8RSNvX4Z9ngdwJSvP53pZzICh2jM?=
 =?us-ascii?Q?D9po0YE2dzVZMcMRf8ybq0VQqcvj1h8uTRT+9qHe5xckUlkoNL29n+XdIVzr?=
 =?us-ascii?Q?XfhnHucBUCvPPyyUDVb4DdcYVtMbsbk+AIsgN733ks7nGLQj0H3eR6bAC5V3?=
 =?us-ascii?Q?0EBWzRp0yRwR/cSVdLmDJ5YbqVQUdEWWA3fHz928yWIZNSg+5RwBnn7HU6ez?=
 =?us-ascii?Q?WONu/ICNgr7mcAP55za3FkIDzz/kiXsO2yE/shsHNi26s4AAzfFspFymvGMg?=
 =?us-ascii?Q?/yRmkSOaRu26TnJW1nYo6KY+WDQuq+Pu2M0TuaqU6Eh0Zsc8Yeg1CQdz3j0w?=
 =?us-ascii?Q?B55b1RyZLxeNX/uUTDYSWz6G66crobiSqxvPRS+Cgyj9FuVC/cdEtwNVTtKM?=
 =?us-ascii?Q?bvW8Rq335LUj9m/0WF2NCJBQPctT/HVywkJTAi4s8tZE0jPl3GjUClLpm7lB?=
 =?us-ascii?Q?7ZH9rQhv7FEeWISFkFWMAlQ/bEaGWZ/gTfU3gvXlLGekWrWWjlvqIWdtZ2P2?=
 =?us-ascii?Q?Pkg6n0+OJxLEZV4/Nig8yJOG+S23r00z3MoH94jL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29d6354-59a7-4ad4-6f6c-08dbf10f293d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 19:12:42.3021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/uWvgTLJHp3Nt13F1gXutTJUKeO8sxjvXNQc0BLEdauGhU4ir7G0bRjdU7WeWPL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6777
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_111257_385269_42F600FD 
X-CRM114-Status: GOOD (  24.14  )
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

On Wed, Nov 29, 2023 at 01:55:04PM +0100, Lorenzo Pieralisi wrote:

> I don't think it should be done this way. Is the goal compile testing
> IORT code ? 

Yes

> If so, why are we forcing it through the SMMU (only because
> it can be compile tested while eg SMMUv3 driver can't ?) menu entry ?

Because something needs to select it, and SMMU is one of the places
that are implicitly using it.

It isn't (and shouldn't be) a user selectable kconfig. Currently the
only thing that selects it is the ARM64 master kconfig.

> This looks a bit artificial (and it is unclear from the Kconfig
> file why only that driver selects IORT, it looks like eg the SMMUv3
> does not have the same dependency - there is also the SMMUv3 perf
> driver to consider).

SMMUv3 doesn't COMPILE_TEST so it picks up the dependency transitivity
through ARM64. I'm not sure why IORT was put as a global ARM64 kconfig
dependency and not put in the places that directly need it.

"perf driver" ? There is a bunch of GIC stuff that uses this too but I
don't know if it compile tests.

> Maybe we can move IORT code into drivers/acpi and add a silent config
> option there with a dependency on ARM64 || COMPILE_TEST.

That seems pretty weird to me, this is the right way to approach it,
IMHO. Making an entire directory condition is pretty incompatible with
COMPILE_TEST as a philosophy.

> Don't know but at least it is clearer. As for the benefits of compile
> testing IORT code - yes the previous patch is a warning to fix but
> I am not so sure about the actual benefits.

IMHO COMPILE_TEST is an inherently good thing. It makes development
easier for everyone because you have a less fractured code base to
work with.

Jason

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
