Return-Path: <SRS0=v2Cq=E3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18B8C56202
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 23:42:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 403A920A8B
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 23:42:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZVImhbR+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IVUnA7xj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="X+jMy/oC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 403A920A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RfjLyXwMULreCQFItpqCsD/zmM4T+z9hwchEG+lrA3w=; b=ZVImhbR+X9SjyaT3zMm7RIGVw
	VtTOobvAm3dzBeJc1EUTvo9bSRGuDPgfkL39jPLev6300g3E6wXBHpFcc+tdNlT7tRgtU92y8SNOs
	ULno2QmbObEK4YcB49GhksH04rxIwzRi8VTIAiFxsaW6+V3d047gG1HbyNN2fPcw4p7r8Or4P43//
	T787Hn6MK8lhZfP2nsZkPlgBd8i8C4PI4L8zt9AGDCuEabzkgrdQjbmu9ToqqLcULrxy6HxzPqas9
	N51l6W09slGyz3CeEXLi3nWkUSd4dStzkoavl/KTa7J6Vme26k50Vu8lPPNWpp1Q3x3OGkS9adRkA
	D5YxqgQZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgcW2-00065z-6U; Sat, 21 Nov 2020 23:42:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgcVy-00064b-SY
 for linux-snps-arc@merlin.infradead.org; Sat, 21 Nov 2020 23:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=zRjAI6MWIz8eko8nj7c1QV+VW5QvZBMpIg5afqWWL3Y=; b=IVUnA7xjoaC1Sar5PSIWcIiaFe
 q0r/ljsLYa18gkD0REMzKnnJP2V/V23yg2/CcMC62v5MtyNUAicDoDYWUMjmxDi/eK5vWHhSCVgPn
 XxKXx2NRHDH3deF/jSY7wEs+e3SuMdywNbeaCaHpid2TVqeVExPC8UopYtmQaUA6Sai1pDZlISD0D
 Kezm3s3HHZAvI6HyvHFKoRHP8NWqh/NyTT7Jlz6E2BalRCup+QRmd/ERD++oQonvqPAL2B2NGLSLc
 zCMJLm31QKV4Y04ZpZ6rJL3v2Jm/5rMK8YLcAZDpQGyE+ZvBsaj712GQJSQe1R3GTO3Hxv64+JUil
 fE6Xi/aw==;
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgYhl-0002Wo-UH
 for linux-snps-arc@lists.infradead.org; Sat, 21 Nov 2020 19:38:02 +0000
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net
 [126.90.211.135]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id 0ALJawZF029948;
 Sun, 22 Nov 2020 04:37:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 0ALJawZF029948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1605987421;
 bh=zRjAI6MWIz8eko8nj7c1QV+VW5QvZBMpIg5afqWWL3Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X+jMy/oClpaAo13iHygxx8F3dSxfFzoypa25P4VmOe4gJ3rXB8WohOPSc0BAnTaec
 o4zx7LWDjGh28u+7Bce57OLV328pXbgb8ibiv3pjUETHH/hpHUBTOK4kKSxf5hhI/4
 v9SyRdKLWPXnO0rC2p6fQjnacLrQDw3btZmEMui0MVSoh88EdwZCAsTwZ3AyoshBGN
 QOeG38sYI6/YS+MrTBmLGyiIMR1/Hjzu4w7iNNCmYHCk75XzJyOMrCMuiXinIht5Mt
 T2wRPl2IKqldLTCMFac0goaNMPSknuMLruPz/vU1E3TyAUyfkMSyIeAHeM/e8f9jVA
 3NfaTGVlEoUBg==
X-Nifty-SrcIP: [126.90.211.135]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org
Subject: [PATCH 4/6] ARC: build: move symlink creation to arch/arc/Makefile to
 avoid race
Date: Sun, 22 Nov 2020 04:36:55 +0900
Message-Id: <20201121193657.51441-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201121193657.51441-1-masahiroy@kernel.org>
References: <20201121193657.51441-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_193755_485624_08DB4B39 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

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
---

 arch/arc/Makefile      | 13 ++++++++++++-
 arch/arc/boot/Makefile | 11 +----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index cf9da9aea12a..578bdbbb0fa7 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -102,11 +102,22 @@ libs-y		+= arch/arc/lib/ $(LIBGCC)
 
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
index 538b92f4dd25..3b1f8a69a89e 100644
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
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
