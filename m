Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988ADC7EE30
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 11:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJ9pQWY8A/5tMopOtVnN7CRPyqUtZUjp2Fwbf1kTPDk=; b=qubxYLqeCUuR5U
	rBDOLU0K7UXXe+t+b+l5nzBl0uzZw+ol2OpuwTbq117F+3Ochz8dV1EwzaFCI0vE02hAICuS6Wicq
	3u9RMIq9pW1VoF4qUQ3no1KjTUdZhCPEHBjyNTrZhODplyAvIkvzgklaadY0FuldJZIX1qgPlYvdC
	G2VkKKg+mSu2Rm7iIXmaonlCN5dCuHDwyou+h0yAOA6yU4peCAhEVQ7elmud5NqD0cyUXFYrQ3cki
	+DxB3WL59H5ljrnyMTJxTjAmBwgk8mmzEweE5amavGpvH2p03eURIYG140Xz3+FdgYzoUSOIsZUkb
	GkK4P0E+VovmlJqf4J9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px4xf-008hBk-1K;
	Thu, 11 May 2023 11:59:55 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4xa-008h73-2M
	for linux-snps-arc@lists.infradead.org;
	Thu, 11 May 2023 11:59:53 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f14468ef54so9688749e87.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 11 May 2023 04:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683806387; x=1686398387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYHNj4xOB3A9+sRrGGyA+CHl8mr8r8wePJEdzxz75NA=;
        b=R4Y4sQ/pkhaXoYZ0Rmd1wl/WLm/7drgJkx1KJxPtPNk0U7/Mys/EiSrRg/aC1csD6H
         9Ih1YKeabZAcuvs/HS424EWEMpleCMYQeT/9LVkHgdtK69kZNs2zwBtMRLphBYzVZ/hs
         aDZyGK/fBqbFH5SMwvxg9nukw0XnauWw2q9+PpZDsge/KbQ2l9ENpY6j04woB9CnctYG
         SPFNfSpIoDlrAPu//AN94SEgou0j1PTsONUBEXvBRqckAwnYGE3ExGqk3OteELdlGjFO
         m/1lITxVQiGV5penGZwLpZYGrjuIrRpYLPFetkUBHAziQ1sTCIuJGSXa/TrJ+B8c4VmB
         RtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806387; x=1686398387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYHNj4xOB3A9+sRrGGyA+CHl8mr8r8wePJEdzxz75NA=;
        b=Os7dWH88fsIIkG/NJATS3ZnSs0ESfZMc55c31kDc2DxMFqH5SGwIQZerKmJ6MKCD7N
         WF1XERr1AWS4/iSMZkVlzuYOXGPjEgU1gQG2Ktu00jw4KLAIj4xgLW70IWLRVBriv25V
         ErV3xOAb6YPFCkTiYX2ipZUF9qrcWv5li51T/sKIA6ko6SDLio2JuXCFQREBMc6F/wbv
         qm1VYZp2kZLpvxfGLQz02M7hGfpu2L5GJjaWeb6JnT607jItLVQiA3tbiq8GlCwEgFxa
         Mb/LUSZhO3ESp0cr8v37p4x4F/WLkEjsn7X9+dvBolEU9QdpUtIk7H1gU009dCa6VOGl
         UFlA==
X-Gm-Message-State: AC+VfDyw9dywPSTxF3MnPbJJ/IyWDc1zCK0cByBGv8KSSPU2WQD15FM1
	HzZcH/raSSCul7aSQW+v8sfOBw==
X-Google-Smtp-Source: ACHHUZ77sxt7O279jjcWgP97akxP8WNE4SSfCZuV++STuG/v7BFEHGC1ImpffMxABw9Zm5xLGsx0aA==
X-Received: by 2002:a05:6512:48f:b0:4f1:3ca4:a57f with SMTP id v15-20020a056512048f00b004f13ca4a57fmr2625276lfq.54.1683806387473;
        Thu, 11 May 2023 04:59:47 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25090000000b004cb23904bd9sm1100841lfm.144.2023.05.11.04.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 04:59:47 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2023 13:59:18 +0200
Subject: [PATCH 01/12] fs/proc/kcore.c: Pass a pointer to virt_addr_valid()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v1-1-6c4698dcf9c8@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Vineet Gupta <vgupta@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_045950_769180_BAC94195 
X-CRM114-Status: GOOD (  11.30  )
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
