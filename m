Return-Path: <SRS0=19Kx=HZ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C316C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Feb 2021 02:38:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D649964E3F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Feb 2021 02:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D649964E3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZyODhnBPaeQq+/xTlYBKZv3Hk2GoZyzX1BACSaPI80c=; b=pbDgXbVJFN4DgsJd7L/nHkzfJB
	VF5Xhj1FMXVKn9cOKDqbjUV/yfAQqrx+SCglugFInxTanFjfA+JHOKOEUJ2xQlL702B4253VmF/6N
	k4Cxi7BG2kAJIb1ZV/XOSbDrfwim8hH8Ho7OqzGsAZ+p18GSO9461srTOWu2c/MJcVNBVCRj08UOj
	itIbPaP8fwHNhpwvNdG9nygqXHhZ0IBl4qCK0AlZ+MMq07HDI9nYNCoMYk1ghi7OUHAQRJ7PXTfSi
	5DKPyCJbI+5ZojbnSxLHeF8AS25ulM5/NGj4BEWGLw1CNicsbEkGRO/TxQ7ZDb/vwaNYHtt4+n7Ek
	n0eSdSnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lENaT-0006vJ-7E; Tue, 23 Feb 2021 02:38:09 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lENaQ-0006uk-Le
 for linux-snps-arc@lists.infradead.org; Tue, 23 Feb 2021 02:38:07 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 18FEEC03B7;
 Tue, 23 Feb 2021 02:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1614047883; bh=Ostn0o9i6JbRmoo7AR/nw1IMPFTAKZrzGqGUy10xPFQ=;
 h=From:To:Cc:Subject:Date:From;
 b=aOTCKmwyuBmG/he1HIWebvjm21w9QN/S2xvQqwzpYm7DGYqxUxZSAg/2Cg/oej0pP
 1SkKkhb16JREUBstr7TXvsOsH1Qf2jmRiYwM687pWR+CkCVNbUyuHjOd7wiqHYvoVE
 4e1OxOGZqraJBEjrUV9AOmNQrsVSFE7IJkwAyAPFZglvW8eyDO8vDIOPzeez6Bf64p
 R5iEOieUAskWMz9stcrwf6XQoa75w6m5dLHyGLrtByanWg+tX3b0UxWOESrAxUjRvc
 LOYAbCv5kcJn8oJzwXLToyCG/65XYuJ1MNNiRKef0a6Fidu0cntvMrMpl2e3VHxKaO
 cW1PEZ3XDF2/A==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 72201A006F;
 Tue, 23 Feb 2021 02:37:57 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: strace-devel@lists.strace.io
Subject: [PATCH] ARC: Enable automatic support for newer ARC ISA variants
 (ARCv3)
Date: Mon, 22 Feb 2021 18:37:54 -0800
Message-Id: <20210223023754.3123898-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_213806_930462_C0ACCE3C 
X-CRM114-Status: UNSURE (   8.83  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The syscall TRAP instruction used to be 4 bytes on legacy ARCompact
based ARC700 cores. Since then ARCv2 (circa 2014) and the upcoming ARCv3
use the same 2-byte TRAP_S instruction.

To ease porting of software to new ISA, special case ARC700.

This is the only change needed to get strace working on 64-bit ARCv3
cores (kudos to strace for making porting so easy)

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 src/linux/arc/raw_syscall.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/src/linux/arc/raw_syscall.h b/src/linux/arc/raw_syscall.h
index 6e60a6112b31..f54fe06f33df 100644
--- a/src/linux/arc/raw_syscall.h
+++ b/src/linux/arc/raw_syscall.h
@@ -21,10 +21,8 @@ raw_syscall_0(const kernel_ulong_t nr, kernel_ulong_t *err)
 
 # ifdef __A7__
 #  define ARC_TRAP_INSN "trap0"
-# elif defined __HS__
-#  define ARC_TRAP_INSN "trap_s 0 "
 # else
-#  error unrecognized arc
+#  define ARC_TRAP_INSN "trap_s 0 "
 # endif
 
 	__asm__ __volatile__(ARC_TRAP_INSN
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
