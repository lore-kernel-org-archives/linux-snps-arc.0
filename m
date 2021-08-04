Return-Path: <SRS0=yiNs=M3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CDEC43214
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1548261002
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1548261002
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHDwtMiD28HE3xBUKd50O4aOs+sdAgdeCnhvxSsRVZs=; b=Ze6MWHuy5S59Ob
	yiMgb2Ixg0cK9YcQex2xeaC4Y41F+4MI8/bCE1zXRyGPr/hDywU9e4KOoSg9HU945eF7IB/sM0JQR
	KWYcsGDwFFRtaBbBK8p367LUSJgQItFdT/sDbW7G0wAcmPLCb7EYY3OWvzStRG+mqzPQn2/rR1hI3
	tp4+G+31OM+26CdmL0NAKjVdNb5RY1XDv7WBA8js0Y4Hp3OrR3MH3r8YmCpwikn4lFfAfcZHLIx7q
	R1ZPtHcOS2pTl80YF2krOcZNtEzsSRsUILssPXc+w0hYxm3tR7L4ybFbuCnL9ihehjp+m3YYHFag9
	fWamP6bo8zxFV1K1ZESg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBMNB-007HXO-H8; Wed, 04 Aug 2021 19:16:13 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBMN7-007HRG-0h
 for linux-snps-arc@lists.infradead.org; Wed, 04 Aug 2021 19:16:11 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 80D99C0CDB;
 Wed,  4 Aug 2021 19:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1628104565; bh=OBVOhlFpb0ubl681yuxTSCalPDqOt+4DEullYEuvCBM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O1MyVDo9q04I9gOvz1Ddj9PEDHuZVyUgxx+ni1izear6AquuLnQNWT0ReF90V2znj
 zrUhLKZykQ5LpxmbtJDFmvaienRC7i/qR38g3ltNB0etdI4HI+YAhqt8IQflgjkmD1
 KipBITz9l1B6fj21Ltz83vt6qmbFGW1eWzE2Gn8RsLi5iftMtTVaDdQVBU8OUxkpet
 UJMD3OS7f+q4Qdy9BWbdbqVbjm1MD23LiMszSJ4RA7pjPYgrQM9tL8jGc3KOGvLMpZ
 58DPZzKrAzuEQ2KRVJqIrsygQ/uAf5CLPyg/ng9gUpD0tW7mBzkM7SrWE/AM/AddV1
 GZ1GHX/6zBfSw==
Received: from vineetg-Latitude-7400.internal.synopsys.com
 (snps-fugpbdpduq.internal.synopsys.com [10.202.17.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 15603A009F;
 Wed,  4 Aug 2021 19:16:05 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Vladimir Isaev <Vladimir.Isaev@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 04/11] ARC: atomic64: LLSC: elide unused atomic_{and, or, xor,
 andnot}_return
Date: Wed,  4 Aug 2021 12:15:47 -0700
Message-Id: <20210804191554.1252776-5-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804191554.1252776-1-vgupta@synopsys.com>
References: <20210804191554.1252776-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_121609_231767_67FB799B 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

This is a non-functional change since those wrappers are not
used in kernel sources at all.

Link: http://lists.infradead.org/pipermail/linux-snps-arc/2018-August/004246.html
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/include/asm/atomic64-arcv2.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arc/include/asm/atomic64-arcv2.h b/arch/arc/include/asm/atomic64-arcv2.h
index 53996b11b551..22ef1cbb94e2 100644
--- a/arch/arc/include/asm/atomic64-arcv2.h
+++ b/arch/arc/include/asm/atomic64-arcv2.h
@@ -116,6 +116,12 @@ static inline s64 arch_atomic64_fetch_##op(s64 a, atomic64_t *v)	\
 
 ATOMIC64_OPS(add, add.f, adc)
 ATOMIC64_OPS(sub, sub.f, sbc)
+
+#undef ATOMIC64_OPS
+#define ATOMIC64_OPS(op, op1, op2)					\
+	ATOMIC64_OP(op, op1, op2)					\
+	ATOMIC64_FETCH_OP(op, op1, op2)
+
 ATOMIC64_OPS(and, and, and)
 ATOMIC64_OPS(andnot, bic, bic)
 ATOMIC64_OPS(or, or, or)
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
