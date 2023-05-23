Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE94DC77B75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 May 2023 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S8c4K/pvXMARlP06nLeQmPJqg4PPJ7tmNDPfusSkhH4=; b=oMTkheGEQ7tGAX
	8/Fydc01zEEtd97iS1kkhVJUrP7qEIGWgB7Wcl+XtGa+DrJc0JoJiNzTiE+oSlabCtSrRjPyqpZTD
	vfHzGUOJA24ugy8G989vzr7SiJ+NO+PeRrhS0L7XGS8NOB19OascM1NW5nt4lPskLsOVpTd4gG4ha
	ez6fiS3AksUgk8JqaUwbFi85otn0dVut4lR/dbYaY+SBAXDzJBj9LP4WshDz61m643L6bZyuJsm0Y
	00MVJaINC9P9BSaJEerKWCb2PkLTVKsFW04kFfVRSp/f9j5eP0yZo5BWlL8927LgdUKIrA4Rp6f8+
	Q4MwATBlIgdKtCv4mbZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Tnv-00AcOm-17;
	Tue, 23 May 2023 15:20:03 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Sf3-00ASKT-2k
	for linux-snps-arc@lists.infradead.org;
	Tue, 23 May 2023 14:06:51 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f4b0a0b557so2514473e87.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 23 May 2023 07:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850748; x=1687442748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CPc/Vm/Ur0JOy8kF/L6fs0qWXc+VKBrwCqiZQE3hiQ=;
        b=DHx5ZxV7p8BhGcgtHBETWYRJd1dP/RkZ+YUCwCVosoC2AbBpe5sHXnMZMwMfxH0y90
         XzQe0bQlxKytbPkvQ7V2w5JMdAcALyzlLbnEu6FgCRgXy4OrpPkT/mSWek9ZWrsZAiWH
         t18h2rnk6uTfqGPlKFgZORYwPzN9BqAyYgP2fxRMHyNsWSDezmeWQlLl3RvNoS0at2N4
         zwQ3dB33a/q/dRZ6aJBGgNr9dIXjla+n0UxG3C1sJgM5T6M4GTED+bWcwU/Qj9vEwFAM
         ENMA+EKO7SMaOA+g+taxuDmYjq5EjwmFMZZGZfVYtGGJEuSMfUR23VvC7Y2vQbS5i/pL
         sqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850748; x=1687442748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CPc/Vm/Ur0JOy8kF/L6fs0qWXc+VKBrwCqiZQE3hiQ=;
        b=BeK+ahiwTuaSy0eixbd3i5Dx1hg/SjSrCNlMovMCEbAezQElxHJzqzrDRIdrQRqUQ7
         sQ2k4qxcIY+i912guyZd1kMZPjbnZGW+CN/XCM9VdMSFK5yxyFB9uPNJ/fPifYYqa7aV
         yFcQWMfOTwtvQIVHRdwrfZsLFL+WDmywKk//o9myWcVdGnnYu2AQKiHjYB+Mr/d6cu/0
         US3yOXu6UiwgbNEHOOsDZiygobvYfmCerLeqympG1oDE56SvT6WjVFR1m0w7XYiLIzEa
         /hB58FI4E7wcqi43PX8sXn4dfMXtTAKmaTn9tQxuDp6HufCC8km4bYiaVw+scZKMquUc
         fT+Q==
X-Gm-Message-State: AC+VfDxhlJtFYkRj2vlFM9Dix+f1tdYZCjYqxkwAeh2dEK9n9gClCOJS
	YXIwa9ljqcCkoc8MSM7NBQHT9g==
X-Google-Smtp-Source: ACHHUZ5pbGMO+sh/phzIMr8IiKndfXiVK4utpsmGDrzwNTNHRToknMEuuC5d/vlugDZ8cv2eNOF/ag==
X-Received: by 2002:a05:6512:259:b0:4f0:1124:8b2a with SMTP id b25-20020a056512025900b004f011248b2amr4733118lfo.46.1684850747942;
        Tue, 23 May 2023 07:05:47 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004e9bf853c27sm1346562lfp.70.2023.05.23.07.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:05:47 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2023 16:05:27 +0200
Subject: [PATCH v3 03/12] ARC: init: Pass a pointer to virt_to_pfn() in
 init
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v3-3-a16c19c03583@linaro.org>
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
X-CRM114-CacheID: sfid-20230523_070649_888893_964D7374 
X-CRM114-Status: GOOD (  12.98  )
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
