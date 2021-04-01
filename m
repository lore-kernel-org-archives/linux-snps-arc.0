Return-Path: <SRS0=6hxA=I6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AB8C433B4
	for <linux-snps-arc@archiver.kernel.org>; Thu,  1 Apr 2021 06:44:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 306B76105A
	for <linux-snps-arc@archiver.kernel.org>; Thu,  1 Apr 2021 06:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 306B76105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFXWvD5kesMyLvZ6jIwGs9JFo0s8IbCCaPU0uH5T0bI=; b=iixmQtq185za8gLuKN262y6MHo
	Yd591sT72LzbiR8O5KwPkyhZlvCazg4TiL8INIex3WdCKIVGUROdWtbFseQe45EwxUmZ+U+vPxz5k
	ASQpiD9WZydxnvdIgJS6lwwFDYzVhA6Ncvesy/KDHfulPe19pJW1Wq2imy5thOuu723e+WnzD3pTx
	K48vhUqmbIzAM6rCh6bfft83UK7sYR7vStfpT73E2r2guKbdlUXDeTSKprXRJD8t80eeJ2RhtO6p+
	rCq4oRnsI5dDUDdO40GUALLi+XgaoP1R7REItKNYjwS3HTTGNnREM0njRmShC4HkjxkDHxChkQS0p
	f9xTfBTw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRr4L-008hpQ-Dh; Thu, 01 Apr 2021 06:44:41 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lRr3n-008heT-Er; Thu, 01 Apr 2021 06:44:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 129BEED1;
 Wed, 31 Mar 2021 23:44:06 -0700 (PDT)
Received: from p8cg001049571a15.arm.com (unknown [10.163.70.228])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 255C53F719;
 Wed, 31 Mar 2021 23:44:02 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH V2 6/6] mm: Drop redundant HAVE_ARCH_TRANSPARENT_HUGEPAGE
Date: Thu,  1 Apr 2021 12:14:08 +0530
Message-Id: <1617259448-22529-7-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617259448-22529-1-git-send-email-anshuman.khandual@arm.com>
References: <1617259448-22529-1-git-send-email-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_074407_720862_EFDBF666 
X-CRM114-Status: UNSURE (   9.15  )
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
Acked-by: Arnd Bergmann <arnd@arndb.de>
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
index e12d9d1f4892..4b3b204a84bd 100644
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
@@ -1505,10 +1506,6 @@ config HW_PERF_EVENTS
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
