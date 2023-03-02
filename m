Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FAAC678D4
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 09:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+svT33RzvbiBox03wzPaZM3aVvF4c49ZhO7Qe+nlMPo=; b=Df41/y6aK94/kq
	ojUQRT3clQbvBs440tlssX8E7BvLAJc9YKIE3fwnSJ9sRfo1pS7WRikndlkeuxiS8dwxTRQPCWpwj
	92iraHxRfeNvQtWai0BJ8mpy9liRTOgMgbbL/2IwnIIYy2v6Pb0z86arMbY/basf43OaFTzzbqk6h
	nD/H4HKwYgufXQHfuhA15mq3wqfSsqvWuYECuObPR+L+3gcojYWn6NkidKTHuQgFJyM2caSTkcFRh
	fvFfFCpz2XmVpE9dzaFxTZY70brTmWaZFET7LQ/8r9YmF3xqXVnMOXKKH15SqG0woR3zMMFNSyFVY
	/oriREAZy0oGA/s3M+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfgj-001YfT-4n; Thu, 02 Mar 2023 09:57:25 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfge-001Yc8-0M
	for linux-snps-arc@lists.infradead.org; Thu, 02 Mar 2023 09:57:22 +0000
Received: by mail-wr1-x433.google.com with SMTP id bw19so15878903wrb.13
        for <linux-snps-arc@lists.infradead.org>; Thu, 02 Mar 2023 01:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677751038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbWJMLbW9/e/jUg8R3Gl59aPCKpvLB2ljblArfmNMkc=;
        b=D2ZYUezj7aXly01/SHVyB+eFeXkneR6Cc8J1my71IdSLnhhdqJGVfRRuNkgwlJ1qTN
         XUUF4gwOhKXYNFbCGsPQC/fmmm1CJhuz26LBixBplzOx/7FJFh6PFoLAIUEiL//BV7/Y
         05yc1sH5U/bYE6lmFIKXOjlBADocSoL/FEYlfqKZv7cm3nfJkD6F5h36pt/Z2SLu/6qL
         Q4UPcDTpDkTK02yhFZFBAya3cYKbiMxizDybGbQOWT1w/zioAktweZfsaacnK76n8rs+
         hsQvLkRQmO2Fk5KV27RZdUHPghO6NZZTRFh8sElYxJrDsC3pGWp7EiGwSf9BKEnHMDqz
         Mp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677751038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbWJMLbW9/e/jUg8R3Gl59aPCKpvLB2ljblArfmNMkc=;
        b=18+7bD4XAiHe+4gY92W+lOvUKujVvJJyN6poznSkdGOsy+x4TdJgWyzN/weuRShyLZ
         U5oAoaxEP9WxU27Y6nDHPBXwVFsKlNllB8VcJ+ms20JcVmZdpK39NC6iShk+rY4lSsKt
         2bkqd0YjflsuZOqE0FLdC6JJz60WnrpJIRta5r3DUfSrRfwFznAb3qq405O/f1AgX7V5
         ig9iKyLGMqpgbwJR1gY4KvSRJhXdAqR2lasgYgNABvwwwUiiekVEVHq0m8In2KUECUT/
         nxpaH2eTCO5XBiyvMjzj7MfnayO59SoSTb+U/BepUgz7hK6TlS/9o82wKI5yKk4z3jQc
         2xHQ==
X-Gm-Message-State: AO0yUKUCF/FsDfJJy9LtjExAUDFXb9k87nmnKhUOmle08/kN4d/dvecU
	T+NttOLZOfZOLI2KlZ5s/YaJ2Q==
X-Google-Smtp-Source: AK7set+UVLLQy3pDYpEgdjukHVt3/WbXJ1ubEMzbQOj5ZYV5HNP6MY5JJcqxoBmTXacmF2llU10eSw==
X-Received: by 2002:adf:f4c9:0:b0:2c9:8a3c:9fc5 with SMTP id h9-20020adff4c9000000b002c98a3c9fc5mr6437471wrp.41.1677751038459;
        Thu, 02 Mar 2023 01:57:18 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l7-20020a5d5267000000b002c8ed82c56csm14784474wrc.116.2023.03.02.01.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:57:18 -0800 (PST)
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
Subject: [PATCH v4 21/24] xtensa: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:36 +0100
Message-Id: <20230302093539.372962-22-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_015720_117738_9219A7F3 
X-CRM114-Status: GOOD (  11.26  )
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

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/uapi/asm/setup.h | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 arch/xtensa/include/uapi/asm/setup.h

diff --git a/arch/xtensa/include/uapi/asm/setup.h b/arch/xtensa/include/uapi/asm/setup.h
deleted file mode 100644
index 6f982394684a..000000000000
--- a/arch/xtensa/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * include/asm-xtensa/setup.h
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2001 - 2005 Tensilica Inc.
- */
-
-#ifndef _XTENSA_SETUP_H
-#define _XTENSA_SETUP_H
-
-#endif
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
