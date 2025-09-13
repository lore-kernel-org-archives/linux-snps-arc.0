Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5739CAC582
	for <linux-snps-arc@archiver.kernel.org>; Sat, 13 Sep 2025 01:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaxZwFdU+E/5o0o0750W7VDdgVM+mVWVJlg0sDDYYh4=; b=TrYEksnXeJht2x
	nWXSrTOT4upaUFCqK6ZbjWtJmrCsoDlFzkgyRCSI2B8xXwUFr8pf0CdNxMVEHfd1M39FyczNj94ZX
	oBtciz0MnYJA3fNtbv7/FQOiarQLzgeEyplMHbk3XwNxC4WjvmR4Cy4OgaW0Lmz5baxLQFrMo1bI/
	YrKMP5zomAx5Dk/ZoBdUVzH8gbhCl/xRM8CB0vLg+OD8OAiglHsF2Kkgz3zZyYFU+T0I5TQqHHKYu
	KNdM8xHFrL+cIWKjxfKIo4I9CLStEWmkapnrK4/RllXq5wNgpfZnEwM5AfmVkpEf3Ppbg6RqJl4a8
	+Ma68Ytp9dslNrKxXTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEdK-0000000CTnS-20cz;
	Sat, 13 Sep 2025 01:00:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEdJ-0000000CTls-05qg
	for linux-snps-arc@bombadil.infradead.org;
	Sat, 13 Sep 2025 01:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XoEWD/ShpnwzaQ8ORuPz9c0ALO6Ls67XcNa7R8iqlGI=; b=qKIClnSiu5TgFcn2jdBJ/wLrXC
	25xPNFzXJRvdLdyg/GU0K0+o6JA00szNpHgpXYJgsS4ypGLOg9HGxIT+pFoGIscIDuya1OlsKWcLW
	NoJ3e4HsM8w+nyEoMJQMUow8sMd7LzEhAiHKYBLS/Alla7/ZDfFrcdKAbGvCfCubKD3s6dWvleZ/N
	fL3zb3wMlAR8OzGgazGeGGFMMZPxIafvYY6vr8InF6V5zWK5oh2KgAbEk9JeXtIzSX4zr+yi7VVuC
	DaVa6CS/G0rMYZTBcgGQRQzR5xXJsZVQ9myxr2KSo3XY0Pyj+m1JK+cRrmWq05GnTv4m0mlmawloA
	1vfo8rWA==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEdD-00000006VaG-2JOZ
	for linux-snps-arc@lists.infradead.org;
	Sat, 13 Sep 2025 01:00:51 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b02c719a117so429256366b.1
        for <linux-snps-arc@lists.infradead.org>; Fri, 12 Sep 2025 18:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725246; x=1758330046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoEWD/ShpnwzaQ8ORuPz9c0ALO6Ls67XcNa7R8iqlGI=;
        b=Pih4sN4fDt9osXksUnfVugqpzSYw0DFJUFffB6cT+FYDRNIJlfCfD5AQJS8NqHORkI
         ug4kOsoh7Ibwe338rwO0B+iMHm7SQfLHaYVMGxmFWgxY3xpep+goHb9l/1mJ86KaOUMS
         TbIYrH01+pTzFrq+9CeFgR+3DPQpu9D1qv79DNNtx6zRp6iWrNNDDbOhEXfJGv3KWcSu
         D9Jhz6T78on4F44MRk//BfDNmwvsI7buudBOYjWsi5N5Jv2MIM1stc3pL0evsOq495f9
         8l7AJLi7zpioGME+FHUX/Lrv3I0A3eoTdHjOKOYR1/lXmjBye3T8/4C3vTVjgoGYdyCh
         9mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725246; x=1758330046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoEWD/ShpnwzaQ8ORuPz9c0ALO6Ls67XcNa7R8iqlGI=;
        b=hUMTlniB5+PeaLytZvhcD7NH8eMXUMsDdhkscY55SdIOqBH9QgBkzQDX9rCplB7Bo3
         P2gxMQDPYDW/byHK+G7NvurXUjSbX+ebf0zTzcYSbJTGND96yFsYP2KYQ5W2QpjzsPlJ
         wRpIixHxB5SJ02oLxHMVEGomc3Qy5J+WAB/KSNGhMveW/OTjpgAq9F8oYaBkQ2ORDwb5
         8G6NEco+RST4BMG2LNI+VLXynaEZBe/bOombPQxSuDRfwryycXge4IDTQ+Zm2lRRGhZA
         zd8LLO6EbxYtCHMVJCnLNnqKFyX4OhOpKGUQUJZtP3ZH9EvAqkqBofo/HZJS4MK7kGbL
         vjJw==
X-Forwarded-Encrypted: i=1; AJvYcCX/jmMNTKMquOxzFSQh17fQAO+h3+UJi/bki/38mzRU8+PnEr5Kh3z7Fbu/t5tZ06mO4Zdh3k7DFOX+8Ly9XA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRNnKxWmhV/kYsKTP/80acmyreCoh9oxf6iZIv+1z7Y+QYd2OJ
	VhB1e/7re8OqW2PTtTEB6WgMv9xo3ILoMD+sO7X+V3R944v9hRkG1Sbd
X-Gm-Gg: ASbGncufRiEsL0LHs6R2C4xPpJlXO8dyr8FRCOUsX0v1Cx68HFQ+jOtnopVVKExv98A
	RnUCmExH4oeCj/0OeKcllxMIZWWHG/NFqAMdHb0Hzjwnlxoz4u/w+VjH8NWJ04qeYq6I6K9mmVy
	3XbLkzSReDOg5bdNMnDk5rZdBoRcRT8BvSoF9WBZJNlU5vNObOU8CNwbXuHB7FPg1edp3YNsNnF
	2+kZ8VXQzxmFx29wDV5Om+kNdKOqM0GoVZH68GmrsBv9VZ1QrAW/C/pdLdXGepeqfskDZmPFZVw
	q9yBDc+MEp54PDlh2fq0eFzrkOUMOwQxyZHuyMzH7RUTzzN9ruqvM1INlELxZrs+GTwq3eUqgXp
	50qAeKLWxm6iu84G8jZQm2HukxJ3jWQ==
X-Google-Smtp-Source: AGHT+IFN5sGx8Mx9m2aD2jbl3cQxyHXmx0LPyYapXdwnUwhP9+XvMT+8Mvs3QRhc/UxXrnFX4WIsYg==
X-Received: by 2002:a17:907:daa:b0:b04:7232:3e97 with SMTP id a640c23a62f3a-b07c357507cmr467580066b.21.1757725245716;
        Fri, 12 Sep 2025 18:00:45 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dcf77sm470822766b.64.2025.09.12.18.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:00:45 -0700 (PDT)
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
Subject: [PATCH RESEND 19/62] init: remove mentions of "ramdisk=" command line parameter
Date: Sat, 13 Sep 2025 00:37:58 +0000
Message-ID: <20250913003842.41944-20-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_020048_052811_2670FADB 
X-CRM114-Status: GOOD (  13.33  )
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

It is already removed

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4210-origen.dts   | 2 +-
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts | 2 +-
 arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts | 2 +-
 arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts | 2 +-
 arch/arm/configs/exynos_defconfig                 | 2 +-
 arch/arm/configs/s5pv210_defconfig                | 2 +-
 drivers/block/Kconfig                             | 1 -
 7 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-origen.dts b/arch/arm/boot/dts/samsung/exynos4210-origen.dts
index f1927ca15e08..4dcf794bd18b 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-origen.dts
@@ -36,7 +36,7 @@ aliases {
 	};
 
 	chosen {
-		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M init=/linuxrc";
+		bootargs = "root=/dev/ram0 rw initrd=0x41000000,8M init=/linuxrc";
 		stdout-path = "serial2:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
index 18f4f494093b..4cdeddeff3fc 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
@@ -30,7 +30,7 @@ aliases {
 	};
 
 	chosen {
-		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M init=/linuxrc";
+		bootargs = "root=/dev/ram0 rw initrd=0x41000000,8M init=/linuxrc";
 		stdout-path = "serial1:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts b/arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts
index c83fb250e664..4b18cc55d6ca 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts
@@ -27,7 +27,7 @@ aliases {
 	};
 
 	chosen {
-		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M init=/linuxrc";
+		bootargs = "root=/dev/ram0 rw initrd=0x41000000,8M init=/linuxrc";
 		stdout-path = "serial1:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts b/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
index bb623726ef1e..4164c7c2a3eb 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
@@ -27,7 +27,7 @@ memory@40000000 {
 	};
 
 	chosen {
-		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M init=/linuxrc";
+		bootargs = "root=/dev/ram0 rw initrd=0x41000000,8M init=/linuxrc";
 		stdout-path = "serial2:115200n8";
 	};
 
diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 6915c766923a..77d3521f55d4 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -15,7 +15,7 @@ CONFIG_HIGHMEM=y
 CONFIG_SECCOMP=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
-CONFIG_CMDLINE="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc mem=256M"
+CONFIG_CMDLINE="root=/dev/ram0 rw initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc mem=256M"
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
diff --git a/arch/arm/configs/s5pv210_defconfig b/arch/arm/configs/s5pv210_defconfig
index 02121eec3658..8ec82d9b51e4 100644
--- a/arch/arm/configs/s5pv210_defconfig
+++ b/arch/arm/configs/s5pv210_defconfig
@@ -8,7 +8,7 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_ARCH_S5PV210=y
 CONFIG_VMSPLIT_2G=y
 CONFIG_ARM_APPENDED_DTB=y
-CONFIG_CMDLINE="root=/dev/ram0 rw ramdisk=8192 initrd=0x20800000,8M console=ttySAC1,115200 init=/linuxrc"
+CONFIG_CMDLINE="root=/dev/ram0 rw initrd=0x20800000,8M console=ttySAC1,115200 init=/linuxrc"
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index df38fb364904..8cf06e40f61c 100644
--- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -229,7 +229,6 @@ config BLK_DEV_RAM
 	  store a copy of a minimal root file system off of a floppy into RAM
 	  during the initial install of Linux.
 
-	  Note that the kernel command line option "ramdisk=XX" is now obsolete.
 	  For details, read <file:Documentation/admin-guide/blockdev/ramdisk.rst>.
 
 	  To compile this driver as a module, choose M here: the
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
