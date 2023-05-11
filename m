Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA5EC7EE2D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 13:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nn6qkQJHaR1JUeo2GaoGjHbTLkR1J4A3a4IcQ3P02eA=; b=18lH+ZYSxjFVVs
	PMSA8c9lFFgft3minc32FqQAkhBwe97hecMUKeoa7IidkJdkliIecqtTV4JO/NYYiIRkw3jGh4POr
	zRxhY8KR8WqMAf7yJUBox5rOxgzRZlfZHgYfLtyX1WWFiihy94+UeWs78JnxcQswqgewmSODYp2KO
	wrZUCEp7nAJkQNNFZiXH3hRoLonnQu5F8jvhquSrAzrt3M6PnH9gt6yswoz0g25utTNjRa/Q1HOU9
	rtslNFYN5iehOUPRWaZfb/7GxoFByENiSOHi1p38v8Xfzg42xB0N8M+HFRrh29mEb/rso83mYWkkh
	Z0k7lNg/l5bD/Z4iIIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px5uz-008nOu-0G;
	Thu, 11 May 2023 13:01:13 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4xi-008hDS-2H
	for linux-snps-arc@lists.infradead.org;
	Thu, 11 May 2023 11:59:59 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f1fe1208a4so6676539e87.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 11 May 2023 04:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683806395; x=1686398395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldVw9wlzEkzEKLn5PMVleGqWnYMQxC7MlxWwEOwXVk4=;
        b=sersNdtzW5iLzGVupNMmSJvBYmwrZ//xZBxoOUDkXI1JTW4CI6ctj4FhudGratDn9k
         cRnkGze5UhsFvb3lR7Z7ykzxMMc0MSELwIy7erx+30m7guaXslAKu512vsaLide2fBN8
         bzO6LMr/4P01YQk5JchLInzlvvtZaYnfs9CHAIEYLUvt9rNDqzoX36kf+ZRPAeMUF63R
         CCLsu72Nt/qnplWuj/eGGivCt82mEPHLpvvAQfOpT7G7x9ZKs78aN4p4kFH/Q3ORHnfo
         F+xP25avZTDsQROtfUVMJN8MesmV4EWv4hDtLKEn2U2w6S7bTHItXBK0WvgvggA3JEzW
         4KRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806395; x=1686398395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldVw9wlzEkzEKLn5PMVleGqWnYMQxC7MlxWwEOwXVk4=;
        b=PJ2pOLc3x7/WpuMbpoeX+UR+pbReE3q+OB84r/UwKrjyHkrKvYzRm1vbiecgx59Vx0
         ck5v66EYm3xbr+CjSs77Mgh9SVKfCcG6km7/pmPELUAE7hdPK1TRv2EJ0a9jn+FACSbO
         8mXSTZBHpux75q9Vw6KiTqar8hYxjbp7Hg4Ux7kM5pjrAYOkVJRZ/c8eX6osMiG5urUk
         3gHG8EIo5Hfc4Em3Ri5f6yr9BTcLdSQq9D7XmTokoNCHNjY+EsJTYNct0HK7KSZjmX6A
         zkCgnEseEppxQdinx+ChP+iWugT1MGrK5ApaeZBrlTVE9DaPM4DZckWALkErXQlfbPSC
         efxA==
X-Gm-Message-State: AC+VfDwTmocEZoXtuM4sEByV1dUtEh/rNjzmsLxkMo4ULNrrP1FwOqF4
	RsEpZxyJRXdXVyYs/D18tMzndA==
X-Google-Smtp-Source: ACHHUZ6cUHNYU0J4SZMS7pZsEER32rUvhWP5SmpZGGTwBMJBiTrayLkP7UYjW+7FVQQ8Tu7K7BVxbQ==
X-Received: by 2002:ac2:5339:0:b0:4ef:f725:ae2f with SMTP id f25-20020ac25339000000b004eff725ae2fmr3438930lfh.37.1683806395538;
        Thu, 11 May 2023 04:59:55 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25090000000b004cb23904bd9sm1100841lfm.144.2023.05.11.04.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 04:59:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2023 13:59:26 +0200
Subject: [PATCH 09/12] asm-generic/page.h: Make pfn accessors static
 inlines
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v1-9-6c4698dcf9c8@linaro.org>
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
X-CRM114-CacheID: sfid-20230511_045958_741077_757CD384 
X-CRM114-Status: UNSURE (   9.57  )
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

Making virt_to_pfn() a static inline taking a strongly typed
(const void *) makes the contract of a passing a pointer of that
type to the function explicit and exposes any misuse of the
macro virt_to_pfn() acting polymorphic and accepting many types
such as (void *), (unitptr_t) or (unsigned long) as arguments
without warnings.

For symmetry we do the same change for pfn_to_virt.

Immediately define virt_to_pfn and pfn_to_virt to the static
inline after the static inline since this style of defining
functions is used for the generic helpers.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/asm-generic/page.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/page.h b/include/asm-generic/page.h
index c0be2edeb484..e8ef12bb858c 100644
--- a/include/asm-generic/page.h
+++ b/include/asm-generic/page.h
@@ -74,8 +74,16 @@ extern unsigned long memory_end;
 #define __va(x) ((void *)((unsigned long) (x)))
 #define __pa(x) ((unsigned long) (x))
 
-#define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
-#define pfn_to_virt(pfn)	__va((pfn) << PAGE_SHIFT)
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __pa(kaddr) >> PAGE_SHIFT;
+}
+#define virt_to_pfn virt_to_pfn
+static inline void * pfn_to_virt(unsigned long pfn)
+{
+	return __va(pfn) << PAGE_SHIFT;
+}
+#define pfn_to_virt pfn_to_virt
 
 #define virt_to_page(addr)	pfn_to_page(virt_to_pfn(addr))
 #define page_to_virt(page)	pfn_to_virt(page_to_pfn(page))

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
