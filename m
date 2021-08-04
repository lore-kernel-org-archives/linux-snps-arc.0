Return-Path: <SRS0=yiNs=M3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52576C19F39
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11AAD61040
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11AAD61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNqvpbtCb65GVkRGqsbRNyzoFLS9KdJ6HicJvMbQY/k=; b=GYtkPIPdrE1tm5
	oTofiqKuVxZOiBrjMZwWCCnnb1K4C8Bpgi6m6QFOBtcZ0sOWDDIzzH+DdsZsCfOfHSiSlnJdmM1DD
	9zluBep+xi57cm2Ijo2W9kSppEsfMScA0RcZclb7sAgr5gGG9nbMTqf33BqG05i+8hx6VEv/NMt5/
	D77wlN0tREWKB3Cap1ZLwv78I9rICfEDZ0ZZmA8k5byLVEs5fKaNGoU726blYtgZBQNNZMkINnWUK
	qoAeIKcxgCjuraftNXN7u1eWSU8RM5XArY8gYsYJ+tz91z3Be+YzXfZUGS0WnaEsf4viHuEJUwhN3
	Gs4rSZTgfRDWrQH7Gniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBMNK-007HjS-KS; Wed, 04 Aug 2021 19:16:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBMNJ-007Hi5-Lm
 for linux-snps-arc@bombadil.infradead.org; Wed, 04 Aug 2021 19:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=4pEfag4gXoYCla1X9oxtV319OWZhqYZcSVgr9rMrlko=; b=atjvDDn/8LHGInQgofgQ9wylkS
 LgqFN01u1aBk/mOcOH3LDempDna6VKUCDdLXbbK9a6TV02KBKpaWGP/XfPgVHFDbV38ywvhAsq09U
 xcmmhryfE9IrJjImcvp61kZWd/vJ0ZqKH0IjhWu2LsaqDnnUy+lxSCyfs1UTkL8yt8wKJRuvd7ykN
 hOqsLFSgdMjcW/PkPtB5RknlFJiiZhzjQS3+e4jTZVY457JIqh8s0eVfryI8vnR/TJfk7mJvTX39S
 bw51lMP04d4+8fQLbd4JRLJA7wYnVfJQQOPh3nU4IyRNH4KzDknlrFjXPDA7qnRCG4yiXy9RbZVSH
 4VFdSIhQ==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBMNG-005oK9-I8
 for linux-snps-arc@lists.infradead.org; Wed, 04 Aug 2021 19:16:20 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7D1A540DB7;
 Wed,  4 Aug 2021 19:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1628104567; bh=jS7TMpiuBpexomjIgRV6cQUgUQCWpq/qYioDI73B0rY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k4Iyy/dTZeIspc8X66Z0Q3020n/LdiZPpj96MU+92Bt1cpPCjC/y5JmvUcawUE+cy
 DqJyIevzX+wz0suDDiVBl7TMHLeNVojvbVBfkRQ5zpRYKIyIjAoByOgnw7XrCk+u+t
 sp1DLEJ2DuAbj7mnx0+OtrKQ6g22CtL0LojmA61ceO2D9Usv5K8/HNneWdwlZbqs6m
 DuG02nCZD52aRSroVtxc8h/e8yIpzhoOIQVJSd3K20LeaeGLHaqchYdkMUhGCNSAlG
 yo8pWK6GtFO4NGEbftsPrEwRMKCCrHvRG5REWnbUYcIRKZdXdfjDjBnYKIULw9IfeH
 PUnobod+MNHfg==
Received: from vineetg-Latitude-7400.internal.synopsys.com
 (snps-fugpbdpduq.internal.synopsys.com [10.202.17.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 40158A0095;
 Wed,  4 Aug 2021 19:16:06 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Vladimir Isaev <Vladimir.Isaev@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 08/11] ARC: xchg: !LLSC: remove UP micro-optimization/hack
Date: Wed,  4 Aug 2021 12:15:51 -0700
Message-Id: <20210804191554.1252776-9-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804191554.1252776-1-vgupta@synopsys.com>
References: <20210804191554.1252776-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_201618_797024_DD1D0EDA 
X-CRM114-Status: GOOD (  13.45  )
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

It gets in the way of cleaning things up and is a maintenance
pain-in-neck !

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/include/asm/cmpxchg.h | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index d42917e803e1..bac9b564a140 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -113,15 +113,9 @@ static inline unsigned long __xchg(unsigned long val, volatile void *ptr,
  *  - For !LLSC, cmpxchg() needs to use that lock (see above) and there is lot
  *    of  kernel code which calls xchg()/cmpxchg() on same data (see llist.h)
  *    Hence xchg() needs to follow same locking rules.
- *
- * Technically the lock is also needed for UP (boils down to irq save/restore)
- * but we can cheat a bit since cmpxchg() atomic_ops_lock() would cause irqs to
- * be disabled thus can't possibly be interrupted/preempted/clobbered by xchg()
- * Other way around, xchg is one instruction anyways, so can't be interrupted
- * as such
  */
 
-#if !defined(CONFIG_ARC_HAS_LLSC) && defined(CONFIG_SMP)
+#ifndef CONFIG_ARC_HAS_LLSC
 
 #define arch_xchg(ptr, with)		\
 ({					\
@@ -134,10 +128,6 @@ static inline unsigned long __xchg(unsigned long val, volatile void *ptr,
 	old_val;			\
 })
 
-#else
-
-#define arch_xchg(ptr, with)  _xchg(ptr, with)
-
 #endif
 
 /*
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
