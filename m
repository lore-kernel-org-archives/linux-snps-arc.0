Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90378C7EE23
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 May 2023 14:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ed8Xgc2bZZL/iKgoyxZ6D60joCbdRwnzFo0ADNNmJzc=; b=AGcKKd3hcX+uj0
	ydObYNSAWYj2/IgFv+SWizI28unjyyzQH+XoWaCBVxL1/ToDfwSaym4JjyWOPOR0A0ieHYiQE4jyz
	yg+T0F2O+qpPbIw7rpXbxjT7f5G1mjSIfLWcJd8rA64BhPkEjfhiZ9ar/DxDELtE6DHenQmGId/8W
	5zXJoSLP8yZdbLHcIpQ8upBOfGzXbGW/3L3yxNHyZsvUGnDrtQ/iC8Afl6U8yjBO5B4/JNhfoEQT6
	RbmZL2E+aF9MEAJhiJ/CfSdrTpKspFcDt5NML4T56yu5axIDU4yhIvu0ceF6cEJRVdJ8oQIGKv5LL
	s4w5H4I85aaAVGCU1kpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1TBO-00AWSO-23;
	Tue, 23 May 2023 14:40:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1TBM-00AWQx-1m
	for linux-snps-arc@bombadil.infradead.org;
	Tue, 23 May 2023 14:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=b/3885L94lN4KFkmIG4KL0Z1VLtyVywWWWjhcZ8AdCI=; b=ZYyRtAw4gMWGJWU6epr/h9QDdJ
	XWry390ECYaTZ5D82OkfYlznui0MfWsy6ZLMzfJDn79WqqoEclme067c15aX1hAMQs94GsOxH/BEp
	2sy4hIsF8cc3NZjEbpGjaFwRqjo4kqKtz88XjpT6uCyxbGdomU76i4i8hR874s3weOW7Jx86G8Kqd
	lytB9o7TtJkdgrzILgcAWf5tYZbH+AOlIq4N5SmUWyhrF4Ni3drJ2WxCbm3DqPnPieEKzuD5nHGmO
	WnHtyJNmbo4wf3qRsJyCDu9LbzIPUraIgjHQKmonNL/EHOYKTC4zrzv0m5oF/4soi5BKkUt1ewc4t
	zj9n684g==;
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Sf7-003XwQ-2v
	for linux-snps-arc@lists.infradead.org;
	Tue, 23 May 2023 14:06:56 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f3b9c88af8so3675808e87.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 23 May 2023 07:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850750; x=1687442750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/3885L94lN4KFkmIG4KL0Z1VLtyVywWWWjhcZ8AdCI=;
        b=qhdr9VIeHm3TCAUgvcaHfodtBDTuWxK2iXj6V/SQ66zUErdAk9+DCvdLTF4aCd1ETu
         C+ZAXFKiOs20Y/LEEtHSq1dPudVvh6HRokN0i21bR1zIMcVKbUmCrYz24kNjxTLPVXAa
         cFSvLYM8x6ZBwAnEtC4zHJP9yI7e0Y76rr1w29rfD59OhfMtbLcaAZOSrbcUgEQ+zCmx
         caIJ/LOff8nHxBYzP4GFpPBpy1b42pU47PMbeKWiMmKuOjXR5pkLmpUVwA4W9JWmR+b4
         CDnpYKOJa/b0/Br6Vk3EN6ig9EeMV6vmOvhLsCfhbrFKneL3zoOIRn+iLLV6tfwCA1tP
         yGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850750; x=1687442750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/3885L94lN4KFkmIG4KL0Z1VLtyVywWWWjhcZ8AdCI=;
        b=T8tVLMErVuqY2kdIw1p/WN+EK39LoTdnTFDl1gzUMpL1Id1M5iwHw7izTgSZvTgGMI
         5EROMEv+GzTLYTch2FKK+IJlQeNhCdXoLQtcQ/Un1eVwrekkb+L3ujR0rZmK4LmazB0+
         l8ZoaFsJtqwuewZVFA10d7t7hHUTvzrW1bXanMFCGwpleecOMJhXoAA0Ur8vd+aEB0L3
         vHIIWBY6rw8nvoYVukpoKNugOTMRSZtpsOh4JB0AIRiBgXhSkqtRnNHAh3T09MZ59Qx5
         SqCnXDys79aQnko6sAenGcPJIK4l/2yypbF5YfCkYVRiChvDRZBxc/rsrUBDfT2uLFTX
         a7rw==
X-Gm-Message-State: AC+VfDzb3+d+rTR0rnwJvIwC9rLk7vnh/RYFGtFcUKG8Qa44VFECTw21
	Kae6z6qIIfne1Fu24oiDz/DWfQ==
X-Google-Smtp-Source: ACHHUZ7+n7MNuNF1TIH+E5EiaRwyqYEQK1Dut57yCG9qKprwmGVeigy/nhu/aE9P+Jn/qDJ6+UR8bQ==
X-Received: by 2002:ac2:52aa:0:b0:4ef:d6e2:6530 with SMTP id r10-20020ac252aa000000b004efd6e26530mr4123672lfm.37.1684850750175;
        Tue, 23 May 2023 07:05:50 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004e9bf853c27sm1346562lfp.70.2023.05.23.07.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:05:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2023 16:05:29 +0200
Subject: [PATCH v3 05/12] cifs: Pass a pointer to virt_to_page()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v3-5-a16c19c03583@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-mm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Tom Talpey <tom@talpey.com>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_150654_240549_7FAF1AAD 
X-CRM114-Status: GOOD (  12.73  )
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

Like the other calls in this function virt_to_page() expects
a pointer, not an integer.

However since many architectures implement virt_to_pfn() as
a macro, this function becomes polymorphic and accepts both a
(unsigned long) and a (void *).

Fix this up with an explicit cast.

Acked-by: Tom Talpey <tom@talpey.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/cifs/smbdirect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index 0362ebd4fa0f..964f07375a8d 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -2500,7 +2500,7 @@ static ssize_t smb_extract_kvec_to_rdma(struct iov_iter *iter,
 			if (is_vmalloc_or_module_addr((void *)kaddr))
 				page = vmalloc_to_page((void *)kaddr);
 			else
-				page = virt_to_page(kaddr);
+				page = virt_to_page((void *)kaddr);
 
 			if (!smb_set_sge(rdma, page, off, seg))
 				return -EIO;

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
