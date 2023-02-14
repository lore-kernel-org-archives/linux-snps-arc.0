Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA883C05027
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 08:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhCjymVHl8ezZC8TrhTXCUl5PC2Uk1VTgF3KKOOyQ1M=; b=B/iDLw4rVLmK4i
	NswKsoPxOwD9WvlVtfBByUJgMFc5jSbhhq4pYVpcj9fhVo2HpWF2P+pi9QRTjdLcx3oEiGsQJfYTu
	RCdDMINLRHCvXy+VH6WybMm9y13fGiqgIdpUhfqO+g+0D07v8hlOxF2Iz8IDEnutAj0tg79bOc5Yx
	80HBSJPi4A5uxXOsric7QHV087D7rZYLXqv1us/yVL6TQGPkZ31w8V/BU9btdGU9HNlZTDGOn50qG
	r4DlR0/sdrfkObDDDh6tV7Rb+ueEi00wBUWtjydJ0z/eP6iKcgJou0/EKco3KyAO5l9/Hwz5CVXbP
	0ucRY/uIEatSG4cJfC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqKe-000S0K-Hh; Tue, 14 Feb 2023 08:06:32 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqKZ-000Rwc-6p
	for linux-snps-arc@lists.infradead.org; Tue, 14 Feb 2023 08:06:28 +0000
Received: by mail-wr1-x430.google.com with SMTP id bu23so14698516wrb.8
        for <linux-snps-arc@lists.infradead.org>; Tue, 14 Feb 2023 00:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/w7ieSXW+WzBEEqtsZC24vvchjHjLnvFIFUR1Ngux8=;
        b=UGrBcngruwTLvwOOm7gOoc2Yzgq2gmU8JRfZsTFbWRd99AV3ziDVQuBUVdZS/uBCFk
         +3aLdmRI89tLj2iljfUlsLdSxPMOr5QSmEVADDMVykrfeU2sAt+uFyobqYXV6XUQvHtV
         jdUz1vPuc9IWOpiCNUcrs1cCLlV2re4AVPHCx4XLzS4MxJsBM6UJszAfCTjH1KmA8qZQ
         TWkyzsUaxL17K52AMLE7+/TIWSwi/E0sHASnxATgyu66+VseSWhxLktBl3TOfl1HX6wj
         4bxu9a8rEsGTg1ZDZ3zYhDk1wa1bPvp7XX5Iuj4jyR7Z+HHL0oszr20E97QEiSzhgOlO
         W96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/w7ieSXW+WzBEEqtsZC24vvchjHjLnvFIFUR1Ngux8=;
        b=na5Z6iTU7UKybL+QcXXKMhSGpNeWW3HFnZ2zL16ATOWes1TH6tqJP2wNqETODMSqKM
         dVcJwrogMoi24uq76ZCUXHppww2BFQ0uX8lwh1SUbFcyCWGQZmfGadXGV14d2dvAzJTa
         EJZrzIiQPuSeF0L+DPT3c9ofw40VleuxF703fWVvNJFhBRp2u6q0kfYK12I2FeR6fS+s
         NvviOBpLOLYivwP3kRdrCK3ceWjR3U89Sol9myj/Tc1ID2w/Seg/10PgKNWY9BosVsSC
         FRAihHyCB5h8NfE4YiBysKihQDLT3JFbamjR1mH9//KIe1MWhOKIBQCk8pL58twOZGws
         y9Kg==
X-Gm-Message-State: AO0yUKXIozkiDBDJ3wrosnTFFgAhrQ7fuDmH+YDiFXJFfaRg+frJXRTN
	5UfsG0MW7C4U3WfzW6GGDPiQxg==
X-Google-Smtp-Source: AK7set8jahhsmvoa4DobzenRk97aNdlbkQr6UNkRKatca0OX964f0M1CS0uJhtUAyqSOu5CbY69FOw==
X-Received: by 2002:a5d:658f:0:b0:2c5:60e6:eac with SMTP id q15-20020a5d658f000000b002c560e60eacmr1654715wru.24.1676361985813;
        Tue, 14 Feb 2023 00:06:25 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id d1-20020adffd81000000b002bfe08c566fsm12135055wrr.106.2023.02.14.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:06:25 -0800 (PST)
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
Subject: [PATCH v3 16/24] arm64: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:17 +0100
Message-Id: <20230214074925.228106-17-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_000627_266811_CA7B6128 
X-CRM114-Status: GOOD (  13.31  )
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
---
 arch/arm64/include/uapi/asm/setup.h | 25 -------------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 arch/arm64/include/uapi/asm/setup.h

diff --git a/arch/arm64/include/uapi/asm/setup.h b/arch/arm64/include/uapi/asm/setup.h
deleted file mode 100644
index f9f51e5925aa..000000000000
--- a/arch/arm64/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * Based on arch/arm/include/asm/setup.h
- *
- * Copyright (C) 1997-1999 Russell King
- * Copyright (C) 2012 ARM Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef __ASM_SETUP_H
-#define __ASM_SETUP_H
-
-#include <linux/types.h>
-
-#endif
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
