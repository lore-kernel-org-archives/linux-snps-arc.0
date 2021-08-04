Return-Path: <SRS0=yiNs=M3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5531FC19F3E
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 257A960F58
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 257A960F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=164QF46b94vpKfwERAzg7MkEkrwFhnKFdBks0sZObuU=; b=d8T+nkQLwk2hGN
	QpXpulep/xW6W9E3OEg+wKH5uUPyK4jbKy7sqLVu9s/tdPA/B4oAs59KcEVSxtFfZGznXaN//nTxI
	MxeHwlQg2pQEsPRcSXvy5oPb2sitySuozYTP9OGcqdklb4QK/qJbiw5EGJNJ6krX53NEvkDTk8vNa
	wv7N3WCE/EbzectNFpB0noKLW7ZAUglO87wnxVKDgMnxoHKrCShmQiOqeTB5zJRrHZeFAENOcoEQ4
	AGJZblEwxmez/0wA7yLzjLcyNNe+p0fYYHOd7nk3GM3T4DydkxeMEvS1iSWQE3Ve2sy8hsFiaVWbd
	UxzsQyBMNXSP2J61PMsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBMNH-007Hh7-K1; Wed, 04 Aug 2021 19:16:19 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBMND-007HRD-Tp
 for linux-snps-arc@lists.infradead.org; Wed, 04 Aug 2021 19:16:17 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3C9BDC0CDA;
 Wed,  4 Aug 2021 19:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1628104565; bh=dacA0IyBg8UWykD27vZX0Ft/c8RD5hhX4Qz9JOOUI+s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KX9ThU4YuWR0esgHnjRSDyuAar4isX3UBVt3TkRVy3KmIizWW39C72b6tvKKh8xtZ
 k2r+ksBhraA/EFw3PaDlzzDVDZY1GMSFdWvjvqGTAmnFCW+A9Gb75pLhim+zOqhToE
 nOuIPCBKwMAwSiyFJwrkAvc+EcdRCrpnqcGYbjMMPtf5VgSdbDEA6qJXq/3VT8JU8X
 eIdTxtG0A5YgAlTylaJPhhGZvzWKy6dCOcZKwJc+/LHdebwXSrL34aIAn40RmIIzRV
 rNj3pEty+sfGDnGJywhUFMMWkpU6wIFDe7U6Olty0J31bw3NiNDhVrFja+GPvNjs7L
 bfrpR3zUn5MiQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com
 (snps-fugpbdpduq.internal.synopsys.com [10.202.17.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id D0538A009C;
 Wed,  4 Aug 2021 19:16:04 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Vladimir Isaev <Vladimir.Isaev@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 03/11] ARC: atomic: !LLSC: use int data type consistently
Date: Wed,  4 Aug 2021 12:15:46 -0700
Message-Id: <20210804191554.1252776-4-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804191554.1252776-1-vgupta@synopsys.com>
References: <20210804191554.1252776-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_121616_030302_3E188C6D 
X-CRM114-Status: GOOD (  12.15  )
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

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/include/asm/atomic-spinlock.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/include/asm/atomic-spinlock.h b/arch/arc/include/asm/atomic-spinlock.h
index 8c6fd0e651e5..2c830347bfb4 100644
--- a/arch/arc/include/asm/atomic-spinlock.h
+++ b/arch/arc/include/asm/atomic-spinlock.h
@@ -42,7 +42,7 @@ static inline void arch_atomic_##op(int i, atomic_t *v)			\
 static inline int arch_atomic_##op##_return(int i, atomic_t *v)		\
 {									\
 	unsigned long flags;						\
-	unsigned long temp;						\
+	unsigned int temp;						\
 									\
 	/*								\
 	 * spin lock/unlock provides the needed smp_mb() before/after	\
@@ -60,7 +60,7 @@ static inline int arch_atomic_##op##_return(int i, atomic_t *v)		\
 static inline int arch_atomic_fetch_##op(int i, atomic_t *v)		\
 {									\
 	unsigned long flags;						\
-	unsigned long orig;						\
+	unsigned int orig;						\
 									\
 	/*								\
 	 * spin lock/unlock provides the needed smp_mb() before/after	\
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
