Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AA7C87FCF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Aug 2025 19:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uoOR8e+EptRvbttgGdfa9a8/P/J7C89AuaSgMc6ttQ4=; b=ReBTxKS0Wv7O6l
	LclgMT5TDDTIGfqEVz0E1mwo329OjVAfiwiHRELeB1PedLa/sycipsAq8tWLZgZ11imcAP3ACc+qu
	6JcUwU8vNW1TldyfjlNrXjKREqwomxHTBzrWgho/PdXYO1EI8O6dUatHMyA/8cuaDx7P7oJ1N/N3D
	fKxKacShl3xbowdmeI3uj4mUaBuru7vtN1dteils2rA2ckM0+9pIf8Xnp1SjsnFuCkRQbt2fyOJ5E
	BD1ShGDZs9rkD115OoOnJ2KQLHkXVoCLamE9vsi3Bi68ij9BK1Rkuk09wJfQVurkFBepGrcOJAc73
	zpmabQIP8CS+hn+2Qtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHNx-0000000EoMq-2ZCl;
	Wed, 13 Aug 2025 19:43:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umErI-0000000EVb0-3ZCA;
	Wed, 13 Aug 2025 17:01:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29D641C01;
	Wed, 13 Aug 2025 10:01:44 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 074E03F738;
	Wed, 13 Aug 2025 10:01:47 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	mark.rutland@arm.com,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com
Cc: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	coresight@lists.linaro.org,
	iommu@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 06/19] ARM: l2x0: Fix group validation
Date: Wed, 13 Aug 2025 18:00:58 +0100
Message-Id: <925c34a4b7f0defc3582a9fcccb6af1c21279a86.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100152_926683_446A6F08 
X-CRM114-Status: UNSURE (   9.69  )
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

The group validation here is almost right, but fails to count the new
event itself. While we fix that, also adopt the standard pattern to
avoid racy access the sibling list and drop checks that are redundant
with core code.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm/mm/cache-l2x0-pmu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mm/cache-l2x0-pmu.c b/arch/arm/mm/cache-l2x0-pmu.c
index 93ef0502b7ff..6fc1171031a8 100644
--- a/arch/arm/mm/cache-l2x0-pmu.c
+++ b/arch/arm/mm/cache-l2x0-pmu.c
@@ -274,18 +274,17 @@ static bool l2x0_pmu_group_is_valid(struct perf_event *event)
 	struct pmu *pmu = event->pmu;
 	struct perf_event *leader = event->group_leader;
 	struct perf_event *sibling;
-	int num_hw = 0;
+	int num_hw = 1;
+
+	if (leader == event)
+		return true;
 
 	if (leader->pmu == pmu)
 		num_hw++;
-	else if (!is_software_event(leader))
-		return false;
 
 	for_each_sibling_event(sibling, leader) {
 		if (sibling->pmu == pmu)
 			num_hw++;
-		else if (!is_software_event(sibling))
-			return false;
 	}
 
 	return num_hw <= PMU_NR_COUNTERS;
-- 
2.39.2.101.g768bb238c484.dirty


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
