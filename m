Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB15C4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Nov 2022 18:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fORK+Uisx+ZLPhJTuKksBxqgA5jW5WrGU11f26pddHQ=; b=KYLukuAcEAFrUe
	ZH1ekBoE8ztGqlSpoe3N3zMTAs4Qi0HMMJvbRgU20RtxxFe4NFKi9wdiTh6snf8fDD1YY9ICwjGiW
	6zcojm2gd8AW/oz+VjG4388HN4pvy+lv9nSS5X9sIYGKfFQ+woSNy9FU4giEO1oME9D+LqjrJlEqt
	n3ou4Zo8eRRDe53CjpZCcckihK24d/MBl42Zx/YC89ANb3gPMddsySmSsF6jWYpYkUoEM//F5+1B0
	5XlxXX2KqGuzIxLhSdj++6ejft/VyThCUJ5aZPLREHNKRLGJfqIwNZizwxiRAQh2HW/0yDg/lRCa3
	6eQQTzlVkyvTaHIJwgiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqIaQ-00D7I8-Cq; Wed, 02 Nov 2022 18:35:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqIZH-00D6QD-OI
	for linux-snps-arc@lists.infradead.org; Wed, 02 Nov 2022 18:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667414066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vPxNJZ59dAj9Aw/rnn/vqSwo8b8sDM1O6Xi76OwhNZs=;
	b=Fe71/qi6ynieum+6CED0InQm406/v4yXSAzYo77+vPxSWtmHhgXkkS1zsoSVjZmE5xMuLQ
	jDaQRqrZq+bu9wzNN13KxiPVqc/DdQP6o+aNltlP+srcOMw12wtmHGJmB/lXu3GE0D6/Wv
	PaK3mSES+/gU9o2HPY4J6haSkcMA1Lc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-22-oitwRwRpPNu9zMZEfG_Ciw-1; Wed, 02 Nov 2022 14:34:25 -0400
X-MC-Unique: oitwRwRpPNu9zMZEfG_Ciw-1
Received: by mail-qv1-f70.google.com with SMTP id q16-20020a0ce210000000b004ba8976d3aaso10355285qvl.5
        for <linux-snps-arc@lists.infradead.org>; Wed, 02 Nov 2022 11:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPxNJZ59dAj9Aw/rnn/vqSwo8b8sDM1O6Xi76OwhNZs=;
        b=Q7zIgW4s6Lfk3BmjWdeOBTJMU4QPTWOmd/C+qDrKad9WmXVKo4TA9Ly6K4Wy4Br869
         p3sQ0hp7qcnbUnPbH4mKCyYsc/abtCRM/TFRVPgPPyJB41XaE1Kb3w7YtvdnrwUqfsRe
         vuAUESsObZcBTHsDUTFiJKGafPb7UPaMO9tieCuWwBarpb2f88Wah00IW9+5FczwfFoJ
         QP1aJB1OPjzKj5kMJV7u4RVVPKkK4njEOQ86EfU0pjIN1pkGlB1cDUbYPTjm+/yiqzM+
         nRMmE0Y1yjf07KdJPijo6SaUvncPxBip8eNg+KleduiPQiVpaESKyRtPvNr28gx5q2nA
         KvHg==
X-Gm-Message-State: ACrzQf3DiW3nW9FjSTGrODUQXLjg0UBtPA/IWC6El9IJldla7mHjHHbJ
	m4wTscmeTmKJLXxt5vn5PpAcdClA86U4xo56lCRN85M7C6MtESOjUQ9ld9HQQV5Klc3jizHkU5I
	6KOn+JJ2bbgvgqv7+ZCoGxnze8vGDL0t6
X-Received: by 2002:a37:92c6:0:b0:6fa:28b2:1e2a with SMTP id u189-20020a3792c6000000b006fa28b21e2amr13574199qkd.9.1667414064985;
        Wed, 02 Nov 2022 11:34:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4EXOUjNlIxUYR8PDvF9w7H8/QWuUsvimzUEYEqnOFqRnuqhuZtDCzI4Vu/740apEttSzlakQ==
X-Received: by 2002:a37:92c6:0:b0:6fa:28b2:1e2a with SMTP id u189-20020a3792c6000000b006fa28b21e2amr13574163qkd.9.1667414064758;
        Wed, 02 Nov 2022 11:34:24 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id w187-20020a3794c4000000b006eed47a1a1esm8757820qkd.134.2022.11.02.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:34:23 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	x86@kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: [RFC PATCH v2 5/8] irq_work: Trace self-IPIs sent via arch_irq_work_raise()
Date: Wed,  2 Nov 2022 18:33:33 +0000
Message-Id: <20221102183336.3120536-4-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221102182949.3119584-1-vschneid@redhat.com>
References: <20221102182949.3119584-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_113427_888292_87727148 
X-CRM114-Status: GOOD (  16.15  )
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

IPIs sent to remove CPUs via irq_work_queue_on() are now covered by
trace_ipi_send_cpumask(), add another instance of the tracepoint to cover
self-IPIs.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/irq_work.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/kernel/irq_work.c b/kernel/irq_work.c
index 7afa40fe5cc43..aec38c294ce68 100644
--- a/kernel/irq_work.c
+++ b/kernel/irq_work.c
@@ -22,6 +22,8 @@
 #include <asm/processor.h>
 #include <linux/kasan.h>
 
+#include <trace/events/ipi.h>
+
 static DEFINE_PER_CPU(struct llist_head, raised_list);
 static DEFINE_PER_CPU(struct llist_head, lazy_list);
 static DEFINE_PER_CPU(struct task_struct *, irq_workd);
@@ -74,6 +76,16 @@ void __weak arch_irq_work_raise(void)
 	 */
 }
 
+static inline void irq_work_raise(struct irq_work *work)
+{
+	if (trace_ipi_send_cpumask_enabled() && arch_irq_work_has_interrupt())
+		trace_ipi_send_cpumask(cpumask_of(smp_processor_id()),
+				       _RET_IP_,
+				       work->func);
+
+	arch_irq_work_raise();
+}
+
 /* Enqueue on current CPU, work must already be claimed and preempt disabled */
 static void __irq_work_queue_local(struct irq_work *work)
 {
@@ -99,7 +111,7 @@ static void __irq_work_queue_local(struct irq_work *work)
 
 	/* If the work is "lazy", handle it from next tick if any */
 	if (!lazy_work || tick_nohz_tick_stopped())
-		arch_irq_work_raise();
+		irq_work_raise(work);
 }
 
 /* Enqueue the irq work @work on the current CPU */
-- 
2.31.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
