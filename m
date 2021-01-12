Return-Path: <SRS0=SdQC=GP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA45C433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 13:01:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EA532311E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 13:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EA532311E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d4rocdgDLPXFPRryI0iPpF5rhWuufSdEloV3nzQNdhY=; b=2oYl3g2yWpYrRZJmK+TfnN5Ju
	WtQUCfEKK80l9QKA7DAyM5oWkIEMjka3BgQK2aHDEZuqAUblIpEiSDTplaezfzZGpbfGnGdwKS8Qt
	uVw8Sr1iUo9fc0lRBli8cBxGWB3L/SBWtP3AcTrN9S84OEAum1s3QyUWxEVQaZS90UuR39oV7BdCf
	f7rz3p08h/EpTOUvuD7fXl6ttqMQpB1bl+X6TapuLkUEDvJDpN25S4I4YxrOF5OvPbAZnLHvnBcNN
	IAjhBRyTzSNdlKcR57fE/Ybr0r/slKBXlsTttahv0pBY9iocgniTiAskmaZIQloEI73Z2l62DkVtI
	eYDOdnXHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzJIr-000315-TR; Tue, 12 Jan 2021 13:01:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzJFn-0001PX-HW
 for linux-snps-arc@lists.infradead.org; Tue, 12 Jan 2021 12:58:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D35C22312F;
 Tue, 12 Jan 2021 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456310;
 bh=0xLiq19uuF+LFA0yw7Rwauxqd1irVWHtnuE67K59/lY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b8O+IFZDV1mhk5XsTsWbLrW1xzrSVYxvK5blw0fJPWOYpStCe3DCIq7EXWLyLxolN
 TLMwQfBVojPJMLN9JxABbmBux71bYXWiqRGUpVBKyaKjN3hBfImirfcsTX4oH+j2ru
 NjHhomzM0c8ys/od7truSD0S2+6XeKJDbsnP5x000hT9HFGAVLJgzYU/CLFIieWddh
 cF9uNR0cr8ARsiFzmgcVojEDTN8GkQ6qGGVIMtUaW9OAcXLdoF/mm5w9+Eul9btKCh
 DvWDBUQcBKH18yRPmjz5KQMwz+CMKgkHCylmUjpUG9h+5SMHgh9mAuDaslVTUGVmFq
 W1kWy89IcdHiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 4/8] arch/arc: add copy_user_page() to
 <asm/page.h> to fix build error on ARC
Date: Tue, 12 Jan 2021 07:58:19 -0500
Message-Id: <20210112125823.71463-4-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125823.71463-1-sashal@kernel.org>
References: <20210112125823.71463-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_075831_968145_95DC5AE4 
X-CRM114-Status: GOOD (  12.21  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Jan Kara <jack@suse.cz>,
 kernel test robot <lkp@intel.com>, linux-nvdimm@lists.01.org,
 Vineet Gupta <vgupta@synopsys.com>, Randy Dunlap <rdunlap@infradead.org>,
 Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 8a48c0a3360bf2bf4f40c980d0ec216e770e58ee ]

fs/dax.c uses copy_user_page() but ARC does not provide that interface,
resulting in a build error.

Provide copy_user_page() in <asm/page.h>.

../fs/dax.c: In function 'copy_cow_page_dax':
../fs/dax.c:702:2: error: implicit declaration of function 'copy_user_page'; did you mean 'copy_to_user_page'? [-Werror=implicit-function-declaration]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
Cc: Dan Williams <dan.j.williams@intel.com>
#Acked-by: Vineet Gupta <vgupta@synopsys.com> # v1
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-nvdimm@lists.01.org
#Reviewed-by: Ira Weiny <ira.weiny@intel.com> # v2
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/include/asm/page.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index 8f1145ed0046f..fd2c88ef2e2b8 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -17,6 +17,7 @@
 #define free_user_page(page, addr)	free_page(addr)
 
 #define clear_page(paddr)		memset((paddr), 0, PAGE_SIZE)
+#define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
 #define copy_page(to, from)		memcpy((to), (from), PAGE_SIZE)
 
 struct vm_area_struct;
-- 
2.27.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
