Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0512C6FD1F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 Mar 2024 20:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxXtp2ANNNlvuXMMDnVrM7xvKhHYq7tFYuLel5lRk/4=; b=i7XKFOvoitmdaT
	MkvNnlCA1P35rPiM6r7bIS6z5yrx0QPBW4OFmVxo2rVdmBI70yuJ9BTuHvRdmZQkmFbVwfOjQIq6t
	vYMIBvlweB71MCViBo1MVTnpSE+MxALlTO5RPHpvXlLAFL89+cNefu9y+T1gc0uNb0Dtup6MfPsvP
	HxtYR2ONH6c7v15pwSwLZ9GzEu9EdR/JZKyl+c51MTHbQi13aTIwKo1ASwX8dUhevjpETVmkcKGkQ
	cBmthCZGVjHjBZXsvJfzrpTw/mdao4vbUU/BYPRVBAY1svIlnixkPhJ9rhMFA8xlysqLQSHSUuFap
	s2CPEa4vhArERPfiIGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqIwQ-00000001upO-0Ifp;
	Fri, 29 Mar 2024 20:35:10 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqIwI-00000001uls-0TXj;
	Fri, 29 Mar 2024 20:35:05 +0000
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EFC633528A;
	Fri, 29 Mar 2024 20:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1711744499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MEcgOTyAQAoXByBYKUR2lBKOa8ZhmGZAbpGTc5urdcs=;
	b=0N/h/M4oFKP9e6JE78XEh1S/v6uJSKh1uvA1wPsCajar4AYYVB5MtoSQURwicU0FjTA3ZA
	61MBm+lwJkoVB7qIrNvH3IDBG4ar+09OTaZYiATVbRQqTa3K+2VbkUVT17xAR/I3rqyXWN
	Z87CE1W9k4JpKCgCEwSFnBh/TZXfcOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711744499;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MEcgOTyAQAoXByBYKUR2lBKOa8ZhmGZAbpGTc5urdcs=;
	b=pmoyIzmQMCIpxEEegRU389t/9HfEGPbkrxeN/Z4w3PlV59F1yC09nX/ACLDPrFrN/Qx5Ay
	FEGw4evB+gjhIACQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 06E2013A8B;
	Fri, 29 Mar 2024 20:34:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 2ONmAPIlB2YTPgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Fri, 29 Mar 2024 20:34:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	sam@ravnborg.org,
	javierm@redhat.com,
	deller@gmx.de,
	sui.jingfeng@linux.dev
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 1/3] arch: Select fbdev helpers with CONFIG_VIDEO
Date: Fri, 29 Mar 2024 21:32:10 +0100
Message-ID: <20240329203450.7824-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329203450.7824-1-tzimmermann@suse.de>
References: <20240329203450.7824-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Spamd-Result: default: False [2.89 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 RCPT_COUNT_TWELVE(0.00)[28];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,intel.com:email];
	 FREEMAIL_TO(0.00)[arndb.de,ravnborg.org,redhat.com,gmx.de,linux.dev];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: EFC633528A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_133502_347490_DC54ADAB 
X-CRM114-Status: GOOD (  13.09  )
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

Various Kconfig options selected the per-architecture helpers for
fbdev. But none of the contained code depends on fbdev. Standardize
on CONFIG_VIDEO, which will allow to add more general helpers for
video functionality.

CONFIG_VIDEO protects each architecture's video/ directory. This
allows for the use of more fine-grained control for each directory's
files, such as the use of CONFIG_STI_CORE on parisc.

v2:
- sparc: rebased onto Makefile changes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/parisc/Makefile      | 2 +-
 arch/sparc/Makefile       | 4 ++--
 arch/sparc/video/Makefile | 2 +-
 arch/x86/Makefile         | 2 +-
 arch/x86/video/Makefile   | 3 ++-
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 316f84f1d15c8..21b8166a68839 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -119,7 +119,7 @@ export LIBGCC
 
 libs-y	+= arch/parisc/lib/ $(LIBGCC)
 
-drivers-y += arch/parisc/video/
+drivers-$(CONFIG_VIDEO) += arch/parisc/video/
 
 boot	:= arch/parisc/boot
 
diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
index 2a03daa68f285..757451c3ea1df 100644
--- a/arch/sparc/Makefile
+++ b/arch/sparc/Makefile
@@ -59,8 +59,8 @@ endif
 libs-y                 += arch/sparc/prom/
 libs-y                 += arch/sparc/lib/
 
-drivers-$(CONFIG_PM) += arch/sparc/power/
-drivers-$(CONFIG_FB_CORE) += arch/sparc/video/
+drivers-$(CONFIG_PM)    += arch/sparc/power/
+drivers-$(CONFIG_VIDEO) += arch/sparc/video/
 
 boot := arch/sparc/boot
 
diff --git a/arch/sparc/video/Makefile b/arch/sparc/video/Makefile
index d4d83f1702c61..9dd82880a027a 100644
--- a/arch/sparc/video/Makefile
+++ b/arch/sparc/video/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-obj-$(CONFIG_FB_CORE) += fbdev.o
+obj-y	+= fbdev.o
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 662d9d4033e6b..b80d15c29ecc6 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -260,7 +260,7 @@ drivers-$(CONFIG_PCI)            += arch/x86/pci/
 # suspend and hibernation support
 drivers-$(CONFIG_PM) += arch/x86/power/
 
-drivers-$(CONFIG_FB_CORE) += arch/x86/video/
+drivers-$(CONFIG_VIDEO) += arch/x86/video/
 
 ####
 # boot loader support. Several targets are kept for legacy purposes
diff --git a/arch/x86/video/Makefile b/arch/x86/video/Makefile
index 5ebe48752ffc4..9dd82880a027a 100644
--- a/arch/x86/video/Makefile
+++ b/arch/x86/video/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_FB_CORE)		+= fbdev.o
+
+obj-y	+= fbdev.o
-- 
2.44.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
