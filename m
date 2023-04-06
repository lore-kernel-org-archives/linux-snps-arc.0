Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B770C77B76
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Apr 2023 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cUKvrPepMSpg53sexZxxuD9OEvASHI8uBPqgUJx+/Tk=; b=HpYYKG5pj0PuJh
	/2CJKk0ARBWBavXhJkrMJ+53+0iDqZkAZgrEIdA4ks/r0Hs+w+2PelD3k2vMruH8tQLoi7FlmqWbs
	PDeTxYB20TEGboK8q4SVrWycHzd9uNvrrpTrVhvL3K0JymWnUFU0nmEo8D8SJyXJiQfHanx2jXcbh
	o4uk81eLeUzNWR/9pM4/tadho0tY/sxEwhCrnbq5PQin94jT8hj+aigpsGTekiQv2oJpmhJoCe2RR
	SJbYB+TkfxsBpd/Yxm4H2/OGxbsDjqF28dakrkKa4n32+ReNLQY9QRiW538sY5VUZGUDY46Fy+xZ2
	7rvtSDtCDMrmx+qO1rxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQeE-007bYW-1l;
	Thu, 06 Apr 2023 14:31:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQdH-007aYw-1M;
	Thu, 06 Apr 2023 14:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MGwV+C2zhRavo4V9t/lCv4GV6nwBEOvq18lFk5ZhtVo=; b=Fzk2vYZKH1FgZ9AvGPWsbWsFLs
	A/118BogqIsg8j/t09uTzeWJ7Php0I145SpCOoXVpBqVFAG7H+EtyTtMnDP5alXDTPrnBmRizQjLu
	lBLSD1SQr4cIi2GYTiHMbTv92OOgq+HUx3FvXVZcBVvZWDUgGchPv9OZVfqJEmhNg/d53ezc9eUX3
	k+7bFvy+sWdtlhPvt902FP56lhEFdR8OT7j4FbmM59k4CQSgZy72v/2xuGSlBsOW9vf765QvM4F9O
	NYQ/PHAWyY/RSKFusFLsFRTkh8oNeiJ5fBvsNzHKcQ73oU1rLPmWPqLsz88dy5qj5B6lqW/xr8oNg
	a1wwE+Zg==;
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQdC-00AXvw-0P;
	Thu, 06 Apr 2023 14:30:32 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0B7D32277B;
	Thu,  6 Apr 2023 14:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680791427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGwV+C2zhRavo4V9t/lCv4GV6nwBEOvq18lFk5ZhtVo=;
	b=GKU/yERBLXSqa5Xw2kqzBrOQelvJeFn5od+onZY12mRvTfwt5PaFS3YELo5aGzPuzWZHWG
	AAtYtZ5y0f3X9RST1b72uM2aZF8DkObL60lfnnyEE+lmWBNERqzNSM53uESvVbRPA42YSu
	Tu3yENRAw8hMVD3tHQ4EDfSCzokSQ2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680791427;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGwV+C2zhRavo4V9t/lCv4GV6nwBEOvq18lFk5ZhtVo=;
	b=fQjMTaVbRk7nSIWp3Vp/7VuQziMxR3bGoTEpQnNHoVSgZ3BpeGJvaV3PJX38cgp5X1QCBR
	xKBnkSkW1Ip+aHDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A88541351F;
	Thu,  6 Apr 2023 14:30:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sJJOKILXLmS4LgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 14:30:26 +0000
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
Subject: [PATCH v2 14/19] arch/parisc: Implement <asm/fb.h> with generic helpers
Date: Thu,  6 Apr 2023 16:30:14 +0200
Message-Id: <20230406143019.6709-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406143019.6709-1-tzimmermann@suse.de>
References: <20230406143019.6709-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_153030_315925_76C91085 
X-CRM114-Status: UNSURE (   8.78  )
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
one from <asm-generic/fb.h> on systems without CONFIG_STI_CORE. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/fb.h | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/parisc/include/asm/fb.h b/arch/parisc/include/asm/fb.h
index 0b9a38ced5c8..66bb401c0cda 100644
--- a/arch/parisc/include/asm/fb.h
+++ b/arch/parisc/include/asm/fb.h
@@ -2,23 +2,24 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
-#include <linux/fb.h>
-#include <linux/fs.h>
 #include <asm/page.h>
+#include <asm/pgtable.h>
+
+struct fb_info;
+struct file;
 
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 				unsigned long off)
 {
 	pgprot_val(vma->vm_page_prot) |= _PAGE_NO_CACHE;
 }
+#define fb_pgprotect fb_pgprotect
 
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
