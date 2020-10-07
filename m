Return-Path: <SRS0=Y6oE=DO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4039C4363D
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2020 02:54:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B39CF20789
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2020 02:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pseIRCsC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qehWR4LY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B39CF20789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ym2/bbZKs+rxBKhsE8zZhlKsDe8luYyf5nswRQyX+zw=; b=pseIRCsCC+aYBCsH2iyJXYRIGN
	K79m3FXmC47O4QTeDQd6M+4p4cS+n8cUECbW+tM2SEAisU/YBHDQwgBOE76hnZlZNOrU97zfyLpiJ
	hMVaKskiVLmgAFF7PG+bnwgIi180O+ueMqNO614j9FXQ3RwRI1qJPntV0C1ITCJqQI4ctfLlBDR2l
	r1+/7p5ohMnGn7Uc03436EyyKraV8iJcXpPdclx18WWMD5XNlrNSYiyyoorkBX9QJQ46ex8pKhpyn
	eVEeSjbRL3TE7sivHQ8VPFAjJD5hPI0X8h/TlP1+D83PRHFx3bt/JeG51RXab70ImEi0v7yPHAg64
	F4VKApWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPzbL-0006LQ-RD; Wed, 07 Oct 2020 02:54:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPzbK-0006L8-37
 for linux-snps-arc@merlin.infradead.org; Wed, 07 Oct 2020 02:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Kfn1EjIw61OOA6atfqtDsUyZD8OZlfnAF20PJC2dm14=; b=qehWR4LYimU3auLImYdY7dy5xT
 qJQ7N/N3RyKgXPBBGJYKenvFHzkRm0aP5DoMQ6DGuzp7kbj88LGDpZobZVYOq+KTpLb3Ws0H0gEJJ
 IrwCgHI6Lz1Iu127MZ7tZ9ovdDvIP4MEjIO206vqEC4Aa1haNrPBcr40VsRTJDbSdg0zvbQbXYIUk
 N9qUoTB3J73qcHt8uu/vJKNlQl8dXXsI5VB7doSJ8ZxVzCjsip4lJe9+mlP7fROSXTEZomxi5C4Ux
 SeYr8zbaP9gWNhZyg8dwsv7anSol1N7Ff9jeXVxsSjv5Bwex6spTxEHGQ2Am/A9i/FvSHfHCmpa1a
 WgQks5Rw==;
Received: from [2601:1c0:6280:3f0::2c9a]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPzbI-0004UB-3H; Wed, 07 Oct 2020 02:54:44 +0000
To: LKML <linux-kernel@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Dan Williams <dan.j.williams@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] fs: dax: fix build error on ARC
Message-ID: <6b5c6090-331d-7485-da4a-45e9c7f13be1@infradead.org>
Date: Tue, 6 Oct 2020 19:54:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
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
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

fs/dax.c uses copy_user_page() but ARC does not provide that interface,
resulting in a build error.

Provide copy_user_page() in <asm/page.h> (beside copy_page()) and
add <asm/page.h> to fs/dax.c to fix the build error.

../fs/dax.c: In function 'copy_cow_page_dax':
../fs/dax.c:702:2: error: implicit declaration of function 'copy_user_page'; did you mean 'copy_to_user_page'? [-Werror=implicit-function-declaration]

Fixes: cccbce671582 ("filesystem-dax: convert to dax_direct_access()")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
Cc: Dan Williams <dan.j.williams@intel.com>
---
Vineet, This patch fixes the build error but is it correct for ARC?

 arch/arc/include/asm/page.h |    1 +
 fs/dax.c                    |    1 +
 2 files changed, 2 insertions(+)

--- lnx-59-rc7.orig/fs/dax.c
+++ lnx-59-rc7/fs/dax.c
@@ -25,6 +25,7 @@
 #include <linux/sizes.h>
 #include <linux/mmu_notifier.h>
 #include <linux/iomap.h>
+#include <asm/page.h>
 #include <asm/pgalloc.h>
 
 #define CREATE_TRACE_POINTS
--- lnx-59-rc7.orig/arch/arc/include/asm/page.h
+++ lnx-59-rc7/arch/arc/include/asm/page.h
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
