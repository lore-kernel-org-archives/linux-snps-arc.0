Return-Path: <SRS0=u+eN=IG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F398BC433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 Mar 2021 06:59:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D07F65146
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 Mar 2021 06:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D07F65146
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAiNvh22ztgMVVW96uuY0piXToKlhB3MBtGwTBulDkA=; b=WXtzPw/tA97AMc4+HeNdqvK3EV
	Qw157pYlCXZxb47OSvH7sv/vaNTFsm2gbXf5LjjhO7S+zgn3u7pRfjvVHqOgcKcU20gO/jWTB9xlp
	vRMvQgtRnC+wSIgw0Vwpor375/6EHUahj/FkigBwaeMdumTSrVJUQzxvgNRzwPfe4FqT8MQK0Czyx
	KCWTTJxLkpXlTx7Jt4fNdn0CbJWiS7VhE+YsHoWh6Jx4M8V55aYjDJJBl4i+NqedEJUADArvOh9T0
	iicOFLXBLEhxg4vrqNjbK41gBlprgLIEplpjNvCi0CksmNqBHDyXP/rIK5n+K5Y4nM1KbR7AG+HCP
	fUw5GuwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9rQ-00FbEi-UE; Mon, 08 Mar 2021 06:59:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9bt-00FX4X-BA; Mon, 08 Mar 2021 06:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QBpf2gwPy3QULg6XDyzUzNwuf1E64/aoK5TFNC9O7xs=; b=lZZ6+N8GRnIHbR7Y3WD4ygHc4G
 Huedozf9kF4gz6CyPP8ykkVXxjrlcGqKMA6dDhUYB7xvCJuidC1MLkVHftBMGw6YmDgLzSDZ0gj6T
 y7+O/H6j9+kYJPq5N5t301zCijGEyp9I8i+ekskhfb9Py/x0Jkn6jZtwJkqnRePHAlib0RIIy8V6z
 Q8ZvxawhSxE5pzyr/8jGQrue14bndRJGLJvxdn5KyDmz60Tu8BeOhm/D2YsmSRlhbRCA7LXInZLW4
 cfv7p5zRRRQ4xmUyJSj+bWUniJzUSnhm/QHxPpHGNWJA3tl/2P2dfn35FAqikWyGXmzQoXDsSlts4
 NdS1KjGA==;
Received: from foss.arm.com ([217.140.110.172])
 by casper.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9ay-00F8hP-OB; Mon, 08 Mar 2021 06:42:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C92611D4;
 Sun,  7 Mar 2021 22:42:19 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.67.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 50A283F73C;
 Sun,  7 Mar 2021 22:42:12 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, x86@kernel.org,
 linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 6/6] mm: Drop redundant HAVE_ARCH_TRANSPARENT_HUGEPAGE
Date: Mon,  8 Mar 2021 12:11:45 +0530
Message-Id: <1615185706-24342-7-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615185706-24342-1-git-send-email-anshuman.khandual@arm.com>
References: <1615185706-24342-1-git-send-email-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_064236_693444_BEE7AD61 
X-CRM114-Status: GOOD (  10.49  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

HAVE_ARCH_TRANSPARENT_HUGEPAGE has duplicate definitions on platforms that
subscribe it. Drop these reduntant definitions and instead just select it
on applicable platforms.

Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arc/Kconfig | 5 +----
 arch/arm/Kconfig | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index fab05f7189c0..2d98501c0897 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -29,6 +29,7 @@ config ARC
 	select GENERIC_SMP_IDLE_THREAD
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_TRACEHOOK
+	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if ARC_MMU_V4
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_FUTEX_CMPXCHG if FUTEX
@@ -84,10 +85,6 @@ config STACKTRACE_SUPPORT
 	def_bool y
 	select STACKTRACE
 
-config HAVE_ARCH_TRANSPARENT_HUGEPAGE
-	def_bool y
-	depends on ARC_MMU_V4
-
 menu "ARC Architecture Configuration"
 
 menu "ARC Platform/SoC/Board"
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index d612d2be6859..cd071e3319ba 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -77,6 +77,7 @@ config ARM
 	select HAVE_ARCH_SECCOMP_FILTER if AEABI && !OABI_COMPAT
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_TRACEHOOK
+	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if ARM_LPAE
 	select HAVE_ARM_SMCCC if CPU_V7
 	select HAVE_EBPF_JIT if !CPU_ENDIAN_BE32
 	select HAVE_CONTEXT_TRACKING
@@ -1504,10 +1505,6 @@ config HW_PERF_EVENTS
 	def_bool y
 	depends on ARM_PMU
 
-config HAVE_ARCH_TRANSPARENT_HUGEPAGE
-       def_bool y
-       depends on ARM_LPAE
-
 config ARCH_WANT_GENERAL_HUGETLB
 	def_bool y
 
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
