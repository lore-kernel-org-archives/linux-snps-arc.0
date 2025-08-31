Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640A5CA0FFE
	for <linux-snps-arc@archiver.kernel.org>; Sun, 31 Aug 2025 02:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E0JZ1FzJCvFr/pI0Y/deBZVIef1lwuJnu+zWWYt3goE=; b=vMbvR3B3VKnMYg
	CMt55RgFszIwWZhuQY9ABIvl2Rw65yyw3bbnIuVS7XM9al8AN2oaLsgiw/5ybdonJSEbIangsppy7
	t6D9W1UBbaunmVemy3Taa3mmDY50V46eZnKUr6yf4tSADnhl00KTy2+VuGWV8reZaBuHit3R3g0mZ
	h5IDHiCb6/plLm2GzEqgWHF6S4xB6OlNrr5UE/+AhkJNNW4OIO+uadVc+5zy+tnQYFeRkih1s/KYP
	QcV4Ve6MyGJUhB6mUsusxDGFmZ6C86ytVdXtUwHLsSubmmOPf+Dp6/PAof15XRkI7YKvxtbZcPWyJ
	C/UY+Bip5a4Onv0obQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usXoG-00000008odx-3WPj;
	Sun, 31 Aug 2025 02:28:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usXja-00000008nP4-3d8w
	for linux-snps-arc@lists.infradead.org;
	Sun, 31 Aug 2025 02:23:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 840EC601A7;
	Sun, 31 Aug 2025 02:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34929C4CEEB;
	Sun, 31 Aug 2025 02:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756607036;
	bh=QY+f+HqL7N0KVufxdAS9SBjt9GAPYlHKLVQxyLvCaMc=;
	h=From:To:Cc:Subject:Date:From;
	b=o8Si7Gnt6ZuN7xodmjugjqU6kz6F8MvjVBX8il20JsGzqFFx3tZVeOtczyDmhoQ2F
	 Kbfml7DY/iOBvBhmQ/CVFwo75xhouBEJa7ClAxXCK21a4IOzsDlUqrgxYKg4K4JoBb
	 NXh+YXabf7RISM3AWSjr5E8OKFqfzDzaje/4XccYX3Ikr4BEE5zUyJFdEvctl2pUfs
	 rR9tvDQmuyOWjptphylOmrC6hT/I6pz72puJEosqLauj2tOyJ3gpvbq2un4crbmQWi
	 nNzdzk8c9TplJfVznmb4Cp3jkKYeQttnDWWZL14o5g2ju7ab2sbFm2s4H2A5iiuRS1
	 dM5EhSuLQCeng==
From: Kees Cook <kees@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] arc: Fix __fls() const-foldability via __builtin_clzl()
Date: Sat, 30 Aug 2025 19:23:53 -0700
Message-Id: <20250831022352.it.055-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2452; i=kees@kernel.org; h=from:subject:message-id; bh=QY+f+HqL7N0KVufxdAS9SBjt9GAPYlHKLVQxyLvCaMc=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmbN1ksCfpj2HxijuWzN0bihen7c97kM6xgN+BlFO3z5 3v1VLC7o5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCJH+hkZmpa+62KwOpTOJJ21 vkZeSD+98DH3XrdQ06LjJqpxrSsSGBk6NThnTWyxOZcXW1cjoXyp/VHzki8f/yad+Lz97uF5SdM YAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

While tracking down a problem where constant expressions used by
BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
initializer was convincing the compiler that it couldn't track the state
of the prior statically initialized value. Tracing this down found that
ffs() was used in the initializer macro, but since it wasn't marked with
__attribute__const__, the compiler had to assume the function might
change variable states as a side-effect (which is not true for ffs(),
which provides deterministic math results).

For arc architecture with CONFIG_ISA_ARCV2=y, the __fls() function
uses __builtin_arc_fls() which lacks GCC's const attribute, preventing
compile-time constant folding, and KUnit testing of ffs/fls fails on
arc[3]. A patch[2] to GCC to solve this has been sent.

Add a fix for this by handling compile-time constants with the standard
__builtin_clzl() builtin (which has const attribute) while preserving
the optimized arc-specific builtin for runtime cases. This has the added
benefit of skipping runtime calculation of compile-time constant values.
Even with the GCC bug fixed (which is about "attribute const") this is a
good change to avoid needless runtime costs, and should be done
regardless of the state of GCC's bug.

Build tested ARCH=arc allyesconfig with GCC arc-linux 15.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Link: https://gcc.gnu.org/pipermail/gcc-patches/2025-August/693273.html
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508031025.doWxtzzc-lkp@intel.com/ [3]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 v2: clarify commit log (we want this patch regardless of GCC being fixed)
 v1: https://lore.kernel.org/lkml/20250826034354.work.684-kees@kernel.org/
---
 arch/arc/include/asm/bitops.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arc/include/asm/bitops.h b/arch/arc/include/asm/bitops.h
index 5340c2871392..df894235fdbc 100644
--- a/arch/arc/include/asm/bitops.h
+++ b/arch/arc/include/asm/bitops.h
@@ -133,6 +133,8 @@ static inline __attribute__ ((const)) int fls(unsigned int x)
  */
 static inline __attribute__ ((const)) unsigned long __fls(unsigned long x)
 {
+	if (__builtin_constant_p(x))
+		return x ? BITS_PER_LONG - 1 - __builtin_clzl(x) : 0;
 	/* FLS insn has exactly same semantics as the API */
 	return	__builtin_arc_fls(x);
 }
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
