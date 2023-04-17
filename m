Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E28C77B70
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Apr 2023 13:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8H3PELw8+VAlAPuCAAwxYJaRgwh5ObCQ/AtJf+dkre8=; b=gNCaHQDqimM9Dc
	KQxZdmMA42ze/VaB3prbmOlvtdHOYT1qyfb/wfF7FE333haQW+zG1Z4dVSorLw+4ta09Z0vZZynzs
	p8EGAnPCITyv/7xWiqxjtTD2lH80ICIzVN1rVVgXyqhieEcc2/dzuRTHwObJyIEc0+/84SWC8mLsB
	HbohdY629NpIGOlc2cc1Bvzr4JUJ3rTefhklN3jurcei/FbsyhGj/kG+blReeppHeSWz7+sDtsOHU
	b2N/zldSMRKteYpHv5pHYq9iAHZRulKtVvavLegcpzPkOKhw2/MkctVVM73lcuOC9DXnRotFwzKlb
	XD8BZ7QHHUUH6GnaiG5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poPBj-00GSRe-2f;
	Mon, 17 Apr 2023 13:46:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poPBh-00GSPo-21;
	Mon, 17 Apr 2023 13:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YNg0lz+7KBHL0Jy2/T4bI8sg52Xj/iVvmLTbUyEhSFc=; b=kCgUZGqOuSxKt09zxMnumR7aDw
	IY6NBb717qv3c3Z9JD0vIuzGhSbOI1TIDYJ286xXfiodRom8jaGkRsaXgUT2fsOvkwYCDaVSDRkI0
	ksyZn8x14MRUtif8u+TvVz7aRsEN8uEQifsY2EafgWFTjkg7DIfVNZ8k5k14+UgGbowjI1XZaFSEH
	CHXIAU2t7yXKR/4XTqOSEX0MBMXHjR6RKVLtZElM0HLpvn3jb9XJW/QETjUqn+R7HvOxGdr6nvEQT
	8NErd0qXFlhA9OA/qLeTiPDssT5leof33Yxefj/i11wG1YH8zIHLq6QWZTPmF3H6xTNjhtpmv+NH7
	gPOIOccA==;
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poOPr-00HJm0-08;
	Mon, 17 Apr 2023 12:57:09 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 192D11FE0D;
	Mon, 17 Apr 2023 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681736223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YNg0lz+7KBHL0Jy2/T4bI8sg52Xj/iVvmLTbUyEhSFc=;
	b=1A7fXiy1zKPCuEHooMeIVWVvJlKA/ju1B4NXN7LwNgEtx/G2NE2eLoHXc3y2k3Ny8vAC3o
	bQE8YX9wQ63rTt4qUtIF2zXbQQrnHf3lgS8GpEd9Sq9lWO5AVYvQOKkWBhc3m+Aq4eOa3k
	zlJZR9DLxIUgT46xqhjJXNjAvf7hF6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681736223;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YNg0lz+7KBHL0Jy2/T4bI8sg52Xj/iVvmLTbUyEhSFc=;
	b=8/AlEZDQXt3r2Q36jm3rhtdSm0bNHjwRZn287hcP5LcsmvipnpFbxL//4nCdb/g1kzIQvk
	jnC4JSw7Kh0YkwBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B1AB61391A;
	Mon, 17 Apr 2023 12:57:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SGqRKh5CPWToWwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 12:57:02 +0000
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
Subject: [PATCH v3 11/19] video: Move HP PARISC STI core code to shared location
Date: Mon, 17 Apr 2023 14:56:43 +0200
Message-Id: <20230417125651.25126-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230417125651.25126-1-tzimmermann@suse.de>
References: <20230417125651.25126-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_135707_383840_903F6D5E 
X-CRM114-Status: GOOD (  15.68  )
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

STI core files have been located in console and fbdev code. Move
the source code and header to the directories for video helpers.
Also update the config and build rules such that the code depends
on the config symbol CONFIG_STI_CORE, which STI console and STI
framebuffer select automatically.

Cleans up the console makefile and prepares PARISC to implement
fb_is_primary_device() within the arch/ directory. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/Kconfig                            | 7 +++++++
 drivers/video/Makefile                           | 1 +
 drivers/video/console/Kconfig                    | 1 +
 drivers/video/console/Makefile                   | 4 +---
 drivers/video/console/sticon.c                   | 2 +-
 drivers/video/fbdev/Kconfig                      | 3 +--
 drivers/video/fbdev/stifb.c                      | 2 +-
 drivers/video/{console => }/sticore.c            | 2 +-
 {drivers/video/fbdev => include/video}/sticore.h | 0
 9 files changed, 14 insertions(+), 8 deletions(-)
 rename drivers/video/{console => }/sticore.c (99%)
 rename {drivers/video/fbdev => include/video}/sticore.h (100%)

diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index bf05363d8906..8b2b9ac37c3d 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -11,6 +11,13 @@ config APERTURE_HELPERS
 	  Support tracking and hand-over of aperture ownership. Required
 	  by graphics drivers for firmware-provided framebuffers.
 
+config STI_CORE
+	bool
+	depends on PARISC
+	help
+	  STI refers to the HP "Standard Text Interface" which is a set of
+	  BIOS routines contained in a ROM chip in HP PA-RISC based machines.
+
 config VIDEO_CMDLINE
 	bool
 
diff --git a/drivers/video/Makefile b/drivers/video/Makefile
index 831c9fa57a6c..6bbc03950899 100644
--- a/drivers/video/Makefile
+++ b/drivers/video/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_APERTURE_HELPERS)    += aperture.o
+obj-$(CONFIG_STI_CORE)            += sticore.o
 obj-$(CONFIG_VGASTATE)            += vgastate.o
 obj-$(CONFIG_VIDEO_CMDLINE)       += cmdline.o
 obj-$(CONFIG_VIDEO_NOMODESET)     += nomodeset.o
diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index 22cea5082ac4..a2a88d42edf0 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -141,6 +141,7 @@ config STI_CONSOLE
 	depends on PARISC && HAS_IOMEM
 	select FONT_SUPPORT
 	select CRC32
+	select STI_CORE
 	default y
 	help
 	  The STI console is the builtin display/keyboard on HP-PARISC
diff --git a/drivers/video/console/Makefile b/drivers/video/console/Makefile
index db07b784bd2c..fd79016a0d95 100644
--- a/drivers/video/console/Makefile
+++ b/drivers/video/console/Makefile
@@ -5,8 +5,6 @@
 
 obj-$(CONFIG_DUMMY_CONSOLE)       += dummycon.o
 obj-$(CONFIG_SGI_NEWPORT_CONSOLE) += newport_con.o
-obj-$(CONFIG_STI_CONSOLE)         += sticon.o sticore.o
+obj-$(CONFIG_STI_CONSOLE)         += sticon.o
 obj-$(CONFIG_VGA_CONSOLE)         += vgacon.o
 obj-$(CONFIG_MDA_CONSOLE)         += mdacon.o
-
-obj-$(CONFIG_FB_STI)              += sticore.o
diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index 89ad7ade6cf9..d11cfd2d68b5 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -50,7 +50,7 @@
 
 #include <asm/io.h>
 
-#include "../fbdev/sticore.h"
+#include <video/sticore.h>
 
 /* switching to graphics mode */
 #define BLANK 0
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 96e91570cdd3..485e8c35d5c6 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -551,10 +551,9 @@ config FB_STI
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select STI_CORE
 	default y
 	help
-	  STI refers to the HP "Standard Text Interface" which is a set of
-	  BIOS routines contained in a ROM chip in HP PA-RISC based machines.
 	  Enabling this option will implement the linux framebuffer device
 	  using calls to the STI BIOS routines for initialisation.
 
diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index 99996bc7e6d9..baca6974e288 100644
--- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -69,7 +69,7 @@
 #include <asm/grfioctl.h>	/* for HP-UX compatibility */
 #include <linux/uaccess.h>
 
-#include "sticore.h"
+#include <video/sticore.h>
 
 /* REGION_BASE(fb_info, index) returns the virtual address for region <index> */
 #define REGION_BASE(fb_info, index) \
diff --git a/drivers/video/console/sticore.c b/drivers/video/sticore.c
similarity index 99%
rename from drivers/video/console/sticore.c
rename to drivers/video/sticore.c
index 6ea9596a3c4b..f8aaedea437d 100644
--- a/drivers/video/console/sticore.c
+++ b/drivers/video/sticore.c
@@ -32,7 +32,7 @@
 #include <asm/grfioctl.h>
 #include <asm/fb.h>
 
-#include "../fbdev/sticore.h"
+#include <video/sticore.h>
 
 #define STI_DRIVERVERSION "Version 0.9c"
 
diff --git a/drivers/video/fbdev/sticore.h b/include/video/sticore.h
similarity index 100%
rename from drivers/video/fbdev/sticore.h
rename to include/video/sticore.h
-- 
2.40.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
