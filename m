Return-Path: <SRS0=KZrG=LC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56C3C47082
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Jun 2021 08:29:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2261608FC
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Jun 2021 08:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2261608FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+HDKMGmdDcgJe6bkX7Xy2+3kudQtR55qn1U9h0JBjUc=; b=Ls5Wwvc3qEnccm
	LVkXD8i4XGDzmijBHQbt+dlwQ9cDExyjqJjhQzHbyhXsprKvHfUSL1xGVSL5wleMpy2L252gCRi0X
	H7v0ljHyfGe6XBYChPD43Fz2XzJbr+kneaAqLojQ3aPlbQ25JgwwJeeRp4NmNKDnTfj74K+8ziBgW
	8TxXLje0+c9rrAhTJ/MFvKsFbXQSzY7ipLmOuItVvVXM/EMSNY+E6pAybgv1+TyjUzj/uQBR6+w8w
	ktQ2c5+slSnOTUpTkggdLpJz1aLBPRSuSkGgGJdMA+ZrA2SA3X8K+KwgjogzgdSVmiWCfDclKLpEN
	AmhVuz+GAM6ro0RGTPaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqX7V-0078RJ-UK; Tue, 08 Jun 2021 08:29:57 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqX3m-0076j9-Su
 for linux-snps-arc@lists.infradead.org; Tue, 08 Jun 2021 08:26:09 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Fzjqg6FVtz1BK1f;
 Tue,  8 Jun 2021 16:21:03 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 16:25:54 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 16:25:53 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mm@kvack.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, "Vineet
 Gupta" <vgupta@synopsys.com>, <linux-snps-arc@lists.infradead.org>
Subject: [PATCH v3 resend 02/15] arc: convert to setup_initial_init_mm()
Date: Tue, 8 Jun 2021 16:34:05 +0800
Message-ID: <20210608083418.137226-3-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
References: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_012607_125376_471135A9 
X-CRM114-Status: UNSURE (   8.17  )
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

Use setup_initial_init_mm() helper to simplify code.

Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
Acked-by: Vineet Gupta <vgupta@synopsys.com>   #arch/arc
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/arc/mm/init.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index e2ed355438c9..33b8fab89022 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -94,10 +94,7 @@ void __init setup_arch_memory(void)
 {
 	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
 
-	init_mm.start_code = (unsigned long)_text;
-	init_mm.end_code = (unsigned long)_etext;
-	init_mm.end_data = (unsigned long)_edata;
-	init_mm.brk = (unsigned long)_end;
+	setup_initial_init_mm(_text, _etext, _edata, _end);
 
 	/* first page of system - kernel .vector starts here */
 	min_low_pfn = virt_to_pfn(CONFIG_LINUX_RAM_BASE);
-- 
2.26.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
