Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2861FC54E67
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 Mar 2024 05:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kYELa6fjQOprmRSVl4qLfJp/m3gxQMn7yTC+PmlNskU=; b=iStN7a75RWzgL9
	QdX+wMqpqIMezUkHDV20/aHP3OjaPZ3OIcvEWvJfWgbO632elNnbwBJ2TT9djToq3r1evs6ZfUhAz
	cNNR9oMeFZmuJtWSuHYzAFQJZmANtk4RS7d51zJ93SdL6N6pBuH3Utf6KkFt5qdFvGYxjqA0Fmeg4
	2BwCND1yo/ShwK3j83CJfR/rJtPtrcFpySPtxtrBqWpM56mCQfvAF1Nrg6JcI/+I9O+dzS+5n1e+C
	Xo59O4Wx+P/MQ2wL3ZocTC3fEbojyxy0wQsNrEDAcUXBLPUsx3avp88zKdChvWWgodX6nGbNmsd95
	/4INMrgeJxh0l0KQC4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpiUC-0000000CaPJ-2Qro;
	Thu, 28 Mar 2024 05:39:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpiU4-0000000CaKw-1n6n
	for linux-snps-arc@lists.infradead.org;
	Thu, 28 Mar 2024 05:39:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D39A614CE
	for <linux-snps-arc@lists.infradead.org>; Thu, 28 Mar 2024 05:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802AAC433C7;
	Thu, 28 Mar 2024 05:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711604366;
	bh=/C7YmCyi76cdNCIgLJ4s57sUTMiGolVuUEfTdswA5OA=;
	h=From:To:Cc:Subject:Date:From;
	b=lsJJA0BQFpjBJ/AIVnZp3PZ7R6Rsil/YIxYzapWmqG56QfWTLGYxC5NDByRPT4fqu
	 vpH0UGpc9qIcotajnq/UrvUFM96yOivI215SHgtrXPxZ9orSMn0ANKhwhWuXmm7Pib
	 fH6DB+Tor9Nb6/wNTnljJ/BqudDZuc4f/r+dTbVjY5EbEw/1G2eaGu81PD5iYHQ98z
	 OSx755d9/clcut6n1Z/dOK4QAX01uO9Mihz8PNsurssSXKNQHwbL4XFUxB3Aqb6VAC
	 jMzvRgOjzqPZxJTe1gi8ELoopz4YCcGc1wcma/cqCYMKQ4/a9vw4nB5KV/mXngqHSI
	 k4wkXZvrbG4gw==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 0/2] ARC minor fixes
Date: Wed, 27 Mar 2024 22:39:17 -0700
Message-Id: <20240328053919.992821-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_223928_579732_86EB3CD6 
X-CRM114-Status: UNSURE (   6.29  )
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

Some fixlets for ARC.

Vineet Gupta (2):
  ARC: Fix -Wmissing-prototypes warnings
  ARC: mm: fix new code about cache aliasing

 arch/arc/Kconfig                 | 1 -
 arch/arc/include/asm/cachetype.h | 9 ---------
 arch/arc/include/asm/ptrace.h    | 2 +-
 arch/arc/kernel/kprobes.c        | 7 ++++---
 4 files changed, 5 insertions(+), 14 deletions(-)
 delete mode 100644 arch/arc/include/asm/cachetype.h

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
