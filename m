Return-Path: <SRS0=rV/3=K6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609BEC07E94
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 07:10:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3242661418
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 07:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3242661418
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mICI+F4etr58wSC6x86SWZuv0dEC10tRga3hK8AjXgg=; b=V1wcrDYlfCo7F7
	oWmjzxEjUJLWG2JyTwM1T5CfQtQPsh4h/llkH5BhfJ3gi/S5DbyRcBTkW5ek8KNZilBVXPEOcFrd4
	LR5ah80lO327wAJZ3wA2GfCCMpdfA8FWe/wkkWuTA20+RDMxb9YG3p+pJglEcpFBr5YxnYpT04Ksu
	RVMRQpQQrMn/NBT3X85/5ELQVw/FQyDr9PNfXmQYwogrBpFPXFcWWiblVgule/7qvrXxgLsrXjkbJ
	qOQ9qsVyVncX7XWR9r7etfbVZoKUt7p8ME5jaEZjzVjn8ATC6n5CSPSDtRvSSyFyVEg9eDbXve+xi
	jzln9d5UQJU2C9lS+ISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp3yR-00BxT4-0e; Fri, 04 Jun 2021 07:10:31 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp3mM-00BsEQ-FE; Fri, 04 Jun 2021 06:58:05 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FxD5C6GFvz64vH;
 Fri,  4 Jun 2021 14:54:07 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 14:57:54 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 14:57:53 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mm@kvack.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 <linux-snps-arc@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-csky@vger.kernel.org>, <uclinux-h8-devel@lists.sourceforge.jp>,
 <linux-m68k@lists.linux-m68k.org>, <openrisc@lists.librecores.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
 <linux-sh@vger.kernel.org>, <linux-s390@vger.kernel.org>, <x86@kernel.org>
Subject: [PATCH v2 01/15] mm: add setup_initial_init_mm() helper
Date: Fri, 4 Jun 2021 15:06:19 +0800
Message-ID: <20210604070633.32363-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_235802_758310_CFC0B310 
X-CRM114-Status: UNSURE (   7.66  )
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

Add setup_initial_init_mm() helper to setup kernel text,
data and brk.

Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: uclinux-h8-devel@lists.sourceforge.jp
Cc: linux-m68k@lists.linux-m68k.org
Cc: openrisc@lists.librecores.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-sh@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: x86@kernel.org
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 include/linux/mm_types.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 5aacc1c10a45..e1d2429089a4 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -572,6 +572,14 @@ struct mm_struct {
 };
 
 extern struct mm_struct init_mm;
+static inline void setup_initial_init_mm(void *start_code, void *end_code,
+					 void *end_data, void *brk)
+{
+	init_mm.start_code = (unsigned long)start_code;
+	init_mm.end_code = (unsigned long)end_code;
+	init_mm.end_data = (unsigned long)end_data;
+	init_mm.brk = (unsigned long)brk;
+}
 
 /* Pointer magic because the dynamic array size confuses some compilers. */
 static inline void mm_init_cpumask(struct mm_struct *mm)
-- 
2.26.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
