Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F3DC77B76
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Apr 2023 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JcJCkxVZKrgin33H9u/30o86ExV3gLZ5i2fhL64HY/U=; b=Hut685XxCXgrvE
	G3Zoul/a7nJyzgUVbUW/Ky3Bu8QWkf2hXJIMlVLLgqoXENpLL/z01s8DAnhDrZZ0oeldbBt1Rr0Xz
	DlaF1GiNhuSgk2RFKeyk5piZl/lMOwkllsg+Vorp7DY/yrXxv718jXJ/r289vGk7ZT/NS1qB9psBI
	K6g4mDbGpU1XmVd9VA/phPmycv/seRGmrpl9ZajWorfzaZ98LhOot5hRytc22KdtTlOu67ZTS5xJ/
	VeC1EvormtW3YIDoIrTTK+J46pZazTas546TjoVMlbjQyPaLFrRPkSBf6kOazgnYFZR1nEtKyhP1i
	GWuJ7e9ChnnL0uJ6BI3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poPP1-00GVO1-1o;
	Mon, 17 Apr 2023 14:00:19 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poOPt-00GDmH-0B;
	Mon, 17 Apr 2023 12:57:13 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6619121A8F;
	Mon, 17 Apr 2023 12:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681736224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z5oHtiODmT5VtdEUuVBzsB4uvHMHB0s42hEhdpHh3X0=;
	b=o8EYSmai4ek9unF85xHI969+48yfa85qfIP3+4RymV28gSLYyY9FDR+UTXE8+0dAsPldTi
	fzUSHCsPwJdRNnIaPTNXVm6eh+Xt0/OgBlOlyEYTcfcH/o74b0IByUDF75wCEnOkRg7ICD
	Z6M59seIWh9640UG7PmoiKhfgjt8EAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681736224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z5oHtiODmT5VtdEUuVBzsB4uvHMHB0s42hEhdpHh3X0=;
	b=/lhTOEH6NCN9tgeVloDthojbqpOJEg6m78Ct0xTyIktdYBjIavjrJHAT+AVqsRsYT0i8Zq
	4P7Js8tZItMf2DBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 03DF71390E;
	Mon, 17 Apr 2023 12:57:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WPA2Oh9CPWToWwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 12:57:03 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Subject: [PATCH v3 14/19] arch/parisc: Implement <asm/fb.h> with generic helpers
Date: Mon, 17 Apr 2023 14:56:46 +0200
Message-Id: <20230417125651.25126-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230417125651.25126-1-tzimmermann@suse.de>
References: <20230417125651.25126-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_055709_299257_1F59C96E 
X-CRM114-Status: UNSURE (   9.30  )
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

Replace the architecture's fbdev helpers with the generic ones
from <asm-generic/fb.h>. On PARISC, pgprot_writecombine() and
pgprot_noncached() are the same; hence no functional changes.

v3:
	* use default implementation for fb_pgprotect() (Arnd)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/fb.h | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/parisc/include/asm/fb.h b/arch/parisc/include/asm/fb.h
index 0b9a38ced5c8..658a8a7dc531 100644
--- a/arch/parisc/include/asm/fb.h
+++ b/arch/parisc/include/asm/fb.h
@@ -2,23 +2,13 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
-#include <linux/fb.h>
-#include <linux/fs.h>
-#include <asm/page.h>
-
-static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
-				unsigned long off)
-{
-	pgprot_val(vma->vm_page_prot) |= _PAGE_NO_CACHE;
-}
+struct fb_info;
 
 #if defined(CONFIG_STI_CORE)
 int fb_is_primary_device(struct fb_info *info);
-#else
-static inline int fb_is_primary_device(struct fb_info *info)
-{
-	return 0;
-}
+#define fb_is_primary_device fb_is_primary_device
 #endif
 
+#include <asm-generic/fb.h>
+
 #endif /* _ASM_FB_H_ */
-- 
2.40.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
