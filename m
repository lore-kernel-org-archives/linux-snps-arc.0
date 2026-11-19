Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBE760A261A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Nov 2026 06:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EA78lEA+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HsKslM7v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ero5Vs+85NN8HHNC/g0JtojY41QK0ZtCNC05gTb0tgk=; b=EA78lEA+whr42T6OoEjtQ63T2w
	Q7N/2Lft5/MB8CVyXpKr6UzHXWFWDbDnfx+Ektt8PLIyK+hLtOzhojmAjWi2hr8d8J38SuaDcz9gp
	aUg38RYGwNf0634C42QHpxq5zElfQhGfp2fTN3iKjLB6z0czslN5C34gQg4umrIOsft+OspToNave
	V6N1pN9R6W59oTiKxHM7pWb0bFfaCeJgyaxLTjAQdmnnkSTYx3D3cv9VmAmXcKm7kPUGH1Sw57U+/
	V1x0cZPZtFxlaQaH4DA9AYVMV6U8inqdcr3ANYhA6yMOwFTw5y6NBjF76Pi2ogkrjzN30tZiMHj3J
	d1zOt/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvBl-0000000AxKI-0Zyr;
	Thu, 19 Nov 2026 06:00:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvBj-0000000AxJZ-3qYF
	for linux-snps-arc@lists.infradead.org;
	Thu, 19 Nov 2026 06:00:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AAAE24039E;
	Thu, 19 Nov 2026 06:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB091F000C7;
	Thu, 19 Nov 2026 06:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795068003;
	bh=d8fMnFA2+FUR78qV2kHlRazBFSTAz7DuxJQu4dXifxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HsKslM7vU5YeXDw+LVRg9aZxdXuvrDw9hXroxKfeEVZfgmQhSVPBGRoPK2VXvYwu8
	 umDguwh2OvTmxdfahpb3kVXiSzhjdE76LGxlf1a6Cw9Ob/eQ9t/fniZf/M4UP6+g+2
	 R5eU1GNkcplJVAUwiicFL2dzCDcppLcKDLyrxOA/+lDtNHM8w1trvpszOX66TGDAH9
	 lTKZG1PAAeWcAsyXpu2DqbI4LrMI3xUIPlBX7+zghhsxkZCl7vDelcmnGyvCiFWEC2
	 osAdiVa0qIX4UwkskeP4ugmPwZW0xSFDFA4Te4oh2Ig4ikS85Bd+Qtf86WTeFcFlwu
	 zgp5IWuIVsqPA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 1/4] ARC: math emul: elide 64/64 divide and floating point routines
Date: Wed, 18 Nov 2026 21:59:55 -0800
Message-ID: <20261119055958.1621709-2-vgupta@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119055958.1621709-1-vgupta@kernel.org>
References: <20261119055958.1621709-1-vgupta@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

64/63 divide are not needed in 32-bit kernels.
FP shouldn't be needed at all.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/kernel/arcksyms.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arc/kernel/arcksyms.c b/arch/arc/kernel/arcksyms.c
index 8851c0a19e09..c22055e66cfe 100644
--- a/arch/arc/kernel/arcksyms.c
+++ b/arch/arc/kernel/arcksyms.c
@@ -11,7 +11,6 @@
 extern void __ashldi3(void);
 extern void __ashrdi3(void);
 extern void __divsi3(void);
-extern void __divsf3(void);
 extern void __lshrdi3(void);
 extern void __modsi3(void);
 extern void __muldi3(void);
@@ -19,17 +18,10 @@ extern void __ucmpdi2(void);
 extern void __udivsi3(void);
 extern void __umodsi3(void);
 extern void __cmpdi2(void);
-extern void __fixunsdfsi(void);
-extern void __muldf3(void);
-extern void __divdf3(void);
-extern void __floatunsidf(void);
-extern void __floatunsisf(void);
-extern void __udivdi3(void);
 
 EXPORT_SYMBOL(__ashldi3);
 EXPORT_SYMBOL(__ashrdi3);
 EXPORT_SYMBOL(__divsi3);
-EXPORT_SYMBOL(__divsf3);
 EXPORT_SYMBOL(__lshrdi3);
 EXPORT_SYMBOL(__modsi3);
 EXPORT_SYMBOL(__muldi3);
@@ -37,12 +29,6 @@ EXPORT_SYMBOL(__ucmpdi2);
 EXPORT_SYMBOL(__udivsi3);
 EXPORT_SYMBOL(__umodsi3);
 EXPORT_SYMBOL(__cmpdi2);
-EXPORT_SYMBOL(__fixunsdfsi);
-EXPORT_SYMBOL(__muldf3);
-EXPORT_SYMBOL(__divdf3);
-EXPORT_SYMBOL(__floatunsidf);
-EXPORT_SYMBOL(__floatunsisf);
-EXPORT_SYMBOL(__udivdi3);
 
 /* ARC optimised assembler routines */
 EXPORT_SYMBOL(memset);
-- 
2.53.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
