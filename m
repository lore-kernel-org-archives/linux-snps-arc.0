Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074FAC61DA4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 10:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hUbNYaLEkAYUhIcftwrmywJBS3XlStR4me8nf/FWVYM=; b=wtOebmqa4jEgo2
	h76z/KYzUkNX9lzd9GgENouzNuQXy2fzUdL8wi1vonfMx1wUJlyi9s47Tog+09VFTD7HoiEOLdOpO
	/t/3P6+NHj/9x1LYztUtDQMnPhqdSbdixb5vnv96p93hG2+AkxS1yzz5Iu72+CpGLSXRuNKO0C5nx
	ZpqccQcvHcSgHoYhjmv+oygasLp4vWMaXNpCeTZ9xXrDUK7u3mKBLVkSUVM5Erij+cfq6ykWPIJks
	oPn/WwZtVuDADuE0TbpVOyOlnckeQ+hfM1yuDw+mhhoBaHyHdCdIRFtHGVHSxgxbzh71mBDw2DVUX
	AnMgEqtdwIjPaywlzl6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ890-00CKn0-AP; Mon, 06 Mar 2023 10:32:38 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ88s-00CKkn-2s
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 10:32:35 +0000
Received: by mail-wr1-x42e.google.com with SMTP id f11so8246132wrv.8
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 02:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2S29OAojjkQ3ph5THndb/5w5HMdqHkAEAaj92KxD7KY=;
        b=xCSHcSRaD2g1+2DbiYWhwBVgmLp88kCObvoul8o22gAShWEWRsDyBUbrABXr5fv65x
         IGnHDZLJd6mZoZ4c8bkw6btaQ552OPPkQaMMyBEUs4Bc9wvEuBuP3LVKslg1nEKUwpBX
         lIVGb+vuDvhF0cDTuCVOpyZV5LaEa7T8m8jfkVFpaCwFvyN4Z00Y7x/hHmTHM+tY2ap5
         RgDlCHiOuFZ5W2OonNpFKfcm5MsZoArntnS/kOhW3H0fDHSI6TVfGt6dIbQVxoFWUZLC
         VaMyxBHz7iI91g7KCZulrkhxAWoD0odFmgisNlLZZFPdJeVIIAgA47RuWu1Yjzh0KCRf
         0raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2S29OAojjkQ3ph5THndb/5w5HMdqHkAEAaj92KxD7KY=;
        b=j1dW1tWlbAFhJ9hIOvX/Tt345oCHwluUKI9aFVlUj+UzPmLQvVoUJF38hlI8lFFJOz
         llU76V1XICVueBriGgYAcdsD2oqlHnvFW79TJ/mWR/yL2icIXlM9ThrU8xHndYFl5cXc
         j1wcnaCIwAaR3hd8oC+NuCmFlGs7tIyB7KKS7l6UfvwAp+sQSaBcqbe2kTsprJB2QXwZ
         IFbaDaD+49t5KiVSH/lCxyifeGGu9NpeS1Rq3hdQRfuJmmpqIATIp+svxgc92mcoLCFz
         lOeyljvDlyk7yDf5QKbHGqkU/meVVHKPy2CirkgbkcCl7p1JwEUfLxXc7aQuerEgOtab
         aYsQ==
X-Gm-Message-State: AO0yUKVYm5tIMJfD3MUsggtiRxPXcZprUKaOgzbGnUKAb1ZU/6wrvSpU
	wfD8enDoUVFj96AkxdZBo2XE/A==
X-Google-Smtp-Source: AK7set9Vv2uSkjazOq+f3rx/CCBKfCShLhiL1+01KwPuVcwWj2ucc2G1h2TzyZEz/iSKDj7DuGgpzw==
X-Received: by 2002:adf:e70a:0:b0:2c9:e3d:88ca with SMTP id c10-20020adfe70a000000b002c90e3d88camr6289357wrm.67.1678098748535;
        Mon, 06 Mar 2023 02:32:28 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id u18-20020a5d6ad2000000b002c5539171d1sm9217902wrw.41.2023.03.06.02.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:32:28 -0800 (PST)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 26/26] riscv: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:05:08 +0100
Message-Id: <20230306100508.1171812-27-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_023233_937297_47DD0E1E 
X-CRM114-Status: UNSURE (   9.27  )
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

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/uapi/asm/setup.h | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 arch/riscv/include/uapi/asm/setup.h

diff --git a/arch/riscv/include/uapi/asm/setup.h b/arch/riscv/include/uapi/asm/setup.h
deleted file mode 100644
index 17fcecd4a2f8..000000000000
--- a/arch/riscv/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
-
-#ifndef _UAPI_ASM_RISCV_SETUP_H
-#define _UAPI_ASM_RISCV_SETUP_H
-
-#endif /* _UAPI_ASM_RISCV_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
