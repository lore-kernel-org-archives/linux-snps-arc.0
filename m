Return-Path: <SRS0=oPyE=PS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367C3C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 Oct 2021 00:31:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADB2761075
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 Oct 2021 00:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADB2761075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=joJakRd8BTT4Xk2fRYdVN+l1g4R3uMVZQ71CPTRzwU8=; b=JpAgMpUcw5e8ic
	DI9+gLcd9YEhPVuzOFDRxS24aZX1ISVyfQrZ45bl8voszJ+V4i/eAgm5ZCAMSarfEzZL8/c6wehKd
	klqXmxYgXE3OOn8iNFjSBMSFX3U2IT0L/GxSNR8YwJWdwtM0sPs4gae0cEfQ0cIYYNfweOpmsW65c
	40eWCUXmSUhFRYzDHKpsHSGsunNCa4Gzdu7KbRAvX512PrHdAVjqhm5I4/FXyapaqkUf/h00Ir4E+
	t1jMF1hrfYlGEtKu9xS5LCtY8OsUF7wJXPxYCvYbTV6h0UpTY+oBmrUb7HLPDwyUOrknUm5zrHPHI
	Vj7s3Llvv57qKMUTf9sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgcHY-00Ca0x-6g; Sat, 30 Oct 2021 00:31:36 +0000
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgcHX-00Ca0f-4y; Sat, 30 Oct 2021 00:31:35 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Matthew Wilcox <willy@infradead.org>,
 Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Subject: [PATCH] ARC: thread_info.h: correct two typos in a comment
Date: Fri, 29 Oct 2021 17:31:34 -0700
Message-Id: <20211030003134.20553-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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

Fix typos of "separately" and "remains".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Matthew Wilcox <willy@infradead.org> # "remains"
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
---
 arch/arc/include/asm/thread_info.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20211029.orig/arch/arc/include/asm/thread_info.h
+++ linux-next-20211029/arch/arc/include/asm/thread_info.h
@@ -99,8 +99,8 @@ static inline __attribute_const__ struct
 
 /*
  * _TIF_ALLWORK_MASK includes SYSCALL_TRACE, but we don't need it.
- * SYSCALL_TRACE is anyway seperately/unconditionally tested right after a
- * syscall, so all that reamins to be tested is _TIF_WORK_MASK
+ * SYSCALL_TRACE is anyway separately/unconditionally tested right after a
+ * syscall, so all that remains to be tested is _TIF_WORK_MASK
  */
 
 #endif /* _ASM_THREAD_INFO_H */

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
