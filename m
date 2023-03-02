Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A57C678D4
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrRouZPABW5Kegl4Br3zbKwcTghJHZM0W+A+aLMRpQY=; b=Xbfzkl9fCwol1Y
	gvDg/8Kozs+TPc5I4FnHddjA7DauMgcd0u1bCU8DkBxymWz4ZWeXSvdaTe+IJCdUR6rFMFniwVhf4
	B6tDsHnuXEvatI/aE36uYxLZNfIZY/Db1fj8sUgBg4Zr0DqgYziXE6OCmv52FGyyjP3QrI1FW5uvY
	2D2idqS5la2tx/jvAH3HUIqw7mJG9rHDllBym8FBygLwfJH8QTFM4GVmTxlFRztficM9utZIj7imJ
	wZgzZrKyHoBjcSB5EquAqQpUQlzv0PlTk9zDIfzZVqpLfmT+FUl4hjrywnD0k7O9YD8KYh+r4NosX
	d+gbjU4GZ/vDPV1WUzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfXk-001Vgw-33; Thu, 02 Mar 2023 09:48:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfXg-001VfA-EP
	for linux-snps-arc@lists.infradead.org; Thu, 02 Mar 2023 09:48:06 +0000
Received: by mail-wr1-x432.google.com with SMTP id j2so15868469wrh.9
        for <linux-snps-arc@lists.infradead.org>; Thu, 02 Mar 2023 01:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHW49K+JXovgrHDB/sHf8iD4ZzCoi5+3r8HKHXzfaII=;
        b=aUycDY6R5Blvxn5QrHrge2eQMzpOJGy1SQgkohH7kfZg+4nkD2I1cJv+iJjAslEy+t
         gXHSodwCtp4lnfGBPcq5o2XKzU7Lkp+/ZPCrkKZaFbMUGkku7rQ7I5Ur/UqnMSvlyAmi
         TkH+ViZphas3kGoEHFF2e+vCiMUueSmxTqckQY2C7JhXbeNIQVcpoQQxV5G5eVThKvYY
         UB4EgPrhcIdWLvBH3F+DNEtRDy41o7SqNDKc7Kgiq22gYv8uf1f7SL7fyRoeQ1MpckJ/
         rewJFCj1A6M1CpaFAsOOzMQJSrcfhc0V007iGSrHIyXHRpsoDawYa6gdKkxx701pFO/M
         +PMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHW49K+JXovgrHDB/sHf8iD4ZzCoi5+3r8HKHXzfaII=;
        b=isXmmdA+h06u28Jv0vINMVgfps11fA4Ka03koEbUPvLMDSQNanUQcdKtKFmmFw6bOL
         QY9Hajx3r91m5SW/yvRn2tKw/BD7YG8v6oRx46D8MxXsNuXFEo/mxFpIhbdylL9wz4mX
         UlmfLEHOEpi6+IJAlbMEz/BZDjCdlF2l1wMtwWhHXJkXuiJ7hR/nbiSoh7dHbOzoPp1U
         vdI5xqA4DK6QBD2p98SYWjhOzRBtEN50yGYsJw+1IoP8r35ZJm5gJWTbesNoQrNVtryq
         1bZ1EvItGNDACAYPwE0A5NROoUD+vetmg47E+7o3PWxaUcaPUewuAZDOsHPOopIbJFMt
         TxaA==
X-Gm-Message-State: AO0yUKWsAyhfJVKWG5yb/h3xzzMO+Oi0p1N9iTSQrzSoSx7pU3gCw6VY
	ibT3eUsEcfKiVLdvXcBroX+iPw==
X-Google-Smtp-Source: AK7set/MG6zZulkr1z5TBx9S++TinXOiTherZtNLIOIxMrYGlsJS/201poTNHTSHELw/PYIdOC7kDA==
X-Received: by 2002:adf:cd02:0:b0:2c7:f2f:e47 with SMTP id w2-20020adfcd02000000b002c70f2f0e47mr7729534wrm.22.1677750482792;
        Thu, 02 Mar 2023 01:48:02 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id i13-20020adfe48d000000b002c5539171d1sm15027734wrm.41.2023.03.02.01.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:48:02 -0800 (PST)
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 12/24] asm-generic: Remove COMMAND_LINE_SIZE from uapi
Date: Thu,  2 Mar 2023 10:35:27 +0100
Message-Id: <20230302093539.372962-13-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_014804_552559_8167F2FD 
X-CRM114-Status: GOOD (  16.54  )
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.  Since <uapi/asm-generic/setup.h> only
contains COMMAND_LINE_SIZE we can just move it out of uapi to hide the
definition and fix up the only direct use in Loongarch.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Link: https://lore.kernel.org/r/20210423025545.313965-1-palmer@dabbelt.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/admin-guide/kernel-parameters.rst | 2 +-
 arch/loongarch/include/asm/setup.h              | 2 +-
 arch/sh/include/asm/setup.h                     | 2 +-
 include/asm-generic/Kbuild                      | 1 +
 include/{uapi => }/asm-generic/setup.h          | 0
 include/uapi/asm-generic/Kbuild                 | 1 -
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename include/{uapi => }/asm-generic/setup.h (100%)

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index 19600c50277b..2b94d5a42bd6 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -207,7 +207,7 @@ The number of kernel parameters is not limited, but the length of the
 complete command line (parameters including spaces etc.) is limited to
 a fixed number of characters. This limit depends on the architecture
 and is between 256 and 4096 characters. It is defined in the file
-./include/uapi/asm-generic/setup.h as COMMAND_LINE_SIZE.
+./include/asm-generic/setup.h as COMMAND_LINE_SIZE.
 
 Finally, the [KMG] suffix is commonly described after a number of kernel
 parameter values. These 'K', 'M', and 'G' letters represent the _binary_
diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/asm/setup.h
index 72ead58039f3..86c99b183ea0 100644
--- a/arch/loongarch/include/asm/setup.h
+++ b/arch/loongarch/include/asm/setup.h
@@ -7,7 +7,7 @@
 #define _LOONGARCH_SETUP_H
 
 #include <linux/types.h>
-#include <uapi/asm/setup.h>
+#include <asm-generic/setup.h>
 
 #define VECSIZE 0x200
 
diff --git a/arch/sh/include/asm/setup.h b/arch/sh/include/asm/setup.h
index fc807011187f..ae09b1c29fd1 100644
--- a/arch/sh/include/asm/setup.h
+++ b/arch/sh/include/asm/setup.h
@@ -2,7 +2,7 @@
 #ifndef _SH_SETUP_H
 #define _SH_SETUP_H
 
-#include <uapi/asm/setup.h>
+#include <asm-generic/setup.h>
 
 /*
  * This is set up by the setup-routine at boot-time
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 941be574bbe0..0fb55a119f54 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -49,6 +49,7 @@ mandatory-y += preempt.h
 mandatory-y += rwonce.h
 mandatory-y += sections.h
 mandatory-y += serial.h
+mandatory-y += setup.h
 mandatory-y += shmparam.h
 mandatory-y += simd.h
 mandatory-y += softirq_stack.h
diff --git a/include/uapi/asm-generic/setup.h b/include/asm-generic/setup.h
similarity index 100%
rename from include/uapi/asm-generic/setup.h
rename to include/asm-generic/setup.h
diff --git a/include/uapi/asm-generic/Kbuild b/include/uapi/asm-generic/Kbuild
index ebb180aac74e..0e7122339ee9 100644
--- a/include/uapi/asm-generic/Kbuild
+++ b/include/uapi/asm-generic/Kbuild
@@ -20,7 +20,6 @@ mandatory-y += posix_types.h
 mandatory-y += ptrace.h
 mandatory-y += resource.h
 mandatory-y += sembuf.h
-mandatory-y += setup.h
 mandatory-y += shmbuf.h
 mandatory-y += sigcontext.h
 mandatory-y += siginfo.h
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
