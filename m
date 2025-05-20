Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0EAC3ABDD
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 May 2025 18:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MRHqCZ5xJc9voaKkRnWI6cFPpHEo7tjxEkk2qY9fSYk=; b=NMVkDU9965auWa
	6bRbL4vJh1GkLCt2Xq3/8bkWToSJ4Q5bmPx6hCzVTd046vipY8os+HSR5Nv0KLMnso1/5dgm3OKb/
	2mPdH7vKd5XtT33taWuSU/WTtFB5v5gfhSn9z77wc3RnpZkG2EFNL4VrcOoMTncBmIXMGpMDI7PK9
	K40hBguXUc7aWoGPLDZ3VFrxsSgI8YbMItQ2N0/zLP/QRt04CDEJe3MR/wxqnf4hcHVGkkB8ed+Qr
	d+GCsMYcU5JLFog5LzalcFK8zhJQgpkEIE1paUO02lDs7NCIdNNtmowKPc0rF6H22YO80NNZgi/Fu
	V00cXbRw08V4HXyj8yYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHRWf-0000000Dluv-167X;
	Tue, 20 May 2025 18:17:17 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHRWd-0000000Dlt5-0HU8
	for linux-snps-arc@lists.infradead.org;
	Tue, 20 May 2025 18:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747765035; x=1779301035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s3ZgcZ6BKTnLp+A1PAb6rpm8YoZDgBt/nxZwAaxXJ7E=;
  b=mo5bCRK1gaKiFQF4EB4g22A6E1k+D9H0Jj9Yh9ZvnH6IrwY3V0x4wutS
   4YFaaAbX34kpz7Q7VOiyYsjIJgfNe52uIHPsBqDcuXPN7Rj9cR32aFQ/z
   C9CAtTwj4b7WcySJOHn1z8DE25KYZYSObSWpCmVVZjJXC/vp06gUvcTul
   vAgyX5t68D61p6tnl7cZDdSRvJWhiKbC4AjpM0uKiJaTFQpxSAY4rGpY7
   2VPZv0XwpfrUj+oz/YacAg4vEgHWN5DWaTHvRVRiQu5vrJLs76CZNEkPY
   y5C+o90SAh4tjbvSvZSQPgoakGI9FySWIwqJoYhDI8IDXgj0JuG/p05Zr
   A==;
X-CSE-ConnectionGUID: 7mBhbyoAQNqUr7eGhAKkqA==
X-CSE-MsgGUID: in+6fqhEQie+rl8rxWnG2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49848027"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49848027"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 11:17:14 -0700
X-CSE-ConnectionGUID: zgxjsAdARFahbTEB79tOeA==
X-CSE-MsgGUID: uyVaAjEwQi6E30TJqOU05A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144514719"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by orviesa003.jf.intel.com with ESMTP; 20 May 2025 11:17:13 -0700
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
	Vineet Gupta <vgupta@kernel.org>,
	Vineet Gupta <vgupta@ikernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH V4 11/16] arc/perf: Remove driver-specific throttle support
Date: Tue, 20 May 2025 11:16:39 -0700
Message-Id: <20250520181644.2673067-12-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250520181644.2673067-1-kan.liang@linux.intel.com>
References: <20250520181644.2673067-1-kan.liang@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_111715_127787_5DC0E90C 
X-CRM114-Status: UNSURE (   9.25  )
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

Acked-by: Vineet Gupta <vgupta@kernel.org>
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
