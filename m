Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B313C77B60
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 Apr 2023 09:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MmSARtperHxeddZQc5C2o9SI6CWZv9B7Hby6qESH9DA=; b=VWr+p1bkrp1MEl
	Ku7WO8EYNJRWxOY3vkXVxC9z11eoPq/yr6BB8cwWmDyd9TTRXHR8bJyISy5AZ69VQuOfIkr5UybIB
	EgplEHbq29/0W/gh7ptae8SM4JCLWAXMVe4cPZ00BfqIv7U1wrkvn0Bo0tkJytt2K1OwiNiH2VUfp
	Gh/yk4Tm1ec4dNh8usG7AdfciNp4YXXTcgQFOmlmNMW7LNB2GIyZf7JdBZ2Bpw4KGt9O3YlxToFot
	UPWjOpn3UvRsDNADQzIpfV5ZKiPAAtR/K92c6RlKXB5A/eBMhZ+/tduEVDWf4sF/ZVhot8pfqdLxh
	qdRcVJZx7gRhcWivoesg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psKNw-008dWm-11;
	Fri, 28 Apr 2023 09:27:24 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psKNq-008dR3-0e;
	Fri, 28 Apr 2023 09:27:19 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3BA8221A2D;
	Fri, 28 Apr 2023 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682674033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=H634jX8sSYMwnQT1vLr7vYP2Eo6TaCU+J3gzKVsIAq4=;
	b=VbHHcK4793S8Ps7niwJ/Fwfmq+pXThNJc0kyX1jeLNE6xy35UoTR3ljF9sLnSM3cZintOy
	YdHtZSHPLoPgN1oikxQp2DXNqWBiENQRuP0ROqwzpUBiK1jRzN3nwlptu1ijUTjf0zvy/d
	zq4KTdTSkchp187Tn9tNbgxtKTUcp6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682674033;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=H634jX8sSYMwnQT1vLr7vYP2Eo6TaCU+J3gzKVsIAq4=;
	b=DW2G43drDfPSAccNnQi6KBQ7vl1Fmv8Co40ZZveXyfpskVMHp3yPMtZ6tOE7+kr7M00llZ
	MhFKTW90T3B8rDAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0F21138FA;
	Fri, 28 Apr 2023 09:27:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id jkouLnCRS2ReFwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 09:27:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	geert@linux-m68k.org,
	javierm@redhat.com,
	daniel@ffwll.ch,
	vgupta@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	davem@davemloft.net,
	James.Bottomley@HansenPartnership.com,
	arnd@arndb.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	sparclinux@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/5] fbdev: Use regular I/O function for framebuffers
Date: Fri, 28 Apr 2023 11:27:06 +0200
Message-Id: <20230428092711.406-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_022718_402882_33B3CB0F 
X-CRM114-Status: GOOD (  10.66  )
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

(was: fbdev: Move framebuffer I/O helpers to <asm/fb.h>)

Fbdev provides helpers for framebuffer I/O, such as fb_readl(),
fb_writel() or fb_memcpy_to_fb(). The implementation of each helper
depends on the architecture, but they all come down to regular I/O
functions of similar names. So use the regular functions instead.

The first patch a simple whitespace cleanup.

Until now, <linux/fb.h> contained an include of <asm/io.h>. As this
will go away patches 2 to 4 prepare include statements in the various
drivers. Source files that use regular I/O helpers, such as readl(),
now include <linux/io.h>. Source files that use framebuffer I/O
helpers, such as fb_readl(), also include <linux/io.h>.

Patch 5 replaces the architecture-based if-else branching in 
<linux/fb.h> by define statements that map to Linux' I/O fucntions.

After this change has been merged and included in a few release
without complains, we can update the drivers to regular I/O functions
and remove the fbdev-specific defines.

The patchset has been built for a variety of platforms, such as x86-64,
arm, aarch64, ppc64, parisc, m64k, mips and sparc.

v2:
	* use Linux I/O helpers (Sam, Arnd)

Thomas Zimmermann (5):
  fbdev/matrox: Remove trailing whitespaces
  ipu-v3: Include <linux/io.h>
  fbdev: Include <linux/io.h> in various drivers
  fbdev: Include <linux/io.h> in drivers
  fbdev: Define framebuffer I/O from Linux' I/O functions

 drivers/gpu/ipu-v3/ipu-prv.h                |  1 +
 drivers/video/fbdev/arcfb.c                 |  1 +
 drivers/video/fbdev/arkfb.c                 |  1 +
 drivers/video/fbdev/aty/atyfb.h             |  2 +
 drivers/video/fbdev/aty/mach64_cursor.c     |  3 +-
 drivers/video/fbdev/chipsfb.c               |  1 +
 drivers/video/fbdev/cirrusfb.c              |  1 +
 drivers/video/fbdev/core/cfbcopyarea.c      |  2 +-
 drivers/video/fbdev/core/cfbfillrect.c      |  2 +
 drivers/video/fbdev/core/cfbimgblt.c        |  2 +
 drivers/video/fbdev/core/fbmem.c            |  1 +
 drivers/video/fbdev/core/svgalib.c          |  2 +-
 drivers/video/fbdev/hgafb.c                 |  2 +-
 drivers/video/fbdev/hitfb.c                 |  2 +-
 drivers/video/fbdev/kyro/fbdev.c            |  2 +-
 drivers/video/fbdev/matrox/matroxfb_accel.c |  8 ++-
 drivers/video/fbdev/matrox/matroxfb_base.h  |  6 +-
 drivers/video/fbdev/pm2fb.c                 |  1 +
 drivers/video/fbdev/pm3fb.c                 |  1 +
 drivers/video/fbdev/pvr2fb.c                |  1 +
 drivers/video/fbdev/s3fb.c                  |  1 +
 drivers/video/fbdev/sstfb.c                 |  2 +-
 drivers/video/fbdev/tdfxfb.c                |  2 +-
 drivers/video/fbdev/tridentfb.c             |  1 +
 drivers/video/fbdev/vga16fb.c               |  2 +-
 drivers/video/fbdev/vt8623fb.c              |  1 +
 drivers/video/fbdev/wmt_ge_rops.c           |  2 +
 include/linux/fb.h                          | 63 +++++----------------
 28 files changed, 52 insertions(+), 64 deletions(-)

-- 
2.40.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
