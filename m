Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15AECC6B3F
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Apr 2026 01:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AcHUcpbKOAUtL+VDlciUuhkNnbEf5k0MS0Lu4jtxU1o=; b=3OE8k1it+A9diE
	Wg6IKvoTzh1s5d1sGYsDNXp4rtx6k7XsqqT2B9ZeCDsTRdBxiFhvb1Iv8Gp7hqR2lAFajE2VOnGEo
	ALizC+EKswhJjw2W2ii6hl5bC7wrYL3E9FvY9qnGIuk+JADJyJ9Ovv57hfIlj/Lm6mjNA0ZpiTQuN
	1JMs5yYvLFlOXymsezj7Sv8uQskIeQ8Kko9W+wabUWFTeEj51Hl3ImpK7SjNcp7KTFW4wroQw68ex
	DI06+2iPWTR3uMdUlyw4vq/pixATz8zk2u4UROCxZbIdIUWkYDd1hR6NWbUQtwlrDkACf7YpaVXG/
	MwKxv7lPaRyEliF0tWBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TIS-000000012zb-1HvC;
	Fri, 03 Apr 2026 01:26:04 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TIQ-000000012yg-1umR
	for linux-snps-arc@lists.infradead.org;
	Fri, 03 Apr 2026 01:26:03 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-35c124d2613so801358a91.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 02 Apr 2026 18:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775179561; x=1775784361; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rY2ciLkg8RtFIf8Sumay9p4mc2pCLq551+da1KF5JtU=;
        b=mgG1MAoXs1XMVLVjrFzIyHCMcbBFgAa0Oe4yc2CMZaH+bF78EIapa+owUV8O5mDutL
         Vm++o9yfruC7WDcB4n25Y9inKn01czjVBJKR6dSsaIx4fKB1watWHJ+uRC0IfRL0hS+T
         Z6kxTMl/NkZ7PNTenNLDDB4xf0H8nO7BD7FulW0p1E6ZJJjDN5peeuvdfj/wIwzbO2q+
         7S1PaDkIZg/mw2YuRDY19t7qzjljGkFfwQZOFb+C6bNT/wgdjRG22EZZlq477HYuV2UK
         ORynGG+FRfamdOujdmv9nLScnwH7p0hLWMv9MMNh+X7F92AR3JhmgWWJU9bVJFXB6cjP
         /FGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775179561; x=1775784361;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rY2ciLkg8RtFIf8Sumay9p4mc2pCLq551+da1KF5JtU=;
        b=tMfB2WvYG3mdRqfDVeM56ZdU9ReZVMzitJnCGFJdQzPNru4z4Ug05Wrt4q67BpkzjE
         z6cffdEtLSpOUh556aGhxxzksKykO0og3tbxpvHLwzB9rd95SkOlQv37uXEf/P6A4//P
         6Yalo7UYfTCSnldHDuvH9sIaTNYkqL6fVgVNC+xAD9ltEkjbygJFarG9XWXbOZa8QxCo
         BcBTPrtOu/fYYrnIJr5XSuhmQze/kcoYy9hN7ZnIDaEGgTZUjMf1T7Pb0YcErRGO1ETi
         fU88Ip6daCamOe/KHhxpBcFFiCS++uC0I6C9mXFPm1tw0miwq0Ch6ChIsD8TZk9Vy9j/
         as6w==
X-Forwarded-Encrypted: i=1; AJvYcCVAU4S/46XhAg2ekGEi1JYnk9zfuFUEZm/g6lCOD/87QKHIjR2xh/Fba80JjV7PgCIuuX6oPOajm8E5VfD5pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhF8JFl8tlcRkrgCPSyXVSiCcn0p+ixhISUBGQ3JhhjgJJkWdt
	o7GiTGpuvI1Wega7d50EwnRwTJf+Qv5MYlgMebxBGj66cPjpxCUBsu1f
X-Gm-Gg: AeBDies+AZFNEQpBx8rYpxmOCCF9KEqvhglZtd9zC/3PmAclOiOHfxzaGO/XrCWWlDh
	GbYPUOohV0WZkd9B0mGKtl4LOdbwPCTktCxxUZyaX4IvmsPkf7dHGLlPukoKQu1EdbmMjgpMr7z
	uxuR2fla5QSlP8OkJBDgHlRssgYItJcSvBt7NAiDy8uKoKry8/x7wSslCC0kH0CfzgFkB+QfiW9
	TVcJLrQrEwnhl2tGgShXsr2KPtXa/UoT9FzKfWFkegdqZuvayERL6Xvo920KoBOZiK10rLVPKPJ
	gFLdAalME4hNYmxu5kNS/wEvXUCegmH81osTuV/lfwzIojnRk1C1j+Z+f62hScMfqZ9FzCQXESs
	HSzatExK3x0kywIV80u1hQwTHkIf5ZYVjC0gOrBHmAIFq5RGx6s5GPkB6/bAKVsv4btKmVzcQbM
	k2f2dTEX+XH4RCbARAvqQ5JDDvU8we6uwBh5g3mZXhfL9B5gJP
X-Received: by 2002:a17:902:ea0b:b0:2b2:5da8:14be with SMTP id d9443c01a7336-2b28190a213mr12256705ad.41.1775179561300;
        Thu, 02 Apr 2026 18:26:01 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d688sm42536555ad.8.2026.04.02.18.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 18:25:59 -0700 (PDT)
From: Hangbin Liu <liuhangbin@gmail.com>
Date: Fri, 03 Apr 2026 09:19:54 +0800
Subject: [PATCH v2] cmpxchg: allow const-qualified old value in cmpxchg()
MIME-Version: 1.0
Message-Id: <20260403-cmpxchg-v2-1-23acd2727447@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XMSwrDIBSF4a2EO65Fb00KHXUfJQPxeaHGoEFSg
 nuvzbTD/3D4Dig2ky3wGA7ItlKhtPTAywA6qMVbRqY3IMeJS45Mx3XXwTN05sbvTkolBfT3mq2
 j/ZRec+9AZUv5c8JV/NZ/owommBwnYVHz0aB++qjofdUpwtxa+wIngfApngAAAA==
X-Change-ID: 20260402-cmpxchg-2fd307f44a41
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Vineet Gupta <vgupta@kernel.org>, Brian Cain <bcain@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 David Laight <david.laight.linux@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
 Hangbin Liu <liuhangbin@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_182602_500878_7854988F 
X-CRM114-Status: GOOD (  17.06  )
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

The old value passed to cmpxchg() is semantically read-only: it is
only loaded into a register as a comparand and is never written back.
However, the macro currently assigns it implicitly to a local variable
of type __typeof__(*(ptr)), which triggers -Werror=discarded-qualifiers
when old is a const-qualified pointer and ptr points to a non-const type.

Fix this by using __auto_type with the conditional expression trick:

  __auto_type _o_ = 1 ? (o) : *(ptr);

The __auto_type deduces the type from the expression, so _o_ naturally
takes the const-qualified type when o is const-qualified, avoiding the
discarded-qualifiers warning. The conditional expression forces the
compiler to verify that o and *(ptr) have compatible types, preserving
the type-safety check that a bare __auto_type _o_ = (o) would lose.
Since the condition is the constant 1, the compiler optimizes away the
*(ptr) branch entirely with no runtime cost.

For macros where ptr is already captured in a local variable (arc's
_p_, hexagon's __ptr, riscv's __ptr), the captured variable is used
in the conditional expression to avoid re-evaluating ptr.

The new value is intentionally left without this treatment: new will
be stored into *ptr, so silently accepting a const-qualified new would
allow callers to store a pointer-to-const into a non-const location
without any compiler warning.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
---
Changes in v2:
- Use __auto_type as the previous way will loose ptr type checking (David Laight)
- Link to v1: https://lore.kernel.org/r/20260402-cmpxchg-v1-1-4561e2c05d2c@gmail.com
---
 arch/alpha/include/asm/cmpxchg.h     | 4 ++--
 arch/arc/include/asm/cmpxchg.h       | 4 ++--
 arch/hexagon/include/asm/cmpxchg.h   | 2 +-
 arch/parisc/include/asm/cmpxchg.h    | 2 +-
 arch/powerpc/include/asm/cmpxchg.h   | 8 ++++----
 arch/riscv/include/asm/cmpxchg.h     | 4 ++--
 arch/sh/include/asm/cmpxchg.h        | 2 +-
 arch/sparc/include/asm/cmpxchg_32.h  | 2 +-
 arch/sparc/include/asm/cmpxchg_64.h  | 2 +-
 arch/x86/include/asm/cmpxchg.h       | 2 +-
 arch/xtensa/include/asm/cmpxchg.h    | 2 +-
 tools/arch/x86/include/asm/cmpxchg.h | 2 +-
 12 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
index ae1b96479d0c..e6cb60ca35bf 100644
--- a/arch/alpha/include/asm/cmpxchg.h
+++ b/arch/alpha/include/asm/cmpxchg.h
@@ -234,7 +234,7 @@ ____cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
 
 #define arch_cmpxchg_local(ptr, o, n)					\
 ({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
+	__auto_type _o_ = 1 ? (o) : *(ptr);				\
 	__typeof__(*(ptr)) _n_ = (n);					\
 	(__typeof__(*(ptr))) ____cmpxchg((ptr), (unsigned long)_o_,	\
 					  (unsigned long)_n_,		\
@@ -265,7 +265,7 @@ ____cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
 #define arch_cmpxchg(ptr, o, n)						\
 ({									\
 	__typeof__(*(ptr)) __ret;					\
-	__typeof__(*(ptr)) _o_ = (o);					\
+	__auto_type _o_ = 1 ? (o) : *(ptr);				\
 	__typeof__(*(ptr)) _n_ = (n);					\
 	smp_mb();							\
 	__ret = (__typeof__(*(ptr))) ____cmpxchg((ptr),			\
diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 76f43db0890f..e18609174133 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -42,7 +42,7 @@
 #define arch_cmpxchg_relaxed(ptr, old, new)				\
 ({									\
 	__typeof__(ptr) _p_ = (ptr);					\
-	__typeof__(*(ptr)) _o_ = (old);					\
+	__auto_type _o_ = 1 ? (old) : *(_p_);				\
 	__typeof__(*(ptr)) _n_ = (new);					\
 	__typeof__(*(ptr)) _prev_;					\
 									\
@@ -64,7 +64,7 @@
 #define arch_cmpxchg(ptr, old, new)				        \
 ({									\
 	volatile __typeof__(ptr) _p_ = (ptr);				\
-	__typeof__(*(ptr)) _o_ = (old);					\
+	__auto_type _o_ = 1 ? (old) : *(_p_);				\
 	__typeof__(*(ptr)) _n_ = (new);					\
 	__typeof__(*(ptr)) _prev_;					\
 	unsigned long __flags;						\
diff --git a/arch/hexagon/include/asm/cmpxchg.h b/arch/hexagon/include/asm/cmpxchg.h
index 9c58fb81f7fd..88986fe04072 100644
--- a/arch/hexagon/include/asm/cmpxchg.h
+++ b/arch/hexagon/include/asm/cmpxchg.h
@@ -54,7 +54,7 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 #define arch_cmpxchg(ptr, old, new)				\
 ({								\
 	__typeof__(ptr) __ptr = (ptr);				\
-	__typeof__(*(ptr)) __old = (old);			\
+	__auto_type __old = 1 ? (old) : *(__ptr);		\
 	__typeof__(*(ptr)) __new = (new);			\
 	__typeof__(*(ptr)) __oldval = (__typeof__(*(ptr))) 0;	\
 								\
diff --git a/arch/parisc/include/asm/cmpxchg.h b/arch/parisc/include/asm/cmpxchg.h
index bf0a0f1189eb..30748e31aa17 100644
--- a/arch/parisc/include/asm/cmpxchg.h
+++ b/arch/parisc/include/asm/cmpxchg.h
@@ -78,7 +78,7 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new_, int size)
 
 #define arch_cmpxchg(ptr, o, n)						 \
 ({									 \
-	__typeof__(*(ptr)) _o_ = (o);					 \
+	__auto_type _o_ = 1 ? (o) : *(ptr);				 \
 	__typeof__(*(ptr)) _n_ = (n);					 \
 	(__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,	 \
 				    (unsigned long)_n_, sizeof(*(ptr))); \
diff --git a/arch/powerpc/include/asm/cmpxchg.h b/arch/powerpc/include/asm/cmpxchg.h
index dbb50c06f0bf..eaf88b7d0443 100644
--- a/arch/powerpc/include/asm/cmpxchg.h
+++ b/arch/powerpc/include/asm/cmpxchg.h
@@ -698,7 +698,7 @@ __cmpxchg_acquire(void *ptr, unsigned long old, unsigned long new,
 }
 #define arch_cmpxchg(ptr, o, n)						 \
   ({									 \
-     __typeof__(*(ptr)) _o_ = (o);					 \
+     __auto_type _o_ = 1 ? (o) : *(ptr);				 \
      __typeof__(*(ptr)) _n_ = (n);					 \
      (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
 				    (unsigned long)_n_, sizeof(*(ptr))); \
@@ -707,7 +707,7 @@ __cmpxchg_acquire(void *ptr, unsigned long old, unsigned long new,
 
 #define arch_cmpxchg_local(ptr, o, n)					 \
   ({									 \
-     __typeof__(*(ptr)) _o_ = (o);					 \
+     __auto_type _o_ = 1 ? (o) : *(ptr);				 \
      __typeof__(*(ptr)) _n_ = (n);					 \
      (__typeof__(*(ptr))) __cmpxchg_local((ptr), (unsigned long)_o_,	 \
 				    (unsigned long)_n_, sizeof(*(ptr))); \
@@ -715,7 +715,7 @@ __cmpxchg_acquire(void *ptr, unsigned long old, unsigned long new,
 
 #define arch_cmpxchg_relaxed(ptr, o, n)					\
 ({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
+	__auto_type _o_ = 1 ? (o) : *(ptr);				\
 	__typeof__(*(ptr)) _n_ = (n);					\
 	(__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),			\
 			(unsigned long)_o_, (unsigned long)_n_,		\
@@ -724,7 +724,7 @@ __cmpxchg_acquire(void *ptr, unsigned long old, unsigned long new,
 
 #define arch_cmpxchg_acquire(ptr, o, n)					\
 ({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
+	__auto_type _o_ = 1 ? (o) : *(ptr);				\
 	__typeof__(*(ptr)) _n_ = (n);					\
 	(__typeof__(*(ptr))) __cmpxchg_acquire((ptr),			\
 			(unsigned long)_o_, (unsigned long)_n_,		\
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 8712cf9c69dc..30ade671298f 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -215,7 +215,7 @@
 		      cas_prepend, cas_append)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(*(__ptr)) __old = (old);				\
+	__auto_type __old = 1 ? (old) : *(__ptr);			\
 	__typeof__(*(__ptr)) __new = (new);				\
 	__typeof__(*(__ptr)) __ret;					\
 									\
@@ -331,7 +331,7 @@ union __u128_halves {
 
 #define __arch_cmpxchg128(p, o, n, cas_sfx)					\
 ({										\
-	__typeof__(*(p)) __o = (o);                                             \
+	__auto_type __o = 1 ? (o) : *(p);					\
 	union __u128_halves __hn = { .full = (n) };				\
 	union __u128_halves __ho = { .full = (__o) };				\
 	register unsigned long t1 asm ("t1") = __hn.low;			\
diff --git a/arch/sh/include/asm/cmpxchg.h b/arch/sh/include/asm/cmpxchg.h
index 1e5dc5ccf7bf..6c1bfb367f11 100644
--- a/arch/sh/include/asm/cmpxchg.h
+++ b/arch/sh/include/asm/cmpxchg.h
@@ -68,7 +68,7 @@ static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
 
 #define arch_cmpxchg(ptr,o,n)						 \
   ({									 \
-     __typeof__(*(ptr)) _o_ = (o);					 \
+     __auto_type _o_ = 1 ? (o) : *(ptr);				 \
      __typeof__(*(ptr)) _n_ = (n);					 \
      (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
 				    (unsigned long)_n_, sizeof(*(ptr))); \
diff --git a/arch/sparc/include/asm/cmpxchg_32.h b/arch/sparc/include/asm/cmpxchg_32.h
index 8c1a3ca34eeb..df40a16dd021 100644
--- a/arch/sparc/include/asm/cmpxchg_32.h
+++ b/arch/sparc/include/asm/cmpxchg_32.h
@@ -55,7 +55,7 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new_, int size)
 
 #define arch_cmpxchg(ptr, o, n)						\
 ({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
+	__auto_type _o_ = 1 ? (o) : *(ptr);				\
 	__typeof__(*(ptr)) _n_ = (n);					\
 	(__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,	\
 			(unsigned long)_n_, sizeof(*(ptr)));		\
diff --git a/arch/sparc/include/asm/cmpxchg_64.h b/arch/sparc/include/asm/cmpxchg_64.h
index 3de25262c411..4b540405fcc7 100644
--- a/arch/sparc/include/asm/cmpxchg_64.h
+++ b/arch/sparc/include/asm/cmpxchg_64.h
@@ -170,7 +170,7 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
 
 #define arch_cmpxchg(ptr,o,n)						 \
   ({									 \
-     __typeof__(*(ptr)) _o_ = (o);					 \
+     __auto_type _o_ = 1 ? (o) : *(ptr);				 \
      __typeof__(*(ptr)) _n_ = (n);					 \
      (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
 				    (unsigned long)_n_, sizeof(*(ptr))); \
diff --git a/arch/x86/include/asm/cmpxchg.h b/arch/x86/include/asm/cmpxchg.h
index a88b06f1c35e..e0340579ef69 100644
--- a/arch/x86/include/asm/cmpxchg.h
+++ b/arch/x86/include/asm/cmpxchg.h
@@ -85,7 +85,7 @@ extern void __add_wrong_size(void)
 #define __raw_cmpxchg(ptr, old, new, size, lock)			\
 ({									\
 	__typeof__(*(ptr)) __ret;					\
-	__typeof__(*(ptr)) __old = (old);				\
+	__auto_type __old = 1 ? (old) : *(ptr);				\
 	__typeof__(*(ptr)) __new = (new);				\
 	switch (size) {							\
 	case __X86_CASE_B:						\
diff --git a/arch/xtensa/include/asm/cmpxchg.h b/arch/xtensa/include/asm/cmpxchg.h
index b6db4838b175..057fd24ed125 100644
--- a/arch/xtensa/include/asm/cmpxchg.h
+++ b/arch/xtensa/include/asm/cmpxchg.h
@@ -83,7 +83,7 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
 }
 
 #define arch_cmpxchg(ptr,o,n)						      \
-	({ __typeof__(*(ptr)) _o_ = (o);				      \
+	({ __auto_type _o_ = 1 ? (o) : *(ptr);				      \
 	   __typeof__(*(ptr)) _n_ = (n);				      \
 	   (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,	      \
 	   			        (unsigned long)_n_, sizeof (*(ptr))); \
diff --git a/tools/arch/x86/include/asm/cmpxchg.h b/tools/arch/x86/include/asm/cmpxchg.h
index 0ed9ca2766ad..bbd3960c2218 100644
--- a/tools/arch/x86/include/asm/cmpxchg.h
+++ b/tools/arch/x86/include/asm/cmpxchg.h
@@ -35,7 +35,7 @@ extern void __cmpxchg_wrong_size(void)
 #define __raw_cmpxchg(ptr, old, new, size, lock)			\
 ({									\
 	__typeof__(*(ptr)) __ret;					\
-	__typeof__(*(ptr)) __old = (old);				\
+	__auto_type __old = 1 ? (old) : *(ptr);				\
 	__typeof__(*(ptr)) __new = (new);				\
 	switch (size) {							\
 	case __X86_CASE_B:						\

---
base-commit: f8f5627a8aeab15183eef8930bf75ba88a51622f
change-id: 20260402-cmpxchg-2fd307f44a41

Best regards,
-- 
Hangbin Liu <liuhangbin@gmail.com>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
