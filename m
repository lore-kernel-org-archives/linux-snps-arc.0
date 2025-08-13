Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F61CA0EE0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Aug 2025 18:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxLzkDiu8XDYt03Mp4DSCf0PovM2g/bpcidMXQgaAAs=; b=UpuK+4LEXGpZKS
	28zVVzV4J3gvWL5NkSEnWZiJXZO+MU11V3rb4WmW7HilwWmlFdauZBzQVSnwYBlCfq6uNJlwVlE9L
	jGgTNyKDJXWtEDFnKU46wrkp2iA06tRBOxE8XnoGSDaJinTjMH8ZkSItE2M958DWOKCFsVJ0panr8
	vb/8uyWQSWhlns9dyAH8I7J1g3vyYUJsh5S75YF7tGXjQy1U3pRbWqM0ZoyIQTEZCszhnVcTvJBqW
	7lAMIokkhWuTaKV0zOR2FGdq2ZQ6DlK6UWyidSEtKcEYCvHw6mTtgLsa3ZOB1sYU24wBxfGrVKN2x
	SbgqOR2RAU8kB/96knQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFyu-0000000EhDm-2zqy;
	Wed, 13 Aug 2025 18:13:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEsB-0000000EWHC-05Nm;
	Wed, 13 Aug 2025 17:02:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 696B21E7D;
	Wed, 13 Aug 2025 10:02:38 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 520FE3F77D;
	Wed, 13 Aug 2025 10:02:42 -0700 (PDT)
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
Subject: [PATCH 18/19] perf: Introduce positive capability for raw events
Date: Wed, 13 Aug 2025 18:01:10 +0100
Message-Id: <542787fd188ea15ef41c53d557989c962ed44771.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100247_169223_7B016F7D 
X-CRM114-Status: GOOD (  17.21  )
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

Only a handful of CPU PMUs accept PERF_TYPE_{RAW,HARDWARE,HW_CACHE}
events without registering themselves as PERF_TYPE_RAW in the first
place. Add an explicit opt-in for these special cases, so that we can
make life easier for every other driver (and probably also speed up the
slow-path search) by having perf_try_init_event() do the basic type
checking to cover the majority of cases.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

A further possibility is to automatically add the cap to PERF_TYPE_RAW
PMUs in perf_pmu_register() to have a single point-of-use condition; I'm
undecided...
---
 arch/s390/kernel/perf_cpum_cf.c    |  1 +
 arch/s390/kernel/perf_pai_crypto.c |  2 +-
 arch/s390/kernel/perf_pai_ext.c    |  2 +-
 arch/x86/events/core.c             |  2 +-
 drivers/perf/arm_pmu.c             |  1 +
 include/linux/perf_event.h         |  1 +
 kernel/events/core.c               | 15 +++++++++++++++
 7 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/arch/s390/kernel/perf_cpum_cf.c b/arch/s390/kernel/perf_cpum_cf.c
index 1a94e0944bc5..782ab755ddd4 100644
--- a/arch/s390/kernel/perf_cpum_cf.c
+++ b/arch/s390/kernel/perf_cpum_cf.c
@@ -1054,6 +1054,7 @@ static void cpumf_pmu_del(struct perf_event *event, int flags)
 /* Performance monitoring unit for s390x */
 static struct pmu cpumf_pmu = {
 	.task_ctx_nr  = perf_sw_context,
+	.capabilities = PERF_PMU_CAP_RAW_EVENTS,
 	.pmu_enable   = cpumf_pmu_enable,
 	.pmu_disable  = cpumf_pmu_disable,
 	.event_init   = cpumf_pmu_event_init,
diff --git a/arch/s390/kernel/perf_pai_crypto.c b/arch/s390/kernel/perf_pai_crypto.c
index a64b6b056a21..b5b6d8b5d943 100644
--- a/arch/s390/kernel/perf_pai_crypto.c
+++ b/arch/s390/kernel/perf_pai_crypto.c
@@ -569,7 +569,7 @@ static const struct attribute_group *paicrypt_attr_groups[] = {
 /* Performance monitoring unit for mapped counters */
 static struct pmu paicrypt = {
 	.task_ctx_nr  = perf_hw_context,
-	.capabilities = PERF_PMU_CAP_SAMPLING,
+	.capabilities = PERF_PMU_CAP_SAMPLING | PERF_PMU_CAP_RAW_EVENTS,
 	.event_init   = paicrypt_event_init,
 	.add	      = paicrypt_add,
 	.del	      = paicrypt_del,
diff --git a/arch/s390/kernel/perf_pai_ext.c b/arch/s390/kernel/perf_pai_ext.c
index 1261f80c6d52..bcd28c38da70 100644
--- a/arch/s390/kernel/perf_pai_ext.c
+++ b/arch/s390/kernel/perf_pai_ext.c
@@ -595,7 +595,7 @@ static const struct attribute_group *paiext_attr_groups[] = {
 /* Performance monitoring unit for mapped counters */
 static struct pmu paiext = {
 	.task_ctx_nr  = perf_hw_context,
-	.capabilities = PERF_PMU_CAP_SAMPLING,
+	.capabilities = PERF_PMU_CAP_SAMPLING | PERF_PMU_CAP_RAW_EVENTS,
 	.event_init   = paiext_event_init,
 	.add	      = paiext_add,
 	.del	      = paiext_del,
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 789dfca2fa67..764728bb80ae 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2697,7 +2697,7 @@ static bool x86_pmu_filter(struct pmu *pmu, int cpu)
 }
 
 static struct pmu pmu = {
-	.capabilities		= PERF_PMU_CAP_SAMPLING,
+	.capabilities		= PERF_PMU_CAP_SAMPLING | PERF_PMU_CAP_RAW_EVENTS,
 
 	.pmu_enable		= x86_pmu_enable,
 	.pmu_disable		= x86_pmu_disable,
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 72d8f38d0aa5..bc772a3bf411 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -877,6 +877,7 @@ struct arm_pmu *armpmu_alloc(void)
 		 * specific PMU.
 		 */
 		.capabilities	= PERF_PMU_CAP_SAMPLING |
+				  PERF_PMU_CAP_RAW_EVENTS |
 				  PERF_PMU_CAP_EXTENDED_REGS |
 				  PERF_PMU_CAP_EXTENDED_HW_TYPE,
 	};
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 183b7c48b329..c6ad036c0037 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -305,6 +305,7 @@ struct perf_event_pmu_context;
 #define PERF_PMU_CAP_EXTENDED_HW_TYPE	0x0100
 #define PERF_PMU_CAP_AUX_PAUSE		0x0200
 #define PERF_PMU_CAP_AUX_PREFER_LARGE	0x0400
+#define PERF_PMU_CAP_RAW_EVENTS		0x0800
 
 /**
  * pmu::scope
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 71b2a6730705..2ecee76d2ae2 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -12556,11 +12556,26 @@ static inline bool has_extended_regs(struct perf_event *event)
 	       (event->attr.sample_regs_intr & PERF_REG_EXTENDED_MASK);
 }
 
+static bool is_raw_pmu(const struct pmu *pmu)
+{
+	return pmu->type == PERF_TYPE_RAW ||
+	       pmu->capabilities & PERF_PMU_CAP_RAW_EVENTS;
+}
+
 static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 {
 	struct perf_event_context *ctx = NULL;
 	int ret;
 
+	/*
+	 * Before touching anything, we can safely skip:
+	 * - any event for a specific PMU which is not this one
+	 * - any common event if this PMU doesn't support them
+	 */
+	if (event->attr.type != pmu->type &&
+	    (event->attr.type >= PERF_TYPE_MAX || is_raw_pmu(pmu)))
+		return -ENOENT;
+
 	if (!try_module_get(pmu->module))
 		return -ENODEV;
 
-- 
2.39.2.101.g768bb238c484.dirty


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
