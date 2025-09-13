Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3895FCAC582
	for <linux-snps-arc@archiver.kernel.org>; Sat, 13 Sep 2025 00:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMN3OrEqcUIVzHv1Er1CaYmHa6V5ovDGWfC/EcP/xTs=; b=O5z2riFc9oc333
	31pU/CiuLF8eg8n03Ej1wjKXPddvWrH+rYCL7tKFOPITP2CLT5awl6ugWHVQS+F/74j0e+Zn7P7ra
	HpajTMXAs2AXCldxddbmb+N4QWZzWKyLlDsVuRNnQw6G5KLN0ato/uqMGPY27qXtOEAybZKAJbLMF
	oStNI+hBrRW1nnH7fGXuzLgjYHt/Z0KchKHTmw2VHAxMQNCcDFDdjyrUtNWwEITmjOYdjTyKTTjm/
	XuJljQdVDD7f/txqeeZylmB2uFVWYHoXEhroEil70OIqHvvTcYsk1isOP2sZtjbYxZTLgwuundE4R
	2cZW4ZlnrM1uMGr3DtzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEWw-0000000CROR-460Y;
	Sat, 13 Sep 2025 00:54:18 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEWt-0000000CRLL-0rLZ
	for linux-snps-arc@lists.infradead.org;
	Sat, 13 Sep 2025 00:54:17 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b0787fc3008so353557866b.3
        for <linux-snps-arc@lists.infradead.org>; Fri, 12 Sep 2025 17:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724853; x=1758329653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNaBVV0FpkKN0cdUwxCZ8fQss5eC0TEeX4co/5GJ2YQ=;
        b=bu1j3IUP5+2BBRIaPED8bLnZsNxN7+QkwIFF1c1eUgYk43usjH95P90YIZx8dIVM2x
         aVoVZAYdU52obf2CVSmK3EmcIkof4R1N5wiHgAlEIbCSMv27oTxNsKcJ1sqKJDItGuSe
         vKKchMasHlDNyLRjSk3o1W97+wq3VrSJKBHmWB5a0/uUGV8JXhJ6Zf3wqpkorAf5ve6N
         FCZ5skxQxjBhXYPm0CiByCSuLSnXM7e4jENMeEkDZCMDJuewSKct0KgJDnKcE40Y/MhL
         1X58GHKsY6/V4bpF9Pd+8dcHpOPzeiKbjDCFaZkVuMxjMmAjI8tJxr7NI1QdVmfDk8s/
         5Bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724853; x=1758329653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNaBVV0FpkKN0cdUwxCZ8fQss5eC0TEeX4co/5GJ2YQ=;
        b=gpKu0pXLJs286FLHbFZYU75zBy/njuwFtDoK9JAQ+9jXw2G4ZkoYnQLA4UEtxWoRu7
         hi5KrBeiOmJOD2lt5cE+73jggxIGe1H5ilYLKCjfxd4iiYYLSs7CoLVTN9vasEi6w86l
         EasU3O4K93W+zISLFN2vc03Tbx4o17S+3QCLc/L3K5FAEB2sWk7vup6pW4el6sDhzYIk
         EBRUDUhbWE46KHxDJfX18h6lHKZcC6aPC0tO+g2jjkDTKSMKLgOMth+74aJ/ocDn3227
         4hIzidcbIEYrR/k4j7XIp3gpCJ9zU5td7W63jnYoHWOdhwsO467y34YIcJvvlzxzGLiU
         ZEPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKK9/mMXA2V6pWqEpJIkHdWCC3lO0KR9r11VQbQp6aPJC6wtT3uLImlq9/8xL5uTL3Xv98N3n9nerTkJEjKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFyc0h4VcbTxS1oQ5OWAPatrET4LwCpiCdVuc9iT04swJwfOBZ
	XA5O4asE1e0TLchZ6m0+RdJqYJBFA49ryLges+he8tffNz5prx8Db0JM
X-Gm-Gg: ASbGncvfHx6Tp0AQbbPlnKLWPXMO053rHJ9InMMgZRx5leijpKfp09nKMir+UOgBN3X
	K9RYN7ZPPMyYLCfbVFxqCsjSQqNgrG02VHNvhph4H6DKWfgITUv2CZwKqp3cI+7jYQCir2X9ZGF
	scJYcyehTjV79ms1Pcs2lDzXoc/yfjmqDEEtqRav/7IK686bIDjvspdNGZK9BRqPNRDfiCbFgZe
	9aJH2N3k3kgljsQumiBtvjU1zhlNJOQrbF0pJNhFamsVs1Ox286yTi2s+ho3dmzfat9oUTTDIUj
	W4DClqzmfrdSeho4EudwL/qQYdZZ8hJUK2iWbif6baj8Uick0QouYyHsOgjYobSSwsHpcoJsCNG
	fYYSDdwUiqHe9+C57xTNh3RuNA3D9KA==
X-Google-Smtp-Source: AGHT+IFRAhwUW5zsVWdQl7rom9u+xngcdJiQFGIxNb9yv6sUT2JdEwHxw5AIwBj5WkuunZa0hzcUAQ==
X-Received: by 2002:a17:907:7e8c:b0:b04:3513:5138 with SMTP id a640c23a62f3a-b07c37fca87mr474198766b.41.1757724853144;
        Fri, 12 Sep 2025 17:54:13 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b30da310sm465332066b.20.2025.09.12.17.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:54:12 -0700 (PDT)
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
Subject: [PATCH RESEND 13/62] ext2: remove ext2_image_size and associated code
Date: Sat, 13 Sep 2025 00:37:52 +0000
Message-ID: <20250913003842.41944-14-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_175415_265337_7170A2E5 
X-CRM114-Status: GOOD (  10.68  )
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

It is not used anymore

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 fs/ext2/ext2.h          |  9 ---------
 include/linux/ext2_fs.h | 13 -------------
 2 files changed, 22 deletions(-)

diff --git a/fs/ext2/ext2.h b/fs/ext2/ext2.h
index cf97b76e9fd3..d623a14040d9 100644
--- a/fs/ext2/ext2.h
+++ b/fs/ext2/ext2.h
@@ -608,15 +608,6 @@ struct ext2_dir_entry_2 {
 					 ~EXT2_DIR_ROUND)
 #define EXT2_MAX_REC_LEN		((1<<16)-1)
 
-static inline void verify_offsets(void)
-{
-#define A(x,y) BUILD_BUG_ON(x != offsetof(struct ext2_super_block, y));
-	A(EXT2_SB_MAGIC_OFFSET, s_magic);
-	A(EXT2_SB_BLOCKS_OFFSET, s_blocks_count);
-	A(EXT2_SB_BSIZE_OFFSET, s_log_block_size);
-#undef A
-}
-
 /*
  * ext2 mount options
  */
diff --git a/include/linux/ext2_fs.h b/include/linux/ext2_fs.h
index 1fef88569037..e5ebe6cdf06c 100644
--- a/include/linux/ext2_fs.h
+++ b/include/linux/ext2_fs.h
@@ -27,17 +27,4 @@
  */
 #define EXT2_LINK_MAX		32000
 
-#define EXT2_SB_MAGIC_OFFSET	0x38
-#define EXT2_SB_BLOCKS_OFFSET	0x04
-#define EXT2_SB_BSIZE_OFFSET	0x18
-
-static inline u64 ext2_image_size(void *ext2_sb)
-{
-	__u8 *p = ext2_sb;
-	if (*(__le16 *)(p + EXT2_SB_MAGIC_OFFSET) != cpu_to_le16(EXT2_SUPER_MAGIC))
-		return 0;
-	return (u64)le32_to_cpup((__le32 *)(p + EXT2_SB_BLOCKS_OFFSET)) <<
-		le32_to_cpup((__le32 *)(p + EXT2_SB_BSIZE_OFFSET));
-}
-
 #endif	/* _LINUX_EXT2_FS_H */
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
