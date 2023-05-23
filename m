Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B58C7EE23
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 May 2023 14:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7r5uslQUBPSgoofl7v0KoIV2HBLdO3InT9pYQoI21hE=; b=vznQIU+7IohOgX
	VDc5GVYbO/vfUNvBQwMAI/SrdBvwJaqz/BdZQngAaPLCwCGZNrgbSjKRM38Pd/XtI0wdy0LO36bfT
	kc9nUyyUwlMnOwfL/LSbGIpucwugvoifSvnKGJA+J5OVWQMYCpAarEkdn+snaXqHTf/ik+BGjckQN
	zL+PlGSOZGPCGncZsiqzCiFglZPZ+mC96vmwstD1tz7fpEA51xKH1SjRqJ1p2IfpXgd6wVetLtRlH
	z4LEMGpVaMqEfNdkXwAOuYiCUGwdHWgN50VoM3lP3o9Mtuo5nuK2uovh5eejKzvcZrRKNRHNqy+4c
	WvXViEdLcDZuPJiqUpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1TDU-00AWqu-28;
	Tue, 23 May 2023 14:42:24 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1TDT-00AWqZ-0K
	for linux-snps-arc@bombadil.infradead.org;
	Tue, 23 May 2023 14:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=H1mJE8PBb75X4TbUyJXZ6L55Fw+NsuGtTu+nI/l3Cvc=; b=RHkL1bjduT5NDxcXhEmge+gKPb
	kGUUmNzGc6HA50RH/3GiqLElmtab9e5RmeOdS7lMO+6pwYcC2WJ8Tj9LHYmbfE6Gp3LP9ecG13Otv
	mhFPuiM/NblY8LV8g+PPTOemPQNHbqvt+j6YtqsNjZo/M8e0xGTTmSVPreMtnCoeLjmJBbEERH6Re
	LEXd5BYZlnMIbHHr8+naaEz+3GlBTz9i4hB8hd6K7rUdBEoR+eE6J51IKWpESP7Yg90tR9JdiZwV7
	idYDjTnNQgKHHWGv9QXj7eL4sm7+NQ9LR/e6rezjf7iai3vLi5AS14+ZCnQkRdJAO5e4uUS2pGVRZ
	jB2J5Jyg==;
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Sf8-003XwX-25
	for linux-snps-arc@lists.infradead.org;
	Tue, 23 May 2023 14:06:57 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4ec8eca56cfso8197540e87.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 23 May 2023 07:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850753; x=1687442753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1mJE8PBb75X4TbUyJXZ6L55Fw+NsuGtTu+nI/l3Cvc=;
        b=sZzbi9Or1ecOkZRiN09Yj29Ot8B7LAVjqlaksWa5mtFSaJfhhAjYBQqCbgu39f00zk
         VK7TpV3BWK7N5disTxsUT+9gEJBxOb/ehtepI30IxdIgZOD7ILx03dfX1U9LUlrqnIxN
         o/DfgylSvuaURfgnFTqAlkk4/e/2QTF/i6nSUNEA8A45JrglmfBlJskn+PBcNSxo8Nax
         UjDkj9kSQQAr49/ra9mfVBiByY1gHuy6vLurVvXWcr3GtGvlt7ps8J70oCU3gREuO2Ow
         Oymkav54lF/OR103ZsyoD4QG8gT0MmmztfsSMu7sHfsLZwHZYwfd4ojLRHaLUm/2afXV
         RLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850753; x=1687442753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1mJE8PBb75X4TbUyJXZ6L55Fw+NsuGtTu+nI/l3Cvc=;
        b=aNSW7WOECf0b5ryq6G2C6b3RJMvmZQ9KqpyyfbNPL9edvpUpn8v+CXoXvmQ3fHpAIE
         +aSutvLf8RhtWHsfDEYJ/XGLfscLy1sRsOSz81eVYiH6GErijBRbaacAfaQU7Gd9Jo42
         oDMIHcF4wOlv6EYHMFP6dKVHJFRcVjApMW3PViFPfC3SfeiNsoxJ5fwCgpTo1u23dR1e
         RdzZBVqhW5rTo8B/MK1oUf46t4HaivnmWBiRK4NYy/e6uJtnQNOVcc/VZ/1GgV9py+Uq
         CMg4BkaucN/XUY1VStIjHGkjNOjyFY2acCg3f1nESegtk0bcE7p56S4eZd4tGaILCU+v
         3Ryw==
X-Gm-Message-State: AC+VfDy5MqYss6fe5hD9QfXJprIAqkQJ4CpG+4waQc0ppB8K/NL4b2G5
	Q0+aIOyQ1YaeimZQUjXF10XH/Q==
X-Google-Smtp-Source: ACHHUZ7YlzepS19qIlofP4XlSVUTHmMLxnEQ9ww0qjdX5Jh1QQqAhfZ8W2WtZdVOQzfdgWC9DXghfQ==
X-Received: by 2002:ac2:52ad:0:b0:4f3:8263:cfdb with SMTP id r13-20020ac252ad000000b004f38263cfdbmr3539737lfm.50.1684850753268;
        Tue, 23 May 2023 07:05:53 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004e9bf853c27sm1346562lfp.70.2023.05.23.07.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:05:52 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2023 16:05:32 +0200
Subject: [PATCH v3 08/12] arm64: vdso: Pass (void *) to virt_to_page()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v3-8-a16c19c03583@linaro.org>
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
X-CRM114-CacheID: sfid-20230523_150654_762481_1183EDD4 
X-CRM114-Status: GOOD (  12.62  )
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

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/kernel/vdso.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 0119dc91abb5..d9e1355730ef 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -288,7 +288,7 @@ static int aarch32_alloc_kuser_vdso_page(void)
 
 	memcpy((void *)(vdso_page + 0x1000 - kuser_sz), __kuser_helper_start,
 	       kuser_sz);
-	aarch32_vectors_page = virt_to_page(vdso_page);
+	aarch32_vectors_page = virt_to_page((void *)vdso_page);
 	return 0;
 }
 

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
