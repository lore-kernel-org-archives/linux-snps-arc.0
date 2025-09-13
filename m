Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA2DCAC582
	for <linux-snps-arc@archiver.kernel.org>; Sat, 13 Sep 2025 01:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJ1HDNCupUQcnG3yHmoG7ps2u6Wy/0tHzq15gkPbTmI=; b=mViczgtrr9mXIH
	OkW2A6Owb+vTTNHRAiYp0bOvOUhNRk1YY3726WsAiJD+hHQCPfUwxxzUJNq18SDlOHma0t1C2ekWU
	aRhuyd6zILabFCB2nITYc3ccuEnrVbPiu7Pb/71hq3Dmpqgau+I/FvthbbgocxaDVfJVpNp9iY9Fr
	FrJkZEWaSFguB6uar6tNBe77CGfFPGLwF1Z9iRiyjJ3F8QYrkFDBv8aAkhJMiW3/umiiYpF8fwUQz
	tmCeDh3VN3TFiZBtjK76dbvDx32m75U3e0A52e9cLZFQvrASyRP/aRuVIp5YlIKqdfBZZR6pQOyqv
	i5gQl5cCNmauOHfb3dEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEha-0000000CVP5-2lpW;
	Sat, 13 Sep 2025 01:05:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEhZ-0000000CVNt-1kaC
	for linux-snps-arc@bombadil.infradead.org;
	Sat, 13 Sep 2025 01:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5agMVhmWz9D3tLYyZnqIaP8gTBBboQ75Wn3D7w2vh+Q=; b=GP9Ugv+/JyECL7WTIzAf1i+kYo
	RpyUCqKNLqLAWrEQIokHsKyIhDX/EcsRf25AKiNajRN1MQSKx/jtRuRfL4ugTMNxVB47ZS6bBzIF9
	BsvP+rt888dF2Do2ZdieTdmewMXHXHJ6zyLwOVsOgSA4HqeUlyEMWCXK+X6REGZ2KXVo1M38oFK0a
	M1dwEmxe/bLtq5L4jLeKGC2I5CWmdRo2ffay2YkpfvD8qvjYZCU8rif4bA4Bwcu/SXUvvqvhrnNjG
	DuGewB+YF6V2hY9dgC7g6P6Ji82HPsQAJaRC/0doUQ3bptQ+kNCwHRVSpY9AKey8IbB7ZdD9qWxs+
	cIdg1Bnw==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEhT-00000006VuN-3ohZ
	for linux-snps-arc@lists.infradead.org;
	Sat, 13 Sep 2025 01:05:16 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b0473327e70so420923966b.3
        for <linux-snps-arc@lists.infradead.org>; Fri, 12 Sep 2025 18:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725509; x=1758330309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5agMVhmWz9D3tLYyZnqIaP8gTBBboQ75Wn3D7w2vh+Q=;
        b=US+geqA1KYmyiZk+HrwSQzA72r4oT7AxkcCW6fcHzESalnz9kquh7bK+FNc7Bo9mCf
         C8n7VpVmEWn3W2cqPeqVIYDN9dkfl7m7ZCQgnj2gbkMszCXeylUMDOtLyHEwoCkUdKqX
         DXN0jUfiXlxfBVzY/WFCSC46w6L0jR1OZeFmeZMGCsCHdtYqmaOGQj/0nFR+/DuPlinc
         BGG01GRnvZbLXxc+xAuqk25/F6TNmhtrskNUUsjOou03d3pZP9wv8gv838BVNJ8+GQ3F
         Qgp6S4VYSbW73+emhaWEiIkc/GY4r+JNZP7+ItISz4v9u8Jp3bKPUzK//8mZMIE76WZr
         VEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725509; x=1758330309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5agMVhmWz9D3tLYyZnqIaP8gTBBboQ75Wn3D7w2vh+Q=;
        b=mIGtLIBmuRQemo88gL6snOwoXPVftiZLJzoQwGmsJ+F6PIp8GPqZonKL2QY3ofilCl
         FxfcW80lIMuyvx8QG3syUHS/mY0eMNpju64tp/33ImWvM3urkToXYMLz+pWcmGdEbcgm
         5ayf6DGM7MWN736/lqRzjq/agWfAK9tFTuJ7QzEUlvZlYFqbvN7GSSUcKGmhh1cbKdBe
         XTziriMJhlO0TOgb0m5R3XD4w9MNdm6I4TUhRrnc6w3xUhRQmc6m2LRonLdbbIfKb9ha
         PxTgqdBAXTxuDJGdg1ilV0tZ78cXBA6svS10UgtEDJ+AFVF/8cvW9KGAOXcCBpuzfvH2
         5y+A==
X-Forwarded-Encrypted: i=1; AJvYcCVcp8kxCF/8WwmylcFl/N55rinHwx+C31xapXBofPA0IAP5AqtkD8ZuwiVxdI3KoK/nPWHuupEqz+qvnIVpBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1JGy/LqLQtuF9eRytMEdgfhu85oBcZdsOWENO5KMzD0sb+MLP
	eRPxybv3IhCXG5qteSroqrE1/8U8V5UF90vyk8coCb6oQPk/UQOSmrjz
X-Gm-Gg: ASbGnctaQcoDQbUmwd57scxYUlssi29lY6a+sEJ31mM633tJ1RNpBQVQw4d3BhjrE8l
	oL3MM0BDmIYTWqW/eynlhk9CwWsijUELfswpaJA7US+oGrDhjQ0OBaJDCgWFvyGjjfpbKSjkY/x
	UWrMBrlUOAZfMuTpctOCzO62/MrPZGszmEAnt/53LAsQvvxMmR90buEfHaxTVzJfnwbcSpKRP3F
	fXaeay6hXNd77IEsRGOf4Wkl7cBL90b+CYUii6HNw0fSJJyHZ/GsItvOFfU1PGtZ9p09u+gekVh
	IyEWwCOgoASsMhyTL88QoHAOuOdRozmhsiw85UmK3kuX/3FlaKGeEigWJS9mrgq9MpRXBddLZ/n
	ozjf25W3n0bqYpZqUnlU=
X-Google-Smtp-Source: AGHT+IHBVL7U9njYQbYDntatJDbtYTvNiZyrYrp6F3Zot8CfKJXHpFfpfQfFxJfdQecWj/pXbevxCg==
X-Received: by 2002:a17:907:980a:b0:b04:7ea3:a10c with SMTP id a640c23a62f3a-b07c3551576mr448691266b.8.1757725509440;
        Fri, 12 Sep 2025 18:05:09 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b31291b0sm475372166b.34.2025.09.12.18.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:05:08 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 23/62] init: rename __initramfs_{start,size} to __builtin_initramfs_{start,size}
Date: Sat, 13 Sep 2025 00:38:02 +0000
Message-ID: <20250913003842.41944-24-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_020512_598260_14EFAF87 
X-CRM114-Status: GOOD (  15.17  )
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

Rename __initramfs_start to __builtin_initramfs_start and
__initramfs_size to __builtin_initramfs_size .

This is more clear

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/x86/tools/relocs.c           | 2 +-
 drivers/acpi/tables.c             | 4 ++--
 include/asm-generic/vmlinux.lds.h | 6 +++---
 include/linux/initrd.h            | 4 ++--
 init/initramfs.c                  | 4 +---
 usr/initramfs_data.S              | 4 ++--
 6 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index 5778bc498415..4b4e556f1b52 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -87,7 +87,7 @@ static const char * const	sym_regex_kernel[S_NSYMTYPES] = {
 	"__(start|stop)_notes|"
 	"__end_rodata|"
 	"__end_rodata_aligned|"
-	"__initramfs_start|"
+	"__builtin_initramfs_start|"
 	"(jiffies|jiffies_64)|"
 #if ELF_BITS == 64
 	"__end_rodata_hpage_align|"
diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index fa9bb8c8ce95..3160cb7dca00 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -429,8 +429,8 @@ void __init acpi_table_upgrade(void)
 	struct cpio_data file;
 
 	if (IS_ENABLED(CONFIG_ACPI_TABLE_OVERRIDE_VIA_BUILTIN_INITRD)) {
-		data = __initramfs_start;
-		size = __initramfs_size;
+		data = __builtin_initramfs_start;
+		size = __builtin_initramfs_size;
 	} else {
 		data = (void *)initrd_start;
 		size = initrd_end - initrd_start;
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index ae2d2359b79e..a6bd2ff46f7e 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -46,8 +46,8 @@
  * [_sdata, _edata] is the data section
  *
  * Some of the included output section have their own set of constants.
- * Examples are: [__initramfs_start, __initramfs_end] for initramfs and
- *               [__nosave_begin, __nosave_end] for the nosave data
+ * Examples are: [__builtin_initramfs_start, __builtin_initramfs_start + __builtin_initramfs_size]
+ * for initramfs and [__nosave_begin, __nosave_end] for the nosave data
  */
 
 #include <asm-generic/codetag.lds.h>
@@ -969,7 +969,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 #ifdef CONFIG_BLK_DEV_INITRD
 #define INIT_RAM_FS							\
 	. = ALIGN(4);							\
-	__initramfs_start = .;						\
+	__builtin_initramfs_start = .;						\
 	KEEP(*(.init.ramfs))						\
 	. = ALIGN(8);							\
 	KEEP(*(.init.ramfs.info))
diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index cc389ef1a738..e49c7166dbb3 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -21,8 +21,8 @@ static inline void wait_for_initramfs(void) {}
 extern phys_addr_t phys_initrd_start;
 extern unsigned long phys_initrd_size;
 
-extern char __initramfs_start[];
-extern unsigned long __initramfs_size;
+extern char __builtin_initramfs_start[];
+extern unsigned long __builtin_initramfs_size;
 
 void console_on_rootfs(void);
 
diff --git a/init/initramfs.c b/init/initramfs.c
index 850cb0de873e..2866d7a0afd7 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -597,8 +597,6 @@ static int __init initramfs_async_setup(char *str)
 }
 __setup("initramfs_async=", initramfs_async_setup);
 
-extern char __initramfs_start[];
-extern unsigned long __initramfs_size;
 #include <linux/initrd.h>
 #include <linux/kexec.h>
 
@@ -695,7 +693,7 @@ static inline bool kexec_free_initrd(void)
 static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 {
 	/* Load the built in initramfs */
-	char *err = unpack_to_rootfs(__initramfs_start, __initramfs_size);
+	char *err = unpack_to_rootfs(__builtin_initramfs_start, __builtin_initramfs_size);
 	if (err)
 		panic_show_mem("%s", err); /* Failed to decompress INTERNAL initramfs */
 
diff --git a/usr/initramfs_data.S b/usr/initramfs_data.S
index cd67edc38797..64ca648a80e2 100644
--- a/usr/initramfs_data.S
+++ b/usr/initramfs_data.S
@@ -27,8 +27,8 @@ __irf_start:
 .incbin "usr/initramfs_inc_data"
 __irf_end:
 .section .init.ramfs.info,"a"
-.globl __initramfs_size
-__initramfs_size:
+.globl __builtin_initramfs_size
+__builtin_initramfs_size:
 #ifdef CONFIG_64BIT
 	.quad __irf_end - __irf_start
 #else
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
