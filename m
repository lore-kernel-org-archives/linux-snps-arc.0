Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC2BC678D4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 10:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/kKqpPmZ3OF5Tr/XFV2ZaNpDkTW4ZnNmT8yKDLk/SeE=; b=UMcvwHXvee5vMy
	rWsqznpOt3Sk3VkULI/gjz8/mNTmvqkriyd/QOt/C/iSe9OyiYp/apk+sCK6zKMGgu0QSty4WXMFt
	U5xg56bo/N9f3lx0kO2YANlD7k0zTwWpWEVx2DpVjL1Vib17DVRwp5C1AUYbtM2bDch25GZ1sFLwi
	zxUti66OnlvjlMV/C4OxK7lUsf0DaLNRrzCvrxW54A4iohFK2bxg52mn70DzvO18A6044h8ecAZtC
	RnLMZit2Gq/vFhr17fcvBuhtJpJURUIiYk33JtBl4VI3ulHzoALbFyAV7mlxCMdM0XFmy0HfMjgCr
	SCZ2wLkY2r9p6ZMYGGKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ81y-00CIsU-Fc; Mon, 06 Mar 2023 10:25:22 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ81u-00CIoq-ON
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 10:25:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id h14so8238696wru.4
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 02:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+ybm5kRJ/yopWCa5U60FTtFVB//Mx8KShs1YeyPeDk=;
        b=VlycwB8hzOW9PVDwiHzu8l5k/quntXrG5VLkAdaIUu+/LZCsC62+PMUXQUNH66i4Un
         YUr9PSMjdim9JJVp0F/a2lCvx6Dfm4lHivR6dyGvTchP3bcl02II04OrcXPhLuJXC68I
         hFAZ56aFTu0sT4cOr9/aG7bDGWiPIOGa3i+I9TDtD57f0bhZLgiK9s6H6nPMJNIirSh5
         3L9OPB/FnM19Y8dZkKeKnuXREhgl6zSf/NqYvjRKKbFiXLNRab21fQ3koK19T+QK7UeG
         tKqz6Lyq6ZoOeVSc9TkrOeWO2POmCSVfI6pjP0fJ1mCCRpUfByX5yb5R9ss+54U+8PpK
         AG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+ybm5kRJ/yopWCa5U60FTtFVB//Mx8KShs1YeyPeDk=;
        b=ivl/2+IbbnqNM16eeDiceNl41NNKkTS5LHpfAzSR+kTdQwEVxO4iM4K8usuTKAumpc
         UWx8xxy9MEpiOV8dIOIgtPVPVq2fs55kYVO5AR64gBFxVU4HZe2qpeWIX16Nwm5mflqA
         ViFN/nzxnbYM6e5AQkadS/kb5sZPwkClF2YSOuaaw5TALXqLMsG7ndjob+elAQ35p7Qf
         xTobCzYyMrsVExiLNPIe9cPhKigcRUHS9qRBN/91GQparK8CJK5g4i4z7hnA0Ti8Ax4c
         rPQG8KsKtvL50u1xuBsDu5Rb0G4AI6cKfFlxFWrvPGC0oiE+OyZ1bRFHP6XHRp+3aNEk
         AOGg==
X-Gm-Message-State: AO0yUKX0RVrxeO88OIp7eDHgHzR74K6o7a9iB+4x+AD3hE1YKlZW4FcW
	9sqSgImsUsBrxYAsIHEe/watcA==
X-Google-Smtp-Source: AK7set94cTKKb7k88vdudKOJ64sJrcPXn8BrGA9ye0HB30JkyjiZxJZV4O6iTHRJH43XJ6BrpN1Yyw==
X-Received: by 2002:adf:e887:0:b0:2ca:67bb:11ba with SMTP id d7-20020adfe887000000b002ca67bb11bamr6856201wrm.34.1678098316456;
        Mon, 06 Mar 2023 02:25:16 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id c10-20020a05600c170a00b003db0bb81b6asm9613294wmn.1.2023.03.06.02.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:25:16 -0800 (PST)
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
Subject: [PATCH v5 19/26] sparc: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:05:01 +0100
Message-Id: <20230306100508.1171812-20-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_022518_806218_B19F9041 
X-CRM114-Status: UNSURE (   9.67  )
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
 arch/sparc/include/uapi/asm/setup.h | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 arch/sparc/include/uapi/asm/setup.h

diff --git a/arch/sparc/include/uapi/asm/setup.h b/arch/sparc/include/uapi/asm/setup.h
deleted file mode 100644
index c3cf1b0d30b3..000000000000
--- a/arch/sparc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- *	Just a place holder. 
- */
-
-#ifndef _UAPI_SPARC_SETUP_H
-#define _UAPI_SPARC_SETUP_H
-
-#endif /* _UAPI_SPARC_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
