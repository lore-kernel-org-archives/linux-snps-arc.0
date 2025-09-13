Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E12CA101F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 13 Sep 2025 01:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drMtwY3EVfeUfKVpRyHJTEyWzFYH7L9i4K63jXwLEdM=; b=wNvbpcsReLSKpa
	dICAQeKAZupYYw1ib5yQ5vZ8Hen8eAHv4GdglsGGTeZ97UreKeg/SVw2VSALTaGEeULuKMJVsX06b
	6DLOTxlyyXtSNGw0WRZe8Z+Z5xOvIZVs1H+BGce6PJ/jzb8CNiondcg6XW7NeQiuvZ5JAJuHCcEdS
	Suq0PT/CxOw9R2BCeqKpqa6Frj/v85QO0uLRVt4Og/xjss9oyPrggazUH4TqOHjCGb3cV6em4gvzL
	BYJG5WAeUMzERRK4UhshZrzbzuzcVO4UK9xLEmb3AqirOWAan4OYeXtWNyS7Rnw89GU7KgpC1uHkX
	bRb81Dvs1ggaMeepSEvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEln-0000000CWzq-0nSR;
	Sat, 13 Sep 2025 01:09:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEll-0000000CWxs-2HDD
	for linux-snps-arc@bombadil.infradead.org;
	Sat, 13 Sep 2025 01:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2pGfjPJCmTgFBTQIPRnE53dxXo3SbfDBvMh6uq5akyU=; b=GHbxsTR9ZY6WEtpkKpo8mTOWX2
	NyzFMbpD7v8aufL9hfjKb/s2vVPYgWQ49EEXRHqc730RFIZUlM9BzuNHYQAs8h3yqpSgik6uOKdZ6
	Wa6fM+K4edfU8p4KwQft+mT6Tq5HEzmNbeTDlyPaXdCtYC1r9ccfYeHPhDUhrG9jZsn2VxJv5mils
	5hBi4vjLBA5ycPulSr5teJ5hXos6FJbC9BMK96bkwmEi8PEOLK3AsEA+q4ayD9l5DhJrtiiKCv0R+
	TO44RPqGk4XxBCdkgZDNnlqrY8shpJkGi2wJyst48JgF3BqGGfNo/nI6exnJ3XnalgipdRBqskY0V
	0Yk8mBTw==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxElh-00000006WEP-3usW
	for linux-snps-arc@lists.infradead.org;
	Sat, 13 Sep 2025 01:09:35 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b02c719a117so429933066b.1
        for <linux-snps-arc@lists.infradead.org>; Fri, 12 Sep 2025 18:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725772; x=1758330572; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pGfjPJCmTgFBTQIPRnE53dxXo3SbfDBvMh6uq5akyU=;
        b=KWxbBCe5mNyWB/52yitcrypithj7cDi8pq6avlkBl9bbn1SuSEskWOip4kDttgI1iT
         0j3e/3svG//PCbK8WtA+H+PxVwjS4svaqFKIfYZ6ySDDar0mHjfRUcQ/hIYw0KM2pIyu
         ZClgqvR4RxFjDGAv8Xw5yfPDdLtWFAtPyWJFv2uaAo8JVW2VD+DMncqSgc+Lxt3ieHDe
         bcWYP6wekwed1AKNyk8n8M3donxZm9FGWdUo0AIfzPIdKR/fBYUp/tlTfXKoUeDAyhB6
         BHsgvebmZLLeugnhoQRTxXu5yjeZahk4omCM4npouXVTxkobYFTO9gUVqIaRuI8qVwZI
         P7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725772; x=1758330572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pGfjPJCmTgFBTQIPRnE53dxXo3SbfDBvMh6uq5akyU=;
        b=waqZMVaXwX/KOM7RicwQMQ8PPd7Uzt29vb9i3N0Du5nNRkTCSb5xovk2nyOXyTKopX
         iYVPRBRKwZVIm9fyTkknr0tp6t2ZFQFolXMaX25rOch33Q2241k9UpHpEcFs/EaoO3hK
         EK3MRG9IEKCfStXaTRY1rIBU41qBgc8vapRgVUFqA6aWsH2eky2pcRs8FR/GCvplMaek
         nMzIcvjL+CR8AlDM7hSlvTjvs08nQIXrlEOr6ObUlooACfoh5sl0M0zmfOXWA0Ky6EhD
         SZ1OoTkRhj6RkBBjb2naGJo2jVb4S7VqVGQ1KRb3kfrhjfjsakZIo4yFR7bHhe8zfMDD
         iD6A==
X-Forwarded-Encrypted: i=1; AJvYcCX3T7pq/RuCXKf5wxyvoRiL6qZbPzYt76det26rKQLzZG6I0YlR0UXf/urmiKKrb2rmv9KINQ/gsQmoNPcCWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+Y8B8+jOo5FLBI9iV814+ssuWqbqlg36B+Y918Ygs/XogpuDJ
	sQAxdyeufukUMetrU1K9rbCrPogzIDm1F8BWMIJ2F9AB3oMRMcdlM1Bq
X-Gm-Gg: ASbGncvUCqWY0erbngNROwhnc6OKnUbSOmo3XOe01r1AL00llQ2hCNQKWDotKXOuXc0
	KGGESoSDbG0m0D/0vShOcEkL2e7peMBXgnbHPk6oue69s4KO6HX+a/asC6OevLHjMIBVEsD768J
	vPBFeLK2d+WlDa1k6tHehU/qDki+keI66t4ADy0LlOPnwNPI62snqUmGrqgIsasZJK4qhQnCJbB
	NXkRWy4RcT1w7nRrXsjZPUPxJNPtuvuzrxypB4JIGtwKAVhoWvs8rG/RAQJenMW+O2dDOisxixn
	ufvSzVNq9hWE+WE3jKjLCNQk4bMFaROh7dDlJ7LnN4Z7AJeyUBVe/aHb8aML7SOyRTSehQaSa2Y
	aNKpgq3vY9zePxVf03TE=
X-Google-Smtp-Source: AGHT+IHrHcZIQpP/M06nOcq3Snl8FXkxUTmgmKKbhKMXWfrO9iWe4P5Ilwjf7ocqvFrLGTk9+k818w==
X-Received: by 2002:a17:907:3d0c:b0:b04:250d:ee7 with SMTP id a640c23a62f3a-b07c37dca1emr487688066b.31.1757725771595;
        Fri, 12 Sep 2025 18:09:31 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07da7a8918sm104574066b.56.2025.09.12.18.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:09:31 -0700 (PDT)
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
Subject: [PATCH RESEND 27/62] init: alpha: remove "extern unsigned long initrd_start, initrd_end"
Date: Sat, 13 Sep 2025 00:38:06 +0000
Message-ID: <20250913003842.41944-28-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_020934_294239_DCD019AA 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

These variables already declared in <linux/initrd.h>, which is
included

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/alpha/kernel/core_irongate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/kernel/core_irongate.c b/arch/alpha/kernel/core_irongate.c
index 05dc4c1b9074..3411564144ae 100644
--- a/arch/alpha/kernel/core_irongate.c
+++ b/arch/alpha/kernel/core_irongate.c
@@ -225,8 +225,6 @@ albacore_init_arch(void)
 	alpha_mv.min_mem_address = pci_mem;
 	if (memtop > pci_mem) {
 #ifdef CONFIG_BLK_DEV_INITRD
-		extern unsigned long initrd_start, initrd_end;
-
 		/* Move the initrd out of the way. */
 		if (initrd_end && __pa(initrd_end) > pci_mem) {
 			unsigned long size;
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
