Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B299E7718C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2024 17:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2KyNPHYj9+vZGhjnRDSjzD0hDbgvKrtQs0Ix3sR4v8=; b=BGt7TkYkERJVQx
	gfHF7oFJoEzawIae5cr4DqkjTsSjQEdnCJxYtMa2TFJbgWLe2b72vFmxcPPlm3ZRcd1cOhovw+aby
	0rPMKbD7VOlpsJMgrpi1tLyXGiMYHVY1m7+xP/AMZ+Y+yZn9Zb3j6dGrC2WVeh0sJL4VbQVipvWCG
	OiH2xypLNgphDAQR0zY2WXQPnwsojuA/POs5p27+1bfPeBhaCBuHsvcm2HB/bd4Nl4OKdShfIFktE
	x/t/PmrtXzVT+AHfJL88s0Ix8y7r+am8FHyODyJ2BGBD7SrYhKNvBe7RZF+VEY65k7k1i9c5IV5Tv
	Xiu2MVfEv7GsLffRxkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgjj-00000005d3Z-0zqD;
	Fri, 20 Dec 2024 17:24:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgXw-00000005aVo-1IAw
	for linux-snps-arc@lists.infradead.org;
	Fri, 20 Dec 2024 17:12:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9FED5C67D7;
	Fri, 20 Dec 2024 17:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CA3C4CECD;
	Fri, 20 Dec 2024 17:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714735;
	bh=q3xrmmT1UJpvd1T/fprCANXtLs8ZiyVYLMFaXW1O6XU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FgzefnR0+fXFExb3u5G+q75ictHMrwTM+JWh0q+uqdkS/FwKVEGw9ycPUul9Yoqpt
	 IXV+4g09YOyHhUUmI7r0QTtCwSCemW6gExMU+cCLdOtJoi2aA3fcOZizaHhDv1rOqE
	 +X4K9dsD6rZcpLzCAy8EE+j9pYWBRcklhx/GNZqFiFxHxZL4HAyvNeL9mr6NBO9AX/
	 yOMrCdV7S2OrxZYFmnVjbcQWHiNetJhmySe+0KVIGdcBkhkQCt99Yb7K7KA1IehTV2
	 6sfz2ZpWOheovOILWvG5XptxWFThvGeR9xJ3s3XZv/3Kf0pJ+czb3TBGXEV93qPmJX
	 WiqrVo8M6AQXw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	kernel test robot <lkp@intel.com>,
	linux-snps-arc@lists.infradead.org,
	Vineet Gupta <vgupta@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 6.12 18/29] ARC: build: Use __force to suppress per-CPU cmpxchg warnings
Date: Fri, 20 Dec 2024 12:11:19 -0500
Message-Id: <20241220171130.511389-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220171130.511389-1-sashal@kernel.org>
References: <20241220171130.511389-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091216_390794_14EF6282 
X-CRM114-Status: GOOD (  10.95  )
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

[ Upstream commit 1e8af9f04346ecc0bccf0c53b728fc8eb3490a28 ]

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
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
2.39.5


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
