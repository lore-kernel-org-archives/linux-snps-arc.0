Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E039C77B7F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 May 2023 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENxK5m1M1QyLRnLUBTxQgWNAhtgFnVO0x8PSmtWDb6I=; b=mfk92XXGeLL6Yw
	7u6VheprZ5P4TqSzvWQxSkcDFrPufscrBZkxPPzUJ2JZjOLv6f43rEziv+/69CC0E1k7S3SBC5yyf
	xChglCAbNzfUlXbEB/R7dbUMSH4twkoGwgdJqjy/nIMzTF5hyPB9LUed1YI9VDE/Grc4ltuNAyzqf
	Zq8FGuANCCPMmm8V8HUsrvU5kRDpVYZRBeexVTdhoHUJ6rt6ve9EbhQU0SiHfbyUX4YzMzCEwUU6i
	Ht5wXrphXlyOrXnugj7OTF1aNjyRvxd3xV0IbMhc8fpsq/50sTytnDExOuiwjJqhcieSzWGLiUwm7
	8NyENGXnqG0qcPvCgqmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw0To-000ZqO-1c;
	Mon, 08 May 2023 13:00:40 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzM9-000RHy-0E;
	Mon, 08 May 2023 11:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GpirxxPIzSwE4dodVNvwFtI/Zb5W/9sOLzpyePzzZeA=; b=mv2QXLDx7dQGMPCte4Jg9LIREs
	+6FUBkobGODKlQAvpGf0Lpz+2c0ZBWW7RZo1NqWY4c0VeKJkQj6QAp4s/4j6AnP4p6MsrcL+QMIUs
	RtFmElZeVowKvlkmmaHk18TWgl0j+buGHtYk61IxP4HXJUKvfpPkmUVDUUBMnLqXk0A8BOtFawaV5
	apH3vdyVGOxMizuFJqqyjUh68CIy2aM/Byz6/PM/5Ilq/KTCKn5xxBwurwFgJfIS5+QEaCCMCtepL
	IMIAotj3Eo7S537DDnubVJAm/yxfljlhIItASHAaZHD1LzpqQQvH/eduZe0ewJsYfibfP8h2DFg/Y
	W11G5h9Q==;
Received: from smtp-out1.suse.de ([195.135.220.28])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzM4-0059CR-0k;
	Mon, 08 May 2023 11:48:38 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF55722029;
	Mon,  8 May 2023 11:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683546512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GpirxxPIzSwE4dodVNvwFtI/Zb5W/9sOLzpyePzzZeA=;
	b=JYE6igKFjR6Lo0XPzHSiBI9wjuG92/HPL9yEl4VIFp4g9SlMZEP6dfnYpBCeTWK5hqrLhm
	Hd1LqmH81Z9+iiZJhtmvXySBM4OuJUFzUF98dWI4DsCtwqVvLbXzh/Go31tf7t2vOnPMtk
	EL3zAdRBGXRhxQapvtDyWfHUpATAdkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683546512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GpirxxPIzSwE4dodVNvwFtI/Zb5W/9sOLzpyePzzZeA=;
	b=wvZRfFAJP/8DyIVssTE8hHYOfmDrjYauqRH2AGZ6pDw5uPI/lTED497vW35Jr5XW6kFK+k
	ae+HZqgYt/dxnjCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62A051346B;
	Mon,  8 May 2023 11:48:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qH/uFpDhWGQvNwAAMHmgww
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
Subject: [PATCH v5 2/6] ipu-v3: Include <linux/io.h>
Date: Mon,  8 May 2023 13:48:26 +0200
Message-Id: <20230508114830.28182-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230508114830.28182-1-tzimmermann@suse.de>
References: <20230508114830.28182-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_124836_422895_3635E83B 
X-CRM114-Status: UNSURE (   8.69  )
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

The code uses readl() and writel(). Include the header file to
get the declarations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/ipu-v3/ipu-prv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/ipu-v3/ipu-prv.h b/drivers/gpu/ipu-v3/ipu-prv.h
index 291ac1bab66d..d4621b1ea7f1 100644
--- a/drivers/gpu/ipu-v3/ipu-prv.h
+++ b/drivers/gpu/ipu-v3/ipu-prv.h
@@ -8,6 +8,7 @@
 
 struct ipu_soc;
 
+#include <linux/io.h>
 #include <linux/types.h>
 #include <linux/device.h>
 #include <linux/clk.h>
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
