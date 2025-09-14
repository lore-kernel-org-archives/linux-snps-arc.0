Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08DCCAC582
	for <linux-snps-arc@archiver.kernel.org>; Sun, 14 Sep 2025 03:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNzHu4XRNLAqIMjXRKJrHPvFu0m1KRfYjMLVWhyFCUI=; b=VEoxOaPRhBoBDD
	N5dbUAdxvr9Lppvj3y9Mt4R46lM7kXAGEiFigKF/mr3XczeTndayJgHIjHR/nBokEjVuZd3eIrBqX
	LdsJewJTF3GHBmJdOcMHWYVERm8AQSCR4Ej+SYbrr001ohGJRQKF8epfLYhOYz02qTQX3Uxap/f3M
	tXeIX1ZwT4bY7AeRNUVfpiUc1p8gauPPqEr6APGslwzYdTYLejfnxAN+h8OxEl0sbucpbczcnstw4
	tInSltnoMuEApexAa2QKwsE9rMxdzomCm6hD+VIqBl9p73XYVtvleIvwva9fqVUoFhTT7w+IFsPk8
	LSzuXDkrTFgAdDSXK72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdl8-0000000HL6n-1f5Q;
	Sun, 14 Sep 2025 03:50:38 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdl5-0000000HL5D-0Qxw
	for linux-snps-arc@lists.infradead.org;
	Sun, 14 Sep 2025 03:50:36 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-62f1987d446so947710a12.0
        for <linux-snps-arc@lists.infradead.org>; Sat, 13 Sep 2025 20:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821833; x=1758426633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xULsRy9EzPzDuVUBFXoTlnqFZHMdg+FSwp5f1Vonn0Q=;
        b=ktw2TMdo9suWgqcb0iUD1/xRPMnWK6fyC67w6hVwL1KLXETPBjg+b4X8IjQStfbyOg
         oJYK/zjz85V/DLhjjiBLOVGs0JS2XV/+D1a6UHqU4X9vteMRmpIUUy2jnpnCVFgA/8GQ
         SXco/l8QXtk55rXqAT4D24VYobEnxcKLOgr19SiXfP1HmIvfkJfXCfmHm61XA1dRTqXP
         F6HQJrh4lVPNc0JFtbCFbg47ZY0NUlxmb9oPzrTs4bP9wssKB6BpmbUlBscrLjY4Y+ZM
         mdk3YGoW3gdhhB6XNoRb1CSsUqInlSkARjkL3jCU3juM3FEqzuwWDB++93mplafiyCVK
         OyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821833; x=1758426633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xULsRy9EzPzDuVUBFXoTlnqFZHMdg+FSwp5f1Vonn0Q=;
        b=s2ja7F19tR08Gc2Hslvf4tVIGoRkrN1BTh/FegnWupLZ0Z6bgvXNTgnHNYorgeOOLD
         TFaIS8Sixvpv6qw+jlxgei9gbb0DQpd+uNhQhKHmHpyHGs/7TscbXsmqIgMqFowKtH6H
         EhJZUhf3vwwsDMAM5Qp0RFjgqRc9kGxIe1b3WoEwb8AZeeN7TT6757S8j2S7lwIC93wD
         sc4wgAZYgFl7Bze+4ZQVEpV0UcVTyE/bsQVSpQb5wwBEZf5yfUu1kRNWQWGZDs0sMGD5
         9LmKB0tneiq6YVP8AkKaK7pzvdRnbI9ZQvHr/Dwi3VAhLfTXebVadTnOV5+AdIeootqU
         pFZA==
X-Forwarded-Encrypted: i=1; AJvYcCUuYBZGIrN5YU8Dr1G/G2gH4/3HjLoZGxvD/Cagz5OgyEBWnozHIfLw6q4HdrMd4q+S4Dk62mHinKHfC1XZ6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3JALAyr6QIlsDxj7F5hSDl5ZjkcsDiJCDmvFXixJqt4vd69L+
	L5nMDc0Ej3VG7vKq1s/ltPcp7jSMQwgoGMFXVDWI9q3cXaBa7aHGclL4
X-Gm-Gg: ASbGncuKplFTT6z0YZirPVqKW5bk59WugP5HjMgfbNCLrvl8SjdoE60SiBzaHlt335S
	0h+upXcGvmNts61/TYq2qGCYnxoUm3y591hx1JROCjIc2l/c3wQUAyZlk6prsNEGwp1xO4SwX7e
	Lz0LHBOw1lpY0e/VHQbecGM2YxS4Q7Pl3Ut2x2Xe7nBY+OrEpl+sXF0coWS0muBI/JydgoGHS+M
	bTjpuUyoAv9+y58wmqPiGbS50B6xjrCK5RrCasl704maFBPcmyGI5qlzVxIl5PbXiK1NVnxnx2K
	P0Joa6yvDGV4br8nlikgUaOVNSK265gcyJnur63WaPDJRn0QuiKKH90fQElOJoOGXiqXnVxaFnw
	EEWdBYcG/+xQAeN1T+pG+32EN0RdVwQ==
X-Google-Smtp-Source: AGHT+IHE3K7efxQ+hk8pVBE6YY31PD4G3LjwwPuEi1DqCDNI+Ud0foCSPIjpPnt40T661VaNMc1/Ow==
X-Received: by 2002:a17:907:3e8c:b0:b07:8836:dea9 with SMTP id a640c23a62f3a-b07c3819dc5mr855439466b.39.1757821832889;
        Sat, 13 Sep 2025 20:50:32 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd3efsm668828766b.55.2025.09.13.20.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:50:32 -0700 (PDT)
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
Subject: [PATCH RESEND 38/62] init: remove most headers from init/do_mounts.h
Date: Sun, 14 Sep 2025 06:50:27 +0300
Message-ID: <20250914035027.3609569-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_205035_162402_9227DAAC 
X-CRM114-Status: GOOD (  10.71  )
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

This is cleanup after initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/do_mounts.c |  2 ++
 init/do_mounts.h | 10 ----------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 7ec5ee5a5c19..5b55d0035e03 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -5,12 +5,14 @@
 #include <linux/fd.h>
 #include <linux/tty.h>
 #include <linux/suspend.h>
+#include <linux/blkdev.h>
 #include <linux/root_dev.h>
 #include <linux/security.h>
 #include <linux/delay.h>
 #include <linux/mount.h>
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/init_syscalls.h>
 #include <linux/fs.h>
 #include <linux/initrd.h>
 #include <linux/async.h>
diff --git a/init/do_mounts.h b/init/do_mounts.h
index e225d594dd06..53e60add795a 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -1,14 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#include <linux/kernel.h>
-#include <linux/blkdev.h>
-#include <linux/init.h>
-#include <linux/syscalls.h>
-#include <linux/unistd.h>
-#include <linux/slab.h>
-#include <linux/mount.h>
-#include <linux/major.h>
-#include <linux/root_dev.h>
-#include <linux/init_syscalls.h>
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
