Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC91C77B76
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Apr 2023 12:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5e14WR3aLfxVwFfaLiI7lyNzyNT0nCqfU/HUhSxymok=; b=fnMuiPx2AeBw/8
	ETas6A2RBHkdWZCo8GKyPxJkSJiDdAfOx1NeRLJ46IGM2TVfj7zf4DC3j34OagYVBdW4/GhVFR7zb
	62thL5xRNMUx0uGaMWHkXXWpevRO18wsixDGlldADeAZ7ldNzAZXvylaXLTQA9o7SLzPQx18cx5oo
	3D+rKaS3uuISPpUkG/YZQLt1/G/IyTAn1qSb/k/ybYEpWwt2dQj+OXQUJFe/byj3KIzZv+Yjl0CNX
	locVNRKTyG/BVt/cpgWBbXBNKsHcj0PsqMd4SQcwtBltJjoxYiNByPR8vgfK2MujWPKMCIH/ep1yg
	ivREc0Bkep470kmlPQAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poOQ2-00GDuV-31;
	Mon, 17 Apr 2023 12:57:18 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poOPn-00GDg2-0P;
	Mon, 17 Apr 2023 12:57:06 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7444321A79;
	Mon, 17 Apr 2023 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681736221; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iG0FY3Kl3gPj6CmaqKKFtjB0wM01q0+Cw6A2hhNMH4g=;
	b=BBEQa6NUG7vLr3ul5YZVF3dQYc/iGt5Ytsx51/ik0XKZftZeHvpY8Xr1Ky2r2Riezga1CI
	4s9UWzwmeoLYidXEPd3PiEv4ng0HDcDsUM/mSSlTqF7QPe9EOOeF4+rEa8ixR44VROWWAk
	HkIWt3+A9rO3XJbubEMNB0mFv6D7TB8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681736221;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iG0FY3Kl3gPj6CmaqKKFtjB0wM01q0+Cw6A2hhNMH4g=;
	b=Sf+t+o+Fk/BHIdeJH+iKB4J3syr51ygn2goItN4HoVYlXk2EHVBX4YTaCqbs4dmMjWg0em
	Hszq33oX/i6vfMAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9AAC1391A;
	Mon, 17 Apr 2023 12:57:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4A9ZNBxCPWToWwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 12:57:00 +0000
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
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 07/19] arch/m68k: Merge variants of fb_pgprotect() into single function
Date: Mon, 17 Apr 2023 14:56:39 +0200
Message-Id: <20230417125651.25126-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230417125651.25126-1-tzimmermann@suse.de>
References: <20230417125651.25126-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_055703_333684_E9B5AE38 
X-CRM114-Status: GOOD (  11.49  )
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

Merge all variants of fb_pgprotect() into a single function body.
There are two different cases for MMU systems. For non-MMU systems,
the function body will be empty. No functional changes, but this
will help with the switch to <asm-generic/fb.h>.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/fb.h | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/include/asm/fb.h b/arch/m68k/include/asm/fb.h
index b86c6e2e26dd..4f96989922af 100644
--- a/arch/m68k/include/asm/fb.h
+++ b/arch/m68k/include/asm/fb.h
@@ -7,17 +7,13 @@
 #include <asm/page.h>
 #include <asm/setup.h>
 
-#ifdef CONFIG_MMU
-#ifdef CONFIG_SUN3
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 				unsigned long off)
 {
+#ifdef CONFIG_MMU
+#ifdef CONFIG_SUN3
 	pgprot_val(vma->vm_page_prot) |= SUN3_PAGE_NOCACHE;
-}
 #else
-static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
-				unsigned long off)
-{
 	if (CPU_IS_020_OR_030)
 		pgprot_val(vma->vm_page_prot) |= _PAGE_NOCACHE030;
 	if (CPU_IS_040_OR_060) {
@@ -25,11 +21,9 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 		/* Use no-cache mode, serialized */
 		pgprot_val(vma->vm_page_prot) |= _PAGE_NOCACHE_S;
 	}
-}
 #endif /* CONFIG_SUN3 */
-#else
-#define fb_pgprotect(...) do {} while (0)
 #endif /* CONFIG_MMU */
+}
 
 static inline int fb_is_primary_device(struct fb_info *info)
 {
-- 
2.40.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
