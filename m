Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F80C77B76
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Apr 2023 13:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yReTPZdHzoZl6TbygnOq8Bj8VzwGBwJFSE27Fc9/uPA=; b=A8H+qKtKh5Z+rG
	HpZaGiPlZ6UwzXUkZa/OXVTUmtXJa+Ti1i/5EgPC5FuzLbYxx7ZDGTK+ZpYvfcm9GcDnkuMls/f4H
	mdJTkQ1eK4PmtX/E2V98X0DaG5noh0IEUSN3zzU2vG+m5P+EvwmOakUIs9sXjtkQysUSeRpPapQII
	pQ09WKQtxd7wUvkLw7DZu0bSRXVYHIDhIlP/mG9Xb3bNjmVQizK8KL9SG4zL1Jn8sALdNtKjYNslK
	mU8B7uiP5LbSRyqi0v+mXD3rb14MhiG6s8GJqD+RjUBxf/VNTxDOL3peHqrAE9wz3vB2XU1j8tG56
	cmfqzuvJTH6/b6oTJSRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poPBp-00GSUb-1Z;
	Mon, 17 Apr 2023 13:46:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poPBi-00GSPo-05;
	Mon, 17 Apr 2023 13:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=52/I0RjnF2uY+VNuyKQOo7WWM29rXSQ8n+JGXAXTUAU=; b=e/jyen+J7NIerm36uDb90KVjKy
	B0lg6jsSq2HqfJSbbtAfeplIe5lywKFi39W/xZbgOmQ1CCjQdIdkbP416Og/VrGvjN5d39SZEhNDV
	emHpTHDIo+7ojUm+5m89u+51PsBvdM42ne5ENR+uw8VFpJWx0tGIvcGgzFh0QgqvBSnL048+eMp0Z
	iwL1NMU6Lxz+mzF86G2ypFAekrF3AcUIdy2wcVYyR2Tio9fLaDj5TgTZtpHhBw94OoBsFh6Z+Fyit
	XR88a3nt/DsAYbuZnqiwU3+Rgp9JTX4xDBsBlPADQowpMcDdaPcFAKmq6mN+7WRs+S1NDKEseQv2k
	iFnD85WA==;
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poOPr-00HJm6-13;
	Mon, 17 Apr 2023 12:57:09 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 21EBA1FE10;
	Mon, 17 Apr 2023 12:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681736226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=52/I0RjnF2uY+VNuyKQOo7WWM29rXSQ8n+JGXAXTUAU=;
	b=tjiSEtlibVPuCXpDlhIvN/Sd4P34nJn8wDwoxf/GwXT4PXVny0z4hkCg1HlpBo/Ys2u/sT
	KUnai4qKMC5VDUzclYKf34+WWPisdB1gazMiAk1iLzlVm/+Yx25nAaGgGGHliPDwknnwux
	QJ6JWez02gt0uChmRoFHiigzG+RT2RY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681736226;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=52/I0RjnF2uY+VNuyKQOo7WWM29rXSQ8n+JGXAXTUAU=;
	b=g3E9UtZBk7rz7F7uVYk9X/osHE+fEvnv+R727XOmCPq/EA2JmbguASBE107BRpgZVn5JFN
	hsnkV2uzaaiX8KCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF0511391A;
	Mon, 17 Apr 2023 12:57:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0JHPLSFCPWToWwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 12:57:05 +0000
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
Subject: [PATCH v3 18/19] arch/sparc: Implement <asm/fb.h> with generic helpers
Date: Mon, 17 Apr 2023 14:56:50 +0200
Message-Id: <20230417125651.25126-19-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230417125651.25126-1-tzimmermann@suse.de>
References: <20230417125651.25126-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_135707_507208_30232E29 
X-CRM114-Status: UNSURE (   9.90  )
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

Replace sparc64's fb_pgprotect() with the generic one
from <asm-generic/fb.h>. On sparc, pgprot_writecombine() and
pgprot_noncached() are the same; hence no functional changes

v3:
	* use default implementation for fb_pgprotect() on
	  sparc64 (Arnd)
v2:
	* restore the original fb_pgprotect()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "David S. Miller" <davem@davemloft.net>
---
 arch/sparc/include/asm/fb.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/include/asm/fb.h b/arch/sparc/include/asm/fb.h
index 28609f7a965c..689ee5c60054 100644
--- a/arch/sparc/include/asm/fb.h
+++ b/arch/sparc/include/asm/fb.h
@@ -2,20 +2,20 @@
 #ifndef _SPARC_FB_H_
 #define _SPARC_FB_H_
 
-#include <linux/fs.h>
-
-#include <asm/page.h>
-
 struct fb_info;
+struct file;
+struct vm_area_struct;
 
+#ifdef CONFIG_SPARC32
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 				unsigned long off)
-{
-#ifdef CONFIG_SPARC64
-	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+{ }
+#define fb_pgprotect fb_pgprotect
 #endif
-}
 
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
