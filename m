Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28752C7EE43
	for <linux-snps-arc@archiver.kernel.org>; Sun, 11 Jun 2023 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PEFI0Q3vMmaxcvikLEXpT8gUh2s4j6TJ4PWrbyoC1CM=; b=MyWPA+UPMCOJ9S
	sYXwjgT3NdNeihNWh49VyDBQweEZcG5Bmd+/bZbKvnC+AHM46d98DlfXsYon/NpvASEGU9J+CVXaY
	uGr7tlDwh+nAc5LrWmHLjTNSqlev/42Wa+hJdGjIu5pPhqt1/lBbmuwFAaUiCh1tkuf/Ip0cBF+gB
	x43V+p0vmfaUQxQpDPEBqShSqbkUx5Zmc48RyRLgsWmj8+JJkN34a6Umd88xRtq6ZDy/vsByylYUd
	ThvbhUB7nY4Hux2ruiuT7zMWDfgqvHDacf5kwtnDAvHkD1J1VSF/TJsnnZykFuDOAdsZbV2PLrcb+
	ioh2IDh1AtOeMEBlCrdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NLn-001GUs-0T;
	Sun, 11 Jun 2023 15:51:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NLk-001GTT-2n
	for linux-snps-arc@lists.infradead.org;
	Sun, 11 Jun 2023 15:51:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6594B61CCC;
	Sun, 11 Jun 2023 15:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31222C433EF;
	Sun, 11 Jun 2023 15:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686498687;
	bh=6BfvdfkpzilXQh7Twa7D0t4Xdd7OIdDDNqJCJ31RxEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=muffq5Uz8VAmufgQ5ev31AyDN0HI/J9VuDzigM9QOi8MWiDZqAvtkY0eu2ouCT3SG
	 9O3edtUNX/dTYRarrI7pJ3i3sIpAMhPr3426eq1uso34+yWtFAc1I5yI3YV1I0hQXk
	 Mf2RxE6kjfHEfBfMwgd05WDbYqRJM9IntdDETlBhcINfjPZtWmE32XR27lAOZRW7VV
	 FN1AV1Ajh7d1bbu154nAJWXobki1X3tWHk849bj2pH+cOwlWAuJv7U9x/0eZNpVe7/
	 ICalL1vzDxhVHYwQ7alW7fRaeU6bYf1rlUEt0Jws8oZ1MZ9kHTeIV8jGt8IjWK6TuS
	 QfjCzQmWrdjNQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-snps-arc@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v9 10/11] modpost: show offset from symbol for section mismatch warnings
Date: Mon, 12 Jun 2023 00:50:59 +0900
Message-Id: <20230611155100.2553804-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611155100.2553804-1-masahiroy@kernel.org>
References: <20230611155100.2553804-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_085128_937249_97D01FBA 
X-CRM114-Status: GOOD (  12.07  )
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

Currently, modpost only shows the symbol names and section names, so it
repeats the same message if there are multiple relocations in the same
symbol. It is common the relocation spans across multiple instructions.

It is better to show the offset from the symbol.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---


 scripts/mod/modpost.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0adda14451fa..f26d5050e6da 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1147,8 +1147,8 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
 
 	sec_mismatch_count++;
 
-	warn("%s: section mismatch in reference: %s (section: %s) -> %s (section: %s)\n",
-	     modname, fromsym, fromsec, tosym, tosec);
+	warn("%s: section mismatch in reference: %s+0x%x (section: %s) -> %s (section: %s)\n",
+	     modname, fromsym, (unsigned int)(faddr - from->st_value), fromsec, tosym, tosec);
 
 	if (mismatch->mismatch == EXTABLE_TO_NON_TEXT) {
 		if (match(tosec, mismatch->bad_tosec))
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
