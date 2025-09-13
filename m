Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32849CA101F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 13 Sep 2025 00:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJOzKDZSSNBr7OqwiFurG0RtfYMX7QYIBNlK5h2Litc=; b=elN0oOaqgQDk3o
	h9eOgTrrRDcbX5Y7vkGXJ7LEznZByxkEmQj7uiAVlVgLRVKjP7gred0NdIJfwEiDfl4am/t9hgMwG
	uz1I8aSUdSI4sNABq9RP/N28KRcm7htq5cQ3dVKIMw4ZPc+OJp84a4DgdpTQaNEQkWSjriZ2WGKhB
	FZCW+sPF6SDirzjkJtMUT12ZT8jW3jJCSy5P4vxVvjhoXbUvR/KMp1ALeMNTnUjas089cxF9t2dGj
	eCh48bjqJ4j7YQZHwqNdlsLjFzvkMB/tC0Dy0PnY/HdGsdGKgJNOTRHM1/x6JJC3IJBzyyDhowKhX
	NHeVHQ4zmNj16fmmSF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEML-0000000CN4d-42UJ;
	Sat, 13 Sep 2025 00:43:21 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEMJ-0000000CN2Z-2L8n
	for linux-snps-arc@lists.infradead.org;
	Sat, 13 Sep 2025 00:43:20 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6188b6f501cso2891015a12.2
        for <linux-snps-arc@lists.infradead.org>; Fri, 12 Sep 2025 17:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724198; x=1758328998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBhZ+rO7As9Va0yYpTLBkeUqDA8zrexqjuJeztCSNI4=;
        b=T8Oh4oTmaagwrBYX0s8dW+6YLSNVPkocPQQEtgg78u34EJJf9XOyOK2hqCbDcQBr59
         lGcGgRIjBp1CJHREzuIE65E8uxgm86sSosWYp/9oSvmtYpbPkH2tath1WurJSiRg4hqk
         jP5iP15KsReyqvto8Yt6fPr0vE/MD/JD47R9ThFCkttfrxR1VIW+to7ZQp/xg6ydlkNx
         HG2IslEkNDVsetW9DTdgmRu3KF+AIMT4Ab2UYBSCo/A+qJ7YmNCiSGONDzgJwe4VAS54
         R8MO49efkviX/5KCFPwPz27psOTqdBPW5PMkIiXD/I4XswDfJj8fr3bYvuVuEsVfqneW
         gA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724198; x=1758328998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBhZ+rO7As9Va0yYpTLBkeUqDA8zrexqjuJeztCSNI4=;
        b=qpe9UwAWL70R/mzZ/aFn+jIpMvBLWhJQEF/BR210WpBtskfuF3DeplnELa386162Cp
         JIRWdCVFcyRcBzzufmzaQnmgvozsDId8ps8rmjjyU0+rvvIF3rBmdamLjXmh8tKzI7Es
         W5qcu2DdRuYhka+V2gOjZjQk9VgoFuvkcKn6kgFTnX7HSSXI6A7sghchLytzxikBnKUr
         JrdEa5E9oOe4RYo2UzPzdcdnijpp2KAdrux6kwhAcl1x+PSHvL9O+cWVqRHif+8mntZU
         KFe9MFG2U5gfI9cbK8maiHcp1LeqWoZRiEdEEjwjxz1cx0AkTX4ziTtj9CbzzuHqEE8s
         3GVA==
X-Forwarded-Encrypted: i=1; AJvYcCWenZRs+3CpIvTTdKszinYU9SRZUwubEQq0BOKsjcuMZvtmSfSHqXgZnbdkTtvAEnavtQF5y0VLQ0/NnudoIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxP0kkCPKSz8MZOgu50s1+RhGj1bVnk88aU1hsdELrnOZvoNDab
	xqS+WDsLUo+wMzQTWkaRugeqoZsVfEjRPs05vYqO/XSwrUE16++qyjVi
X-Gm-Gg: ASbGncskvjJ/bR/tA0tSxyQ4KkIITC+M2ri7D7u/abe7Oq9A+/ExQ0gOtT9/GwEp83G
	NSn/+g5k56O0KdlOsQ6KaEHtzpat5N7ZCuFG8beg0fklAd2Dek+pNW1iNxM2GhHu89HI/Gju9dL
	aa/9RyO6iD1oEjfDM1ABWY2x9C8Wywnjx2+1UXJvpgElb3dMXUKujfm4b6KRpUfOPIiTBKKrGDv
	SEO86uT0qhZOjQBD64J3eyOn7n98mzGwsVyMwrIlQY30/PiwztytngsxwWcroawvDSYfbKNWs2i
	X9O5FezvV6hq+awXZs7TSgS5+qB2PnBCz+aYpIm6AlE72GlX33aOhFnVIUvj2EgL2q4MWN0thm4
	iIPF3JApg5gNuy6LhlKw=
X-Google-Smtp-Source: AGHT+IHHzjbduKroQCN+yZXT2xkuDjXRSEwS3nHiIMvASVJIn5ZPiks4NchkJZtKdw5/XwXcHwo3Pw==
X-Received: by 2002:a17:907:9405:b0:b07:c9b2:dbd with SMTP id a640c23a62f3a-b07c9b20f2cmr456569266b.4.1757724197720;
        Fri, 12 Sep 2025 17:43:17 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07cd14268fsm196477866b.3.2025.09.12.17.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:43:17 -0700 (PDT)
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
	patches@lists.linux.dev,
	stable+noautosel@kernel.org
Subject: [PATCH RESEND 03/62] init: sh, sparc, x86: remove unused constants RAMDISK_PROMPT_FLAG and RAMDISK_LOAD_FLAG
Date: Sat, 13 Sep 2025 00:37:42 +0000
Message-ID: <20250913003842.41944-4-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_174319_627394_0305AC0A 
X-CRM114-Status: GOOD (  10.21  )
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

They were used for initrd before c8376994c86.

c8376994c86c made them unused and forgot to remove them

Fixes: c8376994c86c ("initrd: remove support for multiple floppies")
Cc: <stable+noautosel@kernel.org> # because changes uapi headers
Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/sh/kernel/setup.c                | 2 --
 arch/sparc/kernel/setup_32.c          | 2 --
 arch/sparc/kernel/setup_64.c          | 2 --
 arch/x86/include/uapi/asm/bootparam.h | 2 --
 arch/x86/kernel/setup.c               | 2 --
 5 files changed, 10 deletions(-)

diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
index 039a51291002..d66f098e9e9f 100644
--- a/arch/sh/kernel/setup.c
+++ b/arch/sh/kernel/setup.c
@@ -71,8 +71,6 @@ EXPORT_SYMBOL(sh_mv);
 extern int root_mountflags;
 
 #define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
 
 static char __initdata command_line[COMMAND_LINE_SIZE] = { 0, };
 
diff --git a/arch/sparc/kernel/setup_32.c b/arch/sparc/kernel/setup_32.c
index 704375c061e7..eb60be31127f 100644
--- a/arch/sparc/kernel/setup_32.c
+++ b/arch/sparc/kernel/setup_32.c
@@ -172,8 +172,6 @@ extern unsigned short root_flags;
 extern unsigned short root_dev;
 extern unsigned short ram_flags;
 #define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
 
 extern int root_mountflags;
 
diff --git a/arch/sparc/kernel/setup_64.c b/arch/sparc/kernel/setup_64.c
index 63615f5c99b4..f728f1b00aca 100644
--- a/arch/sparc/kernel/setup_64.c
+++ b/arch/sparc/kernel/setup_64.c
@@ -145,8 +145,6 @@ extern unsigned short root_flags;
 extern unsigned short root_dev;
 extern unsigned short ram_flags;
 #define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
 
 extern int root_mountflags;
 
diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
index dafbf581c515..f53dd3f319ba 100644
--- a/arch/x86/include/uapi/asm/bootparam.h
+++ b/arch/x86/include/uapi/asm/bootparam.h
@@ -6,8 +6,6 @@
 
 /* ram_size flags */
 #define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
 
 /* loadflags */
 #define LOADED_HIGH	(1<<0)
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 1b2edd07a3e1..6409e766fb17 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -223,8 +223,6 @@ extern int root_mountflags;
 unsigned long saved_video_mode;
 
 #define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
 
 static char __initdata command_line[COMMAND_LINE_SIZE];
 #ifdef CONFIG_CMDLINE_BOOL
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
