Return-Path: <SRS0=Wyqd=AS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF683C433E4
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 22:50:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F7B02075B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 22:50:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZYRKLOMz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="goe9ljKA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F7B02075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kh8Mw7UOIJx6NCkZW3kFIarks1uWwBpBqS1V6xTvqnU=; b=ZYRKLOMzq/AaSnmpv4Yu3O1Pc
	8hNC/ZdQYe6qfZNvSINL4tJyQWkwF5r4Djy4HhcVneum1991+C4QmyvwC1NrGTt1nuyIcKBFqd7/Z
	ulj/K7h/1SILjcDAf2rm9FoQM2GAo6zeEHEdU8v6nRt17lAtLJbLD9gYrnlONPJnoUdj7Rhzxcz0e
	ilgtLHDs/KNIa1Wz7EF+mXMlHwEKIXStWsxHQkQ6g+TSbS2qWvcBafmlHY7F2mbw2qNV4QhxLvwi8
	uAMbLssXBSVOQEqb1mvWTrAR/jGCxerymtZP4yR2MS7IUqpb58iUOUn3M6+U6SuSgoy/Axv8C9CWV
	53bxxOPjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jswQC-00066z-VQ; Tue, 07 Jul 2020 22:50:40 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jswQ5-00063i-KS
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jul 2020 22:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594162231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7D381D/H14FHe4T4c1JYQQxnwU06uKAee3rsUSJokIU=;
 b=goe9ljKAaVBX5Gyrh8c72NwgsNkWBq7TX8U7anj5xGtnju+0eNPB4DVoVe2ZRGeL+ljUWO
 SOf7pI/X8ZZWSQDWn3Mt1LO63WscbExp2dWu4scf5sUvLDrz9twucDzsTMg/hSW24i9toN
 61ETZyhknQtasRw5SZncfdB7JuMZcy0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-q42HQX1xOt2Ni9Gqw0t2Lg-1; Tue, 07 Jul 2020 18:50:30 -0400
X-MC-Unique: q42HQX1xOt2Ni9Gqw0t2Lg-1
Received: by mail-qv1-f71.google.com with SMTP id 59so28108568qvb.4
 for <linux-snps-arc@lists.infradead.org>; Tue, 07 Jul 2020 15:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7D381D/H14FHe4T4c1JYQQxnwU06uKAee3rsUSJokIU=;
 b=Rcin0vtfuBbvQi0U/OFU20SMvUPUadJsJPmPBVmkxQITmdcdNE3GL+Nq7wGPMhBKCE
 8fTB7Q+GPTiK80lXARy7jJQ7MtUelwac5LC18MwSC1ROKOjIo8GiK48LuIuy4G8ulg0e
 T4DB6/YO6KNuDlFX6LYUsZauU1ESNfULkkyXkbZl0HYDI3so6nIS+h8EtlIYq5ghvGTb
 GH7Z0SIjhCJSu8SlDXZSp+Mujwb+W4ca/V4syQtCoBhtD0hBn16PfC9Ly26W3dA/kkis
 vxgWOEszvQvZz2sjIk2sJjqsv3iYjkm+CYtYJwX/zqtGEBakocKqctt29f+Gf2kzdOT2
 EP4g==
X-Gm-Message-State: AOAM531KSua/m5K8wrkL+gFJ8n0e4rR14zAPLnaFCS9u42QZDlWNQMTR
 2XInQR7AzAmNdjWzcnPq5GbwZdDaMV0V191kleNQrJpYHGyxyYOF538sUHIdTPk1wih5mh1jniM
 y8M9hkFn51EdjRCfSL0UN3mBtMTC/084C
X-Received: by 2002:a37:957:: with SMTP id 84mr47901152qkj.392.1594162229536; 
 Tue, 07 Jul 2020 15:50:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8Qe2aOe1IpWrTkBCeJI7Q41I9z0vTh86xMOYiLo7vcyohVA6pGslr3yB/GvOVaXZ0OVm2lw==
X-Received: by 2002:a37:957:: with SMTP id 84mr47901134qkj.392.1594162229298; 
 Tue, 07 Jul 2020 15:50:29 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id j16sm26267642qtp.92.2020.07.07.15.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 15:50:28 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v5 03/25] mm/arc: Use general page fault accounting
Date: Tue,  7 Jul 2020 18:49:59 -0400
Message-Id: <20200707225021.200906-4-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707225021.200906-1-peterx@redhat.com>
References: <20200707225021.200906-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_185033_751229_89393B07 
X-CRM114-Status: UNSURE (   9.60  )
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, peterx@redhat.com,
 Vineet Gupta <vgupta@synopsys.com>, Michael Ellerman <mpe@ellerman.id.au>,
 David Rientjes <rientjes@google.com>,
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
index 587dea524e6b..f5657cb68e4f 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -105,6 +105,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	if (write)
 		flags |= FAULT_FLAG_WRITE;
 
+	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 retry:
 	mmap_read_lock(mm);
 
@@ -130,7 +131,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 		goto bad_area;
 	}
 
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
@@ -155,22 +156,9 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
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
