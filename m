Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08CBCE8D76
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Nov 2025 19:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfLJIABqqRe4fIJM3Jryl0JF0JiLYEro7MqSKr3IP9Y=; b=46WtH/uDfmB2xJ
	7oA4pbOUjtwE7h/kBpt3M8fWZgSD1iPjYxLSihWI3pp2qRfibJAt4+UQE3EpSVYnwu1b0l1W6izft
	yhVfG4K35YZAqRWNAaKc4HDpa5oCO3LuLH+5FCk+/JRsNLmbDGwoq+R4RIookK94ovC95P3iTl4nu
	asQXexePnU5Jd+LZl4EsdX4GTiAH8eGNbd0PR7LppnPn+zN9hcF6rBYWg8HVA880h/EBjMmL6aGb/
	jouEX+kEva5RHu9USCc1l4qI8RZbPDOWUQlO/M1mepkgpuinZN840cgaHBq1h2kaxgdLojsfArF0w
	hIS2gu9qBLEKg8rF+8mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzFM-0000000D0fh-1rJp;
	Fri, 14 Nov 2025 19:14:12 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzFJ-0000000D0ez-2uBk
	for linux-snps-arc@lists.infradead.org;
	Fri, 14 Nov 2025 19:14:10 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-64312565c10so3648668a12.2
        for <linux-snps-arc@lists.infradead.org>; Fri, 14 Nov 2025 11:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763147647; x=1763752447; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aI9onR+f63JFzaNIBKoGx3OAwegzLui4sLBarF2xej0=;
        b=CPJtyGm6/SIA/AG29uAl68qyfDImNTENjQDFnEHUtX5J/mhyY/ozPi0lRUHvjLYZQL
         Fw4HioYTB8UyEXyE2s0ozxFk/v1MFCshPPmNFA3ayN29PlOq7Lp7JuYg53xIHjuc1D6q
         IpkuzoBJQQ/xtNmVcBMEokXYolcGQkLPdMvfh0CoKOB/Sn1TqafIRxt1Q5iWVUTo3MWg
         pjkH2Os9t6GKU9+DfHTjpdm7drq+8OgzMjejLsXRWwDu1nvnU94ku7t0MMXmilyLC+Tq
         CgPQ/SCYYJMP1sRdrmH4IUGAJ3L8jp8mkvhIqxsW0lmt0M24sskb/B/CszKZZyOB8toO
         pZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763147647; x=1763752447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aI9onR+f63JFzaNIBKoGx3OAwegzLui4sLBarF2xej0=;
        b=IG8yDrafmMfELHKDpMzkmNvXIBI0aFWfZKhnZdXxtQnH11/I3l6KdApNZ/4luTqvNN
         baEt3dFIcIhrx0SnOZmeU5jXhS764DT6/lZdhl7YqgsbhB8jmFTNzZ+lbS/y92CoxLsN
         VvquVBpEFiHymn0hOD696Z+fXFds/cHIZM/aA3oxNDaQtxiPcc7EP9EtHK6qowTyK6mc
         eyaYKxh9oTA1oTnew6nEwHjpKUEHIzc3HtNjAlG7uQmynxkSDl/jd2EqSxtu21k248bv
         tlrwcwnxqNNn0VHMS6uZXqu99RvqoHmobE+Uk+c5vLNea+PTW5b92n0NdBbDqH8Faz85
         IP0A==
X-Forwarded-Encrypted: i=1; AJvYcCXuQ/r1SYd90nROUfclu6SCyAq8LmKZ/3zdPwF/Kppx60PxLQh1qJ3XQvtA+D64GF9wm6GEA8VcDFVAj3CWfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOunPFpebGbwRMlwd2FQZbIGdZR6Tr62a7aw5Fq3OX8mkweaN1
	RQ8jWmRuSdJe3NYaOH7aREBW1czcnKlP8rWhivVo3Jy3z34ijfqcMepmyaFgWg3ZE7hRRWn54YZ
	0fqVAfp5IamEb7WsEYuE5rNHZA4QXzgY=
X-Gm-Gg: ASbGncsqFOZBYou5mJgNqpkhKHwz+g7Eq5W5Xas1c/438SzeyhlgpZ7FfXztlfELy5h
	XUx00FIaVpOTpaJz2ACCzzS2gSoANmGGcbD/y/z0CDXrNR/8w/hdBpT0UiAHAG8tnSyJMV0FIp+
	lgnFP5CCGsWZ9SCpAqXWer45Ha1LBBPjp0mR5Wo6MO/ndog0cIBNmNja0DRBj0mVcvUj1WOxs65
	pXAPOBLSuw62gG4kCYG5aNB1WKOZ+HJJ5di0gxWHYXRTqc6E7sxQc8az1aOvw==
X-Google-Smtp-Source: AGHT+IEvBu7ESLrGNRMv2QiwL16IZgt6aUNJ72TYzx+vz9COzg0vAhK2L9oI/n3nL6QJ1JU+lRhqexZnJfrgTYt3DEI=
X-Received: by 2002:a05:6402:4603:b0:640:f974:7629 with SMTP id
 4fb4d7f45d1cf-64350e225e0mr3893696a12.15.1763147647239; Fri, 14 Nov 2025
 11:14:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763117269.git.zhengqi.arch@bytedance.com> <66cd5b21aecc3281318b66a3a4aae078c4b9d37b.1763117269.git.zhengqi.arch@bytedance.com>
In-Reply-To: <66cd5b21aecc3281318b66a3a4aae078c4b9d37b.1763117269.git.zhengqi.arch@bytedance.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 14 Nov 2025 20:13:55 +0100
X-Gm-Features: AWmQ_blqeEJIFeEqLe5Vq5SGpFC4UPadwiIAm270RAB9lR4JL9-RyEZ3PVaRM7w
Message-ID: <CA+=Fv5SGu_Y-zwryrQiTQDy32SipMk_dfjZezth1=aZmnDKNeA@mail.gmail.com>
Subject: Re: [PATCH 1/7] alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Qi Zheng <qi.zheng@linux.dev>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, 
	peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org, 
	david@redhat.com, ioworker0@gmail.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_111409_741628_B7A5E180 
X-CRM114-Status: UNSURE (   8.21  )
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

Hi,

I applied your patches to a fresh pull of torvalds/linux.git repo but was unable
to build the kernel (on Alpha) with this patch applied.

I made the following changes in order to get it to build on Alpha:

diff --git a/mm/pt_reclaim.c b/mm/pt_reclaim.c
index 7e9455a18aae..6761b0c282bf 100644
--- a/mm/pt_reclaim.c
+++ b/mm/pt_reclaim.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/hugetlb.h>
-#include <asm-generic/tlb.h>
 #include <asm/pgalloc.h>
+#include <asm/tlb.h>

 #include "internal.h"


/Magnus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
