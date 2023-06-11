Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4D0C7EE43
	for <linux-snps-arc@archiver.kernel.org>; Sun, 11 Jun 2023 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2b7xR7jxbM/wcuHaNMaTLlkMuNK2wZDEHMBvMRJXKY=; b=EwqwAgDjb7tNmo
	MvpPzQZCRRLdP7CIb/uLlAS9lmsqj6EwF5wc4pHzSddWxENq1EZekGQglkAI6QoPxYOGSUUSluLyt
	tvJtqwtu1ibBgTO5Tmf+nvtrkEn1vQOOCEN/9PjIadso/5ZBxVw+30Keoi4c6K9ZjuRTfTvWoVfwc
	+VaFuPs/+HQRkHP9BGJNVlA6UBOpM04L9G1sKCoRzqNTH+Hs5o8KQ01sbkXxJbDm8kzeWgkoOvsey
	Ru+RF9EznVQ7pGwMbKCqV2TckZvwPAxxh6oiAAblUj9CU6eHE3+Ej3krU9dMpyvQFV0hO+FKpik+X
	g6z8xc7ExTDgONnwPbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NLV-001GKx-0I;
	Sun, 11 Jun 2023 15:51:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NLS-001GJv-2e
	for linux-snps-arc@lists.infradead.org;
	Sun, 11 Jun 2023 15:51:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC7CC6111F;
	Sun, 11 Jun 2023 15:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B82C4339E;
	Sun, 11 Jun 2023 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686498669;
	bh=ohH8mqMz+mXglbA45Ds1jfSagXOIlvRutfQtwCUj3/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ic2i57gZYwIfogDlu4RmI5E2wOnHoEnzliq3mGLWE6seXUTZ20FF9XYZxw6zKt/pj
	 ri1meBiMMfM/4IIXQmdXsggVpZY9i7PPdlx4RBHNkzCxE++HAbeBNORXVBqkvS69mj
	 JW6i67J7nAuwIMilYmDd7ZApCZ1+iQlHOC1qv8oOMP2PJS952GyiHbxPFzWaDLuqNB
	 QVeMAOokTu9PxQK7n8P9mATF20SykM+Ced+47w7pyUcWMyiGCeGJ3u0QnaWHEour0j
	 LUSDM2INF3MTsPTP4bXnCdXZl77OaAdleOZ4O63KizsI6SY7NJS6fn3eazbggHI+as
	 YMMvep96YmzVw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-snps-arc@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v9 01/11] ARC: define ASM_NL and __ALIGN(_STR) outside #ifdef __ASSEMBLY__ guard
Date: Mon, 12 Jun 2023 00:50:50 +0900
Message-Id: <20230611155100.2553804-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611155100.2553804-1-masahiroy@kernel.org>
References: <20230611155100.2553804-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_085110_904403_32571B09 
X-CRM114-Status: GOOD (  13.78  )
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

ASM_NL is useful not only in *.S files but also in .c files for using
inline assembler in C code.

On ARC, however, ASM_NL is evaluated inconsistently. It is expanded to
a backquote (`) in *.S files, but a semicolon (;) in *.c files because
arch/arc/include/asm/linkage.h defines it inside #ifdef __ASSEMBLY__,
so the definition for C code falls back to the default value defined in
include/linux/linkage.h.

If ASM_NL is used in inline assembler in .c files, it will result in
wrong assembly code because a semicolon is not an instruction separator,
but the start of a comment for ARC.

Move ASM_NL (also __ALIGN and __ALIGN_STR) out of the #ifdef.

Fixes: 9df62f054406 ("arch: use ASM_NL instead of ';' for assembler new line character in the macro")
Fixes: 8d92e992a785 ("ARC: define __ALIGN_STR and __ALIGN symbols for ARC")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v9:
  - New patch

 arch/arc/include/asm/linkage.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arc/include/asm/linkage.h b/arch/arc/include/asm/linkage.h
index c9434ff3aa4c..8a3fb71e9cfa 100644
--- a/arch/arc/include/asm/linkage.h
+++ b/arch/arc/include/asm/linkage.h
@@ -8,6 +8,10 @@
 
 #include <asm/dwarf.h>
 
+#define ASM_NL		 `	/* use '`' to mark new line in macro */
+#define __ALIGN		.align 4
+#define __ALIGN_STR	__stringify(__ALIGN)
+
 #ifdef __ASSEMBLY__
 
 .macro ST2 e, o, off
@@ -28,10 +32,6 @@
 #endif
 .endm
 
-#define ASM_NL		 `	/* use '`' to mark new line in macro */
-#define __ALIGN		.align 4
-#define __ALIGN_STR	__stringify(__ALIGN)
-
 /* annotation for data we want in DCCM - if enabled in .config */
 .macro ARCFP_DATA nm
 #ifdef CONFIG_ARC_HAS_DCCM
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
