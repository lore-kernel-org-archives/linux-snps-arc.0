Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A17C77B7A
	for <linux-snps-arc@archiver.kernel.org>; Sun, 11 Jun 2023 15:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLXPA/zs5mB8SSKdgOB9Uf+M4sAqj17lLkTtNuuTPuE=; b=UmVfC8UlVMRtHK
	DqRzubpUdDcI1JNnOPm1Mb2o3W750NsY3JmfjHxxlwl5M6KKJgzwp2xJ/7HzzIftkSPJh5LNzo7GB
	+nyGMUjvhpGWSjHzF9f/ZR9YfxUmJMCGxHDIOP+ZAg0j0XKDXObQhOSsMecNpOtYeTCS3dpZUaCyN
	UFpCkGKrdzvHdCkqFV24zR/VkE27IvQk6kz4V+UpAwAVNAHuDBZzqQ4m0cWjms33HV4A//50GWndh
	8sxFcWa1utfBF3CoNeTSeEzpU+Lk8K28FxTakqQdqFQOGeNHLWC1PnMiUr3zQ4L8kuSBV5dESDoTX
	LD4nE/9XhExTD6/VZ3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NLl-001GTx-1f;
	Sun, 11 Jun 2023 15:51:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NLi-001GSW-2P
	for linux-snps-arc@lists.infradead.org;
	Sun, 11 Jun 2023 15:51:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C3DD61C4B;
	Sun, 11 Jun 2023 15:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784EEC4339B;
	Sun, 11 Jun 2023 15:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686498685;
	bh=YZ0l1FqEA6ILtt6BXeqxjkYBaJ3udRyTWz128FAD7M4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b1F/u7Y0bKzhfFMteHGFRkUUrEA2ZknlMBByBZ2Doqo6c9f3LcwVC6uB/5uRN3IU/
	 ChP+07D283F+4zi/EQfD6nFug/GVCCrics02TBNw+obuU2jbIdFsKAfwmZRbQQA3ub
	 j1x6r8EI0Z3uBc6wuqihdUg4XO7MGUmSuA9iEptxiF9XK4mM0Xo41wAG/kIQfgwOGn
	 m0QpeK4HA/fMHwav6RsVcRmxSuWxW+EwPmYfCNgqXYzuFPDiRjxF17VxT/ThFZaYK2
	 3b2bC0OM6JBRVtknzjI2AJUmKkQ25tx8xbsZLxgnI2HmbD00Gr3kNSvx4qGZDiF0gL
	 jnA3Jp5Yfh6xA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-snps-arc@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v9 09/11] modpost: merge two similar section mismatch warnings
Date: Mon, 12 Jun 2023 00:50:58 +0900
Message-Id: <20230611155100.2553804-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611155100.2553804-1-masahiroy@kernel.org>
References: <20230611155100.2553804-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_085126_821092_FF10700D 
X-CRM114-Status: UNSURE (   9.53  )
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

In case of section mismatch, modpost shows slightly different messages.

For extable section mismatch:

 "%s(%s+0x%lx): Section mismatch in reference to the %s:%s\n"

For the other cases:

 "%s: section mismatch in reference: %s (section: %s) -> %s (section: %s)\n"

They are similar. Merge them.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---


 scripts/mod/modpost.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 50d950e904a4..0adda14451fa 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1147,21 +1147,10 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
 
 	sec_mismatch_count++;
 
-	switch (mismatch->mismatch) {
-	case TEXT_TO_ANY_INIT:
-	case DATA_TO_ANY_INIT:
-	case TEXTDATA_TO_ANY_EXIT:
-	case XXXINIT_TO_SOME_INIT:
-	case XXXEXIT_TO_SOME_EXIT:
-	case ANY_INIT_TO_ANY_EXIT:
-	case ANY_EXIT_TO_ANY_INIT:
-		warn("%s: section mismatch in reference: %s (section: %s) -> %s (section: %s)\n",
-		     modname, fromsym, fromsec, tosym, tosec);
-		break;
-	case EXTABLE_TO_NON_TEXT:
-		warn("%s(%s+0x%lx): Section mismatch in reference to the %s:%s\n",
-		     modname, fromsec, (long)faddr, tosec, tosym);
+	warn("%s: section mismatch in reference: %s (section: %s) -> %s (section: %s)\n",
+	     modname, fromsym, fromsec, tosym, tosec);
 
+	if (mismatch->mismatch == EXTABLE_TO_NON_TEXT) {
 		if (match(tosec, mismatch->bad_tosec))
 			fatal("The relocation at %s+0x%lx references\n"
 			      "section \"%s\" which is black-listed.\n"
@@ -1181,7 +1170,6 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
 		else
 			error("%s+0x%lx references non-executable section '%s'\n",
 			      fromsec, (long)faddr, tosec);
-		break;
 	}
 }
 
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
