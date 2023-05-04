Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F8DC7EE21
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 May 2023 07:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXPSauQYzByseDbk4z1HaS0UFV7ojJZs5kL6RhcTXeI=; b=W47YZdqG8DA5/h
	Waqck4411W6rv2cAtiINXaPAjDK/mS/tXqRDaLOzQYNKxzVfsCquiqqxpmi+QKiAiXjCpvIaKTuWQ
	oCwd3gI64P6w7jHLagrYVM05qSw/PwqSykb5PBBq4iI/EMSYnbc9xhz+FGEZ/Z3JXbs+PoENJ3TG8
	EOFbN3zb4Jtd+IrdI9/oodWUycxFz/pGl6zDnZKWYk9Hrh2dK+5dEnGKLPlEd9MRHPxfvaDucvjAS
	VIm6npgDn4HAtGztF1GV6trvr8kj5cBDeSr+AiWnSyaOaFS+fh43XTLhMuh0CQ3fYFE+AmcbGbV0h
	MtA/50HHEkmQT6JWdr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puTf2-006wzm-0C;
	Thu, 04 May 2023 07:45:56 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puTes-006wqu-0C;
	Thu, 04 May 2023 07:45:47 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4208D20957;
	Thu,  4 May 2023 07:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683186342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5H+Zv5ICW1VCcW395141Sp0h6W5rJmhJkcf3cNntk1k=;
	b=jTZHsNIHv826JClMMiq9UYZGMzFGJaJUmFo9MbrEc2etcv1Imk6bjIdqOSB4ca+NFx74gp
	MPcqPrEiEpYnKU8aHzG2rVfynSu3P+uyhJhagW+vWHGiyzFF/2jeKe6oQn07LX8LFK9ppT
	1e5KvQTQKxe1mPG9ppawBzBY0ndhjKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683186342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5H+Zv5ICW1VCcW395141Sp0h6W5rJmhJkcf3cNntk1k=;
	b=e9dGkXoxIlAu/5XzSlTi0LiI30WG9FswX194Wl456/sNUlBS8rO2435MeH9k24U1s0pXc0
	SqrsJv6I6uusZ9Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D42F413A90;
	Thu,  4 May 2023 07:45:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yLnwMqViU2S6HAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 04 May 2023 07:45:41 +0000
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
	sam@ravnborg.org
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
Subject: [PATCH v4 1/6] fbdev/matrox: Remove trailing whitespaces
Date: Thu,  4 May 2023 09:45:34 +0200
Message-Id: <20230504074539.8181-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504074539.8181-1-tzimmermann@suse.de>
References: <20230504074539.8181-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_004546_246135_438DD08D 
X-CRM114-Status: GOOD (  13.10  )
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

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/matrox/matroxfb_accel.c | 6 +++---
 drivers/video/fbdev/matrox/matroxfb_base.h  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/matrox/matroxfb_accel.c b/drivers/video/fbdev/matrox/matroxfb_accel.c
index 9cb0685feddd..ce51227798a1 100644
--- a/drivers/video/fbdev/matrox/matroxfb_accel.c
+++ b/drivers/video/fbdev/matrox/matroxfb_accel.c
@@ -88,7 +88,7 @@
 
 static inline void matrox_cfb4_pal(u_int32_t* pal) {
 	unsigned int i;
-	
+
 	for (i = 0; i < 16; i++) {
 		pal[i] = i * 0x11111111U;
 	}
@@ -96,7 +96,7 @@ static inline void matrox_cfb4_pal(u_int32_t* pal) {
 
 static inline void matrox_cfb8_pal(u_int32_t* pal) {
 	unsigned int i;
-	
+
 	for (i = 0; i < 16; i++) {
 		pal[i] = i * 0x01010101U;
 	}
@@ -482,7 +482,7 @@ static void matroxfb_1bpp_imageblit(struct matrox_fb_info *minfo, u_int32_t fgx,
 			/* Tell... well, why bother... */
 			while (height--) {
 				size_t i;
-				
+
 				for (i = 0; i < step; i += 4) {
 					/* Hope that there are at least three readable bytes beyond the end of bitmap */
 					fb_writel(get_unaligned((u_int32_t*)(chardata + i)),mmio.vaddr);
diff --git a/drivers/video/fbdev/matrox/matroxfb_base.h b/drivers/video/fbdev/matrox/matroxfb_base.h
index 958be6805f87..c93c69bbcd57 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.h
+++ b/drivers/video/fbdev/matrox/matroxfb_base.h
@@ -301,9 +301,9 @@ struct matrox_altout {
 	int		(*verifymode)(void* altout_dev, u_int32_t mode);
 	int		(*getqueryctrl)(void* altout_dev,
 					struct v4l2_queryctrl* ctrl);
-	int		(*getctrl)(void* altout_dev, 
+	int		(*getctrl)(void *altout_dev,
 				   struct v4l2_control* ctrl);
-	int		(*setctrl)(void* altout_dev, 
+	int		(*setctrl)(void *altout_dev,
 				   struct v4l2_control* ctrl);
 };
 
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
