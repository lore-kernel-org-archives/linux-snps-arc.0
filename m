Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2409C6379F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 07:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QV2G+XJFnpgRoNVbTS9s5RD2UK4AswUJhVCAf1TZ8NI=; b=kxyThVvsoqKwWo
	NgMulBHW008sK2b8ANLBUne0yl07Y81M+GIFUr4kup1OiR8+v5mx3S5j0tL3Seabz+bZA2OGloPb5
	J2nkCwBpSX6+w93zfA17wnZW626e703+8RfN71vxnIPOSHBBIWdlvEAWFxLJbEjpPcmMMgQiEli9g
	eHTAih9HolTS1igAOnEk76i+Ivy3CvZKjuGgSAdtwlLMq0Ul4yshOa9YVBjeqYB8PQ7QYxSH9nRMZ
	bhOGsyF+mUZrHtb6atw+qcooNVVi+AXlOiA0UaEgPymlNQiKuPZi3zIoe0xuKfKJjr8nbXZLFqJaq
	b6lhI1sBfRq0T2/0mjiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqAj-000Ndp-AC; Tue, 14 Feb 2023 07:56:17 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRq9c-000N5T-0h
	for linux-snps-arc@lists.infradead.org; Tue, 14 Feb 2023 07:55:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so10858548wmb.2
        for <linux-snps-arc@lists.infradead.org>; Mon, 13 Feb 2023 23:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCp2aB0Fva1dhBulyjK6E6ghPwf9RYai26Pkakv2HJU=;
        b=lSkgp/oe78wiSlGjNTY3HqBSi/YUBPzLr91vjToo8n8VXLMMmWxbL1vB3wXAsaCt4y
         hh+WVxCjfWG1PtnDpcOV5pYIh9TVLWXRbZYrdl3IqzhBx1lWrxLZeBMf5PuUuJO5T33F
         VIfE284zT38w5XyjGbfJDN6QAzWZwGklCvYcoYU1xzqSIDFjTJZLDBB+3pXDfWU51cDU
         qtqkBzBgmsJJm/+Hy7xZIElhOnz4tQIVdzGBLLo5NdgkH9aF/SHQQsXAT90Zmb+/8siv
         rlBWKa+b2JZMttF0IXAXICFOmt/kt80eJ35cMpB+KjZ0MJlimlFw8toVGf88cNLSwJd3
         FjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCp2aB0Fva1dhBulyjK6E6ghPwf9RYai26Pkakv2HJU=;
        b=qooKsD2tQPFlqhdGR+Oea5hsOBm2Farkye75dD0zhCRDJZZx9o9XXcfl3Abrgr+oKD
         RTimYJdPOhO/U+xU1/IpcSpJb+b1YVYUNHCljyO1ow9z+9rXkAbnN7nK1W/7L68VFpWd
         kUG/k8p7RjtorLLDtRXjWoMLBa27wCdqcCYPF1y97jfJXGxqT3g9wbPK8xpwGklUeots
         P1OI1H8Hyd474aUehx/fpHSyIPFJWbTQMAgjNENLwtOx36sAIxjuZQ0dRI43DWNG4EV8
         u5cF9TT13gTst0kkgRrELGx5JvGTOYzo22Mck4wm40YDAh4FVUdVReZNtWDJqqzAK+bc
         apJw==
X-Gm-Message-State: AO0yUKVJhz+hOVTEOQmNrDNZHxGLzIocaWHZz0PxhaoX9U2Ii/iilUDg
	FoF41vr2zCU296PzZnkBFn8O0w==
X-Google-Smtp-Source: AK7set/WU71XFeLcjIpIzwCzgenyuB8Ba5kI4Pq7ubVZXIFPYkIqwtjgfBRr8tL2yeTQodjnLYD8uw==
X-Received: by 2002:a05:600c:1656:b0:3da:2500:e702 with SMTP id o22-20020a05600c165600b003da2500e702mr1196663wmn.32.1676361306745;
        Mon, 13 Feb 2023 23:55:06 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id bg30-20020a05600c3c9e00b003db012d49b7sm2076462wmb.2.2023.02.13.23.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 23:55:06 -0800 (PST)
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
Subject: [PATCH v3 05/24] m68k: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 08:49:06 +0100
Message-Id: <20230214074925.228106-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_235508_099739_5F4ACC82 
X-CRM114-Status: GOOD (  12.15  )
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
 arch/m68k/include/asm/setup.h      | 3 +--
 arch/m68k/include/uapi/asm/setup.h | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/setup.h b/arch/m68k/include/asm/setup.h
index 2c99477aaf89..9a256cc3931d 100644
--- a/arch/m68k/include/asm/setup.h
+++ b/arch/m68k/include/asm/setup.h
@@ -23,9 +23,8 @@
 #define _M68K_SETUP_H
 
 #include <uapi/asm/bootinfo.h>
-#include <uapi/asm/setup.h>
-
 
+#define COMMAND_LINE_SIZE 256
 #define CL_SIZE COMMAND_LINE_SIZE
 
 #ifndef __ASSEMBLY__
diff --git a/arch/m68k/include/uapi/asm/setup.h b/arch/m68k/include/uapi/asm/setup.h
index 25fe26d5597c..005593acc7d8 100644
--- a/arch/m68k/include/uapi/asm/setup.h
+++ b/arch/m68k/include/uapi/asm/setup.h
@@ -12,6 +12,4 @@
 #ifndef _UAPI_M68K_SETUP_H
 #define _UAPI_M68K_SETUP_H
 
-#define COMMAND_LINE_SIZE 256
-
 #endif /* _UAPI_M68K_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
