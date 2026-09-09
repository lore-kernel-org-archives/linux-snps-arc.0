Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFCEC79F8C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2026 04:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mm28XX5IDWFOhd+ocGts8sHrCHIZWdRF+IXIHY0cOKE=; b=1BRZAsxiZR7Eyq
	n3NzHO/id5gnnYA49bLXcoyHXk8ge6Roj4oahh6THQ2yq+ewjX/SO8WDCPBviFYAXyJ7ruJtmiJ7z
	Eoro+4vNqL7qP4A3WAL71rcLFXK5j6jl9ImAtsjTgpE4pjgHdtAQ8M61agIWT0FuDIPmvx+PoeXzZ
	9JpQ49dzrygr9QZnsJ+GrczUWzSAw3s3/dU896u4yoWnwKorysudqWqBVuuKRQRe1C4ipy5ZZhFe6
	6fo/k5QTfyBxpDse2p0PEC/5W/CcWvoU/W+HsYF8c1I+5HVwSsi5TGlT+hTJl2fyEgh2wNkw1kcxj
	ErJL8fFUATlnh1zPbkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4A9Y-0000000AlW9-3igV;
	Wed, 09 Sep 2026 04:43:20 +0000
Received: from out162-62-57-137.mail.qq.com ([162.62.57.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4A9W-0000000AlVO-0fig
	for linux-snps-arc@lists.infradead.org;
	Wed, 09 Sep 2026 04:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788928989; bh=lH5IXN2ceBcHMTHqBV+AIVgEgQN9eNu+ZHV3+2w5mx0=;
	h=From:To:Cc:Subject:Date;
	b=kQ8fVcJHu4FE3zZ6UA1hN55+P4PxvSbzdtLMc+rZ2EI0MZNyz+Mu2soFpOO7BkkNx
	 aBwPIq1sQK64q5bAjPlVeQFMHc8KoPB1HRcUSN0xzHHisUeCDiZm1uTq/Vv9d33iXg
	 QbnA0SEiX22G4CiicdskODrOs4PwCHIovHa2BcTc=
Received: from LAPTOP-7R15B00L ([183.220.99.26])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id AC607059; Wed, 09 Sep 2026 12:43:06 +0800
X-QQ-mid: xmsmtpt1788928986tmhcx1u2r
Message-ID: <tencent_0F7ECDD4429624B3213BD758BED2F788490A@qq.com>
X-QQ-XMAILINFO: MvkQ4+1sQve7ZBBNo/VzFgtVOuGjkPOFpk6XnbAZ5bKKusMwGb4E3wMRl3nMSu
	 3psG7ih7dEvl/qigeqeONwGIvUWxNZ/YugjQhQ3QD5zsdJeYGkY13KUYf7klzbmf8wQ+tWaA3o3m
	 abZxj6uyMzJZisWvFbEX+Q7Usi8i42TMrPO8wRrZ3DvGwVt0KqbrUzVLJ5Sgx8OmjLstln2NskOn
	 G2Tpf+u3zN5J5A7SmS356LKNtAdLDLtOa8hm25Gf1pPZXh/pKAa8un7j/wzcJdAwI7lLo+MNo2vr
	 zBYKzGk2BRvYs5HxxG2VsXpGy9mJKDgeKlytfz8jtkVL41qcKZ3ytXilImglntOhkj4Oo+GOurct
	 FE1gGSEBAUeoBupmZGcz0/JFE6B0atxDgglCytizhl2SgDmqbs4XcxFhvxiEcdPhqD/tujGHEO7w
	 pbJR1yxHpeiwYbUi3b3nyCqkc9zMlHBJffNyQZ8KHkxlmm76bGwVaNGSTWFOmV8sjG1lG5TWgc8I
	 fjM4BFjLNCau8AgZ1Ql0IV2lniajNWdv4gsEDW1SIWQK5nmLhqERsRhpZQ3jtiKZbM9641+1RIsl
	 YkgbxjFyQLC1/QGB2oXrSYqD5jum4pJ+q/8UvxwE8tgEtrCbTy8RAk6LPcuevTBQJDP6saOzpIIZ
	 AA3yiLielIjJ3+H7dI2BWQ7eF+BsRo52YvtNQhlv/PNHyZT0iGZLZILjTB7SE+4P1aJqJvaNEqA/
	 H8lNyZmbGWdcIok03mU+li5ZjHBOGmFg6ydjmkeyg4eZlJO3bTOZdF4sI5uQcJrE8zm4VNngKXkW
	 cQf50x0POwQJdSt6wr0ls+9yk9Vz+G6EpusNkgFbx8sq40sLt4Wem0S8Btu3hiFLH+3uyHs1GKWp
	 eLXIc8JUVArHUW5tYsSys1vF9ZJ9tNH660lYysb32eaf49bsvyNG9J7TBivDG4efM4769bAMdF10
	 iL4Ynnphtz3xvuB1jQrf47FpNVR3hKlD2fz66K0XcrTI6m+D11lQsdtDZbXParrs5+Kz4vIH/Ymj
	 rz8YZK57hIQ62pDgPMPgxCW/q4zSMNixWOtO20l9yKcoNXhz8yjJ92xYS9vG+/3jvPWGSoOuC4nF
	 FHuLG2WwXswJbBrns=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: blaze <1466528493@qq.com>
To: vgupta@kernel.org
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	blaze <1466528493@qq.com>
Subject: [PATCH] arc: kernel: Fix clk reference leak in show_cpuinfo()
Date: Wed,  9 Sep 2026 12:42:59 +0800
X-OQ-MSGID: <20260909044259.1754-1-1466528493@qq.com>
X-Mailer: git-send-email 2.53.0.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_214318_889642_F660E797 
X-CRM114-Status: UNSURE (   9.04  )
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

In show_cpuinfo(), clk_get() acquires a reference to the CPU clock, but
clk_put() is never called to release it. Since show_cpuinfo() is the
seq_file show callback for /proc/cpuinfo, this causes a clock reference
count leak every time /proc/cpuinfo is read.

The frequency is extracted via clk_get_rate() into a local variable, so
the clock reference can be safely released immediately after.

Fix this by calling clk_put(cpu_clk) right after clk_get_rate().

Fixes: 98f2892607c5 ("ARC: [cpuinfo] Add clk info in /proc/cpuinfo")
Signed-off-by: blaze <1466528493@qq.com>
---
 arch/arc/kernel/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 0000000..1111111 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -593,6 +593,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 				   cpu_id);
 	} else {
 		freq = clk_get_rate(cpu_clk);
+		clk_put(cpu_clk);
 	}
 	if (freq)
 		seq_printf(m, "CPU speed\t: %lu.%02lu Mhz\n",
--
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
