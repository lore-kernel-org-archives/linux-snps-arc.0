Return-Path: <SRS0=/KVa=JN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC234C433B4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Apr 2021 23:08:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69C9F610C8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Apr 2021 23:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69C9F610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xvfp1Yzo29HiOK4lq3gKMKJiY8qd0REsKdF0Ac2RsEI=; b=jBrlXkblL1ECB7f5PSsXZ2KWr5
	JDFkryj+It/yvSNUBpL4DNKhh+v6O9rCdf/njxuqkO3tilWhmJ4shnqYf1K+C9jVPN8WyEP8+O/zC
	1ByyMQnv1tBH5Mz5mGRENJd+fadVJCNmQ6A7+OwAforCogsKN7hkEdrbWYJ1NMmV+YsgiR6w5yvvh
	1a3aFecFEise3WmT7hFHOngoh7cQwxAuUTFM/YMIB4wK9sV6Gj2xMbJ5Z4sgchePTUzwGXc/kg3z3
	Gx+lqJAFifuHFp8xvIWwryHJ7bD/hVeyALntnd491jUXKfoKLzGc0AjAaO1uVfBciJ1hNoHDU4EQ7
	8qrE7FRA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXXZ9-003fRJ-T1; Fri, 16 Apr 2021 23:07:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXXYt-003fPb-RZ; Fri, 16 Apr 2021 23:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=mbIW7FDOiEKRuwEXnsOYQIYqDQHUf6UllHx7WSCAIjI=; b=lxU48mq458bF7JV1aZ6L3Zo2UR
 I585HQrHxlGeweJsLkRKCYSCqoFhHxnYj7gGJ39liWPLTQfWA2ajmWmKMkjA3Z0VTIOSaFEWoqv+g
 ksAAAbmBr7Y58UiFpMY9kGMNAA7SSWLAld8PZaACTYfsZKQ0YTQLayBMcepZBZpoQfoixfm1eQJzi
 9JPDz6/LgxP88bdj+7aikBJTkOBO4kN5ye3LclnZjCY9axF+/s3S+7ev/MqsAbrxEYieXycizyc6g
 hQU35iOkWcVessGC+PK9aR+/kafdQoaygcZji5k3N5WJfQmWMMYu40YcWG69i1HQUBftuOxgDpZpA
 l+QkiMeg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lXXYb-00AZO9-Jr; Fri, 16 Apr 2021 23:07:27 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: brouer@redhat.com
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, ilias.apalodimas@linaro.org,
 mcroce@linux.microsoft.com, grygorii.strashko@ti.com, arnd@kernel.org,
 hch@lst.de, linux-snps-arc@lists.infradead.org, mhocko@kernel.org,
 mgorman@suse.de
Subject: [PATCH 0/2] Change struct page layout for page_pool
Date: Sat, 17 Apr 2021 00:07:22 +0100
Message-Id: <20210416230724.2519198-1-willy@infradead.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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

The first patch here fixes two bugs on ppc32, and mips32.  It fixes one
bug on arc and arm32 (in certain configurations).  It probably makes
sense to get it in ASAP through the networking tree.  I'd like to see
testing on those four architectures if possible?

The second patch enables new functionality.  It is much less urgent.
I'd really like to see Mel & Michal's thoughts on it.

I have only compile-tested these patches.

Matthew Wilcox (Oracle) (2):
  mm: Fix struct page layout on 32-bit systems
  mm: Indicate pfmemalloc pages in compound_head

 include/linux/mm.h       | 12 +++++++-----
 include/linux/mm_types.h |  9 ++++-----
 include/net/page_pool.h  | 12 +++++++++++-
 net/core/page_pool.c     | 12 +++++++-----
 4 files changed, 29 insertions(+), 16 deletions(-)

-- 
2.30.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
