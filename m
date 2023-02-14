Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4F6C61DA4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 08:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AbPtQciUWLf+iOWaABdYDKZzufUn+fbKm/RxAhuv4O8=; b=qsGU0YElhUKUzf
	WO58fHNG7yW+KBUzHlEvOjZujcfO53k5/MgPvq6xXj47NeboOcaZSNttq3eDxvExxDpYqt6MpapUn
	m2UpSXUe6igEkJhTvf7jg+/uaEb0DQy6xzgxxnKmZnDnpZ7xKsrg/g7J2T2ljypqVvH5dlxtJE3Wg
	AjwatwO6AoZCS6PM6/QyzM16gbOoy4O6xxLGGjotVjidqkk3YIdsn70U3tqzPeb3QfE7SWzhXVDsp
	BhiMhxAHM5tcYmyuEMP2x9AYNFbeNVG6Vt4OyuzIrWk0Z5vsgvxFnAzG1f8McDDiB2SK/ZUydwg2M
	qpvrA30qebATvUNtiIOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqLZ-000SJY-KM; Tue, 14 Feb 2023 08:07:29 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqLX-000SDN-UJ
	for linux-snps-arc@lists.infradead.org; Tue, 14 Feb 2023 08:07:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id y1so14733647wru.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 14 Feb 2023 00:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZHaQjAFpi9TJWHqFM+95KfED/Q/8XVJn3AfBj+QDY8=;
        b=uZIt+yv3Rg0dRbYtDO4MuhueIjGb9TAYKqCyECWZ/pl6kxcq/ZScMcW17uh1gUaGLt
         hGAhN58F78Lif0nQk9GYnmDx6JH71+3XdZrEkBug2V0DL2r8JwhMszUTSoUtEy5uL4g1
         MZhmBB468Ai2JKrumBevQN+BKMFUchLI/sX3SYNDKBGJSigvT6owhO74tn5mcs0e62Hi
         5CKGwVDlVzcCqv7RBOx+1FJHSFG5dnETFIa/vgkhtiRl918Ndaz2UhLZ50OtWgHYQ5sc
         Mm8kKOB4GLKYExB5Z36oYFZFv2SKt/EzPmlelXOzJOpWGnGPt3qNyRJWHMdrETdBXG2y
         7CKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZHaQjAFpi9TJWHqFM+95KfED/Q/8XVJn3AfBj+QDY8=;
        b=KDZkyn18hYWJ9Ig8fAYH/9N4+/u+xLU27TMoDbFBWuBdeylrhGejD9VeV8AKjMrt9I
         nrvlSeO1XVP0SfVj8+3rofLxA7q+6cNGd6g+IJAZlmX5QIICJZpCBvujcGsluptBRGfe
         yTP5J13HEnXiGkLBcgV4wFRgrv7gdGu68wLS9tbd7oSqfWMeUDaw4ZuuipC0cVE0Zdl/
         PkZMpEgpVmCPHcVeHOj3WDmZHouq2iNUc4POHBvnbrc/tTWrdBN5X60rGo+ObCkXpbtL
         Uw0P1zt1az4MsgoezEaKmWchX5SHriOaRIISIGcuF5CuDZsxJOlCOKo3IgaOx82QOFU4
         uiyA==
X-Gm-Message-State: AO0yUKVKljCDgtVzMoFaq+o2v7CqNtM43ykWF5fE2tjeLp1jjAZKN8sJ
	bz1ZzfupUpQ5L6aLUP+3JD4sJw==
X-Google-Smtp-Source: AK7set9WUVgu+/boPjRArE+Xd9tL/6RHHSSKqaOX0kxjfwjWsxLCB3J5swxsFqsjW07vMCivTOMoSw==
X-Received: by 2002:a5d:5943:0:b0:2c5:5ef8:fa3c with SMTP id e3-20020a5d5943000000b002c55ef8fa3cmr1266621wri.52.1676362047476;
        Tue, 14 Feb 2023 00:07:27 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id t9-20020adfeb89000000b002be0b1e556esm12246547wrn.59.2023.02.14.00.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:07:27 -0800 (PST)
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
Subject: [PATCH v3 17/24] microblaze: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:18 +0100
Message-Id: <20230214074925.228106-18-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_000728_001322_FF3B0E56 
X-CRM114-Status: GOOD (  11.79  )
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
 arch/microblaze/include/uapi/asm/setup.h | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 arch/microblaze/include/uapi/asm/setup.h

diff --git a/arch/microblaze/include/uapi/asm/setup.h b/arch/microblaze/include/uapi/asm/setup.h
deleted file mode 100644
index 51aed65880e7..000000000000
--- a/arch/microblaze/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * Copyright (C) 2007-2009 Michal Simek <monstr@monstr.eu>
- * Copyright (C) 2007-2009 PetaLogix
- * Copyright (C) 2006 Atmark Techno, Inc.
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License. See the file "COPYING" in the main directory of this archive
- * for more details.
- */
-
-#ifndef _UAPI_ASM_MICROBLAZE_SETUP_H
-#define _UAPI_ASM_MICROBLAZE_SETUP_H
-
-# ifndef __ASSEMBLY__
-
-# endif /* __ASSEMBLY__ */
-#endif /* _UAPI_ASM_MICROBLAZE_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
