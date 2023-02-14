Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123E5C61DA4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 08:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYqM6wmWz3rQTLlFV9kIERxguwm20TdDVaiQ3U+pQ4Y=; b=MtCa9EBZyXpqYa
	RqnGPzvCSjeKpuX8beW9wSd01F1Z0qB9Qiby21Xj1VEw7iYLIpsZZ1pSfNeVd9aFeCFh6WPa3TuAv
	VHPjeTiKzgHN4Ix2LOAkq4r2FMMqwRaVXop9USGzp8ClHxmQJVPbkGkI8tBXtYh4tEdptPFhROHpc
	QSNiRBYyTjuRIIuKa5doi3BrQDSk/U7iZv2xqzWuUx5jJgAB3L0R1Wz+BlaJZTSlyTRlw+zSnuFAt
	JrL3fjNtwPdCaAWixctqODWcAc/YmzEIiOB+gzqjcVwp/8KAe+hi6byiG7ldTo9QLCbS7wGHzWX1V
	IuMuulBESf4dVFJaJCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqIh-000RIZ-Sn; Tue, 14 Feb 2023 08:04:31 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqIf-000REr-AR
	for linux-snps-arc@lists.infradead.org; Tue, 14 Feb 2023 08:04:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id h16so14682896wrz.12
        for <linux-snps-arc@lists.infradead.org>; Tue, 14 Feb 2023 00:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wjc5nUaXPqzOcikp/dFCXLyDNPdOZGtU07c3eeQkEo=;
        b=QzV31v7ItXqx4yWsJfh152ebFGrBo9gPdhTErCgeoMfuI0a/bXBwVo9zVazH0XhD1o
         1P22Wx88GfdDl5eEqBxmERSHFO/cszqUOCuMenN38SqwMA+e3o2paztN+lm0B02Xgkp3
         e+v+idvauAUtu3a/SIQ7MztA/LQf+9eZsxk+Jym1ZZLsfwfAVWgFyBnu0nM0VTcvl2h7
         FliYXwQgV+CnK774qEo/1yzLrYpRuhTqe2ZbWRvyqrg3H8e5u97kFVktjSnfWw7k86cI
         vT5XzHCiZvDMnZ0VdkIY4TftV6Qme4WQXbWLgnrifFqlcq70lxh8ilRJsq+QAWvDOKHL
         u3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wjc5nUaXPqzOcikp/dFCXLyDNPdOZGtU07c3eeQkEo=;
        b=oGiKjDwFL4krsOLWB9syUhoNVfpfw8netbsyPxxDmq8daM6JWBPx9vnluD+LNJ4XmF
         BbS4JcGrtUL+ev/VDq/JDWvr3Ng8qJXOKMwO1icJhJCbFKIgGDUtJT2qCezZTFCJlz2y
         UOg3FgflSMb1+yY3yVzA+nIvuj3RLIzo02BI7IEMVHNuaYPjSa25jkwG7fRJ/lITENb+
         1clVtp0+feBdjzDH3p1Qs7hfezimMugsfpjX8Xiz7hjY7M4tlpley+Y8vtWt/QQL4UGW
         mPgWl9KKQT9ZP1thZgrDUAfCcd1KiwHEcfDkDFupSMKv1//kqKChalWKKq+NKYzkvofF
         Hc0Q==
X-Gm-Message-State: AO0yUKXkyzHeajI+KOSySqA3Fe5OVnFqFDwFlS92Neu+nSiPHqpJT/YE
	qwPDW4v58zWS/+YlG10tvWf7jQ==
X-Google-Smtp-Source: AK7set8HOf1J9ROM5HGHA9FxRtFWjGn9F9yobbBJ6lKeYYbdTM09Q7loKzacnDzy8U96Ii9jf9YULg==
X-Received: by 2002:a5d:43c6:0:b0:2bf:bf05:85ac with SMTP id v6-20020a5d43c6000000b002bfbf0585acmr797767wrr.23.1676361862446;
        Tue, 14 Feb 2023 00:04:22 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id r2-20020adff702000000b002bddac15b3dsm12021459wrp.33.2023.02.14.00.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:04:22 -0800 (PST)
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
Subject: [PATCH v3 14/24] arc: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:15 +0100
Message-Id: <20230214074925.228106-15-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_000429_369293_AAF48166 
X-CRM114-Status: GOOD (  12.02  )
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
 arch/arc/include/asm/setup.h      | 1 -
 arch/arc/include/uapi/asm/setup.h | 6 ------
 2 files changed, 7 deletions(-)
 delete mode 100644 arch/arc/include/uapi/asm/setup.h

diff --git a/arch/arc/include/asm/setup.h b/arch/arc/include/asm/setup.h
index 028a8cf76206..fe45ff4681bc 100644
--- a/arch/arc/include/asm/setup.h
+++ b/arch/arc/include/asm/setup.h
@@ -7,7 +7,6 @@
 
 
 #include <linux/types.h>
-#include <uapi/asm/setup.h>
 
 #define COMMAND_LINE_SIZE 256
 
diff --git a/arch/arc/include/uapi/asm/setup.h b/arch/arc/include/uapi/asm/setup.h
deleted file mode 100644
index a6d4e44938be..000000000000
--- a/arch/arc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/*
- * setup.h is part of userspace header ABI so UAPI scripts have to generate it
- * even if there's nothing to export - causing empty <uapi/asm/setup.h>
- * However to prevent "patch" from discarding it we add this placeholder
- * comment
- */
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
