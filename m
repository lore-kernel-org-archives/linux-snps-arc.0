Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFC1CA1018
	for <linux-snps-arc@archiver.kernel.org>; Sat, 31 Aug 2024 10:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1LQE3xo0MgZ3RzJluR28J02guuUbmkjrNwi6KDgcR54=; b=u+HGhJcK5ZPaKi
	YJgN2ooReZE2Kk7zwJAKXI083l4OFGkQD1+TEZgbB9LxfY8Sv/8cBCy1UdTDzQdMXjulD+jPevRxL
	sZ2FfF4Btf3hOInelI08W1EklV27fbPR9SBsHMXEXzV+tQmyCmFI7+8W/42rQqk9lG8aMxFKlv9mf
	Jaqa3RLiYWxnceTQXAAZBydFBdFF2VW7bGFoZTGmNc+vnhaIyt27L+C1imsOaRrMTRVQ5fufITXSy
	SToq/zR1Kbr+qO54noipUVvS0/MqHcdGvHrOtLjvzXgyFssGB4amVcQ8KBE2CX7vyNmts7icXilpN
	kSktZSd8VEF2DsBrXTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skL4R-000000095uC-1FKG;
	Sat, 31 Aug 2024 10:11:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skL4O-000000095tX-1foc
	for linux-snps-arc@lists.infradead.org;
	Sat, 31 Aug 2024 10:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07F875C0FBE
	for <linux-snps-arc@lists.infradead.org>; Sat, 31 Aug 2024 10:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1985CC4CEC0;
	Sat, 31 Aug 2024 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725099058;
	bh=ENYPBa+mfsr5L1+d7LCfa9JspPswURc8zoi7eWZUPAY=;
	h=From:To:Cc:Subject:Date:From;
	b=GgG9p/vkn3pFQoUD12/y+1Rml1JtTk5aa/Pgqk9YZuBEMFrKgkax3ondaUK382N/O
	 n7uDQLcvdPaSMCp40TGrrXmYiZTRmZeIt1soM8g6QNF5n28eY3RSm3WfH6/FH5kLMk
	 5Stdc05rARGhTkrKs24G+gv5FbE63Se8aL/2fEg8Q5X8QQEXztzd7IV8ChqyG1cLge
	 n46+sbN09wpnnHx8xnqcGU6uNHSotPvuIxIhp4dv76ELcTZsR6qXydD3q6TWPHarGJ
	 7BPrCgt/N977FA/7V6CJBFJKjNVoeQEanInF/SSL1fVG6sp6SQ0mTjsEJwrwdCQ/tD
	 uKjn+Jko1qemQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] ARC: update the help message for CONFIG_ARC_BUILTIN_DTB_NAME
Date: Sat, 31 Aug 2024 19:10:28 +0900
Message-ID: <20240831101045.1381258-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_031100_506033_53E8717D 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

Commit abe11ddea1d7 ("ARC: [plat-arcfpga]: Enabling DeviceTree for
Angel4 board") changed the default built-in DTB from "skeleton" to
"angel4".

Commit fd1557923b2e ("ARC: [plat_arcfpga]->[plat_sim]") changed it
from "angel4" to "nsim_70".

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index fd0b0a0d4686..d01e69a29b69 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -553,7 +553,7 @@ config ARC_BUILTIN_DTB_NAME
 	string "Built in DTB"
 	help
 	  Set the name of the DTB to embed in the vmlinux binary
-	  Leaving it blank selects the minimal "skeleton" dtb
+	  Leaving it blank selects the "nsim_700" dtb.
 
 endmenu	 # "ARC Architecture Configuration"
 
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
