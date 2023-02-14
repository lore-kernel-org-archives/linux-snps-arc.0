Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B431EC05027
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 07:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hEO9XBCzNud5/OsPvgg2OOxbZWG73cZKDpHBAloxe10=; b=Lz/CyUr0BNQ/T2
	vEBa6a1ZS2PV/o8QHVwa3iqNBB3h3A4zKoc5nM8FIVeBrxcLDhOwwQ/HwAW64qp5jX/wwNvZ/5QCa
	qACzUubh3iPzYh+a8SB0coJaZJX8UbpU+KMCfHC1pl2EQ8/M4mZk4lYgBUvqAYCewX6ioLS/fDXoR
	y5LfrdpIGoR04fttrvb4/oFuqtfNyiPZWCAabnhJeAWHJY/L6+N1C9WFOWmMJHHp9ULJ81mQ3vuFB
	DteK2YRJZOwDsiXA1MWJJbnyAwQCjRnihPJKC5jIP6tZtzsQjJq15agC1Rn/3zpk04G16GuZ0jraw
	pUko+X0hsZMjNqB4KBqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqCk-000OkA-PI; Tue, 14 Feb 2023 07:58:22 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqCb-000Of8-4a
	for linux-snps-arc@lists.infradead.org; Tue, 14 Feb 2023 07:58:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id g6-20020a05600c310600b003e1f6dff952so379295wmo.1
        for <linux-snps-arc@lists.infradead.org>; Mon, 13 Feb 2023 23:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKtnovAK57aTUQkxGFuVdZUCgYZPh93HJz6h/9KVrck=;
        b=y2SxFP6uVSLNYz9fZvs3Zs4vhw4emYUflONQjIooXwDO5X6gb+wppeyUmN2kbvXFp3
         gFadUXn2Cp6yqNx9BDGh77dMz5r+vX2Kj22jLhvWxa606s5pKuk33OrVMfmVGTSXH4Iw
         +LoFIHTgDRFHVjoYg4ixCY3aHm67ODUPGfSc9P9eN6uKI9PTm52qHExgYzYPLnSr9J/q
         tLNh+jZRCj6qrjKQvcjjvtKRt0/4/7bcAVMQ2ZOu61x7gveXSgs6wqdmp6NeNPWHUIIE
         PPfyUfT5XwF4q0oq7T93YCkNxcwDBU0oXmgdg4Z+7bvc1OIW0EXOQFT6P/48RtxnrGAp
         ooug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKtnovAK57aTUQkxGFuVdZUCgYZPh93HJz6h/9KVrck=;
        b=EUmVowJB/hH2FlblK7vUGZvUKGaaGPk+fUdeLuIz+vc7kg7wYdMv5HwnqJkond4CdR
         FwNXse+uLqkOYai4EGgADhK+S6R5nT1mnGmf+69rI3ghpWMnS805R8Yev/PAKJ1VHjrv
         cgleVrj2QqaAoCCpo0m1mYsu1WbldbqKbMYfAQEJueFJgEiPmU9wopZ34dP0D0tgCsET
         R0+28hMr4KwuEzODFLDCBB9AhO0V2RosE0ijS7sgOvMFkrgIriy+RgcYzL3I5hp7zAh7
         9OTNr3e3sPh40PQhSGsYq9CaMtQ32X42rSzw2syIiq7TKkCENoU62nPEGbN09lN4cjc7
         Jvwg==
X-Gm-Message-State: AO0yUKVUVPkk9qPW2d98wWBI1vTCdTaewR21pQXBeoRcvmVX4qqVYISz
	r0O10BBox2Wh5FiZahCqDf/mng==
X-Google-Smtp-Source: AK7set+dWzDjRt2XvGeZUMudd7QPyQQYQ9E3bJKbYtGRe7QDJdJALnxrxn/uZt6awC+8BUYrg5x21w==
X-Received: by 2002:a05:600c:908:b0:3dd:e86e:8805 with SMTP id m8-20020a05600c090800b003dde86e8805mr1103960wmp.5.1676361491858;
        Mon, 13 Feb 2023 23:58:11 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id l40-20020a05600c1d2800b003dd1b00bd9asm17999041wms.32.2023.02.13.23.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 23:58:11 -0800 (PST)
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
Subject: [PATCH v3 08/24] parisc: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 08:49:09 +0100
Message-Id: <20230214074925.228106-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_235813_233081_63972C92 
X-CRM114-Status: GOOD (  14.83  )
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
 arch/parisc/include/asm/setup.h      | 7 +++++++
 arch/parisc/include/uapi/asm/setup.h | 2 --
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 arch/parisc/include/asm/setup.h

diff --git a/arch/parisc/include/asm/setup.h b/arch/parisc/include/asm/setup.h
new file mode 100644
index 000000000000..78b2f4ec7d65
--- /dev/null
+++ b/arch/parisc/include/asm/setup.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _PARISC_SETUP_H
+#define _PARISC_SETUP_H
+
+#define COMMAND_LINE_SIZE	1024
+
+#endif /* _PARISC_SETUP_H */
diff --git a/arch/parisc/include/uapi/asm/setup.h b/arch/parisc/include/uapi/asm/setup.h
index 78b2f4ec7d65..bfad89428e47 100644
--- a/arch/parisc/include/uapi/asm/setup.h
+++ b/arch/parisc/include/uapi/asm/setup.h
@@ -2,6 +2,4 @@
 #ifndef _PARISC_SETUP_H
 #define _PARISC_SETUP_H
 
-#define COMMAND_LINE_SIZE	1024
-
 #endif /* _PARISC_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
