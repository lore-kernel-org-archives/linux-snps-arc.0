Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4734ECAC582
	for <linux-snps-arc@archiver.kernel.org>; Sun, 14 Sep 2025 03:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kh/jBa2juhYQWG26EA2lym+WJZhzSqKRDD4X61k9Fhw=; b=1r3EkUDomYrxO6
	sFCkdzBAYrZ6Aut94Pw15QPIXjoNu9NTxyU1dd071xAEl/NzVFu5DWMKHx8ep2w329tJq64yLERnW
	uw7HHOuDmCptQrW6yDsQnggqW9JsONFFuX3Y0mBdpIfuFhK+tiXLWE3hQn5OXUpKuf/P5CJBl1BEi
	h1Il/OXVdT3zg8DDZmZ5BjOzeajFCHUVLRcX3wEHawsnpZnKVoDxMKeeR5WDacG8k+th0Evt3io7v
	yfCGJ9E1U9OgWzr3SpImghQsorxK3snbLWuFaZ6z3aFLyeCfac631o92rx/1aVALvRTJnguf7Wx+C
	Ky1Er8yuRKxnSMD7oMyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdtp-0000000HPqq-0BYB;
	Sun, 14 Sep 2025 03:59:37 +0000
Received: from mail-ej1-f43.google.com ([209.85.218.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdtl-0000000HPn9-3I19
	for linux-snps-arc@lists.infradead.org;
	Sun, 14 Sep 2025 03:59:35 +0000
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b04ba3de760so404207066b.0
        for <linux-snps-arc@lists.infradead.org>; Sat, 13 Sep 2025 20:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822372; x=1758427172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9abWz0+AALTE1DyE86pUo1tihrL6Hn8wt7mMTmG960=;
        b=Dp9/uUkFHX/uFX/XB1RXTpXEMWavlyFhAVDucZKr0i8nOEDUUqxzHTqGfXi4HAOHZ5
         SNeuZ7z/1zdaitEzyiBxQEu/0PSkiYdt65Lfz9gb1kSGW4oCsn4lw3dRTl8hc1l7xQOa
         fnFC3fD9qwefHBci0EVNwCSG6exHWyw+2mcSx4itguNXHBOaNkXpba/i6l+yfPcWJyIN
         bKJE2UEfwRahqGTn10A0dRybl1QhI9l0WkEI2qpJNvWdKHzXqqDmJZNszvDnNFJg3nDe
         hY0kFF9Q2U7ES5TGDck3Gozp+PL+8+Y2AWgXq2m9VhP7n0gVrkMtWHIQKFywJ0n0V+Qs
         eo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822372; x=1758427172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9abWz0+AALTE1DyE86pUo1tihrL6Hn8wt7mMTmG960=;
        b=lco0KFRrw2/oEQY1HdPWSrh0BEypsJLP7O9meyNKVSARCH6auUqAVXmFvv/B2drFjk
         K8pEdsWE42FtXiMPVfFtkAqg2QQaahZAlW+Ys6ECY0pB1KjITndjIlqcyCYjVAXhD7HL
         3cfbQQUUwUb4af+C3XE6IrUliwVMqFm0EgtpRtRo9HUG0wPNz+ix1b732kkwKyEJvpp0
         YPYGzOzrYnrWqIfp1NxOuXrrOZWCZVHaaw1x5UPDp9TCRW55FS5ekxj5PGXgydIjKlv0
         AmDWatPfafJP6bGRPOJK1DPKFdGG4fxkovqHtgmiCAbxdPpPHsIvMSXa8I101zTpFP2i
         5kLA==
X-Forwarded-Encrypted: i=1; AJvYcCUXRwI6Y+cMPUUntqx9Zm1wbxyUVkfsuLcU3HQzdNzjYGvV9a2lzonENyteWr++DHfdX6DJUoQagE/Q1rdSFw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr2o5U/RQEQDwe9RJpf8QpfmG+cJGlY6oAPIkvgl20kkTULs5q
	XTMC3av7NEOzIGQhvUE+zSfsJXNPsobLlho9CV0hITEp85LJ28hNs2pQ
X-Gm-Gg: ASbGncuMw+4htAgA0dQi0c5qTZvF0hyBmEt+FM+wvNLaDYE0x6t5T1G0m3IhMXIiEk0
	RVRHSVygBLRU/faqtrpzm2AkAUTVDR1KHpQdSHTs/uWvNIvfkXcu+sdC8t41ofHd3EWFXQj7K5i
	3tMPJ4df+8EjDZM62JX5oKGznLH3HjZdTh+PZ8Ho/lfbaRTGlfitDpgwnifDymQy3FVXo2wuKiz
	ifC6iHHy+KBG1OSxi29mogvw5XQZ+XewITJFSldUKawCwFShv0Dx72/E2AGHYNERrOAQBC1HC62
	TNRWuj3PhY+ri3JI/V7iWsEMWZKHhXe2GCI4sLYiy+6KCbIShodY+annRxXO6Bd21Z6I6f86snR
	KeEGEZNwpnnoAxu2qRK8=
X-Google-Smtp-Source: AGHT+IHIaNmlQUOqaI2XvHaD2x2sJJCA+iwXMxeIqgPaozK4MzRrxS2gXxwIxVkINaRf0GrOSh3U1Q==
X-Received: by 2002:a17:907:3ea6:b0:b09:48c6:b7ad with SMTP id a640c23a62f3a-b0948c6c6a4mr387666066b.57.1757822371514;
        Sat, 13 Sep 2025 20:59:31 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07de03d93csm287001766b.12.2025.09.13.20.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:59:31 -0700 (PDT)
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
Subject: [PATCH RESEND 53/62] init: rename kexec_free_initrd to kexec_free_initramfs
Date: Sun, 14 Sep 2025 06:59:26 +0300
Message-ID: <20250914035926.3770703-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_205933_831638_274BEF71 
X-CRM114-Status: GOOD (  11.57  )
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
 init/initramfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 40c8e4b05886..d52314b17c25 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -690,7 +690,7 @@ void __weak __init free_initramfs_mem(unsigned long start, unsigned long end)
 }
 
 #ifdef CONFIG_CRASH_RESERVE
-static bool __init kexec_free_initrd(void)
+static bool __init kexec_free_initramfs(void)
 {
 	unsigned long crashk_start = (unsigned long)__va(crashk_res.start);
 	unsigned long crashk_end   = (unsigned long)__va(crashk_res.end);
@@ -713,7 +713,7 @@ static bool __init kexec_free_initrd(void)
 	return true;
 }
 #else
-static inline bool kexec_free_initrd(void)
+static inline bool kexec_free_initramfs(void)
 {
 	return false;
 }
@@ -743,7 +743,7 @@ static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 	 * If the initrd region is overlapped with crashkernel reserved region,
 	 * free only memory that is not part of crashkernel region.
 	 */
-	if (!retain_initramfs && virt_external_initramfs_start && !kexec_free_initrd()) {
+	if (!retain_initramfs && virt_external_initramfs_start && !kexec_free_initramfs()) {
 		free_initramfs_mem(virt_external_initramfs_start, virt_external_initramfs_end);
 	} else if (retain_initramfs && virt_external_initramfs_start) {
 		bin_attr_initrd.size = virt_external_initramfs_end - virt_external_initramfs_start;
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
