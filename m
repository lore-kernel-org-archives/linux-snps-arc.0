Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84432C36010
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Apr 2025 18:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vY2oChAPT8AduJNo2WS5MToYKzZYMAD2QNLyR9HJNkI=; b=V3+Ncl4WyP+vVJ
	fNRaP6ONDVbH9uj55yvj8o+UzYpNLsXzG8BYhs5gYsYvFfauBj/QWtTf7FoIcM0ZiqBDaEyXv+pYo
	xiyIbAyZWMjUJKDv9VUIQxdX8HGyQF9/AmxCM3A8wpFCLq5qoy8xCvFNEcbzTpHdR+3aBFXjq2I5I
	SUcluuzgiSuV4ok74Qtb0fZYgEX1YqMEN4MJYziXKA0ZiIbY0fsVrir8qJJNaq2Ah7t2FswDUpAc3
	ckXLhdddW6S40EWaWeZxcx5DYNfISvPdXNQMb4aL2Voi9i48hdvqFglgyW2TOsK6ubxeq4Y8hrtuY
	6xg9+WVlSlVJksQCLqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2E8r-00000005Amh-0aiq;
	Tue, 08 Apr 2025 18:57:49 +0000
Received: from mail-mw2nam10on2062c.outbound.protection.outlook.com ([2a01:111:f403:2412::62c] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CfA-00000004xmg-2vcV
	for linux-snps-arc@lists.infradead.org;
	Tue, 08 Apr 2025 17:23:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F20NO4ijhyqSBB2DNzXjJU8D1E0GzO8s5YL/mdBXXyfvU61NSlFmOOl7NGcXiXIA4nYi4KeZQG5nn4UVbH1Xs9bTpahlIl2lEblFuLBCqyqFi13WNvTsQ0R9tDHMl6Qx2J/k3O3B/6ulrmoWdgJ+r+2iZJGFYTIVgHxhao2huzhUB8+xS97kczPxOGo+TgoWJvU5A/J4lcgg2UQ6iaimeujvA3zRl3PhSZVA0YY2sbbDxo9E3Vdou/FHw8z9UhMA6PohjEh0aMXsylBNMHgUR6mycJVEGpk42Vg+tY9hmrDvHpZEzhYpW9AAJ5Z0EQ0SpfOl7aYS3ASBrhti+qW1EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkLilbpImbn/tDJ4p+YuEAoZAQY+b3uydN+9RkAmz7A=;
 b=ja3r+6DxG386KeT966MJvf9f7WNCvtF17ymWCcxX8Wx6EMhjm6vqg473EbDtDMSTWMZetsxKG5ePYPDw+Q1DNk15/pT6LFGz2HtRNW6mRb/JR2vdcev/cQmQmBQEGgttZATYtkQO38HdbvWdYuDFHKCYeJ71b1piwfriy2YlVnVMiac8KhrTmngriEBPgR8LGpyl0uf/V+We0q1kUT1LNjwumvcH+rI4ESPXLTfHi/sSPDQAX8yOc8/hK48UzGTVrbPWRWqVLbudU9E0R32OI3upOmjDEgkAGQKBjWXdHWFTrVKU/Q34I5kmXhRFJswS7Gm0yFPs+wq3rLMujNwwwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkLilbpImbn/tDJ4p+YuEAoZAQY+b3uydN+9RkAmz7A=;
 b=UUWwJULezvHTmT+ms4dPdahJIuNieyHpAxMeE30cRWQ6HXKrIswJrq2br3tirycFMLsToHkz9WPARGwgYUsflFFZXQwB7CA6DyAHRNmlnoPPxyJdht+gL/mdViMiVhDTb5zQTETrEb6RE1B3InoSoI16Gzm6LoZkZpTXBOVsuOcid4yNityGg+zZi7nkCX/9WFMZf/hYyiCQ8iaxNDgWkLv25PoofsZ39C2o6IXP7WvhtmYiDES373gxqy01WIgqkX9H031xL67ejsdcaursqXup1nc+XIyc3g9We1X0mUDC1Noccl7vpwmPpK8KgUwxfJCdFDQXzwghJOeatABoHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB6330.namprd12.prod.outlook.com (2603:10b6:208:3e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 17:22:57 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Tue, 8 Apr 2025
 17:22:57 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Boqun Feng <boqun.feng@gmail.com>,
	linux-snps-arc@lists.infradead.org,
	Peter Zijlstra <peterz@infradead.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	patches@lists.linux.dev
Subject: [PATCH] ARC: atomics: Implement arch_atomic64_cmpxchg using _relaxed
Date: Tue,  8 Apr 2025 14:22:56 -0300
Message-ID: <0-v1-2a485c0aa33a+505-arc_atomic_jgg@nvidia.com>
X-ClientProxiedBy: BL1P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::20) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: dcccb4d1-ec10-41b8-60ab-08dd76c200de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6cjDcBO5yb5mVMWr4K76DQgv8xVOKWxdpTh/TAwccl7Yu1FDBtRuV5y/Hv++?=
 =?us-ascii?Q?z9MEK1Ely5uj/bsmL9Nd1St4oVxsOJ+QEn1NIiBwb+6qRqqXH7V0q7L+KfIl?=
 =?us-ascii?Q?3pthMwga1YS1K7Ys0b9u3FbZ5S3v3RxhLt2r5EuGkp2cQjq+Y/qFgKZFg22V?=
 =?us-ascii?Q?W4rGVDLF9yB8tb0kzhVt7N9HZf3JHLgZyBVliaoiBdrBcxLURjtdGkcfAj2E?=
 =?us-ascii?Q?eEYpVQyudsZJiGASiUfcr++bWMeHVF6l+Kmds1suETx93SWE+QmTwnls5Rdh?=
 =?us-ascii?Q?TRym33YPcBk42/ZKFZjvd/eHpDxPvJS49ZSl7VmkA1tUlsGu2X0SxRdGGal8?=
 =?us-ascii?Q?vtJ0ccu4+vr8aXFKll7aFEY/tGojfhRm3x2L8J6fVY981RI35vpLZ5mX3oM6?=
 =?us-ascii?Q?Nqit3bHnGyD1FAJ/KfSsMOlUbnDz6LzWRtgpngF6qRFlRMBM4nFaw+tlfkwU?=
 =?us-ascii?Q?0z7K8z3lvy5kIhVUVUeBRWa5OcRPkkSa3IN2gasVgUpFLWWKdL6GU75dH5Cy?=
 =?us-ascii?Q?9VQVemL4CNjGtWeWiRazHA1OXIHNHF4xKvTEkKyKl2KhltM2miB00gOjuaxs?=
 =?us-ascii?Q?h1JScAFJvU+9ueih6FdPVMSXmrtt+7kuzQ4B1f1WSfIFaadDgVIjOcFZwRTd?=
 =?us-ascii?Q?FBcJsgKu+5OBTNqakzm4hhtjoy6b9ibvMm8RS+SRzq3nKwrcjQv+Hqaw+UMo?=
 =?us-ascii?Q?KeBM2Jsythe53H7HCV3Z208+SdJH131tFXokUsHTT5LCgrIfDXgdmwT9b5X2?=
 =?us-ascii?Q?x//rZtG1vZN8xAGf1V1lL6I8Mop/PZhM0QNbDTmF6Ewh0ldMwoUKWpo8c+gf?=
 =?us-ascii?Q?3xSnC6ar4FMlmgTBHD7WMGn0lImoq1WC1jyiQAIweX8b+q+kAzA/E0w1AtZR?=
 =?us-ascii?Q?nW5VRFf5kdZdRQxx8QZyIEuhu0fUmTS+tYX2CxZaTda6gi2R1wZlbKb3iZnq?=
 =?us-ascii?Q?RA4iW1wdBZre4GaQx/kI9GPLEH+sGZudVP8lr5nNPrPXwoVQJIz8BXjehRFF?=
 =?us-ascii?Q?xUg3OL3ad9IjML9RvTrr4iVhXAs7wWTUcTzQVhRen2rkRk4pjGKBQBt3eHfX?=
 =?us-ascii?Q?RwXONJN6BjCpklXTNbJcBBaCIJsMaRsuQKHz/bow8Y3ELRFZqu2uowdVoEr0?=
 =?us-ascii?Q?41gRtS5TYYfxocaHU1yrV+OQqDol7JE0hbHylStbFZlbrHG6DIQsk7kYBSxN?=
 =?us-ascii?Q?orSA/demNeKAcfyssB0Dwicmi1nKYkrCGV03u38VC4mYpsRxLR8aWmIr8beF?=
 =?us-ascii?Q?gtV0njZnwRdNSbZ3YkEiFY7OCcOfy2/RYIPcf98ktJrfmICz28q3YClq2kRd?=
 =?us-ascii?Q?sidgRuC2Y8m7yCDqnB9k12VQIMAN+ny3qqKxn5Z3p9fhaq6iTrjpLMs54n59?=
 =?us-ascii?Q?sK+Cvf1dwq14igFxlsDOT7ZaJge+tBhMslcal4aliI+FtKFwA+OnXKCHfGSw?=
 =?us-ascii?Q?h0JeqALtofE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JAWgV53TD5dDo9+FtNTZsv+Ik3Wzu2UNBDQiMTHIaNYrQWrU9sp06BRhq9U5?=
 =?us-ascii?Q?XD5HkZpymeZ1rNzqTK+8JEC63MrFMXqWRYMIa1/22EhpAew6tiPB5oCstp6N?=
 =?us-ascii?Q?OnKeMtGjyBXv2uVItNS0Uo5etHN6352PvlZ/7iqNifvfd9hNlFds8RMOvCHj?=
 =?us-ascii?Q?5q6kTvLqe8gdwXWlCbDLm5nOA1w+wQflXb/X1lJgHbqrGywphX0j5DnrI4ST?=
 =?us-ascii?Q?TaQjQu6t01B1b3HHyuqkNBzktQ5bja06usRQ+te5NS+u/11HBSmSpQi+Cm4a?=
 =?us-ascii?Q?UkzZpTaqAnqE8m3mYXYTIZ7Uy/hlGcTfjxgknf757r6RsoMicnXwNyOtQXbp?=
 =?us-ascii?Q?fmEYRaiAiZwXS5dxjt4dzZFGpriv7wOC0xwEBkMlu5nQ30VOWm3t1bslEfLP?=
 =?us-ascii?Q?qIvJn7mlPqQ4WhbjkbpxR2KIdQO+f9M5ZCq2ElCGpi/nhYykLCJ4cVqBcN5E?=
 =?us-ascii?Q?53Ru79oB9NJFJxAM9MoNIwD+mOOr3MH6Q6TLlCPC89v3NDlDF+XRENnX+GJ7?=
 =?us-ascii?Q?RuP5+GCR6swtX9kYPpmQY0pa+hEABPAZjZUnvn03/AznTfJOgdmy9Fvvijk8?=
 =?us-ascii?Q?EEB9mMjJtDrwELHdq00U65mJbwBcqCm+C6/1DYbcNzG/8CgLDOdjc/gG3Yl0?=
 =?us-ascii?Q?lrfUJvM0rPO/op1A93ABFpH9mTboQPzx0HopH4gx3vrZwmVJ2VLb8BTFsFsM?=
 =?us-ascii?Q?koYZhAOz02YlHJlynY0u+Cne8TyLK/kJPUAaEIr7uusIQ7HpR0r5QBkkBe97?=
 =?us-ascii?Q?dnCKfWTujO4Vn80Vy25q+x43ZXw0LY4e4nI+LsZGM5fqcaRVJqO9Po7S/fAt?=
 =?us-ascii?Q?c0QJGdG++F28XjbeHpZGnEiouQX6EmvvCdAyxpNM11IQ95y6zbURQxn9aavn?=
 =?us-ascii?Q?lQLvPZL3NYGQxeyb7B2U2NEeajiLiuMKuIIc+jKmWGp8zqCed4oTBiNbAF3N?=
 =?us-ascii?Q?4O1OmQyxICoKR1TGyvFUUxrkARLwdOG59WTqKUKsA4jnneddiZtQO8LtZ6kq?=
 =?us-ascii?Q?V/3W4fsi0eAKVv+BmsOJ8kggQuPc7s5e7ouQI0E/Nemr6u5dUaPH24757r/l?=
 =?us-ascii?Q?SDt61tWpLeagGdRGpJnHWEtLQj5wvnjCzwroYeNC/PvV/vqnurjM27zdWxxK?=
 =?us-ascii?Q?r8Eiqi0+w6aFCrLdgrjNwj2Pqv95uZKKG9lC/MbwE3/UVupHRL91fPelDc2o?=
 =?us-ascii?Q?jJW8YI+/ycJICmyDjW027TfPGvQJmD5kNGb0F3frVTF0tiowIjjPk30J3vqE?=
 =?us-ascii?Q?tA9GJtffyaQGv1z+sHJmsQeG4yeBsMcqL95EBDNLh4a6WWTe/M3voZqRLsZZ?=
 =?us-ascii?Q?izOIjENOkUY7pZlyse/5cQUhb+pwLe2E1m9nfEQq7hjFu7hK8KigTOe2/ekr?=
 =?us-ascii?Q?ahRzQszdBTaPDe6dx9SBYS0PriLR7kA2SOS6mVPtYvWmj1MuidsBXNhLsuNq?=
 =?us-ascii?Q?0ltD+6yoPWK/gVXUB+U6GLGptn1XhhQ/jOMcwbGyQ01vafLQijm+SsSDnIDA?=
 =?us-ascii?Q?qrNDdxO/KwM8bZBddUmUI2WIT6J80gEJlPYZ8IIHSQ9aphS5Ouc+DV5H9g76?=
 =?us-ascii?Q?5Hri1FTP0b/I14YEWLNL36pL9GxdPJ8vj6xytKvV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcccb4d1-ec10-41b8-60ab-08dd76c200de
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 17:22:57.0178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7n06pLixd1e8bc4Jfi23VQHUFLpzoFk5ifE7uQE/WCCIt7bIkQ7gcVVjfnGfHLyI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_102304_738293_79000DCB 
X-CRM114-Status: UNSURE (   6.58  )
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

The core atomic code has a number of macros where it elaborates
architecture primitives into more functions. ARC uses
arch_atomic64_cmpxchg() as it's architecture primitive which disable alot
of the additional functions.

Instead provide arch_cmpxchg64_relaxed() as the primitive and rely on the
core macros to create arch_cmpxchg64().

The macros will also provide other functions, for instance,
try_cmpxchg64_release(), giving a more complete implementation.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Link: https://lore.kernel.org/r/Z0747n5bSep4_1VX@J2N7QTR9R3
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/arc/include/asm/atomic64-arcv2.h | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/arc/include/asm/atomic64-arcv2.h b/arch/arc/include/asm/atomic64-arcv2.h
index 9b5791b8547133..73080a664369b4 100644
--- a/arch/arc/include/asm/atomic64-arcv2.h
+++ b/arch/arc/include/asm/atomic64-arcv2.h
@@ -137,12 +137,9 @@ ATOMIC64_OPS(xor, xor, xor)
 #undef ATOMIC64_OP_RETURN
 #undef ATOMIC64_OP
 
-static inline s64
-arch_atomic64_cmpxchg(atomic64_t *ptr, s64 expected, s64 new)
+static inline u64 __arch_cmpxchg64_relaxed(volatile void *ptr, u64 old, u64 new)
 {
-	s64 prev;
-
-	smp_mb();
+	u64 prev;
 
 	__asm__ __volatile__(
 	"1:	llockd  %0, [%1]	\n"
@@ -152,14 +149,12 @@ arch_atomic64_cmpxchg(atomic64_t *ptr, s64 expected, s64 new)
 	"	bnz     1b		\n"
 	"2:				\n"
 	: "=&r"(prev)
-	: "r"(ptr), "ir"(expected), "r"(new)
-	: "cc");	/* memory clobber comes from smp_mb() */
-
-	smp_mb();
+	: "r"(ptr), "ir"(old), "r"(new)
+	: "memory", "cc");
 
 	return prev;
 }
-#define arch_atomic64_cmpxchg arch_atomic64_cmpxchg
+#define arch_cmpxchg64_relaxed __arch_cmpxchg64_relaxed
 
 static inline s64 arch_atomic64_xchg(atomic64_t *ptr, s64 new)
 {

base-commit: ea8f6ee2111cd78b32d0363ea630ba9b08ada22d
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
