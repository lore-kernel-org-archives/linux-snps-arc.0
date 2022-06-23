Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BE2C43334
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Jun 2022 07:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X/bJcVeajccebnp1BjvB+rfjalX+Gu8YLaPSRmfZDDY=; b=zKBS1lHrWf3whv
	YE+aWva0x8cnJIFcB9GvBzmVWrNK6xKO0apxTqq8O7PRco0qOG5BJH6BaTMKRsK4GxClAJJl2olOh
	j3XnV54znUaQyUq7kv0Wr4hbAJuU860CckuBl8vYvfiY5zqsH6hFIc4cdmTYWrprE09+vqIXLgiKO
	ljP9LnAi8SZtmGnkqoRJbcG819tFNpdZpO0gX/XAzHG7/WcrWO4817QnfGjYDbcHvVA9UZv1vjtUO
	aSPMrxvp3irANrSySXv66lCRYSFd8z7d0A27qgrmqiFAZDP+eUkFO4Icvv+E8YzHGPzkwBJx80+aa
	AqQj84yz4ijBpw/ZJYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4HY2-00DvZf-3D; Thu, 23 Jun 2022 07:46:42 +0000
Received: from [2400:dd01:100f:2:72e2:84ff:fe10:5f45] (helo=mail.nfschina.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4HXz-00DvWw-Fm
	for linux-snps-arc@lists.infradead.org; Thu, 23 Jun 2022 07:46:41 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 1E9AF1E80CCC;
	Thu, 23 Jun 2022 15:46:11 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id go9QteFcLc7O; Thu, 23 Jun 2022 15:46:08 +0800 (CST)
Received: from localhost.localdomain (unknown [112.64.61.33])
	(Authenticated sender: jiaming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id A7C561E80C7D;
	Thu, 23 Jun 2022 15:46:07 +0800 (CST)
From: Zhang Jiaming <jiaming@nfschina.com>
To: vgupta@kernel.org
Cc: rppt@kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liqiong@nfschina.com,
	renyu@nfschina.com,
	Zhang Jiaming <jiaming@nfschina.com>
Subject: [PATCH] ARC: Fix spelling mistake
Date: Thu, 23 Jun 2022 15:46:23 +0800
Message-Id: <20220623074623.6584-1-jiaming@nfschina.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_004639_771026_41B76404 
X-CRM114-Status: UNSURE (   6.28  )
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

Change 'seperate' to 'separate'.

Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
---
 arch/arc/include/asm/entry-compact.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/entry-compact.h b/arch/arc/include/asm/entry-compact.h
index 5aab4f93ab8a..67ff06e15cea 100644
--- a/arch/arc/include/asm/entry-compact.h
+++ b/arch/arc/include/asm/entry-compact.h
@@ -21,7 +21,7 @@
  *      r25 contains the kernel current task ptr
  *  - Defined Stack Switching Macro to be reused in all intr/excp hdlrs
  *  - Shaved off 11 instructions from RESTORE_ALL_INT1 by using the
- *      address Write back load ld.ab instead of seperate ld/add instn
+ *      address Write back load ld.ab instead of separate ld/add instn
  *
  * Amit Bhor, Sameer Dhavale: Codito Technologies 2004
  */
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
