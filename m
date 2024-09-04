Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CCFCD4F4D
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tAdJxZpnLF53SZR7ofWn5ACCtAh4nF2T590leN8n9o=; b=fQs/vNe5+97kjT
	ysBB1glBn6UUYzIcFtlqfy4EKaJFx2+zoOL6RY+OItjNWZQXJTf9ifKj8II2jiNqN8ncFBn936iRN
	QUlmCUhwfg0Qny7+7/V0EQ6Bu0K1lU+OU+vPxEAAQSCzMy8e/rUF4Pu/zNI6BBTDqbY2WMogsPIB8
	rfdpjNQo1oNfpHxM62VWR31WCtGfLmZLsqQRt2SBI1PzcMbNbaOlyjBg0NQt3GxBv1HuNHG2aorPw
	9CKhY5a1UMDD+YTopnZJaok0x3aD9ClZmk6qh7yy4k7bS4D3vYA4H5b5vrRJxR8EwOt+L58pta9+7
	ozsGrRBb19tvu8MRNL9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjW-00000006OkA-2fhh;
	Wed, 04 Sep 2024 23:48:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjT-00000006OjS-3Nts
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9BAF65C58A2;
	Wed,  4 Sep 2024 23:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9724DC4CEC3;
	Wed,  4 Sep 2024 23:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493694;
	bh=7exJ6iWjWavlMXuLRQ9WRoHQOnMw1lBsb8ceOLpZsRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WOVd3paeevBj5YOl3wu7mYGb5u2Z69iUi5zvqRoh0g1/hFWOllNhmz7IQCl6hqgtc
	 wTEXpGsqQf0tg7qrTHiVk/knj1jQgLAlBC7M71kllOWhWgfrJtnUbU7F8g09nggEO8
	 TGyQiuR1bH4PZ56i8ukJ/qfmZliI/Yt48ScivKtZC1bYq1lcPoyPSX1EtSZ+EwOiye
	 SO+Q1c6/cy9HCONzbRd9N7pjUoRlnc+xkawIVzCMc1RSNx53zw7vKZxygaR+r6ymYO
	 3YkMkB8ZYVCqMkVVGUw2Lhufu7UbgcruHVPfwOhnWicSH8+TpFbt+SMRLs5mmvnWyz
	 QIkjEiswGQNww==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 01/15] kbuild: add intermediate targets for Flex/Bison in scripts/Makefile.host
Date: Thu,  5 Sep 2024 08:47:37 +0900
Message-ID: <20240904234803.698424-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904234803.698424-1-masahiroy@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164815_951832_71B84C72 
X-CRM114-Status: UNSURE (   8.48  )
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

Flex and Bison are used only for host programs. Move their intermediate
target processing from scripts/Makefile.build to scripts/Makefile.host.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 35 ++++++++++++++++-------------------
 scripts/Makefile.host  |  5 +++++
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a5ac8ed1936f..4b6942653093 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -41,20 +41,6 @@ include $(srctree)/scripts/Makefile.compiler
 include $(kbuild-file)
 include $(srctree)/scripts/Makefile.lib
 
-# Do not include hostprogs rules unless needed.
-# $(sort ...) is used here to remove duplicated words and excessive spaces.
-hostprogs := $(sort $(hostprogs))
-ifneq ($(hostprogs),)
-include $(srctree)/scripts/Makefile.host
-endif
-
-# Do not include userprogs rules unless needed.
-# $(sort ...) is used here to remove duplicated words and excessive spaces.
-userprogs := $(sort $(userprogs))
-ifneq ($(userprogs),)
-include $(srctree)/scripts/Makefile.userprogs
-endif
-
 ifndef obj
 $(warning kbuild: Makefile.build is included improperly)
 endif
@@ -452,13 +438,24 @@ intermediate_targets = $(foreach sfx, $(2), \
 # %.asn1.o <- %.asn1.[ch] <- %.asn1
 # %.dtb.o <- %.dtb.S <- %.dtb <- %.dts
 # %.dtbo.o <- %.dtbo.S <- %.dtbo <- %.dtso
-# %.lex.o <- %.lex.c <- %.l
-# %.tab.o <- %.tab.[ch] <- %.y
 targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
 	   $(call intermediate_targets, .dtb.o, .dtb.S .dtb) \
-	   $(call intermediate_targets, .dtbo.o, .dtbo.S .dtbo) \
-	   $(call intermediate_targets, .lex.o, .lex.c) \
-	   $(call intermediate_targets, .tab.o, .tab.c .tab.h)
+	   $(call intermediate_targets, .dtbo.o, .dtbo.S .dtbo)
+
+# Include additional build rules when necessary
+# ---------------------------------------------------------------------------
+
+# $(sort ...) is used here to remove duplicated words and excessive spaces.
+hostprogs := $(sort $(hostprogs))
+ifneq ($(hostprogs),)
+include $(srctree)/scripts/Makefile.host
+endif
+
+# $(sort ...) is used here to remove duplicated words and excessive spaces.
+userprogs := $(sort $(userprogs))
+ifneq ($(userprogs),)
+include $(srctree)/scripts/Makefile.userprogs
+endif
 
 # Build
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index e85be7721a48..e01c13a588dd 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -160,3 +160,8 @@ $(host-rust): $(obj)/%: $(src)/%.rs FORCE
 
 targets += $(host-csingle) $(host-cmulti) $(host-cobjs) \
 	   $(host-cxxmulti) $(host-cxxobjs) $(host-rust)
+
+# %.lex.o <- %.lex.c <- %.l
+# %.tab.o <- %.tab.[ch] <- %.y
+targets += $(call intermediate_targets, .lex.o, .lex.c) \
+           $(call intermediate_targets, .tab.o, .tab.c .tab.h)
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
