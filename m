Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C6CCAC582
	for <linux-snps-arc@archiver.kernel.org>; Sun, 14 Sep 2025 04:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMIvTI/tM6KNu9tuhebgqlSklb9txc2uScGNxSPnL34=; b=Mx7uqrWxzOlb3n
	j1P51bhBsP9Dyd1IdVoz3XM4tpOby8sMAgmszQNBqqb+5xERaAN+uS361tP3dPW4rFUIXiSffSImS
	MtiX3lCSDE5mOwWlhUiJtkW8jkLLkVXLVpLab1SQnRWSsEJ3XmXrSA3X0qfVJoD2b69nC2tA9reWz
	tz0U3zbOJd6rX47PP0vUA222A1kt3psdPphXluwC3oKgGGce05JbCfrEHWVV4zxMhro1sBV8akcnM
	c6OKxZGUWu3TKOt7QimVKLHpdv7y8gOV/nFeGJYqcnPm26hZe+3S3To1jbGvsGdn+iVlfPO/JlrQ4
	SVshu7FVHxj1HZWi+9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdvd-0000000HQew-2AUk;
	Sun, 14 Sep 2025 04:01:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdvc-0000000HQe3-0M9l
	for linux-snps-arc@bombadil.infradead.org;
	Sun, 14 Sep 2025 04:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VwNZ1dGhSyiZay2XNiU9ezAgD/oIZHhpGCNy2W223z4=; b=CRCO+WLsQFyhKUHq/V4F9khr3s
	lYDspZ2iKXHrsLjMl3Y9MN39h514G+Kb+WFvE5B2D75BXueoE1kdB14/9I3JJcGZW7T1375FKEvbY
	EfG5xzVtLAIgdlp+Eooy5/RjFYV/kJ6KwohtsfRgqxcaXZRiwGqQzX//afi+kifHOZDdII52Ro+tJ
	tp47wPgwbI0Pqca1L7Ls+7tMlL26c7YHw67UO0b3X4R+49WWO0IyC5coRBXHYokivpvnxrVm+QkXA
	bjooUb7HC8SYb4VHpPzLO/XRkC8+VV80xPfvgTXCx3wrlTyzHdFxVLaWIoz3J1/ISxqPBvvS+SHbQ
	vzpAMZIA==;
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdvW-00000006iXu-357z
	for linux-snps-arc@lists.infradead.org;
	Sun, 14 Sep 2025 04:01:25 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6228de280a4so5039818a12.2
        for <linux-snps-arc@lists.infradead.org>; Sat, 13 Sep 2025 21:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822481; x=1758427281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwNZ1dGhSyiZay2XNiU9ezAgD/oIZHhpGCNy2W223z4=;
        b=bb/+YgaoJrkiIgRL7cBDqCXsIeNEbxJz2EvKSoDFVYCw0kK/Fcrtx/ARiSNhG251rf
         cC+kZnzpVVKukmoYuQEzTR09T+4gaJrW+8p6F+qOmT7kowiDCUp1TFEXiTcxaev1h1/5
         rSZQ5QrTGlMUaQp2P1nDKJTP5mJDO8QBblcdQR49rjKx4d5oTKeKHWCbcwrsN5GEGzlD
         h6EBGNThYNdQXvbyX9rikW+4ITTyLsMAr+0gqrK0aQUBcfEjhVAR+3mk7jPNQJU0m6fz
         hD4DpGXiCIaSC+tJlYyX7qU5npACQKTRXxIZODkZcPai0geLh3tABY7R8Lx6uBefAS1S
         zo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822481; x=1758427281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwNZ1dGhSyiZay2XNiU9ezAgD/oIZHhpGCNy2W223z4=;
        b=IP8ZK4Ii+R703IWGyRF1ZXb+yNRGo+DOKBaZRJpFPLmh9As8WwsurvTTxwAmb3Z1rk
         9kF8INwUvkp+4EBZcdg8kpYwvcAAG6dZDIoINRv0UazaksH0zZX5odu1yGy5reuNRJxp
         vIfWlUagHrtlyJQAeNqcUx297xEViszTtZL9stCg2vDNvaUeUuCy3oldha6rA5rS9dhH
         6hLyb7y/pfnRF86ysxA8MOv+cSFIkOLjk94MqkqVxEPmENtcU/nheEL+gVSb/5cbazIO
         c/IAO2bq49b/QGnYYOQGCJn9M++0bXJjHQnN0MmZZwUTBgqmhZNTf/yH+aU/nfVDUWqd
         uXWg==
X-Forwarded-Encrypted: i=1; AJvYcCVFKLPKOvvzHQ6c+db4D3No/S39KI8aJEN+620Ktxr3hrME5giBk+VzXlol0fKpf48J2bkM+j1Mr1aQDOLvrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxAr9mwJ0eChXb+JB9evNml58+Kdn/hi+13EwVTG+JvaqH1HJs
	nYyBeZwJuCZnXWkXAUKDk5i4TC2s1uM3F9LsWvM9dP46l2FGzxTJFsIm
X-Gm-Gg: ASbGncvzaBcL/6QKhch9z6/oKssGWiyrvAN5gtCT8JgeO8YHPHDwmdYNA6K6XoEZtvU
	vggxz/IZqRvNCdnqMVpc4rG/bHmub1GupPRN8Qpliy6+aN47mtvgKWiTYnKzyX08/seVw1GfOL1
	irx9si4WXTj8CDe8MVO6oV22stvGwfhuxL/pDpB2FOPXuDJWaKJcZKWZFEBQPn8XMnd4JUhnphm
	/A48U/JmHZky1qJ8SFBp9Ei6ENFaNuJV7EXmrwQUBtbwEPY3chXZC8q7BfoC6vz/gvq9mNgh0u2
	+oljzyYPg9OPUJIooGso4JPs3wQ7IGXAFlyopIByrVJxIpb13IX6ianqy8xcPFVq9+GG+dgTniZ
	c0B+IszQtF5p/1+VljlPKnKfAZp5xvb1E8Y6fShqa
X-Google-Smtp-Source: AGHT+IFULnpNvXsN8iyaJQvxHQtijyFN7+GqapflbxpSh737GK1sqeditLl7Ifn9jo0c7UhvyyAB9w==
X-Received: by 2002:a05:6402:5107:b0:62a:82e8:e1bd with SMTP id 4fb4d7f45d1cf-62ed82b22cbmr8144850a12.32.1757822480960;
        Sat, 13 Sep 2025 21:01:20 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33f57dbsm6450117a12.25.2025.09.13.21.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:01:19 -0700 (PDT)
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
Subject: [PATCH RESEND 56/62] init: rename CONFIG_RD_GZIP to CONFIG_INITRAMFS_DECOMPRESS_GZIP
Date: Sun, 14 Sep 2025 07:01:13 +0300
Message-ID: <20250914040114.3796281-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_050123_956840_42B42AC0 
X-CRM114-Status: GOOD (  11.90  )
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
and CONFIG_RD_GZIP has nothing to do with ramdisks.

Update your configs

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/arc/configs/tb10x_defconfig           | 2 +-
 arch/arm/configs/sp7021_defconfig          | 2 +-
 arch/mips/configs/ath25_defconfig          | 2 +-
 arch/mips/configs/ath79_defconfig          | 2 +-
 arch/mips/configs/bmips_stb_defconfig      | 2 +-
 arch/mips/configs/rt305x_defconfig         | 2 +-
 arch/mips/configs/xway_defconfig           | 2 +-
 arch/openrisc/configs/or1ksim_defconfig    | 2 +-
 arch/openrisc/configs/simple_smp_defconfig | 2 +-
 arch/powerpc/configs/mgcoge_defconfig      | 2 +-
 arch/powerpc/configs/skiroot_defconfig     | 2 +-
 arch/riscv/configs/nommu_k210_defconfig    | 2 +-
 usr/Kconfig                                | 4 ++--
 13 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index 26a06eb336df..f177600a527a 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -13,7 +13,7 @@ CONFIG_INITRAMFS=y
 CONFIG_INITRAMFS_SOURCE="../tb10x-rootfs.cpio"
 CONFIG_INITRAMFS_ROOT_UID=2100
 CONFIG_INITRAMFS_ROOT_GID=501
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_AIO is not set
 CONFIG_EXPERT=y
diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
index ec723401b440..30cfafc49ec9 100644
--- a/arch/arm/configs/sp7021_defconfig
+++ b/arch/arm/configs/sp7021_defconfig
@@ -5,7 +5,7 @@ CONFIG_PREEMPT=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
diff --git a/arch/mips/configs/ath25_defconfig b/arch/mips/configs/ath25_defconfig
index cb16a1f18db8..58ae5f9726a0 100644
--- a/arch/mips/configs/ath25_defconfig
+++ b/arch/mips/configs/ath25_defconfig
@@ -3,7 +3,7 @@ CONFIG_SYSVIPC=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/mips/configs/ath79_defconfig b/arch/mips/configs/ath79_defconfig
index 014bb1107b86..500b94dfc6c1 100644
--- a/arch/mips/configs/ath79_defconfig
+++ b/arch/mips/configs/ath79_defconfig
@@ -2,7 +2,7 @@
 CONFIG_SYSVIPC=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_AIO is not set
 # CONFIG_KALLSYMS is not set
 CONFIG_EXPERT=y
diff --git a/arch/mips/configs/bmips_stb_defconfig b/arch/mips/configs/bmips_stb_defconfig
index ed4d4be772be..2217a3ca5b72 100644
--- a/arch/mips/configs/bmips_stb_defconfig
+++ b/arch/mips/configs/bmips_stb_defconfig
@@ -14,7 +14,7 @@ CONFIG_SMP=y
 CONFIG_NR_CPUS=4
 # CONFIG_SECCOMP is not set
 CONFIG_MIPS_O32_FP64_SUPPORT=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 CONFIG_RD_XZ=y
diff --git a/arch/mips/configs/rt305x_defconfig b/arch/mips/configs/rt305x_defconfig
index bf4dd5930876..9102f9ebcf88 100644
--- a/arch/mips/configs/rt305x_defconfig
+++ b/arch/mips/configs/rt305x_defconfig
@@ -3,7 +3,7 @@ CONFIG_SYSVIPC=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_AIO is not set
 CONFIG_KALLSYMS_ALL=y
diff --git a/arch/mips/configs/xway_defconfig b/arch/mips/configs/xway_defconfig
index 41d0d7d8cb6c..fa49183a4147 100644
--- a/arch/mips/configs/xway_defconfig
+++ b/arch/mips/configs/xway_defconfig
@@ -3,7 +3,7 @@ CONFIG_SYSVIPC=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_AIO is not set
 CONFIG_KALLSYMS_ALL=y
diff --git a/arch/openrisc/configs/or1ksim_defconfig b/arch/openrisc/configs/or1ksim_defconfig
index 96578bfb7159..56ddb48f7955 100644
--- a/arch/openrisc/configs/or1ksim_defconfig
+++ b/arch/openrisc/configs/or1ksim_defconfig
@@ -1,7 +1,7 @@
 CONFIG_NO_HZ=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 CONFIG_EXPERT=y
 # CONFIG_KALLSYMS is not set
 # CONFIG_EPOLL is not set
diff --git a/arch/openrisc/configs/simple_smp_defconfig b/arch/openrisc/configs/simple_smp_defconfig
index f7c807b32d50..e4aaaeaec7a8 100644
--- a/arch/openrisc/configs/simple_smp_defconfig
+++ b/arch/openrisc/configs/simple_smp_defconfig
@@ -2,7 +2,7 @@ CONFIG_LOCALVERSION="-simple-smp"
 CONFIG_NO_HZ=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
diff --git a/arch/powerpc/configs/mgcoge_defconfig b/arch/powerpc/configs/mgcoge_defconfig
index 1b782855c84a..6d543b9f0bc6 100644
--- a/arch/powerpc/configs/mgcoge_defconfig
+++ b/arch/powerpc/configs/mgcoge_defconfig
@@ -6,7 +6,7 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_PCSPKR_PLATFORM is not set
 CONFIG_EXPERT=y
diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 1611e15a72f3..9a6ef1d8ca44 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -10,7 +10,7 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=20
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 7824f13e84f3..a1fa77563bb8 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -1,7 +1,7 @@
 # CONFIG_CPU_ISOLATION is not set
 CONFIG_LOG_BUF_SHIFT=13
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
diff --git a/usr/Kconfig b/usr/Kconfig
index 8899353bd7d5..cf3c7539e3dc 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -52,7 +52,7 @@ config INITRAMFS_ROOT_GID
 
 	  If you are not sure, leave it set to "0".
 
-config RD_GZIP
+config INITRAMFS_DECOMPRESS_GZIP
 	bool "Support initial ramfs compressed using gzip"
 	default y
 	select DECOMPRESS_GZIP
@@ -134,7 +134,7 @@ choice
 
 config INITRAMFS_COMPRESSION_GZIP
 	bool "Gzip"
-	depends on RD_GZIP
+	depends on INITRAMFS_DECOMPRESS_GZIP
 	help
 	  Use the old and well tested gzip compression algorithm. Gzip provides
 	  a good balance between compression ratio and decompression speed and
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
