Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D9CC678D4
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 09:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvJC2s3XxS4OqeybhurIb6W6XOWCukAZHaWwWNTrua8=; b=i5UDo0MCgDuPNc
	LOhc/uI5tOgdeyAzHO+mW1lm9PxeeBt+l9AYjWvM5UVZcEki4/tBcUyyU/D3nuOG/lHi9PdUMKt1o
	4uMM8vQcNQgsVJSuQ2Zlle/VIvOrSf+mEHbozEBLJpEOG4cZwNnzw/8IKMzWnPmTBQtM/lXrUUWxB
	qsg77iDNb017iRkPNHd4E+e+EZ6jjscmPdGLuKEQ3xjURgfVkeb7NCUwRrZAqG6exCrIA4nSSGqZ1
	rpQtDzoPMHAWlYHte6X265gzIYfbN0lDl7KNjDzn6Q2a693l7vMxaQfZ6A+Bl282F8XNBmdzU/iaC
	MR15wbbSQiDccOi4w4bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfht-001ZIS-IY; Thu, 02 Mar 2023 09:58:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfhd-001ZAd-QW
	for linux-snps-arc@lists.infradead.org; Thu, 02 Mar 2023 09:58:23 +0000
Received: by mail-wr1-x431.google.com with SMTP id h14so15919268wru.4
        for <linux-snps-arc@lists.infradead.org>; Thu, 02 Mar 2023 01:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677751100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWpoWTHF+daqxuKXm60VZYbfqB4+Spk5kTFrpLEIhE4=;
        b=GbOzkhHpIeW6q3QAL7eh/145Udusgp0gIBvSMfE+ON43AdeZu/ee7w201pWjLeG957
         Qq6RowkieZ+r7WYxDV4f068I/TnwbRuLBxT7WIxFprPNBY5ETmLUPXT8bUynxL5VSaUV
         PVUZGZk6ER9seRO9uoW7f1L2mApWo7MewdzdL0qcnQpdXHFH3/9ZB2LUy9VpmO3HrtOm
         pZFwuHfUDS0wMlnfUfqj5o1GaX3nlvS+nxi6hyejhckM5q2KO+HBjRFOyHjW/SKZSMU4
         7gpUQh5NelsMLIJiVkw0+WCtWlNbCFujwtZy/wvskJrB7zILzjZi7BblFbcCuFLCBqPv
         Bewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677751100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWpoWTHF+daqxuKXm60VZYbfqB4+Spk5kTFrpLEIhE4=;
        b=OGXxEgYNH2WR2qIaSivrBs9NHcqUzVhaFluZK0osH2KNKO9zbztZxGCx9nFH6fbaLN
         U2O+O1iY0GtvlQNInyQZDiEYK3A/6JBaVuoe8zLOQQRznCSNQpJTQdFVnfBbM+oUMWVr
         4S6ZwKRQYoSksAQ57K0kYZaxu/1JbmJ2vtF2tCeF4EOAg42kMcX2r4ZCZ3er4/YXRuNe
         u9JIpta2GvRm6sNY02fJtdngUqs7ZPd0MmmBkl6tlJXMv+ZKlbwnWv+DGKAr8OPQOvHt
         OWnShThQyCCRIQMjdYg/7+8bcFARxqGyz5vbyHh0hRV4cJeXHq76hlfJ08Nl/WNMlYQt
         BYsA==
X-Gm-Message-State: AO0yUKWiBwO8n2pcHLt1zJSP1XmIWwW/8P4QBXXAHNBb2E2WbSMz9C88
	v4cVqectEiIoM/atvEktJIPCAw==
X-Google-Smtp-Source: AK7set/HXPU9Bp6RN1ljNqKlOOYPCzZVkHLiMhzV0VzI+tVIVoliI9/U3d28g8WZmzzIQccODQQ95w==
X-Received: by 2002:adf:e490:0:b0:2c5:c71:4a84 with SMTP id i16-20020adfe490000000b002c50c714a84mr7272840wrm.68.1677751100153;
        Thu, 02 Mar 2023 01:58:20 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c458800b003df5be8987esm2546772wmo.20.2023.03.02.01.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:58:19 -0800 (PST)
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
Subject: [PATCH v4 22/24] powerpc: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:37 +0100
Message-Id: <20230302093539.372962-23-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_015821_904775_0D8E247D 
X-CRM114-Status: UNSURE (   9.85  )
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
 arch/powerpc/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/powerpc/include/uapi/asm/setup.h

diff --git a/arch/powerpc/include/uapi/asm/setup.h b/arch/powerpc/include/uapi/asm/setup.h
deleted file mode 100644
index f2ca747aa45b..000000000000
--- a/arch/powerpc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI_ASM_POWERPC_SETUP_H
-#define _UAPI_ASM_POWERPC_SETUP_H
-
-#endif /* _UAPI_ASM_POWERPC_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
