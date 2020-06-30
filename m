Return-Path: <SRS0=1csx=AL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE0FC433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Jun 2020 20:45:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D6CA20772
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Jun 2020 20:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v3F6ZByy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a7geqw0d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D6CA20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CElDWZUqw6Dms31OWQOZK4C+cJ9R60br9zqm5T4yNzE=; b=v3F6ZByy/wI+uVQqZ9jxNE2Hnb
	A5xgaFnKI8Q+tilQ2ekutjdztmoXK/zu4Okc8zCTcvcpcUim1cQfH/WFqxYAwwwpwX0y8WjWixdJb
	Xir72Kw/ymufkRrGQytxubooFtopY2AM9zcr2nEYM+H9a7cgjFggrqEkQECqXGSWst+Hj2kE6IVK2
	L4rZ1xsjLh2VpcTjz1Q1tWkWydjcrJxt15FUrWjldm2+xWs1I9LwmcLK8Kg3UoX0/tL7j9fkXgB+y
	W8GTX08Jx/dcAChwW2QjSIFTZcNJQWqsU/zMVeQH5HqJPToNObmLlWutGFIdVWNJcMXcabIq9W8n/
	WVrCRsFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqN86-00045F-Mq; Tue, 30 Jun 2020 20:45:22 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqN83-00043j-Ay
 for linux-snps-arc@lists.infradead.org; Tue, 30 Jun 2020 20:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593549918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6LDTI5CbN1iafPepx0N8aCOkAEGCgmTd74bKKgxee6w=;
 b=a7geqw0dHzMACg0jAFhi7XlKB7op4pvxqDA9s/bs0bdKh1S+EaR3QTtRM+OaG/0qwy5QSM
 tVHW0JPP1r5SR6CgTN5tOwP6LjhkvSjPKnY/72CkL/IxiWP6yTwCUg7to+cZryEDfz9Aub
 w7BuhCYNvoatA9gz/I7t7XRDZQvul4E=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-CNzA2bGjNR-ZUaPQoNVU3A-1; Tue, 30 Jun 2020 16:45:13 -0400
X-MC-Unique: CNzA2bGjNR-ZUaPQoNVU3A-1
Received: by mail-qt1-f197.google.com with SMTP id e6so14328918qtb.19
 for <linux-snps-arc@lists.infradead.org>; Tue, 30 Jun 2020 13:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6LDTI5CbN1iafPepx0N8aCOkAEGCgmTd74bKKgxee6w=;
 b=lEx4Fq2IqxGAw7vXkjXyGdxoTg/+QdtzHJXUUNlpTjW2zh4CW1ChuFpMJK6vbs1jFf
 lIbR/kdLbuVAFWQuARXLaRinfAUD+MObJrtKIhPisDF+/VAYBtbL8nN9+rDPUnMxcsKA
 WqzoRlE/k2MT8g+hP91b1iLu/zlaZViQjk88piqMPzpbfQVX8UkendrrYBjgNmlbPJWK
 VtigfEaszSRnVpQ4tJAMrJ62dKSumHXixejbTcrpcHxbe660+ys/lJKJf7eybGuPJx63
 IRIOBor9jgo+0nrAY5HazvBBsdzmeqlPuABIx1LkWPv35kQdnWzr9JJNDedi+IwsAWa0
 BqxQ==
X-Gm-Message-State: AOAM53147KI3feOiMnEqUROixrEYmeXPVlly/JNacL0XtwcdHeF5IXsX
 YDS8753RW6UaQp5ASmeTywjRvbaBlTqYYgxL/Vg5tMAuBvfwFXt0PoVReCv4Vm87rRhnj1Hc/o8
 ER91L0fnHMkHd2omhPxxSMe5nE8NKuCuq
X-Received: by 2002:a05:620a:1035:: with SMTP id
 a21mr20501602qkk.321.1593549913127; 
 Tue, 30 Jun 2020 13:45:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+kaBc9/kmTr6BNHfQkL+ErMO1IOKMu40pdoPLe9ogbLzCBmnzOfYZlcKb4wfLKTS9uQhctA==
X-Received: by 2002:a05:620a:1035:: with SMTP id
 a21mr20501496qkk.321.1593549911595; 
 Tue, 30 Jun 2020 13:45:11 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id x26sm3658652qtr.4.2020.06.30.13.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 13:45:11 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/26] mm/arc: Use general page fault accounting
Date: Tue, 30 Jun 2020 16:45:09 -0400
Message-Id: <20200630204509.38615-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_164519_461138_24B8D18E 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Will Deacon <will@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, peterx@redhat.com,
 Vineet Gupta <vgupta@synopsys.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
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
index 1b178dc147fd..5601dec319b5 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -106,6 +106,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	if (write)
 		flags |= FAULT_FLAG_WRITE;
 
+	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 retry:
 	mmap_read_lock(mm);
 
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
