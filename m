Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E039EB64DB
	for <linux-snps-arc@archiver.kernel.org>; Thu, 15 Jun 2023 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fIFb9TpY0PGLIKu2AQ70rB3MBWmpUCyRDIdQj7BQbDM=; b=Q/xgyn2J+VhtZ+
	wMjNzvXqeYfLmzY28VxF+ZMLJjRrPfmcUGEjy/euMU5W3BjktXYyxojz3FGUFW9zoXaOHVDu9kTAX
	OpOHfq2REcLU8fYSSWeMCHJJYABOFNvneWEI0D2nyk7aGYj3MLFXJFfMquFKlVTr047XxBCicQ5YG
	yEF3Sloai4CYQj1JhVt8ytfyyEzKey4g50PVGHKEASfbb1rZSr3vK0Qtd/XyFRb3kebgrU/Sz+XRt
	1gtmJMvMGEn7g42dcEZjQ6rpM3d3Bq6dBH+AHcvDpkcj1gaooCB/oZRvJd4oC9xp5ymV8OZkVbrOE
	kt/T7LlO924VnmZEr/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9kzK-00Egds-0s;
	Thu, 15 Jun 2023 11:18:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9kzH-00Egct-2z
	for linux-snps-arc@lists.infradead.org;
	Thu, 15 Jun 2023 11:18:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D9BD630CD;
	Thu, 15 Jun 2023 11:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5524C433C0;
	Thu, 15 Jun 2023 11:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686827878;
	bh=1uYU6LpiCcuTJ/wma2POx8xMt4BZqFeI+ixT4aEcTbA=;
	h=From:To:Cc:Subject:Date:From;
	b=fHWFLirMyS5uj+mCayXhH0iRKX3b7wwkV7i3dsKljEK6E56E9MD/11rP/YrvCfQ6b
	 gJff3FPTVv6OtMfJV5Kklhx34qJhQqK9gu50+eRbKX7LTHtofIkuoZzwi+mtXO5s/Q
	 nbjyMYdV0T0j+NzMiBjgxgI0T3DF5Z4EuH3UBKR2LnU5t55KLkanQsz4frz8iIXnKV
	 hMlHkK9ohD9lL5naXCYejqMHJul3UnrxX2im9DGsPcoHiaukww1r2oZGzGEZLDkqtJ
	 QknJ9OzQhrk2bNePnmBtVlKxiPjg0f+9VmLuTJg4AIUMPc3M3XRrfN7GLkkm1x6W/1
	 jh58hCHDk2zOA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ben Hutchings <ben@decadent.org.uk>,
	linux-snps-arc@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>
Subject: [PATCH] kbuild: make modules_install copy modules.builtin(.modinfo)
Date: Thu, 15 Jun 2023 20:17:43 +0900
Message-Id: <20230615111743.883891-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_041800_050493_7F681C67 
X-CRM114-Status: GOOD (  10.59  )
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

Josh Triplett reports that initramfs-tools needs modules.builtin and
modules.builtin.modinfo to create a working initramfs for a non-modular
kernel.

If this is a general tooling issue not limited to Debian, I think it
makes sense to change modules_install.

This commit changes the targets as follows when CONFIG_MODULES=n.

In-tree builds:
  make modules          -> no-op
  make modules_install  -> install modules.builtin(.modinfo)

External module builds:
  make modules          -> show error message like before
  make modules_install  -> show error message like before

Link: https://lore.kernel.org/lkml/36a4014c73a52af27d930d3ca31d362b60f4461c.1686356364.git.josh@joshtriplett.org/
Reported-by: Josh Triplett <josh@joshtriplett.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index cc3fe09c4dec..f18d59c81241 100644
--- a/Makefile
+++ b/Makefile
@@ -1545,6 +1545,8 @@ modules_sign_only := y
 endif
 endif
 
+endif # CONFIG_MODULES
+
 modinst_pre :=
 ifneq ($(filter modules_install,$(MAKECMDGOALS)),)
 modinst_pre := __modinst_pre
@@ -1555,18 +1557,18 @@ PHONY += __modinst_pre
 __modinst_pre:
 	@rm -rf $(MODLIB)/kernel
 	@rm -f $(MODLIB)/source
-	@mkdir -p $(MODLIB)/kernel
+	@mkdir -p $(MODLIB)
+ifdef CONFIG_MODULES
 	@ln -s $(abspath $(srctree)) $(MODLIB)/source
 	@if [ ! $(objtree) -ef  $(MODLIB)/build ]; then \
 		rm -f $(MODLIB)/build ; \
 		ln -s $(CURDIR) $(MODLIB)/build ; \
 	fi
 	@sed 's:^\(.*\)\.o$$:kernel/\1.ko:' modules.order > $(MODLIB)/modules.order
+endif
 	@cp -f modules.builtin $(MODLIB)/
 	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
 
-endif # CONFIG_MODULES
-
 ###
 # Cleaning is done on three levels.
 # make clean     Delete most generated files
@@ -1908,6 +1910,13 @@ help:
 	@echo  '  clean           - remove generated files in module directory only'
 	@echo  ''
 
+__external_modules_error:
+	@echo >&2 '***'
+	@echo >&2 '*** The present kernel disabled CONFIG_MODULES.'
+	@echo >&2 '*** You cannot build or install external modules.'
+	@echo >&2 '***'
+	@false
+
 endif # KBUILD_EXTMOD
 
 # ---------------------------------------------------------------------------
@@ -1944,13 +1953,10 @@ else # CONFIG_MODULES
 # Modules not configured
 # ---------------------------------------------------------------------------
 
-modules modules_install:
-	@echo >&2 '***'
-	@echo >&2 '*** The present kernel configuration has modules disabled.'
-	@echo >&2 '*** To use the module feature, please run "make menuconfig" etc.'
-	@echo >&2 '*** to enable CONFIG_MODULES.'
-	@echo >&2 '***'
-	@exit 1
+PHONY += __external_modules_error
+
+modules modules_install: __external_modules_error
+	@:
 
 KBUILD_MODULES :=
 
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
