Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64828C7618E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Apr 2023 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2q7AnlExhjqnJtSZN6ZODGHtJcJOCCS2AH2SlZOdRA=; b=vHIMCbrDVLev0l
	lqEGhVWm7AqLeeIPp3lnMVPpPpcrlENVk6+nRnVHaeQJP1BQKqyl05lroelCgOmSs61zHNzx57Usz
	ZAZGvX6uvWvHUpYj0q6syBYb0bXMeJlAsgAPUSKEdMkANq6Qu3zxmkvGPC1UFlJrZ5I6jp2Z5yTTS
	OLgHbAlaK1nAirjMt1vpDS6Dv3Vg5wIQHXronwBN6fIZw/hsVKLMoH8t0YXKQ1RDX5hKZGc377KIE
	xsysuzvpcJyduvyNtUXOKe0cckPh+mRJo+6MraXS+stUciNtkedhnUIcibWQs9qEVqMadeUTAtav4
	7aDbrbgxpRUgW6DNQoTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prepI-0040mY-24;
	Wed, 26 Apr 2023 13:04:52 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1preov-0040XQ-1r;
	Wed, 26 Apr 2023 13:04:31 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 310841FDCF;
	Wed, 26 Apr 2023 13:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682514264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a8LPWjgILTwzCXTnxMyf3UL56Gir03CTrjJ1dELdifc=;
	b=EfRc92Sr1WCaXKFrd/ogIWedsS0KZ6wsRlt7Ce8tSnZiY6R9QeaQ8G0StXVvC+10DBkI5S
	OV6+MMs8L5hb2QfRpzYRxAlYbbxHBS2NHt+XGf8jS9NjmlZqhXlCbJV9l1f7oUU/iLZC/n
	vqVMs1NN64s6Hdpo4vIVIazbSdX12xY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682514264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a8LPWjgILTwzCXTnxMyf3UL56Gir03CTrjJ1dELdifc=;
	b=WIjbxmPVQaE7LRd8c4VI/hRl5fLHmsAFUZea71Fp0j+fi1ILi/FaSeO7u4y4NQCJCosLuG
	TLAw/R4FSg+aPODw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C90F61390E;
	Wed, 26 Apr 2023 13:04:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oM5MMFchSWSBMgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 26 Apr 2023 13:04:23 +0000
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
	arnd@arndb.de
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
Subject: [PATCH 3/5] fbdev: Include <linux/io.h> in various drivers
Date: Wed, 26 Apr 2023 15:04:18 +0200
Message-Id: <20230426130420.19942-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426130420.19942-1-tzimmermann@suse.de>
References: <20230426130420.19942-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_060429_769128_47809124 
X-CRM114-Status: UNSURE (   9.96  )
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
---
 drivers/video/fbdev/arcfb.c       | 1 +
 drivers/video/fbdev/aty/atyfb.h   | 2 ++
 drivers/video/fbdev/wmt_ge_rops.c | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index 45e64016db32..d631d53f42ad 100644
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
index 42255d27a1db..99c7b0aea615 100644
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
2.40.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
