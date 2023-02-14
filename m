Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DA3C61DA4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 08:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hddgEfy9qLe56gLXgIW0BBcFe9RZgvDOnDCWnkL4yeQ=; b=tv5E9hMz59Jcvp
	bxRWoCQ2kv4bLt3e9GQ4AfCBdVvY1rSlQfctxjqui4M3Y03p/R095I6HkfR8nRYskuMBpCWpR32pw
	VF473I/7Oth79YYpWIlmN6P4hon6Hlcmxw0Sp1FuOPRMIzMsRA4BxXu7DIt5LbdVs6Ait/7cr2gqs
	ITEFFj+hLWBvJCdHG6QfKvbUTMCuMgtFgXpoTPW7tK6g0zNR34YsvBPTWF26Ze6j4BVi9BIR85K6P
	0VJr5fPDhaZ2kcIJjmUkLofVi3HatEVYCSGZLFrpCpjxik7nvrYmQAGFEds9aZKWaTK6Nt7ccp2fz
	F/gHg3J+wjwmWxhDzidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqRi-000UiS-0x; Tue, 14 Feb 2023 08:13:50 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqRe-000Ufb-Gh
	for linux-snps-arc@lists.infradead.org; Tue, 14 Feb 2023 08:13:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id k3so7101413wrv.5
        for <linux-snps-arc@lists.infradead.org>; Tue, 14 Feb 2023 00:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILvb9GZC9A1qdpzGm/54DVnwfbD0aC1FwyW+Sl0y38Q=;
        b=HtbuTMWUF2tj2aKTYK1yNsXduQ6APGdApj66NPfUkn3SC1NZ+4Oj58Zu/Ak7xQrox+
         8z5zWPuoQ5ax0ycvOIVDpPnca+IG5KAq9Xk8oRbw41qynenX8g1tvQQT5r4rKvCOaojV
         jPfso1gpqC7Z2cfUbExhYvaj/RucrDNjdGgvnx2nHDhZua6x3HRkpIYUHnc/zza6sfUC
         kBPr9thCBTCgRAhVcgvpLCi6AD2EkW7fcTsz6LD5+HaDqVwqa5sXnGFVtGPo6t/a8U6I
         Q2odZ240T2bFaiqA//nkU3FLd617ZdCB0HnDd7oQI/LmDmHhFW14L+tmEZwlUNudYQxs
         bOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILvb9GZC9A1qdpzGm/54DVnwfbD0aC1FwyW+Sl0y38Q=;
        b=I2rqJNC1C7Ew7hjaUzoHobgxcd+MwvF5AAhvKlZoVz8IK/xCRX73FNXjpkxGHemOu/
         vrJz4u6gsJi0kf/TqpLVl61Vu/qVb7ym5PlC/oAfJ6aJhn3eHwmY+uMG1TPgYUbNPdyY
         AMdj+v4z+vtWmRTFNfud+zxRoIr9yKPTIYf7ngFn8xMcjPBGdaaNofaX/qSzlrxTXek6
         jdaZhurSjUHcaWZE63iwdFC+KED7FbzlS+GiJangU32rrCzLNpNIT7n2+6Q73Pwi+iF2
         ELRGMqI9gqeWw7dssSz196a7M3j10BeqNdOlF3QuVzVNPcrxcx5xhx8gmAUH5UUFx9eZ
         N7oA==
X-Gm-Message-State: AO0yUKV9d8CQedvf8nonvlyWhKBytOpV5++Qz3JNx+EZbDHldEjjl8hR
	XsZsNPhGjw6qLOn8GC8Y73L+Yw==
X-Google-Smtp-Source: AK7set8Xvkgv0Fg7/M7LlqjhmFeN/2ODZt/2XmlHUFLIKmovZq5e0GuKsxxn5/ZWllMjfmn+05RkGQ==
X-Received: by 2002:adf:f741:0:b0:2c4:872:e929 with SMTP id z1-20020adff741000000b002c40872e929mr1193948wrp.16.1676362425183;
        Tue, 14 Feb 2023 00:13:45 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002c55306f6edsm6397757wrv.54.2023.02.14.00.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:13:44 -0800 (PST)
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
Subject: [PATCH v3 23/24] mips: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:24 +0100
Message-Id: <20230214074925.228106-24-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_001346_584634_5502581B 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
 arch/mips/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/mips/include/uapi/asm/setup.h

diff --git a/arch/mips/include/uapi/asm/setup.h b/arch/mips/include/uapi/asm/setup.h
deleted file mode 100644
index 157c3c392fb4..000000000000
--- a/arch/mips/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI_MIPS_SETUP_H
-#define _UAPI_MIPS_SETUP_H
-
-#endif /* _UAPI_MIPS_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
