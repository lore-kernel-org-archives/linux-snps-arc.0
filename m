Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12DEC7EE30
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 May 2023 14:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJ9pQWY8A/5tMopOtVnN7CRPyqUtZUjp2Fwbf1kTPDk=; b=ZYxaOR99uqGipv
	ViLI2GOcUMJRX5YRzqLJlY8E+HM9HX8lAZEQIhl7sf0RtmVK84mgcJqg3/RR9ZlqRtZijNYZZi7PQ
	OKn0h1QkqihbXfuj8hJFHmIQQzalN7NyZ8evkZoFydKfR3X832eNLVXzvXZHTnFCSVUPwHwDo44MA
	H4/lhIeJxx+fy5TScXhxbFD+T8no7XrRkhiUaYOZXPaZg0eKpTPw5vkiN+ZxIxJaDrvkmG1M3bCVn
	vW6w1UHao3UK4nhV5Og2JnEDSiu7I59j2ivfhnQQ9zjCBH1HbOIKlHPq7MbcQRL7+hQbEHA597fPn
	xDKnWZUE66VoNME7nnGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Sf4-00ASMI-2T;
	Tue, 23 May 2023 14:06:50 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Sf2-00ASJA-0h
	for linux-snps-arc@lists.infradead.org;
	Tue, 23 May 2023 14:06:49 +0000
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f3b5881734so4432587e87.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 23 May 2023 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850746; x=1687442746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYHNj4xOB3A9+sRrGGyA+CHl8mr8r8wePJEdzxz75NA=;
        b=yi3hcBL/sMAfGA15PDa1P8NdEmww4HzJP2F/sUwI9IpWl8FAr9D8nzxcXs3kk9VZLg
         gqW+uTf0Quu6EKOMoBtewB5My0WXhMod0GC8z1ZbYL4s/yewGksiSDol/qQUkOAwxxUP
         tWgq8rOI0YG+2kzNAd6LFlZQnU/w/sUVfPTphub78KgJsbXLOjbr0epF5+oc5rNWTcLT
         4z9nAmfx1uJBTtHPDaWVenyL8i5pZQeTVRUJb52fjzXC6jarDxR7o0xXXXnUa9XVKQra
         c4l8ZCAV1hnrQiBJbDsUuYXenW29rw/An0d2CKxpWMKMbNQerNNefqEtiX0g0tIAPTZn
         73Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850746; x=1687442746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYHNj4xOB3A9+sRrGGyA+CHl8mr8r8wePJEdzxz75NA=;
        b=EZpJ6TngSsAmXPlxMwC17quXIoqBP/U9UPJGRpdWPFvdO3j6ZMNxx7RCCkgd3xVxMn
         VoQbIn/9QcmiSE1ojeiLE8Ku7GXuu73n1aBSBIssWYyymYFg0CPhmBAf51lwQYD61MBd
         WGyQHf3UW+zd+yHI8iMb9Xfa7ZPhJCDi25SMoxSoShabO50uJ/7tR6xgMFOA74vf1QWz
         mYITstoOjbblboyZ6n+KzTPY3xD0TRG22o3PDJoSJDVonOjNucNC4bJKu+L588/+yRLb
         dpwmsJaeiaNmrFKsDzdy6+Q1TridKss2S7jTboUev82knC7mQYGhG3i6YH06a0ZKhiaf
         OwgA==
X-Gm-Message-State: AC+VfDy+ixlMy4dQ9z/uMV2VBfGs5WD5C+hEUHQc8mj/GpcGT9DIvmF+
	cRfU1Jhuw5uqW4s/N/JunTzupg==
X-Google-Smtp-Source: ACHHUZ7rLgS3uJwWiogUeDYb0+CYWWtRVMpUMIrByqwxVk0kXBZ79wUE4ySYqYt+Mam8+eVWY8llcQ==
X-Received: by 2002:ac2:43a2:0:b0:4f3:a1db:ad4 with SMTP id t2-20020ac243a2000000b004f3a1db0ad4mr4313623lfl.66.1684850745735;
        Tue, 23 May 2023 07:05:45 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004e9bf853c27sm1346562lfp.70.2023.05.23.07.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:05:45 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2023 16:05:25 +0200
Subject: [PATCH v3 01/12] fs/proc/kcore.c: Pass a pointer to
 virt_addr_valid()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v3-1-a16c19c03583@linaro.org>
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
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_070648_253283_284A29D9 
X-CRM114-Status: GOOD (  12.79  )
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

The virt_addr_valid() should be passed a pointer, the current
code passing a long unsigned int is just exploiting the
unintentional polymorphism of these calls being implemented
as preprocessor macros.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/proc/kcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
index 25b44b303b35..75708c66527f 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -199,7 +199,7 @@ kclist_add_private(unsigned long pfn, unsigned long nr_pages, void *arg)
 	ent->addr = (unsigned long)page_to_virt(p);
 	ent->size = nr_pages << PAGE_SHIFT;
 
-	if (!virt_addr_valid(ent->addr))
+	if (!virt_addr_valid((void *)ent->addr))
 		goto free_out;
 
 	/* cut not-mapped area. ....from ppc-32 code. */

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
