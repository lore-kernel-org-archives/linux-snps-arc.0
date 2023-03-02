Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E55C6FA8E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 09:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGOL7+Uu8E5GhNz5vszA4j+ZgWK7sSeUhHMVYN9IbEQ=; b=asE+QCzTWo9Nun
	YVhs7fxJ3u91GpJd0VlfIvhYkYQmB/csurQL5xVbxSH4bL3pA/Px+PJfk7dzPS2lYKUBDvtGpuODr
	8AeKkAP5Scr/g6Q35j4Cgttib6YjDWJZ0jIyrdIMQ0uBIozO+Zr4fGSV56z+xlS6YYUenOtQgvy0H
	lvKPqO6OfAT+w8Tg3wlu+svLeDOWMRLOS4YroFQa2caUr/5kikcxz6yI9rllvIkvNoomqiGDlUF1N
	g2rnJ+ZzPYOe/Al7dackRTvc4PH91CpQ7vD25Qc5YyxkCkT8z//NuMMnh3aXbLUDbv/K5aEVdAJQ9
	ba4/vEc3apSQdBXk9ODg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfNu-001S0I-KS; Thu, 02 Mar 2023 09:37:58 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfNk-001RtG-Ea
	for linux-snps-arc@lists.infradead.org; Thu, 02 Mar 2023 09:37:49 +0000
Received: by mail-wr1-x430.google.com with SMTP id g3so6980306wri.6
        for <linux-snps-arc@lists.infradead.org>; Thu, 02 Mar 2023 01:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677749865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqgG96kIfrM1gqMHmNCahiNfUJeEB3Yoev2yU5VrqsE=;
        b=3T4efKjmvFLj0Sap5GTKL4Xj6tQ6ZeYI1K7Wp/dVc7Fdevq+cmCM3TKgaXWDSzqNWY
         VD5vYq/x83VdNoxfwerHMUeWJALyo6YQbivbn3Vuw66OxFLiVRNWVQ/e8immeMjkIN5I
         AzZeRHet0UE+NrLlFw9RQVWB6hBcl9brTRsXWsUPR06sJXVN/Pqt2s79soG+kCjyNfgZ
         Irmg8/tdoWk/SF8SnAFsFGts/cECj+sPCWqjl4zh9/k7ZAadmbBYYA99/1qIXohMuwFv
         sET2WbLjedfjnMpB4vAQiNQAH76p0INnCZi/3Ww68KpktBF6K4psDUSp7D+R1c3iXfrb
         4Z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677749865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqgG96kIfrM1gqMHmNCahiNfUJeEB3Yoev2yU5VrqsE=;
        b=KQ+LSSWynxF+w11O2nZwRDobmSiGhmhRsLSpNqfJ5xdet9Li1NhgLstk43Os7G0H6m
         ESstAJkmDN+3qR7bZUWHU9A2XTp4/5S0vdK+bLZp2e/2eUNhgMBiDIJbc+u3wa5maSAT
         8u41rSUxQSbQNzjTM2iRtmSi0naKJVjWFoB/5MllYVURwvZaFdaF9v+OLjda5GoUkDkW
         yM7M/Uveu8zxPJrBNz+5AKM8vw6PTuDSMtU4RqYaZvX2UfpcVsqwk2lVWMbM7UmZASZb
         tQJCvXsWcjwEjAVy+zy/tjC8/3w8+O3/181kVv++0mqL+X45DF1GCvl/BMgJCQYEzm/L
         g3/g==
X-Gm-Message-State: AO0yUKUuZhQkahq9vAHygdPhgNc48BNgTV6ytpMotkbqA/9TWO/o0xhQ
	cCjB0VwlYYHkfB8uu0foSNVMiw==
X-Google-Smtp-Source: AK7set92Iml3htIloGDpopR6EcPPcIDmVGHvzXXoP9/6JVqjucrlsZlF8JwWkbiuHLWZ9yjUPJ1TqA==
X-Received: by 2002:adf:ce84:0:b0:2c5:4d35:5260 with SMTP id r4-20020adfce84000000b002c54d355260mr907115wrn.16.1677749865520;
        Thu, 02 Mar 2023 01:37:45 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id s4-20020a5d6a84000000b002c551f7d452sm15067918wru.98.2023.03.02.01.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:37:45 -0800 (PST)
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
Subject: [PATCH v4 02/24] arm64: Remove COMMAND_LINE_SIZE from uapi
Date: Thu,  2 Mar 2023 10:35:17 +0100
Message-Id: <20230302093539.372962-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_013748_555282_BAAE3E74 
X-CRM114-Status: GOOD (  12.29  )
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
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
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
