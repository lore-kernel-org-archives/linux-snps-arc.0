Return-Path: <SRS0=8sqX=2R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AECC2D0DA
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Dec 2019 18:04:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 018E02176D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Dec 2019 18:04:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TgAZ4wNh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HZ2Qtek6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 018E02176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8oAI91rDz7D/tYBubsZQRDzaAk8VnHKTcCjWXPD294=; b=TgAZ4wNhPdx4qR
	tUOA/F63fmhC3reX4K6uud0Pczzp1ufGM+5mibIyjgFUqgIs5ZDCjKtyRVguVAzYp/cBjtW00Y4O1
	nVIqpsDIxlOnrKh1H5ug6Kjy5vm/GZop9rwv1UtRilixu3Qs5Vrz6pkpn2GvH+kPzUQZSPh42bnM7
	bt6Q0PPYflyVstZNi0E7tw2G2Yd1VyRs4oIh7OO07st1ViS175XVchEgfQSDYTN2k6zuhLei3mF2O
	QmzVMFNPlGngEWElUGLkW5VGNlXu/lLYbV0cDZHhKr3d1BYlO7XXjS63PDi2s1LdpmTTZPvOXhsX1
	ihgpkxacb7FYwAMpHGig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iktxz-0005Xk-5y; Fri, 27 Dec 2019 18:04:03 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iktxw-0005V7-Ed
 for linux-snps-arc@lists.infradead.org; Fri, 27 Dec 2019 18:04:01 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B2A53C09A7;
 Fri, 27 Dec 2019 18:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1577469838; bh=FA6LUY6CHkOmJ9QzyFH4ZmwtZXrc9eBJr1JMrs9R+1I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HZ2Qtek6HXlinyXMlGK64VmnZsxa+H5F/Nkxp0ScwPvSMthuo1z/8s64wHiM8c7u6
 3c0pO2gyGlZbHW5yfbpBEDyoD+36aQz01u71xQAmJoY5XboOqxmfQ9v4348YgUF0rm
 y+7AFgL6vFiF+vJaTDDE1lQXhLrlE6VHrBtJgUMDSaYRSRcDvTGg0HZjBcIf0v+H+2
 TlW0fc+G1k83jztbi4z5ali9MA8yK9JhgORt/kFYC/CxKCyTdLVJZx2WWj+EIDxN3Z
 sSnmxfdhQ8WEnn7+zY2nZeybPXgSIjMEB4Yc07WTVPfc35NMYM2ThGJtqubWOyRiJU
 ByopaDgHEkjhQ==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.121.8.65])
 by mailhost.synopsys.com (Postfix) with ESMTP id DEE08A0063;
 Fri, 27 Dec 2019 18:03:55 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 1/5] ARC: pt_regs: remove hardcoded registers offset
Date: Fri, 27 Dec 2019 21:03:43 +0300
Message-Id: <20191227180347.3579-2-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227180347.3579-1-Eugeniy.Paltsev@synopsys.com>
References: <20191227180347.3579-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_100400_518759_5F8F5377 
X-CRM114-Status: UNSURE (   7.74  )
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Replace hardcoded registers offset numbers by calculated via
offsetof.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/include/asm/entry-arcv2.h | 8 ++++----
 arch/arc/kernel/asm-offsets.c      | 9 +++++++++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arc/include/asm/entry-arcv2.h b/arch/arc/include/asm/entry-arcv2.h
index 41b16f21beec..0b8b63d0bec1 100644
--- a/arch/arc/include/asm/entry-arcv2.h
+++ b/arch/arc/include/asm/entry-arcv2.h
@@ -162,7 +162,7 @@
 #endif
 
 #ifdef CONFIG_ARC_HAS_ACCL_REGS
-	ST2	r58, r59, PT_sp + 12
+	ST2	r58, r59, PT_r58
 #endif
 
 .endm
@@ -172,8 +172,8 @@
 
 	LD2	gp, fp, PT_r26		; gp (r26), fp (r27)
 
-	ld	r12, [sp, PT_sp + 4]
-	ld	r30, [sp, PT_sp + 8]
+	ld	r12, [sp, PT_r12]
+	ld	r30, [sp, PT_r30]
 
 	; Restore SP (into AUX_USER_SP) only if returning to U mode
 	;  - for K mode, it will be implicitly restored as stack is unwound
@@ -190,7 +190,7 @@
 #endif
 
 #ifdef CONFIG_ARC_HAS_ACCL_REGS
-	LD2	r58, r59, PT_sp + 12
+	LD2	r58, r59, PT_r58
 #endif
 .endm
 
diff --git a/arch/arc/kernel/asm-offsets.c b/arch/arc/kernel/asm-offsets.c
index 631ebb5d3458..c783bcd35eb8 100644
--- a/arch/arc/kernel/asm-offsets.c
+++ b/arch/arc/kernel/asm-offsets.c
@@ -67,5 +67,14 @@ int main(void)
 	DEFINE(SZ_CALLEE_REGS, sizeof(struct callee_regs));
 	DEFINE(SZ_PT_REGS, sizeof(struct pt_regs));
 
+#ifdef CONFIG_ISA_ARCV2
+	OFFSET(PT_r12, pt_regs, r12);
+	OFFSET(PT_r30, pt_regs, r30);
+#endif
+#ifdef CONFIG_ARC_HAS_ACCL_REGS
+	OFFSET(PT_r58, pt_regs, r58);
+	OFFSET(PT_r59, pt_regs, r59);
+#endif
+
 	return 0;
 }
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
