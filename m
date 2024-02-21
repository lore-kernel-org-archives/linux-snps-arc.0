Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C74EC48BEB
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Feb 2024 17:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=njbmYG5YkBsQYGLWQ7t9Gp2Xp/5l/XL9AN7L6E+NLjc=; b=28aYFHVIXtWfSN
	hFo2NjJLJzcTIbtj2WS09cO4ywG2gAktuo4iZ1L+9iaYzNQsetl8nVHIBXz7BtbV/t+shAK97/Ivm
	6RJe7UUd7bRRvN8ses91/IsjT269OWIBxtXU9BHLvmmNgGeZCS5tMh7UvDUC4s39Fu2sRwI5RZlf6
	dE9Aj3PF/ZNgmMTaPnWVLHAEpAadH4hiF/Y+pG7YuU/TVwZ3IrdcTo0f0arhytd6llsveBb8kM/yY
	bvCDyuW5Mi2s8IlOQDbOpAhNSa1+h14MBAtRBqaD2mSvsWVtSFAHDUEUBALsYVnB0n8OxwGbqbRZh
	6wGV4WNaNPDxwiipHZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcqCH-00000001sU1-09PO;
	Wed, 21 Feb 2024 17:15:53 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcpF0-00000001f7U-0dME;
	Wed, 21 Feb 2024 16:14:48 +0000
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F16731F385;
	Wed, 21 Feb 2024 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708532074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EgGwYwoUx6YDOWZG1HKfUUV7VxHDb+AJql0GQNOyHnU=;
	b=K4c1qufhD6s+8vEKRFBcGPuhZaooIHP5JVv/R70hQBQnWFQmZLVgKoR6wUnOvSqLL0dNzQ
	83RQA3PpAPej+vsL1dVBXats/1NiCgwnq/F7hmqsO0R5iOhVvJ67IDFv8LBrauP8uKgUxN
	1fWrawf4HekLum0vvQmAcqrxIIHQUDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708532074;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EgGwYwoUx6YDOWZG1HKfUUV7VxHDb+AJql0GQNOyHnU=;
	b=gq7+qRqW4mhSKBM34sGn26zECQEVC6pSvREbpp5Jei0oMUOQSnEB7x1UhK969UnhA0rAPx
	Vwh6Z9986t7h9fCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708532073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EgGwYwoUx6YDOWZG1HKfUUV7VxHDb+AJql0GQNOyHnU=;
	b=Q9nFb8EusLfDMaJ6Vy9tIxZYVNcW7UNpaAgEANWDDedikIbybSdDo3xhI6D9WvuF3k6YVb
	YHqQTMrS0InVDhKhfr62Sh/aA3sw35jDt5rmISjBY8WMjQJ888tbSp1sHhSkUhhEEBXJgd
	J8gF3TIKI2vAv/m+Pbq/AsAr+v1vMx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708532073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EgGwYwoUx6YDOWZG1HKfUUV7VxHDb+AJql0GQNOyHnU=;
	b=GdeXJknDCBw3muabgHw4pX7ne5UnhhoTNfGJdrFXHhoRufe57Pn5uXskMNSW7E9yozO4Vl
	SS7AaBFeqjoDA9Cg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 7FD47139D1;
	Wed, 21 Feb 2024 16:14:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 5fjcHWkh1mVrYwAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Wed, 21 Feb 2024 16:14:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	javierm@redhat.com,
	deller@gmx.de,
	suijingfeng@loongson.cn
Cc: linux-arch@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] arch: Remove fbdev dependency from video helpers
Date: Wed, 21 Feb 2024 17:05:23 +0100
Message-ID: <20240221161431.8245-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [8.80 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[99.99%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[18];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[arndb.de,redhat.com,gmx.de,loongson.cn];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_081438_381184_05FF4DE8 
X-CRM114-Status: GOOD (  13.39  )
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

Make architecture helpers for display functionality depend on general
video functionality instead of fbdev. This avoid the dependency on
fbdev and makes the functionality available for non-fbdev code.

Patch 1 replaces the variety of Kconfig options that control the
Makefiles with CONFIG_VIDEO. More fine-grained control of the build
can then be done within each video/ directory; see sparc for an
example.

Patch 2 replaces fb_is_primary_device() with video_is_primary_device(),
which has no dependencies on fbdev. The implementation remains identical
on all affected platforms. There's one minor change in fbcon, which is
the only caller of fb_is_primary_device().

Patch 3 renames the source and files from fbdev to video.

Thomas Zimmermann (3):
  arch: Select fbdev helpers with CONFIG_VIDEO
  arch: Remove struct fb_info from video helpers
  arch: Rename fbdev header and source files

 arch/arc/include/asm/fb.h                    |  8 ------
 arch/arc/include/asm/video.h                 |  8 ++++++
 arch/arm/include/asm/fb.h                    |  6 -----
 arch/arm/include/asm/video.h                 |  6 +++++
 arch/arm64/include/asm/fb.h                  | 10 --------
 arch/arm64/include/asm/video.h               | 10 ++++++++
 arch/loongarch/include/asm/{fb.h => video.h} |  8 +++---
 arch/m68k/include/asm/{fb.h => video.h}      |  8 +++---
 arch/mips/include/asm/{fb.h => video.h}      | 12 ++++-----
 arch/parisc/Makefile                         |  2 +-
 arch/parisc/include/asm/fb.h                 | 14 -----------
 arch/parisc/include/asm/video.h              | 16 ++++++++++++
 arch/parisc/video/Makefile                   |  2 +-
 arch/parisc/video/{fbdev.c => video-sti.c}   |  9 ++++---
 arch/powerpc/include/asm/{fb.h => video.h}   |  8 +++---
 arch/powerpc/kernel/pci-common.c             |  2 +-
 arch/sh/include/asm/fb.h                     |  7 ------
 arch/sh/include/asm/video.h                  |  7 ++++++
 arch/sparc/Makefile                          |  4 +--
 arch/sparc/include/asm/{fb.h => video.h}     | 15 +++++------
 arch/sparc/video/Makefile                    |  2 +-
 arch/sparc/video/fbdev.c                     | 26 --------------------
 arch/sparc/video/video.c                     | 25 +++++++++++++++++++
 arch/x86/Makefile                            |  2 +-
 arch/x86/include/asm/fb.h                    | 19 --------------
 arch/x86/include/asm/video.h                 | 21 ++++++++++++++++
 arch/x86/video/Makefile                      |  3 ++-
 arch/x86/video/{fbdev.c => video.c}          | 21 +++++++---------
 drivers/video/fbdev/core/fbcon.c             |  2 +-
 include/asm-generic/Kbuild                   |  2 +-
 include/asm-generic/{fb.h => video.h}        | 17 +++++++------
 include/linux/fb.h                           |  2 +-
 32 files changed, 154 insertions(+), 150 deletions(-)
 delete mode 100644 arch/arc/include/asm/fb.h
 create mode 100644 arch/arc/include/asm/video.h
 delete mode 100644 arch/arm/include/asm/fb.h
 create mode 100644 arch/arm/include/asm/video.h
 delete mode 100644 arch/arm64/include/asm/fb.h
 create mode 100644 arch/arm64/include/asm/video.h
 rename arch/loongarch/include/asm/{fb.h => video.h} (86%)
 rename arch/m68k/include/asm/{fb.h => video.h} (86%)
 rename arch/mips/include/asm/{fb.h => video.h} (76%)
 delete mode 100644 arch/parisc/include/asm/fb.h
 create mode 100644 arch/parisc/include/asm/video.h
 rename arch/parisc/video/{fbdev.c => video-sti.c} (78%)
 rename arch/powerpc/include/asm/{fb.h => video.h} (76%)
 delete mode 100644 arch/sh/include/asm/fb.h
 create mode 100644 arch/sh/include/asm/video.h
 rename arch/sparc/include/asm/{fb.h => video.h} (75%)
 delete mode 100644 arch/sparc/video/fbdev.c
 create mode 100644 arch/sparc/video/video.c
 delete mode 100644 arch/x86/include/asm/fb.h
 create mode 100644 arch/x86/include/asm/video.h
 rename arch/x86/video/{fbdev.c => video.c} (66%)
 rename include/asm-generic/{fb.h => video.h} (89%)

-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
