Return-Path: <SRS0=uxeU=EH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E8CC2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2020 17:06:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3822208B6
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2020 17:06:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cYVzS6kN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaTEbszp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3822208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YiIggHBYftA/fhWtoQm7rptjIW90/+j11SR1JK+Uss0=; b=cYVzS6kNAKDe09z8s4uTGEQCz
	7C7QoHdchDb/LG9W949gQWTzcLk8cm56vqeXthcaB1cSb9zeW644U8dYvKNmAud3I7vws+/wpVTqc
	aqLfYya8ao4RkJ+Ix0Qngvmen3IGT3VQUt+iA9jppufCD8bUo99hTZYd3JjNaQz39uuOHM/nRIX8i
	KDxr+1K9YHlOmMLWH3Sd7O6I785Us06ecxPs7Kv2Rs3HURHb9Kzo/NipFFCJM+BjnHKi0DKuQNqgs
	C+KbfX9ea14Bb0zdHmh2RpQdw4TKQBlBV2wxxjiRWFyxY+36HzrTuSLqP2mYLy62tBPwnDbj8fWIO
	q46lnpDRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZGoQ-0002xU-09; Sun, 01 Nov 2020 17:06:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZGnd-0002Zy-Vr; Sun, 01 Nov 2020 17:05:59 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0898422242;
 Sun,  1 Nov 2020 17:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604250348;
 bh=BP7DmwJKn81ZIeGVeKy2Y93BUEFg6s///fIAFdqxqhs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jaTEbszp1CuUiJ+yaWla9bTyg/px5q89SxSWFAassJH80NOGLuWEEseD4BDDrsmfa
 EDZ7FlUm2Zw4TDjzYuGnFF8/TcBZD2f+rKYXNrWWj+NWVZCio/El+dWlObCBXmvq0g
 zY/ay84z1xQ7e1YX0J51Ko/cyispsqNnXb/bdmq4=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 07/13] ia64: make SPARSEMEM default and disable DISCONTIGMEM
Date: Sun,  1 Nov 2020 19:04:48 +0200
Message-Id: <20201101170454.9567-8-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201101170454.9567-1-rppt@kernel.org>
References: <20201101170454.9567-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_120550_221873_763F61E7 
X-CRM114-Status: GOOD (  14.31  )
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
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-arm-kernel@lists.infradead.org, Michael Schmitz <schmitzmic@gmail.com>,
 Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

SPARSEMEM memory model suitable for systems with large holes in their
phyiscal memory layout. With SPARSEMEM_VMEMMAP enabled it provides
pfn_to_page() and page_to_pfn() as fast as FLATMEM.

Make it the default memory model for IA-64 and disable DISCONTIGMEM which
is considered obsolete for quite some time.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/ia64/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 83de0273d474..6e67d6110249 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -288,6 +288,7 @@ config ARCH_SELECT_MEMORY_MODEL
 
 config ARCH_DISCONTIGMEM_ENABLE
 	def_bool y
+	depends on BROKEN
 	help
 	  Say Y to support efficient handling of discontiguous physical memory,
 	  for architectures which are either NUMA (Non-Uniform Memory Access)
@@ -299,12 +300,11 @@ config ARCH_FLATMEM_ENABLE
 
 config ARCH_SPARSEMEM_ENABLE
 	def_bool y
-	depends on ARCH_DISCONTIGMEM_ENABLE
 	select SPARSEMEM_VMEMMAP_ENABLE
 
-config ARCH_DISCONTIGMEM_DEFAULT
+config ARCH_SPARSEMEM_DEFAULT
 	def_bool y
-	depends on ARCH_DISCONTIGMEM_ENABLE
+	depends on ARCH_SPARSEMEM_ENABLE
 
 config NUMA
 	bool "NUMA support"
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
