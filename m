Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2728C7EE2A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 10 May 2023 11:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmO7aVOZsspe4EArW9Dbzt4F55AsHrwUghZobMDHKtc=; b=kjsAnNTK05YK6I
	YNtiAS9ZiFp0hjEYC6yNcRvA2X+OpF+AtSebtFlV8qF9CzuVL6ryADg4EIf0UwgNNPi46SbMyFjbj
	cXDCam19rhN0ffAvk/hp65I3lMPMts3MwEZHGQ4iw7TpcLf14KwjpRY+CEQr2GsCGKEi3641Ahejw
	thRwVCPJAYtljXRJa4wXOE79aPMunFelGk3hv+0nNMZrC0TF90c0sLGVl1+Mn6SPledChZvBs6FJG
	NlSnJkdtbZJa8jvdkgljtixfj01AwkLlASEsLsLtWzBHVHgVoSUEfMgkGsQGmLGcCv5ksl2U395kH
	MbOVKsZHkxTHOdRYUTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwheJ-005y8g-1i;
	Wed, 10 May 2023 11:06:23 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwhe8-005xy7-0N;
	Wed, 10 May 2023 11:06:14 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 658C321923;
	Wed, 10 May 2023 11:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683716767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ysswJRH+ycp50fkMLEif6ClRKKPb7fDxKPwkFFsuYNs=;
	b=yXwBBWLXt+rmUK8LbEDUUTMQXqS0pY8g1wtCe2XkmuHGDgvzHgk5gDAstozCwh0qnBg/TJ
	iDDOJ0uZ/CWdJS9quG2foe3clCXc9E1FVgjNnSytAtn9fljvbXsHzotvA9FrBZQ7G1uTDh
	eH5M9cT3RKHHIp92OKVxutnWTuLK3tw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683716767;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ysswJRH+ycp50fkMLEif6ClRKKPb7fDxKPwkFFsuYNs=;
	b=1lbhgwmeWrvTS6C8RCu73CHVTHeEEiiVrdOFjJMH9+6aAST/nim0lRRCpIfXGSlb0jvXA3
	GqIKQoAhDoPy+wBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0695A13519;
	Wed, 10 May 2023 11:06:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UOWhAJ96W2QfRAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 10 May 2023 11:06:07 +0000
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
Subject: [PATCH v6 4/6] fbdev: Include <linux/fb.h> instead of <asm/fb.h>
Date: Wed, 10 May 2023 13:05:55 +0200
Message-Id: <20230510110557.14343-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510110557.14343-1-tzimmermann@suse.de>
References: <20230510110557.14343-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_040612_306511_915FC05B 
X-CRM114-Status: GOOD (  12.37  )
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

Replace include statements for <asm/fb.h> with <linux/fb.h>. Fixes
the coding style: if a header is available in asm/ and linux/, it
is preferable to include the header from linux/. This only affects
a few source files, most of which already include <linux/fb.h>.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/parisc/video/fbdev.c        | 3 +--
 arch/sparc/video/fbdev.c         | 1 -
 arch/x86/video/fbdev.c           | 2 --
 drivers/staging/sm750fb/sm750.c  | 2 +-
 drivers/video/fbdev/core/fbcon.c | 1 -
 drivers/video/fbdev/core/fbmem.c | 2 --
 include/linux/fb.h               | 2 ++
 7 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/parisc/video/fbdev.c b/arch/parisc/video/fbdev.c
index 4a0ae08fc75b..137561d98246 100644
--- a/arch/parisc/video/fbdev.c
+++ b/arch/parisc/video/fbdev.c
@@ -5,10 +5,9 @@
  * Copyright (C) 2001-2002 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  */
 
+#include <linux/fb.h>
 #include <linux/module.h>
 
-#include <asm/fb.h>
-
 #include <video/sticore.h>
 
 int fb_is_primary_device(struct fb_info *info)
diff --git a/arch/sparc/video/fbdev.c b/arch/sparc/video/fbdev.c
index dadd5799fbb3..25837f128132 100644
--- a/arch/sparc/video/fbdev.c
+++ b/arch/sparc/video/fbdev.c
@@ -4,7 +4,6 @@
 #include <linux/fb.h>
 #include <linux/module.h>
 
-#include <asm/fb.h>
 #include <asm/prom.h>
 
 int fb_is_primary_device(struct fb_info *info)
diff --git a/arch/x86/video/fbdev.c b/arch/x86/video/fbdev.c
index 57ee3c158f97..f41a17ebac48 100644
--- a/arch/x86/video/fbdev.c
+++ b/arch/x86/video/fbdev.c
@@ -7,8 +7,6 @@
  *
  */
 
-#include <asm/fb.h>
-
 #include <linux/fb.h>
 #include <linux/module.h>
 #include <linux/pci.h>
diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 22ace3168723..55e302a27847 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -16,7 +16,7 @@
 #include <linux/pagemap.h>
 #include <linux/screen_info.h>
 #include <linux/console.h>
-#include <asm/fb.h>
+
 #include "sm750.h"
 #include "sm750_accel.h"
 #include "sm750_cursor.h"
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index eb565a10e5cd..c6c9d040bdec 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -75,7 +75,6 @@
 #include <linux/interrupt.h>
 #include <linux/crc32.h> /* For counting font checksums */
 #include <linux/uaccess.h>
-#include <asm/fb.h>
 #include <asm/irq.h>
 
 #include "fbcon.h"
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 4035a57df116..41b0706be635 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -37,8 +37,6 @@
 #include <linux/mem_encrypt.h>
 #include <linux/pci.h>
 
-#include <asm/fb.h>
-
 #include <video/nomodeset.h>
 #include <video/vga.h>
 
diff --git a/include/linux/fb.h b/include/linux/fb.h
index ec978a4969a9..4b4d9a5d200a 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -15,6 +15,8 @@
 #include <linux/list.h>
 #include <linux/backlight.h>
 #include <linux/slab.h>
+
+#include <asm/fb.h>
 #include <asm/io.h>
 
 struct vm_area_struct;
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
