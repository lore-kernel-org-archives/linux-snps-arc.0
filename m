Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A2FC61DA4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 10:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8R/49gWnbr065pES26STkaw2xhZD5VhTteRCkGQOhE=; b=o+jkKiZIUKW9Bd
	t3SVqrGjCBbkhpNxa+Z0yIcAjibQPP2Xl9j6ZPpHnpU1m0YJhhhvx8bH2niZP1vZKr0IWuCacFvmM
	sMvsy9BvU/yEaR9C2ads7YheVVcXYFTl6k+fneVbLbIlswlK9jnkCMvncBkgGxRr5n6WnYT9oH7U4
	bfPgWt4i3KyMKOH4pOgWAdnkQkk2KuWI+lYcWxmigHNi+63oLqr/4oyJKQo5UkUTVeO9LaX35Nms9
	FbXiN0JnrOOvwrKsu5NtDRwPJfARsHLyi592a0rsSBeBFbN9zjGO4lCJjKXNc0DoB6wwuTfg2PTGJ
	LwiLrbtnrZUXr3f57e+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ86x-00CKBe-9V; Mon, 06 Mar 2023 10:30:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ86t-00CK9F-F7
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 10:30:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id p16so5276086wmq.5
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 02:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXAvkdr/KDgKti1Qk0fGZtxrB/HUuKAsHe829QuSuFY=;
        b=pgS35aCdmrPQvRmz+iyfEoK2FRpACPPCY0MT6mFvJKkIUhbtwnSzkh1nDZ4dLg4N66
         6ZVDArxRLTZLYfBKXHPjVVXFk3ykL/Ll+SunOskkjFEC44CCkzVmJzYhiA/SpJcgPsXD
         iaxTAEzNvivOqXbfNob2LDlmKw0ZcaqlzVRuIFVk8cR0s+FUBB5x+NoBb99m7FdgTTah
         vZAnZAMHkL7V18QXzPHaCpzGGQWELRiT2WyIpZNXSgzp7qcnCjdjYhSVinAF3g/DsyXX
         44dOQ7eQm940d/z5SFQ+4xJwQrGMZMea8UaCvouMgKgVikT1M0ZwEubwwnmdMLP5t9Zo
         iu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXAvkdr/KDgKti1Qk0fGZtxrB/HUuKAsHe829QuSuFY=;
        b=lu94Kbvvg36D1HxEXgoRgg+4QA4YEOLOxwU06wuvxwKIg+jomv4dbQr1K29c/ZXit7
         Z5agFfZz7BlJT0TH0Sy8dVqo4ZkesFsF6NankcyMHlXzovZZGw1Js8qOSzEpKsEmGCFa
         OVrDynGQEltrX+EF8ftXDvAjudeQURZhNa4Wjq5faZ0fOvGHB4xMfNsrnuDG7zWZB4vP
         uRQFeUn6G1LxZPWUtSj+TjotvwtPbTyT5/TG73NHYfeiDUCVKt1ECC/KuAcEcZZYi1HJ
         pax2qdf4G85yVQFrROLGEIMyOUvO70KsR7ms3jgeQGIrariXeoGtwuDO5DmaJX+uGmG7
         USPA==
X-Gm-Message-State: AO0yUKW+QjzHIJ3ZjxctcqNWkYfVz7KnpLFoRvpUikFQ8NbPn9Jt/TOB
	OxCjFYXbVXWcI4YZOPKPWpRyMA==
X-Google-Smtp-Source: AK7set9mPKitCfuwffMa4942mc5rcJfQ8KgUB3nP8TvnUmyeh9L6WaWHYflu+MFIUn26b3DlN/zC2w==
X-Received: by 2002:a05:600c:4ece:b0:3de:d52:2cd2 with SMTP id g14-20020a05600c4ece00b003de0d522cd2mr9065487wmq.4.1678098625091;
        Mon, 06 Mar 2023 02:30:25 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id y33-20020a05600c342100b003e21f20b646sm9913265wmp.21.2023.03.06.02.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:30:24 -0800 (PST)
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
Subject: [PATCH v5 24/26] mips: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:05:06 +0100
Message-Id: <20230306100508.1171812-25-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_023027_532011_B1F64B5C 
X-CRM114-Status: UNSURE (   9.78  )
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
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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
