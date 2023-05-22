Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8FCC7EE31
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 May 2023 07:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJ9pQWY8A/5tMopOtVnN7CRPyqUtZUjp2Fwbf1kTPDk=; b=kEjWvteLhGDQWH
	DtPlVSqwHPNEI1E+uxhl4YSs3Xs6/jJthl90nzhzE/spS/MsZUAEIB0KmbWg+uuQHbbb9R1OoDUSf
	woq8mo3oUjdFRVUTxBr7O5zgpyNk/Tp+7DHfhrbC4PU12O1s4nwUVCl8SHeDPCPNUr2Tr+rmXmJPh
	O2m28SOs7FkivKKx5PiZt+xHIGsOdEDmIlTPporVuZAKl3ycMi78uE6YNhvkIL6Aw2rgElSuB+zdS
	0VqVHn/eVusGq1RrN5CnGv6ha+sjyYaZTfOKWn0RYH2A/K3NQcJnf80jocFg3/shenyoBvOVVmySQ
	k1i62zJZ8PlLf4GMo3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXB-005ZFB-2Z;
	Mon, 22 May 2023 07:00:45 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zX7-005ZCW-2P
	for linux-snps-arc@lists.infradead.org;
	Mon, 22 May 2023 07:00:43 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2af98eb6ef0so12512231fa.3
        for <linux-snps-arc@lists.infradead.org>; Mon, 22 May 2023 00:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684738839; x=1687330839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYHNj4xOB3A9+sRrGGyA+CHl8mr8r8wePJEdzxz75NA=;
        b=LO7QAWEi3XWWfPv7Pu1gIWoRWXD05Svn0aUWe9ia+PVPpBGbWgIXoeSqDhEuCZ9m1V
         N7o2yMOT/bX3Zg0bXymvaKcRueAICvYEskWgjbbJN9M8kpsCCxGIu7sMq+djqX9iletp
         NNTzhji7kSJp8V/MfSbC+Y92IAyKCek6VdF0BjOskhtqU5NAtJBK4rohlpMp63KwGw95
         x2q9EZhMOloZtzIwKBd0/W0MNFje2NGvy7nJs88/cnXEdWaUPK14XY5ambA4t3lPz/d1
         gK7IocWkrX/JFXWArNaIuBZ9filDa0aW6ZCzB0E/m9A3+MAjwUl8TtQ/V31Mqm4/e4+r
         ORhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684738839; x=1687330839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYHNj4xOB3A9+sRrGGyA+CHl8mr8r8wePJEdzxz75NA=;
        b=ZnAyC6gzmvZJiQyJfnRQwT6yAmGpu/RNn6klXrzr0mNXJzWjL13gbqdWRWSTJf/j5Q
         h7J8ByqQlUIJbl9nD6SgQ5vPlLRuwnQahpxHNqogGo4olWGhP2TU90Z41xanTg70nOlO
         k53A5hYEkWf9tuqHOo0j1YYAj2qtjVrgAHFUfL1+kW35RXsXGgG5Ou7VFUdGzKyAQhCu
         qdWmwVPOB3S7Z9XrVtZA67PmzFuZYBVxpnDuwSEr2a+J0x2BLfcGdUhoJNORbHcT55jI
         24YBtiXa0HNaeht+JN7SsBPp5vApK/Jd5doI2sRSc0hHDQHsh1/KoRN0n/2nEjMQhkaV
         usRg==
X-Gm-Message-State: AC+VfDwjWiHU/xX/Oe3rdLCK3Li+9jJm/fNdg3uKOIJice1ysifAZZyE
	tREfEc807IhG9dQWa2aP7Q/0Cw==
X-Google-Smtp-Source: ACHHUZ5fhAxOzMZFylf4oH/BOTWU2svs5luxPEM0mg62x9kQVW/D8jNnFWsE7tHE4XG4rlDSfMayYw==
X-Received: by 2002:a2e:a0cf:0:b0:2ad:89ed:aa40 with SMTP id f15-20020a2ea0cf000000b002ad89edaa40mr3349235ljm.9.1684738839020;
        Mon, 22 May 2023 00:00:39 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm1010187ljj.7.2023.05.22.00.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:00:38 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 May 2023 09:00:36 +0200
Subject: [PATCH v2 01/12] fs/proc/kcore.c: Pass a pointer to
 virt_addr_valid()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v2-1-0948d38bddab@linaro.org>
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
X-CRM114-CacheID: sfid-20230522_000041_786420_2BC0048E 
X-CRM114-Status: GOOD (  12.35  )
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
