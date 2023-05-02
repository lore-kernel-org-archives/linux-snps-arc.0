Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1816AC7EE30
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 May 2023 13:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXPSauQYzByseDbk4z1HaS0UFV7ojJZs5kL6RhcTXeI=; b=zhLxsemabhX8g8
	AteJOqnQVqcqlnGhEg+S708ftu9R05YdnLVaSvLg40qBhExEPTnoRYwJqJ8cfMycPn0Ad4/foE1tp
	U30DdaJa3+g/j0C8r82YcaE7aNfWEp2uOQAYZSQs47C/GMvH8rYXo4McR0hysz+q9HedWVO6CT5so
	wR1wfCmIqV7Ue2UBp4pGZSkNpsTtGKSOZcPWAaoyOJ6jHbHD87YHsa+lhu+sA0FJYhJE6SuHFtYM2
	vi8I2ihZz2Rs4YjDOW01pX1tTkiridJvQFLNGLpedFaY37XObaDRC40FhciYFgH3Dfw5JOsIDJLhX
	qjGQELhKo7dTDYPFEk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptpeO-001X5O-0T;
	Tue, 02 May 2023 13:02:36 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptpeI-001X1h-1O;
	Tue, 02 May 2023 13:02:31 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2E43A21B1C;
	Tue,  2 May 2023 13:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683032546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5H+Zv5ICW1VCcW395141Sp0h6W5rJmhJkcf3cNntk1k=;
	b=1vR+ETUxDfsc2rHvp7qUThXMhyo+PDl0wJzW/O/MNiCWy2QKylJ0tn1CT4xGcGQvD2uD8u
	i/0Y7QIbt2kYrxkY6kC7dtKBKkknHsMrK7F5dJH0xSeaBCquX/uj4klmSnYlKwbhuB37/o
	gGEVR7DUdRHbSF0Ot8YETAAsOg117mo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683032546;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5H+Zv5ICW1VCcW395141Sp0h6W5rJmhJkcf3cNntk1k=;
	b=sUEmSt7fBBh+tfNGpVJTkvIUwNAehNlqzxZUl9Hrcvm1mH+1S14snmMjTHwfTqBTFtHVVg
	LRiCLONY8KbwhAAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF02B139D2;
	Tue,  2 May 2023 13:02:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UICJLeEJUWRYTQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Tue, 02 May 2023 13:02:25 +0000
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
Subject: [PATCH v3 1/6] fbdev/matrox: Remove trailing whitespaces
Date: Tue,  2 May 2023 15:02:18 +0200
Message-Id: <20230502130223.14719-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502130223.14719-1-tzimmermann@suse.de>
References: <20230502130223.14719-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_060230_638041_046A7FE3 
X-CRM114-Status: GOOD (  13.30  )
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
