Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD174C3ABC9
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 May 2025 18:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Nu3Y5ZtSciMn/D7TU2bAxb3M6Nz117Tw5MrA7c3iTc=; b=3AQCxcILk6GO1Z
	88E1GlXjjYX9auqzRym6vH6p75rGMXRXZLFmg2scMpvkBEFu6qUQbXsEOX6Q0UyxeGjyg1TTDS2vm
	+h2wlp99sO902i56Te8Yyn21ABkeNTYfMaxDGjZEUNuezqlVCSWbdHaFLkLxD7jPVFt789EHJtvCv
	CQ5E8k8zZTEUe3CahkquG8Q1tAoLrgVz4OaEgS8W9WVS/aeu11+QeMyCcN18JADB9i4EkYfEXOiYl
	aWxaENLBTg11t7Qb/Jnb6C6yoqhkOzy/h1RaI+eU2SCGZcoMVHZ/Aa4f6Ej7cqhyo8iOJU2xlu8kP
	syvCaxZcsAN+p2grBnfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzxs-00000004Lt0-2Pj4;
	Fri, 16 May 2025 18:39:24 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzoF-00000004Jgk-38LR
	for linux-snps-arc@lists.infradead.org;
	Fri, 16 May 2025 18:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747420168; x=1778956168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F4Te9Lur/xFSTBMdpmhCbCj26jVQpoawEm3xShr4VJE=;
  b=hXFpkhA0hlRzIM3NXe/XNc2YowFRz+qiRQbV1jG+/I9PJ1xxConSDkJ2
   8ZLNIOgVdGAcM9HxGCAkC+2r/Oy4hnxlVOOW9dZakgBnshRVCHemMzLjO
   K+1Fd5Y7FjsSN0OMvjib3tlJZUEyiPGzJQw8CD5r0xOyvs+4qfJ+V+7Y/
   C9GwdOAXjyOw5ZJKv1XGGdO5oIMWuDRGnF+c6MSeBkiQA8mpKQ6jD9ebj
   NCopKABNOwDOoOULKleXd0qK+1R/EdiQqVO/RppnshuGyEQvBQf1KOvLU
   z3cvPDSbVoXD9I8X8a4Lw8vxpvX4rp1ZiQnbVienRbNPxw6gpbsWEU/c6
   g==;
X-CSE-ConnectionGUID: B6Y+/45jQNGseHzaBwjqgQ==
X-CSE-MsgGUID: cM4SCClnTIW28bsmdYq6TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49328881"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="49328881"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 11:29:24 -0700
X-CSE-ConnectionGUID: UBs/ihSUS9CKF92ke3GkYA==
X-CSE-MsgGUID: jZ7zldPVSQqDVnoqwuidxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="169802618"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 11:29:23 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	irogers@google.com,
	mark.rutland@arm.com,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: eranian@google.com,
	ctshao@google.com,
	tmricht@linux.ibm.com,
	leo.yan@arm.com,
	Kan Liang <kan.liang@linux.intel.com>,
	Vineet Gupta <vgupta@ikernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH V3 11/16] arc/perf: Remove driver-specific throttle support
Date: Fri, 16 May 2025 11:28:48 -0700
Message-Id: <20250516182853.2610284-12-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250516182853.2610284-1-kan.liang@linux.intel.com>
References: <20250516182853.2610284-1-kan.liang@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_112927_802741_56715C8B 
X-CRM114-Status: UNSURE (   9.01  )
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

From: Kan Liang <kan.liang@linux.intel.com>

The throttle support has been added in the generic code. Remove
the driver-specific throttle support.

Besides the throttle, perf_event_overflow may return true because of
event_limit. It already does an inatomic event disable. The pmu->stop
is not required either.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Cc: Vineet Gupta <vgupta@ikernel.org>
Cc: linux-snps-arc@lists.infradead.org
---
 arch/arc/kernel/perf_event.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index 6e5a651cd75c..ed6d4f0cd621 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -599,10 +599,8 @@ static irqreturn_t arc_pmu_intr(int irq, void *dev)
 
 		arc_perf_event_update(event, &event->hw, event->hw.idx);
 		perf_sample_data_init(&data, 0, hwc->last_period);
-		if (arc_pmu_event_set_period(event)) {
-			if (perf_event_overflow(event, &data, regs))
-				arc_pmu_stop(event, 0);
-		}
+		if (arc_pmu_event_set_period(event))
+			perf_event_overflow(event, &data, regs);
 
 		active_ints &= ~BIT(idx);
 	} while (active_ints);
-- 
2.38.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
