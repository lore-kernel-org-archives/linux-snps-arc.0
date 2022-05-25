Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F6DC433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 May 2022 14:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XhskJ39yRnm6ZEmyG7zdoPNY8syX3vHgi2yamK7GlPc=; b=lRGAieUItvktxm
	sEFja42qumYSredCbbw6okK7pF9NCYOyvcwS/Ah8lZHT6LC9NLdyBScG5YwwgJ5zd5T2rW0McYIDy
	qDf1ug8CDdNBuAVtLHdas4Wb/v1xLkHzg0BOZ6NUPFvIXvhN+5WUtyjUEUb0FsE7uvMLPxo1AXAy+
	HLQhPhB6eVRLyIOr9FYJMsFGTuzo4kKeXO/MMGfFDrkGz58OGulvPKzABSn9augNW/VeeRZkdrqzR
	6lEI3lS8US/kXjOL6WCfJRlbfCbMW+/ZMoPlKwSMuPBXb63T/rrAzA+Cqd7OuS1+qwWmHV/zNZCsI
	KOBLtxNXAX5I+RVBb3Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntrfi-00BNuM-Nx; Wed, 25 May 2022 14:07:34 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntrfg-00BNsi-G6
	for linux-snps-arc@lists.infradead.org; Wed, 25 May 2022 14:07:33 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EDDA9C291F;
	Wed, 25 May 2022 14:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1653487646; bh=5cCPFXr+LnfgzV/0NmXn+mk3q0rrcMzWb4fJk8bv7Vw=;
	h=From:To:Cc:Subject:Date:From;
	b=Y847XgoungdnOAW4Iei90+InKodSIlZF+e0xuA71wR7Fb+PPKAi9WiDojyCXfOqGk
	 gwyX/SBBAh8tb5rtZdCpyiSoe8Ii/H25EEGx6Atin0ufG3aEp3SLrpTN2sRQDcd+VJ
	 RsQ174D6s6BNZHRFCFzAWncrIe9yh6QeYg184p7IaGo2fqOFBWwvJE6PTkGPjJfMkv
	 etScMGCb9RdY5vt7F8dJh3IX+LRI/HWG50vtmVECAs8CjrlDi2s8UCA/+e1/SJaHUj
	 iQanaQxoTsTVLbgFtlTJcTBS2fd3cCZ2Ugnl/PmVN1KhvnezCzLU+q99DghK4fr7Lk
	 cqIitpAy6SvCw==
Received: from debian-vm.internal.synopsys.com (agishev-7410.internal.synopsys.com [10.116.104.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 1B8BAA0078;
	Wed, 25 May 2022 14:07:21 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Nikolay Agishev <Nikolay.Agishev@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: vgupta@kernel.org, peterz@infradead.org,
	Nikolay Agishev <Nikolay.Agishev@synopsys.com>
Subject: [PATCH] Fix backtrace message from arc_pmu_device_probe()
Date: Wed, 25 May 2022 18:06:55 +0400
Message-Id: <20220525140655.1053711-1-agishev@synopsys.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_070732_601689_6A303EEC 
X-CRM114-Status: GOOD (  10.13  )
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

this_cpu_ptr() call causes backtrace with CONFIG_DEBUG_PREEMPT=y
because it required non-preemptive mode.

Stack Trace:
  arc_unwind_core+0xe8/0x118
  dump_stack_lvl+0x2c/0x40
  check_preemption_disabled+0xb4/0xb8
  arc_pmu_device_probe+0x336/0x3c8
  platform_probe+0x30/0x80
  really_probe.part.0+0x8c/0x248
  driver_probe_device+0x86/0x1e8
  __driver_attach+0x8a/0x144
  bus_for_each_dev+0x38/0x64
  bus_add_driver+0x112/0x178
  driver_register+0x4c/0xdc
  do_one_initcall+0x30/0x110
  kernel_init_freeable+0x14a/0x1b0

Suggested fix turns off preemption for the routine call.

Signed-off-by: Nikolay Agishev <agishev@synopsys.com>
---
 arch/arc/kernel/perf_event.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index adff957962da..10bbdc2dab01 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -806,10 +806,14 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 
 			arc_pmu->irq = irq;
 
+			get_cpu_ptr(&arc_pmu_cpu);
+
 			/* intc map function ensures irq_set_percpu_devid() called */
 			ret = request_percpu_irq(irq, arc_pmu_intr, "ARC perf counters",
 						 this_cpu_ptr(&arc_pmu_cpu));
 
+			put_cpu_ptr(&arc_pmu_cpu);
+
 			if (!ret)
 				on_each_cpu(arc_cpu_pmu_irq_init, &irq, 1);
 			else
-- 
2.35.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
