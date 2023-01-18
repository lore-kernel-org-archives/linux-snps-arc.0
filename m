Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184CFC38147
	for <linux-snps-arc@archiver.kernel.org>; Wed, 18 Jan 2023 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Terco95K4qO6c/ZUEspzzfKC7Lc8IX2sFm8UZBqj9Ok=; b=HfNpp952Z+g+Cq
	7AYjFUPrGXsGTtviWw6vARjvKWDeVDb3CsrWtDgSTLQAGvqLt+oUFX4UX0Q0q57SBYFsxr74r0cU1
	SOdJQMMBRzO32u1/aKRr7x2/kCVGP38ZqBM8yJdnu3IA7QHfmCt6BwFhajh9K8ditdcEQRri2YH3f
	nwtaUD6FZcE0hQKJ3LMvOABI21dBcat0nK7gUjoqK81XTIaNlEFUTpg3fSxOhTv+HaACURMrn7zOr
	I8cwqevKW3VF1Vf/9kUZVxvd5nCfCGKu5HjYgbxHumvwHHsrd3+IUdUuTHl6w1VowgzsjJ/Vy8/X/
	jCYI2i2L1T20DAg8kvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAen-001egR-P3; Wed, 18 Jan 2023 15:47:21 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAd1-001db1-3u; Wed, 18 Jan 2023 15:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674056731; x=1705592731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5UIRHWiv1nZeLK1bOeYIY8HLBo0tEoLtywnXrKNCGWQ=;
  b=C3Rpi2TjCKzsSBJYxOLBwXrOybnXCWjfGq8L5dvQq8XBAUx2ptKyko7B
   8ehOYrLniJSZjRqRfvkvx6A15RdHmx8f0yItH0Y0mHDwmH+DX5x5EdyLd
   5c6PeY/Zgb5ZNzvZBt7+Grxe96t2/qhTFXn/gme1Rd/1/D8jKrOATF5hs
   4Nqsscek2yCncrR4Y2uVkMcJiDIxGZ/bRs+7RnEXlxRIyhd9pNcfjTC34
   8YALgXwokbyaUUDIfGv3M6PQZdnY/wzLaEKTBvdb6XxgUVWuxR/YSlVZk
   0S3TS7o7L5kxrbeG0jJl/bSWk+oS6qk+Nxdw0uCXsxNAz2SWxPRK+VHS3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322701317"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="322701317"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:45:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661759330"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="661759330"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:45:25 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v5 4/7] llist: simplify __llist_del_all
Date: Wed, 18 Jan 2023 16:44:47 +0100
Message-Id: <20230118154450.73842-4-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118154450.73842-1-andrzej.hajda@intel.com>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_074531_368251_D699A5E4 
X-CRM114-Status: GOOD (  10.56  )
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

llist_del_all uses xchg, let's use __xchg here.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 include/linux/llist.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/llist.h b/include/linux/llist.h
index 85bda2d02d65be..4dc1d185ea98ab 100644
--- a/include/linux/llist.h
+++ b/include/linux/llist.h
@@ -50,6 +50,7 @@
 
 #include <linux/atomic.h>
 #include <linux/container_of.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/stddef.h>
 #include <linux/types.h>
 
@@ -241,10 +242,7 @@ static inline struct llist_node *llist_del_all(struct llist_head *head)
 
 static inline struct llist_node *__llist_del_all(struct llist_head *head)
 {
-	struct llist_node *first = head->first;
-
-	head->first = NULL;
-	return first;
+	return __xchg(&head->first, NULL);
 }
 
 extern struct llist_node *llist_del_first(struct llist_head *head);
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
