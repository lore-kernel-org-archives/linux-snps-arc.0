Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5442C001E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WToRqIS5KiuHc5zRGg6NKWrzCF8rcm9ttXpcwTT3E0A=; b=JPVUZ5Gn2lzyZ3
	0DBEXEcQgvEHNSK+KxaOiqbQtzmLHdtZk1+ClMp/v0Z8mMLhdHRBlqIl4GT8Dc7l8wwJvXF5HwUUF
	EMmFgnOQWCG5EHjJRO8wU2ToGwdprmg6uZdo1KCDfX3o4HZW7D4pMVXzISZE4BpruIDPkCPDCbHNH
	qY/3xreWqw8dnkzlhVgJcwcjtnrKBaJ9ZYgj62pgTiTj+w86mdCiY+SudAQxjGJPkVbK92HUwzIrT
	T5cuRyFGqmtpVkbfSOxQwveLqvJpOoCiJZsnCe7eUc+/tTey3UiboP0xEZ+CEOY3EW+5h+gJGTzTG
	g+m9Co72+PcUzumZVGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEa-000cg1-0F;
	Tue, 15 Aug 2023 00:48:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViES-000cVi-2S
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:48:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A0DD640F6;
	Tue, 15 Aug 2023 00:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98F9C433C7;
	Tue, 15 Aug 2023 00:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060504;
	bh=u267G5jkhUA2JZr0XnWTZStLuMWUHc9Rgpk/dYQh5G4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ASFBYNfgI8UKmQU2xybw7HWbdahnGkvkBKXmuux3FGHHYJr2LAor+IQiUoOX/yrZ+
	 IkJz8/kHlfOsarUPlnTgeDn51+heWIXsSabeIg6u4xPvzkMQeQINyS7/FQ73x86k49
	 fj/j70xVZRxghfaVJf9Mp7nhfi/u9CAuQAV1/LLxnJKExyh6dNN9UcTWUBdhPMenkU
	 ftGLEbRHf9lY5lATxrfsqWL0/t8tlZVuEsFK21U3DoHNvOuBvyxX/RxIaP8CmrI5fK
	 ej8ffxCfQaL3iXSAMbB6SoAnXsGaGC+jLwPveUJWB4EA7C04wmtRAxfTOSj0eMkNed
	 VPKVKUMwHJWGQ==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 14/20] ARC: entry: ARcompact EV_ProtV to use r10 directly
Date: Mon, 14 Aug 2023 17:48:07 -0700
Message-Id: <20230815004813.555115-15-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815004813.555115-1-vgupta@kernel.org>
References: <20230815004813.555115-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174824_862735_1721E44C 
X-CRM114-Status: UNSURE (   7.92  )
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

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/kernel/entry-compact.S | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arc/kernel/entry-compact.S b/arch/arc/kernel/entry-compact.S
index 5cb0cd7e4eab..77f0090554c5 100644
--- a/arch/arc/kernel/entry-compact.S
+++ b/arch/arc/kernel/entry-compact.S
@@ -254,9 +254,8 @@ END(handle_interrupt_level1)
 
 ENTRY(EV_TLBProtV)
 
-	EXCEPTION_PROLOGUE
+	EXCEPTION_PROLOGUE	; ECR returned in r10
 
-	mov r2, r10	; ECR set into r10 already
 	lr  r0, [efa]	; Faulting Data address (not part of pt_regs saved above)
 
 	; Exception auto-disables further Intr/exceptions.
@@ -273,8 +272,7 @@ ENTRY(EV_TLBProtV)
 	;   -Access Violation	: 00_23_(00|01|02|03)_00
 	;			         x  r  w  r+w
 	;   -Unaligned Access	: 00_23_04_00
-	;
-	bbit1 r2, ECR_C_BIT_PROTV_MISALIG_DATA, 4f
+	bbit1 r10, ECR_C_BIT_PROTV_MISALIG_DATA, 4f
 
 	;========= (6a) Access Violation Processing ========
 	bl  do_page_fault
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
