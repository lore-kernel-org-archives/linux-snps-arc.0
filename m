Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50959CAC592
	for <linux-snps-arc@archiver.kernel.org>; Sun, 14 Sep 2025 03:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/O0wBdXXC8TnBtPEnqLj0Fg/didIYEunq6xY+QkohhU=; b=0zeQjlCWWwLDTl
	C3JiuEbc3laY62cllVaSeWDPspihbqZg9o44wH6rf0EUZGztCNKrH5UG4Mm5U3tkgLgXN0uNtyCdX
	3uee+sUi2fwxhRIkReF1aDX6710TjRj91bqBfrreMAguP22vB6MbAr31xaITByXyh75tcgsCP3clp
	XmU2LkmNUa7HETWfDICS13+WF+47anAHkzronAnPoe5qNv3pBQUSFjauOIfUyy3i6skd7NTJYrTbZ
	qtCJAmfpE4fvwK3rbd/FP6S9vRUwWQasDig3CZQSiDPHQyAEHt/3yY1ooXAZxnNccp7lJRnRfZuPE
	3EjyOpDT3mY/w0OftFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdqL-0000000HNzK-0KEl;
	Sun, 14 Sep 2025 03:56:01 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdqI-0000000HNxZ-2Ppd
	for linux-snps-arc@lists.infradead.org;
	Sun, 14 Sep 2025 03:55:59 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so5968387a12.3
        for <linux-snps-arc@lists.infradead.org>; Sat, 13 Sep 2025 20:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822157; x=1758426957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZ7mWaMdZxGJK1wTX4F7lWg1sPAH5qiKx6l6RS6EW/U=;
        b=h6EPKt6qnlUc4SqLD/0WQS3xf3n6rglQ7DU1WVre9XnvCtohqMS2/cI++AeYjJnl9p
         Vn/9f6DPM9Ymv8+brq/t2EZhmeowTb8tqvFu/N1bo2dhLH5Fq1hSAJQKuKEVGqn7TAw+
         81KgEUQyTQsS+2ix9BKd2qAA6nWKm/WsbeFT0ME7Ysh8tPrfZC7PyNFAxal8PjN8GP+B
         FcM1LCF+GLWknYQyGsP/VrY/4336c67uvHVlcFOS5f2orfN0kDXxaBnQA70lSrfvn1Mz
         T3i9tvI3Gz0uTu1atZJ7LKE1S/ctHQdMtzDDwE77TkLagDlQvJ1EQYxRLwlMSvljzJdV
         lNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822157; x=1758426957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZ7mWaMdZxGJK1wTX4F7lWg1sPAH5qiKx6l6RS6EW/U=;
        b=AL0RgGPgt2DSLO4BDkL3XZlC47UvGTvfU7sdiTPY1MwSVhnMLlOlOifpFtcbcN6wCo
         OEDKYU49x8F/1n65GCSuoPdoK2QNf3GczClvE91B7f+mV8LYCQeCvtfzKYjz54ExD9/s
         V9J/szRrk4D7hCBz4QZtfSa3e3z+B8LJZ5WU5ScRcVLGVov4u/j5m569GFdsj3UWsAzX
         rQM9iD2/BSTiAbgFQZe/+gI8hVoKHC3fmmC9fzAPHY+03PPYWi17n6xrYpr5c5rX3P6T
         dyQf+eX44AvMPidhrxhAnga6DelIACGhooYaP/5JhWxk+1dNsmg0Qk5b2ftyz/HQERlz
         k0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXbSaHaZG3lEBZ3OmnfbJDIvP3At2F+922xE/2gWcJVRmnRfr0akGGxOwjzjWyTDwTGlLMfZ0l6siOsn9IEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRTDMn1x0OtcEUDfO9usuCvrLp0ESSR3kJnl+Hq2nCh2frcT++
	LlMZjzSuNPWZC2xsrYYX7NqLFTGvq38B+yWSaBXSyC57r794rYSNLrqe
X-Gm-Gg: ASbGncsiifSG3waUGbhN1CWhjHGSD7IOumtbCeyxGIxE36aY6Uw4cL6gYNIdkFPedM0
	clWBB8mwUhhmZH+6ZK6ap1koLVd66/R0hr28jzrcusflN27nv8LmLvzpQ1K0dLYu0nkAZFBAS1J
	n+C5f3YnpiKinw/ZiZyI1pZHnS7gasx+ua0zAZ/0gC6LnE9Jo62cxOsHNCFei4XFEMnxHI3jo3S
	TcoQ+oTP1Fycy95gCbc56nnUz1Rw2Mxy4JhSWQLxSB2d7Ml6jN8vFZOc0m1Frrj/AGQnk6PMm1v
	BKeCJNGVUdvq/yuaYKQ+gcPYZyXhLidTztzMfgx8a6avwjpk/sC5eNacusvCYbks18bT75XPk+u
	lly9o1mg2zvsVhCemO/TyMiCoob4tOQ==
X-Google-Smtp-Source: AGHT+IHVlqrM3WGO2PMhAdJqFymXZDFmcHUFnmRqsIL52zZcyiB7/sntw8UcjJnO5qIuj3xo01B0kw==
X-Received: by 2002:a05:6402:278f:b0:62f:26f8:fea0 with SMTP id 4fb4d7f45d1cf-62f26f91103mr1500285a12.33.1757822156480;
        Sat, 13 Sep 2025 20:55:56 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62f2b2a8c38sm677327a12.31.2025.09.13.20.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:55:55 -0700 (PDT)
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
Subject: [PATCH RESEND 47/62] init: fix typo: virtul => virtual
Date: Sun, 14 Sep 2025 06:55:50 +0300
Message-ID: <20250914035550.3706342-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_205558_624450_99A505E5 
X-CRM114-Status: GOOD (  12.58  )
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

Fix typo

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/initramfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 8b648b09247a..cf19b7c0c358 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -636,7 +636,7 @@ void __init reserve_initramfs_mem(void)
 	phys_addr_t start;
 	unsigned long size;
 
-	/* Ignore the virtul address computed during device tree parsing */
+	/* Ignore the virtual address computed during device tree parsing */
 	virt_external_initramfs_start = virt_external_initramfs_end = 0;
 
 	if (!phys_external_initramfs_size)
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
