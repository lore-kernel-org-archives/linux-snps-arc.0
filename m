Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAACBC52D7C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Aug 2024 19:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPoSGyC5wGVXYGkmPdzGFGIIxHfbOI67zvVumNk2LmI=; b=S83nIO0SHfj9ar
	XKf4to1D+yQplsfu3RPtD6drzY4usmTVyCV4RQJaqnry2aM7GPd3HuxgOE51o1jPy5RzhaQRVRVwZ
	gRKutdQtzIuh1IiP6VqoxZFkPBPzDdmYI9dKSeGsy5qlz7EPNMFuqRFyeWuUnCqcgcvCl5/JZm9L1
	p/5xLSR1QeIr7IUztLW0Eb8tkoyK2VVzDfXhiVYJ5iMtTBXq/UFl5Hv8StbIpfXoXUvZbXZamUjWx
	Fcu5EnSgktKTEtla8ZAdlR0Fiv+QlzuIh5J72GDPy8qfKXKbHJSMrkJGWGQiT8GkQft51/nOTQkAq
	d7qqlEDR3/zG4xXZ1kZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgqo7-0000000A9sT-0pEb;
	Wed, 21 Aug 2024 19:15:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpmn-0000000A1NJ-0jCz
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 21 Aug 2024 18:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Muh7bCDteNDBkUKrbn5tFrvRLKWlQXnlCiukZJwE1LY=; b=QCU6HumC680+8Kkj+TbMpvMZDD
	JWcy6HRHnqkRbKeQhTZ9tz1Pd9aj50cqtqfUcyvntKlNLjGRT9xXzPDmco9nzZJMelm1hCooyrkGy
	b4kDeU0ycqkLEbO5RR4WX8PcVDNVCfSzEwwA0aMPaFRbbxQ6hCX5GRoWew5pl0t5UtMrt6BpCWTmm
	5/j5cySiu9gUJs5BP+wzoVuLROZ/a1NdCiuN+3mkftcQxKayhXXB9F/am1w6F7n/QIq9eHZXigG7a
	yM+smRAWfdRFjR3mJV4e8glSeXj40b/1gB69y6qO4s9MqCcTPR3Mrx0Wk1t9JPkzZLlYqDviJtV/v
	pmQWc1iA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpmj-00000009gDR-3OTi
	for linux-snps-arc@lists.infradead.org;
	Wed, 21 Aug 2024 18:10:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DDB50A41DCB;
	Wed, 21 Aug 2024 18:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245EFC32781;
	Wed, 21 Aug 2024 18:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724263813;
	bh=A1ZjBdu0p6P+IfhPi1T9QOGeX9FqrNLLWzvUxef5bSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p0WM9A7xqkbJ6V3TFxkE1zg7hMdY2wf0H9wXcOs8gMzvp7Iuk1RJaGYFlEKX9cMMl
	 oKaSRU0xlpu16fsdGn7pWF3fdq9tpzBJP6HY2YsyHJ+J7nUezAZ4RvoztGhLCd90up
	 SlOPfEwWr7Pk0kbAoac0W+9e67Z31gHtrscgYABO/J8GJs0bYAR8JjIAzisbAZxK7e
	 nNrRtkP1o+NVzyjbp1uq/MHDi6N7ROLxiKSo9BBMr6KzL9E/pmYcGB1qV2gXw/Hzlt
	 So7DeRzdIHynDMUfXd5FKB0iCyMtSalpOla5cFOAgSlTtnzqNWsiC/J6DruxQewb3S
	 V5PJ5HlxDCI/g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BCD68CE16C1; Wed, 21 Aug 2024 11:10:12 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	elver@google.com
Cc: akpm@linux-foundation.org,
	tglx@linutronix.de,
	peterz@infradead.org,
	torvalds@linux-foundation.org,
	arnd@arndb.de,
	geert@linux-m68k.org,
	kernel-team@meta.com,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-snps-arc@lists.infradead.org,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH v2 cmpxchg 2/3] ARC: Emulate one-byte cmpxchg
Date: Wed, 21 Aug 2024 11:10:10 -0700
Message-Id: <20240821181011.2604152-2-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <04a6010c-536d-4906-bf7c-b2335a2f54b0@paulmck-laptop>
References: <04a6010c-536d-4906-bf7c-b2335a2f54b0@paulmck-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_191018_009339_8F3B5721 
X-CRM114-Status: GOOD (  12.45  )
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

Use the new cmpxchg_emu_u8() to emulate one-byte cmpxchg() on arc.

[ paulmck: Drop two-byte support per Arnd Bergmann feedback. ]
[ paulmck: Apply feedback from Naresh Kamboju. ]
[ paulmck: Apply kernel test robot feedback. ]
[ paulmck: Apply feedback from Vineet Gupta. ]

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: <linux-snps-arc@lists.infradead.org>
Acked-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Kconfig               | 1 +
 arch/arc/include/asm/cmpxchg.h | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index fd0b0a0d4686a..163608fd49d18 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -13,6 +13,7 @@ config ARC
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_NEED_CMPXCHG_1_EMU
 	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
 	select ARCH_32BIT_OFF_T
 	select BUILDTIME_TABLE_SORT
diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index e138fde067dea..58045c8983404 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -8,6 +8,7 @@
 
 #include <linux/build_bug.h>
 #include <linux/types.h>
+#include <linux/cmpxchg-emu.h>
 
 #include <asm/barrier.h>
 #include <asm/smp.h>
@@ -46,6 +47,9 @@
 	__typeof__(*(ptr)) _prev_;					\
 									\
 	switch(sizeof((_p_))) {						\
+	case 1:								\
+		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
+		break;							\
 	case 4:								\
 		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
 		break;							\
@@ -65,8 +69,6 @@
 	__typeof__(*(ptr)) _prev_;					\
 	unsigned long __flags;						\
 									\
-	BUILD_BUG_ON(sizeof(_p_) != 4);					\
-									\
 	/*								\
 	 * spin lock/unlock provide the needed smp_mb() before/after	\
 	 */								\
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
