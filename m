Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A68C61DA4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 10:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twb99j4X2X3SfeVnpBQC/5vG+FsBqmokgBAtyVqq1xE=; b=3P6GMeAL11fGu+
	Y4jocvpCS+URF1iT6FbTs2Mr37YC79yvfrFeL/zEPgcwTc4ISaD+mUGdJurFhVGHR+CUlrdDsXfto
	hnt8MWVe3jwDWlfFQc2SmzaIizO3UvWMfJZn/UsVnE3vVVcBCy9BwcX6/9aJs3L9BWxLQW878/l2w
	R3Cd6VMYr4i5zw+PzlarSp4teWwel14mlMpsq4WqKpkwMn8Mp1pxJfwqlqFEkAyDyigNpXuGlCBSG
	smV7Mn2lPaK/gAjQes9HXnzRcRHSZrLKXsb7jWcwW2WzzQqQ0t+HSejX9/2IL9ZIaJ7kkRsGD/wNu
	qoCi/3OTdVzyVHGGatOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7s5-00CGKO-Hi; Mon, 06 Mar 2023 10:15:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7rx-00CGHC-6H
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 10:15:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id f11so8191592wrv.8
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 02:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwBZgJx9HyrLwqA+EFd8z8zPLSYPP3iOweDmVQSMSI8=;
        b=XVTaQziFZWfnDAXt3X7ss243oaqBfQgxq+BWI8wvM/1C4Jd4ZzaN9gn/iZ6cq8OFgY
         wZ3QMWE0mW5K6zVtrJw+GuBOkKmivmkKNKt+HA4sY8SW+lVWK6t4Xdx7hHjeI2kulIu8
         DGk2zu3MgwM2pbh+ZG9wfkwP5y6mVUn+9mA39OoKqGsY7KsbMNSA2r4Z+RlHKij28HMZ
         XpALxRTmTUubTNBw1UPGnRpKtcibbj3CRft/KrGZsvz1bBBKISHl2eALdUyLAXcmz+Wl
         p/aT307puoZZw41SQvTwImFZlATzx5EOyNYFw5ZOH/h/qgSPFH0Vr8ZGsJgSweYFvNRT
         QOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AwBZgJx9HyrLwqA+EFd8z8zPLSYPP3iOweDmVQSMSI8=;
        b=eCqelDb8mqlM8irLRAV0uF3emg5Ad0ZgplgBwOB+GKS6kLz5s3+Ce0F1rcCp+T67lG
         b0OBWrGMV9IdN4bIvZm9Hq3j3EuMPGqUBZcyX67GpFFNaNgbZjQW4/fXtR3N9sGdAJ8v
         956YxmAqoSvYIg+uOApAlfCYSa9y6rOU+lLuPD7NTcoYrSq4IhOsqr6ji2htYfb8uYi5
         PpOa61AZQkIvq2QgV8XPA4tIl8n2o+/sZdEK7bs3IH5IvD9uZFZHR3afkSfoparLpgWo
         Lnxxc+bymAMvpN8faQPcOknkCWoEV6RJ0RnT2471SqZkBf1Yt3WzPDGyOHoSvEXlvX71
         3l0g==
X-Gm-Message-State: AO0yUKWS/joSVYf0Yl7VtmGHIuUaaM9kNCY8azcldWTThygh559Chmxa
	Yn6upWdS31JSQ6USc2V5IBUXKw==
X-Google-Smtp-Source: AK7set/uLH9lFfoz7JImjvfENjs0N7u07wbWcQReS3sy6jc924z7ZBRg6wmS7ex5s6IqMONld5PFMQ==
X-Received: by 2002:adf:faca:0:b0:2bf:cfb4:2e1 with SMTP id a10-20020adffaca000000b002bfcfb402e1mr6571965wrs.45.1678097699558;
        Mon, 06 Mar 2023 02:14:59 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id g11-20020adffc8b000000b002c7b229b1basm9443048wrr.15.2023.03.06.02.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:14:59 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
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
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 09/26] powerpc: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:51 +0100
Message-Id: <20230306100508.1171812-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_021505_500632_16F321A8 
X-CRM114-Status: GOOD (  12.22  )
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
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/setup.h      | 2 +-
 arch/powerpc/include/uapi/asm/setup.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index e29e83f8a89c..31786d1db2ef 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_POWERPC_SETUP_H
 #define _ASM_POWERPC_SETUP_H
 
-#include <uapi/asm/setup.h>
+#define COMMAND_LINE_SIZE	2048
 
 #ifndef __ASSEMBLY__
 extern void ppc_printk_progress(char *s, unsigned short hex);
diff --git a/arch/powerpc/include/uapi/asm/setup.h b/arch/powerpc/include/uapi/asm/setup.h
index c54940b09d06..f2ca747aa45b 100644
--- a/arch/powerpc/include/uapi/asm/setup.h
+++ b/arch/powerpc/include/uapi/asm/setup.h
@@ -2,6 +2,4 @@
 #ifndef _UAPI_ASM_POWERPC_SETUP_H
 #define _UAPI_ASM_POWERPC_SETUP_H
 
-#define COMMAND_LINE_SIZE	2048
-
 #endif /* _UAPI_ASM_POWERPC_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
