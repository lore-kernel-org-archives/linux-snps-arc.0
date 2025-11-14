Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34119CE7AE0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Nov 2025 11:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTJ5kdrTHVHtYWVSSEO8ur78UE8Q1/Q1mKsslqWDlrg=; b=i0+c4vdc3t6PQM
	csHGvgVJgMoZfsjWl1B11yJ9roi5l8M6OU8HF3O9MOlwZRMeaLEK54wwOVJxWRI/YUhgyRnN2YOv3
	Pw2lmrtX6GeaIxa7pgBvVZyulocITWfeFRMj7SknRiqlZmTvkSeRuYp9KPNM3jAlHzgSJ1jenioQm
	UdG8rqARf5ld5FVOF6YA40ZkWuZSlxMKHEzjVOeGE5AWJN9Sb6u35KOzcvCEY4TXzTnXjg1rmkE8u
	D/XnJZ5yxRK/eDnsySjcOpjTu0xfA6DWMOgH4K6HOFUcLt3xvkov6lBAQ7vmFL/YdGWA3M/Z3V3uG
	HbAyV+MEHzvMsSO7t4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrku-0000000C6Gm-40ka;
	Fri, 14 Nov 2025 11:14:16 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrkq-0000000C6Dc-1lAX
	for linux-snps-arc@lists.infradead.org;
	Fri, 14 Nov 2025 11:14:13 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763118849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3MvAZBElD0X3pJk/MX8AXoxW4zTACm8dJmSYdSV26R0=;
	b=B1fHws4vdV9SHk7Nm4NMEkMGypQnWt5ebGnT0lkQhYxPSrPX9T5usjJtN8D6xLK5/tENRj
	6lr6jCeTav9vHkLaX2Cm/MDvr39umGBs008BSWf4p0qasklCP7V5XJNNR/0A712o57bV/X
	UdgHrzzazzIM8MjWkX4twJlrGaTbo7c=
From: Qi Zheng <qi.zheng@linux.dev>
To: will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	peterz@infradead.org,
	dev.jain@arm.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 7/7] mm: make PT_RECLAIM depend on MMU_GATHER_RCU_TABLE_FREE && 64BIT
Date: Fri, 14 Nov 2025 19:11:21 +0800
Message-ID: <0a4d1e6f0bf299cafd1fc624f965bd1ca542cea8.1763117269.git.zhengqi.arch@bytedance.com>
In-Reply-To: <cover.1763117269.git.zhengqi.arch@bytedance.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_031412_589862_B9782C75 
X-CRM114-Status: UNSURE (   9.28  )
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

From: Qi Zheng <zhengqi.arch@bytedance.com>

Make PT_RECLAIM depend on MMU_GATHER_RCU_TABLE_FREE so that PT_RECLAIM can
be enabled by default on all architectures that support
MMU_GATHER_RCU_TABLE_FREE.

Considering that a large number of PTE page table pages (such as 100GB+)
can only be caused on a 64-bit system, let PT_RECLAIM also depend on
64BIT.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/Kconfig | 1 -
 mm/Kconfig       | 6 +-----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index eac2e86056902..96bff81fd4787 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -330,7 +330,6 @@ config X86
 	select FUNCTION_ALIGNMENT_4B
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
 	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
-	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
 	select ARCH_SUPPORTS_SCHED_SMT		if SMP
 	select SCHED_SMT			if SMP
 	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
diff --git a/mm/Kconfig b/mm/Kconfig
index a5a90b169435d..e795fbd69e50c 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1440,14 +1440,10 @@ config ARCH_HAS_USER_SHADOW_STACK
 	  The architecture has hardware support for userspace shadow call
           stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
 
-config ARCH_SUPPORTS_PT_RECLAIM
-	def_bool n
-
 config PT_RECLAIM
 	bool "reclaim empty user page table pages"
 	default y
-	depends on ARCH_SUPPORTS_PT_RECLAIM && MMU && SMP
-	select MMU_GATHER_RCU_TABLE_FREE
+	depends on MMU_GATHER_RCU_TABLE_FREE && MMU && SMP && 64BIT
 	help
 	  Try to reclaim empty user page table pages in paths other than munmap
 	  and exit_mmap path.
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
