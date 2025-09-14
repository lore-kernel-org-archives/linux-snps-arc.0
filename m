Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E549ECAC58F
	for <linux-snps-arc@archiver.kernel.org>; Sun, 14 Sep 2025 03:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fS8Ym0ysKrmLJAKW6nGtz2n3sYgC4yzi2hrzo3gEAtc=; b=I4PSyZ339ykPGv
	NOyOtj/QklaMoY8TntBjaEswXbU9NKqhx++s3gd/vbWvc/gfTUG1DPnMYHzjvYhAgmXGTrhcBpP04
	mH8dvP8F4OiV91hjq6oOspErsAyMoHFwVnZQFt/At4QH3/Uv7nDjoYZ8X4pnXcafFCzaTqDKulqmC
	lqUEm2TTlnSJPmWhhN2O9PQB8CECtcC8FQ5YmSrldbYRBuLewP8Irb0zDv9cZjcmx5drXAyQgvXk0
	pEEW8NeFBw5D9hCQsntJ8/kGEQRCXWhkxCJWZBnB3dCMQOxa5wbK5JffaiNXZFwYuE5fKFl12kT67
	b8VL2Rjvj+6bt1wqvrmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdlj-0000000HLPH-2C4P;
	Sun, 14 Sep 2025 03:51:15 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdle-0000000HLJe-10iL
	for linux-snps-arc@lists.infradead.org;
	Sun, 14 Sep 2025 03:51:13 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afcb7322da8so599989866b.0
        for <linux-snps-arc@lists.infradead.org>; Sat, 13 Sep 2025 20:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821868; x=1758426668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgyNirakXvU+05rXEnyXXLzO67oYWYN1IcZHpjjqHUg=;
        b=b+kCklqOk80jJFmhqHNvNxZatHK0Nhn6qHl65Gyz+pQx1ARJp6LmacM+nyGf1xlTsp
         EGp2F8MnF0KLyr4DF3PSkn7WG9sR4iFytRnqLqn3RAjphEJXVmVVj7POIniobjrIn8GA
         SMArCW3fVtAVq3lVjZWXXjlY1ZP2Gr1oCkRl/GQUDu/m59GSISYvrwvRcfYUhEeiaRxj
         M6leblZkt3YAX4PooNhZyb5sYRp+EvWrChZA4LCtMzJIdhxczo2PPxS7lVDggJdIhhfS
         2/J/ooovVaJaocYckJ5olqJaoZUkkCHQaSUEVWej7sabLQ7UhmUn/9Ro4jKwphrK/If5
         zEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821868; x=1758426668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgyNirakXvU+05rXEnyXXLzO67oYWYN1IcZHpjjqHUg=;
        b=r2UM9S8FKL5nkLAs3RgE2B7PJOMEtHHlepsEchrCMJPjXHypNdpkZFE4PYgU6XSAoo
         Aasa3miZ9K20afS9fdodCcPc9+SFYdqGgqIj/7Xsr97lG7nVoJ5kPBIMOlaJ3Hhfe0ux
         bXe35z4F+L+/oimcoSog4rayLs8YYTajP7uOQBgr/a3WFBHpyE/w4ofNdSb0OVpNRnRD
         0z1MFlF7fBaIyA/LqgP1R9CijYxJTw/CF74+6OnqeCLkNU+F4t5BNkX1V3q0nO9F1cp4
         O9lossZC7zAsVw3Cyz7vO8oAxu3OPfUne1O5ojNXgxjBVmUdbzutUGbab1ExmJIXV60R
         JKGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeYW9UedO6/MfJCoC+XywrvZqY01CypuFUGov2c80ayTWk5XylH3N+jJPU4VpCOZjzjhrpFZ3KLEFQEHjeFg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8alNWGNik/CikhjGJrcOuecp8yJVKWjduRJHSmPF77WFKDGmI
	9wkWMDzReFxWsFzrFhKBerdgOjkRBE6oncs5b06bsNmyBX0uCMeYG2ac
X-Gm-Gg: ASbGncuimfAEmZ+2S2u5Ig7pqAdMQC+We6yhRt/rQJvltbO2k43WfaZ57mLbKsmlNCL
	XgroEVIfNr1GoKt7B1mEy5Zuplz6UwXmqRnm3xLiPgXfOnp84Z3jknWrh1EQSQPTAxeYRz7n1U7
	bf0CtOio9YGMoTmp3IoLaYLPdhjItaCTJp4XwUpz6hqwNJvdaYa1UXsYfQ3dPnP/uzxkGafIrkd
	uBqbrC2Z6GK2vFYKkNgymrKYAt3cJQZltjPZ2OP0bxF24AAI0UT0ctM8Vju9skhT9YhH5RjvofJ
	qivl+8ZNRAVEsu2Hph7+9B6X4IOUwHiha00HwTAVhc8SwILkP115Q3d2E8mmeiSqQ2/pjJpY0l1
	6X6nLtbKtTNzXi2yRPXc=
X-Google-Smtp-Source: AGHT+IGYiK6likOM/TjE1BLl/jI3UX22nGT0EQIxF87CUWohx3tkGnMcAa8PzC4lwu+rbC2577QTfw==
X-Received: by 2002:a17:906:46c7:b0:b07:da17:79fd with SMTP id a640c23a62f3a-b07da178367mr507229866b.17.1757821868321;
        Sat, 13 Sep 2025 20:51:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b3347b6fsm679031866b.111.2025.09.13.20.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:51:07 -0700 (PDT)
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
Subject: [PATCH RESEND 39/62] init: make console_on_rootfs static
Date: Sun, 14 Sep 2025 06:51:03 +0300
Message-ID: <20250914035103.3619203-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_205110_361465_F3BD012B 
X-CRM114-Status: GOOD (  12.32  )
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
 include/linux/initrd.h | 2 --
 init/main.c            | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index 364b603215ac..55239701c4e0 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -23,6 +23,4 @@ extern unsigned long phys_external_initramfs_size;
 extern char __builtin_initramfs_start[];
 extern unsigned long __builtin_initramfs_size;
 
-void console_on_rootfs(void);
-
 #endif /* __LINUX_INITRD_H */
diff --git a/init/main.c b/init/main.c
index 58a7199c81f7..f119460bf8e1 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1533,7 +1533,7 @@ static int __ref kernel_init(void *unused)
 }
 
 /* Open /dev/console, for stdin/stdout/stderr, this should never fail */
-void __init console_on_rootfs(void)
+static void __init console_on_rootfs(void)
 {
 	struct file *file = filp_open("/dev/console", O_RDWR, 0);
 
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
