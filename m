Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FFFC678D4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Exb/eCeY+kIUESQNYaU/IKq3B15uQ8hM/MFiDKSAJfk=; b=3E2JVadWHPp7wH
	BTw4w5yfHRiedw00lYf640X+1BvEMDZmH8lAuDMlVGxBbfQiuq/C05bL9bVbGSRwlHIeY6VrzVIz3
	ArBbxrDNNY47j/ie4NaFORtBxjeeds2bl2ACUYxeU7BISc5UGLpYR0hLnORQ9u77JW9SAB2kQ6mSy
	+NONJ2/14viSMPSlK0XpaepYapkx4hMcS+D2o8pgBBKOznTzLwcdG4WB26/OwCNjFqiSNP7Iqm3+8
	IrHOxnnFKyXVBTXDV+q5Ye1omaLUWehB5dw+80cZ8an8GCUNeRnwHf8UOJFfrvwcNwcHkEek3KW8J
	Hf7v548XHHcua7IFT98g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7sz-00CGd5-HU; Mon, 06 Mar 2023 10:16:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7sw-00CGaw-JT
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 10:16:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id j2so8185573wrh.9
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 02:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zH6sM/JGTppOg6WAbFRYz9bSKKl0zrCh7Zhv5eLLuQ=;
        b=4vl12bWdvUk4c3KAESQbo+g6mVesFr4wgqkb3+X6pPrgEWTgrFPuyBano55RYbymx3
         xGj56sY7qkd+J7CaAul/FiN0to1w+XEmibsLrWawFVzTfagBs+sf5tx+lIRSseQVkaUw
         irL0C2jNR+e/Sc6BXFxWCu5DlmqnXzvE0wMuR9CWoulWp4Cn6Z/hdTv+CytKL3S08FDr
         wm/a1Fo1CtFumDHv51cxHEyaCeZ0LuGrDosbJv/u3u5hgO7iEI3IQtZAKeoMUne7201U
         yXWSRZQo+n7/yxkCaOzMzbqJmgcX8kyxkO/U6wVCWrZ3tx9isX0LCi1TIz1nnf9UQDFK
         lYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zH6sM/JGTppOg6WAbFRYz9bSKKl0zrCh7Zhv5eLLuQ=;
        b=xSC5DymtUsRq0fJHzeC+bcLxXRy0pZ6Y8E3oKNthll49LhpLpmtJVgR3u5WOrqZN7X
         aNAoa3ijoHobvdD+1gCKVmGLpv5MVstUwkHbd0U59DX9vaAEJJ3CW1Q7h5vq3MNXkwwu
         EehVC+Cb7P7qU9t/Dw/8jxZeOCP+o2w/r8Il2rHvYaTZyUkYtZ4Qtr8XSu4alwW4efHV
         kNOGtJNNmJLrufuwO9v/IKLEOjNWjwlXkyB/73CGGNrYVC6XXnjf0BZEcTOg8AdZ6d1V
         aMQZmxONXwKhQ1A9oTBFjiHewdBma0+Q43N4P1DbUB6d9j6osyrbIybJtL4MGe+JHL41
         GELA==
X-Gm-Message-State: AO0yUKVe/8c4O+4ziJs2I8gHsv1XTdR0AfuNAWSlgHB6FFVldjbUiTZ8
	afBdwL2z94BByGvuO2ALd4aykQ==
X-Google-Smtp-Source: AK7set9QzgEz/C8uA0NlmNMHen68Ax9bRKn4lj3aSWLUzeNtL2LQdG4l4s1yU3qcchzv8/XlF/U2lA==
X-Received: by 2002:a5d:560f:0:b0:2ce:506a:d956 with SMTP id l15-20020a5d560f000000b002ce506ad956mr4143451wrv.34.1678097761282;
        Mon, 06 Mar 2023 02:16:01 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p7-20020a5d4e07000000b002c5694aef92sm9505807wrt.21.2023.03.06.02.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:16:01 -0800 (PST)
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
Subject: [PATCH v5 10/26] sparc: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:52 +0100
Message-Id: <20230306100508.1171812-11-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_021602_667988_5DCE13DD 
X-CRM114-Status: GOOD (  11.55  )
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
 arch/sparc/include/asm/setup.h      | 6 +++++-
 arch/sparc/include/uapi/asm/setup.h | 7 -------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/include/asm/setup.h b/arch/sparc/include/asm/setup.h
index 72205684e51e..d1384ed92547 100644
--- a/arch/sparc/include/asm/setup.h
+++ b/arch/sparc/include/asm/setup.h
@@ -7,7 +7,11 @@
 
 #include <linux/interrupt.h>
 
-#include <uapi/asm/setup.h>
+#if defined(__sparc__) && defined(__arch64__)
+# define COMMAND_LINE_SIZE 2048
+#else
+# define COMMAND_LINE_SIZE 256
+#endif
 
 extern char reboot_command[];
 
diff --git a/arch/sparc/include/uapi/asm/setup.h b/arch/sparc/include/uapi/asm/setup.h
index 3c208a4dd464..c3cf1b0d30b3 100644
--- a/arch/sparc/include/uapi/asm/setup.h
+++ b/arch/sparc/include/uapi/asm/setup.h
@@ -6,11 +6,4 @@
 #ifndef _UAPI_SPARC_SETUP_H
 #define _UAPI_SPARC_SETUP_H
 
-#if defined(__sparc__) && defined(__arch64__)
-# define COMMAND_LINE_SIZE 2048
-#else
-# define COMMAND_LINE_SIZE 256
-#endif
-
-
 #endif /* _UAPI_SPARC_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
