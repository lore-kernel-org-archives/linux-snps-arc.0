Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599AFC7EE3A
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 May 2023 13:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hqSSY/rM3pmDRkGP4mZkkmaHrRbNJFrcCw/fnK6TZh4=; b=u/uP19VJjpwhbm
	/tR57zjKC7U6hHts54SKvIItmblBK7IGqenG30GhckoZPArJ++wBh684rMBW670jDPjAxW3fE4RSu
	unPx5GLAv1jEJoZjyCuHaxBRQgRQv8XvMs/5+qr5Y8P64uV/ifvx7RN2xaJMIVPoIC/7JihkOw27q
	uVKJtZyj2omekytF2B/MAX+obxLAIY6xLMxoJU/3pfHVnWD2TVqeTWfJMWMb43OQyphC8Xfezn3kA
	SEHYDMhRxJ/NN0Yylgg6k7uvDkhjIq0twNBnQUT1ecYFSIJ15I9xlM743L51C3q01jJunlKxGWLd1
	rqeVPJKO1JUC9vg9LsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptpeQ-001X7J-1F;
	Tue, 02 May 2023 13:02:38 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptpeI-001X1c-1P;
	Tue, 02 May 2023 13:02:32 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B905921F7C;
	Tue,  2 May 2023 13:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683032545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4/HqMKMsbulxem0YZHptZtjI0v2zedDTIGVljFbx4A0=;
	b=0/jQzGQjxcsbLoXKHnJlmsUT3JVv9NcXNh8VApsEzclPgvqXiOMOMMUZX42s6shx2N3wH5
	WKHaUtVeQypvLRNNq5+GiVa4PzEli+F2Vu0ozdPBwnWfJ7TE/B8ck8OEhS+oYSIR6iBLCA
	bcVHsdu2aNC7jCqqUglALcBQKHVFWvM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683032545;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4/HqMKMsbulxem0YZHptZtjI0v2zedDTIGVljFbx4A0=;
	b=pr+0WmwF1A765+pq5Lr5jvAUfbVCp6UWP2ciA0hJDFgk5xiDi/CqmkpdDug/1NYyvo/HBE
	9l77+O3JrXAysKCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 58447134FB;
	Tue,  2 May 2023 13:02:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id tiGhFOEJUWRYTQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Tue, 02 May 2023 13:02:25 +0000
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
Subject: [PATCH v3 0/6] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
Date: Tue,  2 May 2023 15:02:17 +0200
Message-Id: <20230502130223.14719-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_060230_640864_FDA166AF 
X-CRM114-Status: GOOD (  10.39  )
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

(was: fbdev: Use regular I/O function for framebuffers)

Fbdev provides helpers for framebuffer I/O, such as fb_readl(),
fb_writel() or fb_memcpy_to_fb(). The implementation of each helper
depends on the architecture, but they are all equivalent to regular
I/O functions of similar names. So use regular functions instead and
move all helpers into <asm-generic/fb.h>

The first patch a simple whitespace cleanup.

Until now, <linux/fb.h> contained an include of <asm/io.h>. As this
will go away patches 2 to 4 prepare include statements in the various
drivers. Source files that use regular I/O helpers, such as readl(),
now include <linux/io.h>. Source files that use framebuffer I/O
helpers, such as fb_readl(), also include <asm/fb.h>.

Patch 5 replaces the architecture-based if-else branching in 
<linux/fb.h> by helpers in <asm-generic/fb.h>. All helpers use Linux'
existing I/O functions.

Patch 6 harmonizes naming among fbdev and existing I/O functions.

The patchset has been built for a variety of platforms, such as x86-64,
arm, aarch64, ppc64, parisc, m64k, mips and sparc.

v3:
	* add the new helpers in <asm-generic/fb.h>
	* support reordering and native byte order (Geert, Arnd)
v2:
	* use Linux I/O helpers (Sam, Arnd)

Thomas Zimmermann (6):
  fbdev/matrox: Remove trailing whitespaces
  ipu-v3: Include <linux/io.h>
  fbdev: Include <linux/io.h> in various drivers
  fbdev: Include <linux/io.h> via <asm/fb.h>
  fbdev: Move framebuffer I/O helpers into <asm/fb.h>
  fbdev: Rename fb_mem*() helpers

 drivers/gpu/ipu-v3/ipu-prv.h                |   1 +
 drivers/video/fbdev/arcfb.c                 |   1 +
 drivers/video/fbdev/arkfb.c                 |   2 +
 drivers/video/fbdev/aty/atyfb.h             |   2 +
 drivers/video/fbdev/aty/mach64_cursor.c     |   4 +-
 drivers/video/fbdev/chipsfb.c               |   3 +-
 drivers/video/fbdev/cirrusfb.c              |   2 +
 drivers/video/fbdev/core/cfbcopyarea.c      |   2 +-
 drivers/video/fbdev/core/cfbfillrect.c      |   1 +
 drivers/video/fbdev/core/cfbimgblt.c        |   1 +
 drivers/video/fbdev/core/fbmem.c            |   4 +-
 drivers/video/fbdev/core/svgalib.c          |   3 +-
 drivers/video/fbdev/cyber2000fb.c           |   2 +
 drivers/video/fbdev/ep93xx-fb.c             |   2 +
 drivers/video/fbdev/hgafb.c                 |   3 +-
 drivers/video/fbdev/hitfb.c                 |   2 +-
 drivers/video/fbdev/kyro/fbdev.c            |   5 +-
 drivers/video/fbdev/matrox/matroxfb_accel.c |   8 +-
 drivers/video/fbdev/matrox/matroxfb_base.h  |   6 +-
 drivers/video/fbdev/pm2fb.c                 |   3 +
 drivers/video/fbdev/pm3fb.c                 |   2 +
 drivers/video/fbdev/pvr2fb.c                |   4 +-
 drivers/video/fbdev/s3fb.c                  |   2 +
 drivers/video/fbdev/sm712fb.c               |   2 +
 drivers/video/fbdev/sstfb.c                 |   4 +-
 drivers/video/fbdev/stifb.c                 |   6 +-
 drivers/video/fbdev/tdfxfb.c                |   5 +-
 drivers/video/fbdev/tridentfb.c             |   2 +
 drivers/video/fbdev/vga16fb.c               |   3 +-
 drivers/video/fbdev/vt8623fb.c              |   2 +
 drivers/video/fbdev/wmt_ge_rops.c           |   2 +
 include/asm-generic/fb.h                    | 102 ++++++++++++++++++++
 include/linux/fb.h                          |  53 ----------
 33 files changed, 167 insertions(+), 79 deletions(-)

-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
