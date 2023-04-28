Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1D2C7EE2A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 Apr 2023 09:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPx7G1dUgWFCfZ+2MxiCp6ae+EIn8/qfLsOyi8uSJnY=; b=DHIyQKpWG7phlS
	hKsovLe3rPIoHFUENKlTxFV2BfZDeEn9EE24MZK53RQzXH0buHEC91DeuDCm0ryQQSsGqJivAi4i7
	dMq43M2gf9Ab4pyiU2DeDQUNcUONFJzKZGfRuI72jVmqaTSJmi6MoZGqVMhERLg5c1SflC2HFEIw1
	Bsa4uF9VHbnSrBcCtYaylynKEoJGKffKknbdjeyKPH+ehkBy+ZTiWT73HxdnV+5m06Tyy/+rqu/OW
	NmDwrklHgVQfZCJAFfk3MQ3M+ACv06nmNAZhpxjW3fb5+ggCa72okYLXNjCyjOoQ4mRt6w8/n+PUe
	QId3cOo6mijJwUpmQ/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psKNw-008dWv-2v;
	Fri, 28 Apr 2023 09:27:24 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psKNq-008dR9-0d;
	Fri, 28 Apr 2023 09:27:19 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9E3EC21E77;
	Fri, 28 Apr 2023 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682674033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R/tS9JBmx3EXdW6NzCCqF9BfBp/DOJu84iEDqCwvGtE=;
	b=wKxtEH3AScg58g5NxG0UbfbNTtkJ6JeTguhi0yuaWoVWndHRO9PO2Cf2ngyyGZzklX0dlO
	rhmnAwE7AgpYoQ4Eo2vXMaT2+AzViZ8qqjtoGII7az2G3WnAitfDMDl2xQ5klB9iTSkfwE
	b8WC6nl9qEmBzJMny3Akxy9v19U7+9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682674033;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R/tS9JBmx3EXdW6NzCCqF9BfBp/DOJu84iEDqCwvGtE=;
	b=B8IcnCwTx9BI4HcJ/KMkG8g3A2nmCE6/2KeuB/KX+ZyJL+mELGUWP9cxf9z9UYuIKVsN/x
	hrdnpVdBZlAPwVDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D5DD139C3;
	Fri, 28 Apr 2023 09:27:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oC0kDnGRS2ReFwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 09:27:13 +0000
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
Subject: [PATCH v2 1/5] fbdev/matrox: Remove trailing whitespaces
Date: Fri, 28 Apr 2023 11:27:07 +0200
Message-Id: <20230428092711.406-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428092711.406-1-tzimmermann@suse.de>
References: <20230428092711.406-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_022718_402570_04891285 
X-CRM114-Status: GOOD (  12.99  )
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
2.40.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
