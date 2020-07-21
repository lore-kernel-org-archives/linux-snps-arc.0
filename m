Return-Path: <SRS0=YFEe=BA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E770C433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue, 21 Jul 2020 21:00:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F231B2068F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 21 Jul 2020 21:00:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XRZYU/a1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F231B2068F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8HAYQb/kT42xCk2Wqn0UcaJOZFXh+DI96007JdyPOis=; b=XRZYU/a1FxSHfyBqnT6LsoXV27
	WTdtjIKoeeNM/F+mvYUpfms+HPny5IcdE3HIgSbFVoG5N+pFqfMn4eyKOoo+13Md6Wo7fRSMbAvCW
	hIvxgGCjMGhIeZ9BCwMSZkB12GbKh0R4gTyrDR2R00McMVX/owj0KyvGGd7l848sSTAFy6GlOmhSp
	gzbyF7gc2ia21YmOeKfUMuBI36P4klpSb5Thu7LP2VccosJWsFG7DKqa0GTKkIukt0LkYwnIPJ5Xn
	uaZ6w+h8Spr+DJGyFBEdKHaglmtLDNsbWJArXRG6K5CYAG2mb+6Yq/lUGUKs8cXAaqLEc3qOASvGa
	dsP7SrsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxzMr-0000ZA-Ek; Tue, 21 Jul 2020 21:00:05 +0000
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxzMq-0000Y2-7G; Tue, 21 Jul 2020 21:00:04 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ARC: pgalloc.h: delete a duplicated word + other fixes
Date: Tue, 21 Jul 2020 13:59:58 -0700
Message-Id: <20200721205958.15229-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Vineet Gupta <vgupta@synopsys.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Drop the repeated word "to".
Change "Thay" to "That".
Add a closing right parenthesis.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
---
 arch/arc/include/asm/pgalloc.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200720.orig/arch/arc/include/asm/pgalloc.h
+++ linux-next-20200720/arch/arc/include/asm/pgalloc.h
@@ -18,10 +18,10 @@
  * vineetg: April 2010
  *  -Switched pgtable_t from being struct page * to unsigned long
  *      =Needed so that Page Table allocator (pte_alloc_one) is not forced to
- *       to deal with struct page. Thay way in future we can make it allocate
+ *       deal with struct page. That way in future we can make it allocate
  *       multiple PG Tbls in one Page Frame
  *      =sweet side effect is avoiding calls to ugly page_address( ) from the
- *       pg-tlb allocator sub-sys (pte_alloc_one, ptr_free, pmd_populate
+ *       pg-tlb allocator sub-sys (pte_alloc_one, ptr_free, pmd_populate)
  *
  *  Amit Bhor, Sameer Dhavale: Codito Technologies 2004
  */

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
