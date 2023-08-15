Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5D9C04E69
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTy0EMB9w+bepTwi5AS1svTBzD4AZ/30MLmoxO2WHFs=; b=hHgIESBgaNOT1U
	TefQwT3luQJ1E8OjKohtQno8zL+huzWGFdLVlttbpZejyiqCBbPK07PnNthWGpJMEnUo72rTQ4eTq
	SGgJpqtWvLRmJH5F144fps+kxhZKTIPtv0iF3POnJcMakdZwUlCqqeFahHlmqea7XvHoFTkAdyHs7
	domdLoz6fgicxjb0ly4ieCS6EBxa52lNv4/q6xBNZ8erT5VJCwelcoGRo/7kDKjHtyvuuy3t6IbmB
	a1WFhf0jcug0+FgcwP+HHjFrzF+AFI5dTuJB9U1pJB2fmqMj+C0p2gwqgIh/nOUomeTF5pnM0IoXv
	3pbFYf03W2hq0lPNElWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViER-000cXD-33;
	Tue, 15 Aug 2023 00:48:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEO-000cTw-22
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:48:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3184164053;
	Tue, 15 Aug 2023 00:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E27CC433CC;
	Tue, 15 Aug 2023 00:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060499;
	bh=u1nWpIWuw7k0zAnF/NQi2BJwAjoLPN0MnaMyy2rE3OY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m+4vGTbgbE+G2m55otkANO02MVzGEQh6P3wkbDIeKAc61Ge4ipns3aCly/jAe4662
	 /x/bB18nxReFR6fch5pOQItf2Y0nH3kizE7YbHIYeyeZj4DTTd2ShXjwa3AkqS3wGy
	 2sHLa6fcriwlG6N2VFhCXyebVd+8TkYnpxkGM4l3Fjjm+jTAj1ivbji7qF6QU57Y+H
	 hG0hNX6AqE5MNSqZILVB9hPj+39Q9WdBjKrIuY/mTMOWlE6XVYhZr/ZX4hEUN27wAk
	 LxZJFrr86j3mZs5YqGYm1/7UrLxm7YQ0rec3LWTNNswfIYf0Yih20vPN/W3EY2wttt
	 2faWVWD8mbw8A==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 03/20] ARC: uaccess: elide unaliged handling if hardware supports
Date: Mon, 14 Aug 2023 17:47:56 -0700
Message-Id: <20230815004813.555115-4-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815004813.555115-1-vgupta@kernel.org>
References: <20230815004813.555115-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174820_709511_E1AAD8AD 
X-CRM114-Status: GOOD (  11.38  )
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

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/uaccess.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
index d2da159bb80a..1e8809ea000a 100644
--- a/arch/arc/include/asm/uaccess.h
+++ b/arch/arc/include/asm/uaccess.h
@@ -146,8 +146,9 @@ raw_copy_from_user(void *to, const void __user *from, unsigned long n)
 	if (n == 0)
 		return 0;
 
-	/* unaligned */
-	if (((unsigned long)to & 0x3) || ((unsigned long)from & 0x3)) {
+	/* fallback for unaligned access when hardware doesn't support */
+	if (!IS_ENABLED(CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS) &&
+	     (((unsigned long)to & 0x3) || ((unsigned long)from & 0x3))) {
 
 		unsigned char tmp;
 
@@ -373,8 +374,9 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 	if (n == 0)
 		return 0;
 
-	/* unaligned */
-	if (((unsigned long)to & 0x3) || ((unsigned long)from & 0x3)) {
+	/* fallback for unaligned access when hardware doesn't support */
+	if (!IS_ENABLED(CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS) &&
+	     (((unsigned long)to & 0x3) || ((unsigned long)from & 0x3))) {
 
 		unsigned char tmp;
 
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
