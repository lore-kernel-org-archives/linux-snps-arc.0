Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B414C678D4
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Mar 2023 15:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlaSrsYvd4E1rsQ/T2tWyl/rwUb86zFHvNAqOVMPplA=; b=uWQrv1mHLvFq7j
	Nwy9NJuOdDXQo0YRhQMKaUYC3fd4+0ptFnxY0feJwgK2rVbu/HzSaZR43p69tZzZdlo5v30QiH4RM
	1PCTEKWc55rbazfYo/Z5ID+vtwETWATlrlXmpXpJ9aQ/52c45G1U9wQyPK3whnxt2w/lK4uIQlOVZ
	a+jsShjYc3n/MlEJWV8P7rVroxTYtzXjAzK8PPFN/E2YgSmJcWrTMdJyilmt1GqXKXp01L1lj3wOH
	/DCPOKPmVRMv79x0GaDbGZmYiBFgZfFsQSmMr9LQIvLQPZUBUVMSinDy9LS7VgQVTdbwaVABuom5q
	x9JRsVU6sCAlF8YDOTUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZYut-0015lQ-9i; Tue, 07 Mar 2023 15:07:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZYQg-000r4o-Nc
	for linux-snps-arc@lists.infradead.org; Tue, 07 Mar 2023 14:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678199797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sqdAC23AFCpafEftyGbYSrYoVeo5kk0ftc/PmTPLnCU=;
	b=KnOTP6axO5kZfJPjpqg9B4dET96fECvbqfdeAp4YzradG7u1cSzEkIWSobhyBWVII4ujqZ
	cBdMD9l8K+nRywK20zMRp0Tc0ogNvVOaEgfxBJhJnmKnV1VOoq3qU6OClYCneTb8pxE77d
	TK9/YCO8EOxqKN/ef/Hl3kwqT1X/FaA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316--Mbwj-W3NLC_0yM8Mt1Txw-1; Tue, 07 Mar 2023 09:36:31 -0500
X-MC-Unique: -Mbwj-W3NLC_0yM8Mt1Txw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FCA33C6986A;
	Tue,  7 Mar 2023 14:36:30 +0000 (UTC)
Received: from vschneid.remote.csb (unknown [10.33.37.13])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79249401B290;
	Tue,  7 Mar 2023 14:36:26 +0000 (UTC)
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
Cc: Steven Rostedt <rostedt@goodmis.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
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
Subject: [PATCH v5 1/7] trace: Add trace_ipi_send_cpumask()
Date: Tue,  7 Mar 2023 14:35:52 +0000
Message-Id: <20230307143558.294354-2-vschneid@redhat.com>
In-Reply-To: <20230307143558.294354-1-vschneid@redhat.com>
References: <20230307143558.294354-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_063638_942914_241E4E73 
X-CRM114-Status: GOOD (  12.61  )
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

trace_ipi_raise() is unsuitable for generically tracing IPI sources due to
its "reason" argument being an uninformative string (on arm64 all you get
is "Function call interrupts" for SMP calls).

Add a variant of it that exports a target cpumask, a callsite and a callback.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 include/trace/events/ipi.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/trace/events/ipi.h b/include/trace/events/ipi.h
index 0be71dad6ec03..b1125dc27682c 100644
--- a/include/trace/events/ipi.h
+++ b/include/trace/events/ipi.h
@@ -35,6 +35,28 @@ TRACE_EVENT(ipi_raise,
 	TP_printk("target_mask=%s (%s)", __get_bitmask(target_cpus), __entry->reason)
 );
 
+TRACE_EVENT(ipi_send_cpumask,
+
+	TP_PROTO(const struct cpumask *cpumask, unsigned long callsite, void *callback),
+
+	TP_ARGS(cpumask, callsite, callback),
+
+	TP_STRUCT__entry(
+		__cpumask(cpumask)
+		__field(void *, callsite)
+		__field(void *, callback)
+	),
+
+	TP_fast_assign(
+		__assign_cpumask(cpumask, cpumask_bits(cpumask));
+		__entry->callsite = (void *)callsite;
+		__entry->callback = callback;
+	),
+
+	TP_printk("cpumask=%s callsite=%pS callback=%pS",
+		  __get_cpumask(cpumask), __entry->callsite, __entry->callback)
+);
+
 DECLARE_EVENT_CLASS(ipi_handler,
 
 	TP_PROTO(const char *reason),
-- 
2.31.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
