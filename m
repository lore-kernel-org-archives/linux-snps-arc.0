Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7F6C04E85
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Nov 2023 16:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWWI/76DEXKuZks9WkPG6Wh/rAnGhdcdTRDaXx0cWMQ=; b=DWLJCmOPrwgLmK
	w2eXPuHHU5DYy3OMYq0m7WDG+nH4cjDgWPxPdOp25bC6ZqcLMtFJ/6He/8b6qwUT9o4ZfjkduPEMn
	iwaQ4lE/ErpoqTkMXuzTSkt+iJR9VohSeH0hRQkyNupUqWjsmb2ObWYlMdnZMEvHN7avHUl1g8yyT
	cHymPBvk14CXt7TctMUL4zTiSLGn6E5QLI6LBDxReZ3njiZpPYiquGba1jX4YWH4sQ6SJvTvp7Xug
	ulR+wergxr/eSzMqRQgrGpodGAqnXfy7cWbfmD3SIS/lXnAd2ejvQXaijeynxG546MFXsrSnEm6Cr
	H4T3VEPQZZVDHITCpJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyxIS-00BoDx-2i;
	Fri, 03 Nov 2023 16:45:24 +0000
Received: from mail-bn8nam04on20610.outbound.protection.outlook.com ([2a01:111:f400:7e8d::610] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyxIJ-00Bo7c-33;
	Fri, 03 Nov 2023 16:45:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9ULb+ku7ImqzOFp2PzIGljiz33SlmRicB8x6K/tUqe3CJeyswG5e3D5gMnpk18bQCfdI5xh3M4F7zzK1rzRpasgTrWp5YqBiWiyV1Tw7WA/CCxjQKZOggV6r9S4N2iJphXtK6yqAbHoAGefMybX36yTca0lghaliBHOnZvlRPZQvpPEDy0SqRMpObaGiQjq1+sCAkGwPz1diqHIFqr/uPUspBgvtgccgQOQSl6tFRHHmBUoQ18lWgXrjuXCUwmU1fmkrD6DS5QvYoZfpRtg5eulEmMk8+67OIf5wtx4s79XpfoJDaJh+yN8xoXTmBdKIIfvQDG//DztxcH73Q/MCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFCQA2aCUVPOXSacJ+ppYoNm3z3qGXA89zxgX94rYZg=;
 b=a7wL7voG82WYcPi8gCMliwxp4iHcmF5hBhhDyR1oLa6zWJo4y+Spag1LjytHg52f0AZsJpamQJuo43gDvnHqHOYKBXM9TXQHyn8E5imw4c6tgg5NBlVaipHPLsoEdC5BmHIJ8SiAoPO+6DXbPLUQKwxuAEcz3setCdKbIZOV/Tn2fiJN0qFHcxMhuil6TLT8Ch65nekcRdcilekScssSVRiuWRG0F6Pgmsis4r9FtY+YVhFHcXA74plG/k91BLMRNY13QZstP2JA54VJvart+VTGmAV9XlcnmkXCAcggpQ29Qe85U/fuJPFv9kPZFU4+J0i5yDArOB+ckmLq5wX8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFCQA2aCUVPOXSacJ+ppYoNm3z3qGXA89zxgX94rYZg=;
 b=g/ZvgNTNtn7x/dAwhVs0ZtUh0PUKcIP1joqfhvkZCQ603ZOyFUczsQmgbY4cBVMmk6QjPj5Kz/DcpeoBZ5On3sMP1F27C6sg7Im1IMsw7X5PLvSlmxhTsvxZtc5AW4pBQBbI9m5RUx5seyeaAdd31GqZJrmKNhUKPIBCLL6gsTesU3sbW+2G/xn7gmWWBaRe6Uap2jgG4mgrtBEfUbnI1W7VhrVksXEmtR7C5spvbCSTDbnXusE6buGqWpOONM7z3S8aASiyEvTJdooDZ5XGuD7QmwkaOISTCoH1kLt2+qfrO11fLSsJpxzA95kVYmDmcDw729XrSZE0KdXHYAArPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH3PR12MB9394.namprd12.prod.outlook.com (2603:10b6:610:1cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 16:45:06 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::b53a:1092:9be2:cfb9]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::b53a:1092:9be2:cfb9%4]) with mapi id 15.20.6933.027; Fri, 3 Nov 2023
 16:45:06 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: acpica-devel@lists.linuxfoundation.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>,
	asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dexuan Cui <decui@microsoft.com>,
	devicetree@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Christoph Hellwig <hch@lst.de>,
	iommu@lists.linux.dev,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
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
	Krishna Reddy <vdumpa@nvidia.com>,
	Vineet Gupta <vgupta@kernel.org>,
	virtualization@lists.linux-foundation.org,
	Wei Liu <wei.liu@kernel.org>,
	Will Deacon <will@kernel.org>
Cc: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: [PATCH RFC 16/17] iommu: Mark dev_iommu_get() with lockdep
Date: Fri,  3 Nov 2023 13:45:01 -0300
Message-ID: <16-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
In-Reply-To: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
References: 
X-ClientProxiedBy: BL1PR13CA0190.namprd13.prod.outlook.com
 (2603:10b6:208:2be::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: aa015ef1-b4fb-47fb-3348-08dbdc8c3ad7
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BAuq3hHBSebQd4sHu3u21zuDYSR8IIrRMZlJ2slH+tKkDanxgFKeh9lw5dnpQXWSQm3lO2qD/5tc1bxemjMgueppa+ZGKlaKs2k3I6LgxL3Uok40O3vBB+aVjW2GW6E7Izr8N3eYOpul4foErSS21KODJzOxgoOFnO71uPVhCkv0Ft6U/wj1JWsg2r93FYr9snAzt6oIyVoMLfu7O+L9w96cMOAXj/g+xRpbaWoHZpYH+Qlyh9UzbMO8LN3lHSIgF3LeuOCeb9GiFzCQaRal/e2Qs0e/ZT1GDPyMwISIqwdmEZKx7rZ1UFkfr+EifgG5haNIc1oo4xy3CGc/4aawBNX+duOaELnSKSWq/8NSEF51c4pFh10B46bZsjj8rqDZXKP1l2sEagtWlmEMVbQM6sSKjyivt6gskKHa7IIgu2kKZa0uWVNNvNAMFTtd6twGLOIpM2jdO+d/fMxJg42kvZOT5zTG3mT72Zkjn0Osk9fBuId0X++RsDybP7XaKjsFY6l8gE0p+X9kRHSziT4rpupxoi1mozZOfKTRulDW97UXBxA3TFZzzVL9Gctu6dk7R/pZidjfUEhJ9//yWrBNONK4glrkwIsXujKNCQfZaFc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6506007)(38100700002)(2616005)(36756003)(86362001)(26005)(41300700001)(7406005)(2906002)(4744005)(7416002)(83380400001)(8676002)(8936002)(4326008)(66556008)(66476007)(316002)(5660300002)(110136005)(478600001)(66946007)(6486002)(921008)(6512007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mAUvRpCz/LbLbbHcYS0EcEpqxfZQA0QnbogeN8wCQ1oCKgUnpzRbIOo2aSrJ?=
 =?us-ascii?Q?UHg9S13cVPiSSp8w024Mkb0f7TIki2fe35ar79henMlhee//Y3WBUzC9xsB8?=
 =?us-ascii?Q?nK/FUMTwDyGcgPmxwaMMzLXhJv38toB3O+vMODT3Eu6Nz6sIXwPRoj80W8w7?=
 =?us-ascii?Q?sdm2x7Ti6dYN8dCLApALYt/7p36Yu534FsazhtT0KqasT17oVjGW9XMy8aRn?=
 =?us-ascii?Q?tDnkkvocJ5tr+3XKaX2hX15jIDE4yWlkkN3XM3+BNii9om4jdG7CmjHByI4a?=
 =?us-ascii?Q?Zxq3bptxTobPHPSgGX8YRrJ/GAPC2dnqvNr8oN/aZJz6J9hKlHX644VB+P6L?=
 =?us-ascii?Q?587icmiegEGjPtineeiVy806CPV7dVz+blpZNO6FqNiH5EAyoX0ht8BWxF0h?=
 =?us-ascii?Q?geaJEPHMfTP86BRcS3QbkoY40hDxNFcpgotAJ9/MZNpE0M4RO3GOAs0wJUoD?=
 =?us-ascii?Q?SQCSqpht9IunKZBcrrLJJoqfZqNR3C8U0XXUmqEnOT1wKeUTMP9SxnYurPfg?=
 =?us-ascii?Q?a+r+kCivE255+pwiGpCaNyf2oTTFATfQcakEiKWlFmdPLThVeryKY8SiSbSC?=
 =?us-ascii?Q?ElBrCqE9GOSDRHmj7X1v0XTo001247Ni4mRGcXEnSb5VMMsmUFm7Irdslq/R?=
 =?us-ascii?Q?naw2Tr2Yhof+2Pxhi38+nPHgKl0Hv+tjrW+8rHKz/5czUhCw9jmz5R1kznVg?=
 =?us-ascii?Q?rQzh1gqkKMEOYpm2H0Sk8dCyPB7O7io+LK0SmisqnDxP0P7ovdtCwISXu5sD?=
 =?us-ascii?Q?6oDh4d1NTKlXqSEqqAp9Jr5RkRe4P64NFdE5Zta53MvwH5nZyBh/hcN4jPkw?=
 =?us-ascii?Q?Q82xVIQORNt4R3oiq5FnFa+bt6rZnFXQgDt6VRJzSALWnIpaTVvj67PA2V7Q?=
 =?us-ascii?Q?3V+CYCLaXBMOivck/ETX/OxdMzfYewCaFn0DJVc6XjnNZyyzmgIlCIT+r6IC?=
 =?us-ascii?Q?SBDnH+6XmFPzRoJgVOOm7rRiQrpx2RSPGN/wVpwY4nEzX8SLUje+yTOnfpCk?=
 =?us-ascii?Q?fhGPr9JhlI+TAfaOJiXDphaAs/EEflEGCRjqRF1gmdlq6h/SYUzB42RHIUSy?=
 =?us-ascii?Q?VHA17wuuTkq35gUbclt5aU0Y76wzKJxBseXuMnK3zFgR1/KIAqyl6XBAJfns?=
 =?us-ascii?Q?QoOxXpYlKbx8ufTDStMDIrXuGycD3vxjdmLpoCzDZ3C+DjrZl3EACL50E9g3?=
 =?us-ascii?Q?qRKEC5DN364m/z4NVcr+4Ej+rOVJpVoWnJbqlpzmWDLD7RYGOhRmpKr7hIHk?=
 =?us-ascii?Q?rIqlSvYUKn6X+SgkIJAa09nqByquZGlXUhn4wj77Yrq9gcduh5QQG7lcMEy/?=
 =?us-ascii?Q?lwg332gnJnZ/94Uin/JJHZLiF2goDAHn9YYIA5CtkD+OkElD9ww8nUS+ONBr?=
 =?us-ascii?Q?BMQIb18q3G4DyC6PG2TYE5IQ20vTvDzkvCB6O0bxUWfl1oG7er60gszKN3Y7?=
 =?us-ascii?Q?aCnd9IGvZ0oPd7kEeO04aXMysEtqD3Y67/bcV6eeZuIv7lMPmI3GendXp2Hd?=
 =?us-ascii?Q?OaxXKwd4Kp16JAfczYmIuwuViT2gQFLh000u+Z0mi0AJlhYSHPXAXOXnQo/r?=
 =?us-ascii?Q?4QumGUGSdKNh+ddXd5WaWaQv1yNJlkt8voXcmzsV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa015ef1-b4fb-47fb-3348-08dbdc8c3ad7
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 16:45:04.5408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7i3aojKgXsgtfjYNndrYLQ9wQIQMDAej/Rui7rGMG+di5SfulWwCylKniyQ0tAsA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9394
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_094516_007746_E48B6D63 
X-CRM114-Status: UNSURE (   9.24  )
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

Allocation of dev->iommu must be done under the
iommu_probe_device_lock. Mark this with lockdep to discourage future
mistakes.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 9f23e113f46bc7..1cf9f62c047c7d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -345,6 +345,8 @@ static struct dev_iommu *dev_iommu_get(struct device *dev)
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
