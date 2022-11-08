Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C766FC43217
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Nov 2022 13:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EVv8+x6sQPbWT+ZnXJ6BQj1lBSkqqpOxZA31VPezW/o=; b=xZYy9uQaWKnFHd
	Z3Ds4S7yx7KLlCx+cGiO3ZAf/WVaeh2UFzkgj5NMuFwLNNQMHl5W9xKMEmHOP58nbIZo9u6rNzHu1
	FltUs350MqC5+KyWadGctAVlOfAx8LG0LuGM4oo4jSBzsk3FBaJX4Uc5+hU241dhTCR9SxCsy21jq
	MSoV+3DkBoC83O6iLcqlzbIYbhVHarEmtTVFxiB29tIKi7rzi5kNTsAxfjEotO4AU+6XvagaoCSdU
	KaO0o1uKkUIVgrL6PUx7bCZco3Ygih7ET08m8XO92FEuI8Rid0MV1d8505cWi6RCFBZlaVvPoaSId
	BMHR68xMuax6D5x6sUyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOtT-005gXU-4w; Tue, 08 Nov 2022 13:43:59 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOtQ-005gVf-07
	for linux-snps-arc@lists.infradead.org; Tue, 08 Nov 2022 13:43:57 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N68PW4N4jzHqLF;
	Tue,  8 Nov 2022 21:40:47 +0800 (CST)
Received: from dggpemm500008.china.huawei.com (7.185.36.136) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 21:43:47 +0800
Received: from huawei.com (10.67.174.191) by dggpemm500008.china.huawei.com
 (7.185.36.136) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 8 Nov
 2022 21:43:47 +0800
From: Chen Hui <judy.chenhui@huawei.com>
To: <vgupta@kernel.org>, <Vladislav.Zakharov@synopsys.com>
CC: <linux-snps-arc@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<judy.chenhui@huawei.com>
Subject: [PATCH] arch: arc: Fix memory leak in show_cpuinfo()
Date: Tue, 8 Nov 2022 22:12:41 +0800
Message-ID: <20221108141241.42007-1-judy.chenhui@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.191]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500008.china.huawei.com (7.185.36.136)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_054356_241491_D89F06E5 
X-CRM114-Status: UNSURE (   7.11  )
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

The "cpu_clk" resource is malloced by clk_get(),
it is not released when the function return.

Fixes: 7f35144cea21 ("ARC: get rate from clk driver instead of reading device tree")
Signed-off-by: Chen Hui <judy.chenhui@huawei.com>
---
 arch/arc/kernel/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 41f07b3e594e..9457c7ad8707 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -637,6 +637,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 			   cpu_id);
 	} else {
 		freq = clk_get_rate(cpu_clk);
+		clk_put(cpu_clk);
 	}
 	if (freq)
 		seq_printf(m, "CPU speed\t: %lu.%02lu Mhz\n",
-- 
2.17.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
