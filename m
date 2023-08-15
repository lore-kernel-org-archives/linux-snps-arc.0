Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181FEC04FE1
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ep+zTKhZriSZIF9grbCZIqIVHrEutAKU1hIR4/4JcaM=; b=DvpnSGcNpeekPN
	sDI2+CEPbDNWpjF1NEub7kiZs3lC8y7Pu+zj6mZ8T3jPcjO9+zx6kTKXsIVGIw+zFRDghZFeR9fuY
	roaiex9XQIs+EbnXdS7lFlFjfCqMkhDfTozL2eWP0ahm+/M0BErz5yivane8m/V4o2iS86dlUd7od
	eh18qwM6fxeSu+bfDYHSSKsLfNaoWYZ4ZTdL9gtUehvEhHg3vKIb+n2SwCHbIbmJ+Kj4xKoHB8HZE
	FSia3+KQdlXN98IzeMzy9FPqAQ3WGHmsL01jDI5Vy+zIdpacsaohBaBFPYxR3VOIVkpb+fdWbigI9
	bDKm0epi5P2X7iKlsryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEa-000cgG-1E;
	Tue, 15 Aug 2023 00:48:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViET-000cYo-0y
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:48:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C47B663FE9;
	Tue, 15 Aug 2023 00:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3440DC433CB;
	Tue, 15 Aug 2023 00:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060504;
	bh=8tSfMGnAd50oKVThmqq7FfKvCcOhK1uCIhtjujNgeQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qSFPXhmTH+ypX1rtN/dHmPJaaNRWsqIQ7b4KRWeHq7rgad0ebhL2oshth6MtFfuuw
	 DP7MaCtJ8wO/PNXsqee6Qcy7ULH8xyehvV5mXqSfkP5nNOkSYqrynfT1KsGSd2Dmbr
	 J4y0QjriFENCS4lLHlkd50YQ851oqCGVeKObYb04NMXIqoFowkSE35TdT0gsODcBep
	 vInYcQSJFrnWAvDF+hL0nRJu2y5t3o7E0gMrfQp0gEp0VzsdfEnuRhw0o9beRtPh7P
	 CllckWVfnUx4neT5fms8LtjLoJ7uIC9/qfWg607LcRSdB8av52Iu6AeI8fCnMvJkOK
	 wTDsgj9tuCvQg==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 15/20] ARC: entry: EV_MachineCheck dont re-read ECR
Date: Mon, 14 Aug 2023 17:48:08 -0700
Message-Id: <20230815004813.555115-16-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815004813.555115-1-vgupta@kernel.org>
References: <20230815004813.555115-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174825_395442_0115B92B 
X-CRM114-Status: UNSURE (   8.26  )
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
 arch/arc/kernel/entry.S | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index f291fc8476d7..46582fbebcf2 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -95,16 +95,15 @@ END(instr_service)
 
 ENTRY(EV_MachineCheck)
 
-	EXCEPTION_PROLOGUE
+	EXCEPTION_PROLOGUE	; ECR returned in r10
 
-	lr  r2, [ecr]
 	lr  r0, [efa]
 	mov r1, sp
 
 	; MC excpetions disable MMU
 	ARC_MMU_REENABLE r3
 
-	lsr  	r3, r2, 8
+	lsr  	r3, r10, 8
 	bmsk 	r3, r3, 7
 	brne    r3, ECR_C_MCHK_DUP_TLB, 1f
 
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
