Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D72C77B71
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Apr 2023 14:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+LF1ixhCkLz0xzqOrXpFV8Fe9rpB+yreA7VeWYmxq/Y=; b=T+fxKSNfEClcih
	nj/BS4yQF6FX5vhGpJAVDapFrSlLTDh/ENLd96VHy5MXq/5sAITzgDSxMD/52GJ1kzk6nLlGOmIwq
	l9MezdTw3ba7rfZ94MnZvuWeaTcxq4cRcvzt9qupQJRfddjPUI2eisInpGwT2Ie0L8h40PCwE2OFc
	B+pKuydTHB/yTcNPr5jEVplrvgNMXS+7oLXtI6+bEeC7XJE5In2THC2/X9ilUw2pIkfPm1OfBSITj
	3nnn7Yp1x7uzklh+U13KiMQH688EPCHACHff5buBiiXn0sL7hwfEHrIdNZNhfuVenAzHDoAUXNWm/
	mlZ9hPPuuS/S9f1O3RnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQdA-007aS4-0D;
	Thu, 06 Apr 2023 14:30:28 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQd5-007aNG-1Z;
	Thu, 06 Apr 2023 14:30:25 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 734D01FDF2;
	Thu,  6 Apr 2023 14:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680791421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Qfcv3B3fedBLgcumau4bBH8VjCihrniSXhFDyqRcmIU=;
	b=UMgoJnvCeiK9jxVQtqmeqIxOrlhEykEZKjzSOFgdjYXPOaEeouZr/xPGH92rkXlZMCRCom
	7m0nP4zxeu+AOSSlaHjChhQ5Ltxeby0X9cOePyOoqK+1RJOGmcGU0slDPgitbbzb2e4jHF
	UglT7A7F2x/yJkklxkp32Pp0LoLSC0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680791421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Qfcv3B3fedBLgcumau4bBH8VjCihrniSXhFDyqRcmIU=;
	b=xMs2/mrF+wI+I87wQTE4JPLgLXh4qxf8hQ2bf6jBN7tF2FFTkb2p4x3cm6gAajii019gcw
	1cnGeoKGGcSHFoBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0FF431351F;
	Thu,  6 Apr 2023 14:30:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 9LH5An3XLmS4LgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 14:30:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	daniel.vetter@ffwll.ch,
	deller@gmx.de,
	javierm@redhat.com,
	gregkh@linuxfoundation.org
Cc: linux-arch@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/19] arch: Consolidate <asm/fb.h>
Date: Thu,  6 Apr 2023 16:30:00 +0200
Message-Id: <20230406143019.6709-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_073023_671475_7A26E792 
X-CRM114-Status: GOOD (  12.03  )
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

Various architectures provide <arm/fb.h> with helpers for fbdev
framebuffer devices. Share the contained code where possible. There
is already <asm-generic/fb.h>, which implements generic (as in
'empty') functions of the fbdev helpers. The header was added in
commit aafe4dbed0bf ("asm-generic: add generic versions of common
headers"), but never used.

Each per-architecture header file declares and/or implements fbdev
helpers and defines a preprocessor token for each. The generic
header then provides the remaining helpers. It works like the I/O
helpers in <asm/io.h>.

For PARISC, the architecture helpers are mixed up with helpers
for the system's STI graphics firmware. We first move the STI code
to appropriate locations under video/ and then move the architecture
helper under arch/parisc.

For Sparc, there's an additional patch that moves the implementation
from the header into a source file. This allows to avoid some include
statements in the header file.

Built on arm, arm64, m68k, mips, parisc, powerpc, sparc and x86.

v2:
	* make writecombine the default mapping mode (Arnd)
	* rework fb_pgprotect() on m68k

Thomas Zimmermann (19):
  fbdev: Prepare generic architecture helpers
  arch/arc: Implement <asm/fb.h> with generic helpers
  arch/arm: Implement <asm/fb.h> with generic helpers
  arch/arm64: Implement <asm/fb.h> with generic helpers
  arch/ia64: Implement <asm/fb.h> with generic helpers
  arch/loongarch: Implement <asm/fb.h> with generic helpers
  arch/m68k: Merge variants of fb_pgprotect() into single function
  arch/m68k: Implement <asm/fb.h> with generic helpers
  arch/mips: Implement <asm/fb.h> with generic helpers
  video: Remove trailing whitespaces
  video: Move HP PARISC STI core code to shared location
  arch/parisc: Remove trailing whitespaces
  arch/parisc: Implement fb_is_primary_device() under arch/parisc
  arch/parisc: Implement <asm/fb.h> with generic helpers
  arch/powerpc: Implement <asm/fb.h> with generic helpers
  arch/sh: Implement <asm/fb.h> with generic helpers
  arch/sparc: Implement fb_is_primary_device() in source file
  arch/sparc: Implement <asm/fb.h> with generic helpers
  arch/x86: Implement <asm/fb.h> with generic helpers

 arch/arc/include/asm/fb.h                     |  11 +-
 arch/arm/include/asm/fb.h                     |  15 +-
 arch/arm64/include/asm/fb.h                   |  15 +-
 arch/ia64/include/asm/fb.h                    |  11 +-
 arch/loongarch/include/asm/fb.h               |  15 +-
 arch/m68k/include/asm/fb.h                    |  22 +--
 arch/mips/include/asm/fb.h                    |  10 +-
 arch/parisc/Makefile                          |   4 +-
 arch/parisc/include/asm/fb.h                  |  17 +-
 arch/parisc/video/Makefile                    |   3 +
 arch/parisc/video/fbdev.c                     |  27 +++
 arch/powerpc/include/asm/fb.h                 |   8 +-
 arch/sh/include/asm/fb.h                      |  15 +-
 arch/sparc/Makefile                           |   1 +
 arch/sparc/include/asm/fb.h                   |  26 +--
 arch/sparc/video/Makefile                     |   3 +
 arch/sparc/video/fbdev.c                      |  24 +++
 arch/x86/include/asm/fb.h                     |  11 +-
 drivers/video/Kconfig                         |   7 +
 drivers/video/Makefile                        |   1 +
 drivers/video/console/Kconfig                 |   1 +
 drivers/video/console/Makefile                |   4 +-
 drivers/video/console/sticon.c                |   6 +-
 drivers/video/fbdev/Kconfig                   |   3 +-
 drivers/video/fbdev/stifb.c                   | 158 +++++++++---------
 drivers/video/{console => }/sticore.c         | 123 ++++++--------
 include/asm-generic/fb.h                      |  23 ++-
 .../video/fbdev => include/video}/sticore.h   |  16 +-
 28 files changed, 289 insertions(+), 291 deletions(-)
 create mode 100644 arch/parisc/video/Makefile
 create mode 100644 arch/parisc/video/fbdev.c
 create mode 100644 arch/sparc/video/Makefile
 create mode 100644 arch/sparc/video/fbdev.c
 rename drivers/video/{console => }/sticore.c (95%)
 rename {drivers/video/fbdev => include/video}/sticore.h (99%)


base-commit: a7180debb9c631375684f4d717466cfb9f238660
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: d571861118316645b0124ac21260571720b632e2
prerequisite-patch-id: 15c0024c23be42851054ea840eec195f69716c08
prerequisite-patch-id: 441ee4341b183e4577c20a3f3bdebee529d21c34
prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36
-- 
2.40.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
