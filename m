Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022A2C3DA6E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Dec 2023 00:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwyMBWwTGF8hApvV57Z2MxKyuv2z0lWX5AZq9AFW8m8=; b=CRO0gYd4pAhInT
	E2gun+rydIGy+3YsH2skXGy2HBujyfScV9ZJgS2OkfAnFwF+YxqAoffJnABBSK3L2fc212GBPYmsP
	C9aJifSHlSlx0l3VfLeS9AtsmxziRheni8fWnNR1+o/at+SjMcYA4/FAfXEBBfn/hYb/WJ3CyQod/
	25t6+ezx7cxy4ma9C2aqk6qksvdQcnHFUXBzEVEphvT+ZCkfpmHRExMDs12WfQgryuqJNRNRsoYhf
	BOO+0Nww+RzaI1hJEntHo697Xrd/vGc6ZOLLNjLnDQQITdqV21zbVKjmpW7RUpCKSpYpq14Tx1CZU
	f4sSJdv7ajjFzS/qjK0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHvBx-00BPuI-0e;
	Tue, 26 Dec 2023 00:21:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHvBu-00BPtC-2K
	for linux-snps-arc@lists.infradead.org;
	Tue, 26 Dec 2023 00:21:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 64C75CE0F47;
	Tue, 26 Dec 2023 00:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7951C433C8;
	Tue, 26 Dec 2023 00:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703550055;
	bh=qnBv+MA5+OSvfMweucRioK2vOvMaXE+NW2x5Nw5qGZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U6ZTP91bMB4pDNTuiR0MTaJoQ/ulQiRdFkE39gpumZqrpCeiPp1WuBFfVoix3S8uF
	 8uGkzNWHU+7poILA8ULyTJBEzgXiFe4alEjgNgo/Q3AkM+Aa3qA2aWF7eR+DPyWpHg
	 /4Z8MKtP5gJDgC7cBTjhEbY2y4+qtVu+upeqDlJiw/FHGakTJL8Or2mvw7RkPDaFMG
	 JVa4+NutOcnNZQm1DWKgP4NXcOZLsXXgOx1uZqi0pVW5LIIOHCiFRP9eUYTIBWHzn7
	 X5Bnocf/yalDsPnAzsOxzA9sUp1rNz+auV93TW/oPWqi4eCGlg8OaAe6sQGO4gCzeI
	 N4Kk783AfN32g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vineet Gupta <vgupta@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 13/39] ARC: fix smatch warning
Date: Mon, 25 Dec 2023 19:19:03 -0500
Message-ID: <20231226002021.4776-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226002021.4776-1-sashal@kernel.org>
References: <20231226002021.4776-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_162102_990040_0B524855 
X-CRM114-Status: UNSURE (   9.49  )
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

From: Vineet Gupta <vgupta@kernel.org>

[ Upstream commit 4eb69d00fe967699b9d93f7e74a990fe813e8d2b ]

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202311280906.VAIwEAfT-lkp@intel.com/
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/kernel/setup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 4dcf8589b708a..d08a5092c2b4d 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -153,7 +153,7 @@ static int arcv2_mumbojumbo(int c, struct cpuinfo_arc *info, char *buf, int len)
 {
 	int n = 0;
 #ifdef CONFIG_ISA_ARCV2
-	const char *release, *cpu_nm, *isa_nm = "ARCv2";
+	const char *release = "", *cpu_nm = "HS38", *isa_nm = "ARCv2";
 	int dual_issue = 0, dual_enb = 0, mpy_opt, present;
 	int bpu_full, bpu_cache, bpu_pred, bpu_ret_stk;
 	char mpy_nm[16], lpb_nm[32];
@@ -172,8 +172,6 @@ static int arcv2_mumbojumbo(int c, struct cpuinfo_arc *info, char *buf, int len)
 	 * releases only update it.
 	 */
 
-	cpu_nm = "HS38";
-
 	if (info->arcver > 0x50 && info->arcver <= 0x53) {
 		release = arc_hs_rel[info->arcver - 0x51].str;
 	} else {
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
