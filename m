Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275C1C7EE30
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 May 2023 07:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S8c4K/pvXMARlP06nLeQmPJqg4PPJ7tmNDPfusSkhH4=; b=LAF51odciR7rEk
	6KbLemimjHR9YOUGIeDfaX+S8h+GDVqPQlx6AqnfcALh3I9kKNKgJxtJVI8UBvThNov0yPhSlJgS6
	OgRusoN5hkCUganD4L3PrWrLGT7buOOMCIzkBCRxysmWP5uTebE7MH0HMZr0wkURpPYLJjRdzxWao
	23iZu7bdd/49WW256vDGuHyoLv6L+oYl1GiZqH/m5xKdnHHGX5GdzSvV7R2jsgDlqsjTEf0ZJ6/cZ
	pkWt1tJIlIAErS/eGi85jL/U02TCf7xTNFMB1anwIF6uBqMnUZ5RZPkcikQi5Jbxmne6Y/dQ9gQIH
	EFcYkmVNq+z3ypGIjUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXC-005ZFb-0c;
	Mon, 22 May 2023 07:00:46 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zX8-005ZCg-24
	for linux-snps-arc@lists.infradead.org;
	Mon, 22 May 2023 07:00:44 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2af30d10d8fso18026131fa.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 22 May 2023 00:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684738841; x=1687330841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CPc/Vm/Ur0JOy8kF/L6fs0qWXc+VKBrwCqiZQE3hiQ=;
        b=NrzO6oCPjwihy/7NbpJ3YcgsArRc78cEfJMpT9F0OLcbOW2y8Fl22oTOY/WH+QouJU
         4sULmDBFIIZPjR6Mx3pJe8TZEIahkyyb7WkWsNTDeKsKYKrPJekLb/gD1GgHaIpqlCsj
         6QSKMiFR3KohhV92qLpgW0jRCS603xx3WtBCfv+WNRiPUwpuMiR+QiKd4LB4eBXFxrTl
         iNaMwVqg/f8wzqRqyYInLs1GFw2HsoBArqyOCLOOOtgD3dLXhiOQx5YrwSt21rFQERmE
         n4MTcZbVb2/vJmHdtmzbg4g68dyWgt0y911Ry3rDmEQOUhiC9fxEWLl1Lpop3daP//x6
         ClCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684738841; x=1687330841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CPc/Vm/Ur0JOy8kF/L6fs0qWXc+VKBrwCqiZQE3hiQ=;
        b=Upbltdl1ZP2yozJI+CguXpUjm0YSqQXAPBtJMYI6/5MkAOobxl4ssOnvrklyzvuARY
         esSF+oW10mo9jSRVM+oq6czmC6YYvJ9f8mtWqQT+wzp0ExWeLFw/N6m+9HPGjFq1ZBBY
         UIavTHGvjfEUUUaTGJqkK0KSDU0dwclZ5eq/2AqE0j9Pwy6VUoRIt4thWDMfBAM7G0o/
         7ezvSdhRpah5aDagmfGE1AC3Ozpm4Qjofh/HdYnpOHCcfn65deH3Kht/ZrQUOQDUdFgp
         RXrxgg8zJ41DiZS93IuzQ+QAlw0KIDZPPfABfSKD6+BYV6IcyoXznEKe1YDP0L8eeWQs
         Qsvg==
X-Gm-Message-State: AC+VfDz55/umuVTt6RldwlRCGnBhglYduL7L7f7PzSWUl4SgY/idsXKz
	YnoabCXkAsXWPcOi7MWg0TEG4w==
X-Google-Smtp-Source: ACHHUZ7S6IGy02Ukp+GH6s4VTX+htMdSS2munmak/B09B+vgiuI0xUdVH1qun2fIij9DEbd2Ufrt5Q==
X-Received: by 2002:a2e:9115:0:b0:2a8:c42f:6913 with SMTP id m21-20020a2e9115000000b002a8c42f6913mr3287059ljg.36.1684738841185;
        Mon, 22 May 2023 00:00:41 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm1010187ljj.7.2023.05.22.00.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:00:40 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 May 2023 09:00:38 +0200
Subject: [PATCH v2 03/12] ARC: init: Pass a pointer to virt_to_pfn() in
 init
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v2-3-0948d38bddab@linaro.org>
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
X-CRM114-CacheID: sfid-20230522_000042_683926_7BCCBEC6 
X-CRM114-Status: GOOD (  12.54  )
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

Functions that work on a pointer to virtual memory such as
virt_to_pfn() and users of that function such as
virt_to_page() are supposed to pass a pointer to virtual
memory, ideally a (void *) or other pointer. However since
many architectures implement virt_to_pfn() as a macro,
this function becomes polymorphic and accepts both a
(unsigned long) and a (void *).

Fix up the offending call in arch/arc with an explicit cast.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arc/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index 2b89b6c53801..9f64d729c9f8 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -87,7 +87,7 @@ void __init setup_arch_memory(void)
 	setup_initial_init_mm(_text, _etext, _edata, _end);
 
 	/* first page of system - kernel .vector starts here */
-	min_low_pfn = virt_to_pfn(CONFIG_LINUX_RAM_BASE);
+	min_low_pfn = virt_to_pfn((void *)CONFIG_LINUX_RAM_BASE);
 
 	/* Last usable page of low mem */
 	max_low_pfn = max_pfn = PFN_DOWN(low_mem_start + low_mem_sz);

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
