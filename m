Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F50AC64EC7
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 07:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qpQ1YUz0qO/FxlUoMjsjyjnQouOmxxZodsmP6f2nq1A=; b=w2usRmk2L6g4Nv
	1RQVRX81OcORfAsKFBMi1/NqryPDbXMMDE8nLfAyXielkNvPJ341Pj3ovJ3Yss3zOg9SU84iWy/+I
	4ZdtvsSi1f8zrkbJUZlK7IBKKj1A1w1O6HaIktWmVEkOIOZr5W8eDufcODhA/AF3Ghg68R4KJ/6SK
	JjawA1PTs50BuHp6UyqFXPSne8qYysJdR8npmQKpVtNF6vUcHxYZfEcXT2d2Q04FS60MWBMtTK7Bu
	qHeNo2aqvf705Wvaevd4GLYPvl4OxKxmE+3w5qi9bLON2a4sKDjcRoEBPggAjCKKn88HtIVEfHwu6
	JHKAgUQagY/1qp+6eHeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRq5x-000LOq-Si; Tue, 14 Feb 2023 07:51:21 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRq5p-000LCz-Oq
	for linux-snps-arc@lists.infradead.org; Tue, 14 Feb 2023 07:51:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id a2so14685442wrd.6
        for <linux-snps-arc@lists.infradead.org>; Mon, 13 Feb 2023 23:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfhnFvdOBMaLaqHchQiBMEzcSlF2Fa7xiydpzk9bce4=;
        b=C2iakMWMXSP/c9K7z5Xrdh2FZ8isHrwxMldv7DFWh875IFzrwvaewsb7pv+pVa32tl
         uGCdv0Gz5Sla77Gz5skt6wbYUcHV0MvrDD91ZQ6pbR0FErzvIa+siHbNV83wcBxe5ArP
         aJt1rzTFYZAlJ16o/6rxYLUe5PNm3Cl+WBlup3rC4VDyDpLzh+6dKa0ocOU49K1pDDRG
         2DU7qDQ8it3t/pBnyu9Q2n/Gn2V8da6o1Pd0nCVDpMY7pf+5XFSyefWucX0xtqrzNgZK
         hOieCgCpkZJ2M+Y8BO8XCPqXTZ1/32v6n2w6GpPqHXYf4CRyUxX7PkOvD2S1cOWpGGyY
         hVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfhnFvdOBMaLaqHchQiBMEzcSlF2Fa7xiydpzk9bce4=;
        b=gq/mdST3uwA6+f6Aa5irBwsN7hqi6Uc7AKQtQvvTfq4KKyyCqKcnHedv0lxYRHhqQE
         veDWsqUxDV3vpUm6rAwe0IH87iI0aLozD8f7JTLEZMT8TXz80Mk/DwTraYDKK+1cPLGU
         eR9eTDVpw9Ejo++8Pewnvz+eXGPzGvKeajaoIhq/b+MIWWw2l17MwjZ33VOG+ZUOhzfe
         knAXvS4/TfrASrsDIwK0q1vYgN9nkWM0KL2ThysUW7uij0Kx4ipHf8UWg96pyaNsa9kG
         ngtKKSMac/3EdrAlYMGAleRjsDn4yBIy1QQ18hJrt4auQiGwdyUEbBZO3u/8wT7yzABF
         nU8A==
X-Gm-Message-State: AO0yUKW+Bn7yoTqkRLoBjjmLuV6qb1yyEs0yRUb0F16kCCOle/swj4p3
	b/CO9HNWadH6+WWhYRnA9K1tRA==
X-Google-Smtp-Source: AK7set+tz6eryASejtd5hVfxacJT6BORz8YwC4GVnZIt8q/N1OOFFLu4x7zoiximKp+ApGKLpAFEDQ==
X-Received: by 2002:adf:fd45:0:b0:2c3:e300:f5a2 with SMTP id h5-20020adffd45000000b002c3e300f5a2mr1090779wrs.50.1676361059827;
        Mon, 13 Feb 2023 23:50:59 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id f5-20020adff445000000b002c53f5b13f9sm12091737wrp.0.2023.02.13.23.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 23:50:59 -0800 (PST)
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
Subject: [PATCH v3 01/24] alpha: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 08:49:02 +0100
Message-Id: <20230214074925.228106-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_235113_837972_1182140F 
X-CRM114-Status: GOOD (  13.45  )
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
 arch/alpha/include/asm/setup.h      | 4 ++--
 arch/alpha/include/uapi/asm/setup.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/include/asm/setup.h b/arch/alpha/include/asm/setup.h
index 262aab99e391..ea08ca45efa8 100644
--- a/arch/alpha/include/asm/setup.h
+++ b/arch/alpha/include/asm/setup.h
@@ -2,8 +2,6 @@
 #ifndef __ALPHA_SETUP_H
 #define __ALPHA_SETUP_H
 
-#include <uapi/asm/setup.h>
-
 /*
  * We leave one page for the initial stack page, and one page for
  * the initial process structure. Also, the console eats 3 MB for
@@ -14,6 +12,8 @@
 /* Remove when official MILO sources have ELF support: */
 #define BOOT_SIZE	(16*1024)
 
+#define COMMAND_LINE_SIZE	256
+
 #ifdef CONFIG_ALPHA_LEGACY_START_ADDRESS
 #define KERNEL_START_PHYS	0x300000 /* Old bootloaders hardcoded this.  */
 #else
diff --git a/arch/alpha/include/uapi/asm/setup.h b/arch/alpha/include/uapi/asm/setup.h
index f881ea5947cb..9b3b5ba39b1d 100644
--- a/arch/alpha/include/uapi/asm/setup.h
+++ b/arch/alpha/include/uapi/asm/setup.h
@@ -2,6 +2,4 @@
 #ifndef _UAPI__ALPHA_SETUP_H
 #define _UAPI__ALPHA_SETUP_H
 
-#define COMMAND_LINE_SIZE	256
-
 #endif /* _UAPI__ALPHA_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
