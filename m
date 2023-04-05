Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2334BC76188
	for <linux-snps-arc@archiver.kernel.org>; Wed,  5 Apr 2023 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IgukFw9mstiItPJkY2QOizXAn91Aa9z/sgdyBZ0q4CI=; b=2zmYjknQA1w45j
	bf0p9U2DPyGZKFixkzfxeU3ZCQORhYhtINjJ3qWBeCKLNm8MHWvYQ0URri02S/jR1tNdtoMj0rRGv
	aXkGgVgIgtnacxSPDybI5Yx+NmdXVR+9IpdnZ4FBUKuCHQNtcI5Sx8gwmt0OTrn5OwZzZ9r2H9qKm
	LO5YGYHavors11mJup7+VNLEZt4IhcVYshVdAb8ACyQlGNYUy22yA5levl+i2YyerOHkSVM4dOU34
	pghdJBiJnYUCMDxWalXCQUmNy5j+btLw06i6DwVCV4Brr5T7cy4ecpcjN8ee5bh1OTuAc0XZR4fSs
	O4N1xqVNcz5c+6jjpd2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4j9-004mFV-0J;
	Wed, 05 Apr 2023 15:07:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4iH-004lQF-2o;
	Wed, 05 Apr 2023 15:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IqaGH5bCZsBkFAvX5+Jzoaurz1526cXZUawazVolY3Q=; b=XfkELgP7Z7eA7/eUP3JKwhMYpO
	fURy+O+XeS7ciRrBZM7ewTpX8Ym+fgcMlxbttay1D1ZHN52u2A/MhwWT9AMhGMswUH4Axmq+oaVHH
	ECTSyZskJqohC96dmvLU5WpZEZwP2tOlLX+RZ8IrwtK60nRb3x1l6taiysKG8BXLSGHU8cGpGqcBe
	l59bh2nl7wHvexK34KHZZA8xobkF3eoK1kSpVjtTCxa8PUFKIElgoq2LeM0kOK6tuLO2v39rQdC3q
	cGHJQ3ZwX14HueCWJzz2otxQIvOMduB26lAktBb45c2tZMQqlr2xGG7qqJCUrv3OVweK7z+zO6TXo
	D2IR7smA==;
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4iD-009yk5-1h;
	Wed, 05 Apr 2023 15:06:16 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A6E692292F;
	Wed,  5 Apr 2023 15:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680707164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IqaGH5bCZsBkFAvX5+Jzoaurz1526cXZUawazVolY3Q=;
	b=EAP2hhBEMX2UF+K5AbqBYOSUITL59YvwXjZFrjmYInGkSC4bQi8au2BakX+dRxADj7xmdW
	GRKIYKLRzicQVPkC5M+iRwI4GGnTQ/z4eKR5ne0cuSmCS27ScneZt9nig/LfRxHsl5IJmq
	R25KBEb9CmuOvwxMPWlEi/4W4wHb99U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680707164;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IqaGH5bCZsBkFAvX5+Jzoaurz1526cXZUawazVolY3Q=;
	b=kNNFz7D/CQLsl5XIkod5cMLVFQn7XlNIkA+BukecWkwJilK/6k6pXzCCu8Q/GWiohvoYZF
	9BCL8GQbB/lyVVAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A09F13A92;
	Wed,  5 Apr 2023 15:06:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iOb3DFyOLWTPIAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 15:06:04 +0000
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
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH 15/18] arch/sh: Implement <asm/fb.h> with generic helpers
Date: Wed,  5 Apr 2023 17:05:51 +0200
Message-Id: <20230405150554.30540-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405150554.30540-1-tzimmermann@suse.de>
References: <20230405150554.30540-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_160613_667574_132304CD 
X-CRM114-Status: UNSURE (   9.49  )
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

Replace the architecture's fb_is_primary_device() with the generic
one from <asm-generic/fb.h>. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
---
 arch/sh/include/asm/fb.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/sh/include/asm/fb.h b/arch/sh/include/asm/fb.h
index 9a0bca2686fd..1e7b1cfd5b5e 100644
--- a/arch/sh/include/asm/fb.h
+++ b/arch/sh/include/asm/fb.h
@@ -2,19 +2,17 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
-#include <linux/fb.h>
-#include <linux/fs.h>
 #include <asm/page.h>
 
+struct file;
+
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 				unsigned long off)
 {
 	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
 }
+#define fb_pgprotect fb_pgprotect
 
-static inline int fb_is_primary_device(struct fb_info *info)
-{
-	return 0;
-}
+#include <asm-generic/fb.h>
 
 #endif /* _ASM_FB_H_ */
-- 
2.40.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
