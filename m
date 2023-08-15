Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52D7C04FE2
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drhYS4UKGUaK32sgFWTZTYRB9LklmsLm7gEp2va6X8o=; b=Srd4nPXbKeXSs9
	3G5wPGZKtnwhlmQfDnmgWfKj6I2RNgTrwr9fLhoDSCg67+15DYz+VJm7rXUroMDcnKB2eGMVfNSh8
	8b5/EhdbGl+cyTErTFNZHSzyuzM1rYo9E+AE5yPXpPkSBsclH0AWEY9QR3HB02BP4tyJQT0RzGJnD
	wZWtNW4RQCO58Fju13fZWtz/DKqzKJNc2Q029wGOVlEMk9YaStfaZCDqMGeg/QWSIALA+FO+3i9kf
	/kuOCUtwOF6r4Ohm8gE3F8BqzL5zdSS+FGFA4uvrAi8+zFeD2yzX9w2yksXopfO/rBW+YHGhc2QYI
	ZzpL5LKeggGKc2t2kiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViET-000cZc-2N;
	Tue, 15 Aug 2023 00:48:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEP-000cUS-1g
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:48:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 35831647C1;
	Tue, 15 Aug 2023 00:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D2AC433CA;
	Tue, 15 Aug 2023 00:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060500;
	bh=zkG7tKNl0pma2wQFLKTamwokqNgfsNplt2WvHHW0PGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kO8RZEOgp4rtCJQvp9wDXzhuhF7W3vI/goCzoA04uvMkG+BW64KEvcpWXKMlnfY72
	 jkhHSjgPy9uYEOCcFrDtkCbCn2Z6aSS0ghRRTfSrPAGN4GF0ilZ5K+kUmmJR5+etfZ
	 Ius1ROSzMsZwSVd3AZVpmi+7vQl3Ejjtb7z3B/vgP3/t+UVWcMd7E1y1sB1Cd/UlNZ
	 UQaeO7GTK9aqkt32A5/Xei8MX0D5AK0LJkypV+gUXCwv74P+opA8zGqmt3fID7t/xf
	 yWVUgdv2UjxM03uEtOaS3JcAfIj40GKCirBj6lIOv7AYRYJeXz2dAhC1LeKXQ/ZmH3
	 YI4mQFHuPInIQ==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 04/20] ARCv2: memset: don't prefetch for len == 0 which happens a alot
Date: Mon, 14 Aug 2023 17:47:57 -0700
Message-Id: <20230815004813.555115-5-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815004813.555115-1-vgupta@kernel.org>
References: <20230815004813.555115-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174821_601285_D694C79D 
X-CRM114-Status: UNSURE (   9.00  )
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

This avoids potential "bleeding" when size == 0 as cache line would be
dirtied (and possibly fetched from other cores) and due to the same
reaons more optimal too.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/lib/memset-archs.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arc/lib/memset-archs.S b/arch/arc/lib/memset-archs.S
index d2e09fece5bc..d0a5cec4cdca 100644
--- a/arch/arc/lib/memset-archs.S
+++ b/arch/arc/lib/memset-archs.S
@@ -36,12 +36,13 @@
 #endif
 
 ENTRY_CFI(memset)
-	PREFETCHW_INSTR	r0, 0	; Prefetch the first write location
 	mov.f	0, r2
 ;;; if size is zero
 	jz.d	[blink]
 	mov	r3, r0		; don't clobber ret val
 
+	PREFETCHW_INSTR	r0, 0	; Prefetch the first write location
+
 ;;; if length < 8
 	brls.d.nt	r2, 8, .Lsmallchunk
 	mov.f	lp_count,r2
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
