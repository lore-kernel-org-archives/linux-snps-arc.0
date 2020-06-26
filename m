Return-Path: <SRS0=9Koe=AH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90C8C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Jun 2020 22:33:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A416120885
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Jun 2020 22:33:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yVvcusJb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QLZTuO+L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A416120885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v/cXLN3KYE4Mu4q2smiwgsWwlB11j6Xl+whOomZgFIs=; b=yVvcusJbEQiULaPp36+hNWdPY
	lUfy7gDUrMVJHcY8WgY8cZs6fWjibPeA+6RxtYgZYh0aHTS8GHcYDOlIE4Q2RPifBto48+Jtot3W6
	h0s2II9MQK3e5/HR1+7ZEt+pJKGHVIPySdYRaLL28rOcj4APdUG9WXIMbnFJJ00sEO2vS8QBv8gXr
	z4ZARdUC3prqh4nTOfAjnSkzTGG3laUqa4B9h9agVqincEN6hpxFHyfH3/pwZreYO3zc9s6uQ7HM9
	vxvRJqpuPrND0Pj+W5wthBUsdZga8XF/Iql9LIlRvnqugq/x7gex6JNiJwVozlT7zWH5a40CPiMZc
	g9bqVcMYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jowuP-0002R8-Qw; Fri, 26 Jun 2020 22:33:22 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jowuL-0002Qi-MH
 for linux-snps-arc@lists.infradead.org; Fri, 26 Jun 2020 22:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593210796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZrEBS+6D6tr7sKM8RKvuVARuC8ujPdG5Fi1hrXsWHAc=;
 b=QLZTuO+L5/dD7cLS4ponjmJHpgboQfvevuZ/8VbTYc0dTp12RVI9L3HP/4l0jvvQZMIlMM
 th07IzFR+B9lZK90C+JlAanFB1R5LkEwy21hMBYlw114kyvpngodFN+jawgfV7cxJhhBx6
 qEs+ETZeiyXBg8x74uhzrlueG7cT2UE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-__P0t4BAPLehSCUeOoPI3A-1; Fri, 26 Jun 2020 18:31:37 -0400
X-MC-Unique: __P0t4BAPLehSCUeOoPI3A-1
Received: by mail-qv1-f69.google.com with SMTP id 59so7383889qvb.4
 for <linux-snps-arc@lists.infradead.org>; Fri, 26 Jun 2020 15:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZrEBS+6D6tr7sKM8RKvuVARuC8ujPdG5Fi1hrXsWHAc=;
 b=Qx2X8wKyPC8Zrtqp+F/rKmGThmmWeXSZApehXn+8cLaFaSeWEc05Ln/uhDugo0zhkW
 S+zCFHd25EVTwX1PfVZjaKOHr7FtC6Si6Gsu6cddwaYUKAYix5sXWjva5KVUpBEf0VaF
 Ju1vb1Vh9qsgZUb101Hih2vvJq8Wn2yvLClOql11Kq28lxkYmUo44l9j9Px6/XpsaiAI
 KTs/OeUnv0vGDzwezgCU5wMgLnvi9JKwpQQLBS9c1rFMDr6tXqnGJKpppCIoYq1goJri
 Cd6fcRIj8EUhJ3XmlKkFy59uFnlaMaZuBYhIcVpQ0pQn8bwNUVC5HPTfCJ2DFDYvNDaR
 gn6g==
X-Gm-Message-State: AOAM532OwZHHoU0h0x3h4ckN80agbMs3gW49jl1M6e2WlCnJcGrpscxP
 kMM5e+hvV4uMiZQMV2Bh6dFTRWIwW7FSyR49mbHZqPnqODCw6dzHihzvZb9hTz4Cxeub3uMdBnM
 BoS9RDO5bQE/+Ecqk2qXT+n5rUDXugBZd
X-Received: by 2002:ac8:3438:: with SMTP id u53mr5257912qtb.102.1593210697048; 
 Fri, 26 Jun 2020 15:31:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyypwZl81DCOa9IcPJnHElr7C3d8MHgy+sT0obHjubCfmpU7Euqfw3mBtLPdpkmWRiHkTsPYg==
X-Received: by 2002:ac8:3438:: with SMTP id u53mr5257884qtb.102.1593210696782; 
 Fri, 26 Jun 2020 15:31:36 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id f203sm9903311qke.135.2020.06.26.15.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 15:31:36 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/26] mm/arc: Use general page fault accounting
Date: Fri, 26 Jun 2020 18:31:07 -0400
Message-Id: <20200626223130.199227-4-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200626223130.199227-1-peterx@redhat.com>
References: <20200626223130.199227-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, peterx@redhat.com,
 Vineet Gupta <vgupta@synopsys.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 Will Deacon <will@kernel.org>, Gerald Schaefer <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Use the general page fault accounting by passing regs into handle_mm_fault().
It naturally solve the issue of multiple page fault accounting when page fault
retry happened.

Fix PERF_COUNT_SW_PAGE_FAULTS perf event manually for page fault retries, by
moving it before taking mmap_sem.

CC: Vineet Gupta <vgupta@synopsys.com>
CC: linux-snps-arc@lists.infradead.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arc/mm/fault.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index 34380139e7a2..68e6849cf086 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -106,6 +106,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	if (write)
 		flags |= FAULT_FLAG_WRITE;
 
+	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 retry:
 	down_read(&mm->mmap_sem);
 
@@ -131,7 +132,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 		goto bad_area;
 	}
 
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
@@ -156,22 +157,9 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	 * Major/minor page fault accounting
 	 * (in case of retry we only land here once)
 	 */
-	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
-
-	if (likely(!(fault & VM_FAULT_ERROR))) {
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
+	if (likely(!(fault & VM_FAULT_ERROR)))
 		/* Normal return path: fault Handled Gracefully */
 		return;
-	}
 
 	if (!user_mode(regs))
 		goto no_context;
-- 
2.26.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
