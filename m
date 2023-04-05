Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF06DC76188
	for <linux-snps-arc@archiver.kernel.org>; Wed,  5 Apr 2023 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkJEXoHPIWmeBZrVPqxpXXaCttVx+NtWcyut6h27Uxw=; b=U3M5mO4Q/RHTEU
	y8z5qYiWS31E4sNj+9HytIj/t+Qlasn9AUPWkYlHdXlPeU+NIAe5kMmrEf2vOz7zA9f4xxqkucT4G
	gexWVpL+qHrh19HaILNdAeLYQQTChdX0qvsrIrvCgh9cnwoEDSL6EW2SxLQ6eqdAEIG5zY2y9fc2Y
	Ju3XQn+kKoT4+F2y9lp3YTyFO9iLiJv922dRpRat73mlmQn1XjEUvRe+Ufc0som+38LtKgBvwlbb5
	VwIDl+LZVDVDOKrU7VITZ/QGdDmGNbJVnfLsoKiOCJdGTr4wMlQVvJBhO3ZXGO8dAtUHQA2bja4g4
	oU9JJb+5ipApp9Ylp29g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4j8-004mEZ-1X;
	Wed, 05 Apr 2023 15:07:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4iH-004lQG-2t;
	Wed, 05 Apr 2023 15:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=q+mpH3lWZVvZZw0GybWkLSjYq5BHB3GhQ0nOupAiXow=; b=H996M9bvu8s5gm0ijfd9i8KREO
	u7VDrzegfzq6M49abW7OFR+bfma4X+IJC+g3BkuRQAK52sAoUHH4mlQDNfSkBMGckHRuxuQ7aUaHI
	8b/SF8l9WlZC7qagmJaXqrNbZjT93/kNWx0lqhLjmrWZa7n5esdhpIcZlkSZu4aqClbluMwF1/qKd
	4Oxca+AdosboY75bPXI0mIfZY+ZmTXL9P5x3e58T4vg7oBiC2agxEXJ3n4unrCtLwaEeUsMT/JUqU
	3lS3IfkU9C9M6DDjNuytJ9sPM5qVHyf8mOk/zRTgyGc2xKNeiftjZOfm4fJ4d+C3Is/bRBLGFVbrS
	cp/K3Uxw==;
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4iD-009yk4-1h;
	Wed, 05 Apr 2023 15:06:16 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3A13B2292B;
	Wed,  5 Apr 2023 15:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680707164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q+mpH3lWZVvZZw0GybWkLSjYq5BHB3GhQ0nOupAiXow=;
	b=LicFqTX8fjTuSeh/l/X35bxlDP8B4FXjCkki3Zzy0w/RVJEJgln50MQlC+YwUsWpm+wsuW
	LsCrC01nzuORTKhFDmdTYEc6X+OHIeGCXRTgUpynsBs1avGAYwlpABTgYW99LxLym6Sx+3
	dj2ujuuTM5uRJXzkB2eWGjC4OaOBnLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680707164;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q+mpH3lWZVvZZw0GybWkLSjYq5BHB3GhQ0nOupAiXow=;
	b=fo63CBKskL51RafucPuzSsSF1hXQbpsETB7b4i611VZZXmf4SEguxv57DdUnJgnTRkCdq3
	2D0tIH/bnzU4gXCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AED7E13A10;
	Wed,  5 Apr 2023 15:06:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wL/EKVuOLWTPIAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 15:06:03 +0000
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
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 14/18] arch/powerpc: Implement <asm/fb.h> with generic helpers
Date: Wed,  5 Apr 2023 17:05:50 +0200
Message-Id: <20230405150554.30540-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405150554.30540-1-tzimmermann@suse.de>
References: <20230405150554.30540-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_160613_680661_89281733 
X-CRM114-Status: UNSURE (   9.52  )
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
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/fb.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/fb.h b/arch/powerpc/include/asm/fb.h
index 6541ab77c5b9..5f1a2e5f7654 100644
--- a/arch/powerpc/include/asm/fb.h
+++ b/arch/powerpc/include/asm/fb.h
@@ -2,8 +2,8 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
-#include <linux/fb.h>
 #include <linux/fs.h>
+
 #include <asm/page.h>
 
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
@@ -13,10 +13,8 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 						 vma->vm_end - vma->vm_start,
 						 vma->vm_page_prot);
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
