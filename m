Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8B2C61DA4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 08:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrRouZPABW5Kegl4Br3zbKwcTghJHZM0W+A+aLMRpQY=; b=pK4bS2XEMnADfB
	1LauliKcnA5heZUXzwXt0LqcxoikBgMHimOUwk4yVqN7HbrADJhgbpQMRzfuN0df0VHw3vID57UcY
	9mx9EThKe4tq8YWZjwEepcj/3sirsH+Fl6lY/D/XYtLKPG3ILd7/Ugu6WUtFWcgnlmYyuyXqhsA/q
	XqohQlWtAgClbbGxg09C/drbPB58o4MaO/UJFtOPku9pm5Tj5el0ZbRlJVK3qTI1AeTXKHEmpHfE/
	V4NR72YYFF1xnEUUH0R+UAK28uc7uwXCKcjildG9icl3J3KOVn7UXgkzgTz0dQZgtDYaHNfAdr9a9
	N+4d5VU7ccLYZRpAoxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqGe-000QQq-KB; Tue, 14 Feb 2023 08:02:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqGa-000QNn-4a
	for linux-snps-arc@lists.infradead.org; Tue, 14 Feb 2023 08:02:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id he5so2547392wmb.3
        for <linux-snps-arc@lists.infradead.org>; Tue, 14 Feb 2023 00:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHW49K+JXovgrHDB/sHf8iD4ZzCoi5+3r8HKHXzfaII=;
        b=AJLIVkJ8eUjmM1vtOmpYnjiU3h4AqQ2iNs0R4kbWM6WQQBljBu+oDtbGizUYYcUVOQ
         g/q10txiMYyuUgSFDhdFRz20C7yvHsYZv7U09fCLweF6OmlYHiwF3264IXpZij6NQAVh
         9sEmGjYiByQtkKwJYsm9vFUQd02dcXS2T5i9pn4QQ82YMBwRiQFsvPVYGBbRG+K9haZ5
         6dxTJN2iB15zg9MtIJCdQ/La/TuAsDRmVhdRAO0U8pAy7I469OhlQKKXnMXZLIl3WZ8Y
         F1XmlhyIQUCOJJKGmefLr8unKu71GSQSW4lYKCts61iRmMC2lvTg2Elq4G7tHFgsKCmI
         VCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHW49K+JXovgrHDB/sHf8iD4ZzCoi5+3r8HKHXzfaII=;
        b=eBR8NokFB+zZH8JC0V/2KfhyqxLPeG0feFmz4gfGVGkJwQKg5TL3DxVG89OGFxxnfp
         9PUG70vaYyMa42pZxiq9nZN7MhB5ZGqm0jIoRxbaSSW2fUEJ5bQw7hmSSJPPtpQgKiJh
         e0Q/gQlHBT9Ecs7zS2AGITl11IYx2JIInwl3l1/4jC18S4jMm3wIk+levC3m5XBU0ex5
         +ZPHnbqXw6NgjSHtensxfBiqSuPdelYrJeWbdnu8YQ0UqY7m6JXfUUXAcP+rupmA4Cr8
         r+jgjscw2fdhaTNy7DwPM7z0OMLKG1JjA61k/rtEzyuKO2+tjQEqQKZng3zIuR6MkgHx
         PhoA==
X-Gm-Message-State: AO0yUKVbe0LD6Hkv9N/OV4miPuyHahpPzLdZie0+ws7GwAbW1Zz5DHNY
	VMCRjG9vpshST50mjCn9ZRsjGw==
X-Google-Smtp-Source: AK7set/lP4t2l54QM1whCNz2M9ULCfjrcCF8+kGbXDHkFI1+2d2arY1Vl6o/PMv55QSU4AnM8pBqCw==
X-Received: by 2002:a05:600c:13c3:b0:3dc:557f:6126 with SMTP id e3-20020a05600c13c300b003dc557f6126mr1207828wmg.4.1676361738767;
        Tue, 14 Feb 2023 00:02:18 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id z6-20020a1c4c06000000b003d1d5a83b2esm18920663wmf.35.2023.02.14.00.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:02:18 -0800 (PST)
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
Subject: [PATCH v3 12/24] asm-generic: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 08:49:13 +0100
Message-Id: <20230214074925.228106-13-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_000220_218733_67A26F0D 
X-CRM114-Status: GOOD (  16.51  )
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
