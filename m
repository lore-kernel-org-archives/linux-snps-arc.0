Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379BCC7EE22
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 May 2023 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8BT2uxKMiJR2GIPiIIi2PxOOGyAh42kLaVUE+/N4ZE=; b=Xr/7pTpnI+NxU2
	pit94862AuxX5BcJVyf5l8lyPiAab/sUX0d6Gl9hIMAaH4isPBKgOuuCPCfw6EKQBKLDoBYr0pLbg
	gj1aMhEz6MEmptUcZJEJ9NGgMuxhhicYBxgbTmpAkcoaVuHn7DfOVpCfll4ovtBalXpopsxWrzPPT
	RincM3HhvSpTDWYaxvEH5ERnlDBQYbV/kzQUouKkYmn7UH4SDgVv/e7YKxNhMOEfZSvICpvUMxGuu
	nCGuKffTZYTEEjK4YQBbjYZv/CoppHehYgSK4UNPpV+AtqOyAJrYS71Yw/5CnN6dlXtnXTQWdC4xD
	e9n0q5WGMd85+3wKtWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw0To-000ZqZ-2V;
	Mon, 08 May 2023 13:00:40 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzMA-000RHy-2a;
	Mon, 08 May 2023 11:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S1yfv6u4qx/1SbgHOOfGF6a15XUqEes+242RJIs05U0=; b=asuR1AqHy6FlUBOnIgT2U+Mbx/
	xekNcx/8Sm3otaKbto698gt9kzdyjKtnhoGA4exyosLueQDVL793S/FK9RZRAyMH1z3ooB6LYijLS
	3GQUUoViIrpUrFGgwTSc3R+p/qi9TEzQZMR/Tlbxw7MfSeBCjPWPs2UoszmRA9pnRmHzLFFUwCuy/
	W03J6F3u95ny/YqIJjdX031cyui0nNIoTpyrjtq3aHUMzB4+uaN63cpAZOFZsfA+eFgWF16SVT/xA
	chRvIenZ6Alw9RVqj21tXS02SqPCufiwWtrIpuUCcBS82k85fuyt5MxUVpNRgHvT5ilK3GFNHpf5Q
	+Bxpf23w==;
Received: from smtp-out2.suse.de ([195.135.220.29])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzM4-0059CV-1B;
	Mon, 08 May 2023 11:48:40 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3F42E1FE44;
	Mon,  8 May 2023 11:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683546513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S1yfv6u4qx/1SbgHOOfGF6a15XUqEes+242RJIs05U0=;
	b=1p3uF0dfH61T0fcSDDTVVXyM9+TyBNGvKlmL1qeGua7XjyeCLr6mK75sxb8gU3Gx4pCMcI
	cclADgfud+zO7cmFPRwsvjg+U5hFET3kB18fzW5Uupz/e7N0Fs+2oh9Ti3Es7Ba2jbFlH1
	zme9VYcjHcCTmwYcXB2vIx6xzmOiSrk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683546513;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S1yfv6u4qx/1SbgHOOfGF6a15XUqEes+242RJIs05U0=;
	b=iRrK19IwxhVyz3WuNAI65+K5nBunVmEUdTC1nxhraTbHKQIvf13IVDdjsq2P65PXeeB5ov
	U7kgC6+kY4rtmCAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D397E139F8;
	Mon,  8 May 2023 11:48:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iH7LMpDhWGQvNwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 08 May 2023 11:48:32 +0000
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
	sam@ravnborg.org,
	suijingfeng@loongson.cn
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
Subject: [PATCH v5 3/6] fbdev: Include <linux/io.h> in various drivers
Date: Mon,  8 May 2023 13:48:27 +0200
Message-Id: <20230508114830.28182-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230508114830.28182-1-tzimmermann@suse.de>
References: <20230508114830.28182-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_124836_647487_59EDD2B3 
X-CRM114-Status: GOOD (  10.13  )
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

The code uses writel() and similar I/O-memory helpers. Include
the header file to get the declarations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/video/fbdev/arcfb.c       | 1 +
 drivers/video/fbdev/aty/atyfb.h   | 2 ++
 drivers/video/fbdev/wmt_ge_rops.c | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index 45e64016db32..d631d53f42ad 100644
--- a/drivers/video/fbdev/arcfb.c
+++ b/drivers/video/fbdev/arcfb.c
@@ -41,6 +41,7 @@
 #include <linux/vmalloc.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/arcfb.h>
diff --git a/drivers/video/fbdev/aty/atyfb.h b/drivers/video/fbdev/aty/atyfb.h
index 465f55beb97f..30da3e82ed3c 100644
--- a/drivers/video/fbdev/aty/atyfb.h
+++ b/drivers/video/fbdev/aty/atyfb.h
@@ -3,8 +3,10 @@
  *  ATI Frame Buffer Device Driver Core Definitions
  */
 
+#include <linux/io.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
+
     /*
      *  Elements of the hardware specific atyfb_par structure
      */
diff --git a/drivers/video/fbdev/wmt_ge_rops.c b/drivers/video/fbdev/wmt_ge_rops.c
index 42255d27a1db..99c7b0aea615 100644
--- a/drivers/video/fbdev/wmt_ge_rops.c
+++ b/drivers/video/fbdev/wmt_ge_rops.c
@@ -9,7 +9,9 @@
 
 #include <linux/module.h>
 #include <linux/fb.h>
+#include <linux/io.h>
 #include <linux/platform_device.h>
+
 #include "core/fb_draw.h"
 #include "wmt_ge_rops.h"
 
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
