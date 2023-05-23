Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E7BC77B75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 May 2023 14:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ImyzVDnoPp1+QID6Xxuj5o09rhKRMKkHxm5Dtk2YwmU=; b=3HaqYX0ZWrqQ/z
	jyeuM+YYgFwy3on6n0Ea8fgF5GB+O6Uoqu6fDmOXTGaNTjqCrqLctYTotQdZu7oWnPjMonYJihy+A
	vTf17BnjrHGp5k3I/xZggobx4Y6mCtoAtiRO4FFSlUeVQel9GMH0WP2/2kKFX3Hz7vAgIHOnqiKul
	ZXeU6rGvoy07EDa1xFpF5bUy6GE25j4wjjPAD/Aw74eNudaM9upYXKaWgjZllJMGZIowoQMvQxGOv
	ZlmWpUcuYPwDlxZrqk0DXm6SLpqhw+Ff90AW3lo/Dc+4TSIst2rNTK4VkRnzULiyyAvG6EjxLUSDY
	wXSi87qYjeDcW1O+NFqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1TBN-00AWRg-2I;
	Tue, 23 May 2023 14:40:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1TBL-00AWQx-2j
	for linux-snps-arc@bombadil.infradead.org;
	Tue, 23 May 2023 14:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cbjvTSrc7JXib/jYCtsnbT8Pj+twUmj4f7HYrh8lbjo=; b=fSavyEHt8hAQVB0cip5didM2RW
	f8lYE0gyY8al+OO1ge25xF5cb3Cm3WC341nlf+DqGMTqyMFSgjmv7EW3IyUe6/Lq4/brrBbigjNce
	fNQ7xjohpQT6f/qgLqbGNbeWQke50cN5AeLqGbJqlj1rHcpSbm7Qog6+vL9CPTuIEIgoImML77mcA
	UG9ixu+cO20oWD+l39pFVq6gnprKw1Q47fzIaebzVEI4ip8KM4xGMUMzJNkZn9CSaW3N5MzP/zJQs
	QIGCgvsGrbDTFJAWcLdUGzQVzzYqnbpm0JHeBJwnioqcga/aGDWZDUcDuk0vhor/yjpGqIiBsiOYe
	kIGKWtJA==;
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Sf7-003XwU-33
	for linux-snps-arc@lists.infradead.org;
	Tue, 23 May 2023 14:06:58 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f3bb61f860so3456920e87.3
        for <linux-snps-arc@lists.infradead.org>; Tue, 23 May 2023 07:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850752; x=1687442752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbjvTSrc7JXib/jYCtsnbT8Pj+twUmj4f7HYrh8lbjo=;
        b=sbGtpTGQuKoJbgxbzRVNan0g3ud99MIRZSa7psCYWoBO5Gd4ngiT8ZH12iPBec4b/f
         sv3wsOpDUcgyEoNSv9DLn8MhriBoP7mFWJrbwaXvmmnHPiHxtLFssiTqg1+3y3/CC9Ng
         5q2rgJSMArU+a9KH/zpDgU6xvBjhPfINAqbfFlUmU6jcGaflnUqrxGDRKWin1C7+6kod
         w8BvwYrZ7iBnRg/rTBiAeldXSsgcYri6iPf4e7gY99RgCsDpQFTetppSyZ4a9pLmLesB
         A3f0/o/eDj5XUSN3Ow0r5byyVkJLGeP9SLaqg9YZ9I4EfNu99apZyryJofgUt+kGvN56
         2QFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850752; x=1687442752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbjvTSrc7JXib/jYCtsnbT8Pj+twUmj4f7HYrh8lbjo=;
        b=V9QfGV/BopDPUfqq4pmg6+sUduotcB+/ruV0zGDtuKyqygNKwMUtgpBTzIYwpGh/fd
         Zc3kpNxVuiKWZWcaQ+8cw2Xd8m/I9ZvkXlbWl00MgkAeRyd3bBKJMUTeQlfv9m5vGGc7
         Va2zw5hb2J6DM/OnUnb2z+4+qHGeGFlqWoGCsdonfKbye0Uaiuhr22CLFS6fjcDf3Faq
         IQmeBwNawBUskDwAVXyKf4iCMiHphVbaPKL5yhAg+0FcoxBrP9XRiDbT7IrY/Lh8VZVK
         pCWdFfw1dAcbrJczl6xmso42KJ+GKxrNf1o9JrBHg0H8rU7LrcFlfcrH0EN3N9vwFBk8
         DqeQ==
X-Gm-Message-State: AC+VfDwvdGY436Zd56CwWTg4asesDoB3v62VQaKaG/FL26plsY2Ut8f+
	5p5kTmSoK+nPEfDdGl2R82F77g==
X-Google-Smtp-Source: ACHHUZ4dmn/sACren4W8D9ctT/gUYEfrO13/MXkcJGmecSW4AoiisQlk/HfzEBoneU9O1M8vm4LnAg==
X-Received: by 2002:a05:6512:4cd:b0:4f2:62aa:986a with SMTP id w13-20020a05651204cd00b004f262aa986amr4590844lfq.21.1684850752229;
        Tue, 23 May 2023 07:05:52 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004e9bf853c27sm1346562lfp.70.2023.05.23.07.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:05:51 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2023 16:05:31 +0200
Subject: [PATCH v3 07/12] netfs: Pass a pointer to virt_to_page()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v3-7-a16c19c03583@linaro.org>
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
X-CRM114-CacheID: sfid-20230523_150654_241021_E7107AA5 
X-CRM114-Status: GOOD (  12.43  )
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
