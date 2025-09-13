Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A31ECA101F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 13 Sep 2025 01:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2LMxSQucCJW6CVz8uuq+qXbT39Fwhm32SkzLOfEFdq0=; b=oMiIuZCAa8Ul+B
	h0n70DJbacVPhMSS1V3+V7kifIncKA4enz86w+URuO1JsL3s5YF6ePW/gUSiBK5GeBxvTl+2lRoCP
	tC3R+vDpzz0fkmQgT0tfKy2X3lLCuS3uXN8yFdysSuAtS2UdRwgOkAC5s/IwA67X7GJsAqmB8YkHQ
	njNZ7qCycCUBeIojE33ZBZ2cVYgTpkv8mE2ShnXq12RUvtCesZf82VRXfduPOCwtce/y0wLR0tiC4
	tV0ql4/W2iBNOWwExOmYFpLo0Xs4/BTwti6NUf1kOi0LP/migC5zqTLHPCOkJrYK8DUG9Nc0a+TpR
	e95oa2egNFiUxsxyIXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEnr-0000000CXjk-3tXJ;
	Sat, 13 Sep 2025 01:11:47 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEnq-0000000CXic-0fCG
	for linux-snps-arc@lists.infradead.org;
	Sat, 13 Sep 2025 01:11:47 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6228de280ccso4875892a12.3
        for <linux-snps-arc@lists.infradead.org>; Fri, 12 Sep 2025 18:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725904; x=1758330704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6O+lfSZLBCLtFpNKL/1anVub0eApVizJE0pmHD2kMo=;
        b=RQzeg6oJmT4iSMfCNQ/0VroFLO0UHQkNAL/A5L1M/hiMkrzU8rbTFumdbxTTPhIudB
         ufWEneb6kTXy7dNz3VXmD9EpyM0kR6BBewhqomP4WfUeXATO0iqjujkpHdv4wYzzvQvG
         OatdeOIxZFH6rJDWUX4zxDj9+k7v/OIRA7+N0j5OYv9AQkcSiQA/KjMK/EXEMMtkdNPN
         FQi+kSQWq3Rb8OnYGY7pvpabJIIAAQNmIHcJzrbk/2bhzgo23AgC3VOHmGk8G1aijSco
         M3DrtiDC7ZMS+ZZaiZzpqQvQq3/6HU3Q0SvV1c/sy8/uzm3g4+C/vW5uWwIxI+BDLR+X
         YABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725904; x=1758330704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6O+lfSZLBCLtFpNKL/1anVub0eApVizJE0pmHD2kMo=;
        b=w0BpXIFtbG7uQKdmNLUY+5fzU/iiRrHsQ7deyd9FUR4KoYMsNy7RKxAtpdoYwquHwa
         PJ9GFhxK1Y432USh+mPV+CBV8WflfOImpXXVPaiNAo5ZZcf8ue33eUWWJChl8cHP7ie0
         2dTksVRnoImy+MEP+B8uhE52ae3sLVSmhn3EZB5cCOk4VNiIyYznUoUDEOskRZcZ0kgx
         P/bfn901Ps7XrPFhs1Gbxxv5x76fzZIrxPueHP96xXBcH50yFLh+n+B0AUf+kTVjKkPW
         82wEz/4Ryoj3OyotIh+XnQ/lvkFkWeeHH+Y4KPjeBl9PjAGaNiIQ5AbAh3IF1t7NTgaW
         EF5w==
X-Forwarded-Encrypted: i=1; AJvYcCXhVEq6Xa9tUZUDMbAsI5g8Ye3I49ZEx28KVOr95t6sYs5AyRfbhxjB+JXo8Kc21OCcnKzmZ5FgI+87IGRiKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ8ZFPhm2wfB+Q02ise0DK0ro1UYyKHQKmGv2UCJvNNcKT3kWn
	h3zziX991XsdLl4+rUazCDbpWv/jE0L5Wt6yB4ACN4PySMJfrGzR0efL
X-Gm-Gg: ASbGnct+4uCm0w4CBbq1boBF0w1mZb+fr83zhBteWGakssIBTcyvP6AybW1e4JQ/XDi
	F+GOHLbIhSOMS7y9kmCDcMZvwf8crfcJGkzAmOmvCUz6gnuZ8R6ZycBrqocTq1LZ2XIRgb4FBHl
	vxdSsakig60DkhP7h8KonNYoL5nitsjdK+bSiaDZgE2JspcBXnlAelf/SEro9iY7x2cbAfk+BqV
	VnmeoYgNdLs0+YG9xHiuU+F/Gm8JIuS5RvQxqCu8VTHdoecEgUUO8uaScnkcEjtuOne1ISDZ9HX
	dlXtv7g2CLoqgJx62nTq9AW/kiLRNnNFHY6BxelAbgELmSbgMvi1oOO1ESSmYa97VFlHg1ygedi
	dRyf+wGjswQJDsT5bQsw=
X-Google-Smtp-Source: AGHT+IEEs4w0VYWOrTZ2mf5mPdRdgIBBMsi5zMJEle+Jt2EK6Q+4TbCNWtdbvmdxcJfUUMXxxDwLfQ==
X-Received: by 2002:a05:6402:5242:b0:628:a4fb:3b44 with SMTP id 4fb4d7f45d1cf-62ed825998fmr4990182a12.1.1757725904210;
        Fri, 12 Sep 2025 18:11:44 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62efb5b8b0asm913566a12.20.2025.09.12.18.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:11:43 -0700 (PDT)
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
Subject: [PATCH RESEND 29/62] init: move virt_external_initramfs_{start,end} to init/initramfs.c
Date: Sat, 13 Sep 2025 00:38:08 +0000
Message-ID: <20250913003842.41944-30-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_181146_214438_71EFA477 
X-CRM114-Status: GOOD (  11.42  )
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

Move definitions of virt_external_initramfs_start and
virt_external_initramfs_end to init/initramfs.c

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/do_mounts_initrd.c | 1 -
 init/initramfs.c        | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index 8bdeb205a0cd..535ce459ab94 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -12,7 +12,6 @@
 
 #include "do_mounts.h"
 
-unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
 int initrd_below_start_ok;
 
 static int __init early_initrdmem(char *p)
diff --git a/init/initramfs.c b/init/initramfs.c
index 9a221c713c60..d2301cc6c470 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -600,6 +600,8 @@ __setup("initramfs_async=", initramfs_async_setup);
 #include <linux/initrd.h>
 #include <linux/kexec.h>
 
+unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
+
 phys_addr_t phys_external_initramfs_start __initdata;
 unsigned long phys_external_initramfs_size __initdata;
 
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
