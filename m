Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CDFC61DA4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 07:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20negyUzbwzAOPu+S/QB/6S/c1KcuwsG/tp6R/8b3Jc=; b=RS2TT2zwOcjZUt
	BShNDW0PmuJG5xCbur29fxLrTq+RVjdWTkuLwgLEZiecH7p/600zAVOWZZEOBm6u64lO4Be5mewI0
	Q1w5J+soI8lvSzk+Olt7G58E1dg9G5GNDKf99c54OgR7IWECN2zOnGshc659kLnKZxmLYkMm3DIzI
	vIa0zZbR9UizoxGUzE4Mrrfw3JnOsbPxsiw1J+B1OdnoKJ2pPDuhQ2EBtsGeKg3GshU6QNxm1ti3x
	VHuiMxt2grmZKw2McjcWziygayJjDAc3UfMD1qM8ljyRqfw5mJVIU7zBMu/xQz1TGBlKvETVWOL5a
	zG8IwcBO/xDGmRWmMj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRq7p-000MHw-1u; Tue, 14 Feb 2023 07:53:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRq7c-000MCe-KV
	for linux-snps-arc@lists.infradead.org; Tue, 14 Feb 2023 07:53:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id m20-20020a05600c3b1400b003e1e754657aso4576880wms.2
        for <linux-snps-arc@lists.infradead.org>; Mon, 13 Feb 2023 23:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DeOLRVEJw2sfJI9qGhq/0LGJxW9LKFzi0kTd/R8USc=;
        b=6En8tdEtEE2yL3ckaGlXW3X8IQF8Oidpm5CEN86wGeiTSRAoieRepn+r4rC5ddJwkT
         R7z+fNhI1jTwzCKC1qEthBZ7fy0C8HXkbpCrS0h8EKEvU+R1uQHwrcO5/Ir3XPZl0Cxi
         qvQrVaQw2cM+ZrnU7ySm4xsvlyMxy2SCR4WjRYH73U8D5COPFpkQbsk/KyNbZp+52EPE
         pxSn+Zf6U5s/1WbezYC7kxAfU3IlzhAkmUB3ryL/U0YPH8JDn8kDVh/7RVpooyefQALn
         5nTTBqhr5EASjx8oFrM02zf9aUd7huvqzvu7C822aHmXHbhXiBANbSxBOxQ2g99ZQuhx
         NDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DeOLRVEJw2sfJI9qGhq/0LGJxW9LKFzi0kTd/R8USc=;
        b=Hu9iLDK2hJ3HIyLpR13GKD7sgfJh/r21oKx0AaBqD9S+MumcLG8cEFQpN5H57QjMHz
         sPllBWGjDlOUnFjkUNq5BLnYarf5BAoqC/+fA921/evhH6PjaEvxvaVMZ7cuFNGZl5xn
         SWD5VLBoZlCNCNijUUwg5VYcdAc/pMW1Qdt1ERYqUVdgv4SpCSuEIASQ5d93yP+k9wBC
         cK5FEsKOMIWmpz4AGxSWW/LBAcjGLVnwejBchKGdoilWQpIhehub2wJ6F39L+hDlv+2R
         tBHDW1CT2QMshVmX4NCSir95RFhYAO8JEXfhDlwxFyjC1k8CGg/Sm/9m5YQKzkrb+Ru7
         PtXw==
X-Gm-Message-State: AO0yUKVwTynTFVZ/JoUvrCf2YWrax1YkYIejhuiJgPPfbeuItOmZ+s0W
	ePw4jXaQ/UyZ6uSavLj6BHVp0w==
X-Google-Smtp-Source: AK7set98ypC2QKiebUDI9vIcpmaeqJoN5nCZYHjsCTsTkPxxmAu0Y14ja5TgZ/XhdzRBgxqEZEckPA==
X-Received: by 2002:a05:600c:4383:b0:3dc:d5b:5f73 with SMTP id e3-20020a05600c438300b003dc0d5b5f73mr1279751wmn.19.1676361183239;
        Mon, 13 Feb 2023 23:53:03 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id y6-20020a05600c364600b003df7b40f99fsm18631615wmq.11.2023.02.13.23.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 23:53:02 -0800 (PST)
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
Subject: [PATCH v3 03/24] arm: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 08:49:04 +0100
Message-Id: <20230214074925.228106-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_235304_733112_6DDE96AC 
X-CRM114-Status: GOOD (  12.08  )
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
 arch/arm/include/asm/setup.h      | 1 +
 arch/arm/include/uapi/asm/setup.h | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/setup.h b/arch/arm/include/asm/setup.h
index ba0872a8dcda..8a1e4f804d1b 100644
--- a/arch/arm/include/asm/setup.h
+++ b/arch/arm/include/asm/setup.h
@@ -13,6 +13,7 @@
 
 #include <uapi/asm/setup.h>
 
+#define COMMAND_LINE_SIZE 1024
 
 #define __tag __used __section(".taglist.init")
 #define __tagtable(tag, fn) \
diff --git a/arch/arm/include/uapi/asm/setup.h b/arch/arm/include/uapi/asm/setup.h
index 25ceda63b284..87a4f4af28e1 100644
--- a/arch/arm/include/uapi/asm/setup.h
+++ b/arch/arm/include/uapi/asm/setup.h
@@ -17,8 +17,6 @@
 
 #include <linux/types.h>
 
-#define COMMAND_LINE_SIZE 1024
-
 /* The list ends with an ATAG_NONE node. */
 #define ATAG_NONE	0x00000000
 
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
