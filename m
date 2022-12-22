Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CB8C4167B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Dec 2022 12:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+u2N1TE8B1UWXXcWd+lMv3Lb5WS88Fo+RIq/9CtonE=; b=fq7zZGkYTG0spJ
	y2LILVY0GICI35pW6SX/CowpSTbL3L8ePb4mXmlZAg3TsnoW0LqCNx4sSpF0S5RGL6MgHvmJHm9ZD
	BYcoJ7hxsA9uxsQqjNU1uqbZC2jpE4VmKEoRdkQ+9WdqVQ+pF9bGO7qqoWiMcSybdlowKWMlyjrPJ
	nu9Xp5d8vfwiDXkpgNu7YD/aEQ/dIVtCa566QcEP65AQTXfIaSDBR8EiKTkWKxbnA0dMuWlmDeGvd
	2BQWN9hwOEUsomGi77G8Wt+5N3OtFrBAGjBExn6bkjO2j5pXv5LYswWhlp+htwwJX7yKxCFoPklee
	aVMSqfpWIiNiBXAayMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8KSB-00BjeL-SB; Thu, 22 Dec 2022 12:13:39 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K3Z-00BWWm-He; Thu, 22 Dec 2022 11:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671709693; x=1703245693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o4h93ABh3+zAq8TlgfcDXo1RyDlG18z2IRLWJiiWgBI=;
  b=ToJ6Z3ALVY0fBMX7SiR/G3HF6QHQopuWz+PUR+HJUFunYtJwUUA7v5q7
   cOolppLXPi/YeN8nl8f1sPhZHKof27dpkoQP/8acCqWGLpO5a+ibUdvea
   VJVYyegrMeL5esDoGuXUQppQ8M/2DHp4mwXdUV5UXTKMY8z3OzKU9HLcF
   NlERuLtbFHniEm93iHEBfArw1E7kGMTYdbpwGwq5d9sEPiocjSerOFWZQ
   2N97AbEx/vv1xNuHGRI/AFNzij4kHzjtMiER/K2hTPjQasi9AQF2lbpc3
   qv0o4K55QOgTP1LPbEvXTqjT7qpDPcLpeCYIIVjUWs+YbVGVz43d/2IcM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804689"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="318804689"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:48:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504710"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="629504710"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:48:06 -0800
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
Subject: [PATCH 08/19] arch/m68k: rename internal name __xchg to __arch_xchg
Date: Thu, 22 Dec 2022 12:46:24 +0100
Message-Id: <20221222114635.1251934-9-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034822_265576_745D4F5D 
X-CRM114-Status: UNSURE (   9.45  )
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
 arch/m68k/include/asm/cmpxchg.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/cmpxchg.h b/arch/m68k/include/asm/cmpxchg.h
index 6cf464cdab067e..d7f3de9c5d6f79 100644
--- a/arch/m68k/include/asm/cmpxchg.h
+++ b/arch/m68k/include/asm/cmpxchg.h
@@ -9,7 +9,7 @@
 extern unsigned long __invalid_xchg_size(unsigned long, volatile void *, int);
 
 #ifndef CONFIG_RMW_INSNS
-static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int size)
+static inline unsigned long __arch_xchg(unsigned long x, volatile void * ptr, int size)
 {
 	unsigned long flags, tmp;
 
@@ -40,7 +40,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int siz
 	return x;
 }
 #else
-static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int size)
+static inline unsigned long __arch_xchg(unsigned long x, volatile void * ptr, int size)
 {
 	switch (size) {
 	case 1:
@@ -75,7 +75,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int siz
 }
 #endif
 
-#define arch_xchg(ptr,x) ({(__typeof__(*(ptr)))__xchg((unsigned long)(x),(ptr),sizeof(*(ptr)));})
+#define arch_xchg(ptr,x) ({(__typeof__(*(ptr)))__arch_xchg((unsigned long)(x),(ptr),sizeof(*(ptr)));})
 
 #include <asm-generic/cmpxchg-local.h>
 
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
