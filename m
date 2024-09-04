Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A41CD4F4A
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqMW3UfrlrpO0LfJq29j6awKNXEUGovPQ2MF8Gt+A9I=; b=EiQJUEMBSDApCw
	bFu82jigQqcY0+b3fo5HhyGlcdyqGl6y4J02xWzYdwELTqLmzs0gf32WABQLZgTH17JKmXPqv0qLC
	nmz6WbuJ6A5ohM4+yabBe90+eyJ1nZZlI0CIkMcsGlNIuUcAtX3oslD079qWuRGh0ll2lK67PRxq9
	GXnran3rVSv/fyXed2AbRv28kyP8f29V6kK8pOfJ4FTuZ5LFGeUBIfhAQ7vZ7Dcxs1lUA/cwtRwA0
	SHj0+7jI/75Dj/SWfBUfMFWqUZOM3tWFBo9lzIUCVpY4SaPHER00wVSF4KrNmDdNjUX4Dh9QfY8zy
	Bn8cvtQL5lCUiwWOQqxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjm-00000006Osb-3RCR;
	Wed, 04 Sep 2024 23:48:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjk-00000006Oqz-0vm6
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 39A595C568A;
	Wed,  4 Sep 2024 23:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12166C4CEC3;
	Wed,  4 Sep 2024 23:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493711;
	bh=0Cc2oNyNXJMYffrGUjSrxejvm3spX+Pr6+GYatSbayY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s0LzAvydGQzpSJjmNzSDLP3BIZFDXFf9RBmKd+rrW+Ri/pE8v2Je/CXoWRDgK5CIA
	 ZVX8UlTMpaUFjWSFfuvj6anH2/qJI7UyLMLLTYBkSJWRzaikGVRTej9BX0I2EVdefa
	 YTcU7Q6jqYEn1dwZDaSZWzXWDR1Q1UFxRJHalXeIRPycMCnHcf02dkj1egeg0oqXB0
	 xHI2gBGVyJHqV04UUrWEhQxA3f7eKY64W8jSoWx8XlOWLlxwV/p3UQjSxIVdrkUtDz
	 GZ+f3AW6gFl/jUur3f28fo8NZecBIG2JGJcWbuBQqM1Nn9UOP8UwUwuCMlURYKwcb1
	 XDA/Tmpxapf5Q==
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
Subject: [PATCH 07/15] LoongArch:  migrate to the generic rule for built-in DTB
Date: Thu,  5 Sep 2024 08:47:43 +0900
Message-ID: <20240904234803.698424-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904234803.698424-1-masahiroy@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164832_325094_92AD50D8 
X-CRM114-Status: GOOD (  11.19  )
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

Select GENERIC_BUILTIN_DTB when built-in DTB support is enabled.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/loongarch/Kbuild            | 1 -
 arch/loongarch/Kconfig           | 1 +
 arch/loongarch/boot/dts/Makefile | 2 --
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/loongarch/Kbuild b/arch/loongarch/Kbuild
index bfa21465d83a..beb8499dd8ed 100644
--- a/arch/loongarch/Kbuild
+++ b/arch/loongarch/Kbuild
@@ -4,7 +4,6 @@ obj-y += net/
 obj-y += vdso/
 
 obj-$(CONFIG_KVM) += kvm/
-obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
 
 # for cleaning
 subdir- += boot
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 70f169210b52..e1d3e5fb6fd2 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -388,6 +388,7 @@ endchoice
 config BUILTIN_DTB
 	bool "Enable built-in dtb in kernel"
 	depends on OF
+	select GENERIC_BUILTIN_DTB
 	help
 	  Some existing systems do not provide a canonical device tree to
 	  the kernel at boot time. Let's provide a device tree table in the
diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
index 747d0c3f6389..15d5e14fe418 100644
--- a/arch/loongarch/boot/dts/Makefile
+++ b/arch/loongarch/boot/dts/Makefile
@@ -1,5 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 dtb-y = loongson-2k0500-ref.dtb loongson-2k1000-ref.dtb loongson-2k2000-ref.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_NAME))
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
