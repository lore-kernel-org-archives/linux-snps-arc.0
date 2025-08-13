Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB26CA0EE0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Aug 2025 18:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UaSG40fDixkYdEWEy3K3hXLW0Zvi2ZpCUMOtkjPCgqY=; b=n47JT0irypDqcW
	+m7Ccx4LgE4mOLOCg8KmRV7E0c13Ztm4oL/D48YH5+BGt3/26rkkNFqkYWEtLG1V3IxFNIZDg+uMj
	eu2lk01DbjFdQqtm59DOUFqgoW68fRecaO57h+OA9APw3I25fy4LNVLIOyMhCLD+2cc4jAaKgVxv3
	mMKBh5sE8jgIQSXVCE+NDAlaHKezPel5vRyWzj1xwNffwYFTbDM69TygDcb0NBsicxj1MTJSxWqUe
	wH3vrs11sKBcHDTAXu7bEVo4hDDP9F48BzSWGnfX25FM2v9y/x1jvwEgcXaEJQapT4LZ0E2aKvkUB
	FMSoKGfv3wLaWwQvGYHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrh-0000000EfHV-3qdZ;
	Wed, 13 Aug 2025 18:06:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEr5-0000000EVQM-0eGY;
	Wed, 13 Aug 2025 17:01:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 901F71BD0;
	Wed, 13 Aug 2025 10:01:30 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 776713F738;
	Wed, 13 Aug 2025 10:01:34 -0700 (PDT)
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
Subject: [PATCH 03/19] perf/imx8_ddr: Fix group validation
Date: Wed, 13 Aug 2025 18:00:55 +0100
Message-Id: <bfb1445bc741a170302b77e3f513b01cd676c9d8.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100139_332053_798598A4 
X-CRM114-Status: GOOD (  10.56  )
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

The group validation here is erroneously inspecting software events,
as well as other hardware siblings, which are only checked for *after*
they've already been misinterpreted. Once again, just ignore events
which don't belong to our PMU, and don't duplicate what
perf_event_open() will already check for us.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/fsl_imx8_ddr_perf.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8_ddr_perf.c
index b989ffa95d69..56fe281974d2 100644
--- a/drivers/perf/fsl_imx8_ddr_perf.c
+++ b/drivers/perf/fsl_imx8_ddr_perf.c
@@ -331,6 +331,9 @@ static u32 ddr_perf_filter_val(struct perf_event *event)
 static bool ddr_perf_filters_compatible(struct perf_event *a,
 					struct perf_event *b)
 {
+	/* Ignore grouped events that aren't ours */
+	if (a->pmu != b->pmu)
+		return true;
 	if (!ddr_perf_is_filtered(a))
 		return true;
 	if (!ddr_perf_is_filtered(b))
@@ -409,16 +412,8 @@ static int ddr_perf_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	}
 
-	/*
-	 * We must NOT create groups containing mixed PMUs, although software
-	 * events are acceptable (for example to create a CCN group
-	 * periodically read when a hrtimer aka cpu-clock leader triggers).
-	 */
-	if (event->group_leader->pmu != event->pmu &&
-			!is_software_event(event->group_leader))
-		return -EINVAL;
-
-	if (pmu->devtype_data->quirks & DDR_CAP_AXI_ID_FILTER) {
+	if (event != event->group_leader &&
+	    pmu->devtype_data->quirks & DDR_CAP_AXI_ID_FILTER) {
 		if (!ddr_perf_filters_compatible(event, event->group_leader))
 			return -EINVAL;
 		for_each_sibling_event(sibling, event->group_leader) {
@@ -427,12 +422,6 @@ static int ddr_perf_event_init(struct perf_event *event)
 		}
 	}
 
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling->pmu != event->pmu &&
-				!is_software_event(sibling))
-			return -EINVAL;
-	}
-
 	event->cpu = pmu->cpu;
 	hwc->idx = -1;
 
-- 
2.39.2.101.g768bb238c484.dirty


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
