Return-Path: <SRS0=fi28=74=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C4EC433DF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2020 22:16:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 683A720739
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2020 22:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mR6Me0mK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ccI1UbKJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 683A720739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDyXlNCfqnBcUP7hvB6j5834IDuG2Z/wsieaqYpxMKo=; b=mR6Me0mKQYlxiP
	2nLytHgKiH7eAxaCi+S2OSsAR6CcnrAPwryanQSJiLjWjnRHpIUUF0lXrJikxbGYYnNduo4VDkfqY
	7gZBkp3atP0l2wwih59HSPEDXd0qbqyX8PiX1ObqoNrSGhIwFkTapZQk/LKkpU2mUtw7MNhYX0wTF
	z9KjKDj7F7UUt8vn2I0vcTdLq2XcAuqb3CQfl5jO5n5msc55uUbO+9GudWZWN10WVMIsDY1RDzLtv
	bmOjpLNSNeKwEnFozqqwQTbppjrGJHnpGlAQB7KBkVnFDIVRuWqUzS4CsgWkbeDNUIIPzoDGzQQU0
	ydPTdwuCj3xsbq7AEYQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkxP8-0008Tv-TR; Mon, 15 Jun 2020 22:16:34 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkxOx-0008G3-AR
 for linux-snps-arc@lists.infradead.org; Mon, 15 Jun 2020 22:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592259382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=slspSoLdiR900Rcpj54eQasJib7kVBgImwvKNWrvX4Y=;
 b=ccI1UbKJDDHboPDWSOhACaGgObUlHuYJLuWOUktshLLZr7ppdhd6a5/swbqP8HOoV22uc2
 LuwNvqsNfbHJjaEqgUiRiOLS6b/luDFBgvNQzPw9A0UtDCDLi0VEoM+yZ9EjCn1luXXQ28
 rw9q0p7QmdOGNzoHrZvAabBBhrmYXzo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-ThGN082DO7K8Xp-4NkIgcg-1; Mon, 15 Jun 2020 18:16:17 -0400
X-MC-Unique: ThGN082DO7K8Xp-4NkIgcg-1
Received: by mail-qt1-f197.google.com with SMTP id n8so15184534qtk.11
 for <linux-snps-arc@lists.infradead.org>; Mon, 15 Jun 2020 15:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=slspSoLdiR900Rcpj54eQasJib7kVBgImwvKNWrvX4Y=;
 b=K3q0a1B4Nf2MQGTg0ejj+pw1FTAiCh4I30oGqzsDx7AkS4650tbJz+J0DU58YZjfy1
 mV5Tu1ef6REDW26617d1UjDycijx+R/k80c49ZLgKDOPG4OOK51GmDNhrsYvUEQJkbUb
 5v6Q174G50Xvp1Ia8QTzE+P7A1EnRYp0WE3MCuFxvPmI3pVA16Np8CRIAbs0YohgAgXr
 byp11ZLSq95zG2ZFJO6guEFaLhRcxCArBKcZkFzyMcorOFEG8CNNo3TJ6OdF5giAnAVU
 FOqxBTzzlLxwu0npc+OM48gmB5Ur5ot4E2CVfcT3vGmgdDR8UJgU6NyV9IzimL543TJB
 7MUQ==
X-Gm-Message-State: AOAM532gLSsxYI+COC9FA+6GqveD7Hs5rkm2m7ZtBYGTbqbqo/mmBMmV
 cOIIpFTXj3t1gh+xT1cNrd5sB6ZmO0b3oI630oS6z3IkuvJHEgYTWQlkRG8pnwrTF3kc3cQqLiP
 gHRDwfEaKXZObhG4FCUncF9FH08433oF7
X-Received: by 2002:a37:a309:: with SMTP id m9mr15509581qke.284.1592259376816; 
 Mon, 15 Jun 2020 15:16:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+A/A772mmUrx3v5zJ9Ls6uRTYu52DgBbd6x8UepXb3ELKtULjF8DxCU4UWD4kQeUDJPTJ9w==
X-Received: by 2002:a37:a309:: with SMTP id m9mr15509556qke.284.1592259376517; 
 Mon, 15 Jun 2020 15:16:16 -0700 (PDT)
Received: from xz-x1.hitronhub.home ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id w13sm12351509qkb.91.2020.06.15.15.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 15:16:15 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 04/25] mm/arc: Use mm_fault_accounting()
Date: Mon, 15 Jun 2020 18:15:46 -0400
Message-Id: <20200615221607.7764-5-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615221607.7764-1-peterx@redhat.com>
References: <20200615221607.7764-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_151623_427875_247AC4C0 
X-CRM114-Status: GOOD (  11.58  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Andrea Arcangeli <aarcange@redhat.com>, Vineet Gupta <vgupta@synopsys.com>,
 peterx@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
 linux-snps-arc@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Use the new mm_fault_accounting() helper for page fault accounting.

The functional change here is that now we take the whole page fault as a major
fault as long as any of the retried page fault is a major fault.  Previously we
only considered the last fault.

CC: Vineet Gupta <vgupta@synopsys.com>
CC: linux-snps-arc@lists.infradead.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arc/mm/fault.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index 92b339c7adba..bc89d4b9c59d 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -72,6 +72,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	int sig, si_code = SEGV_MAPERR;
 	unsigned int write = 0, exec = 0, mask;
 	vm_fault_t fault = VM_FAULT_SIGSEGV;	/* handle_mm_fault() output */
+	vm_fault_t major = 0;
 	unsigned int flags;			/* handle_mm_fault() input */
 
 	/*
@@ -132,6 +133,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	}
 
 	fault = handle_mm_fault(vma, address, flags);
+	major |= fault & VM_FAULT_MAJOR;
 
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
@@ -156,20 +158,9 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	 * Major/minor page fault accounting
 	 * (in case of retry we only land here once)
 	 */
-	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
-
 	if (likely(!(fault & VM_FAULT_ERROR))) {
-		if (fault & VM_FAULT_MAJOR) {
-			tsk->maj_flt++;
-			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ, 1,
-				      regs, address);
-		} else {
-			tsk->min_flt++;
-			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN, 1,
-				      regs, address);
-		}
-
 		/* Normal return path: fault Handled Gracefully */
+		mm_fault_accounting(tsk, regs, address, major);
 		return;
 	}
 
-- 
2.26.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
