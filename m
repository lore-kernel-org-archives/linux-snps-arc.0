Return-Path: <SRS0=I9+C=KK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEE7C433ED
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 May 2021 10:19:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0688E613F1
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 May 2021 10:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0688E613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=79IjCp5KVhBYfwyKVpyKW6xMX4PBNuRVk0EVQjsCPWs=; b=qSh+rfDTp1f0jjKWC7dgVsY6Ki
	ExqM9wOzGZR1W5xPrWDUYxrekGBP8Jd7tn4HI0p4GroGGoJ6G31iWddgvxNzo7azhsB5j3SJiDfvx
	YXao1zGgk7q285y+uS/aGuVZQyetyt5p8QfktJvt8fnVzdt991X6kbkEkhqpBcke/CKH3dSGkMakA
	kbXwGHl32qG9zgMtjPkGOF+0qIn8T1QbhE2fFY0J+Dyv5ko7zARf/f14WK4lpgU2+S/9eqoS0f5eN
	V06Fkb4QLJtBNiJ+GVeVcSuzr1Sggd97VIR836kOOwHy/Ch42qxLU+lOPt34RuTBEgotwX4RxC0ir
	RBqqcdnA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhrO4-00A8Zl-To; Sat, 15 May 2021 10:19:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhrNy-00A8YN-VF; Sat, 15 May 2021 10:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=IVFJYXi6jXoEq2/8KNBNR1ngrmV0D8LAiyWkewQzP7Y=; b=phqZr7Q7I9bjphSHqliQctTFX+
 W9xQP3CYrZZkfmV0SRR7ne7MruwfYk1xDbHgMcUxMxmlHyS/u5v986hsvIP/BuCHK2Yt5L2WnVgdv
 dpKi52wjTbELZKY5U8suZcQIzcCCp1C5IVlYDEKR/4GPmpEZFCagiJM+0aMFLNGNHQYiSYTf8i6Tq
 hZAB5s6O4p2RfYpNXLLH+im0/OCrmmcLLxtLQEfeNZsuTHMSxZOsHf51yio0kBqGW7cpIA9FqOBf+
 6DaG72PjArKZDVVNg/kUxsyXPlpUiI8vt9bIscCj3mvFST3B7XJpYJg6oMIRJ6l+8V20taFVK+D/A
 k5Yg83Sw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhrNt-00CU3z-9h; Sat, 15 May 2021 10:19:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FED6613ED;
 Sat, 15 May 2021 10:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621073940;
 bh=IpDqq3tGZovUUgcolTosWSkNN0zOGEGLOzuZ4zntl2M=;
 h=From:To:Cc:Subject:Date:From;
 b=mPn1OjVomxs7Tu/J0zC+FtbvaOsr6yQtXpoEj9sOi4LdXTcbto5qJ96l5zGrlpywO
 S9h/yllV/A7xG4K2EqluCEN+iU8aMWSWgvByBTJiljpi+sS3kiNXEDaRAWkE1e7SKM
 sxKRPsWhTYLl3eTQWbxjjYc5gYDjylTk+ySJih9CK9j6ccvN98Y6VtRlIgLO5VL8+8
 1QeSFO1LDLs8iguwhOAyXJFeodhvDZp8PXLkMitx7yPyKl0bGUmVhJjLazb7iS4leT
 cYyRbNnN88rAws6za+S3f2nl8YyuPZ0+1JIwQRAsVrcvD6dvU/aeGd/unrmM2Ofwwi
 8sCIbzxalbdtQ==
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
Subject: [PATCH 0/6] [v2] asm-generic: strncpy_from_user/strnlen_user cleanup
Date: Sat, 15 May 2021 12:17:57 +0200
Message-Id: <20210515101803.924427-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210515_031901_437032_3D6B224D 
X-CRM114-Status: GOOD (  14.79  )
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

As I've queued up some patches for asm-generic, I remembered an
older series that I created but never submitted.

These two functions appear to be unnecessarily different between
architectures, and the asm-generic version is a bit questionable,
even for NOMMU architectures.

Clean this up to just use the generic library version for anything
that uses the generic version today. I've expanded on the patch
descriptions a little, as suggested by Christoph Hellwig, but I
suspect a more detailed review would uncover additional problems
with the custom versions that are getting removed.

       Arnd

Arnd Bergmann (6):
  [v2] asm-generic/uaccess.h: remove __strncpy_from_user/__strnlen_user
  [v2] h8300: remove stale strncpy_from_user
  [v2] hexagon: use generic strncpy/strnlen from_user
  [v2] arc: use generic strncpy/strnlen from_user
  [v2] asm-generic: uaccess: remove inline
    strncpy_from_user/strnlen_user
  [v2] asm-generic: remove extra strn{cpy_from,len}_user declarations

 arch/arc/Kconfig                    |   2 +
 arch/arc/include/asm/uaccess.h      |  72 ----------------
 arch/arc/mm/extable.c               |  12 ---
 arch/h8300/Kconfig                  |   2 +
 arch/h8300/kernel/h8300_ksyms.c     |   2 -
 arch/h8300/lib/Makefile             |   2 +-
 arch/h8300/lib/strncpy.S            |  35 --------
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
 17 files changed, 25 insertions(+), 334 deletions(-)
 delete mode 100644 arch/h8300/lib/strncpy.S
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
