Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FBCC61DA4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 10:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tD6wSaCbzYtU51XQkdgsRpx+YuwcwQMevZ6W740TVtc=; b=n1ndiVAmk4WZM4
	AZWcgroNK7vVxfHppS4PcdFQG0e/5xYZ0ezDYnUw6qiVIy/RrkLa64b5wR3EEyM5tgG5l32qDEABv
	mEvi4jpkw1K9wsUujPQBXCG4yGYA/oRaVaNTdgcLc0ztxO5HE+P4vPTzcIQqZNYsLCafZlENaHJnt
	2MEUwxs3vvbH98yO9F/7L1LLcVG9S2ZgmKzhvF6BAA85yzqletFB581xn6ez1jbaavVAZFc0OEI0u
	v1UOIxQ5Sao6wWkKxMaNXmqsD5VOFmIuT0+ds3hzE+ezHglpoIEC0Bj4E+oiaL1dxi7M3jQ94WQ4D
	PxtiqLcBDy8J+GdrL5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7n2-00CEvj-Mu; Mon, 06 Mar 2023 10:09:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7my-00CEsA-MV
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 10:09:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id l1so8145656wry.12
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 02:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZOQ1qdZsFIK5hbGOnWeLVu8XxoTb8xkf1L43beLt1s=;
        b=uFqyPU/KfF2H0sgeJPKblQQ09z2QF+U8QLkec7GtAjnGRixcmkQQHmI7463iJRt1T/
         rHxu0Kl4nc3nOt5MH9Ymte5dM23zyqLTRTNXtNU/pE708hNq7xfdVy9kEFY5gWKXtEwu
         IOizVhQJrEUxmZR+iVQR/Op/EKbjLs+sDVdMJbW1oFXrIiiiohfr4Ht1NR2SXiWfV4yF
         vCqG7L6DlmSxUldGFBQRAIoJ9f/jjDlGsHjp0/BtyE1TaiFX6kgDAhRCjZMstOl1yuBn
         ROiJ5Ouz3oB3EdmXnuAEfAUOcog9CZw6U/stmGUU76S9rvh5HigWpSduzV3a1puQbFWA
         f9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZOQ1qdZsFIK5hbGOnWeLVu8XxoTb8xkf1L43beLt1s=;
        b=HduhAEyTVzpoMgKhgu19JTh8CX87DlewtX1WNTI9zLb+0nCgH+HCSVWHytcFWUTKjU
         iGmGo3mS1AW68CZZ8R1uZVsVrJohgmdNWobGlYEycENAjQCiM0xsEBULEFNVG/bPIBEz
         g5nxTpxjJ/eHiWGEoYDsfumF5go/qEnTYxTt4Z/tmEX3Hd/hvC7FOenu2p4LgaaD41wr
         G7IetmRsjLV79wBvDzKomouY8Dk9Uuklk8MXQ8g37qDVErR1H9hJbWp1rswJ8SxiYrWt
         emBzex1O2uWVEeG6AKpuIl/PrkkoIAIyUQ9wlpszWGB66vSbBHp3lt+z+TbY/o0XX0R1
         8UKg==
X-Gm-Message-State: AO0yUKVkMgND39Ac7IQ5W87z4VtlUe1nYM4fAPQZt0hIOgAPD3rD9lXX
	003b9c5oI2k5BOOYyrc1bbOw6g==
X-Google-Smtp-Source: AK7set+81v6+Tn1jgTZ0GG84ONU4lrLBfEM4VVz0EKMiaYSTRJq6zNMe3zar9b+ifVJD076yKeNEYA==
X-Received: by 2002:adf:dd83:0:b0:2c7:148c:b054 with SMTP id x3-20020adfdd83000000b002c7148cb054mr6259157wrl.29.1678097391202;
        Mon, 06 Mar 2023 02:09:51 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id k11-20020a5d628b000000b002c707b336c9sm9267953wru.36.2023.03.06.02.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:09:51 -0800 (PST)
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
Subject: [PATCH v5 04/26] ia64: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:46 +0100
Message-Id: <20230306100508.1171812-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_020952_785529_159F2DEB 
X-CRM114-Status: GOOD (  14.61  )
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
---
 arch/ia64/include/asm/setup.h      | 10 ++++++++++
 arch/ia64/include/uapi/asm/setup.h |  6 ++----
 2 files changed, 12 insertions(+), 4 deletions(-)
 create mode 100644 arch/ia64/include/asm/setup.h

diff --git a/arch/ia64/include/asm/setup.h b/arch/ia64/include/asm/setup.h
new file mode 100644
index 000000000000..ba57909cad4c
--- /dev/null
+++ b/arch/ia64/include/asm/setup.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __IA64_SETUP_H
+#define __IA64_SETUP_H
+
+#include <uapi/asm/setup.h>
+
+#define COMMAND_LINE_SIZE	2048
+
+#endif
diff --git a/arch/ia64/include/uapi/asm/setup.h b/arch/ia64/include/uapi/asm/setup.h
index 8d13ce8fb03a..bcbb2b242ded 100644
--- a/arch/ia64/include/uapi/asm/setup.h
+++ b/arch/ia64/include/uapi/asm/setup.h
@@ -1,8 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __IA64_SETUP_H
-#define __IA64_SETUP_H
-
-#define COMMAND_LINE_SIZE	2048
+#ifndef __UAPI_IA64_SETUP_H
+#define __UAPI_IA64_SETUP_H
 
 extern struct ia64_boot_param {
 	__u64 command_line;		/* physical address of command line arguments */
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
