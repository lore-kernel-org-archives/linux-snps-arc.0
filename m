Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6659C7EE2E
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 May 2023 07:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ImyzVDnoPp1+QID6Xxuj5o09rhKRMKkHxm5Dtk2YwmU=; b=34+5fKOeO8k3YZ
	wIyJxUfzOVIeVHQ45jolCdgwvOIrMv93UFzX+ztcZj5hBI4oMPBxmFZHPmdlacCjkDlHVEuzsfnPo
	GGsjNljOcs09mAwK6kKndtb6tLPzYlZl4jOPTyFSXXr5uqc+GpcnsSfPbfZEQRI1+OIb9ImeaUyRd
	Y69kBKcTEhGgm5T8E8t7qZqAWBoXo6mOs0epYvHA9AtscQCPDioAhE3Fruv/UhgFS6Zan3jUyatkh
	HNa0WdZ6RpeCOTSQKITULjKZ/uSbjG6Yrvbfo6wh+9PDamo5LwSkTzwQymkv4iSgIybxFe1UUX6BY
	OxqCgbol79AXXzE923Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXg-005ZYY-2y;
	Mon, 22 May 2023 07:01:16 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXM-005ZNb-26
	for linux-snps-arc@bombadil.infradead.org;
	Mon, 22 May 2023 07:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cbjvTSrc7JXib/jYCtsnbT8Pj+twUmj4f7HYrh8lbjo=; b=k0LS7qM9XoqjdhDChWiIkLuhd/
	q40PHH0Ufxksm6tT7gFq9vN5WRkziraeqUy1nTX9B5KGlLYOSHkdhgocczBVcMO0bFmD1nEsPN6oN
	XQmQgWeQYPodrixt4lOtNhmL+TFryYkHX5/RrIg4IMs5jryKjTH8SsEUGk9YPZ8AiE1XDXFZQElTk
	recirEjHnRUYBxcEpRMj21Koh4liqgNiD7dGyrtqyom6Q/mkjuBmQQ4TvdjeSFxeMYwOsyAYC//RK
	sSe8DKwUYWTIcD/riI19+vastL888oAGBjGRpNzuPlzBuhrohEdA3J8sgw6xfzmFwHoOMorU9MVmG
	1WSmqZOw==;
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXD-001xbn-3D
	for linux-snps-arc@lists.infradead.org;
	Mon, 22 May 2023 07:00:55 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2af28a07be9so31001771fa.2
        for <linux-snps-arc@lists.infradead.org>; Mon, 22 May 2023 00:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684738846; x=1687330846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbjvTSrc7JXib/jYCtsnbT8Pj+twUmj4f7HYrh8lbjo=;
        b=mY0aNW1/EfjKDkZ/iGL1m6Zy8Fuo6cIs8D94rSpcZbEbpG1ej+LIXwwg8IjfW1ubMf
         naeqWo2Tcv4U7TJhz9Le9MuCuBLyv4D3QBwlIS3zm4uuM0sDBiKrRy1hwX60LW4us3Fy
         lkizvvt3WsoYNWJw4yNFIDsi+sL5v4YZ3faevgqnaAPtaHVH/NygExxLIfBKibX15pwh
         tHGJ8JNozxqi8y1yMVmjsLj2PaJE+bFjBQdfzX3wucmA58zcUBePI0oa6lqw7Yl8bVB9
         VaJ8pSouLbJ41Y6QU3Shc7N4h3wuDh4QnygF5tReoR09XiD0FLth1k8KkiUU3nySSVUd
         z1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684738846; x=1687330846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbjvTSrc7JXib/jYCtsnbT8Pj+twUmj4f7HYrh8lbjo=;
        b=YQcYePRIqn1fIApd0Qr5h/leTbGRmIiAD9/gCsB5x6WbaRJFp3N9iQ+sXlY6OOfBnS
         PvVRGaIf3IUpnfzMmFgdL3zFWOm2WIauMCnbbBt6hx1FxZcWtWuJL/pSkSdiFx4W7/3n
         qexIfwMKdEE57ArSQBIlmbLc7NwZnu5QdCSeXKTWgO6HG46GA5/SQrLX+W9ECuP8xQUC
         8lshgCGtjLxjtstwv7lYUro/d87/jR55xzEJtsjZQfW6aLp/m3K2dYozC+a5N1WVCkqz
         UX3MtUUGYHT5VoC7/zQ+3O+q4KDZmGw0WKyRVJhFFxC3n+g1RBpZ5KRbT/hq2ObwWLpB
         CS0g==
X-Gm-Message-State: AC+VfDyhIEZFvgSFABmmPNiDmzE3gYtA4lKDn9MAunBWiITXQ9ZghMfO
	TcAWsOCsX8pGt9kFDwBuDkDdTA==
X-Google-Smtp-Source: ACHHUZ4bp1LXNo/+2W/IeTUTw0QnGh8DL7r/PmOoEgOM0R51k/v0tTn2gSTtsQZtS0itui0SFJl/Iw==
X-Received: by 2002:a2e:88d1:0:b0:2a9:9e99:a508 with SMTP id a17-20020a2e88d1000000b002a99e99a508mr3233749ljk.53.1684738845921;
        Mon, 22 May 2023 00:00:45 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm1010187ljj.7.2023.05.22.00.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:00:45 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 May 2023 09:00:42 +0200
Subject: [PATCH v2 07/12] netfs: Pass a pointer to virt_to_page()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v2-7-0948d38bddab@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-mm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-arm-kernel@lists.infradead.org, 
 linux-arch@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_080053_786097_1EAC1134 
X-CRM114-Status: GOOD (  11.98  )
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

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/netfs/iterator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/netfs/iterator.c b/fs/netfs/iterator.c
index 8a4c86687429..0431ec4a7298 100644
--- a/fs/netfs/iterator.c
+++ b/fs/netfs/iterator.c
@@ -240,7 +240,7 @@ static ssize_t netfs_extract_kvec_to_sg(struct iov_iter *iter,
 			if (is_vmalloc_or_module_addr((void *)kaddr))
 				page = vmalloc_to_page((void *)kaddr);
 			else
-				page = virt_to_page(kaddr);
+				page = virt_to_page((void *)kaddr);
 
 			sg_set_page(sg, page, len, off);
 			sgtable->nents++;

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
