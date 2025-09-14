Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C39CAC58F
	for <linux-snps-arc@archiver.kernel.org>; Sun, 14 Sep 2025 03:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOqk6DHJkZfnjjOLsa/t8PInisN5DGBL1nxgRAmvk8w=; b=y7TRMtvLg6lTVH
	CSKCTXBhgH4BuVY/RlDW9IBOYQh/HydMzqxLE5650em0ZIKe4/vhyMAcnKtz+PqnX9kr1QqEBoeGX
	KRpEkxDEifp5em5pqMNma82oO6HxkbOMtvLcR3kI0xxKAOYiCi+SEqTNETkCS/DkMHeJLw1T9cSJt
	Xah/PRWDNXUtCeWYk3rg/Jh0XiGYm9oPCgCBc5ssFuyOg3IM5eJAk1eHhYGrkeX8TYtx/cFPJYlA0
	D0bBzcUjo6SLRji8JIiDC+4FVmc4yyNi5NBV0pZHuf2t6hLjGnXeij2qAQYu/OOkvtgMAU1m3ZouA
	p11wqQIKrMMZ+Na0Or6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdqx-0000000HOEU-0oKL;
	Sun, 14 Sep 2025 03:56:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdqw-0000000HOCo-0vEU
	for linux-snps-arc@bombadil.infradead.org;
	Sun, 14 Sep 2025 03:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ukssGXUYVXOD0e/noqLCBxDtEOgQieVYL/7Zl394zX0=; b=RimygHUKnPqcFB4Yi/IeCF4T2X
	pxBJwJv9MeFK/jzQ4JZU9YW4AnT7c4rdDtypjEyS5bRoIwQhKB6/AXyS03gX5RDE4l1VtmwfnIhTV
	/RVjCPZjeYT2PBED0Xj4hLMw5A7aGTVt/7D9xvklgBfAqPppTNnGZX5A+DrIQ6SlCO+5rDmLrJBCU
	UF+xyF2SIMy2PCSWcXsZyydQQyw0OUEOiiNK0gT8QvQiQbnP2GCA4HykhY181K6CLVFGNsBbNaxoF
	YLNI4v+hKf5dum14vPYH/5Pa5uwBXcGmZ9vHVaVluZN+10s9JQeHjYwWo0PTAuP0ls1N0ir4CBnz3
	y8mgomWw==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdqt-00000000gSO-2otr
	for linux-snps-arc@lists.infradead.org;
	Sun, 14 Sep 2025 03:56:37 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-62f0411577aso1757494a12.1
        for <linux-snps-arc@lists.infradead.org>; Sat, 13 Sep 2025 20:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822193; x=1758426993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukssGXUYVXOD0e/noqLCBxDtEOgQieVYL/7Zl394zX0=;
        b=UJqP8DKqOnRMWT2d4Q2KZGf0YyveGfFxnWnN7P+EWzLklMfXVk6/J3YwaSeKrHL5iX
         EDG5yXZ898QwC+rnNRBjvyGRqyXm6VpnORwMde2Z7XhLBlYYfURXiOwtVuF2CnPKosDO
         +vj19VcE9KU42VAbBLMNPtqr3GUEmz+dNu+37NesSJC1nqrkY+35+Q1X0MZMYthMehMt
         Grk6fFinB8nbdhEXMVWZC+z9kSmJsh86wG+PGPCvfwY0rdyAjLPE2l27axB2lLEFZyo+
         SjH4eK+1TYg32+ENdaH0sSkiZEYzMctomSSBfrwv6JP0dA6SUZpA5m2hY9H1vkgBDgb+
         LUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822193; x=1758426993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukssGXUYVXOD0e/noqLCBxDtEOgQieVYL/7Zl394zX0=;
        b=MfwOY++/fbHgjQaGjIhOia8GaEIOtbeWpQgpEaebbP7P+MsZ1EWWmey1YJTTFQcWa7
         Xi4OSTsrGTpsqfqRJbofHY1Dltnv6FqF/CExSKywHcU/KCiY6yaqV6rrZaZOELuAPrx4
         /ggeqGlvH7AwU/RgA15vGuKDs0A+f+aCWysAnXT5Zd1fSGeESMhNDR4tqBvdsp0bQINj
         S7P//hsOAQP/I9yArGwXuye1elPWPmNC3CZLTUfu+j9LywV2fDmdAsi0BTa4ULHisqsD
         bcWJxKlog+IsIpmTUlr9JxqwVUwpHXQVeCBnJYt0OfOrAqpMtGPkGIxlXede7eaFBX33
         uO3w==
X-Forwarded-Encrypted: i=1; AJvYcCV0729ReTZhAvGrk7DJ2ceaTBCbdUDD5mazvrqFCAgH5diH5eH6vYfUu2jwAXSmOHHg90K7E+0pOpioveW9tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyEoRRC8Ich5cV1/y7WAGGbT6VY7xljoEeSuf2W4QqcT+677AZ
	oN9o1ml/NwlHGCePZ/ewp80N0aN9UIg02+7Qu+Noljy/GYToVXI9w1Ui
X-Gm-Gg: ASbGncsQbP8OPbQ822C2JuCkRvvgY+jpZ+ksIvYfPlC6JYwMDXAZ6CIQVjPP+CkTsFS
	vsFd+umaLcZUijIs1SLABnZXmU9PQ+YOAulj2G1Mu3N1meBT9CT7JmuZdvVOTIhm4k+/vddvjTp
	m+3L3X9F/N/BPqSBW5Sxv7/RmEc9RH7DURimPs/N9hTU/97fiP5PHv2b1LJLYONL+Iz94kZWcp9
	mI6EiC6lR325VvM5YU8ASDMctcKDgZc+zAZjzYb4sR8kqD32lT7yYH5DzL/LDTWuQbZky5T44YP
	L4+L5d3OEJMLTiRBFeC0FZ/U/axHuWLTiatTVjLxH+D+EY22Ui56d+qEDYOS0ICC/rkPVQZfrGS
	9y8/eCxKsbVooyBhWAzY=
X-Google-Smtp-Source: AGHT+IEh42ac6WqH282xp0DieWYXKfg+ycti4urbWWAb1GXqLLNoKNDdAlfHKjc5T4lrTIZzL6YLwA==
X-Received: by 2002:a05:6402:2815:b0:61c:e1d6:6bf6 with SMTP id 4fb4d7f45d1cf-62ed80fd3fdmr8226990a12.7.1757822192729;
        Sat, 13 Sep 2025 20:56:32 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33ad2d6sm6510443a12.18.2025.09.13.20.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:56:32 -0700 (PDT)
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
Subject: [PATCH RESEND 48/62] init: fix comment
Date: Sun, 14 Sep 2025 06:56:26 +0300
Message-ID: <20250914035626.3718268-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_045635_747071_F070B7F5 
X-CRM114-Status: GOOD (  11.22  )
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

Make #endif match #ifdef

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/initramfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index cf19b7c0c358..30e94ebf4902 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -717,7 +717,7 @@ static inline bool kexec_free_initrd(void)
 {
 	return false;
 }
-#endif /* CONFIG_KEXEC_CORE */
+#endif /* CONFIG_CRASH_RESERVE */
 
 static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 {
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
