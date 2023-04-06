Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9A2C77B6F
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Apr 2023 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQtAJ+6PY60OoaZ3+1a1Mn0pgCqAdHveTx87iBOHLjQ=; b=01x/qmdL91vBkf
	cpnynxXZx/Tu0IIfkYHDf7FBKQ2jUu5xnTiJUZMQtXN08btK21wZWUis6d4/RG73uq86yeRcpyE0c
	LseqQRi4S0cCiaj40PNOIDEArU8HaF4TS5CmKstbZE3GwSayO/4oISLfNjhB4ABiEKl+JIDnAFS1H
	1mk0r6KNNr4rWERYEWgDMsn7i+YQeQPYpSwl/7KOSBgcn9TUw9j9A9IOiFCWYwqdcP24IbdkDl3ZL
	uc/EFHG1V7eoeRdqbGzk1ntSDGayEGofBiJBv8F56dWNESb200yyyAsR19sZHuTaixgrgNPT9Wr3v
	+4KQ11mHNjhcHpTk7uXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQeN-007bjO-31;
	Thu, 06 Apr 2023 14:31:43 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQdC-007aT8-0Q;
	Thu, 06 Apr 2023 14:30:35 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D5FD91FDF2;
	Thu,  6 Apr 2023 14:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680791428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71VNfsKZX21kPltfa26zoLxdcK7hCGiNFPNtUKnXF5k=;
	b=fqt1jip3stU+8D9YQrjPJK4a1r6ghRACLyxjQ7IsTRhU8EYM2lqVPNr+MEkiIoS60BmwyN
	s5aJL1tyCYjE5M0b6x4LUaopMiR3JDlwb7KDJGEbtxrsZJwJ+m3+lZ5w/9NGAPKvMf7woE
	gbkepqSDZQqB+xb+16//WGXdS62Ck6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680791428;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71VNfsKZX21kPltfa26zoLxdcK7hCGiNFPNtUKnXF5k=;
	b=XKmXAFYzoUXcr6RfT86GE0gdzFCDclU0xxapB5sO9/C5zZPxiXSM/L77eWB2BlTbobB8gt
	SRJS0vulxKVi5yDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77AD41351F;
	Thu,  6 Apr 2023 14:30:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wPB4HITXLmS4LgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 14:30:28 +0000
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
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v2 18/19] arch/sparc: Implement <asm/fb.h> with generic helpers
Date: Thu,  6 Apr 2023 16:30:18 +0200
Message-Id: <20230406143019.6709-19-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406143019.6709-1-tzimmermann@suse.de>
References: <20230406143019.6709-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_073030_329120_31EA6893 
X-CRM114-Status: GOOD (  10.06  )
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

Include <asm-generic/fb.h> for correctness. Sparc does provide
it's own implementation of the contained functions.

v2:
	* restore the original fb_pgprotect()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "David S. Miller" <davem@davemloft.net>
---
 arch/sparc/include/asm/fb.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/include/asm/fb.h b/arch/sparc/include/asm/fb.h
index 28609f7a965c..496e58d22e7b 100644
--- a/arch/sparc/include/asm/fb.h
+++ b/arch/sparc/include/asm/fb.h
@@ -2,11 +2,10 @@
 #ifndef _SPARC_FB_H_
 #define _SPARC_FB_H_
 
-#include <linux/fs.h>
-
 #include <asm/page.h>
 
 struct fb_info;
+struct file;
 
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 				unsigned long off)
@@ -15,7 +14,11 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 #endif
 }
+#define fb_pgprotect fb_pgprotect
 
 int fb_is_primary_device(struct fb_info *info);
+#define fb_is_primary_device fb_is_primary_device
+
+#include <asm-generic/fb.h>
 
 #endif /* _SPARC_FB_H_ */
-- 
2.40.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
