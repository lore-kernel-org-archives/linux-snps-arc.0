Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F104C3ABDD
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 May 2025 16:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Nu3Y5ZtSciMn/D7TU2bAxb3M6Nz117Tw5MrA7c3iTc=; b=mXZ3E54wDiOhZh
	f21lSDd+72fwXcDXO9mRl0o0gewOiQoeZs3O30E041nEA5M8LMVjDsYVIxvmlGrfWJ7XYVarogLYR
	e/BlsWIqQFLpYa1KbhvS2gMNPURECMK9VsK5gikKoRmoHdNgh+hY8Hfv+tG4Wg+JTeeYrijxzAprc
	KCUeo0c7q2l+WNpu1uMg0dIaZ6AV4SylFjYzjfFwh0LQLo1wPS677KtYx9WH3HbMkrWOhyOI5SBow
	W5zg0lnpJgC44lVRI63Fmu0KssL3P2WnFYZleq/Ob3pef3sb7dwICGMFJHpFY27rkUHumf5fWxw/n
	WZlcBYTXmChbJUyRKf7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEbO-0000000Fg42-2hLe;
	Wed, 14 May 2025 16:05:02 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDok-0000000FY3T-3JDF
	for linux-snps-arc@lists.infradead.org;
	Wed, 14 May 2025 15:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747235686; x=1778771686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F4Te9Lur/xFSTBMdpmhCbCj26jVQpoawEm3xShr4VJE=;
  b=NEPggillaxRNUgJdQnNegG0+3x2S9442OvCT132E7+UPZwclL22EzOgw
   DNlrdGN+PxYH/yifpJkQL7/qxnNy7/hUy3Vxfol3k1vHG+jHRCMGmtrrQ
   Wuia519iygET+fVt07XMZYa/2JqZ+YXILiKZqDAK4mzuxjsG8UUdEeXTV
   IRnFif8RygDLZR8oK4fVSN32cLkkMrHj2CWLKJ3t4mWcNwKgl5NX8KhT5
   by5E4fkcYm2uWIUOKt0r0Xx3/eOU3gJ+uF/n9RCjQAm3WXPNOvEtSAVFE
   u9OrWEgnRRadyqanGEK8XA2r8cr7r1Fo5HkyM5RThmLkdvZCgq6XzLVfL
   w==;
X-CSE-ConnectionGUID: Han9CSKTRpGuNQFAIyHhkA==
X-CSE-MsgGUID: xXeGWLuwQvWK7LqEL2fHVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49072781"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49072781"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 08:14:46 -0700
X-CSE-ConnectionGUID: ZPSRUvmATVmhHNzzC6m1BA==
X-CSE-MsgGUID: vN5sn9IBR5Ke/vVIvDfstQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="142939174"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa005.fm.intel.com with ESMTP; 14 May 2025 08:14:46 -0700
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
	Kan Liang <kan.liang@linux.intel.com>,
	Vineet Gupta <vgupta@ikernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH V2 10/15] arc/perf: Remove driver-specific throttle support
Date: Wed, 14 May 2025 08:13:56 -0700
Message-Id: <20250514151401.2547932-11-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250514151401.2547932-1-kan.liang@linux.intel.com>
References: <20250514151401.2547932-1-kan.liang@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_081446_871046_30A3A001 
X-CRM114-Status: UNSURE (   9.09  )
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
