Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5A1CAC593
	for <linux-snps-arc@archiver.kernel.org>; Sat, 13 Sep 2025 01:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1j6UJkixJ2cQbpJA57+yR3V1Kb5+OmTaVKTYtWaI9CA=; b=oQO3vmprgW9G30
	13cmM8oS4+jVlo8lhNLj/6gKuwrQFCjbmTsncCKKMxIOdSK5macXZi7hBQz5ggNdRbRKUrpcqQYip
	zWd72mqc3KRJRyPFeRCjS3/5Anxyn1AKAvQOr3mPW5Hlah4LAe1tRk2OiQIIrZWLl+nOMA62BQdiz
	ot1bznvwBK2Z8pRBa5Xmu3yKW9RmI9u+hVtLhDfXTJOBIV1qp1rXHDeaNeqvd9kJVys5IJ2T0ISUg
	MD/9yAjBtWYGOo6+gmFZyC0zdJt0nxEGI32dNTbKnRmH2pANm0seq00u8n3ZpYnQfrcCkqccgOGyn
	u9xkn4vbla54FBZY593A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEvQ-0000000Cakm-0mXg;
	Sat, 13 Sep 2025 01:19:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEvO-0000000CajG-2ilT
	for linux-snps-arc@bombadil.infradead.org;
	Sat, 13 Sep 2025 01:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=01GQX+A5wcxVOfa45EtHUSgPI4YB4B2sFvA+zw7J76I=; b=Nnav0YU2jQJtu9OrLLYyfqonJG
	UuAcrpo8E5hW/yLu6HAc5PeCZVqRkxW+b1a/OLTg5gnXXoq1Zct2xEZTxdcDqjnZKqq6/21nsvHgw
	iRjf3PsX2ZmpRtuC7iRCWobffxiW/Xf2mIwZFiavxUOgq/0tLKKb3ty//Jhd9+NubiMCNvf49FLn+
	r377kT0AfOJ6h2ji2OGifiXZCYG5kjKHmcqgBnkPsUs9bzlwlc65xgrg+v+oGWT/H/DkRtIlNWII6
	EavVvrtiSP5OArcE25NSDnh1lZSCAazk2MkdCeo5L66R0+dSXC9xSrhCoGQaUHY+O0Orej3d62wD9
	4pnCRUSw==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEvL-00000006X61-2J5B
	for linux-snps-arc@lists.infradead.org;
	Sat, 13 Sep 2025 01:19:33 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6188b6f7f15so3021203a12.2
        for <linux-snps-arc@lists.infradead.org>; Fri, 12 Sep 2025 18:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726370; x=1758331170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01GQX+A5wcxVOfa45EtHUSgPI4YB4B2sFvA+zw7J76I=;
        b=mW2jz9M+9z18sBgj2to3O4u3XW3UrXp83n39zD0ApRFnBTJ5VQuUD0lkZSS8iWBqiF
         5jpBL9f7z5+BFpm2YWRw+NH94Lu9BYRxP51+a59ue5xd8Cfqwo8vZCtEVzluuNHnPJig
         O2gS95RKJA/YU4jvAhUGp1ILmYSoyyYLE3oEjN/ia76m7WYx0+Tq0TNPznIyyU1/JHxy
         J9/XgGo+CIKSFtTe2BqWQoDQbRI81BAXWm95vw+ksRdu5LwvvGxd9MXhvzaRaU/JqePg
         u0uIQHjVV6ypCXgspJoUAkj/GYgBbYETNoWj+xRLu2FQfv7IaAjru6ie6Ln1XnnaMoLH
         Am6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726370; x=1758331170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01GQX+A5wcxVOfa45EtHUSgPI4YB4B2sFvA+zw7J76I=;
        b=UysYSM+ibzQBUdfRuWLDCKmlGM/3HwndE4z4IuY+sdpTPJoziQxTZjDD21waEiupU9
         ZDq0Xy6GB1NNEi34y94x1fZh5QJSTTqk/QHtQsPUy/uAvY7L67TNxKtoS3pgyRhDXYzu
         5ZVxjmxo/Mk09ED11glq465weth39tTLTqdrvVHQUrxq7S+q5VnfJUZYOeB/2DkzXFkg
         jVyizclnalG/CrAo2amdYvoZ37rjYOqtyHzrAA1NtoHt0E+7uhpLIqwFlphgdLsse235
         r0BbOWPFGwX5aLpuCybOqZbdw8yLd2rbvuJquE2Vyk2i2MSYlKceHZrgj92Vd4lMqIyr
         HsNA==
X-Forwarded-Encrypted: i=1; AJvYcCXG20ZWuAdvvH3MpaVGwrxgm2y9UCTZ1PwLVHDiunHYcjP+s0f8IrVgKZHwHjBwAKIQuqFXJAmbZYRL7mdr0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYZpe4Q72zEc5vt4vO2DE/El3kj1DbAgBqt7y2JidSxN8H/EJO
	GkuAO3ODLr7ai74X10cy9MS2Y4But7rg9xfV2IJxZgzaXC2vdsAIz9qD
X-Gm-Gg: ASbGncsFN4/Z6lsOno1ERuKcrRB51QzjtEAejx6ZT2gvH/UYJ4KDBuUEiJqbiQhV5OC
	8Mh1GGDUOUmfAfyjjn/P0rhxAP716lIgO6v4GQcdxj6lAG4JF63AcOybBKtey/L1kRiGAe3XEsg
	VLxjNZhtbgRXY0muqG7Sfz/FmRzTUExigW7zdoPVDTFjyT7DjZ/JViBpBf81+wY1ayNe1oNQU9X
	CdfRhZKncrRwplTJkMQ09AGpgcfqYBnFz6z5ZAcHHDaBEtB5Gm7oSq8uFdPEim2k/x1wQPgQ/pm
	6k5bR1kF1hy3/8kzYfIWE1h52ArIn6IDgxrbSjFsUz6wK0n6ZqwtdtDAvupfV1r+hO3ipwHzfMO
	8ju/ht8eiA29eK/njqAj1t7j58s4FnQ==
X-Google-Smtp-Source: AGHT+IEzeVwYKpSq5hVwsza+AqQmwMGGceGxnApLyMFPwDCsoulMW4PoMJQ37ACnH/5BZ1euJLookQ==
X-Received: by 2002:a17:906:2493:b0:b04:9822:1ab4 with SMTP id a640c23a62f3a-b07c35fb2e4mr458597866b.27.1757726369974;
        Fri, 12 Sep 2025 18:19:29 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd5bfsm465661666b.63.2025.09.12.18.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:19:29 -0700 (PDT)
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
Subject: [PATCH RESEND 36/62] init: make mount_root static
Date: Sat, 13 Sep 2025 00:38:15 +0000
Message-ID: <20250913003842.41944-37-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_021931_909742_0F2820F4 
X-CRM114-Status: GOOD (  12.03  )
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
 init/do_mounts.c | 2 +-
 init/do_mounts.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index c722351c991f..7ec5ee5a5c19 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -381,7 +381,7 @@ static inline void mount_block_root(char *root_device_name)
 }
 #endif /* CONFIG_BLOCK */
 
-void __init mount_root(char *root_device_name)
+static void __init mount_root(char *root_device_name)
 {
 	switch (ROOT_DEV) {
 	case Root_NFS:
diff --git a/init/do_mounts.h b/init/do_mounts.h
index f291c30f7407..90422fb07c02 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -12,7 +12,6 @@
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-void  mount_root(char *root_device_name);
 extern int root_mountflags;
 
 /* Ensure that async file closing finished to prevent spurious errors. */
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
