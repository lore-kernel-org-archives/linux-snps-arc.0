Return-Path: <SRS0=SdQC=GP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C904FC433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 12:56:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6989F2388D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 12:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6989F2388D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OTJLzM4ubEHlCu/4YpuQANY6p781kfzioh6i/NaTtAc=; b=u4U3a1ZaNlJ56ggUfJASRbypW
	bH830qx73tkeR4P3EIfyadJVAh4HHPsWP4pyN14iHq2C6571TW/Yks08eniNLhoCwdZtetAyDfOeZ
	3rC0JOPOnwezch3/hjVJ7WNAAaegH1ZHrVFXO4l2ptblCOKTHqI5vjXaw869hs9z+KUSdfYjVXUIK
	WyppxlYKNYFb4kYuYqYNlxMVhL8vKsW9s3Tn0dpqQoVDGPoFgSgJWT6nzKKI6RfwDGSO0DLizO8X9
	ZEToPDrG0+8eLty8Tm6FPyGh8nXORfg7iH1jGO/scZ4RtYBJOqA/5Zph2xZI9PVBVPiquNoUg/Dd7
	0RDA6jM+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzJEE-0000Ur-1d; Tue, 12 Jan 2021 12:56:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzJDg-0000Dc-R9
 for linux-snps-arc@lists.infradead.org; Tue, 12 Jan 2021 12:56:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82C822310F;
 Tue, 12 Jan 2021 12:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456179;
 bh=ZfRNyTieOsoVNKe8Y2oI4EMd7ks971g+wnjHRo7dt18=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FqXxn/DgLD+d0rPjUUJBXj4JJwMU47kZnN1obfF3BpYR6vsCBDSF0CGok+z1JzXID
 s7/WcaVsAPP0U6fLDvLXz+x81AlDrmMeAwykwHZvViPf2S5q7FMQ3oNxTT5Wy5X2mw
 7it9K2GxOFAG9xRbyIOBtj6Ql9cIDBHQ2dD+C1fetuWiiDTk7/lGHyJvZnRwZ8Ym8Q
 W9QYhp1K96PSFdyftVb4JWN1EmupGYpYzSwsU9g3pJMJirWcJNbjYIKYsQNzxM9jEs
 s3E4EeI1cBgKSM807siv5f6LAQUOKBe53c/0sIvnVilNvIkT6X7FdG2G2iM9xSQJX5
 5jKlPx4s+lzCw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 34/51] arch/arc: add copy_user_page() to
 <asm/page.h> to fix build error on ARC
Date: Tue, 12 Jan 2021 07:55:16 -0500
Message-Id: <20210112125534.70280-34-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125534.70280-1-sashal@kernel.org>
References: <20210112125534.70280-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_075621_026184_E2D6ED0B 
X-CRM114-Status: GOOD (  12.01  )
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
index b0dfed0f12be0..d9c264dc25fcb 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -10,6 +10,7 @@
 #ifndef __ASSEMBLY__
 
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
