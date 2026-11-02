Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D776F606A327
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Nov 2026 02:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SsPA58hD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ut8vxLgG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VnmPJbBF/Bis6GIhjbqFnO0wVIEBq+1EyLCqotExLak=; b=SsPA58hDpKkfsP6RnxiIdbFtbL
	eVLjJfnzG1p6d9yyDYX31Hpf/lU6q0h45u/mV5hRhbYRET0IWNJB4ZbmLArdtJGiD5O6KyPvNeyAl
	XhsVmHx4YLose/gzlIb49iO5LZEeY59njGI6G14cBq11oKKG/nAPOWzFd0/IkZ11E38kvzeO7Y4hu
	81wb6K64CnMvWLU43f1xsrYw4WBXkAFsoRLCgOcd9B75a3htCkRpQrzCnS0++3uZ9qYYZjiR9nOS3
	8hgl+oYvRlfwSOKdVu9sGfJ+QeiKYj15y6121AZpjN0COozlo+w3z3dCrO/W7ErnAS8iqGsQt0iXw
	HG/pNjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNhuy-0000000FPVn-1eEC;
	Mon, 02 Nov 2026 02:37:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNhuw-0000000FPVU-2f2n
	for linux-snps-arc@lists.infradead.org;
	Mon, 02 Nov 2026 02:37:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C356B605CB;
	Mon,  2 Nov 2026 02:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F651F0093A;
	Mon,  2 Nov 2026 02:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793587021;
	bh=MxQRI3Kt0yUFkvg8lt4ycJwOdj1jWMLnHkDm0fz34to=;
	h=From:To:Cc:Subject:Date;
	b=Ut8vxLgGG1cbXn9k8x0yxABLoptmCMR0jMkR+1bYJ4bGbU7P+GIQ4ArZFZ9M3aGtf
	 9gKcmGLcHLWjxBdeXDf90lfHbcC/yHs65MIfbI3SOXeS6x/cVYFVFrX98XbyCgjXat
	 kb2Wu2dhUVmSNCXTCFhE1GxnGWKnJVgzermLT3nyBzOp+LqVoGVq0AXh7Aj/tOwOwd
	 SJ2QWrSwk6FTE+m2sgachVctyP4y0+0QlL/0UG2OXfeSLy3IhJHSDsQwgXCEuAIGQn
	 TnQbCV2rbdiAd1/WPAg+zenDtPKZg8pbiao7NHNw35tEZc9dwq4XKlDnfXu7pUFcmZ
	 rKQnaGgZ19inA==
From: Vineet Gupta <vgupta@kernel.org>
To: bpf@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Cc: Alan Maguire <alan.maguire@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH] lib/Kconfig.debug: disable CONFIG_DEBUG_INFO_BTF for ARCompact
Date: Sun,  1 Nov 2026 18:36:37 -0800
Message-ID: <20261102023638.1621622-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.53.0
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

When testing Sasha's commit ca201ad6e92a "(ARC: Strip libgcc debug
information when generating BTF)" ran into build failure for ARCompact
builds.

pahole, uses elfutils to read DWARF for generating BTF for kernel
modules. These are relocatable files so elfutils has to apply the
relocations in their .debug sections and it turns out it only handles
EM_ARCV2 (so ARCv2 relocations), not EM_ARC_COMPACT (ARC700) which is
silently ignored to produce bogus module binaries which can ultimately
lead to following errors:

  Complex, interval and imaginary float types are not supported
  Error while encoding BTF.
  FAILED: load BTF from drivers/gpu/drm/drm_panel_orientation_quirks.ko.BTF.1: No such file or directory

As for Hexagon in commit aaa2c9a97c22 ("lib/Kconfig.debug: disable
CONFIG_DEBUG_INFO_BTF for Hexagon"), don't allow DEBUG_INFO_BTF on
ARCompact. BTF is unlikely to be wanted on these older cores anyway.

Tested with elfutils 0.194 and pahole 1.31.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
Assisted-by: Claude:claude-opus-5
---
 lib/Kconfig.debug | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2d22638ec13a..5331c3649228 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -403,6 +403,8 @@ config DEBUG_INFO_BTF
 	depends on PAHOLE_VERSION >= 122
 	# pahole uses elfutils, which does not have support for Hexagon relocations
 	depends on !HEXAGON
+	# elfutils only handles ARCv2 relocations, not ARCompact ones
+	depends on !ISA_ARCOMPACT
 	help
 	  Generate deduplicated BTF type information from DWARF debug info.
 	  Turning this on requires pahole v1.22 or later, which will convert
-- 
2.53.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
