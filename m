Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6DFC433FE
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Nov 2022 18:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzXg4IDMmhrQRe/s6yZ7SEkdI+JfKMI6B3o0YJgG1d0=; b=BfO1yksIgiiWaw
	wKgD7xmxClFpF9LUbHReTu6z6GVdhln3cFnc3r72cvNpfoOeY24CisdZD3A82/qTJsGen9fWkwH9c
	Y4S2kzc0QYTRRV47HbVSFV22c05CJ2buYVJuuCWzDGvu4f3OHyn0gN4wLCFZJQkM1q0MEofPMdA7/
	cipquQkH5dsufFhZiISYF5iSJpKqymCAKi9OcamhhejeuKHZx2tbyU4TOPL7PqmkQWwtjwoQy/CCu
	BRHMzwxzfg/TdHrcf+xO15PmEii17+c3jk8ppPhfCmyVAw78OE//oviX/v9lLvZs3vBAs48K43a9h
	BrQ4VmDDITRPi6aBCArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqIaF-00D77x-P9; Wed, 02 Nov 2022 18:35:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqIZD-00D6MH-4Q
	for linux-snps-arc@lists.infradead.org; Wed, 02 Nov 2022 18:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667414062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QqLWPThYSO+7/uH6VGCIiG2p0FrpcxY/esl5LuglSyI=;
	b=UaqOzmF3XjoLl4fg9Cex0D2JZhb4Hn4fs/xuSkfevBtbljclmc82i5hLfUwGo4vvNTut3A
	iWqg1vS5Hw7hN7FelKt6q2MtNHS4UVvAj8kccLsIzL80JsEQvUdfSo0GlxoqaAUUbjMiRu
	2go1IVhZ8b4mzdEp4XHbnPGlcHfvYRA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-MhlM7m-NMU2KpHjJqskg2g-1; Wed, 02 Nov 2022 14:34:21 -0400
X-MC-Unique: MhlM7m-NMU2KpHjJqskg2g-1
Received: by mail-qk1-f197.google.com with SMTP id w4-20020a05620a444400b006fa24b2f394so9678718qkp.15
        for <linux-snps-arc@lists.infradead.org>; Wed, 02 Nov 2022 11:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqLWPThYSO+7/uH6VGCIiG2p0FrpcxY/esl5LuglSyI=;
        b=YExtwGtQ7Xvb5E9bPNW9l6cpDmHxRew7i6FrYZPt4oezzPSxM4IXW0ErE0FLGh4Uxd
         Aarwnj+6v+oE4dRMvMRllKX830GV3oKBe4mjbJDdSBlt7JtQfQAGDuZsdnoy9/NvfocG
         DzO1QsGxAgXCek+V16kY/f7FxwJuYy8I/TvRJOmFriZkJEaZMyyMCvoZNSksfTkfLOFP
         Di0srCmcbZKdABPUpGKX+nU7lhbYUiBTNNVE7qJ3fBfSyxumE5h7yw/PwI5dFUnZSvc6
         4h4RLXFwtZJaeC611CGQqNLmCE87b1BpVICbgydgWxDYx9TawcpCAGn0IPN5xqQq6Puw
         mvEQ==
X-Gm-Message-State: ACrzQf3tB7xJzRoayAFIsMweKh73/da2qIjEePrv4ilgpIBBk+/3i46Z
	1SPuiPoSLuyjNCSvLDdLbItundt6d1qwdnuOdFSh00Pp1hSQJOs9+14PQZam5eXtg2NQ8ZFsMZQ
	pRKrq3IVH9C8tDbgpTN50HApBoKjvRSdc
X-Received: by 2002:a05:620a:2185:b0:6fa:9b5:7bcd with SMTP id g5-20020a05620a218500b006fa09b57bcdmr17834795qka.689.1667414059894;
        Wed, 02 Nov 2022 11:34:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5zQBXSq1wHjxRSmwTcnsY0fuwHzVoafdqUQfLwgY4gLc/C2queTj08Inp5WgKA+UYkDnhs/w==
X-Received: by 2002:a05:620a:2185:b0:6fa:9b5:7bcd with SMTP id g5-20020a05620a218500b006fa09b57bcdmr17834779qka.689.1667414059700;
        Wed, 02 Nov 2022 11:34:19 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id w187-20020a3794c4000000b006eed47a1a1esm8757820qkd.134.2022.11.02.11.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:34:18 -0700 (PDT)
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
Subject: [RFC PATCH v2 4/8] smp: Trace IPIs sent via arch_send_call_function_ipi_mask()
Date: Wed,  2 Nov 2022 18:33:32 +0000
Message-Id: <20221102183336.3120536-3-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221102182949.3119584-1-vschneid@redhat.com>
References: <20221102182949.3119584-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_113423_305034_34FD83D3 
X-CRM114-Status: GOOD (  13.80  )
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

This simply wraps around the arch function and prepends it with a
tracepoint, similar to send_call_function_single_ipi().

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/smp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index e2ca1e2f31274..c4d561cf50d45 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -160,6 +160,13 @@ void __init call_function_init(void)
 	smpcfd_prepare_cpu(smp_processor_id());
 }
 
+static inline void
+send_call_function_ipi_mask(const struct cpumask *mask)
+{
+	trace_ipi_send_cpumask(mask, _RET_IP_, func);
+	arch_send_call_function_ipi_mask(mask);
+}
+
 #ifdef CONFIG_CSD_LOCK_WAIT_DEBUG
 
 static DEFINE_STATIC_KEY_FALSE(csdlock_debug_enabled);
@@ -970,7 +977,7 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 		if (nr_cpus == 1)
 			send_call_function_single_ipi(last_cpu);
 		else if (likely(nr_cpus > 1))
-			arch_send_call_function_ipi_mask(cfd->cpumask_ipi);
+			send_call_function_ipi_mask(cfd->cpumask_ipi);
 
 		cfd_seq_store(this_cpu_ptr(&cfd_seq_local)->pinged, this_cpu, CFD_SEQ_NOCPU, CFD_SEQ_PINGED);
 	}
-- 
2.31.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
