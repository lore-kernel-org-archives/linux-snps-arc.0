Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81CCC7EE45
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 May 2023 11:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=No1JUJcJvI/ObvJUj06JFNP4CBNsWAqTmcwnrrmvOew=; b=kpTrzi3WKrsaQ0
	loXlTIayYzndKh03G/mwVSzZKH8aD/000jWKKzqXgy3QYCRvfw+x0WjxEfyEpFC7xmcghVd6+O51/
	wCJYC0IKmU80i/wVebojE/LxtaRpkS9vELMBDCMBawXx0Dv3SsDtpG+jEq03LfGiy/nPyUYWpbjt0
	y6ToIwW6NTDji9b6cT4tfNlV9HcJVIvno1meaUOaGalc2AhyrYAGe5DRqh5vua9s0e4Tamu0X3unT
	Su6gLB2hQh47SiGJVpJfBwqkRw8ckikScBlwWHCgl8kx9RNE/kwtC2JNdg4mIf6DZzupGgWTxWxy3
	Z1epGZR5ZMTd8Tp5NMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzMG-000RNz-1D;
	Mon, 08 May 2023 11:48:48 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzMA-000RHy-1H;
	Mon, 08 May 2023 11:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZAIMQjO0mj50iqN3Ds+hTpS1uFpGDEW+ohwIrrgKtAw=; b=CxtUPVVBhxcJKKdpeeN2ECeMpH
	A8tjwIH3eiEv6xH4VsSfUapl8HxnihRZQQ06oDvTFLQStzWuaSEwIZaSDTUrKsexJmoeCzeiVU7tX
	FJ8cmfUB1bAS3rWXPqowS5JI/yd41SPw4JpJmSL3odfXSjQ9FjqZgHbti0Z0yddRNOLKtR0YLbUEC
	n1boLdnnhYwufCAL796ytM89Nx858jJWJUMzSNfC3xi90DkUZBhjqXNhOyoOFp6ujc3rwiBOSXK3A
	vRcrfUD44l5K7bNRXRxIJwdUWT4b+wFOSpXagjXYcvsIfje4xYgWL9Q0pxoate8HcZE3uwWa6deJD
	ULulQ+wQ==;
Received: from smtp-out2.suse.de ([195.135.220.29])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzM4-0059CU-1G;
	Mon, 08 May 2023 11:48:40 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A6E4A1FE46;
	Mon,  8 May 2023 11:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683546513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZAIMQjO0mj50iqN3Ds+hTpS1uFpGDEW+ohwIrrgKtAw=;
	b=e1/3dX2p7Hi10DAONEnreSZyeXHUr/AbLxaSDtztYQnSahcUnxokOQGISDtoAVV/5DQScw
	cZ8FMXutOqQs1brDbaAd4FReoWK9GYSmefMeEaiLzPD512x3Qf3KEtjRBE6CTsQOcmbKxj
	Flu5Vx3QwPKia2rG0CXxXXVon/LMm3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683546513;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZAIMQjO0mj50iqN3Ds+hTpS1uFpGDEW+ohwIrrgKtAw=;
	b=NdArMZtCWDUEDdv41y1evwZG5HhTGbDXsQM/LuMLtYiB4e3KArx5dTNSp6HBd3z2jA2VZU
	AT4AxIZSGUv+G4Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4437E1346B;
	Mon,  8 May 2023 11:48:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QEbYD5HhWGQvNwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 08 May 2023 11:48:33 +0000
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
Subject: [PATCH v5 4/6] fbdev: Include <linux/fb.h> instead of <asm/fb.h>
Date: Mon,  8 May 2023 13:48:28 +0200
Message-Id: <20230508114830.28182-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230508114830.28182-1-tzimmermann@suse.de>
References: <20230508114830.28182-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_124836_644970_92EE3A31 
X-CRM114-Status: GOOD (  12.28  )
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
index 3fd95a79e4c3..38f7e83fa6e3 100644
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
index 08cb47da71f8..c0f97160ebbf 100644
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
