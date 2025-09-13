Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D6DCAC582
	for <linux-snps-arc@archiver.kernel.org>; Sat, 13 Sep 2025 01:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vR6aj49ewXFd9RFjMgKUFB3UP1CGNVCfa5pr7t4+r+g=; b=aeNC6VReE2XT/t
	vZu4hu+tdJhy2UsoLgW+0TcwjI0siIKrDkK9F/oufrl1rJxM+at20lpX3+/hOEEeX/xvydwIjQJHD
	okRD4s4yBi2SkLpXyWoBpCF8vEL1dgZuttOoZcAVD7CrUSb+aqd4rAgx0bzP6UfFcDNw3P7RXTB7E
	4t/qreahBWHocZam4y9j1rtwv5gRLDO9OP8XHbEKyc0a1K6bpvlAdeGCucaLaY1PkMQHUvnfvaWFb
	Cg2WMNJRx3R3X5eOJY7Vx8zHreVwZYWs79NUM+9S8/D4LiEOt9vyzu70QIYTIws0/1gAmrU40fNMI
	izq2iDGE79QL3Bg5uQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEuL-0000000CaJ1-09sI;
	Sat, 13 Sep 2025 01:18:29 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEuI-0000000CaGk-2P6V
	for linux-snps-arc@lists.infradead.org;
	Sat, 13 Sep 2025 01:18:27 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so369261466b.2
        for <linux-snps-arc@lists.infradead.org>; Fri, 12 Sep 2025 18:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726305; x=1758331105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azZv/jvf6IRhG0wveCq5ECQcNHAHnPNLNif/IfsLlkA=;
        b=gcObzO/2l9gGH4skKnp9LQq1Cg5r+dokWql+YyAnbaLuvk0Q17RHWWQQop3epXt/3x
         tN6bmM+OfjCUHToJw+etICoUKc9tf9SpRzVZm7o/ADa7IWo8+4IKGBj0rI3m/OTHAIgS
         EGjYqQg4Fchee9SSbPPdN5YOdpx5LWBrvAAfUQQFMl90Qhaz1nKkD/UT3/eTmf58zhoS
         SY+APpTHJ1s9IJMscEnJwPriQy+5nhFIVQA92DgN4xJgSCKJBjZYqbQTP/I9Q8Dnue7C
         FbJCJ4JUVhh7EZk0MoYoe1P+azZVZR8eR7jqwkTMJ+yCXwP6I9UJiMeOpdxVyMbXBmqK
         Hmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726305; x=1758331105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azZv/jvf6IRhG0wveCq5ECQcNHAHnPNLNif/IfsLlkA=;
        b=ZH5FjUThcz2EKA90r402ZI3k/dTFrcZOaW3OONy9cGysQqY5ZexS9vZYcN5U3SvUBC
         nD0z5FRW8uBuCMZyCbOBQtU1/xg5w4eoUYJkf9MqkNtNK3iy1N29CHAr1g8cX6o8yAPi
         c4NS0ixH6IJE2VdlmXxW6FxSskvNiZagCbHEstUtQAsGsyslvHBnvE1/YtOrOXFrvq1W
         DmKFqFddQBSw1E5Mq2EmByoDjC9iCpKh5e7Y4DzRDcr21E///HJqcYWz9zB9nf0JTm/u
         3j51+j8D9yTxRwJ3MxVrnzISaoJ1yiUcdbXPoseDAe+fXSqVM4Ix3FgUVOaZc6rNIWfx
         0X3g==
X-Forwarded-Encrypted: i=1; AJvYcCVkohIt8VzVvWYXXBbGKGGXI99H7QZGRS00kzIgKPNnvqLn4p2QYPe9vb56ZDqWWQz+kRUGWQ1/EyZUbFNm3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzSTDToig9Wqdv1/cQJ4ZDvJYCGytUzFPEOszpPygUhTmRLOea
	+ZNRwAuMZXaxZEMHvcvsV4zmhWUu6YSfZdu2qzaoX9vLFpwf0fwjurTI
X-Gm-Gg: ASbGncsaEzS7y4XU7X4XX1diuGgnLmipM/uIttPuF1JzC2X+Z7VEdl9655kZvi/csY+
	p9hflwn30vraAK7/b1gP0hnA+29vn1w25il8ZxxDCSet+r1EcMOpdWRjnSnUX8+l6RfZ78HcC9e
	HmIZehFZza5uZNzj0SkuGEDYQAGy2MelvgP7N8UdP3muG6JiGbUrioOVVlhvuW0swloKo7wGvYW
	/MvTqdzPYxSL3ftUqMOTWK0Tl5iCrOCBRdLFjtwO6ov2uSEijk0Q4Afm7lg5o9e2fecHKTPlu7h
	+QORIAZjt92rGiglW5Tn+ZKJ0HZ6envWjvT3fUrduH7N/2IZ/b4YBaNHfxdolqP9GcviKuSxxBi
	Ey/zqZthTuhP5MSGYlnc=
X-Google-Smtp-Source: AGHT+IExQyu+Z7m4GD3MP2gVTN78xlktku98kUsQddou1aWuxY/hOtzAat6yYKAto7vnFggGkvcCIA==
X-Received: by 2002:a17:907:3f18:b0:b04:45e1:5929 with SMTP id a640c23a62f3a-b07c35cd746mr507554266b.28.1757726304508;
        Fri, 12 Sep 2025 18:18:24 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd309sm475244766b.53.2025.09.12.18.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:18:24 -0700 (PDT)
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
Subject: [PATCH RESEND 35/62] init: make mount_root_generic static
Date: Sat, 13 Sep 2025 00:38:14 +0000
Message-ID: <20250913003842.41944-36-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_181826_613864_192161DC 
X-CRM114-Status: GOOD (  12.19  )
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
index 60ba8a633d32..c722351c991f 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -174,7 +174,7 @@ static int __init do_mount_root(const char *name, const char *fs,
 	return ret;
 }
 
-void __init mount_root_generic(char *name, char *pretty_name, int flags)
+static void __init mount_root_generic(char *name, char *pretty_name, int flags)
 {
 	struct page *page = alloc_page(GFP_KERNEL);
 	char *fs_names = page_address(page);
diff --git a/init/do_mounts.h b/init/do_mounts.h
index f3df9d697304..f291c30f7407 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -12,7 +12,6 @@
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-void  mount_root_generic(char *name, char *pretty_name, int flags);
 void  mount_root(char *root_device_name);
 extern int root_mountflags;
 
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
