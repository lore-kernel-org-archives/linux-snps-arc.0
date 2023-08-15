Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D430C04A6A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5HEmt+OE5LPU5GDGeYmwVlQ1hcoiXLlH3dm1KRebiQ=; b=uj+UVI/MWIRoci
	p9bE/O71D+FoYzCejeeuHUX3DheqCuYVCBw6wrLIc+gaXsNl8kSLYpRh1KpkKr0g4vlIbOz+xBhzp
	1TQGwOd6BHDfGL8ejJ4r9mI2QyOwDg0nS2xX2/wJ7UyFIpy5ygY4g/jR/KNoM8KeffWAOb04AdH1F
	tMFV+Uzn8LthieIaioxYr0fUjujUHhNb0faISphdmF0582txNmx0YFtQseH4VqqQAaN72B6cqQJZC
	VOfFgFykkTf1V78W2vm684nbeyY2LnznRdPcFhbEDWLSnJntg4xOtnoJGIFagiLg8YgYGqcnuD37N
	CAk7vo6MkhLPNvtuUTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEa-000cgY-2C;
	Tue, 15 Aug 2023 00:48:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViET-000cUb-2y
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:48:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B777164C60;
	Tue, 15 Aug 2023 00:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B40AC433CD;
	Tue, 15 Aug 2023 00:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060505;
	bh=UNDMqVBFCNk6b1A03SE3areXfHWhTB+t/pNxpu/gslg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t1jppoqe4US9n9CGmBpjEdhEDn/TAzPypdmyx2qsmvGkC4Fsrvz1YK8nGKZPZIPtL
	 KaP1p3emDMTLGqHKVl6INVBT4/rGCeH5Zmjt9w9mZnqk9FUuHIDk2zYUGhHporY5nB
	 vBfmVQVHSkPQRKtiA/fLKb3DcQUBnPttO7yR75Td8mKu/SG1Dc/eC9R5C0G5Zb3BCo
	 u8NweEctbBX9ulBOo/exaaNWIB/RgaMrXjp8jIPq4AZPBmcGhYfvX0Mrsou7LcO9AS
	 3W4xyDlz2wvr3Y2oQ2brfWCjaEGyWfueA+q1tY/zNdLDWIo2W050oXOEV0rF+57Hy3
	 Txbdvr4ocgh0A==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 17/20] ARC: entry: replace 8 byte OR with 4 byte BSET
Date: Mon, 14 Aug 2023 17:48:10 -0700
Message-Id: <20230815004813.555115-18-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815004813.555115-1-vgupta@kernel.org>
References: <20230815004813.555115-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174826_024913_01CEFDF7 
X-CRM114-Status: GOOD (  10.24  )
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

FAKE_RET_FROM_EXCEPTION drops down to pure kernel mode. It currently has
an 8 byte instruction which can be replaced with 4 byte BSET

This is applicable to both ARCv2 and ARCv3 entr code.

ARCv2 current
------------
00000804 <EV_Trap>:
...
 874:   216a 1280               lr      r9,[status32]
 878:   2146 1809               bic     r9,r9,0x20
 87c:   2105 1f89 8000 0000     or      r9,r9,0x80000000
                  ^^^^^^^^^
 884:   2029 8240               kflag   r9

ARCv2 after
----------
000007e0 <EV_Trap>:
...
 850:   216a 1280               lr      r9,[status32]
 854:   2150 1149               bclr    r9,r9,0x5
 858:   214f 17c9               bset    r9,r9,0x1f
 85c:   2029 8240               kflag   r9

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/entry-arcv2.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/include/asm/entry-arcv2.h b/arch/arc/include/asm/entry-arcv2.h
index 11b48ab39154..f7c9b3915d10 100644
--- a/arch/arc/include/asm/entry-arcv2.h
+++ b/arch/arc/include/asm/entry-arcv2.h
@@ -274,8 +274,8 @@
 
 .macro FAKE_RET_FROM_EXCPN
 	lr      r9, [status32]
-	bic     r9, r9, STATUS_AE_MASK
-	or      r9, r9, STATUS_IE_MASK
+	bclr    r9, r9, STATUS_AE_BIT
+	bset    r9, r9, STATUS_IE_BIT
 	kflag   r9
 .endm
 
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
