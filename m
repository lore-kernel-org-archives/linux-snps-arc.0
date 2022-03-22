Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB126C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Mar 2022 19:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P5yaZQ1C565MkfQ51e1QNjZFkTe5N5xlQWTJNiqHaz0=; b=d3+JAKf1xQ8wvo
	nbebKzToNc78cIxpubIJN5W003/sL0bp3J0iQmOaNa4Z+Ap7QVmRzr3WUUixthu5GVo3iIbdOaSel
	JCnuSaICFwhJ27DmbtZipv3qeLmaNtW30NG8qHPD4Yzhztvvwg4y8dwDSB5KfSIOQqp+Gic1EUKYQ
	GS77nwfxs2LJiEjOxBG7nLLgzs9b0zLzwDMK2hGekTjaXA5gToaZCGP5hbYIblNrVvBC0gPmgI3uh
	ulA7fkRN03SebaasyHk71sLCpYk51iaBnHEX44gwETkSaf3vYcVCV1YO4vNJfzqzshI/ATosMu30O
	7+OiXaVyb7PigEBHtxpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWkVX-00C36I-BK; Tue, 22 Mar 2022 19:49:31 +0000
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWkVU-00C35Y-SH
 for linux-snps-arc@lists.infradead.org; Tue, 22 Mar 2022 19:49:30 +0000
Received: from pop-os.home ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id WkV8nBW5DIQAdWkV8n8jiu; Tue, 22 Mar 2022 20:49:22 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 22 Mar 2022 20:49:22 +0100
X-ME-IP: 90.126.236.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-snps-arc@lists.infradead.org
Subject: [PATCH] ARC: Remove a redundant memset()
Date: Tue, 22 Mar 2022 20:49:05 +0100
Message-Id: <98e53b48968d3c29be44f6a302a04e64e5b59f08.1647978533.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_124929_095488_7037A767 
X-CRM114-Status: UNSURE (   7.69  )
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

disasm_instr() already call memset(0) on its 2nd argument, so there is no
need to clear it explicitly before calling this function.

Remove the redundant memset().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/arc/kernel/disasm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arc/kernel/disasm.c b/arch/arc/kernel/disasm.c
index 03f8b1be0c3a..e9f16d9e113f 100644
--- a/arch/arc/kernel/disasm.c
+++ b/arch/arc/kernel/disasm.c
@@ -503,7 +503,6 @@ int __kprobes disasm_next_pc(unsigned long pc, struct pt_regs *regs,
 {
 	struct disasm_state instr;
 
-	memset(&instr, 0, sizeof(struct disasm_state));
 	disasm_instr(pc, &instr, 0, regs, cregs);
 
 	*next_pc = pc + instr.instr_len;
-- 
2.32.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
