Return-Path: <SRS0=SdQC=GP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35325C433E9
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 12:58:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B521D23332
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 12:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B521D23332
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m0J2zEX9XfQtfQmyaLjYt/MXKaiqMBgw9+ZYZASdgw4=; b=wbg7jApc3MnVVBZr3aFt4bNLE
	p6qYInzUnv3rZS5FD+FKkhiZ2/ueHmC+W+cE748843PdiB3oiaujQUcq4dhBxqugsKaPPLpHHcvfG
	0oQY0H6cXoRy/pRXAw+xLRG8x47WPB5nZGnrTE/Vy2hlkuth+gFO8QVkdmMDrmLWd8bs2t8nejJUJ
	oa+N7isXWS0RxuOqmhiCG0cAnqLdYixcOGJqsMzqe7uisLrIy87aJ5hsqmGfBO8Bqo5Bg2P0a4YVC
	QKn3UusfIOyfu96ytJIgzRhth5NetQJCLpuQvyazaUjBx46lQ6JyOAGYVYIimb25k0uypdAFlP1AP
	Sig1TMIeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzJFK-00018h-M9; Tue, 12 Jan 2021 12:58:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzJEB-0000TW-Ms
 for linux-snps-arc@lists.infradead.org; Tue, 12 Jan 2021 12:56:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25A0423447;
 Tue, 12 Jan 2021 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456210;
 bh=VqMTlfQ5UltVETkFptKisEKq28AwZpOHW67gTfgAv/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p/jTzDAESTDvv/3quVpb56YWFn5jXhOw6XUPpftMhjTtNIZ5Tdky027t/SJBNPwbO
 Zlv6SzHRa/UAiitgJckofw6Dd7e8xbI+PHsWTJlNTds75/zoB0k17gotjHhdXVgGMW
 fzsLD7r9q4Q2T7xx4E++OmZzBPbAMRj1GBahlDOJATx/kg+IWAOk5Ken/rQlkzeBGa
 hmMiCWfTTPZvz0NSjRPpBgN3EwP8DSXyZzcNcfB8gMxpMsSKNwNNUmsFG79Zi+zg9d
 36lQjm2o3jGXWFgtCDQD+RSCFFDZOpwsZa+TVtTGwH/iOVW/FGkKJzVIWYzywZaAa2
 BUHyG4cy98o+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 04/28] ARC: build: move symlink creation to
 arch/arc/Makefile to avoid race
Date: Tue, 12 Jan 2021 07:56:20 -0500
Message-Id: <20210112125645.70739-4-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125645.70739-1-sashal@kernel.org>
References: <20210112125645.70739-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_075653_452549_3211FE70 
X-CRM114-Status: GOOD (  12.86  )
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
Cc: Sasha Levin <sashal@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit c5e6ae563c802c4d828d42e134af64004db2e58c ]

If you run 'make uImage uImage.gz' with the parallel option, uImage.gz
will be created by two threads simultaneously.

This is because arch/arc/Makefile does not specify the dependency
between uImage and uImage.gz. Hence, GNU Make assumes they can be
built in parallel. One thread descends into arch/arc/boot/ to create
uImage, and another to create uImage.gz.

Please notice the same log is displayed twice in the following steps:

  $ export CROSS_COMPILE=<your-arc-compiler-prefix>
  $ make -s ARCH=arc defconfig
  $ make -j$(nproc) ARCH=arc uImage uImage.gz
  [ snip ]
    LD      vmlinux
    SORTTAB vmlinux
    SYSMAP  System.map
    OBJCOPY arch/arc/boot/vmlinux.bin
    OBJCOPY arch/arc/boot/vmlinux.bin
    GZIP    arch/arc/boot/vmlinux.bin.gz
    GZIP    arch/arc/boot/vmlinux.bin.gz
    UIMAGE  arch/arc/boot/uImage.gz
    UIMAGE  arch/arc/boot/uImage.gz
  Image Name:   Linux-5.10.0-rc4-00003-g62f23044
  Created:      Sun Nov 22 02:52:26 2020
  Image Type:   ARC Linux Kernel Image (gzip compressed)
  Data Size:    2109376 Bytes = 2059.94 KiB = 2.01 MiB
  Load Address: 80000000
  Entry Point:  80004000
    Image arch/arc/boot/uImage is ready
  Image Name:   Linux-5.10.0-rc4-00003-g62f23044
  Created:      Sun Nov 22 02:52:26 2020
  Image Type:   ARC Linux Kernel Image (gzip compressed)
  Data Size:    2815455 Bytes = 2749.47 KiB = 2.69 MiB
  Load Address: 80000000
  Entry Point:  80004000

This is a race between the two threads trying to write to the same file
arch/arc/boot/uImage.gz. This is a potential problem that can generate
a broken file.

I fixed a similar problem for ARM by commit 3939f3345050 ("ARM: 8418/1:
add boot image dependencies to not generate invalid images").

I highly recommend to avoid such build rules that cause a race condition.

Move the uImage rule to arch/arc/Makefile.

Another strangeness is that arch/arc/boot/Makefile compares the
timestamps between $(obj)/uImage and $(obj)/uImage.*:

  $(obj)/uImage: $(obj)/uImage.$(suffix-y)
          @ln -sf $(notdir $<) $@
          @echo '  Image $@ is ready'

This does not work as expected since $(obj)/uImage is a symlink.
The symlink should be created in a phony target rule.

I used $(kecho) instead of echo to suppress the message
'Image arch/arc/boot/uImage is ready' when the -s option is given.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/Makefile      | 13 ++++++++++++-
 arch/arc/boot/Makefile | 11 +----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index c95b950389ba6..6f05e509889f6 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -90,11 +90,22 @@ libs-y		+= arch/arc/lib/ $(LIBGCC)
 
 boot		:= arch/arc/boot
 
-boot_targets := uImage uImage.bin uImage.gz uImage.lzma
+boot_targets := uImage.bin uImage.gz uImage.lzma
 
 PHONY += $(boot_targets)
 $(boot_targets): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 
+uimage-default-y			:= uImage.bin
+uimage-default-$(CONFIG_KERNEL_GZIP)	:= uImage.gz
+uimage-default-$(CONFIG_KERNEL_LZMA)	:= uImage.lzma
+
+PHONY += uImage
+uImage: $(uimage-default-y)
+	@ln -sf $< $(boot)/uImage
+	@$(kecho) '  Image $(boot)/uImage is ready'
+
+CLEAN_FILES += $(boot)/uImage
+
 archclean:
 	$(Q)$(MAKE) $(clean)=$(boot)
diff --git a/arch/arc/boot/Makefile b/arch/arc/boot/Makefile
index 538b92f4dd253..3b1f8a69a89ef 100644
--- a/arch/arc/boot/Makefile
+++ b/arch/arc/boot/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-targets := vmlinux.bin vmlinux.bin.gz uImage
+targets := vmlinux.bin vmlinux.bin.gz
 
 # uImage build relies on mkimage being availble on your host for ARC target
 # You will need to build u-boot for ARC, rename mkimage to arc-elf32-mkimage
@@ -13,11 +13,6 @@ LINUX_START_TEXT = $$(readelf -h vmlinux | \
 UIMAGE_LOADADDR    = $(CONFIG_LINUX_LINK_BASE)
 UIMAGE_ENTRYADDR   = $(LINUX_START_TEXT)
 
-suffix-y := bin
-suffix-$(CONFIG_KERNEL_GZIP)	:= gz
-suffix-$(CONFIG_KERNEL_LZMA)	:= lzma
-
-targets += uImage
 targets += uImage.bin
 targets += uImage.gz
 targets += uImage.lzma
@@ -42,7 +37,3 @@ $(obj)/uImage.gz: $(obj)/vmlinux.bin.gz FORCE
 
 $(obj)/uImage.lzma: $(obj)/vmlinux.bin.lzma FORCE
 	$(call if_changed,uimage,lzma)
-
-$(obj)/uImage: $(obj)/uImage.$(suffix-y)
-	@ln -sf $(notdir $<) $@
-	@echo '  Image $@ is ready'
-- 
2.27.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
