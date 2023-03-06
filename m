Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA56C678D4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 10:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08/mv7KahXPHG8kXF1vxe0eTsrgCoAaCcn340c/6VA4=; b=3OsPvv5eE9rON8
	9uN1VKbUpROAV7OyAjXtwuLvGvdYUIJkTkQQUit3RyhJLlfWFC514DEPs2zZP9o4rm7lswxEIcOEn
	oShG2EwfIrHNNWkv5ZqH3+K0dMvnDC8JtMHgw8qLYLajQnviGuiKsrEG3iIDV8yp+NIV/mCZqoKBB
	O0BJUje9jJDe7oYyBZmPUkXcXOjljIEtnk5+2gUroocgCIvGHa7J02Pmn2mC7e2WtBZIt1NNGV6cb
	smj+GH6+iW//ShRL5k0owOqvXpEN8+FWYGW3EG5DCqxhDcprR0iYryVe/IUQRGoJgD+8NOc1JAkft
	06nIUTnboDhZfoaYNLIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7u1-00CGuy-Dt; Mon, 06 Mar 2023 10:17:09 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7tz-00CGsQ-Ep
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 10:17:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id bw19so8174643wrb.13
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 02:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DzeLm98x2KlxW+99+p+QT5JJuywxTn9f4r8Pp0eFvI=;
        b=4cSW/LQ5s9Et6MID8LgfRx1uyewkB5JqgFPfFl7Op/JLO/S2L3Mkfcb+VkGrqRkrlV
         ipMmbloNieFRtHwlqLJ4wEgJ+DHEUg+f4rZlaQ825a2jPl5kuFx9bdykF8SeFf1dBXyj
         jFU2ntNuLC74CPhN41uv3CYij8LjnMFic4arj03r9hBLrJ4kqJP3sCkOjMj+lilz1UPA
         8oi/ajLkTvRxJSWP+dhqRh7nnLh0Vn1CDDbc4Ctnz8zButcnXL33rNCZbDBae8zlOcw9
         cVDxTwvnfbc6IeX0EDHwG19xMT2lIFgQO1B5c6hbn8cuKzRWV0IVtY5rqz7wIcIT2M+u
         GR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DzeLm98x2KlxW+99+p+QT5JJuywxTn9f4r8Pp0eFvI=;
        b=BB7jAbyAcMwL4N/6EL4+116y3PGTTLcklroTi9gLJ7lbZNlN6onR9Jv1P0m07zlnad
         WMOprgQmXa7oGHUxHRjM+PUOO99tOuHv7uRopKOpe/bzajqG6L91J1/bdlUeBzZePh9z
         X+iZLF7Vt3Lg0Z1buRv18IiWFGbhuinbADuAnJJb6SwzpwBtu+LLMwC/KdYSoW52gDr9
         DeI6jqUliTlTfXWYzd5r6Bz5booO75YDcVJETfe8D8yNrBrx9Fz2lfCGKtrkiOtspOqS
         kdVVgu7ohqkEDRwDhPHtNYkM/tBrzd/+e3pWPJrxrgr9Gg18gMQ7LDZJ73Ru/Y2R9LEC
         1OTA==
X-Gm-Message-State: AO0yUKV7IlrQwr1ZAPfECC3bK1LD0sukOvIpEtcYGYapAYMPaeAwGjkQ
	XnqefIaWLnsi2msWN6yGelWBGg==
X-Google-Smtp-Source: AK7set87MHg0/YFlXuaC+GjFPo/tzKFyPd2BNWIQb0qhZu4XveM0MX+k2JiDtlPsTxXRUM06ojldcg==
X-Received: by 2002:adf:f151:0:b0:2c5:617a:5023 with SMTP id y17-20020adff151000000b002c5617a5023mr6281664wro.71.1678097822928;
        Mon, 06 Mar 2023 02:17:02 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id q9-20020a5d61c9000000b002c54911f50bsm9443931wrv.84.2023.03.06.02.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:17:02 -0800 (PST)
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
Subject: [PATCH v5 11/26] xtensa: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:53 +0100
Message-Id: <20230306100508.1171812-12-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_021707_578330_93178C4D 
X-CRM114-Status: GOOD (  16.45  )
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
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/setup.h      | 17 +++++++++++++++++
 arch/xtensa/include/uapi/asm/setup.h |  2 --
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 arch/xtensa/include/asm/setup.h

diff --git a/arch/xtensa/include/asm/setup.h b/arch/xtensa/include/asm/setup.h
new file mode 100644
index 000000000000..0fc3ad86e0a5
--- /dev/null
+++ b/arch/xtensa/include/asm/setup.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * include/asm-xtensa/setup.h
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ *
+ * Copyright (C) 2001 - 2005 Tensilica Inc.
+ */
+
+#ifndef _XTENSA_SETUP_H
+#define _XTENSA_SETUP_H
+
+#define COMMAND_LINE_SIZE	256
+
+#endif
diff --git a/arch/xtensa/include/uapi/asm/setup.h b/arch/xtensa/include/uapi/asm/setup.h
index 5356a5fd4d17..6f982394684a 100644
--- a/arch/xtensa/include/uapi/asm/setup.h
+++ b/arch/xtensa/include/uapi/asm/setup.h
@@ -12,6 +12,4 @@
 #ifndef _XTENSA_SETUP_H
 #define _XTENSA_SETUP_H
 
-#define COMMAND_LINE_SIZE	256
-
 #endif
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
