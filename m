Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1987D13588
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Oct 2024 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XfAvQEp53aj7fY+/6XqNd9Ki9BXkWzjGy3U6ySTIFq8=; b=cSt7K/XO0cjpQ2
	f4n+DJ4jctlTL+G0h6sKQqJmwqK3Xjy2aoECzgfEBfDxsjk5GOWsEhJN1ojFIDcrjLn5vGmUis+7F
	zZhmT8bTkoLOv/pHxoGrN3vxsSWlLsELxPlzsyZdlXDmGGBb6q60k29wdMVa9Ms2Ys9BYIrCqZRm4
	VtpEyc8HUQ3eZiGMKCJoxdyY2usFA+B34GE71EbyIRHSS/Jhhd7h4o1i0NT4NvUCDHr1tDqxOuKhk
	coThzlGGm06DNLQMUFGQZlmBC1RKpwW+IumpuXrnGIT0nbFDl2ve8nu5hG+kc+x5OFIaDYrJ4ZAsk
	LWExrh36t2/DBHdW7DAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MXp-0000000AKdf-2mC0;
	Mon, 28 Oct 2024 10:00:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MWq-0000000AKDy-1MPR
	for linux-snps-arc@lists.infradead.org;
	Mon, 28 Oct 2024 09:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730109554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xGoT3W4idt0pQ7dWYy1s/3aPfFUS8vp3/+oiEybPAmM=;
	b=EIec5Awdj4tEokCFQGQmVzqFNqUQBBEUQNGQhcfEfWisA2zS39jvikcoPO74INBYC/0wd2
	cPxYhFyKMnxXDggE8XNynbBBa2Z29r7qUyqWEkJWCrL/50nrZ81Fi/HA6/ULpyA4iz3n4y
	tAXY3lEU1xlc4jMM5lroHfv24QvWMKM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-RzcCHXx3MAidC9rH4EoqQQ-1; Mon, 28 Oct 2024 05:59:12 -0400
X-MC-Unique: RzcCHXx3MAidC9rH4EoqQQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37d458087c0so2931352f8f.1
        for <linux-snps-arc@lists.infradead.org>; Mon, 28 Oct 2024 02:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730109551; x=1730714351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGoT3W4idt0pQ7dWYy1s/3aPfFUS8vp3/+oiEybPAmM=;
        b=exOtUHz+H338vi9T3YYgeL3mgQWDeQ8N4NX5nt7Ucin4iaNxiQ9AZafc1FphBdDCJf
         JsqHIAmdE+zxfa9+PjhHqwf1lZA2UcffW+j+Gw1BFyoa9Lat0byURnj1OMcIocKMZwrH
         5ojXj84wKH9YlaXkPd97tPAI/7Z3+0PYvnk0X7uZmf07IzBs8PqHX3ig9LxAgLLWiFKf
         Oe/lFcykYN8mi6AsH0UTBQYf+atbNbeeSy4GUbuJfgBLo+I/hXNI05SH83mc1xggkZuV
         PwUK6p/j06hWcmQdBFF0wyUwJn6+ImqV3OTI0ZWJlP41vueZiphLstBJs+QZJW8AiPjq
         vHGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBXcpPMny3v6o+mJpCLzahmp8uw9c5GpB0GGwlskm9dwcMTAs5to4qCHtxlgA0Xfy3/VnhXiRgSHMyHKldig==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMylVy/eVBEE5XWWAqSE7QpuVe2ZVIuNKUBxrdb/ltSpReB6b2
	A/SlCwHd65mT0t+YkndeGDV9RbtCXUnFg5mkyqRr2MLcZws54QesV2AVNrg82ZS1AnofZ+yI2bh
	DK4ShWe/tCqVprgwIFQXPpCVC3SqIlm8BdrlXGO2SMmABKRY2N+nkb+Y/XQECtM2OX9OIrw==
X-Received: by 2002:a5d:4003:0:b0:37d:43d1:2064 with SMTP id ffacd0b85a97d-38060f571damr5725712f8f.30.1730109551641;
        Mon, 28 Oct 2024 02:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOEj+ZEttJYo3NZ6G3iW20Ip5TLN8eBYp6Av97jTXWOgan0CeJqsrWMsD/uXYdf5+ZxKG6Og==
X-Received: by 2002:a5d:4003:0:b0:37d:43d1:2064 with SMTP id ffacd0b85a97d-38060f571damr5725692f8f.30.1730109551320;
        Mon, 28 Oct 2024 02:59:11 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3ba7fsm9055827f8f.34.2024.10.28.02.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:59:10 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] ARC: fix reference of dependency for PAE40 config
Date: Mon, 28 Oct 2024 10:59:07 +0100
Message-ID: <20241028095907.30224-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_025916_476349_D1026EDD 
X-CRM114-Status: GOOD (  12.19  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit d71e629bed5b ("ARC: build: disallow invalid PAE40 + 4K page config")
reworks the build dependencies for ARC_HAS_PAE40, and accidentally refers
to the non-existing config option MMU_V4 rather than the intended option
ARC_MMU_V4. Note the missing prefix in the name here.

Refer to the intended config option in the dependency of the ARC_HAS_PAE40
config.

Fixes: d71e629bed5b ("ARC: build: disallow invalid PAE40 + 4K page config")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/arc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 69c6e71fa1e6..ea5a1dcb133b 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -473,7 +473,7 @@ config HIGHMEM
 
 config ARC_HAS_PAE40
 	bool "Support for the 40-bit Physical Address Extension"
-	depends on MMU_V4
+	depends on ARC_MMU_V4
 	depends on !ARC_PAGE_SIZE_4K
 	select HIGHMEM
 	select PHYS_ADDR_T_64BIT
-- 
2.47.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
