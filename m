Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF13C6FA8E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 11:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+H8qQ2SUOO3txeyUQROhEFpG51z/dGe94INHQS1XFtE=; b=rjp9OO7hgd6nPq
	wCQcP7FOJwa6Zktd2IqZvx2MMnbGJROSCFTLMwzVyA4iaW4jb7PxgvaUxcy8EzKSQEJeH8u/I1awm
	A8RQWUPe0dpvN91ATRjQ9TZhjYp+flBoUcT1eWsKmvls9vFC2N965Kc1wvua1QZ2P5E8XCEoC7ItH
	t3sJf7gjtCG8e+aXzWk3FymGzToXsmumofC407XbOdznkT71JNP4C5sF+dN3pHuOwGdJ56LywpDTK
	2Yz7bEw41011vlBUClmUi0CzFvHzUjZE3VwCORFKRcWavHI6Pa5TczPm4Q5Q+J8+YeDnVLtgY62rC
	XzAQZLbZsC0Ugr+v1UxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXgfz-001mwj-1z; Thu, 02 Mar 2023 11:00:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfaf-001WYJ-NS
	for linux-snps-arc@lists.infradead.org; Thu, 02 Mar 2023 09:51:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso1259232wmi.4
        for <linux-snps-arc@lists.infradead.org>; Thu, 02 Mar 2023 01:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDXrUpH4uzk/doR0fj90OitraRNQjXfcQ6Va36x03uU=;
        b=rQvGiyACcWPbt022BQ4KPoifzo8RgfR9WF7Irjyc15Ofpoe2VdY9cU4LWt3/XPjXVp
         zUO52y383SVibU/tjEMRqerhVz4Xk1FY6u1X+LhjxS1bQEtbInYRzVt1zVJkwy+qQUY4
         ZYzfd/Ttv46jZdM+eSJCCX8BJ9TomlaekFXaX6lLss4Xjp0f6E2an2tqydpu1FXIvVPs
         TwshGg1w/E3+Y8dWqBWiBCmS1j06paEig+zfY/J2E+ASdmgmRUTmGM9IRmoaIsqzO4YX
         Kg7kLnPp9cQBIiAp9yNXPyoJk586xxu3D++D1O9aM0M/oTelZGBy7iVF6vpF3zTtg+PO
         PnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDXrUpH4uzk/doR0fj90OitraRNQjXfcQ6Va36x03uU=;
        b=ZpV46XNv77MrJDK6Si1gY4vHuy3L93VwGeQ3kqVaRFU2cGyiuvew7JB0SNFfJcDcKr
         jELbA7sidQiG1vnFmIgw26yIgS/EviFzQhVyEby0W4PZMJlJeKBk2tf/gN9SDbXvIV1b
         skN/6XG6GnnFyooULUE5vdJuNvFAvRij+0ZqNiCktp3xlXtp/IEZrwai0nyDKtH+6NM1
         xWy+wTY8JbxV13g7pfOoNuAWA84NxCwQRHIV4KmKZ3aMxbd1p51bV0jMd8r26joP+f2B
         GJZojtXlVrRw1iruv+kfiOwQPjaysHHmQqRu+cs6EWSG7WggE+WTekFlkydWfBolj/Ly
         kXuw==
X-Gm-Message-State: AO0yUKXW34/MMusFRsjZiaLUwq+qLMLq0MAvs8geQBHiicPtk5O96Tab
	92zV65Kc3zRHdU0GLX/4owvsQg==
X-Google-Smtp-Source: AK7set+aEWZKQAofuTtkdEbf6zV5TySvY9JY2ZvgajiiG+o+W95xNH46kztRn/fmFa9CvC1WgbPmrQ==
X-Received: by 2002:a05:600c:45d3:b0:3ea:f883:5ac with SMTP id s19-20020a05600c45d300b003eaf88305acmr7083444wmo.5.1677750668043;
        Thu, 02 Mar 2023 01:51:08 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c458900b003e1f6e18c95sm2583433wmo.21.2023.03.02.01.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:51:07 -0800 (PST)
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
Subject: [PATCH v4 15/24] m68k: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:30 +0100
Message-Id: <20230302093539.372962-16-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_015109_803884_BC6AE5A3 
X-CRM114-Status: GOOD (  10.60  )
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
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/uapi/asm/setup.h | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 arch/m68k/include/uapi/asm/setup.h

diff --git a/arch/m68k/include/uapi/asm/setup.h b/arch/m68k/include/uapi/asm/setup.h
deleted file mode 100644
index 005593acc7d8..000000000000
--- a/arch/m68k/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
-** asm/setup.h -- Definition of the Linux/m68k setup information
-**
-** Copyright 1992 by Greg Harp
-**
-** This file is subject to the terms and conditions of the GNU General Public
-** License.  See the file COPYING in the main directory of this archive
-** for more details.
-*/
-
-#ifndef _UAPI_M68K_SETUP_H
-#define _UAPI_M68K_SETUP_H
-
-#endif /* _UAPI_M68K_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
