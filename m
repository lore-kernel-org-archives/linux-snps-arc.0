Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F23ECAC58F
	for <linux-snps-arc@archiver.kernel.org>; Sun, 14 Sep 2025 04:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3Kv4tJ4j6n5vtUcZ5923v57dgnaK0OfSHwjum8Iv6Q=; b=0GF1ARmF6DikKE
	C1TzZICtYRGbniD4rkNi23FHjlBl/T9vmCtdNKqfAJ2qKxUOgMW+K9kyf5LEU3A0lMIfqm0Ya4gG3
	7lWwChs/JR5A/UuaMNvGsx8fTbBvpotD85j2NPY9vaf6S3GyXGDSrNAQjPxBk4t1Db1qIkP32SYLD
	pjFnHbntD0VFznoaeDDR1jFWdBB7VHhjrpIn9dCtJAJslWwlnS2HWrdDGS+XeV1q3pRVVSwQf+piQ
	lsc4OLZuAZCRg8k+m6pjgX0fnQhqBt7QQIupQBgkk6U4+zltePtcFCJEk12lUlshBUToVWDYJTvlE
	Ks5FOOr0hmejKYAElDEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdxL-0000000HRbA-1gs3;
	Sun, 14 Sep 2025 04:03:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdxK-0000000HRZc-0RsC
	for linux-snps-arc@bombadil.infradead.org;
	Sun, 14 Sep 2025 04:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qbcdxSDkMFQBJSgZHl6W+ZOyEjWb42NhxwZCg+OO1T8=; b=dhUM+16gdP2W5fgOYMZoQNeYoC
	/bkfJ8Xerio+CLhzss23m06VLwb1oXITp4P1IRjcVARJHFqX7VrUIHX42pL11KAB2AvTi/towUw38
	/uJfaINitM6nkfAxvkv5NTHRbwRuY8aJoBTa3EiPlCcSRD/mDjTl765NovidtzRip37pVF5dS2fZA
	C5/VW/ZUIXTQqfU2mQlufGuARYd8XW94G7ItzzzvP45JYFCBoV2ag6oQmA2VCxEL+wDa1sw5tk3wX
	3MLPnCNgYte6mJ/yGyqedbanNbhZmTVYrturSPngOw6lXsZfrNYq+O60lxnguw1frIqfhFzT94X8r
	xOkryw3A==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdxG-00000006ihn-3V8t
	for linux-snps-arc@lists.infradead.org;
	Sun, 14 Sep 2025 04:03:12 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b07c2908f3eso324429366b.1
        for <linux-snps-arc@lists.infradead.org>; Sat, 13 Sep 2025 21:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822589; x=1758427389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbcdxSDkMFQBJSgZHl6W+ZOyEjWb42NhxwZCg+OO1T8=;
        b=C0eXRnHO2jVROOKbmyJ9iB8No35CTfTqCt6lLSpH76LTt4maS9vN2e3qra+Ia241Ol
         SDjXnYrLL7kblqmMHA4ahvTu+TRQYTpfgt6QdHFRzA1sil8AMAx883vh2aAZcS01i1ho
         6Kr0k4x/QpHlAGiu0Ow7bKhaPZQY0pbaSmL2u1rbp0ZNpXGoL1/fl0+UvIW6JnazidnY
         6n6QpPrznZSxdv+GiPPO5KB6gdS4nPuwuHST6JhvQDo0GTktaXgIROBRAri26w9pvdRA
         YyQoNNThaTAfxE8N6BcKDTgXWEde50+/2Jfi07jlYG6bs2xkYGEOjhxk6EZqg7NrWymH
         1h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822589; x=1758427389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbcdxSDkMFQBJSgZHl6W+ZOyEjWb42NhxwZCg+OO1T8=;
        b=AV65iwb2CL39GqLzURlQwQ46kzC9Lw05jdA+folcdTri3YrsXgEa9dCxPtNl6OtOIv
         vVL/Kd95HlzFgQi27VD2I72hy8bNe/96KfZDNdCqfYXvIjRYN2dj4equ8J5il1mwFq39
         QZLeI7PxT4Rvi1SoEgkhEMR1XpyM9xcg9h908I9gHS00/MUJM5Vk1OxX9FxSmLDcDzGR
         EcQcNxBNIpyJ5RSDU9GDRog5jsCidGr3ljWpiMU1WILG2TxC8FIMZJEEcz2gOLhKKlCj
         6zfuwRZn2w/1fU9H0T2s/p/fUGxzB2Ti9zHu2P/UpG1emeGk6hiNDpDfRfRLheTkp0py
         Pivg==
X-Forwarded-Encrypted: i=1; AJvYcCV98R2EzFcnbEOPZKudSPNyfkXxhtdevhCKr0R/f8lboEyVnvHy5YSkRciv7t6cMe5Tcnqg0pzz7bI73yUXvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeI+ixsE6t5d2YqDOi/pnc+JGNxFpn2nwwii+XWLFdzJtRWQSJ
	dXQYV+ain+4JtSqZvJt4wlR8hL+oZf3aJdqIyeBWvVfmiD+PPwqz24Ns
X-Gm-Gg: ASbGnctVrIIoUtRlimea6fbgyZKNW8TsjYNrU8K5Gkq8VUxff/MJ65SmHhXM4hUp1YF
	75Kf2PNiu1cZGV3nEB4qiIiI0QWy7wGlEOSmUaJgGNQ+etWHClmo0neuZ0t8DzHrMwWaT6Z0t5B
	uo+tzyZwKMgx9/iru18nBvcSZJAbW1zoCIkIcikHDcRa9tcOsJwm+wO55gUQpCP+38zxXczrny3
	XFjOtrwcMQ+sGyX/yZMMD1bBz3mhdpxHpMGPDz/Y9r8AauhOV/Iih5SIv92FoJGWvhxOrRgfFaG
	m6vLyF0aYdZtdDfglRnho7R9cG15/QGda0lzjAbqdUnrJxqRS5ubo8//Y/1R7I4ar0hVNO3DwI9
	EW11rPhLaqWZTquuq4fqrwCIs3k8C9w==
X-Google-Smtp-Source: AGHT+IHGuPAdg2hc8vTX17sqHx8yH9klMMnyHgZ7wpg91V0NDBcC4FFg8p5OfHIPrffFIiq2LKJR3w==
X-Received: by 2002:a17:907:3e1e:b0:afe:35d:fd5d with SMTP id a640c23a62f3a-b07c3475927mr787789466b.1.1757822589070;
        Sat, 13 Sep 2025 21:03:09 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b0906a9640esm221968366b.110.2025.09.13.21.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:03:08 -0700 (PDT)
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
Subject: [PATCH RESEND 59/62] init: rename CONFIG_RD_XZ to CONFIG_INITRAMFS_DECOMPRESS_XZ
Date: Sun, 14 Sep 2025 07:03:03 +0300
Message-ID: <20250914040303.3823154-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_050311_197595_D6452CB4 
X-CRM114-Status: GOOD (  13.61  )
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
and CONFIG_RD_XZ has nothing to do with ramdisks.

Update your configs

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/arm/configs/lpc18xx_defconfig         | 2 +-
 arch/arm/configs/sp7021_defconfig          | 2 +-
 arch/arm/configs/vf610m4_defconfig         | 2 +-
 arch/mips/configs/ath25_defconfig          | 2 +-
 arch/mips/configs/bmips_stb_defconfig      | 2 +-
 arch/openrisc/configs/simple_smp_defconfig | 2 +-
 arch/powerpc/configs/44x/fsp2_defconfig    | 2 +-
 arch/riscv/configs/nommu_k210_defconfig    | 2 +-
 arch/riscv/configs/nommu_virt_defconfig    | 2 +-
 arch/xtensa/configs/cadence_csp_defconfig  | 2 +-
 arch/xtensa/configs/nommu_kc705_defconfig  | 2 +-
 usr/Kconfig                                | 4 ++--
 12 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/configs/lpc18xx_defconfig b/arch/arm/configs/lpc18xx_defconfig
index b1d5d8e4d7fe..816586530ff5 100644
--- a/arch/arm/configs/lpc18xx_defconfig
+++ b/arch/arm/configs/lpc18xx_defconfig
@@ -3,7 +3,7 @@ CONFIG_PREEMPT=y
 CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZMA is not set
-# CONFIG_RD_XZ is not set
+# CONFIG_INITRAMFS_DECOMPRESS_XZ is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
index cfb20e693e1e..2d9bbda67e85 100644
--- a/arch/arm/configs/sp7021_defconfig
+++ b/arch/arm/configs/sp7021_defconfig
@@ -8,7 +8,7 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZMA is not set
-# CONFIG_RD_XZ is not set
+# CONFIG_INITRAMFS_DECOMPRESS_XZ is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
diff --git a/arch/arm/configs/vf610m4_defconfig b/arch/arm/configs/vf610m4_defconfig
index 9b20db4bb8e6..7d457a196dfc 100644
--- a/arch/arm/configs/vf610m4_defconfig
+++ b/arch/arm/configs/vf610m4_defconfig
@@ -2,7 +2,7 @@ CONFIG_NAMESPACES=y
 CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZMA is not set
-# CONFIG_RD_XZ is not set
+# CONFIG_INITRAMFS_DECOMPRESS_XZ is not set
 # CONFIG_RD_LZ4 is not set
 CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
diff --git a/arch/mips/configs/ath25_defconfig b/arch/mips/configs/ath25_defconfig
index 7c1ec18b0eeb..e401b29ce706 100644
--- a/arch/mips/configs/ath25_defconfig
+++ b/arch/mips/configs/ath25_defconfig
@@ -5,7 +5,7 @@ CONFIG_HIGH_RES_TIMERS=y
 CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
-# CONFIG_RD_XZ is not set
+# CONFIG_INITRAMFS_DECOMPRESS_XZ is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
diff --git a/arch/mips/configs/bmips_stb_defconfig b/arch/mips/configs/bmips_stb_defconfig
index 300e67507a1f..072bfdc87771 100644
--- a/arch/mips/configs/bmips_stb_defconfig
+++ b/arch/mips/configs/bmips_stb_defconfig
@@ -17,7 +17,7 @@ CONFIG_MIPS_O32_FP64_SUPPORT=y
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZMA is not set
-CONFIG_RD_XZ=y
+CONFIG_INITRAMFS_DECOMPRESS_XZ=y
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 CONFIG_PCI=y
diff --git a/arch/openrisc/configs/simple_smp_defconfig b/arch/openrisc/configs/simple_smp_defconfig
index 5e46664549ec..7080bdedea01 100644
--- a/arch/openrisc/configs/simple_smp_defconfig
+++ b/arch/openrisc/configs/simple_smp_defconfig
@@ -5,7 +5,7 @@ CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZMA is not set
-# CONFIG_RD_XZ is not set
+# CONFIG_INITRAMFS_DECOMPRESS_XZ is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 CONFIG_EXPERT=y
diff --git a/arch/powerpc/configs/44x/fsp2_defconfig b/arch/powerpc/configs/44x/fsp2_defconfig
index 038a261ebc20..ffb345222649 100644
--- a/arch/powerpc/configs/44x/fsp2_defconfig
+++ b/arch/powerpc/configs/44x/fsp2_defconfig
@@ -10,7 +10,7 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_LZMA is not set
-# CONFIG_RD_XZ is not set
+# CONFIG_INITRAMFS_DECOMPRESS_XZ is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 CONFIG_KALLSYMS_ALL=y
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 282b889596a1..10ffb9ea40bd 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -4,7 +4,7 @@ CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZMA is not set
-# CONFIG_RD_XZ is not set
+# CONFIG_INITRAMFS_DECOMPRESS_XZ is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 # CONFIG_RD_ZSTD is not set
diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
index e9231eadcbad..9383e3445ead 100644
--- a/arch/riscv/configs/nommu_virt_defconfig
+++ b/arch/riscv/configs/nommu_virt_defconfig
@@ -3,7 +3,7 @@ CONFIG_LOG_BUF_SHIFT=16
 CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZMA is not set
-# CONFIG_RD_XZ is not set
+# CONFIG_INITRAMFS_DECOMPRESS_XZ is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
diff --git a/arch/xtensa/configs/cadence_csp_defconfig b/arch/xtensa/configs/cadence_csp_defconfig
index 6b38ba64a2aa..f102ed913e9b 100644
--- a/arch/xtensa/configs/cadence_csp_defconfig
+++ b/arch/xtensa/configs/cadence_csp_defconfig
@@ -16,7 +16,7 @@ CONFIG_INITRAMFS=y
 CONFIG_INITRAMFS_SOURCE="$$KERNEL_INITRAMFS_SOURCE"
 # CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZMA is not set
-# CONFIG_RD_XZ is not set
+# CONFIG_INITRAMFS_DECOMPRESS_XZ is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
diff --git a/arch/xtensa/configs/nommu_kc705_defconfig b/arch/xtensa/configs/nommu_kc705_defconfig
index 9b260f57e63f..d3916408eaf6 100644
--- a/arch/xtensa/configs/nommu_kc705_defconfig
+++ b/arch/xtensa/configs/nommu_kc705_defconfig
@@ -17,7 +17,7 @@ CONFIG_RELAY=y
 CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZMA is not set
-# CONFIG_RD_XZ is not set
+# CONFIG_INITRAMFS_DECOMPRESS_XZ is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 CONFIG_EXPERT=y
diff --git a/usr/Kconfig b/usr/Kconfig
index 030c6a898d7a..69f95a5a1847 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -76,7 +76,7 @@ config INITRAMFS_DECOMPRESS_LZMA
 	  Support loading of a LZMA encoded initial ramfs.
 	  If unsure, say N.
 
-config RD_XZ
+config INITRAMFS_DECOMPRESS_XZ
 	bool "Support initial ramfs compressed using XZ"
 	default y
 	select DECOMPRESS_XZ
@@ -170,7 +170,7 @@ config INITRAMFS_COMPRESSION_LZMA
 
 config INITRAMFS_COMPRESSION_XZ
 	bool "XZ"
-	depends on RD_XZ
+	depends on INITRAMFS_DECOMPRESS_XZ
 	help
 	  XZ uses the LZMA2 algorithm and has a large dictionary which may cause
 	  problems on memory constrained systems. The initramfs size is about
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
