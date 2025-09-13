Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F91ACAC582
	for <linux-snps-arc@archiver.kernel.org>; Sat, 13 Sep 2025 00:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nG3uOTBTLyIrZFrGyPsGPFaYWgzMSnc5gXUlQwwygbQ=; b=V/8xPtK1/LR0rG
	6qE5x9i5enfMNBnYvQaCMA+ePMIxDSKUf7p+9WPTxGsp/Y2quejjQUvPm3WorKbsFtFsdComSFZ4e
	IacSUQgqHsDSsipkQNuBM6MwR9CaM7vb70y6cTEt6Ga/kJUn+C9L9611QUahTZEUblkZAW1ALAmeb
	uk30jOEHJ/lmfSVF8XAMuO5VaS2nO6peC+dfQOeEl5QbugCoA7bby4fZqfxhVUEq5Gra6fVvK1G98
	uABue8sejdJcbAQBPXlRtdYQbQhuGkEhXxeba6WOEegum4p6h25ZobDovFLF/5m99pj8kplCYnzfT
	xGZkTs0nOivVREg7zsZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEcE-0000000CTK3-3QHC;
	Sat, 13 Sep 2025 00:59:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEcD-0000000CTIl-2avz
	for linux-snps-arc@bombadil.infradead.org;
	Sat, 13 Sep 2025 00:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6fWPoN959WwxjoYegCw0rDaXLTHmPmQJSliJ+OqkRJY=; b=l/APTrzGLeySHrRNZOKQHiVJ6S
	7ndPdYVWtpuzClGu8FmqCXvavxSzVC66Os8fWckz5ibUXM4VXD72gQPsX6eThK/bGjw3KIps4kWII
	qCQsyNVugY7GHAZ/8x+SaZ2YRkyKJW2t9hzLnHAeixfFTaol3KHIrQLeHGV8GfAzDq80uj/r7IjNH
	Pw7oLPy6fUhfRBJzxYObbQfYufxATXehB9UpWiVBWkkJxequi7Jx3nz8q1gEkK2nAe4DWxNR97YsO
	BFu5UFdyqi1j/JzwM824nr1/idGjxFnjKueBXRHiOqoDxLyEywcusiNqJOwI3e+u0kle6WToAprXQ
	70Gatiog==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEcA-00000006VVQ-0gnr
	for linux-snps-arc@lists.infradead.org;
	Sat, 13 Sep 2025 00:59:44 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b046fc9f359so374955466b.0
        for <linux-snps-arc@lists.infradead.org>; Fri, 12 Sep 2025 17:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725180; x=1758329980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fWPoN959WwxjoYegCw0rDaXLTHmPmQJSliJ+OqkRJY=;
        b=ZoUREjCJXHzTcDMQhLk3L9PG9aSengykKZEz6OUOMdoPPqxsLh259fB8IIhhhJ4+e3
         4tNxrYFvqWs2x6zblp39Mu7MkB6PPqofXHFUoRbTbzdfbEq9KQZVfwOVh0/GvJ3a/+gk
         HyzVDsytCBN3vhcKA2nZRpNpdXbgBo7VL5/90lTYySgC0IJod0tJNFEgxB3ssZSZRWfU
         5oUdRgl+1pnbmJJbr+sn181HnqchDgtR9PM+OgCEvVWnRyfaNYZNYLYGpVwHgnUpuSWo
         2JF0LPyIT2Iec0fE7A/I0N9I5pTEGzsogfUiNCE2MCYGxrscTeDy1oHmuGNPccqNn1Bs
         EQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725180; x=1758329980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fWPoN959WwxjoYegCw0rDaXLTHmPmQJSliJ+OqkRJY=;
        b=AXmSMlDYRGYvV38yUk3kPALgh9NG1snLe5Ur3Yvy/8SeWSNv0gHpCn4c2tI//rzlNi
         1k6vneX0wHLj3PdeS2FLSgn+9IC6XY3gFO5Yk95qiSuxBppC/ICxqWpACUy0XqYvN74D
         MhLnj43L1NBvMpV213q27UevXvBsjZ4+iZaGlphkIO8nhqtndfGV3O67WnMFznYmQCz8
         mh34s8T03Xg7ctu3wOs+UhhDnLmSCwqDVsn/MyH9wjPgSI6an6ORY5M54UVe9oYZwoMu
         kdlRM34etoRek6yPW6UjYgk7DHomCmmI8Ba131F6pGaImhGEMQ/3GNHzBKQ8PG4Haq+N
         8DUw==
X-Forwarded-Encrypted: i=1; AJvYcCWxyei5Y0W8ibFY6BNByorPbrSSAtfw3dloJKGLFBFFb2mTQcwoDOaOx0EIY1yxb/1P6NrIntiLWtoMHEC1gA==@lists.infradead.org
X-Gm-Message-State: AOJu0YysgaoA9rVDvZblGI/1ULH3nOq2D5ODqlP8qaKnDkLeuRN7Copb
	DoGFjacQfELjhS1vPU2tcMCvtHa82ZICMrG5zjVSpPu2CABz0ISKg5is
X-Gm-Gg: ASbGncsjdgoqnoRR98QunTdyKcIkBl9kxeyXgJCwC4g0JInXG8SMo+0jM2p0mgBL89Y
	pVC0+wk/sLqzW+llC7DzlMXuS9RJS1w995BZXYQniDzkz1lmOnItWVye1HpWSdf5SMMU1BJQRl/
	h/VWSld3WNTIJVejStbZS9mroe69w95EfHbIVSYwupfgmrLQWHG+OGOnKuZ7Kda70PW7RrXIwP1
	zYS2vDJuqMuETNwvakHsBNRKhiYBkQzjf7dlGISA9sXQ8MDRhcPjDPiwpbuHzt+FqxS+co58VGP
	gXKHcxbatc14UrbGVUHi4fWTqdelsPq84Na7CWvBhd73P00rQsJA7KXxt+4wlb3y0LyynLR1/Qb
	nZzztyGHwgKecRlCAje4=
X-Google-Smtp-Source: AGHT+IGLvsatTRrbnodGqisgzpCsfnT+5kjCyZkQGsCYdRKthq/XXLBOPdic+fyhUVGMnj7YztyCUg==
X-Received: by 2002:a17:907:3f1a:b0:b04:ae7c:703e with SMTP id a640c23a62f3a-b07c35bca5fmr458205966b.24.1757725180390;
        Fri, 12 Sep 2025 17:59:40 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b3347a2dsm471368266b.98.2025.09.12.17.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:59:39 -0700 (PDT)
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
Subject: [PATCH RESEND 18/62] doc: modernize Documentation/driver-api/early-userspace/early_userspace_support.rst
Date: Sat, 13 Sep 2025 00:37:57 +0000
Message-ID: <20250913003842.41944-19-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_015942_378871_6C154A31 
X-CRM114-Status: GOOD (  15.43  )
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

Update it to reflect initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 .../early_userspace_support.rst                | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/driver-api/early-userspace/early_userspace_support.rst b/Documentation/driver-api/early-userspace/early_userspace_support.rst
index 61bdeac1bae5..0ca923c1007b 100644
--- a/Documentation/driver-api/early-userspace/early_userspace_support.rst
+++ b/Documentation/driver-api/early-userspace/early_userspace_support.rst
@@ -127,28 +127,22 @@ mailing list at https://www.zytor.com/mailman/listinfo/klibc
 How does it work?
 =================
 
-The kernel has currently 3 ways to mount the root filesystem:
+The kernel has currently 2 ways to mount the root filesystem:
 
 a) all required device and filesystem drivers compiled into the kernel, no
-   initrd.  init/main.c:init() will call prepare_namespace() to mount the
+   initramfs.  init/main.c:kernel_init_freeable() will call prepare_namespace() to mount the
    final root filesystem, based on the root= option and optional init= to run
-   some other init binary than listed at the end of init/main.c:init().
+   some other init binary than listed at the end of init/main.c:kernel_init().
 
-b) some device and filesystem drivers built as modules and stored in an
-   initrd.  The initrd must contain a binary '/linuxrc' which is supposed to
-   load these driver modules.  It is also possible to mount the final root
-   filesystem via linuxrc and use the pivot_root syscall.  The initrd is
-   mounted and executed via prepare_namespace().
-
-c) using initramfs.  The call to prepare_namespace() must be skipped.
+b) using initramfs.  The call to prepare_namespace() must be skipped.
    This means that a binary must do all the work.  Said binary can be stored
    into initramfs either via modifying usr/gen_init_cpio.c or via the new
-   initrd format, an cpio archive.  It must be called "/init".  This binary
+   initramfs format, an cpio archive.  It must be called "/init".  This binary
    is responsible to do all the things prepare_namespace() would do.
 
    To maintain backwards compatibility, the /init binary will only run if it
    comes via an initramfs cpio archive.  If this is not the case,
-   init/main.c:init() will run prepare_namespace() to mount the final root
+   init/main.c:kernel_init_freeable() will run prepare_namespace() to mount the final root
    and exec one of the predefined init binaries.
 
 Bryan O'Sullivan <bos@serpentine.com>
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
