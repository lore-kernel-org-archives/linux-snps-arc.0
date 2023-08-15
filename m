Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D68C001DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZXUKPx+Mxbp0CHwZL4nP3d6Dhb4a1x12N/l+kweobQ=; b=J4gz+YCYBWa86j
	Jkaa5Di7cG5KwOI2poOfNZL8soLWVEhlQwGAy3QZxQ34pPotYps0FYKFHwKMz3AlqAu/D4r4nuPxT
	60UPvDJIbdkpqe5znY0XeaCGBLKFHPYbJsMy62+K1wMw8rSkm35NCYyIjk+GOKSax+wIS5UFdAk5s
	B3jDMTWbS9BihkyLQCaoJ5Gd1IG08N+8qRJde4KQsh6mmtvbNQ519hmUbQ7f66OOZO0JvQ2cdhRny
	NUulC7/+uEXYJ/DAgHqE38bfdxKdCkFcoO4wa3ouTDSK8NChNgl/lGzZAR6HqqzKCZ+rYmlSjkuew
	VNUMi9SfbiKA/RF3dQPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEU-000ca5-0P;
	Tue, 15 Aug 2023 00:48:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEP-000cUd-2t
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:48:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E57964872;
	Tue, 15 Aug 2023 00:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09758C433CB;
	Tue, 15 Aug 2023 00:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060501;
	bh=yrWuUhf9P1ssyMUb7IbxFKryWboz4RPeuI0NifoMGno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QyMUGocdqRQxXPgXekFfbwRBL0IWCSwI3QN3Boyyyo1kLtTDDptYC8VOqP0XGVVFR
	 FdcESXIRYthB5KoHSAXxdzlHlsS7iHD6WYlHfuMv9u5T5npBs7AYxSLwGFmB7qKB0k
	 JPN8ZVNjTRb0jXe+F/OsGHkU1MpbTMYEP7QY4D3hddo5d5jaIclct4EKo+H2oIOWTa
	 aDkyjYMAje8hWAY5fNTVJvZH03L3VBRkVCt6gmkjL6gR3F2V5ls/OG8qRThAWZ/0CK
	 jvmM8czZDJyX8wuO/4QdBaOFkxXssvZkz4h4jM1R82K7C8twmy/muW0ZxuZiq5xRxD
	 9pyacHtJt9wwg==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 07/20] ARC: boot log: eliminate struct cpuinfo_arc #3: don't export
Date: Mon, 14 Aug 2023 17:48:00 -0700
Message-Id: <20230815004813.555115-8-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815004813.555115-1-vgupta@kernel.org>
References: <20230815004813.555115-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174821_981687_84FE8BE6 
X-CRM114-Status: UNSURE (   9.46  )
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
 arch/arc/include/asm/arcregs.h | 2 --
 arch/arc/kernel/mcip.c         | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index cb1ad1bb4ece..160ee3fab1bd 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -384,8 +384,6 @@ struct cpuinfo_arc {
 	struct bcr_mpy extn_mpy;
 };
 
-extern struct cpuinfo_arc cpuinfo_arc700[];
-
 static inline int is_isa_arcv2(void)
 {
 	return IS_ENABLED(CONFIG_ISA_ARCV2);
diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index f9fdb557c263..55373ca0d28b 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -165,8 +165,6 @@ static void mcip_probe_n_setup(void)
 		IS_AVAIL1(mp.idu, "IDU "),
 		IS_AVAIL1(mp.dbg, "DEBUG "),
 		IS_AVAIL1(mp.gfrc, "GFRC"));
-
-	cpuinfo_arc700[0].extn.gfrc = mp.gfrc;
 }
 
 struct plat_smp_ops plat_smp_ops = {
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
