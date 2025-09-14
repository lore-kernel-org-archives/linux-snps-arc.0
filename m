Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA22CAC58F
	for <linux-snps-arc@archiver.kernel.org>; Sun, 14 Sep 2025 03:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DkKPMGJb9240E8dphR0UKSZlsYwlJnGkcRrMb9U8EM=; b=TmN9wZqQSfPo5M
	w8sCnxOAorn0vQYSogG7WbjMI4dbEu+15F8Wh5oi1hQzWTIPWJtbqcXHDW1Tr1l8LRW/UI4kSU5Al
	fOCKw6dTeDsdcwzEQ4lcpBQforJJN3Pb6tD+fXaA1vzkbh0JktG1QFBBLdpZE+52QZEn2x9R4tLo6
	WbLaL/sdHCgGY//DTcOLR30FIf3KHaCNiWH4dM2OFLJK0yCSwnxuQKBrPZ4STAlrfyTyUKry4KR7U
	fkbSxL/huZl6MuMb4oA4X8NYq11+dIkhyuUUGggPoMNekgYMQxLiffRNb9IU9msApY+A3AWUgG/2O
	b0Z8U5whx3dx5DdGnHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxds4-0000000HOoz-0KOP;
	Sun, 14 Sep 2025 03:57:48 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxds1-0000000HOma-2T7M
	for linux-snps-arc@lists.infradead.org;
	Sun, 14 Sep 2025 03:57:46 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so6255879a12.0
        for <linux-snps-arc@lists.infradead.org>; Sat, 13 Sep 2025 20:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822264; x=1758427064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLgSWRUhBJ+Eb73oE0EhwiwscJ+skfUSjN5GwJ3O/gU=;
        b=VzaDoNOH3mhqXRAw8u7zfHGnI7GXO+Wuq4Ni+KVbigVWV626TX41ZwAtDyd7yCuB8O
         Xz+uKg+Q4aq3rT4JsQ6exYMuDVTIw82+88NsuJMR/htUeofAX4EEK2ObLL7wmG8+ww8j
         cEVhZXfq/WEUbazVBJuEbFJk3RsiBJDvQEFOoCPWLIO5a45yhMGqJKJ4sZjvQpPaNvEf
         Zo0LlhS9mytM6fz2LvaClNs8rgVmeFLtohmgkSm4YNj2wZ4SMtoIGLZukPbEt7jKQN93
         hKT/tbiSxuYyJp6MnEoAQw/HtoAUaK0MZXxtVrNybpwU6YSU/LaNsRLs3iWuxvsp1lIC
         kA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822264; x=1758427064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLgSWRUhBJ+Eb73oE0EhwiwscJ+skfUSjN5GwJ3O/gU=;
        b=jRPWAyV/j9SBqeEaQTB3rWaA9wOEWoRf2eV4CTl3QpkPhPHCxREWIvD8Nh4X+yTlx/
         0WaPn6seHFUwORGOBb25KHA6Wg3bxeN7z3AOzM0quTD+fLUhs+HLiCZ97OX4zD9Ob7aS
         bvbjI3bVCAPtiLmP3Kx3pR8Gtrub/83/8OjdoXpWG/7lMiD4TtlS9n1pwEzBMqlpNtYK
         pOL3fYVXx0vN6cjj5k5MTUTNybxk2Wnw0hCRGjHxAZluvnV5a2IBS6iA0RlAuOOBurVI
         7wbWJl0iyYaulcOmo74UN6MUv2TCy6OSx4QLUIWuaN/JFkTPJbXPHuzWLoTl6w111DnG
         iG6A==
X-Forwarded-Encrypted: i=1; AJvYcCVahwxSwpmz9u1gkR/zEwN4efTdGTm6zceRrUUtGVAR1GpCtZHa1BLF+htiHRH+KI801cdmIdghuhe6GxRUaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9/TuFHjlvjIdBLkB549R6Yb+ZtsrCcGt9tmpuODH7T5v67UZO
	YcL/75dGYk08EtMig/0dO9bBx4eE5k4K22JHKTBbjq+iITiEUCRbL+tot+bgwxxI
X-Gm-Gg: ASbGncukZwmgZ7ZPbJQIaqruCKbEsvZyGPhOxNMEPEI5zj8YlMWwLXOV/O9RRfAGwtb
	flL+8u20GK2hGPM7gJWh5jsFVe0WmNnL42VZv0wS4N9zhjhCv7Xo09J//tyks7skq7n7Idp4L+V
	mlH3WzMP0xMsZNN5uX5msentbKEBVIIMB+3e9zAxlaHRkUXxS6N8uq7nX2c5OnB/Q1Oam0tKy30
	83myT15SZ4ubNeNdpdgsTMPPEDfdvdnRPSFLEdgtzjXq/BtYOgYsP6jT34mxVL1rQabI2ay8HgF
	GtkjNgLI6BmrbqLS0wzwoCxdMMdSK1D1DvS+4tiCGVUbMIYuT15j81wFRHa5BkOheCiA7Sw1oUf
	jkUITAPISItp1W+meH/AlHy0wT8YxVg==
X-Google-Smtp-Source: AGHT+IGOdPvfXOVddm8G6LJhfH2nNJDoTTLKR/3NE7kowNRoQPIuzhxmV+feQvXrrMYzfjsz5Ubcxg==
X-Received: by 2002:a17:906:a84d:b0:b07:cf04:8a43 with SMTP id a640c23a62f3a-b07cf049441mr520202566b.41.1757822263792;
        Sat, 13 Sep 2025 20:57:43 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b31287cesm676665366b.30.2025.09.13.20.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:57:43 -0700 (PDT)
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
Subject: [PATCH RESEND 50/62] init: rename ramdisk_command_access to initramfs_command_access
Date: Sun, 14 Sep 2025 06:57:38 +0300
Message-ID: <20250914035738.3741007-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_205745_640129_D02896B6 
X-CRM114-Status: GOOD (  12.48  )
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
index cbebd64f523c..a42f1f0fce84 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1587,11 +1587,11 @@ static noinline void __init kernel_init_freeable(void)
 	 * check if there is an early userspace init.  If yes, let it do all
 	 * the work
 	 */
-	int ramdisk_command_access;
-	ramdisk_command_access = init_eaccess(initramfs_execute_command);
-	if (ramdisk_command_access != 0) {
+	int initramfs_command_access;
+	initramfs_command_access = init_eaccess(initramfs_execute_command);
+	if (initramfs_command_access != 0) {
 		pr_warn("check access for rdinit=%s failed: %i, ignoring\n",
-			initramfs_execute_command, ramdisk_command_access);
+			initramfs_execute_command, initramfs_command_access);
 		initramfs_execute_command = NULL;
 		prepare_namespace();
 	}
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
