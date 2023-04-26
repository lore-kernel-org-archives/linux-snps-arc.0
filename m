Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4E6C7EE24
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Apr 2023 13:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmpRKYvXaV7HL67SNWPXAiVjpTJItf9OBnhAkpBNkOU=; b=kRCq6RJuyO2zHx
	oYjk9vyGe9XzT2Qg+fwP0Ye+3NKZoLU15ZgddpwkmAJInSvs9t4sDmRvLd4JKbTJSVzAlQ48o0fXq
	nBC9g+7yu8QyaCV11fIe/Dxuakl5B23YHoaHYYr4aUfhHOAsoC9WZMOfR1SjjXsUlhJ+Q8B3i1tEp
	T2dMwDJP03MFl8jKHZLDwZJOr3JiDho9yYsZHCWaCQoMW2LZzoWdnRMLkX0jNlIhi2U0VEeGUPlB6
	YgnhwunFdvW104U4OQA7pw2UCe4ePjVRlQezNR/Z7T2CdmK0T9bFbxnCEF8K4kttXTpCJb326cby1
	n7HEnM5a7LT7FXehbUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1preoz-0040cr-2q;
	Wed, 26 Apr 2023 13:04:33 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1preou-0040XN-0M;
	Wed, 26 Apr 2023 13:04:29 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D0A5321A11;
	Wed, 26 Apr 2023 13:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682514263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5KXNAfxrgjDbycBxJlcxj0+DCvoEkkhJjhkxPG9M5Sg=;
	b=NwBBSZ+sIWvlLSEV1noZVWkCzKwhBP1LWjHA3TdwVqPtYOmWCx6rbx4iL173w8DxsPiU5c
	tFr5keLaQkWKFThw6WIT92EFrTMmb7ZVjMoE/jUHhCAiqIclKt5e50DEBBtgmsUjWy/EWc
	0qbAWdTfzSHLy9vVqDWSma4ZlbTMFUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682514263;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5KXNAfxrgjDbycBxJlcxj0+DCvoEkkhJjhkxPG9M5Sg=;
	b=5Jz50+oRo7p9oXYA2tB/+pAVATegFkXtHlnJ8I3a6DTwHInQ4S8pRqY/r/fLOJ+9pLJ3Me
	Hoe43uU6vTc/LrCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C534138F0;
	Wed, 26 Apr 2023 13:04:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KNOyFVchSWSBMgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 26 Apr 2023 13:04:23 +0000
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
	arnd@arndb.de
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
Subject: [PATCH 2/5] ipu-v3: Include <linux/io.h>
Date: Wed, 26 Apr 2023 15:04:17 +0200
Message-Id: <20230426130420.19942-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426130420.19942-1-tzimmermann@suse.de>
References: <20230426130420.19942-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_060428_292541_D67FEE29 
X-CRM114-Status: UNSURE (   8.52  )
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
2.40.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
