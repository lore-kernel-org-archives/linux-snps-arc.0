Return-Path: <SRS0=s8S7=MO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B4CC6377D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:29:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BCBD61289
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BCBD61289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KZzTF7an1HYrHPy6FXdRKsSHhdUu2wZJ4JvdhxB9xBE=; b=Mh8n0Ls6Q4K+GM
	OhJGydGSBbgqW1X+n2rlvRyT0xD/DguXgbLgtPAyJax4jcLo2CdBDZhYy++0Gtb+I8RovlH8x5+/X
	BzgTWIVO69kj7nvJiaPs+hyUnnQNbTpdQhtnk2m+OwOqWjphHDe5iDXhpSwByYhBtiFEw6VIeg/sS
	V+nQjEYXHqiMCjcO4/mB7wbtJf1EatAzRPjdwB7rv9xgw/kRVnV81+krNAO2AxKrLnOaSyrFHW5OR
	mDUiQm9JvLCOtUOebh5mtX0/4sN+5lxfgjmnJvk92p0EEzyMUmGaV3IosZF1CKZx1wtRMDf1UB+Sm
	+LWIYnGif9wRenY523aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6YlY-001fNC-5s; Thu, 22 Jul 2021 13:29:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Y8D-001XMG-Gl; Thu, 22 Jul 2021 12:48:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B77A61285;
 Thu, 22 Jul 2021 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626958132;
 bh=PX46ntR2F8mhtnTnqk6z0maUFKW3hKlsYGyDxWq8nt8=;
 h=From:To:Cc:Subject:Date:From;
 b=uI8fZsAnCujH8W7YiEBRgCAjHShI6gE1mvUR0l57R+InmBX0WanZ/uw9vRAOln3Z8
 nGIW49oPfs3Z0oGoceXArCb+pcxtHVC7BDgIPVu7ZQgOSXVYcpE0fh0cemOAHYvVRq
 FKI2JY1Q7ji5J3em2CfLjWBtEWHTWOWxHMmXXgWyndwrPSlVntSikFKkr25MPmfWRd
 v73iMcJt52+PkD+rdPNKZ3PKisAXpGa6fQ8OZroEymMb7Gi2et/DUC63IcI09aav3H
 3ECp+pAFmA7kucS8vsrWJ92J66Z8gjShxT5O7vJdnqnBEe0ThenTNBxBPkUxQ1dKDS
 brNKF2Qpg7HWw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Brian Cain <bcain@codeaurora.org>, Chris Zankel <chris@zankel.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Jeff Dike <jdike@addtoit.com>, Linus Walleij <linus.walleij@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Richard Weinberger <richard@nod.at>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@synopsys.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, uclinux-h8-devel@lists.sourceforge.jp
Subject: [PATCH v3 0/6] asm-generic: strncpy_from_user/strnlen_user cleanup
Date: Thu, 22 Jul 2021 14:48:05 +0200
Message-Id: <20210722124814.778059-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_054853_672513_F6B83885 
X-CRM114-Status: GOOD (  16.82  )
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

I had run into some regressions for the previous version of this
series, the new version is based on v5.14-rc2 instead.

These two functions appear to be unnecessarily different between
architectures, and the asm-generic version is a bit questionable,
even for NOMMU architectures.

Clean this up to just use the generic library version for anything
that uses the generic version today. I've expanded on the patch
descriptions a little, as suggested by Christoph Hellwig, but I
suspect a more detailed review would uncover additional problems
with the custom versions that are getting removed.

I ended up adding patches for csky and microblaze as they had the
same implementation that I removed elsewhere, these are now gone
as well.

If I hear no objections from architecture maintainers or new
build regressions, I'll queue these up in the asm-generic tree
for 5.15.

       Arnd

Link: https://lore.kernel.org/linux-arch/20210515101803.924427-1-arnd@kernel.org/

Arnd Bergmann (9):
  asm-generic/uaccess.h: remove __strncpy_from_user/__strnlen_user
  h8300: remove stale strncpy_from_user
  hexagon: use generic strncpy/strnlen from_user
  arc: use generic strncpy/strnlen from_user
  csky: use generic strncpy/strnlen from_user
  microblaze: use generic strncpy/strnlen from_user
  asm-generic: uaccess: remove inline strncpy_from_user/strnlen_user
  asm-generic: remove extra strn{cpy_from,len}_user declarations
  asm-generic: reverse GENERIC_{STRNCPY_FROM,STRNLEN}_USER symbols

 arch/alpha/Kconfig                        |   2 -
 arch/arc/include/asm/uaccess.h            |  72 -------------
 arch/arc/mm/extable.c                     |  12 ---
 arch/arm/Kconfig                          |   2 -
 arch/arm64/Kconfig                        |   2 -
 arch/csky/include/asm/uaccess.h           |   6 --
 arch/csky/lib/usercopy.c                  | 102 ------------------
 arch/h8300/kernel/h8300_ksyms.c           |   2 -
 arch/h8300/lib/Makefile                   |   2 +-
 arch/h8300/lib/strncpy.S                  |  35 ------
 arch/hexagon/include/asm/uaccess.h        |  31 ------
 arch/hexagon/kernel/hexagon_ksyms.c       |   1 -
 arch/hexagon/mm/Makefile                  |   2 +-
 arch/hexagon/mm/strnlen_user.S            | 126 ----------------------
 arch/ia64/Kconfig                         |   2 +
 arch/m68k/Kconfig                         |   2 -
 arch/microblaze/include/asm/uaccess.h     |  19 +---
 arch/microblaze/kernel/microblaze_ksyms.c |   3 -
 arch/microblaze/lib/uaccess_old.S         |  90 ----------------
 arch/mips/Kconfig                         |   2 +
 arch/nds32/Kconfig                        |   2 -
 arch/nios2/Kconfig                        |   2 -
 arch/openrisc/Kconfig                     |   2 -
 arch/parisc/Kconfig                       |   2 +-
 arch/powerpc/Kconfig                      |   2 -
 arch/riscv/Kconfig                        |   2 -
 arch/s390/Kconfig                         |   2 +
 arch/sh/Kconfig                           |   2 -
 arch/sparc/Kconfig                        |   2 -
 arch/um/Kconfig                           |   2 +
 arch/um/include/asm/uaccess.h             |   5 +-
 arch/um/kernel/skas/uaccess.c             |  14 ++-
 arch/x86/Kconfig                          |   2 -
 arch/xtensa/Kconfig                       |   3 +-
 arch/xtensa/include/asm/uaccess.h         |   3 +-
 include/asm-generic/uaccess.h             |  52 ++-------
 lib/Kconfig                               |  10 +-
 37 files changed, 43 insertions(+), 581 deletions(-)
 delete mode 100644 arch/h8300/lib/strncpy.S
 delete mode 100644 arch/hexagon/mm/strnlen_user.S

-- 
2.29.2

Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com> 
Cc: Al Viro <viro@zeniv.linux.org.uk> 
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com> 
Cc: Brian Cain <bcain@codeaurora.org> 
Cc: Chris Zankel <chris@zankel.net> 
Cc: Christian Borntraeger <borntraeger@de.ibm.com> 
Cc: Christoph Hellwig <hch@lst.de>
Cc: Guo Ren <guoren@kernel.org> 
Cc: Heiko Carstens <hca@linux.ibm.com> 
Cc: Helge Deller <deller@gmx.de> 
Cc: Jeff Dike <jdike@addtoit.com> 
Cc: Linus Walleij <linus.walleij@linaro.org> 
Cc: Max Filippov <jcmvbkbc@gmail.com> 
Cc: Michal Simek <monstr@monstr.eu> 
Cc: Richard Weinberger <richard@nod.at> 
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de> 
Cc: Vasily Gorbik <gor@linux.ibm.com> 
Cc: Vineet Gupta <vgupta@synopsys.com> 
Cc: Yoshinori Sato <ysato@users.sourceforge.jp> 
Cc: linux-arch@vger.kernel.org 
Cc: linux-csky@vger.kernel.org 
Cc: linux-hexagon@vger.kernel.org 
Cc: linux-ia64@vger.kernel.org 
Cc: linux-kernel@vger.kernel.org 
Cc: linux-mips@vger.kernel.org 
Cc: linux-parisc@vger.kernel.org 
Cc: linux-s390@vger.kernel.org 
Cc: linux-snps-arc@lists.infradead.org 
Cc: linux-um@lists.infradead.org 
Cc: linux-xtensa@linux-xtensa.org 
Cc: uclinux-h8-devel@lists.sourceforge.jp 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
