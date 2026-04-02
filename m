Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C316CC6B03
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Apr 2026 06:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1t2Cct7o05uikfl8AZWJBP+wDnS2XogX0C2WboYEYyA=; b=vuz6cugsOoQEbo
	ptnQlX3sDwsODBje+JTptxnUAI654oM53SCraox0iKB2jMKVEJ54bW01heZ/8S0V9HJum4GeD8CtY
	CJaooCysCdZGFmsV1s64P+TJehN9Gw7Vv4teDgg76w5bi0IceNy82U8F7l2cHjrJb/BRQMRLSUCAv
	Sc3VNCgyw/0+G0u9hreGkj+VikDXVm2cydeHFgGpfHHLj8PMqq0OTlQoc6UzSQcxBsRvlpX8hldYQ
	+5FtZpLFcsi/+vTA2S4P+TDfuepDpZ05caSEPBBVwU2tFdnJlPaSQ3qXine7afUVC4bBhmnIBLFHp
	3vCtkatCAFWa3oPAiuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Byt-0000000GxNK-0Wy8;
	Thu, 02 Apr 2026 06:56:43 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Byq-0000000GxKG-3Cdz
	for linux-snps-arc@lists.infradead.org;
	Thu, 02 Apr 2026 06:56:42 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2b23f90f53aso4929455ad.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 01 Apr 2026 23:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775112999; x=1775717799; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FlpdYf1WLDHAMV/rn1y6xYHlGkLnTRJ4f+O5zsHNUww=;
        b=dhZr9nA76k0PgCKC43mhvkZqs0g192+mmQQugqJyX6+TT8X1Y0yG7uKwPtw8v+FmB1
         kUBPasxycNc7CC5e+1pOB18XfsNE+LOXDx+eualb+Iixc5ekyhbvy+61niLnnvN+GVK3
         SHhweJg4ev2CPLopNQVOHY/2/DOo/bKbvbGbCZIK+MnWRKxMMOidOhuSik2/y7R0GjSV
         zOOBfou8WZWiH5w5Px45A8DYoSaGMIrrShvpkkjqzih5no7n5CQTZnd6A4biBRXKDskP
         tUco8N+IoAosJIsyMQ1rEWZLZN5CGF3Y6VJ7aaGlKN7n077rQni4vcfpfyLai8D5IrbM
         TYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775112999; x=1775717799;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlpdYf1WLDHAMV/rn1y6xYHlGkLnTRJ4f+O5zsHNUww=;
        b=CIS1HUOHVWRRDrUeCXRpFx/FkJzsJbkOWQL+HPWS5imkpVepilbChAT5GZOyloczik
         vAlPayrOxbmmps7VOxfUIiZovT0GtZscg+MOb6Vy2lhJ9iHxS+l3U7ClvXpPkUZK6kab
         uN3WGZzHAy3zAsvHE4U9OrYf1FCCVe2Yt4I/3V6iu4o1ogntRMk9L+f2ftse8WEMQXMI
         iotvUkPIz212Ikvmt/n3XDNZaSjdEnlUE8WGyHI0NRtDmHZmh5F+AH1Nx5usxz8iVZ5Q
         mBqkn+CF3bFJCq8r/bwKI1/B3S3QxZopxcZCqHbM3VVdDqqckq0aqHE+qKT/Jrt0jJYF
         MiWg==
X-Forwarded-Encrypted: i=1; AJvYcCU9Xpk7o5pB8ppBXBqvyxoxotPFClC5Kdcad0Ev+2f7TUv744H+DZQfSV3lJfuBobNQNd+71928HhE9JNN/FQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCKakIcIEqgo/33uzkiPkcZrsA5QPI0HoPfFJNb1tMn+fWwPN7
	c1lm9TgeZQMkz3ltFeK40cSbVZk40RDpRUln9TTaluLlorxdzmgA8wfe
X-Gm-Gg: AeBDietjKPeN5NlPrx/8DvpLOrJATOdzBJEL1IUvfs17/Q0vEdoOYmQ+85emY1LTowq
	TSNVNnVhN558TQprKg6U8oeKafcO40txI7b943ehvlszBKmA4X11IKyit33/Ld8x+SgF010tDeo
	xr+8HvOIMB8GsaGc1P8wOISluJB19QVhCPzsuOFxBRt5TKjHv+we7/2SsUZsH7o0VvnI4lp6X9C
	goKS9zi26T8mU7m3bsAzeUtEmUuVCOh3xRe0JSfml2CsQSwsNJd4XzEwtrZ3c2k+EKp0wt9P2mZ
	NP/pev6nwvjkbb4+122mFg80DYsD5H5wyTIo0lFb5a6QtWKGfo7MxEUDvTvclcBzpZUtz9mXmKZ
	jk8kZWLwaa30Lxj7gsRY3XqeOtvdY45xu8DN0hryaGgCv6FPxVnc6urAKvcCclGz8KjrA0ZQV79
	+OTmsV+8jtdnttbvZ8xM74Pqjp+d+29Md3iIbRqeU6wMYWhFUFQaMzGH7PmwOq9gjQkD4=
X-Received: by 2002:a17:903:90b:b0:2b2:470d:6d18 with SMTP id d9443c01a7336-2b269adfea5mr73898055ad.8.1775112999356;
        Wed, 01 Apr 2026 23:56:39 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([240e:34c:5765:500:7999:76d9:8e52:f837])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a1e9csm19647945ad.55.2026.04.01.23.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 23:56:38 -0700 (PDT)
From: Hangbin Liu <liuhangbin@gmail.com>
Date: Thu, 02 Apr 2026 14:56:01 +0800
Subject: [PATCH] cmpxchg: allow const-qualified old value in cmpxchg()
MIME-Version: 1.0
Message-Id: <20260402-cmpxchg-v1-1-4561e2c05d2c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwMj3eTcgorkjHRdo7QUYwPzNBOTRBNDJaDqgqLUtMwKsEnRsbW1AGI
 cTBRZAAAA
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
 Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
 Hangbin Liu <liuhangbin@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_235640_804032_0D240965 
X-CRM114-Status: GOOD (  16.24  )
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

To avoid this, let's add an explicit cast to __typeof__(*(ptr)) for the
old local variable in the cmpxchg macros. This explicit cast suppresses
the -Wdiscarded-qualifiers diagnostic.

The new value is intentionally left without a cast: new will be stored
into *ptr, so silently accepting a const-qualified new would allow
callers to store a pointer-to-const into a non-const location without
any compiler warning.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
---
This is my first time posting a patch with multi-architecture specific
changes, so I'm not sure which target repository I should use. Please
correct me if I made any mistakes.
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
index ae1b96479d0c..b4b8dac759c4 100644
--- a/arch/alpha/include/asm/cmpxchg.h
+++ b/arch/alpha/include/asm/cmpxchg.h
@@ -234,7 +234,7 @@ ____cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
 
 #define arch_cmpxchg_local(ptr, o, n)					\
 ({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
+	__typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);		\
 	__typeof__(*(ptr)) _n_ = (n);					\
 	(__typeof__(*(ptr))) ____cmpxchg((ptr), (unsigned long)_o_,	\
 					  (unsigned long)_n_,		\
@@ -265,7 +265,7 @@ ____cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
 #define arch_cmpxchg(ptr, o, n)						\
 ({									\
 	__typeof__(*(ptr)) __ret;					\
-	__typeof__(*(ptr)) _o_ = (o);					\
+	__typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);		\
 	__typeof__(*(ptr)) _n_ = (n);					\
 	smp_mb();							\
 	__ret = (__typeof__(*(ptr))) ____cmpxchg((ptr),			\
diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 76f43db0890f..9637e2cdb5b1 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -42,7 +42,7 @@
 #define arch_cmpxchg_relaxed(ptr, old, new)				\
 ({									\
 	__typeof__(ptr) _p_ = (ptr);					\
-	__typeof__(*(ptr)) _o_ = (old);					\
+	__typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(old);			\
 	__typeof__(*(ptr)) _n_ = (new);					\
 	__typeof__(*(ptr)) _prev_;					\
 									\
@@ -64,7 +64,7 @@
 #define arch_cmpxchg(ptr, old, new)				        \
 ({									\
 	volatile __typeof__(ptr) _p_ = (ptr);				\
-	__typeof__(*(ptr)) _o_ = (old);					\
+	__typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(old);			\
 	__typeof__(*(ptr)) _n_ = (new);					\
 	__typeof__(*(ptr)) _prev_;					\
 	unsigned long __flags;						\
diff --git a/arch/hexagon/include/asm/cmpxchg.h b/arch/hexagon/include/asm/cmpxchg.h
index 9c58fb81f7fd..7e117964cb6b 100644
--- a/arch/hexagon/include/asm/cmpxchg.h
+++ b/arch/hexagon/include/asm/cmpxchg.h
@@ -54,7 +54,7 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 #define arch_cmpxchg(ptr, old, new)				\
 ({								\
 	__typeof__(ptr) __ptr = (ptr);				\
-	__typeof__(*(ptr)) __old = (old);			\
+	__typeof__(*(ptr)) __old = (__typeof__(*(ptr)))(old);	\
 	__typeof__(*(ptr)) __new = (new);			\
 	__typeof__(*(ptr)) __oldval = (__typeof__(*(ptr))) 0;	\
 								\
diff --git a/arch/parisc/include/asm/cmpxchg.h b/arch/parisc/include/asm/cmpxchg.h
index bf0a0f1189eb..2a87942227f8 100644
--- a/arch/parisc/include/asm/cmpxchg.h
+++ b/arch/parisc/include/asm/cmpxchg.h
@@ -78,7 +78,7 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new_, int size)
 
 #define arch_cmpxchg(ptr, o, n)						 \
 ({									 \
-	__typeof__(*(ptr)) _o_ = (o);					 \
+	__typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);		 \
 	__typeof__(*(ptr)) _n_ = (n);					 \
 	(__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,	 \
 				    (unsigned long)_n_, sizeof(*(ptr))); \
diff --git a/arch/powerpc/include/asm/cmpxchg.h b/arch/powerpc/include/asm/cmpxchg.h
index dbb50c06f0bf..36d113b13623 100644
--- a/arch/powerpc/include/asm/cmpxchg.h
+++ b/arch/powerpc/include/asm/cmpxchg.h
@@ -698,7 +698,7 @@ __cmpxchg_acquire(void *ptr, unsigned long old, unsigned long new,
 }
 #define arch_cmpxchg(ptr, o, n)						 \
   ({									 \
-     __typeof__(*(ptr)) _o_ = (o);					 \
+     __typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);			 \
      __typeof__(*(ptr)) _n_ = (n);					 \
      (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
 				    (unsigned long)_n_, sizeof(*(ptr))); \
@@ -707,7 +707,7 @@ __cmpxchg_acquire(void *ptr, unsigned long old, unsigned long new,
 
 #define arch_cmpxchg_local(ptr, o, n)					 \
   ({									 \
-     __typeof__(*(ptr)) _o_ = (o);					 \
+     __typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);			 \
      __typeof__(*(ptr)) _n_ = (n);					 \
      (__typeof__(*(ptr))) __cmpxchg_local((ptr), (unsigned long)_o_,	 \
 				    (unsigned long)_n_, sizeof(*(ptr))); \
@@ -715,7 +715,7 @@ __cmpxchg_acquire(void *ptr, unsigned long old, unsigned long new,
 
 #define arch_cmpxchg_relaxed(ptr, o, n)					\
 ({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
+	__typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);		\
 	__typeof__(*(ptr)) _n_ = (n);					\
 	(__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),			\
 			(unsigned long)_o_, (unsigned long)_n_,		\
@@ -724,7 +724,7 @@ __cmpxchg_acquire(void *ptr, unsigned long old, unsigned long new,
 
 #define arch_cmpxchg_acquire(ptr, o, n)					\
 ({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
+	__typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);		\
 	__typeof__(*(ptr)) _n_ = (n);					\
 	(__typeof__(*(ptr))) __cmpxchg_acquire((ptr),			\
 			(unsigned long)_o_, (unsigned long)_n_,		\
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 8712cf9c69dc..3026a9ff43c4 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -215,7 +215,7 @@
 		      cas_prepend, cas_append)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(*(__ptr)) __old = (old);				\
+	__typeof__(*(__ptr)) __old = (__typeof__(*(__ptr)))(old);	\
 	__typeof__(*(__ptr)) __new = (new);				\
 	__typeof__(*(__ptr)) __ret;					\
 									\
@@ -331,7 +331,7 @@ union __u128_halves {
 
 #define __arch_cmpxchg128(p, o, n, cas_sfx)					\
 ({										\
-	__typeof__(*(p)) __o = (o);                                             \
+	__typeof__(*(p)) __o = (__typeof__(*(p)))(o);                           \
 	union __u128_halves __hn = { .full = (n) };				\
 	union __u128_halves __ho = { .full = (__o) };				\
 	register unsigned long t1 asm ("t1") = __hn.low;			\
diff --git a/arch/sh/include/asm/cmpxchg.h b/arch/sh/include/asm/cmpxchg.h
index 1e5dc5ccf7bf..7fb9214d246f 100644
--- a/arch/sh/include/asm/cmpxchg.h
+++ b/arch/sh/include/asm/cmpxchg.h
@@ -68,7 +68,7 @@ static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
 
 #define arch_cmpxchg(ptr,o,n)						 \
   ({									 \
-     __typeof__(*(ptr)) _o_ = (o);					 \
+     __typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);			 \
      __typeof__(*(ptr)) _n_ = (n);					 \
      (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
 				    (unsigned long)_n_, sizeof(*(ptr))); \
diff --git a/arch/sparc/include/asm/cmpxchg_32.h b/arch/sparc/include/asm/cmpxchg_32.h
index 8c1a3ca34eeb..f733bd5b5d3b 100644
--- a/arch/sparc/include/asm/cmpxchg_32.h
+++ b/arch/sparc/include/asm/cmpxchg_32.h
@@ -55,7 +55,7 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new_, int size)
 
 #define arch_cmpxchg(ptr, o, n)						\
 ({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
+	__typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);		\
 	__typeof__(*(ptr)) _n_ = (n);					\
 	(__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,	\
 			(unsigned long)_n_, sizeof(*(ptr)));		\
diff --git a/arch/sparc/include/asm/cmpxchg_64.h b/arch/sparc/include/asm/cmpxchg_64.h
index 3de25262c411..4a9ccf80487a 100644
--- a/arch/sparc/include/asm/cmpxchg_64.h
+++ b/arch/sparc/include/asm/cmpxchg_64.h
@@ -170,7 +170,7 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
 
 #define arch_cmpxchg(ptr,o,n)						 \
   ({									 \
-     __typeof__(*(ptr)) _o_ = (o);					 \
+     __typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);			 \
      __typeof__(*(ptr)) _n_ = (n);					 \
      (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
 				    (unsigned long)_n_, sizeof(*(ptr))); \
diff --git a/arch/x86/include/asm/cmpxchg.h b/arch/x86/include/asm/cmpxchg.h
index a88b06f1c35e..a7984842c58a 100644
--- a/arch/x86/include/asm/cmpxchg.h
+++ b/arch/x86/include/asm/cmpxchg.h
@@ -85,7 +85,7 @@ extern void __add_wrong_size(void)
 #define __raw_cmpxchg(ptr, old, new, size, lock)			\
 ({									\
 	__typeof__(*(ptr)) __ret;					\
-	__typeof__(*(ptr)) __old = (old);				\
+	__typeof__(*(ptr)) __old = (__typeof__(*(ptr)))(old);		\
 	__typeof__(*(ptr)) __new = (new);				\
 	switch (size) {							\
 	case __X86_CASE_B:						\
diff --git a/arch/xtensa/include/asm/cmpxchg.h b/arch/xtensa/include/asm/cmpxchg.h
index b6db4838b175..0f68eddb6d2d 100644
--- a/arch/xtensa/include/asm/cmpxchg.h
+++ b/arch/xtensa/include/asm/cmpxchg.h
@@ -83,7 +83,7 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
 }
 
 #define arch_cmpxchg(ptr,o,n)						      \
-	({ __typeof__(*(ptr)) _o_ = (o);				      \
+	({ __typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);		      \
 	   __typeof__(*(ptr)) _n_ = (n);				      \
 	   (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,	      \
 	   			        (unsigned long)_n_, sizeof (*(ptr))); \
diff --git a/tools/arch/x86/include/asm/cmpxchg.h b/tools/arch/x86/include/asm/cmpxchg.h
index 0ed9ca2766ad..b71938db9422 100644
--- a/tools/arch/x86/include/asm/cmpxchg.h
+++ b/tools/arch/x86/include/asm/cmpxchg.h
@@ -35,7 +35,7 @@ extern void __cmpxchg_wrong_size(void)
 #define __raw_cmpxchg(ptr, old, new, size, lock)			\
 ({									\
 	__typeof__(*(ptr)) __ret;					\
-	__typeof__(*(ptr)) __old = (old);				\
+	__typeof__(*(ptr)) __old = (__typeof__(*(ptr)))(old);		\
 	__typeof__(*(ptr)) __new = (new);				\
 	switch (size) {							\
 	case __X86_CASE_B:						\

---
base-commit: 48b3cd69265f346f64b93064723492da46206e9b
change-id: 20260402-cmpxchg-2fd307f44a41

Best regards,
-- 
Hangbin Liu <liuhangbin@gmail.com>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
