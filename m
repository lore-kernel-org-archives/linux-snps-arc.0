Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06788CAC582
	for <linux-snps-arc@archiver.kernel.org>; Sat, 13 Sep 2025 01:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+22NZ3JJ9ZKxYXGteb4NdS/L8ICn3bwBZZaQfQ7RbA=; b=vVb+Z7S1TgC80S
	Bw/afeClaCRN2oKkZVcgZ9292AitggGV/+PQ/zOwbBGGz9D+2Ke31x7P9joOgwO6b00ANLS88QpR+
	k5XIdrlhs/HaiGYOOVkhvHouOalMfb1Pb21bi09HGbAFZ4ohCjX6Sa7n9YzgdBpfjUvuHgamfXYCR
	LvisgyxobB2cgUUfNa96O0cbSYk0EvPubl0fizX7xvqDCQmDCHNrtbtXb5AInYH3InFKxbNzfjHiT
	2sXDH+/HlEsCHMmQRNxWFLqB8btc0oeAJ2BZyV2aRcB3dH90cyKBtDv0oA7AqODNkYegGDQnUv14v
	+zpgjJafvmdsuKqcVacg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEkk-0000000CWhp-3J4m;
	Sat, 13 Sep 2025 01:08:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEkj-0000000CWg6-22Ul
	for linux-snps-arc@bombadil.infradead.org;
	Sat, 13 Sep 2025 01:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=076xoEVbaVUh2WXJ09mT2DE1QkI5WvxeMmJOzlrP1Zs=; b=I1hw6UzLaoA6uqJFCgrCuPhH+b
	g7lJQd8bVNEoVaqFTOw2WXRzN0kDzRKfzC0Mc7ye68HC9NQayTUUJaKgXll5gLNH74lUNe/jPGb8u
	jDqkQTmWA0VEDeG93p875PC9FoZgzp0NJvw+rCmNLQlf6N/FUi5Q4D/fY+EVSd9HX3ltYjehn0R2A
	xMW9VM4ucEB28u3vAbuHR803gIWhIt+WNitcy1Eom/Yfjq9wtXxDbUovuh+0HGxtKpqGZGxGCRI/D
	6zf+5gLQqQ3sn//GwQooK76xMRDIts1W9s7y3cbC6Z9Wz59iIAIlkMN13E454L24z4oKyV2d55PR9
	XcU5eTcA==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEke-00000006W8E-0HeA
	for linux-snps-arc@lists.infradead.org;
	Sat, 13 Sep 2025 01:08:32 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-61cb4374d2fso3678401a12.2
        for <linux-snps-arc@lists.infradead.org>; Fri, 12 Sep 2025 18:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725706; x=1758330506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=076xoEVbaVUh2WXJ09mT2DE1QkI5WvxeMmJOzlrP1Zs=;
        b=Xiwvms/DBu9wXjYHD/Yu5vTQuQ9kmrGB+h+0i45Rnachqb7TVwIqAvdQNlu8wRsGye
         5zImRJxNokp3GwDwO+WSazntR0STL/3QbThGZgNpqxdwagHjvhEsYrXGqaf1Br4JAb4g
         vtuHPDeC8nOzO3dYLAtLzJtSUDFz3c76uGcEjc6W5QkmW1CmxvDxgOiFNEfAXQg/eUhK
         b0B4Z1jYk5J/9uokFU0cPPuao2WpEz6d9b83Y1EetleFEisY4bwwaV0c33Xn7EN4uITp
         SQcFov3ypRAN1LPY+ekUY9JNyZ0/1WOsTGXvXPczA4MiM1YX97jc/X+HH6FUlWw22abr
         RYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725706; x=1758330506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=076xoEVbaVUh2WXJ09mT2DE1QkI5WvxeMmJOzlrP1Zs=;
        b=cPrl+X2w/5RoRkFCd7z9nb3no7RrCTXvHYzqETFHI/8yopPcCoC8309gGM/HZGqJSM
         yoC6qeNMAiViw7nNPwfi26ouE+AAgSYBhLqLB2n2vOYvmWwVz/w3StIHZcR7Ifdy1gqy
         57vXTeQzbkG1NaI1+Tgk6kzYOa/tUcP/4J6cLS4HZfl4ougstwcVE9jVxbcZJq6H9zr/
         vgVWsN9i3kfshgJiMr5pnosLqctyZpw/1VPimV81v+jSx1pgZWeJTEqiwKsXQmRigdOh
         Q2voLbymv7ZS9H7mwnRXgMytZkqe3NUT2z1Y5Rr+O1gaROgDRfZtwxrF5gsxdTlxCV6g
         2hHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqyv/hV6spRox+xoIcM3iOj9izcdd3M0bi+Hyl5gUXWVC0pLDc7Uf8WbgTTWN7HWoEMJOGj0/ZwTOX6sfGIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxatLXXhPLAamL2AtTfB7A25JPXS4IBCFbzY8JffBguzxClQHvF
	4lxT2ySzOxrUHFytVZv3DUf2VeKGQ5/gERJ27MFowkVP938ea5K/eT4i
X-Gm-Gg: ASbGncvgrnu++zxEB9g2U7ovhIh3YVzVty+etvnD9FhBEFS5//2+J+ytwrbcxPNgLlG
	4ird+RwoqnN8Fh7duAqm68FOCUuqzE7TPnyR+dt9eDNIt8VX7w6r9CSyQm055mUixR6tKsFuICX
	kl2sA553ki2VbJcmHmUIWZTKd3ABCuwP+KIOqytjww6qfzkHYmESrCx0yMBdjLCy1KVs88u3udn
	+8oyrQHpxRYSKJWQMHX6hJgnEx3MDyQVeVgAgRAgkVAImgkXiVgnRJ7jXZ/yCQWmper4sTU76me
	s0yvS8hecgwev45OAuO49qh7irSKbU49ceYI5M6y1TaH/0RN7d6hXIKPHdLHWBc+4WSaL/dE15A
	AlPEYfP6eZvKq4d6PFY9dCMvgqeutcw==
X-Google-Smtp-Source: AGHT+IGdk3XVuMADNouJH/aBQO3dgisawWr0ra1gK5dmtwng/BJ+8DUWD+mdbhpnTmhbFrSAIQbncg==
X-Received: by 2002:a05:6402:26d0:b0:62e:e5b3:6388 with SMTP id 4fb4d7f45d1cf-62ee5b367b9mr3462166a12.19.1757725706048;
        Fri, 12 Sep 2025 18:08:26 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62eff1a5c6esm720024a12.50.2025.09.12.18.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:08:24 -0700 (PDT)
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
Subject: [PATCH RESEND 26/62] init: move phys_external_initramfs_{start,size} to init/initramfs.c
Date: Sat, 13 Sep 2025 00:38:05 +0000
Message-ID: <20250913003842.41944-27-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_020828_592743_C52AD113 
X-CRM114-Status: GOOD (  10.99  )
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

Move definitions of phys_external_initramfs_start and
phys_external_initramfs_size to init/initramfs.c

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/do_mounts_initrd.c | 3 ---
 init/initramfs.c        | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index 444182a76999..06be76aa602c 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -15,9 +15,6 @@
 unsigned long initrd_start, initrd_end;
 int initrd_below_start_ok;
 
-phys_addr_t phys_external_initramfs_start __initdata;
-unsigned long phys_external_initramfs_size __initdata;
-
 static int __init early_initrdmem(char *p)
 {
 	phys_addr_t start;
diff --git a/init/initramfs.c b/init/initramfs.c
index 6abe0a3ca4ce..5242d851e839 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -600,6 +600,9 @@ __setup("initramfs_async=", initramfs_async_setup);
 #include <linux/initrd.h>
 #include <linux/kexec.h>
 
+phys_addr_t phys_external_initramfs_start __initdata;
+unsigned long phys_external_initramfs_size __initdata;
+
 static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
 
 void __init reserve_initrd_mem(void)
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
