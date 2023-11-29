Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994EDC07E98
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Nov 2023 00:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wp+Q9mviJMK4+OHjVqzwJKYRNlGvP+G7IeUPQcJvEg4=; b=LUnilKAP2BG22y
	wymS8MzJwCYBXWOc/RqnC5FmAsA3295Tx2lnqs36QHKADMqNBNj18k2pnMmWUKIg66hlpV+NvK50D
	z2HxB9+LEiWP+5s2UZgu07cs/SNV2KJyw776trhNfSc4SDOQnWJrteB8wXLK6Mkg8CKcrpvHogLFQ
	b9sfE0tzdZTFR+CXY/roCPA9rymc0osKmd7TU758O8h7W8ybrSdRYOTERf00MdEyqAiT40TC/Ibjn
	4JS632e4St2jrlZ7gQ0jEAlPsdvx/sq3iyR3cpuXTP+s6rL/JwEMy3zWs7/wQoLU6jFksVxCXRcVP
	QCj51l6fS9PvJU6iehNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r88kq-006iGv-2e;
	Wed, 29 Nov 2023 00:48:40 +0000
Received: from mail-bn7nam10on20614.outbound.protection.outlook.com ([2a01:111:f400:7e8a::614] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r88ka-006hsr-24;
	Wed, 29 Nov 2023 00:48:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMaMImdBCsnOt2DGDmwYIq/najxAyiyZLo1DULXnofWvkK5d5H5Bglvju3o1OCJLIROf6+LBLAIbrKp4WjRdVuHoR3EAokjj3uhiiMSFkf8rgUlNMyL5hrRuV/6iEp68RKHocAwvieQJKsP6zv/glI4SeAPY86VEVzmD6ka2Lfuo5JiopAR9+MJUCutt+N5WcDgtCFX9dP1JE+6OeNso3sFLm28DtbMSxWXgNvQzqYXr5LjozQuL86Lj2PxjL8wdgaDgYloh3fLpteuWSwfPt9fozPrYlIeE4NgaRt04Plz16K5G470YW/j38t+j5YEdDv+6r2tyHhP2r1zJuz9l2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lVAPD2uo39KFS7s44lOQQgKaWiXNoyJPZwWUxqWnYU=;
 b=cPckbsZn6C4M7m9C8JG2C3erfVM/lzeutR3SGt659YNwfYeLGZ5VIhKcqNGd9V4/xpsnFK7p8IO0tBDpbRC/VKlxHBqRRUHMCe2CmOOyj90eazRMikd6N2szKLFEvU2a801xzSmCkH1+9xC9rLcR8ebDO8NRZmj8sctfQ8BeLtODA12L2yZkdQrUl/O08LM2AQXn2bxcqb+AQnWHiPScDTJWrxhtqmc+DmoDzYa2CP68/Xff9NoYBzEaDBKuZz5jN9nUdczcRiOxPVyq+RV2rsNpzHcJA5Vz+QB3Oz0o5eZ9Ih0F/99Stv/en6uXOxa7DhU5bdTfKc4b/RujR2yoaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lVAPD2uo39KFS7s44lOQQgKaWiXNoyJPZwWUxqWnYU=;
 b=E2suTQ/WVnGtH8XhPR9k/ohjKkbUWizP23xR68JUoqvz0QRaLcEX8Iyo/QSYmNB+QvVvhpVaRF5T3wxDtPREuPx2qM9R+LbC3bmmN3CoVwdKwMowbj8DI7gJWJgJcDL2dNLTILlsV2ofEule5u/byWiSCB0xhm6bw1o40yb/45KbCLLBaGXeQLtig+MdsKjKV2Es0676Y6JmFJ8vuN6VXxV/RiCVCwQcX9fjpyZui3A2MyE0ymRmSQO1amM066QUcNHTjWF/72KG9G+uI0eYvyHGA9xcQWowjqYNQT32u5SCi0+XWl51w3v8ya8dWBnVREbYCFEnx0mU70P0I00N/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 00:48:12 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 00:48:11 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@gmail.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>,
	asahi@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dexuan Cui <decui@microsoft.com>,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	David Woodhouse <dwmw2@infradead.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	iommu@lists.linux.dev,
	Jon Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Karol Herbst <kherbst@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-snps-arc@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	nouveau@lists.freedesktop.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vineet Gupta <vgupta@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Wei Liu <wei.liu@kernel.org>,
	Will Deacon <will@kernel.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>,
	Christoph Hellwig <hch@lst.de>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Hector Martin <marcan@marcan.st>,
	Moritz Fischer <mdf@kernel.org>,
	patches@lists.linux.dev,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Rob Herring <robh@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 04/10] iommu: Mark dev_iommu_get() with lockdep
Date: Tue, 28 Nov 2023 20:48:00 -0400
Message-ID: <4-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
References: 
X-ClientProxiedBy: SA9PR13CA0137.namprd13.prod.outlook.com
 (2603:10b6:806:27::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: d1bdf8ff-f64a-496e-a0cb-08dbf074db78
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: maG84Nw7n7h+pCZg9lg+lLCBF6wbXX+HLKZGKwJQHQFhDD5Zt/6QSu+poy6vjle8TXoCenD7C63dVVqS/o1f9jhnWhsSvc6pn09vaRvEB5yyCOM83EYJtfQXCfS/D+pwF/bYsW26nmxWfqGHP2IJu1giQPT0nQGT9sKVQnVPN909dYUundiqvULwTj/2ZGONVUoFpv3ZsjZBjiPTmJ0ggqjmHpMw8uQlRcGC/07+6gYmswRzBTMykG+hclTG6kwbxPB5Rkh8guf4xRRWe0wvv7QwLyfB0H+buKwxngCmiAfQkuilVWyDOn5z4LAPuelL3Vjydpp+UKZm3ukk0J8nEyu4yBOEfiUF8mZcDufN/oFvV4Zu+8lwJm0s2sKelgmKDOEtTTWb3r10vKhCkJFcne1hE6aR7sMoc2965PdLdaX0+Qiwl8o1sDO204VT9DQbh0tudjRiuQQCkEI/f4i1gPhaY0Q+e8UVVKI2KzfZbO38nxYJ3Sk3flLiNb27gH1teCkMoWNNPg4I+gmcsPwAcGAxGZm0WKYCv0LThed7PoF7VeEW5TFKs4qCAhDYSZYOcP5Jk7Wd2PFcyywyscFm73vN4zgONV1Z2H8eSSBg91OgGuoI7aase0FlrgGBdaTf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(4744005)(7416002)(7366002)(7406005)(41300700001)(4326008)(8936002)(8676002)(2906002)(110136005)(316002)(66556008)(66476007)(54906003)(66946007)(2616005)(921008)(6486002)(478600001)(36756003)(6512007)(6506007)(26005)(6666004)(83380400001)(86362001)(38100700002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8RT6CPQbspZG+6NPcwVdiF/S+9bPQZ7t92V3WFwds6FtF7PKD6AJ/YWWALyG?=
 =?us-ascii?Q?furL1R1XqUNM6axYSswYvcDjYFQbAs22szLlZ9U19I3YKstxVOzNHg4peFWj?=
 =?us-ascii?Q?SYxLUNESka7ws8umXrIFN8OPCyGP3Ege5s983tEHl7//QY47JPusFO/FeFXQ?=
 =?us-ascii?Q?BgKaCgT3SV5CxRrMwcnACGoBIBl3JuNgImlGJbq0X5607lMZNcAZ4tPutDJ5?=
 =?us-ascii?Q?rFDf6KYLyec31tnTx0rIRq7h3Kx6VPZQ/M2S3tcP3gBox4XvicxoFChjvrOP?=
 =?us-ascii?Q?J2lqv4sjM6cpXKOoiLydyXq88oZZVjK8DYVqlG0UQtTWq9dWx1e/CMs3Bq5R?=
 =?us-ascii?Q?gA4FEjvrtKvaXMGzPczhY5pvOK0ZWJOcAqXyx7g+jJRnew+J7ILYmiAwpT99?=
 =?us-ascii?Q?e1eMzg+YkU5fxM/xgdakfe58HY1570qNQ+ZnYlb4QouY4V5xSCF4z7BEbuh+?=
 =?us-ascii?Q?5fFJHkvdRgN5EWVkQHUJlLVkKeplxD4FO9DYBUBZFFZA2IisqzOzEXFyZHfZ?=
 =?us-ascii?Q?7qI0yfXsZRYVZx2rGABhxh3SSKsO5zGlbFcn8IB0Frj2etrnlJnRyL4s80w3?=
 =?us-ascii?Q?UuhRv9BzU8nlXHJmvQnysR3MGXQ3PEgcdNPhzPXVhNRV6lv8Fd972K5QH6/9?=
 =?us-ascii?Q?3NQm6rbTuvXZeEtNhQ86DfZSfl4k4x/0ozo1HynAdgbAYuTAoLUmFY8U2C33?=
 =?us-ascii?Q?VFJ5nt7pDQ9V3+Re2sdMz8lSmvnkQNeM02cakDxP7SlhAVvev3zvH0kicARb?=
 =?us-ascii?Q?FM2mK91+0LHck9GJnTaZVtKJWmOnIorkczl7Kn5XGAW+JHIQXA1iKX4M7biI?=
 =?us-ascii?Q?ZZH03bvZ4J6BEky7GcKYaBHxolxOuxSn4cJ0J0ryVNVxHx5Er40A/qdmrwNx?=
 =?us-ascii?Q?Ud16BP9au0yL5F3oCww9H2k41ZrHgmjIz/zUzAj/09PxxWYkt2GiH73WaGiW?=
 =?us-ascii?Q?wrozdvP7MhADK9vj7v/DM7aOXfNPk5yBjCOljv9QX/oIhAlzcICWEZBe5mXV?=
 =?us-ascii?Q?J46DPBGXlAysiAqJdQNlVf90JyIvm2luHIuVmoVqHHKCdM6t/GUwWR0i5RmM?=
 =?us-ascii?Q?L+iSNBMe8jT5wpqFbsSIM3dS1zcwv+cwRfB1ZJi+EBQv3qxCvV92Tm3FeWGN?=
 =?us-ascii?Q?xGpr+6TCMx0mNZsEYNCEqq3NaELr1RPO1IdYcOmvUcRF2UE1DOxrtCKIjkMb?=
 =?us-ascii?Q?Ocl+UXPS221AikLWVZLGnJaE6NSBAGIgioTOLN8ZdniOJ9+Wb/zvketylAAj?=
 =?us-ascii?Q?sQixQProbOMQqouu4aKh1JocVYjAfMQri2mnXiiI2FE/5oobpa0xi3lOigTg?=
 =?us-ascii?Q?zyUwKQwe79V+vkzr9ka1Y/+J7iiCnDOuuZonFqrtmw+S/PxkM1PaIMhZb5Zx?=
 =?us-ascii?Q?f456HeIKeKntukL/p/3MFJuI4LvrGCMfB7saYqZm04ctIuI4W7plmEeP7riW?=
 =?us-ascii?Q?xSTHp+rJ4LxNxTtBzb2S51zvbc6icN6wVWEPuKP+2G5GZoZDeWvQsaBd+1Gv?=
 =?us-ascii?Q?NsXaNHZQ05sz/PseEDU3s0iW7aXqz4GqSfdxvrUQGqIwdN77YX21mDLm4mF9?=
 =?us-ascii?Q?Xpamc8NbEkv1IgJ1r9QGPIsIY4RT+UKFl9HTSf28?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bdf8ff-f64a-496e-a0cb-08dbf074db78
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 00:48:09.3302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBD5nuykfX7klNMDwWIsdYZdxnYvsR1Ki37BK0ZQ568I81hLt4tX3OnKqWnhzaHO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5649
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_164824_814244_430C2A1D 
X-CRM114-Status: GOOD (  10.50  )
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

Allocation of dev->iommu must be done under the
iommu_probe_device_lock. Mark this with lockdep to discourage future
mistakes.

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Tested-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 0d25468d53a68a..4323b6276e977f 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -334,6 +334,8 @@ static struct dev_iommu *dev_iommu_get(struct device *dev)
 {
 	struct dev_iommu *param = dev->iommu;
 
+	lockdep_assert_held(&iommu_probe_device_lock);
+
 	if (param)
 		return param;
 
-- 
2.42.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
