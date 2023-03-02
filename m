Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B57C678D4
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 09:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rp8Gyvrq5YqnqR8bE+HXAZBVh+g3Plzfw4e1dsyZE+k=; b=ewgYOtGliQ6YRt
	5HZXzLfj7lliLesNqBNjTybEzh2lq5Vh2sp/k26thKmsoS4cLIgh8Yq9udY9TVQGBoaPFxwtWgjN/
	gH5didgSxYXRT5Dq1nVvHL4ivN4zaJjckUSS9h4rVI4EakPmBcUiN1I7q4pS6gxcB1GOBr5zsMpvf
	UtGj+T+TGZCEjdcPajVWIlYp3oy9t/n7sODhkd/ygI8ExarEjXBTVqwLHUQlBkqhJ/aWWZBwnQIPv
	FJVY5swYvcUxDUuZrDQDHsJ931fmhMzZIAZCpPt0vmcQ6aaySxb7keWLFcAndMsj0DfKPI8B3wf2o
	/bjT+icroofM1LWiI5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfOr-001ST5-Cu; Thu, 02 Mar 2023 09:38:57 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfOl-001SOj-Qt
	for linux-snps-arc@lists.infradead.org; Thu, 02 Mar 2023 09:38:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id o38-20020a05600c512600b003e8320d1c11so1742469wms.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 02 Mar 2023 01:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677749927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2urgpMO2KVxl6lplPPVxnOzeLpIAncQaLe3J6thpyW4=;
        b=PIQBVis/eCZwrjnEm3UchoPAwrLAxQo8LeBswck20022oG1kRdlDV/slA4zZyYTNe8
         heys8AwaMW0d2H39RYAdasZSaYwfxS9ZsI4rI8ysRKgEN+Qlw5akvxEGyZBxK3ZToJa5
         C/ow6qrB9k8PM2BQ3LcXjU3gNu9Xrzf9K0AgVkXKHE7VxTRCjPl4cHxq2DN23F5p91Jd
         jfZBNgeeX6rbxglOe4yiBaiE5O9KT3GvEJjC2T+Jkba3USz5B6rwc/jBwSq1y7pgHmYU
         tRwBfE1Fiy9t9YtdNqaRXN7+EPus5Le4eU8S+S5DBThh4HLY1wDC6UZNa9X47ZqF8ceK
         THMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677749927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2urgpMO2KVxl6lplPPVxnOzeLpIAncQaLe3J6thpyW4=;
        b=hZw2ONn7b4+A3R6Gxn+DgY/6tlhHGqrgUAA8u3NDJmfpiNjp5jOPMlB5HtGPdEhhp+
         TtXZ7tJMYopxZueoGsytgyjXCh08fYfEkoGw1pejKDKSZSdplvX9fR2R/QM1uOChHP5J
         CDsPxkiNH6TcvMPkdqauUHwOtqDEL+TxYuYnk0QSJzaQDkLPamgGaQ4xImc4kEwS2n9m
         CZXHUY0EK9uh019yw6Zb07WCYsafurDIcIKsNvkcskm+L/9YHIfO4f2R5r/+LGV1VWoj
         ZQaeXnQv2mEUmU7/jRv+XOV2p1qO91WdWoIb8+EpgvXu7XQqsp89PFPbDmTERGPPHxcH
         QWFw==
X-Gm-Message-State: AO0yUKX25bPRrx14S0LdES1cJALxuewoX3/V4PiqqBjcTuxtnQxUdM9Z
	SR7q9dNzBHUJOoDocTcHBW/Siw==
X-Google-Smtp-Source: AK7set8oHbNygBzt6W0addU+vytnwYPbfGJKv/ey/v/+peloy8qf6kGz0Nh2z+vcesYMnit2/ORc3g==
X-Received: by 2002:a05:600c:1c8e:b0:3ea:f873:13aa with SMTP id k14-20020a05600c1c8e00b003eaf87313aamr8083072wms.40.1677749927246;
        Thu, 02 Mar 2023 01:38:47 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l35-20020a05600c1d2300b003e6dcd562a6sm2554811wms.28.2023.03.02.01.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:38:46 -0800 (PST)
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
Subject: [PATCH v4 03/24] arm: Remove COMMAND_LINE_SIZE from uapi
Date: Thu,  2 Mar 2023 10:35:18 +0100
Message-Id: <20230302093539.372962-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_013851_929042_59AB19A2 
X-CRM114-Status: GOOD (  12.26  )
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
Reviewed-by: Russell King (Oracle) <linux@armlinux.org.uk>
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
