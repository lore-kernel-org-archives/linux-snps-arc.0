Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD510CA0EFA
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Aug 2025 03:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R4NtkAiX+yJlf1CC3shYcX86Z/oRX4pUOaT+hKTqCyg=; b=HOKl3Ou1245Gsb
	Fs/myx/hUZje4E7URbY9JNql+CtEJxVP3+7i5wYeNapEUHoZN++hgkxOcsnHyCD/Z8vTH5VZT2lYw
	knrT3QwRH6w9rYuVShedZMweNF6Zs00Of6Q24zIhHSODm2JwYWlrIsvuhRhvaX8PuhsbnjGOua5iP
	ZQ7PsCWLpL5X2h9wasPugNOYxcbQPdCkw3UlRsv+XgqsudyIWCcg0cNfkoY0ne1FGszOpeERmkVeD
	nBXscFVvWaK4jY29+OC8fL45f7REqLJQMRFiWlf1OhTWml6aX8D1Hx4qq49LvzgwqX8h5QW7T1Hs8
	CVLs185HrbkCBAWphoOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqkbR-0000000ASYF-0Y45;
	Tue, 26 Aug 2025 03:44:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqkbO-0000000ASXs-2MMe
	for linux-snps-arc@lists.infradead.org;
	Tue, 26 Aug 2025 03:44:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2847B5C56B8;
	Tue, 26 Aug 2025 03:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE58C4CEF1;
	Tue, 26 Aug 2025 03:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756179844;
	bh=qViKu2G3S4xLHtRgNf8GgW5zqv9/Lpel9naK3zFCNMU=;
	h=From:To:Cc:Subject:Date:From;
	b=a0buhXl3Jjdcb2R4aAtZilC57yTt2X0OQtPsV5WYI0sKem4AC+TB/8oOjKBqCNgkl
	 BD6F1gNvr9sR+WyMhQd5s+fIvuywsGIjnlOS4u0e1oHPw6HQYQA917oYeJZcaFRPXK
	 rXmcI6dE2iqe3SQsBbFoyuTUAYIQWyHNuiFUThoUHdaiR3CqD3+kefi7OoAMgkQO9Z
	 9eCzrIZoF+yX7Hb/52qY/PbTwaqCxl1w7WffAOFde/z8r01ntiUndnCzvSoK1Owt/0
	 oaMg0c7dTaoUPump4o8B28ZcZuSS32e3lwFO9g70xrsiHxZDuBI/Z1CjiQeBHOFs5p
	 7YPYDTXO2yTEA==
From: Kees Cook <kees@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] arc: Fix __fls() const-foldability via __builtin_clzl()
Date: Mon, 25 Aug 2025 20:43:58 -0700
Message-Id: <20250826034354.work.684-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2182; i=kees@kernel.org; h=from:subject:message-id; bh=qViKu2G3S4xLHtRgNf8GgW5zqv9/Lpel9naK3zFCNMU=; b=owGbwMvMwCVmps19z/KJym7G02pJDBlrdWt3LrKv3/v55yrWvjUJfq1/aj60ecWkPma7dWtH3 9zb9Wd3dpSyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAFwkieGf1rrQN5vXbnG9UMns suOD2aOLnzjFY8zzK9cziuj6G3/XZfjJqHas7VBxoqhHYlXiD+Paouxd+38dT+diZWZ7FluynZs bAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_204406_644832_B59935F5 
X-CRM114-Status: GOOD (  10.81  )
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
compile-time constant folding[2]. Fix this by handling compile-time
constants with the standard __builtin_clzl() builtin (which has const
attribute) while preserving the optimized arc-specific builtin for runtime
cases. This has the added benefit of skipping runtime calculation of
compile-time constant values.

Build tested ARCH=arc allyesconfig with GCC arc-linux 15.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Link: https://lore.kernel.org/all/202508031025.doWxtzzc-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508031025.doWxtzzc-lkp@intel.com/
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: <linux-snps-arc@lists.infradead.org>
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
