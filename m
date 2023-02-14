Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37162C05027
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 07:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPoEFNWJyvLc2T3k2dSpz5nSw5hNMG/bfNgKPo508Eo=; b=yBhNY/WhWxHdqn
	47m7zHLweuCgW/5QR1jOGiDcXSR0jkYU0KwZG1LgwUWJiewTGnGykqax75lzN1+Ioj95ruWCwz+Le
	yNjYTwp5rPnJTiA2PgDX/0Qnr0YGeoqRfsexgU9fD96qGhpusVjDMqbREyp0jgDXww99sZQ9vmFaf
	c3BkBuH3hWpwLMqeEcYZ8JOMhIYuEDhn8QwkUr1842gfLtPuvjdG6pFGj5TIQdEkVKeehQE6JPp7l
	bbQ2vIC7nMoAwErIZAelkNZU8im18gzSlghBgaqXQhPdcULwFSBsmjckw1np5nzablxWfxLwGtJ4A
	qlPHTu14UghjB55SrKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRq6g-000LlH-Lc; Tue, 14 Feb 2023 07:52:06 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRq6c-000Lif-OJ
	for linux-snps-arc@lists.infradead.org; Tue, 14 Feb 2023 07:52:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id n13so10341845wmr.4
        for <linux-snps-arc@lists.infradead.org>; Mon, 13 Feb 2023 23:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QGomR6O3S6q1h7LTqMqQGUhrMtnm9a8zoeq++2Xa7o=;
        b=fR3zO3k5w7le7EbRP/5hPFZY4uLUH4ckgrh9M19BdH9Dv5reStNddHAA25t4N3Sesc
         W25DNRjk2eDkyloYIh9FawqDzoeoM5Ihv9WzrU14UP5nmny0ohmEa7tB18dRaok9qcca
         Cg0/N9fChXGeR9QMmopc9nD283PdFxnqO1RlIt/KWu0qU3CATwIBzQpWXLSYWOSHHwKx
         jTukzmp6/vXmx9SoOo9K/bTE3PzB48TIwUC3pPgKI8wOpNsm+0N+U4RKCka40i+f5BkP
         /FvKgQ3hYM5uSvNyCCcF0tflxn/F7hAgfgHVd6eT53WfWqqvJFa/ALNyo+E9eOUo2Ak5
         AmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QGomR6O3S6q1h7LTqMqQGUhrMtnm9a8zoeq++2Xa7o=;
        b=HGdrRkZKof7xmNfIxcWHyKTik701283t4cJuSA1WZf9MVfjW4DEGhfmioxnS1KT15y
         vHfxYlteobt6ccc/IIO+JmobBvOYKZZx0PcD/9cE1L1d0fyJV4bLvC02+8fKTnk3iwVS
         Jc8/bBYjlYo8cJNPyD/tNypvWWLa3CqCiSWbi/+bRIYOB7VVNrJs1gerlgcv9urq09d6
         Dj3Xhj5i+GW1xZxoNE9jQj2ktPdSiSoQtfBRooQk7H7Jtnj0OnSPM92yDiWMEmICp4fc
         Zu7j4U8LgZ0f90T8OYFxCJUZgBhZFAvKuXbhqozwvkcMwkE95OMcGUtyuIaNyor5NIHg
         rH3g==
X-Gm-Message-State: AO0yUKW72hfqlgalZLO2Ky3GuYtxiY9IIIGTt7x7RI+4VidGSqIAdw+c
	xE6Xg9ZJghNGBi9D8oLYK1tSGQ==
X-Google-Smtp-Source: AK7set9/2z/bngt+TO0I8mQoi50ZVTNoeKRPycliCaMbwq0WtByVc0+O7QBcGv8JCO9MxNJMRmluyA==
X-Received: by 2002:a05:600c:4b20:b0:3dc:53da:328b with SMTP id i32-20020a05600c4b2000b003dc53da328bmr1128761wmp.14.1676361121511;
        Mon, 13 Feb 2023 23:52:01 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id n22-20020a05600c4f9600b003dcc82ce53fsm17982254wmq.38.2023.02.13.23.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 23:52:01 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	linux-arch@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 02/24] arm64: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 08:49:03 +0100
Message-Id: <20230214074925.228106-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_235202_828076_2A697985 
X-CRM114-Status: GOOD (  12.09  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/arm64/include/asm/setup.h      | 3 ++-
 arch/arm64/include/uapi/asm/setup.h | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
index f4af547ef54c..7ca70f883cee 100644
--- a/arch/arm64/include/asm/setup.h
+++ b/arch/arm64/include/asm/setup.h
@@ -4,8 +4,9 @@
 #define __ARM64_ASM_SETUP_H
 
 #include <linux/string.h>
+#include <linux/types.h>
 
-#include <uapi/asm/setup.h>
+#define COMMAND_LINE_SIZE	2048
 
 void *get_early_fdt_ptr(void);
 void early_fdt_map(u64 dt_phys);
diff --git a/arch/arm64/include/uapi/asm/setup.h b/arch/arm64/include/uapi/asm/setup.h
index 5d703888f351..f9f51e5925aa 100644
--- a/arch/arm64/include/uapi/asm/setup.h
+++ b/arch/arm64/include/uapi/asm/setup.h
@@ -22,6 +22,4 @@
 
 #include <linux/types.h>
 
-#define COMMAND_LINE_SIZE	2048
-
 #endif
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
