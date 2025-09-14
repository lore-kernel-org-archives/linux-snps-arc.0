Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D07CAC58F
	for <linux-snps-arc@archiver.kernel.org>; Sun, 14 Sep 2025 03:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhWJQ+mEHNfeK0yE3w+lToeMIU8ijqmA180iqvQk17U=; b=dKL3OMt7Tk3Ju0
	M6v3PvahHC5O2JfZNcR6r7ltFfs0vCbblP9sYmfMSEfrMdgIn+mXOYGLe2auEhwf7IbBxTSOY+BHK
	CC/kpLnhE2snBgp1jT3gfuaor8bdI8KqaIo8YUte95AzjEaTVPCha0zP9xCGZFxzXLkxMsrJSy5Aq
	0iQMDODJ8ne6UCG/ayfgC+nw3abThA7dQZv5aECZsklDmRfTVH56ZO0wERuscrx6S58EJCM9UPrRJ
	0fPczGzp1SSyrZecjGqUb3GmSxz7SJsn4H2BGtzqYOmTz1Ewn4iBxeTJwRRegfrAfUg9A2bf70LfA
	yCLTPzjM4GuwlyrPAoWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdoa-0000000HN5T-40Um;
	Sun, 14 Sep 2025 03:54:12 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdoX-0000000HN2g-3hQP
	for linux-snps-arc@lists.infradead.org;
	Sun, 14 Sep 2025 03:54:11 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so475277366b.2
        for <linux-snps-arc@lists.infradead.org>; Sat, 13 Sep 2025 20:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822048; x=1758426848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0YiDU4Bzw7IKNW2/fgCfvKW6iRx1DQ4l7Ssn455PQA=;
        b=jTGQaZar0UzFmlDsNCRsE3/st0+b97qgkJFkDRuoAhpXcipBOlJAUYF0BxZB/TaWas
         CmNcqySEVJSL3IrX/3/vbvNNQvV7mnvMCay0Jf+HvSjGbOPok6mxf4+Tq3+rWe+Lde07
         SKRt9a3QItIqRcIp2S0G1WF98wif9kFXtUiy1F92TkGJobY478ofpwjl0k97nauOOEyN
         kFLasFINnTJLq27BUxXYMZuSUJLThfUJi/fqdnCerD72GjjgJ2J93uOlKRdM9wdECw7x
         yTzw210MuERuwjR/qsElO1KR3iiM+LqiYcDMP2zF/tnO4CurSA6onxTOifMHxc4qCfqq
         Mpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822048; x=1758426848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0YiDU4Bzw7IKNW2/fgCfvKW6iRx1DQ4l7Ssn455PQA=;
        b=YVVLpQmwM5dY9RuHS03X5noGpQ7EUpmS1ebOBTvWG/EDrYE1Tk96mr2bkwNwsb5Jns
         E3Wx/xkoaa5yZpLYPqxFJo6/BTtf1VHlSDY71qYng7GQ3rWACKvUcae2kd6nk6b6o/Mo
         mxFDfJR4zJazEh4T9nOi8wrTEgmwrDpQ+6oW6/DLPwJ0pclMsMrw6Dip0H6PDZ7YEmPX
         at8r0c8dhkab7wVC54eosI2HeeeJcBWpdYSahasYKLp2xoawRf3yyHdcBlen5apZce7V
         B8ynQ0+jK2X6kWusoGtqrgFuY9YbW3LhuHX4vtdX1jnNWA2Cc3lqL8n3QBm/Yii/CHPQ
         3h5A==
X-Forwarded-Encrypted: i=1; AJvYcCVNZ5HMIBmPHGG7JyxXR7QVMA4LnKhBDtZ+k5riG0XdBEQFicCdgv50gl7ct1aCnLdcgs7rAgk1Wd/KzI+KwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeWtGJcUHdFWtm1DLiYToyTKhGH9TMuXvFATHWR/9Hmgp4yCv0
	QpToHDZKb36bcwCbHzOxoMiqYW5aM8oqcUyhmyXkLONKksWFUgk/3ssP
X-Gm-Gg: ASbGncttoe6Tgnv/k1UENI0SHpsJow6Fwfni1oPgRnmAA+NrOFCioySZpK/f72q5iBr
	hnOmaR53juUs75d8jAxCuSOgYKIvc/RU9AOLrNSofGdsTXZ7+uk8d5qplAv/7Xr0doI1rSSfVvp
	fXfCTFjwTy4ZcmtiILRs5ofzIozHZHSFZnK+nYSCecxiaD70DWHBw3LmTvkgyt6fb74ifQH08s1
	mRFAMJH4IGefrF0wJyTEOZZ8+++h46NEq63gOD8hf7Bv01KnsWsXyfYPmtc4HwCc5evuiFL16pM
	yGX3a4HkJWETzahosba8M8DnB0i1lI4s/CKrP8B7EP0aj2fU0kTUGWl/yVVmSlr+uSZGtRkq5/f
	vlu/fX0wjJwxsMbk0TYKZCfzgbjkLqw==
X-Google-Smtp-Source: AGHT+IEVLkeZlLSkzoTpPLzlBRvNTQ9m/bl133jXYp2zZldNvB+tlYKH8pXYzZ5ISfOO2+UjGM6RFg==
X-Received: by 2002:a17:907:e8d:b0:b0e:3d88:27fd with SMTP id a640c23a62f3a-b0e3d97e027mr75192266b.8.1757822048020;
        Sat, 13 Sep 2025 20:54:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07da7a8918sm303079766b.56.2025.09.13.20.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:54:07 -0700 (PDT)
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
Subject: [PATCH RESEND 44/62] doc: kernel-parameters: remove [RAM] from reserve_mem=
Date: Sun, 14 Sep 2025 06:54:02 +0300
Message-ID: <20250914035402.3670906-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_205409_935145_0D51529E 
X-CRM114-Status: GOOD (  11.18  )
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

This parameter has nothing to do with ramdisk

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a259f2bdba0f..0805d3ebc75a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6277,8 +6277,7 @@
 			them.  If <base> is less than 0x10000, the region
 			is assumed to be I/O ports; otherwise it is memory.
 
-	reserve_mem=	[RAM]
-			Format: nn[KMG]:<align>:<label>
+	reserve_mem=	Format: nn[KMG]:<align>:<label>
 			Reserve physical memory and label it with a name that
 			other subsystems can use to access it. This is typically
 			used for systems that do not wipe the RAM, and this command
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
