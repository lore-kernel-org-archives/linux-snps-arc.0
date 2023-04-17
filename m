Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABE0C77B76
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Apr 2023 13:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WhGQKLv2ekhn5nRtaVg9w6OUCdZmOBoYXHWnbys0VY=; b=MBM9VMYFebDjdX
	Zoj25M7mxL3X0gPqamoWcIqT5YUGkiqnuINDAek1o2h1qG0UVDUF3lxfFd6Y/Pji/sFkiJ5BPvDjg
	SqT8qWCwYzueQe7evSKRDbtdBvGKg8iyLpwC2OaEKWrZDwc+ycuGAe2nPGbdXV/vXPMgtb7q4E93x
	/9CXTACZh6ff1alUL99+9PHblOQo//FV/tEQVeayUXk9kAJsRi5kHlih8Vl7uB1r5QxGjEdUoNajo
	91LLooAYhYRdVyJQgb1tQDc0S3oGT22HeOIzNOap5P0orLqqeNRe9tzUlpNMt3KbPdBM5xYbn/TXs
	mh5V1Y59L6RhAUIWucJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poPAg-00GS3m-14;
	Mon, 17 Apr 2023 13:45:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poPAd-00GS39-2A;
	Mon, 17 Apr 2023 13:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DBWm/Eu0c07u8Xvk5dygRLn1Yr7Deg++IVzIGW64CBY=; b=mWqyyO1sihV0wwdVXCICkA7dm3
	24aaUBFkP24MTC1OF52ONsjMo7hAuv7DcwVXg2K7SbFExPW0+amAmvhTu6ZMgPy9oQzCjNd9koXxM
	0gIxqWBorL+C1EAeCKzlX5MMvr/PqXzYxtGZ9VULj/4XSQWgao0WUJvOWr0uwUGvfv5D9DSabYmY9
	kbmQs1n9CiikOlqtxdxhiQWXuoLUDbmPA4DN6lV/DrGzxyooJ/xrrCLR2t++biR11CzgTOg3LOvgv
	K+sxyDP1xRrIFHmGhR+j6w9Vq7/CuWUhDxiDG4XgGxYSKlFr5bu0aBniOm7u/Riz6Jjsrie9WC01v
	sjaH9F4w==;
Received: from smtp-out1.suse.de ([195.135.220.28])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poOPv-00HJmX-0K;
	Mon, 17 Apr 2023 12:57:15 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A995021A91;
	Mon, 17 Apr 2023 12:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681736226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DBWm/Eu0c07u8Xvk5dygRLn1Yr7Deg++IVzIGW64CBY=;
	b=QIDnQQM6FqpjVgjC60BIzr4jVLzaGkJrPhU59Raug1vVtqluGTEOViO9AGJkOal2qP0Dhw
	aZzVrXsrEkBYww32/dW3b+o+nzsoWpJ3KlWyp/2eDW7Po7BW/deXGqlaSDhQpfJvzU431t
	7vS4Z5CGgWaKjF2W4IdAHL05KRzLHEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681736226;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DBWm/Eu0c07u8Xvk5dygRLn1Yr7Deg++IVzIGW64CBY=;
	b=ZsavFsQ/L/cdP5k8oM+73/uhqDnYVY4bVtRCFGtxGI8UdCvsLyzOZjdO14bzgBtVSfTG1F
	/seSez5j0RSvfPDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 356921390E;
	Mon, 17 Apr 2023 12:57:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CEEjDCJCPWToWwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 12:57:06 +0000
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
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 19/19] arch/x86: Implement <asm/fb.h> with generic helpers
Date: Mon, 17 Apr 2023 14:56:51 +0200
Message-Id: <20230417125651.25126-20-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230417125651.25126-1-tzimmermann@suse.de>
References: <20230417125651.25126-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_135711_317309_6E992A59 
X-CRM114-Status: GOOD (  11.42  )
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

Include <asm-generic/fb.h> and set the required preprocessor tokens
correctly. x86 now implements its own set of fb helpers, but still
follows the overall pattern of the other <asm/fb.h> files.

v3:
	* clarified commit message

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/fb.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/fb.h b/arch/x86/include/asm/fb.h
index ab4c960146e3..a3fb801f12f1 100644
--- a/arch/x86/include/asm/fb.h
+++ b/arch/x86/include/asm/fb.h
@@ -2,10 +2,11 @@
 #ifndef _ASM_X86_FB_H
 #define _ASM_X86_FB_H
 
-#include <linux/fb.h>
-#include <linux/fs.h>
 #include <asm/page.h>
 
+struct fb_info;
+struct file;
+
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 				unsigned long off)
 {
@@ -16,7 +17,11 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 		pgprot_val(vma->vm_page_prot) =
 			prot | cachemode2protval(_PAGE_CACHE_MODE_UC_MINUS);
 }
+#define fb_pgprotect fb_pgprotect
+
+int fb_is_primary_device(struct fb_info *info);
+#define fb_is_primary_device fb_is_primary_device
 
-extern int fb_is_primary_device(struct fb_info *info);
+#include <asm-generic/fb.h>
 
 #endif /* _ASM_X86_FB_H */
-- 
2.40.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
