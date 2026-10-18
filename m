Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8921CCF2C9
	for <linux-snps-arc@archiver.kernel.org>; Sun, 18 Oct 2026 13:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W4pMQgVfHg8DoBtrTffUZnoHd8nSciZzlxlTqT0k5YU=; b=F5lNxORsr0UYk5
	50jKQbjVZRWbXpvyToA0uRGJtl1/b4U6xwOcHW+H11K5bIgHAEBGMzB+59Do1WnxEYonax5gTewq1
	PsXroO9n51RMFkMDz5TgNxxD0KJWTCBNriz2sSiyOd0lMVxirEJl5hHLc2chuNnhL38unp4guRar2
	M6LclSP7hHwyrNNzh8pmwCKdxunpdAKRQdf1x0r9t4pIKtGtY1WRlMRi/lZlZdJHCXdRo/tL61Gan
	1EWX4Ywgd3XeLwc2oAtGuHMIhm8LVy8Mkphf+xsM42tcFzBeJTiGrJ6BnwOOEj17o5gfazJkj1t7X
	g8Z4DUHbumXwD7lkE98g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQws-00000005tXr-2PjN;
	Sun, 18 Oct 2026 13:29:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQwp-00000005tXj-25Fp
	for linux-snps-arc@lists.infradead.org;
	Sun, 18 Oct 2026 13:29:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3FA860D97;
	Sun, 18 Oct 2026 13:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D4D1F000C5;
	Sun, 18 Oct 2026 13:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792330150;
	bh=MGW9gS81JOGmQhAC9OrTzEkmznZ+6BrPV7a61PBlbiY=;
	h=From:To:Cc:Subject:Date;
	b=jQ+7Gji5398VsfxuIyNKoWG3c80C6uFP86YknrNLVg1SjybiOFqi6yQZAu46udGVk
	 v4j9A3HiMjwdR3X91FidNxnwzAlsgdxcd4jD3knSSkpE5zzx5XNGZs7ikGYIq9SS4A
	 BsKM/W2XpYjYGcFcBCbewR74GiDwqf0xfzKAEsAnSzJe4mXCRxV3r0k1gz2bWK4faF
	 b96B3/+XRXN3Nf+rx1G6M8xqT8yP8clPh1sqzmRd7d8Icb+6JdBzKfUZFPCbZxQCk5
	 cH8ZuzFDyM7R0v/HILU4i6ihzT5mwhT3/ZYUXU8WZr83Middj4kTXnh/jVmCD97NOI
	 m9ajISozhV7CQ==
From: Sasha Levin <sashal@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Brian Cain <bcain@kernel.org>,
	Stafford Horne <shorne@gmail.com>
Cc: Josef Bacik <josef@toxicpanda.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	bpf@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>,
	"kernelci.org bot" <bot@kernelci.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH bpf-next] locking/atomic: arc, hexagon, openrisc: Define arch_cmpxchg_local()
Date: Sun, 18 Oct 2026 09:29:07 -0400
Message-ID: <20261018132907.3823160-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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

Commit ccb88db8dac8 ("bpf: Don't hand out a linked element as extra
element") made alloc_htab_elem() take the per-cpu spare element with
try_cmpxchg_local(), the first caller of cmpxchg_local() outside of
architecture code. It doesn't build on arc, hexagon and openrisc:

  include/linux/atomic/atomic-arch-fallback.h:384:27: error: implicit declaration of function 'arch_cmpxchg_local'; did you mean 'raw_cmpxchg_local'? [-Werror=implicit-function-declaration]

raw_cmpxchg_local() maps to arch_cmpxchg_local() unconditionally, but
these three architectures don't define it, and unlike nios2 and
microblaze they don't get it from asm-generic/cmpxchg.h either.

cmpxchg_local() only has to be atomic with respect to the local CPU, so
an architecture's own arch_cmpxchg() can serve for the sizes it
supports. arc uses its relaxed LLOCK/SCOND variant when ARC_HAS_LLSC is
set and its atomic_ops_lock() variant otherwise, and openrisc uses its
LL/SC arch_cmpxchg(), the way arm64, riscv and s390 alias theirs. The
hexagon arch_cmpxchg() only handles 32-bit words, so hexagon uses the
generic version that disables interrupts, like sh, sparc32 and xtensa
do. Linux has no NMIs on hexagon, so that is sufficient there.

Fixes: ccb88db8dac8 ("bpf: Don't hand out a linked element as extra element")
Reported-by: kernelci.org bot <bot@kernelci.org>
Closes: https://d.kernelci.org/i/maestro:78b65519ee4561df1fbf1e72f1dec9da7e5b153e
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610181750.BoqAddaF-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202610182048.aEaiBP8W-lkp@intel.com/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
The only user is in bpf-next, so it is probably easiest to take this
through bpf-next with acks from the arc, hexagon and openrisc
maintainers. A similar change was posted in 2023 for objpool and
stalled once objpool stopped using try_cmpxchg_local():
https://lore.kernel.org/all/20231121142347.241356-1-wuqiang.matt@bytedance.com/

Build tested on arc with and without LLSC (including both KernelCI
configs), hexagon (clang) and openrisc.

 arch/arc/include/asm/cmpxchg.h      | 4 ++++
 arch/hexagon/include/asm/cmpxchg.h  | 6 ++++++
 arch/openrisc/include/asm/cmpxchg.h | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 66b3743c94008..93f7153eb267a 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -59,6 +59,8 @@
 	_prev_;								\
 })
 
+#define arch_cmpxchg_local	arch_cmpxchg_relaxed
+
 #else
 
 #define arch_cmpxchg(ptr, old, new)				        \
@@ -80,6 +82,8 @@
 	_prev_;								\
 })
 
+#define arch_cmpxchg_local	arch_cmpxchg
+
 #endif
 
 /*
diff --git a/arch/hexagon/include/asm/cmpxchg.h b/arch/hexagon/include/asm/cmpxchg.h
index 9c58fb81f7fd6..e6114e713db9f 100644
--- a/arch/hexagon/include/asm/cmpxchg.h
+++ b/arch/hexagon/include/asm/cmpxchg.h
@@ -8,6 +8,8 @@
 #ifndef _ASM_CMPXCHG_H
 #define _ASM_CMPXCHG_H
 
+#include <asm-generic/cmpxchg-local.h>
+
 /*
  * __arch_xchg - atomically exchange a register and a memory location
  * @x: value to swap
@@ -72,4 +74,8 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 	__oldval;						\
 })
 
+#define arch_cmpxchg_local(ptr, o, n)					\
+	((__typeof__(*(ptr)))__generic_cmpxchg_local((ptr),		\
+			(unsigned long)(o), (unsigned long)(n), sizeof(*(ptr))))
+
 #endif /* _ASM_CMPXCHG_H */
diff --git a/arch/openrisc/include/asm/cmpxchg.h b/arch/openrisc/include/asm/cmpxchg.h
index 8ee151c072e41..fcf1bc8db8fe9 100644
--- a/arch/openrisc/include/asm/cmpxchg.h
+++ b/arch/openrisc/include/asm/cmpxchg.h
@@ -140,6 +140,8 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 					       sizeof(*(ptr)));		\
 	})
 
+#define arch_cmpxchg_local	arch_cmpxchg
+
 /*
  * This function doesn't exist, so you'll get a linker error if
  * something tries to do an invalidly-sized xchg().

base-commit: a6303535c2ad9d49598d52556183911f02287791
-- 
2.53.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
