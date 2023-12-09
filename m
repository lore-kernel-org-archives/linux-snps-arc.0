Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC56C10F14
	for <linux-snps-arc@archiver.kernel.org>; Sat,  9 Dec 2023 00:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lwjsN8R9UNRjg8ZwQwgYzmTdocfDp114P+SKCwag9M0=; b=tTUU6KLm79fJ8n
	NrQXo16XT8jFLLSqeXYVHlgVHOkdww4EN+MIlmoQXTDX5b9UIHjUeTpLa+aihthikBYyGtclXL/na
	Q7uuufBP5prxHwphDhxD7dDNbEdCc9CfEwnr7vPvtF3sXhIFkdDvOiTcq30Oia7V9jQ+zwKyggwMU
	KFFJ1PScdJarY5p831KSwU4PKV0lxDxTakzJoAjgWb5DIhWbqhX9CVBu/V6Fc6+WKqlzAFyyGLGeX
	tKIS0Q7MtHeWv25D2tBB8Daaetg+x476AotZDeHQkUBuJ4FzjxcsAp0SYnPHUe/Z9uKTOo7hz7jqR
	eD0qk/N8V5pMQoDzNNwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlHW-00GpXZ-27;
	Sat, 09 Dec 2023 00:33:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlHQ-00GpTW-2z
	for linux-snps-arc@lists.infradead.org;
	Sat, 09 Dec 2023 00:33:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A4F04B830EC;
	Sat,  9 Dec 2023 00:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8396C43391;
	Sat,  9 Dec 2023 00:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702081995;
	bh=nrmL5xoHjNk3p/GLVRFiCPrp+mmvEptRF1wkpdCEqjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g+LukFPkH5NKEHrX4cUN8I3JVqN8W00VVlR2chiiVQTJmJdVJ6zmX/TFbi7rprHgj
	 gUEpHMMASI8d/dEyvuVy/TLtbWQTTZ1jQKFJm0r+Rm/w21xAxIcXi4spMSzXGjXSZO
	 JDCckvHKe/rLQ9ERJGi5ITJVZVq+GesEH3Un/N4a/DP00wU1OmddQAp4G0FhyO9t1l
	 VMK2OaVB2GHvKCjVz1+hispJno498EvqhbaWTKXGb8v9039+xP9FlUq5m/2V4Br1c/
	 CHQK7tu7sSahUzvyYiRAMbyk4/8IaQQMj14St2SUVd2Safm0iMXStnuxWe8htfLYRk
	 lQANr6fnQWr9g==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Pavel.Kozlov@synopsys.com,
	Vineet Gupta <vgupta@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH 5/5] ARC: fix smatch warning
Date: Fri,  8 Dec 2023 16:33:07 -0800
Message-Id: <20231209003307.480051-6-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231209003307.480051-1-vgupta@kernel.org>
References: <20231209003307.480051-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_163317_095989_9A192331 
X-CRM114-Status: UNSURE (   8.95  )
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

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202311280906.VAIwEAfT-lkp@intel.com/
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/kernel/setup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 4dcf8589b708..d08a5092c2b4 100644
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
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
