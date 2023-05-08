Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466BBC77B75
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 May 2023 11:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XuKE6QLFTaWgtCFXwIjZwZGhvngC9U0C2V6kYZw1MBE=; b=jmfZAAQtyJn3ph
	UTPes2pGqj0NemqN08RlhHkBAbNwadY0S1/+39sw67qITbD48DNSAR7QBz58aU01YR8rapiWFXlHm
	0/3CWOK+W5WCSFtO3iW5ZWuz7gu0/mkqJfv1SrzE/fyDchiz0u70evUigC7qJu9uDsveuDu1JLAMx
	8xNvaVyVV1SKOFA2850fOJCvUjNzi9IJUpDgl4UKNfVpHW7yXDcQZRrzKJRCdWUl9rkzVP98L3nqq
	AlOpDQER7tpmUt/v27PhvZqkeWx6H/8X76akt8gkOTyHx3oghFMlth2ekcbqeLCyz12g0vTY0cFYF
	3z/WtzmSkkdFsEuumSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzM8-000RIW-2o;
	Mon, 08 May 2023 11:48:40 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzM5-000RH9-2W;
	Mon, 08 May 2023 11:48:39 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EB97C21D1E;
	Mon,  8 May 2023 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683546511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9Sebc4x1LtKsCXOKUFkPrRuThN42LEoCL9B7L3OU8Kc=;
	b=iq8iKwt6Ve77LLPIfH0nlw1Lw3NCgGCEf77dia+bCG7rwiu8ivTHobHUsQrHNkgAB07b3J
	UFHQ0HM0eoTujpICjcoHcZVkpDnfDEXP5h4uTvIyc288DUNI7YFU8tau8LLYnoabaED30i
	8DLC9MXQKzQPx8rDMNkVHrgQO2HcZ18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683546511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9Sebc4x1LtKsCXOKUFkPrRuThN42LEoCL9B7L3OU8Kc=;
	b=6ioBTZWbuMAZgGUHWtl0jsPX1qOMJtBJsYg0JblVAjrrxM7pNYcYez/6zX0ce0wgibhl4W
	/te6CT8S5sKG4wDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 874881346B;
	Mon,  8 May 2023 11:48:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id klD5H4/hWGQvNwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 08 May 2023 11:48:31 +0000
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
	sam@ravnborg.org,
	suijingfeng@loongson.cn
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
Subject: [PATCH v5 0/6] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
Date: Mon,  8 May 2023 13:48:24 +0200
Message-Id: <20230508114830.28182-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_044837_963923_40841D2D 
X-CRM114-Status: GOOD (  10.11  )
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

Fbdev provides helpers for framebuffer I/O, such as fb_readl(),
fb_writel() or fb_memcpy_to_fb(). The implementation of each helper
depends on the architecture, but they are all equivalent to regular
I/O functions of similar names. So use regular functions instead and
move all helpers into <asm-generic/fb.h>

The first patch a simple whitespace cleanup.

Until now, <linux/fb.h> contained an include of <asm/io.h>. As this
will go away, patches 2 to 4 prepare include statements in the various
drivers. Source files that use regular I/O helpers, such as readl(),
now include <linux/io.h>. Source files that use framebuffer I/O
helpers, such as fb_readl(), now include <linux/fb.h>.

Patch 5 replaces the architecture-based if-else branching in 
<linux/fb.h> by helpers in <asm-generic/fb.h>. All helpers use Linux'
existing I/O functions.

Patch 6 harmonizes naming among fbdev and existing I/O functions.

The patchset has been built for a variety of platforms, such as x86-64,
arm, aarch64, ppc64, parisc, m64k, mips and sparc.

v5:
	* fix build on s390
v4:
	* keep fb_mem*() as-is on ia64, loongarch, sparc64 (Arnd)
	* don't include <asm/fb.h> (Sam)
v3:
	* add the new helpers in <asm-generic/fb.h>
	* support reordering and native byte order (Geert, Arnd)
v2:
	* use Linux I/O helpers (Sam, Arnd)

Thomas Zimmermann (6):
  fbdev/matrox: Remove trailing whitespaces
  ipu-v3: Include <linux/io.h>
  fbdev: Include <linux/io.h> in various drivers
  fbdev: Include <linux/fb.h> instead of <asm/fb.h>
  fbdev: Move framebuffer I/O helpers into <asm/fb.h>
  fbdev: Rename fb_mem*() helpers

 arch/ia64/include/asm/fb.h                  |  20 ++++
 arch/loongarch/include/asm/fb.h             |  21 ++++
 arch/parisc/video/fbdev.c                   |   3 +-
 arch/sparc/include/asm/fb.h                 |  20 ++++
 arch/sparc/video/fbdev.c                    |   1 -
 arch/x86/video/fbdev.c                      |   2 -
 drivers/gpu/ipu-v3/ipu-prv.h                |   1 +
 drivers/staging/sm750fb/sm750.c             |   2 +-
 drivers/video/fbdev/arcfb.c                 |   1 +
 drivers/video/fbdev/aty/atyfb.h             |   2 +
 drivers/video/fbdev/aty/mach64_cursor.c     |   2 +-
 drivers/video/fbdev/chipsfb.c               |   2 +-
 drivers/video/fbdev/core/fbcon.c            |   1 -
 drivers/video/fbdev/core/fbmem.c            |   6 +-
 drivers/video/fbdev/kyro/fbdev.c            |   2 +-
 drivers/video/fbdev/matrox/matroxfb_accel.c |   6 +-
 drivers/video/fbdev/matrox/matroxfb_base.h  |   4 +-
 drivers/video/fbdev/pvr2fb.c                |   2 +-
 drivers/video/fbdev/sstfb.c                 |   2 +-
 drivers/video/fbdev/stifb.c                 |   4 +-
 drivers/video/fbdev/tdfxfb.c                |   2 +-
 drivers/video/fbdev/wmt_ge_rops.c           |   2 +
 include/asm-generic/fb.h                    | 102 ++++++++++++++++++++
 include/linux/fb.h                          |  55 +----------
 24 files changed, 188 insertions(+), 77 deletions(-)

-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
