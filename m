Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23733C7EE2A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 12 May 2023 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pnl328pppyTGx6WrC2Is/YwqYPjmkmXjNnwmjYtLqu4=; b=xT3dWPKSztilCi
	nzl3B9yTruX/IkLu+5b8K+q/xOKhq9T3gCBmXNj0ttLJTlWDWy2Ho7+yqjzv0ElKj5qICbcyZWkcP
	c70qtY1176FSwJiq2ZOYJW5tRTFDDw/BsPt6R6pLG62a+kgl0nMwYuwTnr6XJaS+quU0eL20WdhcP
	fv8Kgy48SEM57qo99OpOgbeZQEWaqdC5gEGUWcT/JCFUDkGOcoFEXzXyomIzCvRfzSMehC82uNZHU
	+J8gyJ/ijbOLY7+w3u4UGSLxgu8YadjHDA8tlFW/9+IpRupeAUZhhkUo26r2Zw2YX9S0Qg3pV5YDV
	zbaYGPUUOH3NYOR4XrVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPxR-00Bb5T-1y;
	Fri, 12 May 2023 10:25:05 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPxH-00Bars-1y;
	Fri, 12 May 2023 10:24:57 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 13F4C22851;
	Fri, 12 May 2023 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683887088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=03FKWvzl+iydak6zPBgn3CINrXf9q24laH3mFu/UDVA=;
	b=efQrtDvcMNmdx7Lf3hPzhgO+haLQO8FFkihKcR4RW6GMgCizKSa5taKF1ivd1Wul2WlBI7
	yYifZlqYEWZuns6ICOgPip0ZAIkz+iqMb/X5lFqeg3aUpxwXTGXlSM2T8bQb667IYIXy29
	YzTfy8QYFhxTNGBrbeCFATtgp+Hl1Vs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683887088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=03FKWvzl+iydak6zPBgn3CINrXf9q24laH3mFu/UDVA=;
	b=u/CCArIGXSgjvSc67gCWzgTlB6iJbsD6FCzIRHoAlgiPiMEcmDNuRKIugzjo0RGV4tSzoT
	EK3HhoeWHRS2vbBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A7E5213466;
	Fri, 12 May 2023 10:24:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2EAjKO8TXmS5XwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 12 May 2023 10:24:47 +0000
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
Subject: [PATCH v7 4/7] fbdev: Include <linux/io.h> in various drivers
Date: Fri, 12 May 2023 12:24:41 +0200
Message-Id: <20230512102444.5438-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512102444.5438-1-tzimmermann@suse.de>
References: <20230512102444.5438-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_032455_799324_A554FA03 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

The code uses writel() and similar I/O-memory helpers. Include
the header file to get the declarations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/video/fbdev/arcfb.c       | 1 +
 drivers/video/fbdev/aty/atyfb.h   | 2 ++
 drivers/video/fbdev/wmt_ge_rops.c | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index 7750e020839e..ace104850e50 100644
--- a/drivers/video/fbdev/arcfb.c
+++ b/drivers/video/fbdev/arcfb.c
@@ -41,6 +41,7 @@
 #include <linux/vmalloc.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/arcfb.h>
diff --git a/drivers/video/fbdev/aty/atyfb.h b/drivers/video/fbdev/aty/atyfb.h
index 465f55beb97f..30da3e82ed3c 100644
--- a/drivers/video/fbdev/aty/atyfb.h
+++ b/drivers/video/fbdev/aty/atyfb.h
@@ -3,8 +3,10 @@
  *  ATI Frame Buffer Device Driver Core Definitions
  */
 
+#include <linux/io.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
+
     /*
      *  Elements of the hardware specific atyfb_par structure
      */
diff --git a/drivers/video/fbdev/wmt_ge_rops.c b/drivers/video/fbdev/wmt_ge_rops.c
index 3ed143457d22..b70961901683 100644
--- a/drivers/video/fbdev/wmt_ge_rops.c
+++ b/drivers/video/fbdev/wmt_ge_rops.c
@@ -9,7 +9,9 @@
 
 #include <linux/module.h>
 #include <linux/fb.h>
+#include <linux/io.h>
 #include <linux/platform_device.h>
+
 #include "core/fb_draw.h"
 #include "wmt_ge_rops.h"
 
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
