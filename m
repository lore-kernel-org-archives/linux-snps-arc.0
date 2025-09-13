Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5ECCAC582
	for <linux-snps-arc@archiver.kernel.org>; Sat, 13 Sep 2025 00:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ASL7mBI2upyUUWHFW9TD0FMuNSimrYEpclrfxWBnWg=; b=xYdhqmQ//sPrjp
	uj8DsJf1bCXgvqdaHs71QXAM6no2GayIuiaFKcu4nBaveVa+Sy+8PVBnuIYykWDaEqVnNvQKTmAPE
	5r4JplnIXnogaAgIFfc2Sw7/s0PIoQTHvcQ7dzK6WBsfu13TAgmeY1kQsRYQitrBt+RA6ZB5b79m4
	2xY9G2mS37jNdsn1PxDM/Ti3RD66ciDo5Yl/HSFXBpJFqk1O4Y14B3oUI9mLw6AtOh+KWTEWXLgn/
	II/mTeIfAd7nNZXvpYF7X37bo3YvjhfC/ds5RX0QBf3mw7VEITGYRiFImWSYtIUfJjcKdtxwUEWh8
	ghN27PeOui0rKcLDYDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEPX-0000000COMr-10Qc;
	Sat, 13 Sep 2025 00:46:39 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEPT-0000000COKf-3Wa1
	for linux-snps-arc@lists.infradead.org;
	Sat, 13 Sep 2025 00:46:37 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b00a9989633so461778466b.0
        for <linux-snps-arc@lists.infradead.org>; Fri, 12 Sep 2025 17:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724394; x=1758329194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y83Wia04Z/mNTHCUGozzAt26nJVQ29vmo/6z8Jb/IIM=;
        b=MTS+QMJ7RiNE5+CTT4/kdIlIkxU6YcpNGkDGwEaXGncCyZ7HaEwYku7cQKwJ5MNAua
         hBlzOPY4S9uIF4SZXt6dequJ08RQPGfl+c1QyoaVhgHZLJDArQziDiERAKTSlO9cOcEb
         eQMRrbazldybJXM1e4CA1EUnjA/w+X+ymvSEAQloIMKfO/TBRdjAoPspcGwIXCHHXXB0
         +8dkJwG8vYXZoAyygApoWWry7Fi58CzTEl024Wyl9k+iM/jsi1W45/0Qys5iBxXnMGdo
         JIuk53C32Qk/IpZFlnhbkPEUMRgCnIGWqXqWulilArgz18oEaZh5gNcHH61Y7pipAZc8
         kfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724394; x=1758329194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y83Wia04Z/mNTHCUGozzAt26nJVQ29vmo/6z8Jb/IIM=;
        b=BpuT/h9iKykEkUmRrVNgFQjcGDudRZFdNF/19ZDdJGzJdgHNlh2drvI5ZYC8LVzkhp
         cJB8eaLKgeT8lrAcPKTRNmPkrj2zHgGLS3mNkh9k//Z2vX5xVPL3pEnGsP7v9bElbndM
         p8Xb4HlU300gj2WUN4/Xn0fST4BhN201hPnVUjYS1qfmNRWcindshShLJe8546xV5TQz
         OBkCgtsmBg7bMKPtI2LBqhuXG8s4/S4MN02PtO8uY9UMxlkrJlgnsOwKGF1DJzKRgITd
         3GzqkuDjPi10iAiLhANnBf9XLx/hHfJNJt3Ki75kUkda2Z1mHw/NtMUJolFvFGR73lJA
         LjMg==
X-Forwarded-Encrypted: i=1; AJvYcCVKvMRGweN48x1oLJ9f9y9S1diLC0im25G9VwvItKP24+LVvSyTAV/eROZFijqKoMTJvxiGk2crphKvuVkB5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJLnL+KXETwfYyJ2Fp0dZmuyu2sC5vR/VNgHywhDfcls9hoeAu
	i6dwV/mT4MeQbL8Z9MZOGYPaRNXwOhXIez8ssMAeKp5hQtoC//ObkM+y
X-Gm-Gg: ASbGnctVuKhx73cYrIw1do63IPsF9LDRlCly7Amxx/1Rdyl1u/4GoS2LkVTR2qUwDQj
	syUwMo6qQj/oNS27grQ/en6fL09q3+IibAknOVp9cFkFq4MpFsIMdVUa7doO3BSVYh7OTopS03f
	xnkJE5HQSLoB9VIS8+1/FYY4+g3QFkchP9HR1T5PEnwMzNlbs1QiXp+UDyQj5Cz3UVj+OLJLjiD
	vrMJvHgju5/Lj1Hkv/qoCWgxmvek8zcXFM8NPhtdfWn04iSfK10xSir96qVOMSJTOptucrJ5UmY
	icsWv7yjJaokaxLazJRKeqBBuGZvkR9zMoEkIiRQg/l/Tzj7GiPNFktowbiskBF8DY3b8MYgsMA
	x+goNv+TA8q/kiU6zHNI=
X-Google-Smtp-Source: AGHT+IEhRE4IwIn6e21II3sG+AWhFOewnNElGtSUdTtt48+B8a0G24fjikoaCpJ97iRLzEKC56BiAg==
X-Received: by 2002:a17:907:96a3:b0:b07:e258:4629 with SMTP id a640c23a62f3a-b07e2584a05mr103605766b.16.1757724393999;
        Fri, 12 Sep 2025 17:46:33 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32f2334sm475232966b.78.2025.09.12.17.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:46:33 -0700 (PDT)
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
Subject: [PATCH RESEND 06/62] arm: init: remove special logic for setting brd.rd_size
Date: Sat, 13 Sep 2025 00:37:45 +0000
Message-ID: <20250913003842.41944-7-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_174635_905621_C5676F71 
X-CRM114-Status: GOOD (  13.55  )
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

There is no any reason for having special mechanism
for setting ramdisk size.

Also this allows us to change rd_size variable to static

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/arm/kernel/atags_parse.c | 12 ------------
 drivers/block/brd.c           |  8 ++++----
 include/linux/initrd.h        |  3 ---
 3 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/arch/arm/kernel/atags_parse.c b/arch/arm/kernel/atags_parse.c
index a3f0a4f84e04..615d9e83c9b5 100644
--- a/arch/arm/kernel/atags_parse.c
+++ b/arch/arm/kernel/atags_parse.c
@@ -87,18 +87,6 @@ static int __init parse_tag_videotext(const struct tag *tag)
 __tagtable(ATAG_VIDEOTEXT, parse_tag_videotext);
 #endif
 
-#ifdef CONFIG_BLK_DEV_RAM
-static int __init parse_tag_ramdisk(const struct tag *tag)
-{
-	if (tag->u.ramdisk.size)
-		rd_size = tag->u.ramdisk.size;
-
-	return 0;
-}
-
-__tagtable(ATAG_RAMDISK, parse_tag_ramdisk);
-#endif
-
 static int __init parse_tag_serialnr(const struct tag *tag)
 {
 	system_serial_low = tag->u.serialnr.low;
diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index 0c2eabe14af3..72f02d2b8a99 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -27,6 +27,10 @@
 
 #include <linux/uaccess.h>
 
+static unsigned long rd_size = CONFIG_BLK_DEV_RAM_SIZE;
+module_param(rd_size, ulong, 0444);
+MODULE_PARM_DESC(rd_size, "Size of each RAM disk in kbytes.");
+
 /*
  * Each block ramdisk device has a xarray brd_pages of pages that stores
  * the pages containing the block device's contents.
@@ -209,10 +213,6 @@ static int rd_nr = CONFIG_BLK_DEV_RAM_COUNT;
 module_param(rd_nr, int, 0444);
 MODULE_PARM_DESC(rd_nr, "Maximum number of brd devices");
 
-unsigned long rd_size = CONFIG_BLK_DEV_RAM_SIZE;
-module_param(rd_size, ulong, 0444);
-MODULE_PARM_DESC(rd_size, "Size of each RAM disk in kbytes.");
-
 static int max_part = 1;
 module_param(max_part, int, 0444);
 MODULE_PARM_DESC(max_part, "Num Minors to reserve between devices");
diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index 6320a9cb6686..b42235c21444 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -5,9 +5,6 @@
 
 #define INITRD_MINOR 250 /* shouldn't collide with /dev/ram* too soon ... */
 
-/* size of a single RAM disk */
-extern unsigned long rd_size;
-
 /* 1 if it is not an error if initrd_start < memory_start */
 extern int initrd_below_start_ok;
 
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
