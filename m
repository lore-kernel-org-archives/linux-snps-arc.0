Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F090CA101F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 13 Sep 2025 00:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dutGhs2+QC2jQFS+KPySLWw1DCxFEXhGDmaxxmuyx2c=; b=HgXUZ7o+aAZ+kt
	ldKt1Ht3IObZfj8ghmDaZq3vxxiEbf83/QAYhRtuIknJkPqw2etiM7RQSVI5TAqLZyFuZgNNf9fk2
	vXqSxCt8pIkdVguHClFQ0H7O29Pt3Nyt/6ZW1KqMy/OzBc5V9E/nDlzxao+vFMQQALB37bqjyown5
	ecXsOiUNVGRnTDp6sajcFtxsc5Jz/OOBQl92b5A/21zQ/IHO8PDS+Xp/41Udp4HmpmjfNU/c63v8L
	WjbWh6UOHvu3L0XEsvbbMyqDngIkm+hrOaE1fl2Z1rrj7ZJTmZRbYO7XTJmJvanUw7M3+84YkwfEK
	iEDC68pGm0txutqWbJnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEKH-0000000CM5f-0odR;
	Sat, 13 Sep 2025 00:41:13 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEKD-0000000CM2K-22hQ
	for linux-snps-arc@lists.infradead.org;
	Sat, 13 Sep 2025 00:41:11 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-62f0bf564e4so144754a12.3
        for <linux-snps-arc@lists.infradead.org>; Fri, 12 Sep 2025 17:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724067; x=1758328867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XF39SoyvPO4HSizOmVkN9E4c/OCzbmGR6ZiNtCSz3R4=;
        b=jgHBWjTBpR9ofd9bjTmn8WznQPYetX9glgjv0eovzP8pIV5L1SJh+QFSE4Nh4bMgBA
         pdlu4txxBYbosriEcbK8iv3IrUH0+rgbphaOSjGZ2FsU4iHLPrV3Zvc/ldthTPotXulm
         ohw7nX1HVahV0GGRtokMxW0/v75qvfNrJ8G2K4CBjWWDtxA+X9NhyIDiQMyusORka795
         l03t+AyBxeQMTyRCIQI9GWWydhEaJHR5NcmD43KU+ciPW669VFqjIGfoxgBbInz3gYke
         Ober4BIGtHxeRITvQHl1gbNnaRNMpH2Dxb/Nj95cakW/LP02EPYliclBMtJHNjnS7ldE
         /m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724067; x=1758328867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XF39SoyvPO4HSizOmVkN9E4c/OCzbmGR6ZiNtCSz3R4=;
        b=BlqGTH6ytwQWAh7LcKb3iuzeH+0Xll8j7WBLkXw5hggcIVy6UHmnhqgev1yE3a825a
         PxroxcbupM5ntnvQrPJ6a9Lajyc1x0aTtQA2KYoulz7VieSaM3PVtrPcYExyQfFZ0n8R
         VoCYljO0Yrx46EUrCsrLe4WsiI6v/gR8dkL5jhX1UbljWOCMF99x97B6mH25R6K+VNKY
         Vx1L5reS3dbEr1iIWMQDC51DgA98kNPIBlthXWchud9OFDVw20mhDoMdvDX3GAD6bmLC
         jVqa8WF9bxFtZhrotvabF7TrbdN97f6bX4HOM5n8q42Jt3T+vKuOZL0J6bOQ29jYng0v
         YGNg==
X-Forwarded-Encrypted: i=1; AJvYcCVYZD7DGdm5usxiRcN+uhOifRu74a2ua/3q1og3OI0e0QgvDE1TsEKBdY5H2S710PQ1Q4OX56ZbQMQ3sKcZBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqsIZGVE2/Dnm7Fybz2Ovx53kv1dzR+PsKKPAyhuu4BdSFuXY7
	SCkTUEpXPuDkazpI9MuTS70gS1zwhgC3ATmXezrgi5+3Lm1IxW11qsby
X-Gm-Gg: ASbGncttDp9Xagg1fi/r56k4vfoqvH0dQf8U95y5yqJqctK2eNIe3vJEkyAniPLnRoy
	bclqRajhOLpYbrRl0YqEQogS5dG2fUKwLaTo3zwZt7e4rkW5Gd3blZ8nP1xDdYpgwnVnAtIZsmJ
	KilNg7kiCVfB8KPLa41cPu6Tv3A6BJiCSFZRjCHZ6oPu6cccdL3uqvKusXU+yI8fH2Uv3TuhnRR
	fZeAuqIJ+SLzPp05/fWmgOuLRNz6QsvBOBfYeY/DYmWkrBpzBIsFfdZ8uD1pBsFbw/WRIoW8lHI
	iZjKbilHHQVC4w6S3DRz7Hi+Jr2Y9JC43Ybr7AFuKq8K3+sR8mxPVLdClb87dJd1j/tv4ZLv88c
	MXUYuJmgr9INounF083zAOfNefTv50Nmxeg/oUXUb
X-Google-Smtp-Source: AGHT+IEtE+sLJ/l9Jfm7JaiF1fYpyMVV9PhBGBMQ2H0UV0Mi6JbllI7aH7Kqq18B0Ua9aQ0IxOB0Jg==
X-Received: by 2002:a05:6402:3552:b0:62e:ed2f:a660 with SMTP id 4fb4d7f45d1cf-62eed2fa993mr2339876a12.11.1757724067127;
        Fri, 12 Sep 2025 17:41:07 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62f0c7a5546sm189920a12.43.2025.09.12.17.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:41:06 -0700 (PDT)
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
Subject: [PATCH RESEND 01/62] init: remove deprecated "load_ramdisk" command line parameter, which does nothing
Date: Sat, 13 Sep 2025 00:37:40 +0000
Message-ID: <20250913003842.41944-2-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_174109_567103_62825732 
X-CRM114-Status: GOOD (  11.05  )
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

This is preparation for initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 arch/arm/configs/neponset_defconfig             | 2 +-
 init/do_mounts.c                                | 7 -------
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 747a55abf494..d3b05ce249ff 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3275,8 +3275,6 @@
 			If there are multiple matching configurations changing
 			the same attribute, the last one is used.
 
-	load_ramdisk=	[RAM] [Deprecated]
-
 	lockd.nlm_grace_period=P  [NFS] Assign grace period.
 			Format: <integer>
 
diff --git a/arch/arm/configs/neponset_defconfig b/arch/arm/configs/neponset_defconfig
index 2227f86100ad..16f7300239da 100644
--- a/arch/arm/configs/neponset_defconfig
+++ b/arch/arm/configs/neponset_defconfig
@@ -9,7 +9,7 @@ CONFIG_ASSABET_NEPONSET=y
 CONFIG_ZBOOT_ROM_TEXT=0x80000
 CONFIG_ZBOOT_ROM_BSS=0xc1000000
 CONFIG_ZBOOT_ROM=y
-CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) load_ramdisk=1 prompt_ramdisk=0 mem=32M noinitrd initrd=0xc0800000,3M"
+CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) prompt_ramdisk=0 mem=32M noinitrd initrd=0xc0800000,3M"
 CONFIG_FPE_NWFPE=y
 CONFIG_PM=y
 CONFIG_MODULES=y
diff --git a/init/do_mounts.c b/init/do_mounts.c
index 6af29da8889e..0f2f44e6250c 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -34,13 +34,6 @@ static int root_wait;
 
 dev_t ROOT_DEV;
 
-static int __init load_ramdisk(char *str)
-{
-	pr_warn("ignoring the deprecated load_ramdisk= option\n");
-	return 1;
-}
-__setup("load_ramdisk=", load_ramdisk);
-
 static int __init readonly(char *str)
 {
 	if (*str)
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
