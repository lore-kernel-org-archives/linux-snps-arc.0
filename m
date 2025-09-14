Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB8FCAC58F
	for <linux-snps-arc@archiver.kernel.org>; Sun, 14 Sep 2025 03:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WNy7ZEWx+zd9KD7ACUQXsGUhCNYzZIZiPJV+DeUF5y8=; b=wpHBCwL729yWeO
	uQ9dZdogpvJ/ocKF+gnuXeuA4UcuW6dQkGRDsutCvvWESRPnxQLZPcZwGWVWrdp3nYvUgYWfMcAWB
	6sxjzsGlO3rBKREgBr/q6SoTYx148jbNK7SoFv+3GsiAJ3HX++ICasnxHqfb4np1edgKN1NXu2v0f
	tNjYY2sSaUJpiLAJNAlkLa9YYT88mqrFPgtZYBh6hTDwCETsbr2C0X9RLdMtfkaLCuyV3Z/munetU
	WzEB2NRUwfqDuxNCAOFJjb2TRAeTuBSnsS1b3aozAG20l3Me8Tw0kGPv0wjsmxOM5f5CnlB4xQODh
	1t7DSGAseJp3iB58O9YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdms-0000000HM4a-1DWg;
	Sun, 14 Sep 2025 03:52:26 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdmo-0000000HLzt-0yVj
	for linux-snps-arc@lists.infradead.org;
	Sun, 14 Sep 2025 03:52:24 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b07dac96d1eso212406466b.1
        for <linux-snps-arc@lists.infradead.org>; Sat, 13 Sep 2025 20:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821940; x=1758426740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ji/7LeyyXA3A1wf+r0NloCDgCP9kYwAbhvqoNAjAUZw=;
        b=gDez8bQiwVTEA1xSrhw0aDZx4gpAahu1lFz2uDaAex5LIgvS39kEkPqTfn5nFrWTQD
         ZTykEjEwDxJYVxjxOdz4nqe468tsa2xBRD17qocoPvRThmI3qjoCjGEtlnNVE+oK9IPX
         jb2/OeQX9aoZw9L4Gc+AFOAqKmuwZ080VMmHFEwRqii1lRnEjTYPtRhtmnVr8Fbt7zvD
         DxjZOJdOMt0ASv1UqYhCBY9Rh+p7GfkUWr7xG32fWVuz2cM6bQN2zT9TSyL1/iu0P4oA
         fXWieml8sjlojHV0VymMnTlRfViZtAuce4g+2WvNZmoX+Dcy+FcgOjBAyo8thTV/+0JT
         HYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821940; x=1758426740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ji/7LeyyXA3A1wf+r0NloCDgCP9kYwAbhvqoNAjAUZw=;
        b=ojOa3y3BkgVObK128Y7lIMW+Yy42KRCUf0hSOdLayM1MwVyHY9AN1r3EYFPdVYCmO+
         neyNnGhQA0kBQ+996+8saGchsMrbfIfjc2RzERBApJBTmvAxusDEvxarGw044QHRUif3
         9syAljO8BVq5AeuvAfUcLCnY2oovHZQvpdNNkERDLKNKgjSu/CiPbAG9qv5cnfJtvdVm
         89UNVfTql8Rvo9qUQTDqZc4y0Zb2AIl8BgeXBHdnvwKm3MXw84KH2ejusu4wmztsGpPD
         7h0aONhuXveOg0uzdVvLJss9iOm1I8/lMewt+DkqYTrg+ITCClzxb7lA7zNNZJVbydLB
         l4+g==
X-Forwarded-Encrypted: i=1; AJvYcCUMVG5NDjz09EMxU8uB5fuKDAf9Q+GsRpwh6MCxSuA6kYyHl8IPrum/Pt1N0IdeFShhEsAPFt0HSvNBVfrhIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy97TkhTSQ9R0b9vmS3LgMD1zlFfniRx5/8qpD0cvPD1asxPeL5
	rlC/tW+t5XQ0GcEZrajMBPCU7X/dPBzZH+TX7TJu7UVMfJnsZlQbaro/
X-Gm-Gg: ASbGnctMLtXBE9yGAWDpTrYp4HVuXLHhA/0kH+4eiooO7ngwR4TQOkiPOlUmK1KfwWr
	iwjlMxUkauRbr2W96OOCSyTXASiPfEn5+bUI3QrYiq5EwEfvb95BS/9kD8ZzqcWcA1LUx3siJxm
	832z6e9jysdek+EnXt6LudwWWxVnKpwrROs8zVxIZaapTkFkc4AqXLQZYAxFHIvaZK9DTaIwo9A
	E7xJD2rFp9dm5x4ex+RC/eE7uZoX+L9XagkbO0v5d1XSb/QtiJ7oFk9/0GGnjWr34zV50wlhXsa
	sapVrxkH8Pzbx1sU9PInkhxIi2oks8z3NkLZ0t8V4s9aBpwryddeEZEWfgzsEGF9xOW/d2HoAim
	5ZdSGF9XdAU82NsJX3xA=
X-Google-Smtp-Source: AGHT+IFrowlqfzYJmQGTHyfqsFCL1BbKqEywr8+/6hRK49j3T1AOHulukHNAqoGa7PMdZRPYrPs7MA==
X-Received: by 2002:a17:907:3da2:b0:b04:6157:43b with SMTP id a640c23a62f3a-b07c2544bb9mr854247466b.25.1757821940418;
        Sat, 13 Sep 2025 20:52:20 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd88fsm669745266b.51.2025.09.13.20.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:52:20 -0700 (PDT)
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
Subject: [PATCH RESEND 41/62] init: rename reserve_initrd_mem to reserve_initramfs_mem
Date: Sun, 14 Sep 2025 06:52:15 +0300
Message-ID: <20250914035215.3641628-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_205222_294352_4FD69357 
X-CRM114-Status: GOOD (  13.51  )
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
 arch/arm/mm/init.c            | 2 +-
 arch/loongarch/kernel/setup.c | 2 +-
 arch/riscv/mm/init.c          | 2 +-
 include/linux/initrd.h        | 4 ++--
 init/initramfs.c              | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 290e9f9874c9..a564cbc36d18 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -186,7 +186,7 @@ void __init arm_memblock_init(const struct machine_desc *mdesc)
 	/* Register the kernel text, kernel data and initrd with memblock. */
 	memblock_reserve(__pa(KERNEL_START), KERNEL_END - KERNEL_START);
 
-	reserve_initrd_mem();
+	reserve_initramfs_mem();
 
 	arm_mm_memblock_reserve();
 
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 075b79b2c1d3..226262f35dc1 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -602,7 +602,7 @@ void __init setup_arch(char **cmdline_p)
 	pagetable_init();
 	bootcmdline_init(cmdline_p);
 	parse_early_param();
-	reserve_initrd_mem();
+	reserve_initramfs_mem();
 
 	platform_init();
 	arch_mem_init(cmdline_p);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 15683ae13fa5..b1c4876dadae 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -295,7 +295,7 @@ static void __init setup_bootmem(void)
 
 	dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));
 
-	reserve_initrd_mem();
+	reserve_initramfs_mem();
 
 	/*
 	 * No allocation should be done before reserving the memory as defined
diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index b2a0128c3438..51c473b6a973 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -10,10 +10,10 @@ extern unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
 extern void free_initramfs_mem(unsigned long, unsigned long);
 
 #ifdef CONFIG_BLK_DEV_INITRD
-extern void __init reserve_initrd_mem(void);
+extern void __init reserve_initramfs_mem(void);
 extern void wait_for_initramfs(void);
 #else
-static inline void __init reserve_initrd_mem(void) {}
+static inline void __init reserve_initramfs_mem(void) {}
 static inline void wait_for_initramfs(void) {}
 #endif
 
diff --git a/init/initramfs.c b/init/initramfs.c
index 7a050e54ff1a..a6c11260e62b 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -631,7 +631,7 @@ early_param("initrd", early_initrd);
 
 static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
 
-void __init reserve_initrd_mem(void)
+void __init reserve_initramfs_mem(void)
 {
 	phys_addr_t start;
 	unsigned long size;
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
