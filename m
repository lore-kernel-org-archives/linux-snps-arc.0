Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1D1C6FD1C
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 10:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNQ69xhb855i0fD3GUVpraU/M9XJJaIRRH4O/Jecb94=; b=ppoxi8oEQ+EXvR
	NVFtc/JNWm7MBZ5cwL9UmgL+6rjOabPdmEkjeLTbomIz/di1iufkOKneCZ3MtfUTDgCJBCtnb9eyp
	Sk/WyK9ofnxTkyTlAiGbMcSp6lgxWZDFR/CVfd1Omucy6i/bp0sAIUvtRTF6BEwW76VrQ882mReeG
	lZHbZlvryxndMXiCNGAd3Zi6d6NJrjzNX4wOf/xEpBrwQQdIHtu4gITuiv+ihu5m7/Sl/FzSUj+s5
	Y5rvK7ZS8OPkqtA+rA8Cn6P+LJqY8x4it/YB+GOdk6ZA7ZzJ70N1jJzX+XQzBa8c82gBu7q054VKP
	y70yiX8X/57LX4/zFeaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7z0-00CI1g-T5; Mon, 06 Mar 2023 10:22:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7yv-00CHzS-6w
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 10:22:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id j2so8204540wrh.9
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 02:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llD45vs7BruCqN5Y6LuJ+UdeA+HWMt5VLzqATcaeE3k=;
        b=biuy33Bk2mI4ZMPBuWVd+4iS4s3Hh5qbYt3PjTBlB6xKI3sqAN5/opSaH9Oq2FmLAj
         /Bo+b8SV5ooGWiS/kzLE0AatJKaQQSoDImYsefz7b5oTictITyDKaFbdGHBUaody+kOH
         Ho+ScOf9SGVsXyGS2CWJ2O+ezbS15TOBFh0MVgeTIcv93OFa65f4TG47OPXCTq07neAH
         pPqPantWl3phD1rMQq2bMLpZlFMj7b6XLHIEPyAtb+PjzcONbalR8XfGBJufSVux/cwv
         g/BzVUJlLgeJU7a7nSXyp6X1Dt0ohhIr8wGSwVkMa3b1H78/mrfIdl7RcOsLKEIpuH99
         9WQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llD45vs7BruCqN5Y6LuJ+UdeA+HWMt5VLzqATcaeE3k=;
        b=N57GqM0YQF+VY6dY5q4y8HeDdlPVxj4GRd3IwVMHR+Qs6Y1u9T67Jreu5Ok8gxtddT
         rSMuFJ80D50dROECd3Oo5EFnYCWnLLzfpCeFav1RtMzKvSNXPeASY49BMdIVXgLxKQod
         D+U4NX+6Khae3doYtKQB56LMLj2UGvA9HuxWC6mq5pm7TNJFI6oQTGdoNpAiCF4pJvtP
         5FY4WOaWobfOqGu5KZSlXrvCZv/MqnLyl/6B6/HhixcJhbZ4zP4SgueJLlp8uZsTjQII
         yRGJM31ZBmj94W1MseCzDHaLafrjDpuRmPnq3e8HoaOA92D4wKkQNaY9LlNgrFyTTXJP
         uQPg==
X-Gm-Message-State: AO0yUKUBmkt3J8tmSg32w33bUELXGiBhzL8b/xkKIj9WZFvJWgXz/AbD
	et1F36qfXmvArkPTgNMseaylrQ==
X-Google-Smtp-Source: AK7set9CKdAXw9zT5b2S7XFTgcEiN4kPjtcCTBiE006KHZWMAQkWVtXBrm+fHU347RB7cSb9V0evYw==
X-Received: by 2002:a5d:46c8:0:b0:2c7:df1:a09d with SMTP id g8-20020a5d46c8000000b002c70df1a09dmr6147537wrs.4.1678098131430;
        Mon, 06 Mar 2023 02:22:11 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id h18-20020a5d4312000000b002c7107ce17fsm9587322wrq.3.2023.03.06.02.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:22:11 -0800 (PST)
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
Subject: [PATCH v5 16/26] m68k: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:04:58 +0100
Message-Id: <20230306100508.1171812-17-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_022213_336439_25DF5C5B 
X-CRM114-Status: GOOD (  10.52  )
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
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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
