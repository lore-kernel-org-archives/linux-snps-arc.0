Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50AAC678D4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4vR/qEo9SIjdvmC8cM+s93LDTERybeq65Sl5MsRYdFM=; b=cgm/jCBiHD1uCs
	Y7rHgwl3D4TpWEPNiAToJvTTmSttCEsYqPSGKre3mJ617p0K/TdR7FNBGMStOprG/SyruDfeNFD9r
	57ktknkWOCOao/VP/npJX3L6T5z9ni90nWl1c7swlGTQ+F4TiYbNFVonHCVe01sRxuY1iAFzLgJx9
	eomFiUOPR/Wmd94z8YwYlTgyHsMKhKawB5sTmjrIEEFOCcxwdCce0JSk3e+sXGUjoJqyUiZQmy5hi
	aLUDeumH0maSE/hd5FBmii8NOEZeypI6whwmJA/wNIOufKt8gndFPv8tKgLOKGRWBBCuyLgHR/0yr
	ovwRqeJbl82D6lj0DPVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7wz-00CHZi-HV; Mon, 06 Mar 2023 10:20:13 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7wv-00CHXC-Po
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 10:20:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id q16so8227336wrw.2
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 02:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNfVXtm0Wz6Lcu14/VeJhPZvzJHmN/UTN+NdnetUsrI=;
        b=zEKMo006Xbug/aXmguPAFx+8GznNpbMFgiuyvBxm1/vVdhqNwuHJrYXWA7JTvtzE5c
         AIYiprni3pevhXYqTTlmoHq05GH3D1+hmikQ7K/gHy5bHLLM/FFKho9jTwKfpy1OtWhm
         7/rZv8lo40Y4YU1QIp41cEQntf2rrS65grgYMLBZqCIf6NowqCfX+okjOVG5JIJlBtW0
         zgJr+1mdxls28jOQYn94NNEjL4OdDAQTZH03VRn+jNxOHMw4L3sPNJZSZWJKXwyW3chG
         dOKgWZ4u5Agmu+Ser3XwVB0mKYFws0BtfawUKa7HDlKv+oDARrjJzr0Hbs8yzxzAi/Rx
         g76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNfVXtm0Wz6Lcu14/VeJhPZvzJHmN/UTN+NdnetUsrI=;
        b=R/p8TwNdgKa70hm4gTJHQ3Cwe0Ty9xslKHsn/DJ8zuUL1NhmOKblzsr6et5aqpkgwa
         uwg/lwlrIJzUdEv8rwrNKw+Ibz/DjltJPifE3GfWcTQ7YkDsU4R/Aa/azgf3j3oOQ9J5
         lOu36FnPkidQSVkAlen8MH1dkHnBvhvzA9KxgHn9ENRC4cCycn9temBPC4LnRW3SoymT
         69/Zqq3ruyxAOhA0MwxlPoQg5CrJn0ERJAcCMxFwKwQzCba2AFlv9g0FdXkB8wMNQoXk
         yNWPZhhu7vfNBImT+Eq0eAKtRNq3TVfAD+/VtzLoub6pfyxJ5Vd2yIM2bUZks/OanXjQ
         yvhg==
X-Gm-Message-State: AO0yUKUq7W8tD9OBYVSPgD2YVUA4F2XjBqgswfErV+Ge7Nm0PNf5PqtZ
	Gl3AR73XhZwtuRAHoShUl/iF5w==
X-Google-Smtp-Source: AK7set+9yKsGBjI5CL2QxsviWWD6moVJ7ZpcNzljpaDW2ezgs/yExN4XMfzrZyyrCguP/BvDK6xUaw==
X-Received: by 2002:a5d:52cc:0:b0:2ca:2794:87e8 with SMTP id r12-20020a5d52cc000000b002ca279487e8mr6328197wrv.21.1678098008018;
        Mon, 06 Mar 2023 02:20:08 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id a13-20020a5d508d000000b002c54536c662sm9634322wrt.34.2023.03.06.02.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:20:07 -0800 (PST)
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
Subject: [PATCH v5 14/26] alpha: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:04:56 +0100
Message-Id: <20230306100508.1171812-15-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_022009_864557_FAC91E5B 
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
 arch/alpha/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/alpha/include/uapi/asm/setup.h

diff --git a/arch/alpha/include/uapi/asm/setup.h b/arch/alpha/include/uapi/asm/setup.h
deleted file mode 100644
index 9b3b5ba39b1d..000000000000
--- a/arch/alpha/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI__ALPHA_SETUP_H
-#define _UAPI__ALPHA_SETUP_H
-
-#endif /* _UAPI__ALPHA_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
