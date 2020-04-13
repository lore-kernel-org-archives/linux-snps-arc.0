Return-Path: <SRS0=aZIh=55=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0569BC2BB55
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Apr 2020 02:06:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C572C206C3
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Apr 2020 02:06:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aqR2XUe7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="qFtvBi3f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C572C206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0KwNPq77UkT1BxFegRzI4hsALLkg33l3dMkEQ/O4a6s=; b=aqR2XUe7LdTjKa
	Db6VN3KIx/VwQ8M+YJoCLKuE4e2WiL3OKoZU0VZqkTWtiaJIL79ocyNBSjaoM+4hzr24L/i8ilVqX
	HQvAjnpXk85zmkyVvskY66KthGzcSV98kWWTmeyN4+Frj/IzkjMij1YgxvjLcvD4SuTUS15DoxhGu
	LzUKxhKyMGZBi0xcS7jeupAAJD1eoBPaozBkhioFuZnppZeII7vBwIAe9/7h47KmQWE8CH2rpK6n2
	lC4g5v2+n6EYYERxIa+eQWn3J+VKqG6PRD0SP+0d1OV3QIXXPpmCEkaFtt4MCRUZYdzjqlXz2W1Po
	uYQJGQk1IGEj3X/TtC2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNoUs-00048X-HD; Mon, 13 Apr 2020 02:06:50 +0000
Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNoUo-000487-Ms
 for linux-snps-arc@lists.infradead.org; Mon, 13 Apr 2020 02:06:48 +0000
Received: from oscar.flets-west.jp (softbank060142179096.bbtec.net
 [60.142.179.96]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 03D25t9Y009526;
 Mon, 13 Apr 2020 11:05:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 03D25t9Y009526
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1586743556;
 bh=CiA+LS3srZDXaba4IVzHQlWKWt2AFnfnDeWfK+2rQZM=;
 h=From:To:Cc:Subject:Date:From;
 b=qFtvBi3fH02TZP3DCJxedKNk+7iJhrFZVTTyCqA7c7oyKwkFi7UMFDsu8ZYHAD/fe
 wYEKhglT8w3aRZcUVwJ3/ubS2ndbTwilLLOqn8xfjgOp00LkJmcdWD00facLVpBvMP
 gdfcUmzkpJ8IdKNDcO6r6B75uI8tp//TYq8exTms/anPo9HMbEKv+5zAM2Uh7gwecL
 qwVa1KldLU3yvLsqmhjhp+FPb5jwo0wMviJk4n+kJ0nxpLRSaHl5KKd8V5GzDxPoz1
 sw8sNJ5v0SerRXHV63DONY0CZB+ZwHPyROj2JXgpXpt0Eb7I7wiO01vJodiOp9ri4e
 KLrC6hLtm66rg==
X-Nifty-SrcIP: [60.142.179.96]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org
Subject: [PATCH] arc: remove #ifndef CONFIG_AS_CFI_SIGNAL_FRAME
Date: Mon, 13 Apr 2020 11:05:38 +0900
Message-Id: <20200413020538.31322-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200412_190646_974507_3A551B6C 
X-CRM114-Status: UNSURE (   6.28  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CONFIG_AS_CFI_SIGNAL_FRAME is never defined for ARC.

Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arc/kernel/unwind.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 27ea64b1fa33..f87758a6851b 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -1178,11 +1178,9 @@ int arc_unwind(struct unwind_frame_info *frame)
 #endif
 
 	/* update frame */
-#ifndef CONFIG_AS_CFI_SIGNAL_FRAME
 	if (frame->call_frame
 	    && !UNW_DEFAULT_RA(state.regs[retAddrReg], state.dataAlign))
 		frame->call_frame = 0;
-#endif
 	cfa = FRAME_REG(state.cfa.reg, unsigned long) + state.cfa.offs;
 	startLoc = min_t(unsigned long, UNW_SP(frame), cfa);
 	endLoc = max_t(unsigned long, UNW_SP(frame), cfa);
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
