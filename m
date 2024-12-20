Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E40E7718B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2024 17:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVu5p0zpuuQnzTUcCw1d5HcVdfMs4WlBvR49DNR/WPs=; b=k0y+wIdtkkzmK3
	CCIn84TbKzO2L6t5P7qgUYmK/mDUhcUR7ge7ygCgffVQE+5pAn5lI4cJxxJG8FnCxFPSTfinw/LEO
	TyMIZzlpbKh/tUEVGKzFv8Yrs8XENn9lfJ1zPNTln3XD/OhWST2991adZHzqpynNJQMgmLrj9nK7l
	4lKM8AJs5KabZD3/InjLTIteu4mst+6DWfYMrDYJViyu0iERAxUp3bz4cC00AFPp+c1JU0ELV637U
	pg1Qseb0yWwnz0eCm+gdeZ8WqVG+9R6sZbvPrxZAqZT+nvFoR/E8qqwLLI/faP/sGhJr2JDioP3v6
	Z/Tqpf79HJQcj2HD21LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgjj-00000005d47-2J1k;
	Fri, 20 Dec 2024 17:24:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgXy-00000005aWG-1sn4
	for linux-snps-arc@lists.infradead.org;
	Fri, 20 Dec 2024 17:12:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43D93A4215E;
	Fri, 20 Dec 2024 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2A3C4CED3;
	Fri, 20 Dec 2024 17:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714737;
	bh=AR17esnEL4aZJMvnxtvUy6khYtt0uysY+yNyjEwO+6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i2tNdzMfM84fT34u9WYMKZ48lvWNAzCx0RNxl6Qv7hfgCyQ08TZlyY9bdWuY5Omug
	 mLt8U98p6vWeMKwnVW5zKxN1k2ML6qsnbKV+8ah6RsPpbXQKNindzAXIhwxRtwiF9S
	 uVu6FsWB7vfJv4xLfMOqkEfmJwGMI3wH8v26LJ6oZPqfY9gALswNMXNtxM497iPXf7
	 ze5o+MoS85Gb9xdGFHyf6RXjIPWMUHZ9FjH+SIbk9zs7pSV61mewmsuz1wGLxbd93i
	 rMYd0f+F1okHOmKMbSiwQ50q7g57yRCsZTiyQA15D1Ahr1VpX5PiBFlDSkSVyZDTgo
	 5D5YXKITlyXUg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Shahab Vahedi <list+bpf@vahedi.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	bpf@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 19/29] ARC: bpf: Correct conditional check in 'check_jmp_32'
Date: Fri, 20 Dec 2024 12:11:20 -0500
Message-Id: <20241220171130.511389-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220171130.511389-1-sashal@kernel.org>
References: <20241220171130.511389-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091218_549573_0E07A9AA 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>

[ Upstream commit 7dd9eb6ba88964b091b89855ce7d2a12405013af ]

The original code checks 'if (ARC_CC_AL)', which is always true since
ARC_CC_AL is a constant. This makes the check redundant and likely
obscures the intention of verifying whether the jump is conditional.

Updates the code to check cond == ARC_CC_AL instead, reflecting the intent
to differentiate conditional from unconditional jumps.

Suggested-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Acked-by: Shahab Vahedi <list+bpf@vahedi.org>
Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/net/bpf_jit_arcv2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/net/bpf_jit_arcv2.c b/arch/arc/net/bpf_jit_arcv2.c
index 4458e409ca0a..6d989b6d88c6 100644
--- a/arch/arc/net/bpf_jit_arcv2.c
+++ b/arch/arc/net/bpf_jit_arcv2.c
@@ -2916,7 +2916,7 @@ bool check_jmp_32(u32 curr_off, u32 targ_off, u8 cond)
 	addendum = (cond == ARC_CC_AL) ? 0 : INSN_len_normal;
 	disp = get_displacement(curr_off + addendum, targ_off);
 
-	if (ARC_CC_AL)
+	if (cond == ARC_CC_AL)
 		return is_valid_far_disp(disp);
 	else
 		return is_valid_near_disp(disp);
-- 
2.39.5


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
