Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEC7D2069F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2024 05:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ST5CzG0P+NYwrYQjs5YmF/ceFeWMv3rlpyq7xBT/0XQ=; b=onLmvs/bPVLGsn
	1mWS9L203cZy8P9N1xl5rp9uQRtNbhqB7JYQdVSV+VSDEipWY+YHgtT7stNE9V0z8Rf1A2Kl2nAw9
	fckO4ge3h2BhKnL0eUJvZsyYdh5K7Kx0YXQHApBvW9Nsn3JQgU5JdI+Vkundr3tJfLE6a9lOchjmc
	aSsLpZSrNttTWZ2IF1f+uOCWr8nLQGZHfGNSWxGsPASVXkhPcdDYllXoIOK7K90z+2Q2/rpYDSmKy
	RBMUdP0FSzCM50Sdm+3zMz5fFq6Tg9t7jFHNMXmgvTY9p7t6bUA8UraVttm8WA3A7UQcRtfKpMPMG
	1nclgfFdRn0aA7aJ78Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wZl-0000000AZNx-0XrN;
	Wed, 16 Oct 2024 05:28:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wZh-0000000AZLo-2Phb
	for linux-snps-arc@lists.infradead.org;
	Wed, 16 Oct 2024 05:27:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A4C22A432FB;
	Wed, 16 Oct 2024 05:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A100C4CED1;
	Wed, 16 Oct 2024 05:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729056476;
	bh=//4Cx99p5jogEeFkicaoyIn2GOAS1p2Dbd+QLByWjhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CFRGkUgYtZNKeG774KNogSUIWZp4KHQZzO3bZCW27MX+I3d3Ohz08BJshkQB/TNor
	 vFV/AygFwrhh6QsxyXjQgK27CT11YlX7xRWwC7vN8AaOF2jr6kX39EPDQZClVZ3sz0
	 5F16BFDbmLvDaUFYc4yjtsgUM2FjtWaKpZ4o+63IJ4gd8hcu3CHuUOYTv1fZb25UnY
	 F+5nuoMNs8H7wN2reW6UQgtZ5D8N23Px5gLkTUzvCuk4IOJMzPwagsOx8FlZ0RDyqb
	 n5lnZpxNElVXny3hvRBJjxMRSaeAi9/JgNIv2iDb8VTc3WA6zsUFFciGGYgAxjhYwN
	 zW+Xv43o1DV7A==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 3/3] ARC: build: Use __force to suppress per-CPU cmpxchg warnings
Date: Tue, 15 Oct 2024 22:27:49 -0700
Message-ID: <20241016052749.1640081-4-vgupta@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016052749.1640081-1-vgupta@kernel.org>
References: <20241016052749.1640081-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_222757_678640_BF12063F 
X-CRM114-Status: GOOD (  11.66  )
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

From: "Paul E. McKenney" <paulmck@kernel.org>

Currently, the cast of the first argument to cmpxchg_emu_u8() drops the
__percpu address-space designator, which results in sparse complaints
when applying cmpxchg() to per-CPU variables in ARC.  Therefore, use
__force to suppress these complaints, given that this does not pertain
to cmpxchg() semantics, which are plently well-defined on variables in
general, whether per-CPU or otherwise.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409251336.ToC0TvWB-lkp@intel.com/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: <linux-snps-arc@lists.infradead.org>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/cmpxchg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 58045c898340..76f43db0890f 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -48,7 +48,7 @@
 									\
 	switch(sizeof((_p_))) {						\
 	case 1:								\
-		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
+		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
 		break;							\
 	case 4:								\
 		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
