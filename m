Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99E0CAC582
	for <linux-snps-arc@archiver.kernel.org>; Sun, 14 Sep 2025 03:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wiHqf5anQD5v6jmX/GRaQ8MbJO8Slbn2+pr14dfV74o=; b=bbIchaNrh01U07
	V5cxgLM0y2u5E+TglZSiw9LvBZ5byTUPO+1S2zi9hF9Jq2zpLzNKSzLP6vT5wNIGB3K/afiw4IYZ7
	lgnfIQhqVCt/9Q54l/Kv7+n1TFRIRc4U3Qn4o0jx5xe9kJpfCoLmZlAZN7NhbtyHuUXk9ONZV8OUa
	SBFdIseMGC6ZPSA5fQ6wwjABFa0+Yz9Jbpkn3jBhO7WT/wdLO/jA1lzJxiDhbqv4VfbS1/EvxxDtO
	KcSEXnUHSFt3eJSgn2R+hJulhAcRDRPNS5IYo2cTkf1UOkMmkf7AYlaXkwB91PR0s2Z+14ekRiqY0
	BCi/kQ6/XSM5GzABamIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdtd-0000000HPiE-1nh8;
	Sun, 14 Sep 2025 03:59:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdtc-0000000HPhD-2vfy
	for linux-snps-arc@bombadil.infradead.org;
	Sun, 14 Sep 2025 03:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6PVDclpYQ6Nji01yBeit38rRV0WhZ/F6Ahkj7S8LBJ4=; b=HM1VdaRsv7MDuvK6xi2ARc7+mT
	+4pUexwhSkC+C3g5eIuVry2AZORauSaMbIkdnd7E9OvrSDaNOfO3nnQQJ+DImepAeTflZzgu5wD4k
	3ue8pOU5+9vwYPK0HIy5fK/6VSHjK2Wf2eHzeQ31FeRglrl4BEVRLwqUyWlxZOd31vYt9y1MclMBg
	/IzI5wKAPDtWIm7iNtGB+38IyztqGCruFF8DcD6PQ9V0OONlbum2IYwCah+GU6Dil0nRc2sesUQyv
	JA2marXFv61YsY/oiCU3y6kuBs7WB7y9NMzJgS8m2bwfVZiie5AX0W5mI3DhkQJyWWylrQ9pbL/4B
	Vdq5eCsw==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdsd-00000006iMH-0hpL
	for linux-snps-arc@lists.infradead.org;
	Sun, 14 Sep 2025 03:59:17 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-62f261a128cso707180a12.2
        for <linux-snps-arc@lists.infradead.org>; Sat, 13 Sep 2025 20:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822300; x=1758427100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PVDclpYQ6Nji01yBeit38rRV0WhZ/F6Ahkj7S8LBJ4=;
        b=UlaR3A4Eq3aQNFev7CLeZxHJNYT1TEVe+xLhS9Kkv6jccSalneg5KmwL0FdI2pD09y
         EooojtIdFQ9Nj6+YZeZNt2kYFKC69Bs4czjBQNG6IeLmWjsJcXVeSfoQuLB2rQGlYM4x
         i05hEzLOXO4Q57/ds96jpSMFIOSWfcjBkCsjgLWsp/RfHKTHZC31yg/yzxBfkSAIZ/bH
         EGo5ZaYOiu+mbiwEEfbblYPGaOCstuP3UaeeWsg0yej+QWvy8e1Y/jrfLt8nw8IwVWEX
         wPlHyH26aEqVsFFualqrQKsw+DkZtLysxp7PVSnpAO2ait+lqyrji+3pnyOUMmUz/P+J
         YajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822300; x=1758427100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PVDclpYQ6Nji01yBeit38rRV0WhZ/F6Ahkj7S8LBJ4=;
        b=bPangy12pmG4isLSBIkaUeHTAWyLGhw6gCg7Oj6rkFaYmmAk2neaA3bB0PmKRd03Ty
         yBDVbYgVfZnTa0zKX51WrGdGzFuSKvTgBa4dkvtvm+33NXbq/g6MCETbSiz009T8IuW/
         t0A+Kn7y+DZ+W49WkfhSWS/DGPYOYAjuUadzoZfNAoSWLDJwJK/d3OFPdGKzyV4czXeS
         33tTwx3ljSVxeMY51cGlYRdrbHuE7Hqcl40wkZ0Kk0Q93hTlXc48RMq2rYPd7gMTyxza
         tShalBRIyE8/vOnevnvqXvrjwqwOFyrcDzn3AnaqBSnOYKIp8mQa5Cd3CpC8hWuFUe1u
         x+Yw==
X-Forwarded-Encrypted: i=1; AJvYcCX1Ph1EIofd3vaI0xqyNhQb5D18QWvxlHxKOSdYnkiJboVqqd4PID0Rru88CTbHsnMg8EGWLIkky/p3WnMsAA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtcx4Nhav6uzSWTnZyhef6XIeyNoPu+1pURRVM1xLg7E0WvfQq
	QrISkqKp6iDoDw4DdRMMtjoe+JnzchPQV9qZXgWk3hhU6zoZJCXE1AMp
X-Gm-Gg: ASbGncvBNqdDsszxeCabSfmkkeedl2tCNnDRf/AE0REDSw2eqexxQM1A//JzlbOVw/u
	DZXkHZBoxLkmnO8LZ+7gEqBsZ0LijhSGvCGQ6kvE/V8Ewkm7igAOy1NqXKG9z3xARq6C+lN00vE
	Pudz8/31S3twTU4g5oXitX6tsBUWgd/w+GfiHSlvOlkAjlJX3XcVA7x0o6aJ5DSRBRucAPxI/lY
	lLmq+LUJC3dfPfLNWiURQKjzY0wUlbw8CWVF3PcnZsMtAEWnCH6Qc9EC7+ehmSSTwQM0KVwo0e6
	lAgCnXixv13b2oP2/a6NSgP4/FnSWr1phDLvaJeEbglRQp27uBF3T7rfTAYkfxUiJL2E+Q/RCYc
	cTG77qcaQxjs/H3h0n/M=
X-Google-Smtp-Source: AGHT+IEs7a72WksMtWatD4lSFnDxnNg7+5MS1D9GOkH6MKg4k8K6DTsXjCx54xq6hKPtDzIS4c8/bw==
X-Received: by 2002:a05:6402:42d2:b0:627:f47c:b199 with SMTP id 4fb4d7f45d1cf-62ed82599f7mr8759493a12.8.1757822299751;
        Sat, 13 Sep 2025 20:58:19 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62edb7d9cbbsm4735738a12.15.2025.09.13.20.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:58:18 -0700 (PDT)
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
Subject: [PATCH RESEND 51/62] init: rename get_boot_config_from_initrd to get_boot_config_from_initramfs
Date: Sun, 14 Sep 2025 06:58:14 +0300
Message-ID: <20250914035814.3752803-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_045826_152282_8BA84BEC 
X-CRM114-Status: GOOD (  13.02  )
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
 init/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/init/main.c b/init/main.c
index a42f1f0fce84..c535e0613df8 100644
--- a/init/main.c
+++ b/init/main.c
@@ -264,7 +264,7 @@ static int __init loglevel(char *str)
 early_param("loglevel", loglevel);
 
 #ifdef CONFIG_BLK_DEV_INITRD
-static void * __init get_boot_config_from_initrd(size_t *_size)
+static void * __init get_boot_config_from_initramfs(size_t *_size)
 {
 	u32 size, csum;
 	char *data;
@@ -311,7 +311,7 @@ static void * __init get_boot_config_from_initrd(size_t *_size)
 	return data;
 }
 #else
-static void * __init get_boot_config_from_initrd(size_t *_size)
+static void * __init get_boot_config_from_initramfs(size_t *_size)
 {
 	return NULL;
 }
@@ -420,7 +420,7 @@ static void __init setup_boot_config(void)
 	char *err;
 
 	/* Cut out the bootconfig data even if we have no bootconfig option */
-	data = get_boot_config_from_initrd(&size);
+	data = get_boot_config_from_initramfs(&size);
 	/* If there is no bootconfig in initrd, try embedded one. */
 	if (!data)
 		data = xbc_get_embedded_bootconfig(&size);
@@ -479,7 +479,7 @@ static void __init exit_boot_config(void)
 static void __init setup_boot_config(void)
 {
 	/* Remove bootconfig data from initrd */
-	get_boot_config_from_initrd(NULL);
+	get_boot_config_from_initramfs(NULL);
 }
 
 static int __init warn_bootconfig(char *str)
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
