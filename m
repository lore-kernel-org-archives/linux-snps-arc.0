Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633E2CA0EE4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Aug 2025 19:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHowhfA+TpcStJjh/kFgE5C2ldpJGAzhpROfOVYIFR4=; b=YlKkOrkb3Eha8x
	V+LT77xBIQcNALcPNSYxsc20n8CBUvzcL5kshvPBGEexfmoOax5f0C5FbXnNdSruMIQil52StbJLF
	UbRvytP5ZDTCLsPHCwg+enZh5uQ0kQ/5qojZskMh0XQdgKJvbDWDPUR/uOq6GTNFV3eQpomXsZVqI
	LpCeNiWV7IpJIwUg62k3I+Y7jU+VZdfUyB9e/ho+09/LQBIAldsA4KAS3UoeH5d8PRT2+sK5cJ+CU
	X9LVymKauMppdKWtYTXj5hBMaZNOBWbXWWm4hKzMvK4Ad4Zvn6GaOoyMMAJ0a2RTFrgjgfwCnTxk+
	5qZdWVhpkVxaQ83FBS/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHNv-0000000EoJw-0ZM5;
	Wed, 13 Aug 2025 19:43:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umErE-0000000EVXt-1XCU;
	Wed, 13 Aug 2025 17:01:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93BEC1C00;
	Wed, 13 Aug 2025 10:01:39 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7CB223F738;
	Wed, 13 Aug 2025 10:01:43 -0700 (PDT)
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
Subject: [PATCH 05/19] iommu/vt-d: Fix perfmon group validation
Date: Wed, 13 Aug 2025 18:00:57 +0100
Message-Id: <fcc4a9091ff02606df9495fd16b00094216a933e.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100148_461847_1629FC94 
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

The group validation here has a few issues to fix: firstly, failing to
count the group leader or the event being opened itself. Secondly it
appears wrong not to count disabled sibling events given that they could
be enabled later. Finally there's the subtlety that we should avoid racy
access to the sibling list when the event is its own group leader.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/intel/perfmon.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/intel/perfmon.c b/drivers/iommu/intel/perfmon.c
index 75f493bcb353..c3a1ac14cb2b 100644
--- a/drivers/iommu/intel/perfmon.c
+++ b/drivers/iommu/intel/perfmon.c
@@ -258,21 +258,25 @@ static int iommu_pmu_validate_group(struct perf_event *event)
 {
 	struct iommu_pmu *iommu_pmu = iommu_event_to_pmu(event);
 	struct perf_event *sibling;
-	int nr = 0;
+	int nr = 1;
 
+	if (event == event->group_leader)
+		return 0;
 	/*
 	 * All events in a group must be scheduled simultaneously.
 	 * Check whether there is enough counters for all the events.
 	 */
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (!is_iommu_pmu_event(iommu_pmu, sibling) ||
-		    sibling->state <= PERF_EVENT_STATE_OFF)
-			continue;
+	if (is_iommu_pmu_event(iommu_pmu, event->group_leader))
+		++nr;
 
-		if (++nr > iommu_pmu->num_cntr)
-			return -EINVAL;
+	for_each_sibling_event(sibling, event->group_leader) {
+		if (is_iommu_pmu_event(iommu_pmu, sibling))
+			++nr;
 	}
 
+	if (nr > iommu_pmu->num_cntr)
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.39.2.101.g768bb238c484.dirty


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
