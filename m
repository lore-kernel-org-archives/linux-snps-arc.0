Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAA9C77B75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 May 2023 14:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TVDrD93DqccP2iKVCej8LqXr35UeDivlhIOeflnKj4=; b=LAFDI9vcP6ubWi
	B5xK8rBphzV4KKphTc2+4suoNiwqksCc9Pkfjo+ySiyNOn6eHY2X0AlqWbAyfoXiUeHudWMvEV/QB
	0V6adytjuYYFrdwi7CrCudLSo5YrVyrYjnld9Ed44TohELNrPuZnRdoaWn72zzDsQ8d7bZ4uSl5e+
	2hTSNKLtLX7bu68kyRO6GCxsjRiR1TVgwHHB0lU7E5HQ1XbatcV8o3QqD0h2IhcBW+3vCSLbyK04G
	4H+AyCEERTQ1soIDJ0VNHwlVdX+as/+xxz2wiJgJ2/l14sAtQr1IP/vkrjWYrQ1GH87wjA0rIeYiV
	3MSLZcN8d23c8UvhZqYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1TDU-00AWr3-32;
	Tue, 23 May 2023 14:42:24 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1TDT-00AWqZ-1g
	for linux-snps-arc@bombadil.infradead.org;
	Tue, 23 May 2023 14:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AahUWbcM1gd1dIKV3ajpbH14PSzhJ7702+mo4mqS4bw=; b=nl2IxbFnmm9kc8Qu4cJ0cNq860
	thmci0D4ulp4kNiMd6yp4RML9nLUYu+tNM55//q83KtVGxggfepb9oSXaZvPpjQ0UPS/Z5k9PIE2g
	Hq21VOi4WrVK58Js5eIKRZoJu4Vd7GnwtRhM+aKDa5W2oOhLUqfQFeGMqtuyTTH/GTBAmoSDodYz2
	M4TwXic4C6M5DldT58eim+irTGSxJFlY9d1T2mc+vNbSD6mYsOjGtdIkGmVnWMu6uoyoVZG09pD3W
	IcfGBTxCQmIGk687uaC60x3DsineMJBUjVnzie7gXSV4RsslWbOpWlVC9+rLEB3DecpSyZi2z61iZ
	ZbLqutFQ==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Sf8-003XwS-1N
	for linux-snps-arc@lists.infradead.org;
	Tue, 23 May 2023 14:06:58 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f3b9755961so3499020e87.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 23 May 2023 07:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850751; x=1687442751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AahUWbcM1gd1dIKV3ajpbH14PSzhJ7702+mo4mqS4bw=;
        b=suXLt6rUWNL44vDNr6SS/EymOZ59hQEEGR2ZTXjDAx/AQp8nmKRLdaV2gUtIwvhf1t
         K/tAq8Z9ZeMTJQOstwd3dQeZhusrHSkrzN26dMfjKZk7yFZpGGO12BPMNBl2tvDMBfau
         g1zZ2x6JYoE8G1O6v87j/M1aKi8OQ0BwKQlzHWXj2LMSLUmsooYNVOxWag2uMhjdMbMO
         cWdFAnbyaQzYQHH2jmdzSe8LmY7bWDBbmxV219wusGP7c6T2/7oOh6ZhoSHiNVm9tLUm
         nypNbf4j0yWVIS8C0Jk1OKF5sOw3pb2FjFioOqx47SpRH6sLccmqgHJKbm5qp2ED/llI
         S7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850751; x=1687442751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AahUWbcM1gd1dIKV3ajpbH14PSzhJ7702+mo4mqS4bw=;
        b=jc7dnUzNJPfYcY6KWHCXe0TpV8nJGxB7XeSeiKz6wHXMwdnmw+eP5jy+LPMBgfXY7b
         DnXuzFXAymSC/kb77pglw1PNsAmnYGqNWOEdj7KK3XiyqE81bXjTXpgmlMs8C6B2eE27
         kyzWZDgAjOHRno5c2VysoObhei8SKRddwQVqdMRechiXBtULxPuQMgFlGJJwoilGBPWB
         MA4W+dishsQm8t0RMAxTHIg7/ocGA9FbHWSvaDcd44DPiQaG9z3Blqvkbwxd5+VKrNIV
         /isMDuz406TQQtGSJCAYBa4/7n1mDOJHzrnJ4wHnTNzEeTW5u+2A/n5RO07oAGK4tF/o
         oVWg==
X-Gm-Message-State: AC+VfDxse5i7DbS4Bc5FoNSQM+3KudfHpCbPGo9ddH5do3F8607r3uX7
	6PEfGKHEuDZJZGE/I2lDo0BpYw==
X-Google-Smtp-Source: ACHHUZ4Heo+Mm/MZodpjJ/spmtQbla212mLAYM+FLuHrRCfUH/Fsho3ChrpMik0Ns6Cxqj0IZ64E6g==
X-Received: by 2002:a05:6512:908:b0:4ef:f11c:f5b0 with SMTP id e8-20020a056512090800b004eff11cf5b0mr4377803lft.54.1684850751226;
        Tue, 23 May 2023 07:05:51 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004e9bf853c27sm1346562lfp.70.2023.05.23.07.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:05:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2023 16:05:30 +0200
Subject: [PATCH v3 06/12] cifs: Pass a pointer to virt_to_page() in
 cifsglob
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v3-6-a16c19c03583@linaro.org>
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
 Linus Walleij <linus.walleij@linaro.org>, Tom Talpey <tom@talpey.com>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_150654_660807_D822B1A2 
X-CRM114-Status: GOOD (  12.76  )
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

Acked-by: Tom Talpey <tom@talpey.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/cifs/cifsglob.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
index 414685c5d530..3d29a4bbbc40 100644
--- a/fs/cifs/cifsglob.h
+++ b/fs/cifs/cifsglob.h
@@ -2218,7 +2218,7 @@ static inline void cifs_sg_set_buf(struct sg_table *sgtable,
 		} while (buflen);
 	} else {
 		sg_set_page(&sgtable->sgl[sgtable->nents++],
-			    virt_to_page(addr), buflen, off);
+			    virt_to_page((void *)addr), buflen, off);
 	}
 }
 

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
