Return-Path: <SRS0=wYiN=D4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1256C4363A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Oct 2020 21:12:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 835CE21741
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Oct 2020 21:12:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lkuMeL7Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZSInftFp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 835CE21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3jxNJAaVqNkDUVpdPQw2BDVkjbj+s8VA2K2qsKYC0Vk=; b=lkuMeL7QeMY8Ui6a2eXhXHV+1+
	lCk6sxoNFd0sLrGqC1NTLWdXaaeFGNTVsV/eextNMiX9B2jkBr0x69ulT4WuQfovtF3s6oeRV+zNU
	iXpx6KneVXYLqoTGRHe8mYvnmcUUPRUgBED9UYVjQ8K41GbO/+w5oqfJBQu06b5dwbg2eUL4z2qJp
	V2KB19fXGmDYp9gqDvG1ROP/U4C5XsIKgEnmc5kw2sMSKLlP0vQ3cK+jsB3JtUaBtuOp5/i9kezko
	X1jCq76yRraBbSuQYAssuXK3Z+9A07rKwqTmHX6AGQ66ksuLidn+9wfxUFqQKH27MX0uS67bp+zYt
	MURxysrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVLPS-0007lX-HZ; Wed, 21 Oct 2020 21:12:38 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVLPQ-0007ku-7L
 for linux-snps-arc@lists.infradead.org; Wed, 21 Oct 2020 21:12:37 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ACA014017F;
 Wed, 21 Oct 2020 21:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1603314752; bh=d1zs99Yld9s2RHCZmSsagEGcX6j+DDeOamZ2x71qpRA=;
 h=From:To:Cc:Subject:Date:From;
 b=ZSInftFpwvUMRUx14/xl4CsFWgoK19XF47WJ2gpENTe3BXSluldHFCTqiiWTGqifc
 r9JEn/RcdaQFlyud9jEIhz3s9mwxHCoaG78fpi6cgJCBICdDP3HILm7rVeLFDJ18be
 i2QpHvQpz6nHoPp10EjBaTpFS5pA82yvi6L8DYZkH8AmbwuBwFb8LkPQSP5UXJRkkv
 YapIYIzqnclsEV2NlQQrq0RV3M0LKS148z9CXUYJI+La1E+aD1LlSovWJVDOh5a2Oy
 UTQbeB2y7cyVATYP0fRW8bRj7HyLLMmsDNUmJME6scwPA+CI2LeqsvX/Qx1ahGzO+i
 Q7BSLHyUn+1og==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id D44A8A01F0;
 Wed, 21 Oct 2020 21:12:28 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH] ARC: bitops: Remove unecessary operation and value
Date: Wed, 21 Oct 2020 23:12:20 +0200
Message-Id: <21124fbdd2ebfe150cc750f673a31e89d6fe5752.1603314740.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_171236_330826_A82A14E4 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The 1-bit shift rotation to the left on x variable located on
4   last if statement can be removed because the computed value is will
not be used afront.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 arch/arc/include/asm/bitops.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arc/include/asm/bitops.h b/arch/arc/include/asm/bitops.h
index 50eb3f6..8cddddc 100644
--- a/arch/arc/include/asm/bitops.h
+++ b/arch/arc/include/asm/bitops.h
@@ -297,10 +297,8 @@ static inline int constant_fls(unsigned int x)
 		x <<= 2;
 		r -= 2;
 	}
-	if (!(x & 0x80000000u)) {
-		x <<= 1;
+	if (!(x & 0x80000000u))
 		r -= 1;
-	}
 	return r;
 }
 
-- 
2.7.4


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
