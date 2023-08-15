Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213A8C04FE1
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qhK7KBXr7/p8NcwzlOSs1NQtRU4QQgJ/j/vAnu+E87g=; b=WxtZVoFKrIQOfn
	RKlTSK9ZVp4jWoJr5cbqC88j/yxgfLq9wIALbIPLD7vfP0ETjHwkrL8VTjLgruukqU6jCEreb9mDG
	dVOLr7SWeUn/ElWcWdU9//DGfYZm96c+/fI2XItddZDFl5+4jdLE4W9IBqU/4kte3AIeyqEr5yTEP
	1c000MiClIc+8jFuhP0B41BYV/Ce52IZa2SOVlrm+01iowkPKZP+QclwVo2T9J39rDXedj7KPdSfk
	JeCAwA7/vXhRqP5xDGtnAoFqoHckN8wTFIaXpxL0ArtUT0ijoptakjJr8cddQefr546hUhEftdP2w
	QJCxs7KfJoGKRLlTLBIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEU-000cb3-2t;
	Tue, 15 Aug 2023 00:48:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViER-000cVi-0Q
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:48:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A167B64BE3;
	Tue, 15 Aug 2023 00:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D212C433CC;
	Tue, 15 Aug 2023 00:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060502;
	bh=yWcyUxif3dikEYknmSArzeGyfZedu8yajJX9cu4DT8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jIuvLqPbU//pLE4JPxKRp9UCHkrq9i+/o1874YalJxOHW1DzCuOc5eTpgw+36PDDD
	 2aOy8LOzN/4I/Y66XzxsCN/UDZ1ZlY544oyu35GmmcdnL7yq0qCBggnlJcDCF580Rx
	 b2xdpHvMrUc/wnQ1wJTJYlgeosSMYovaiGmHWOcPHkxLTCNCtCKV3v7sRF8bov3N6R
	 4KTt9Ifyn9CofxXD/PVV8Ebi4mYtym7AeLTudA5ZA+xApAxDL242HS3ZDBNETyHs/y
	 qpHDFhaLXhhTveQNORVxZZ6zFk+UD+YbDI7/VrH5bxw/OVgzuk2z7VRZE21OhoWNSA
	 vlDa9wN4DEArQ==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 10/20] ARC: kernel stack: INIT_THREAD need not setup @init_stack in @ksp
Date: Mon, 14 Aug 2023 17:48:03 -0700
Message-Id: <20230815004813.555115-11-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815004813.555115-1-vgupta@kernel.org>
References: <20230815004813.555115-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174823_219207_0F4CB622 
X-CRM114-Status: GOOD (  11.89  )
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

There are 2 pointers to kernel mode stack of a task
 - task_struct.stack: base address of stack page (max possible stack top)
 - thread_info.ksp  : runtime stack top in __switch_to

INIT_THREAD was setting up ksp to stack base which was not really needed
 - it would get overwritten with dynamic value on first call to
   __switch_to when init is switched out for the very first time.
 - generic code already does
      init_task.stack = init_stack
   and ARC code uses that to retrieve task's stack base.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/processor.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
index fb844fce1ab6..82ddc929d6e7 100644
--- a/arch/arc/include/asm/processor.h
+++ b/arch/arc/include/asm/processor.h
@@ -33,9 +33,7 @@ struct thread_struct {
 #endif
 };
 
-#define INIT_THREAD  {                          \
-	.ksp = sizeof(init_stack) + (unsigned long) init_stack, \
-}
+#define INIT_THREAD  { }
 
 /* Forward declaration, a strange C thing */
 struct task_struct;
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
