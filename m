Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE31CAC58F
	for <linux-snps-arc@archiver.kernel.org>; Sun, 14 Sep 2025 04:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6rLZRjegWxBXoOuhuGbNqmGYg9Dr82rTFz/wVrfjQM=; b=37HMhV1UOQOqtp
	iICrniA95WZDjkMsaDIBfB4cWHlLI4kfj6IryUdq6AO88nixGUzhX0ttPZm1Ha/A16atwuiao/ZOg
	cAce7lqvL8hEnJnVZ9slyIMBCGA7W4COXKybI3SUniA3RaxKAwLjoBulKQ4emKEx/+4q5KLR8SeYq
	keGU6GL/Gci3MBsiyVOq/3pEcHxJK1SrfPrIz3AyrQZcAZf5viMvl23CLZo19/3AT5QP8aMg508Uu
	26RHdmOUctwHjQyLC8lVavkpcGnIkr3aD5vGaRFhtwidIho8SrldksHzJUYlQv6RsavhFNriV8rmt
	eI5wsZPFoQfrUfSayrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdwE-0000000HQwv-0rzG;
	Sun, 14 Sep 2025 04:02:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdwC-0000000HQuQ-1waZ
	for linux-snps-arc@bombadil.infradead.org;
	Sun, 14 Sep 2025 04:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fGq2rj18j5nvFWvHRh616vM6JteMHLrszS02ds4tBLs=; b=B61QUvvr0fXzH6BO5GZVPuFCEa
	4IZCYy9ubrFwEsx2LnLMtvn7xJjlQQ6uDl6CfIc8y+SM5BcZFxbJt3HU0Xd6yfR0FlVcBTiNeZ93G
	HgqjeVVNkLjaBo/EaHEwPDaX/ebEoIzdMSFE3ZmAjcDPlsfU50fJPwCtvI41bfbHlxQM/KMganubG
	u9HqwkfIMWeZNG2OnrfTjOoxY6IGGQF3CkUfpT4oVsu5yLz1RPcmOUaeklphVBu28acR7iCd2XKsN
	T3Oz8FE1B6r6j6tr1fT2+rQivsgesWRRxit4Fq3aZA+dHOiaXA9ywh+shPcrIlsB12g+OosNhsM/C
	ivh9IwMg==;
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdw6-00000006ibv-3Fev
	for linux-snps-arc@lists.infradead.org;
	Sun, 14 Sep 2025 04:02:02 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so5971951a12.3
        for <linux-snps-arc@lists.infradead.org>; Sat, 13 Sep 2025 21:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822517; x=1758427317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGq2rj18j5nvFWvHRh616vM6JteMHLrszS02ds4tBLs=;
        b=Ho7ZsbQDDCQJU4KY7LpBH+HWeDWimKotbmViPpylsaJyGLrs4z/dXJkXxCGXErvBCc
         mg1irRsOpwA00XgunWuKowtalTgJrdy9ZzYI7HzyZyS8n0EqdNJyRzh81Tws1fzsOMAQ
         OqHOZlpvoaAqfd9vhcOo45EFKt/uSIIcS5Per2xiU8vE7roA0l5G1/F9HtLHmmK1oV6o
         sBUVZhQ6JgEfX2cANbLiahhkmrqS9suYvnyt9pFGz5tTz9SWyuz+PudODE8OByVOvlmH
         IsCAksW1suQnD/4l6Kqh1gfllpwpYTzLNHYIvJwe7FGQC1Y1WsolNkhVwXYDcUh0rtFD
         eQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822517; x=1758427317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGq2rj18j5nvFWvHRh616vM6JteMHLrszS02ds4tBLs=;
        b=mfjW4g5Lp05uoEEXp3AeOTu390P5bucjYmeVzMH4KzD19mIoFY6+mRQFKd8i+wU8+1
         hofWn/DRz0F/1ZSlShi6J0m0iKQ85RI0Syjy9JpP/HGCROOUvX8+fhxhpVksL4TZpeFO
         Sct+TiM+SW7sVNOcCxqyZVBjuT0NjsC0MsUVgUd+cPiT0DeI9jyUB6SMuKbFXxeaTdMH
         bOFotGwkrqzJfN0IkI+MoxZv1c4lD+ut+RvrFuKwNUuVAYCjFsHUVOfhdOKSkKgeCGRT
         iHYL30vUUmDoPQOp6NlyQWZm7PsaOPpQaZ8zp3hjR5Wem8DAddj/tvKvSmoZwSpuJR3Z
         8rsA==
X-Forwarded-Encrypted: i=1; AJvYcCWagjay524WHbQ54V+xSU/C4VKStMUizgMp5WhRenW4Elvtillylq514unazd5wwxOKIuJCKaSUlsSPjiU7Jg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbUACoZAplfp5HvxdnOgVmfzL+XlN0HjRH/jGEch59HxhWmSNN
	nsYGOkisuAdngaaJ5ob6orrk5Rdo9Y1hjQ28YYNy6U+zYNE/E6gyoUc4
X-Gm-Gg: ASbGncvGKgkdpgia1MKhgf5uqLf81+p0/iJ4m1N3nFE+xIP2I8LFS4ReVFCa/rUROsS
	Xgup1+kbB+k3hSmMLx0hUYtkkXNqKZ8wNzWmRB5IxgHTTspppxcLlzghpQFNvbCEbppWRggjKIu
	LPINAeJaTBYccHF9ihWiocZnczIHfEjAecYpSGQdmTD5cxwoUdtR6xuvFwuTtVb26xxfuwpelPi
	N8qouwiCefeHsIXiqRKD7/weDeqKZTyHce88Hk/wW8EUxAzU2NfFJfbN23P0LHE+oOrdAb4hv8j
	TgyTwv810hS17AJD41AUlZc6znhHqlIfVoOWZwhy6dUj2A6KUgCZBRJp41B6Hz2RziEGXKoM7c9
	piamVc941dO+jlMPeuAA=
X-Google-Smtp-Source: AGHT+IHGppk9Eg00mRFWKY3oyWZDORImAaUMiStm5q/vVvxsBauDUIDKfxmQ2agdiwYo6nbnpX+hpA==
X-Received: by 2002:a05:6402:3587:b0:62f:2ac2:af41 with SMTP id 4fb4d7f45d1cf-62f2ac2b11amr1102107a12.38.1757822517371;
        Sat, 13 Sep 2025 21:01:57 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec2e661a5sm6322050a12.0.2025.09.13.21.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:01:56 -0700 (PDT)
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
Subject: [PATCH RESEND 57/62] init: rename CONFIG_RD_BZIP2 to CONFIG_INITRAMFS_DECOMPRESS_BZIP2
Date: Sun, 14 Sep 2025 07:01:51 +0300
Message-ID: <20250914040151.3805905-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_050200_031353_366AC014 
X-CRM114-Status: GOOD (  13.05  )
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

Initrd support was removed,
and CONFIG_RD_BZIP2 has nothing to do with ramdisks.

Update your configs

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/arm/configs/aspeed_g4_defconfig       | 2 +-
 arch/arm/configs/aspeed_g5_defconfig       | 2 +-
 arch/arm/configs/lpc18xx_defconfig         | 2 +-
 arch/arm/configs/sp7021_defconfig          | 2 +-
 arch/arm/configs/vf610m4_defconfig         | 2 +-
 arch/mips/configs/ath25_defconfig          | 2 +-
 arch/mips/configs/bmips_stb_defconfig      | 2 +-
 arch/openrisc/configs/simple_smp_defconfig | 2 +-
 arch/powerpc/configs/skiroot_defconfig     | 2 +-
 arch/riscv/configs/nommu_k210_defconfig    | 2 +-
 arch/riscv/configs/nommu_virt_defconfig    | 2 +-
 arch/sh/configs/sdk7786_defconfig          | 2 +-
 arch/xtensa/configs/cadence_csp_defconfig  | 2 +-
 arch/xtensa/configs/nommu_kc705_defconfig  | 2 +-
 usr/Kconfig                                | 4 ++--
 15 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index f2abada5036a..af891a2b2d6c 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -9,7 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 CONFIG_CGROUPS=y
 CONFIG_NAMESPACES=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 CONFIG_EXPERT=y
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 7098a09fefb8..a16aed0abcaa 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -9,7 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 CONFIG_CGROUPS=y
 CONFIG_NAMESPACES=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 CONFIG_EXPERT=y
diff --git a/arch/arm/configs/lpc18xx_defconfig b/arch/arm/configs/lpc18xx_defconfig
index c8f7fa140225..abde171f1742 100644
--- a/arch/arm/configs/lpc18xx_defconfig
+++ b/arch/arm/configs/lpc18xx_defconfig
@@ -1,7 +1,7 @@
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
index 30cfafc49ec9..4f5cd0d0511d 100644
--- a/arch/arm/configs/sp7021_defconfig
+++ b/arch/arm/configs/sp7021_defconfig
@@ -6,7 +6,7 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/arm/configs/vf610m4_defconfig b/arch/arm/configs/vf610m4_defconfig
index b253d76e0d40..9e6175467998 100644
--- a/arch/arm/configs/vf610m4_defconfig
+++ b/arch/arm/configs/vf610m4_defconfig
@@ -1,6 +1,6 @@
 CONFIG_NAMESPACES=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZ4 is not set
diff --git a/arch/mips/configs/ath25_defconfig b/arch/mips/configs/ath25_defconfig
index 58ae5f9726a0..7c1ec18b0eeb 100644
--- a/arch/mips/configs/ath25_defconfig
+++ b/arch/mips/configs/ath25_defconfig
@@ -4,7 +4,7 @@ CONFIG_SYSVIPC=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
diff --git a/arch/mips/configs/bmips_stb_defconfig b/arch/mips/configs/bmips_stb_defconfig
index 2217a3ca5b72..6ccb53279345 100644
--- a/arch/mips/configs/bmips_stb_defconfig
+++ b/arch/mips/configs/bmips_stb_defconfig
@@ -15,7 +15,7 @@ CONFIG_NR_CPUS=4
 # CONFIG_SECCOMP is not set
 CONFIG_MIPS_O32_FP64_SUPPORT=y
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 CONFIG_RD_XZ=y
 # CONFIG_RD_LZO is not set
diff --git a/arch/openrisc/configs/simple_smp_defconfig b/arch/openrisc/configs/simple_smp_defconfig
index e4aaaeaec7a8..ba6f06c29fed 100644
--- a/arch/openrisc/configs/simple_smp_defconfig
+++ b/arch/openrisc/configs/simple_smp_defconfig
@@ -3,7 +3,7 @@ CONFIG_NO_HZ=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 9a6ef1d8ca44..a5b30aba9ac1 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -11,7 +11,7 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=20
 CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index a1fa77563bb8..bc0df803ecaa 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -2,7 +2,7 @@
 CONFIG_LOG_BUF_SHIFT=13
 CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
index d777e4a774bd..1291e21b7ce5 100644
--- a/arch/riscv/configs/nommu_virt_defconfig
+++ b/arch/riscv/configs/nommu_virt_defconfig
@@ -1,7 +1,7 @@
 # CONFIG_CPU_ISOLATION is not set
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_INITRAMFS=y
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/sh/configs/sdk7786_defconfig b/arch/sh/configs/sdk7786_defconfig
index dd0ef63a0064..2c339b2111fe 100644
--- a/arch/sh/configs/sdk7786_defconfig
+++ b/arch/sh/configs/sdk7786_defconfig
@@ -27,7 +27,7 @@ CONFIG_USER_NS=y
 CONFIG_PID_NS=y
 CONFIG_NET_NS=y
 CONFIG_INITRAMFS=y
-CONFIG_RD_BZIP2=y
+CONFIG_INITRAMFS_DECOMPRESS_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
 # CONFIG_COMPAT_BRK is not set
diff --git a/arch/xtensa/configs/cadence_csp_defconfig b/arch/xtensa/configs/cadence_csp_defconfig
index 788274247b03..06d82e725e64 100644
--- a/arch/xtensa/configs/cadence_csp_defconfig
+++ b/arch/xtensa/configs/cadence_csp_defconfig
@@ -14,7 +14,7 @@ CONFIG_SCHED_AUTOGROUP=y
 CONFIG_RELAY=y
 CONFIG_INITRAMFS=y
 CONFIG_INITRAMFS_SOURCE="$$KERNEL_INITRAMFS_SOURCE"
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/xtensa/configs/nommu_kc705_defconfig b/arch/xtensa/configs/nommu_kc705_defconfig
index 5050b3e5e1be..cde2ae3ca4b1 100644
--- a/arch/xtensa/configs/nommu_kc705_defconfig
+++ b/arch/xtensa/configs/nommu_kc705_defconfig
@@ -15,7 +15,7 @@ CONFIG_NAMESPACES=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_RELAY=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/usr/Kconfig b/usr/Kconfig
index cf3c7539e3dc..325c2d95eb74 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -60,7 +60,7 @@ config INITRAMFS_DECOMPRESS_GZIP
 	  Support loading of a gzip encoded initial ramfs.
 	  If unsure, say Y.
 
-config RD_BZIP2
+config INITRAMFS_DECOMPRESS_BZIP2
 	bool "Support initial ramfs compressed using bzip2"
 	default y
 	select DECOMPRESS_BZIP2
@@ -144,7 +144,7 @@ config INITRAMFS_COMPRESSION_GZIP
 
 config INITRAMFS_COMPRESSION_BZIP2
 	bool "Bzip2"
-	depends on RD_BZIP2
+	depends on INITRAMFS_DECOMPRESS_BZIP2
 	help
 	  It's compression ratio and speed is intermediate. Decompression speed
 	  is slowest among the choices. The initramfs size is about 10% smaller
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
