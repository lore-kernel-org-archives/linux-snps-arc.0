Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8B4C4332F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Dec 2022 12:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/urzhd9GI5PxZlIlKhjbBFYI8vbkhw1bGXObl1EQCE=; b=nLf8SCft8u2xdb
	4MTLUBq6GKqa6xoQH2bJlNp0Sb9YNxz/UCy6NX3s9Dd7/FKOUKJI9GFJgjwWXFsA8tP1DaSpd7TLH
	D/3I4sBSfUlJs7jCdgw3eoaGeyvFDecb8R/ljO1ZHV8hAVowID4tPnZSM9JowTB6udmuCIsfc8VyW
	PZn/NP9wdYiawbkdLedPx0qvX/r5FVQMfN6kkDIc6CfGs1DTEoDb9avdit2ge4E8Y8jDq86HoCJoR
	P9A7N1NkLfGSfdquNFbhAhb8PwpzwI3ryg5+yb1033QoVo1HgQuT5K0Z5iK2MPZiKhXvytU0x6qn6
	b8ZIbTwxEWlXqmfKKkZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8KSF-00BjhD-VO; Thu, 22 Dec 2022 12:13:43 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K3B-00BWSb-AC; Thu, 22 Dec 2022 11:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671709669; x=1703245669;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GvFMbOE0GzaAFA+/NgInY0v5QkDpeB2uXRoAiJmqw7k=;
  b=ibATVrgkaNuuVkyQQFC1VS2VZbgTg5pbA+XwOnJdUVUJYakxk8cjmqCo
   UAULpMOXoWofN71+aUMeuhmMoDzcbolYHO7NHCEN1/hO4DEy5oEQdU98b
   ikqDuxLgHZFF1h9gWBQomn9SOxZX311HYMdUExfk5J6tasm+8jl12YHw/
   TwZQTBvDku0kg9h9HCn5VZnG8v+B4HNCanMyHUHQq3nmKnXhHdxSdntl1
   g759VHsSjW3YIIYwGAh0naRuEB2aFJV0fD8PTryr0M1ULhIqXdbHp2RfQ
   Vhxs4QVvnBLFprpgHOt+bnuTsWC++f0ei0aOGLwi1yKKp6kAojZNJCnbQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804456"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="318804456"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:47:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504326"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="629504326"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:47:24 -0800
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
Subject: [PATCH 01/19] arch/alpha: rename internal name __xchg to __arch_xchg
Date: Thu, 22 Dec 2022 12:46:17 +0100
Message-Id: <20221222114635.1251934-2-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034749_465332_3DBCF456 
X-CRM114-Status: UNSURE (   9.04  )
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

__xchg will be used for non-atomic xchg macro.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 arch/alpha/include/asm/cmpxchg.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
index 6e0a850aa9d38c..40e8159ef6e794 100644
--- a/arch/alpha/include/asm/cmpxchg.h
+++ b/arch/alpha/include/asm/cmpxchg.h
@@ -6,7 +6,7 @@
  * Atomic exchange routines.
  */
 
-#define ____xchg(type, args...)		__xchg ## type ## _local(args)
+#define ____xchg(type, args...)		__arch_xchg ## type ## _local(args)
 #define ____cmpxchg(type, args...)	__cmpxchg ## type ## _local(args)
 #include <asm/xchg.h>
 
@@ -34,7 +34,7 @@
 
 #undef ____xchg
 #undef ____cmpxchg
-#define ____xchg(type, args...)		__xchg ##type(args)
+#define ____xchg(type, args...)		__arch_xchg ##type(args)
 #define ____cmpxchg(type, args...)	__cmpxchg ##type(args)
 #include <asm/xchg.h>
 
@@ -48,7 +48,7 @@
 	__typeof__(*(ptr)) _x_ = (x);					\
 	smp_mb();							\
 	__ret = (__typeof__(*(ptr)))					\
-		__xchg((ptr), (unsigned long)_x_, sizeof(*(ptr)));	\
+		__arch_xchg((ptr), (unsigned long)_x_, sizeof(*(ptr)));	\
 	smp_mb();							\
 	__ret;								\
 })
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
