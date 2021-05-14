Return-Path: <SRS0=Kl7k=KJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42155C433B4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 May 2021 22:10:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEC986144B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 May 2021 22:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEC986144B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D/mm82q3kG6QoofRvnhLhxWHnZHmmBZOfw2f6O5BgDg=; b=SRykeFqU5r0Av1OYz8WlTO9mDC
	D+MT+5ltFolTsuyKpwOWXdRYn1mpwFqCAMZXdfnT0ouB3orC688IK2YE1hB0Yc4vVMDEiQ237fK2F
	a1ZXJXo4fBgLTj1x2i4t4uKSt4RIS4es7LJBpeNjwaN/bgpXoQUO0Z4vdUBKA/NFV23o0KiCb5h5H
	qAgWssJH3uyBCuY74AjZJBAJtgmCL/G9yM90TMtGcj1nyUwqRCit8Ex5WUBN4YGF0ODtCuZ7OQ3sR
	WhKGfYbhDEsEjDZVM7UVNMt465fTqz27JFdI43+BZu1KqCI/bnAaC7cmy1z+hCJUuNX+ayhjUhxt3
	0kgLW6rg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhg1G-0098BW-Tj; Fri, 14 May 2021 22:10:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhg1D-0098Aq-NF; Fri, 14 May 2021 22:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=miI/aEPj8G91cf9USfD8J3zXAl6W6h46Uu9Kg4U0xFU=; b=H4UkK3O6GtztASKUdT5xHBSpDe
 3GD/hrBl5eAMoq/hPRkr/IVgqr7vyoLQDU/K0vJgYFtpX0plHr56Idztie130sI+dmO2ZBJYcrc7t
 md5CtTl0tD6o0JisCAygiM3HwG+wCSgAiifgHO689tSgiHMRV9KEsjt/Wc47BA5mIiQlCIIY/E5dG
 2kdPY+caCnTlVBnugNxX7O8P4UCtGpn7QdQJTTclvV4jNAs7Oq2Hg0sZHwsMzbRMU8iYDqv9BG/dA
 1JaYKUdNub6BYYB+1Y6uiwzMXutXfEy9xx3gYL3xvL4MqHyvwQzAtvkSnk/qJt8hxmBfJ6KInkCsL
 Htg3PtsA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhg1B-00CIAb-56; Fri, 14 May 2021 22:10:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F55B61182;
 Fri, 14 May 2021 22:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621030248;
 bh=zwzpJpxhzEGdOSTs7iHw5uHEDYyGgvaSUy2MfaxR8a4=;
 h=From:To:Cc:Subject:Date:From;
 b=Amsg36igKFenDeVbVYqjy3ug1isOcKoawk6bBGVwpXxus0vf9KtNztP7we1xEnUjo
 G4P9ZW0acUdIcQ54wii2EhWxQzotCNPrDegb9Ij4ShWHQsNq08RmeCBvVFHnUC+v77
 5fx2VXC98JVtLXFyuub4Hjokij4TJwUqVxAIe3xhFi40DUBaL6RWuUS7GQqq4QupMJ
 hGB6WqnnpE2ySboqAEjuH2/wBaJ3s5EYxDocovzG6UVkcoGZM2dDSjIHRZGZPQfPVg
 qTqvx1B5VLkspJfQlTpO8TCmXDQEghXCqbkRbEToYO10Sayisjq1O+a1YrOM7useM6
 FvHmzQq//ayRg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Vineet Gupta <vgupta@synopsys.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Sid Manning <sidneym@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-hexagon@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
 linux-um@lists.infradead.org
Subject: [PATCH 0/5] asm-generic: strncpy_from_user/strnlen_user cleanup
Date: Sat, 15 May 2021 00:09:37 +0200
Message-Id: <20210514220942.879805-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_151049_262524_9D6BAFC2 
X-CRM114-Status: GOOD (  12.88  )
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

From: Arnd Bergmann <arnd@arndb.de>

As I've queued up some patches for include/asm-generic/unistd.h, I
remembered an older series that I created but never submitted.

These two functions appear to be unnecessarily different between
architectures, and the asm-generic version is a bit questionable,
even for NOMMU architectures.

Clean this up to just use the generic library version for anything
that uses the generic version today.

       Arnd

Arnd Bergmann (5):
  asm-generic/uaccess.h: remove __strncpy_from_user/__strnlen_user
  hexagon: use generic strncpy/strnlen from_user
  arc: use generic strncpy/strnlen from_user
  asm-generic: uaccess: remove inline strncpy_from_user/strnlen_user
  asm-generic: remove extra strn{cpy_from,len}_user declarations

 arch/arc/Kconfig                    |   2 +
 arch/arc/include/asm/uaccess.h      |  72 ----------------
 arch/arc/mm/extable.c               |  12 ---
 arch/h8300/Kconfig                  |   2 +
 arch/hexagon/Kconfig                |   2 +
 arch/hexagon/include/asm/uaccess.h  |  31 -------
 arch/hexagon/kernel/hexagon_ksyms.c |   1 -
 arch/hexagon/mm/Makefile            |   2 +-
 arch/hexagon/mm/strnlen_user.S      | 126 ----------------------------
 arch/m68k/Kconfig                   |   4 +-
 arch/riscv/Kconfig                  |   4 +-
 arch/um/include/asm/uaccess.h       |   5 +-
 arch/um/kernel/skas/uaccess.c       |   5 +-
 include/asm-generic/uaccess.h       |  52 ++----------
 14 files changed, 24 insertions(+), 296 deletions(-)
 delete mode 100644 arch/hexagon/mm/strnlen_user.S

-- 
2.29.2

Cc: Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Brian Cain <bcain@codeaurora.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Jeff Dike <jdike@addtoit.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Sid Manning <sidneym@codeaurora.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: uclinux-h8-devel@lists.sourceforge.jp
Cc: linux-hexagon@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-um@lists.infradead.org
Cc: linux-arch@vger.kernel.org


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
