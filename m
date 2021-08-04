Return-Path: <SRS0=yiNs=M3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCF8C19F34
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC17060F94
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC17060F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y73QbaYqOl4I5yHbB2o8KvdLXXp9t08SVOQjTWfLCyk=; b=hA00JkqUggMRe2
	e3aBRu+TgTVnMv6Nv+N3+UoF6b0ri6vgxaHfEWo0q/I+Ekboyni2QqfkuUTspr7tZ9ekhJG3edxL5
	V9MqN7XCYkZllNZiHauHpVlhUmhPV1TMazOLz5otk2aD2rEQbH8hDHPNMjulThD00TnE6WMLFilgC
	B+zQ7AjZMYVqfo9eNvUI3l0OCiF2J0DHQga1n+CSli76c4osiCd7SBsGoAc3Ydb9yCNU/Yh2IkXDm
	pAG1R/7zQwzVIxkDng3QZk+/7YyIW+P211S7KxwZTBFL0oPXojNHNyQiHaErSi63AYAMIzCcineWT
	mF/dWUzgzZYmiZgaG9xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBMNK-007Hix-9B; Wed, 04 Aug 2021 19:16:22 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBMND-007HSs-Ux
 for linux-snps-arc@lists.infradead.org; Wed, 04 Aug 2021 19:16:18 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 07BA940DB9;
 Wed,  4 Aug 2021 19:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1628104567; bh=jWJMgYot8ioyaXe2+NdNR9EqQrXjSWR6QdetbVU+E2g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ap9uR9CKAUC4E+TOAIdABbceBx7F2yyLajbac4DWSdOQo2qtnU3nr7IcCT52roO1F
 blNSY1Pj5xdMx3Gv7Jdco/HCt8HH1dlLLyBdeone7J5g3wQXoG4dXVlZsPSRbD8uu2
 MFaFm79kMKlIz6/OAyM2HhkScaxGdee9rq+v2Vgw0GpA9O7n8PUucdkQJsQI05z5Ne
 V3B5VWRqqPuQaoTLn98CC6tjEkosbNdWmH+2TEal64xRZ1kOkb/efhuQwz37PLFc+q
 esccLOixOvW+xKSsEzs2WBNLUK+XejkNghXxC/bci3tKtfffvZvZNI+HxwzpspQmOU
 PQtTCT/wjh9fg==
Received: from vineetg-Latitude-7400.internal.synopsys.com
 (snps-fugpbdpduq.internal.synopsys.com [10.202.17.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id B20B6A009B;
 Wed,  4 Aug 2021 19:16:06 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Vladimir Isaev <Vladimir.Isaev@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 10/11] ARC: cmpxchg/xchg: implement relaxed variants (LLSC
 config only)
Date: Wed,  4 Aug 2021 12:15:53 -0700
Message-Id: <20210804191554.1252776-11-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804191554.1252776-1-vgupta@synopsys.com>
References: <20210804191554.1252776-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_121616_061702_D701BABA 
X-CRM114-Status: GOOD (  10.99  )
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

It only makes sense to do this for the LLSC config

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/include/asm/cmpxchg.h | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 00deb076d6f6..e2ae0eb1ca07 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -38,7 +38,7 @@
 	_prev;								\
 })
 
-#define arch_cmpxchg(ptr, old, new)				        \
+#define arch_cmpxchg_relaxed(ptr, old, new)				\
 ({									\
 	__typeof__(ptr) _p_ = (ptr);					\
 	__typeof__(*(ptr)) _o_ = (old);					\
@@ -47,12 +47,7 @@
 									\
 	switch(sizeof((_p_))) {						\
 	case 4:								\
-	        /*							\
-		 * Explicit full memory barrier needed before/after	\
-	         */							\
-		smp_mb();						\
 		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
-		smp_mb();						\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -108,16 +103,14 @@
 	_val_;		/* get old value */				\
 })
 
-#define arch_xchg(ptr, val)						\
+#define arch_xchg_relaxed(ptr, val)					\
 ({									\
 	__typeof__(ptr) _p_ = (ptr);					\
 	__typeof__(*(ptr)) _val_ = (val);				\
 									\
 	switch(sizeof(*(_p_))) {					\
 	case 4:								\
-		smp_mb();						\
 		_val_ = __xchg(_p_, _val_);				\
-	        smp_mb();						\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
