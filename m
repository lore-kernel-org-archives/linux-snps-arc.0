Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA906C6FA8E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 09:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOaBJf7/IKycuqi5hh9BTx3AWRiq4XhOBhgn/JmaoIw=; b=xRWQKbfS0/DM6u
	A7jBgSbv/FOkbepDop8coxRNTggNZRHhVWiDLyOycR0l9+8aKpEW6K+B3IAWEYcsVeuIyb7s3UhIf
	nQ0xfNUKwsALJEg7ekskIaKKJTTu4E+DMhilJi+j+EZsQJV1XeRheFAtOq5M6o9tOh0pZbE8MIxac
	q2Dhcc8VuBGJyk4Z96wBH+uVMejRfM763swRYgW0g2GIv0YG/oF8Lr1QNnoQUYCkT+6M7S5NZ3Bo9
	7tvLd0EWxb2FTYO1HB2pnYbC7HH01+52YTL06gZgboilPGh2hTY/ly9ZGwYYNWGSHcHkb9laeE2go
	8yeV7zcf4I2zEyl19nEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfVl-001V5A-TP; Thu, 02 Mar 2023 09:46:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfVi-001V2a-LT
	for linux-snps-arc@lists.infradead.org; Thu, 02 Mar 2023 09:46:03 +0000
Received: by mail-wm1-x32c.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso1299040wmb.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 02 Mar 2023 01:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2QJZPzpdHOLfexOQ+hmmrB7dRtnPULpm3pE6FQ2lH4=;
        b=zJ3TbjZTtquT1TamyY4HaRmdHB0ahv+Vtokv3SWblvAbuIUif4QMaBGt/xjCod2Cfm
         +dULCCTWpmrxy8mqlFVQaTuMVp87i5qtBM0ADTdCKDRLlpSCqkhOmH1QctVZ4OLps5BZ
         1s16RPbL7FRy7CIgjm2oI/TY5CELnEmY/x+InB8S3MswEOG0J0Jn9ebnzN1s60yuHonM
         XciWPuP0b1tz0kX9kJUjwCIXEVM6VQUiBKjEhalvsxJmySaJtUl/YC2Tbe8UVp+8v7Wt
         ggqHgr+btYHggfJimXifcnxxkPYeEFCejY+3RDW8YEiUMRME7ZPLzEw9+jOjdHd+RgMU
         P7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2QJZPzpdHOLfexOQ+hmmrB7dRtnPULpm3pE6FQ2lH4=;
        b=a64xFsIMzBQneZTmppQqTIZMvlcVoz5a4FK2UlhgC4KWFHuRsN0Wh7CFcXqwoJkttb
         zY2hkqJibCzj8LXeOMZaAp0n9LvEfW9Uyyx8R4b13ye9o+aJqK87Kr2Wnr9lDod1IqZ6
         t/VQlv1ezFhP3tBOIn8CQGB1p+N8GiHmCjy99uDTjHDdkc9gBCkAEDiCwz3WEgHSd+zk
         S3eD1Zd1N10yVfRJtL0wqowjni7+9GZQmQTnIJ1xjAqu9s/6vf12tmG+ZlOz3oWZRAJs
         inCfRpVTdFLcpen3mfFI2/OxGnRlhPHUs43L3qMTFvLb/860BDIKlQ0wDaeebhdipQOl
         r2rQ==
X-Gm-Message-State: AO0yUKUOiOLOI1Sr4PvkHS3FIQ0LiUMZDDd+3PNj6ilSNAvm/j7QKtik
	maj3L+2cGj/zCCbnTW7CbVU07g==
X-Google-Smtp-Source: AK7set9tt8ELM6mQUqucoLfG4+2zkkeQdoUabomYMcYjwWIMvWpy6ZPc2DVztl7RMEHxCVPROTqqyA==
X-Received: by 2002:a05:600c:35cf:b0:3eb:3104:efec with SMTP id r15-20020a05600c35cf00b003eb3104efecmr7280974wmq.16.1677750359239;
        Thu, 02 Mar 2023 01:45:59 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600c2f8800b003e91b9a92c9sm2391461wmn.24.2023.03.02.01.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:45:58 -0800 (PST)
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
Subject: [PATCH v4 10/24] sparc: Remove COMMAND_LINE_SIZE from uapi
Date: Thu,  2 Mar 2023 10:35:25 +0100
Message-Id: <20230302093539.372962-11-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_014602_727182_69798C79 
X-CRM114-Status: GOOD (  11.81  )
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
 arch/sparc/include/asm/setup.h      | 6 +++++-
 arch/sparc/include/uapi/asm/setup.h | 7 -------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/include/asm/setup.h b/arch/sparc/include/asm/setup.h
index 72205684e51e..d1384ed92547 100644
--- a/arch/sparc/include/asm/setup.h
+++ b/arch/sparc/include/asm/setup.h
@@ -7,7 +7,11 @@
 
 #include <linux/interrupt.h>
 
-#include <uapi/asm/setup.h>
+#if defined(__sparc__) && defined(__arch64__)
+# define COMMAND_LINE_SIZE 2048
+#else
+# define COMMAND_LINE_SIZE 256
+#endif
 
 extern char reboot_command[];
 
diff --git a/arch/sparc/include/uapi/asm/setup.h b/arch/sparc/include/uapi/asm/setup.h
index 3c208a4dd464..c3cf1b0d30b3 100644
--- a/arch/sparc/include/uapi/asm/setup.h
+++ b/arch/sparc/include/uapi/asm/setup.h
@@ -6,11 +6,4 @@
 #ifndef _UAPI_SPARC_SETUP_H
 #define _UAPI_SPARC_SETUP_H
 
-#if defined(__sparc__) && defined(__arch64__)
-# define COMMAND_LINE_SIZE 2048
-#else
-# define COMMAND_LINE_SIZE 256
-#endif
-
-
 #endif /* _UAPI_SPARC_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
