Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC73FC4332F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Dec 2022 12:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8oiOY9hDFTtcsI5TcFUcdrnLfMtHc265mvl1PEvU+E=; b=KJBJD1jXR5izbR
	9YL7mzZZH0AyvUZes2ZbIcnrLNzQRQlY9W1G3oSRah+b9FENfCUZ1W1f/NjqGWVwCxtfGk285eJP2
	J0Us7r0M6qbBwalQP/Vn6eLMtdSW6HjxyIztOqOOeP/IDy2zmMNEsLbk2Yi2Zqjy1cF9YJwvrKQ5O
	C3IZAqq810CTi7i1rH0jxQawO0YkB/sHBrj1VgCcpujGg8/Iq/PN1sEoPJCvTxKorqDHslo90IPdm
	ON/D+hHr8R1BiOEOhqJMo54t76QFd6NIbwBO0ELom6xtnjYcPu64XuuJi79U6Rb9l6dzbwBofnvJv
	wUTu75yKkCg8DmUnec9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8KSL-00BjlG-9e; Thu, 22 Dec 2022 12:13:49 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K3l-00BWcu-4O; Thu, 22 Dec 2022 11:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671709705; x=1703245705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TghWz/7dE4JZXKAzYoxxWMMVMnrM6ngZWB0OqEIPnYA=;
  b=DuS2QF5sxVpKkjNlWCyR7OIq0b8qko3KfIbfPwiuuIQ1cv0fViHHa19K
   UeZzEUtmgo7VRpZwdLwQUqmc73s8N8tmPvQbEooY6rXfZsx0n9rovmXL2
   nW3PiygcASjytf4LBEeVngKmb/I2c5cRAxrpzVDdcmgiEsfsVWUzEGQyS
   GcqhW8cq+5rfaaxV0DVCgXiS41E4y8nW/1sep2KPhQSMESioFxjWeq6nd
   B6bt4IxLNp7yxswBJ0zMt0PjI0wRFWuEzbBHPBM5Nnuqn20tHr5SevsmK
   xYfSQ53PXnaUouhFmEvaqt/kib9i2UB6E2mZLOge3kDpz2kic2Y7TueV1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804732"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="318804732"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:48:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504752"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="629504752"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:48:18 -0800
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
Subject: [PATCH 10/19] arch/openrisc: rename internal name __xchg to __arch_xchg
Date: Thu, 22 Dec 2022 12:46:26 +0100
Message-Id: <20221222114635.1251934-11-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034831_944093_C8DC8C84 
X-CRM114-Status: GOOD (  10.06  )
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
 arch/openrisc/include/asm/cmpxchg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/openrisc/include/asm/cmpxchg.h b/arch/openrisc/include/asm/cmpxchg.h
index 79fd16162ccb6d..5725e22e10683b 100644
--- a/arch/openrisc/include/asm/cmpxchg.h
+++ b/arch/openrisc/include/asm/cmpxchg.h
@@ -147,7 +147,7 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 extern unsigned long __xchg_called_with_bad_pointer(void)
 	__compiletime_error("Bad argument size for xchg");
 
-static inline unsigned long __xchg(volatile void *ptr, unsigned long with,
+static inline unsigned long __arch_xchg(volatile void *ptr, unsigned long with,
 		int size)
 {
 	switch (size) {
@@ -163,7 +163,7 @@ static inline unsigned long __xchg(volatile void *ptr, unsigned long with,
 
 #define arch_xchg(ptr, with) 						\
 	({								\
-		(__typeof__(*(ptr))) __xchg((ptr),			\
+		(__typeof__(*(ptr))) __arch_xchg((ptr),			\
 					    (unsigned long)(with),	\
 					    sizeof(*(ptr)));		\
 	})
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
