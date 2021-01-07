Return-Path: <SRS0=Lg4d=GK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BE0C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 00:12:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1F6E23339
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 00:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1F6E23339
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ruXKPk8NMi/+QfJMotVcGBuM1yA6mVUwxaEMEowdquE=; b=a8Nx0+sqUf0yhM/apAADOdvUIQ
	nf/elbasn3++2d38MFN27vJtrj5fY3lcIAsAmWnOhk9mIE+s/uWSX6+PkoX5ba6eYmNdw6YPx9esN
	9PAfYUL8z00KqwRr5UlF+xqUyYHWo5ej+WatXDrUdS/lNdoxyt56U68YOViVzWDpE7v+LfzE16BUt
	sgqTzRbEzPGOcmhaFtyBnA2RUhBYbxQDqc1vlQ5UmubcrOEgVJdwcEuYwXZlSO3kpbiiITFxDfWnG
	ahoELN+2MlK3GIhfEvG+gjSwbGrhskNA5rtZz5Wno8i0m8h+JRFIUpMy2HnCvwltDVQgPS8M0Yec7
	pnbySiGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxIus-0008K2-2Z; Thu, 07 Jan 2021 00:12:38 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxIup-0008JK-PM
 for linux-snps-arc@lists.infradead.org; Thu, 07 Jan 2021 00:12:37 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4F751C009A;
 Thu,  7 Jan 2021 00:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1609978352; bh=VEDI60u1cbWLwMz2J6HNd2ehfUiLmU2NYKL62iOlY48=;
 h=From:To:Cc:Subject:Date:From;
 b=IC/mVtE0bhrhHnF1QyG21ZD/UNOYLvTO+K5zWmIA/pY/YRkH1cbCDx4QiiKD5h7Xq
 JkKix3yDM11I2UkDNlQ/miPvCzAzT9vE8Ncvodt1FGcxJwg/OSNgECf+c9VbuTdDZj
 IHIL3gaqQYzuJyAfsqkHwowMbf8veSA56h34zQmTgXZG1Af0set1D3L+vcqQOZ+XIa
 ceCkyIu+7HKaK/pvmqy/CkXhNfj0JYGhkXgLNl+/eY98hASPYfgIDU69/Iy5Oomwzh
 d7ddizmfV4IfupKD9E4cBjPtpJHQaBkDA+PXiV9rzpJcWE549xunbh8bAJn52Dw0me
 OT59WX0HC8dQg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id E9579A009C;
 Thu,  7 Jan 2021 00:12:27 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Subject: [PATCH] ARC: unbork 5.11 bootup: fix snafu in _TIF_NOTIFY_SIGNAL
 handling
Date: Wed,  6 Jan 2021 16:12:25 -0800
Message-Id: <20210107001225.3063163-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_191236_030429_36FE473C 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Linux 5.11.rcX was failing to boot on ARC HSDK board. Turns out we have
a couple of issues, this being the first one, and I'm to blame as I
didn't pay attention during review.

TIF_NOTIFY_SIGNAL support requires checking multiple TIF_* bits in
kernel return code path. Old code only needed to check a single bit so
BBIT0 <TIF_SIGPENDING> worked. New code needs to check multiple bits so
AND <bit-mask> instruction. So needs to use bit mask variant _TIF_SIGPENDING

Cc: Jens Axboe <axboe@kernel.dk>
Fixes: 53855e12588743ea128 ("arc: add support for TIF_NOTIFY_SIGNAL")
Link: https://github.com/foss-for-synopsys-dwc-arc-processors/linux/issues/34
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index 1f5308abf36d..1743506081da 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -307,7 +307,7 @@ resume_user_mode_begin:
 	mov r0, sp	; pt_regs for arg to do_signal()/do_notify_resume()
 
 	GET_CURR_THR_INFO_FLAGS   r9
-	and.f  0,  r9, TIF_SIGPENDING|TIF_NOTIFY_SIGNAL
+	and.f  0,  r9, _TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL
 	bz .Lchk_notify_resume
 
 	; Normal Trap/IRQ entry only saves Scratch (caller-saved) regs
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
