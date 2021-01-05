Return-Path: <SRS0=DkXR=GI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FEAC433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Jan 2021 03:47:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E216D2256F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Jan 2021 03:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E216D2256F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yMitXWVXJuJ7oS5+Hc2uB+AcqaYIdMf8oWTasFvVq+8=; b=VgY1UnAP5B5MZySQFBQQNjv0P0
	ctKpYlTrA/gGBkSwa3ApmXKdZjkVNllQizGfecHlqXT6kTlt21LETdRTywnSU4agkBPtMLFo+OYzQ
	fnhNo0FDLG2i6/sF2HKEA5Ud/Y0RbjqBAMYtE40+7S4qAhPJ3T1ah9eNw5U7At+OdxV+RTCymecio
	xzflhYsR0NmjJq0zsLG2Hv8j6P3ITC/XGK4e141b6jU68Z/4rfJpQKccmc7gGvSngaxCDLbGX9DdJ
	TBs6+AYDt3X3uyCDzPwXvxUgZpffpd4OH8BW8ccDlOf4AgicZVN8AtfzONq7tZ4+20FuDE9nwEOYj
	Syu5UYKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwdJr-0000EW-OR; Tue, 05 Jan 2021 03:47:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwdJq-0000EI-92; Tue, 05 Jan 2021 03:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=xvxlCGowN31Xh/eMwMOxKX1sU7xQYvnwJjb9H7a7Qfg=; b=fCOcY9KPiE3XxHr3mGOAN9ApBw
 xwhr9RFjdx/HiAqNsrqURth49nt/hE+aettEIsGIjhsfRhogSUvHCLPaWdYU/eCOxX8fUrverXQR8
 QM0M9hbX5loFyoLA673vdQKUP3M7zwXBfTgQ2V1DLyX6sPuxTiHyJ+xYCMnjVE1MCNZRAcrGG2Gnc
 zRIeawk6r+suf8O68gRuFKUqfWKXOgq2Oy7MZdYLDSIqEwu9DjMYRmU+175FCNyHZtVvVoACKzh+l
 aWKp/kC+vglC9HQLKl5Bkfme1t4d6me6C2VlRHTHOsh2waxKdspw9XXAvAdJhapR7QfupQhWBM+kI
 b+79Zuyg==;
Received: from [2601:1c0:6280:3f0::64ea] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1kwdHH-000pmb-BU; Tue, 05 Jan 2021 03:45:50 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] arch/arc: add copy_user_page() to <asm/page.h> to fix
 build error on ARC
Date: Mon,  4 Jan 2021 19:44:53 -0800
Message-Id: <20210105034453.12629-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Jan Kara <jack@suse.cz>, kernel test robot <lkp@intel.com>,
 linux-nvdimm@lists.01.org, Vineet Gupta <vgupta@synopsys.com>,
 Randy Dunlap <rdunlap@infradead.org>, Matthew Wilcox <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-snps-arc@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

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
---
v2: rebase, add more Cc:
v3: add copy_user_page() to arch/arc/include/asm/page.h

 arch/arc/include/asm/page.h |    1 +

--- lnx-511-rc1.orig/arch/arc/include/asm/page.h
+++ lnx-511-rc1/arch/arc/include/asm/page.h
@@ -10,6 +10,7 @@
 #ifndef __ASSEMBLY__
 
 #define clear_page(paddr)		memset((paddr), 0, PAGE_SIZE)
+#define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
 #define copy_page(to, from)		memcpy((to), (from), PAGE_SIZE)
 
 struct vm_area_struct;

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
