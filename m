Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDF4C7EE29
	for <linux-snps-arc@archiver.kernel.org>; Thu, 25 May 2023 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+80uDkYSprgDsY8T3mV8u814ikMARkZhsecIw9wyTw=; b=aFTHMzglnWxv/8
	mxs2PimDhRUIvWBDZR06Z4fe4bucAxePcuDBA8QH5xcni0HDsYVLY63BtZiLyWdf9ycpiuq0boRRm
	qHcL4g9CqCJYvvw2rQ36lbXQiYGVuG9PY/SddUZ/xC9f4eHJVBW1HLKPrjAErXOmJKlz7IQ+28HbY
	WMmTtCa8Gp2ME+Z/kXFHK0nl6M/2vDlFCrwiEjIIy0S3rrQ3gnpQYJKd6RJf8N6BpgQ27KiGY3hk8
	Np/lElHZc1pladLpMCN0/+5p2JsFwHWf/SqSVMtKJcTIAVgt+suFATffiO5knWJ0Ms+bEk2VT2iRf
	xSqx8NINPUu2fMdSCskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2DVt-00H3RO-2o;
	Thu, 25 May 2023 16:08:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2DVr-00H3Oc-1i
	for linux-snps-arc@lists.infradead.org;
	Thu, 25 May 2023 16:08:28 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ae557aaf1dso15153445ad.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 25 May 2023 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685030901; x=1687622901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USQa14bxm9/gfk0iTFn1mMIzz0dadrwCcKOKR8DDgzQ=;
        b=nwOl8DG2BBTjeCysT0zw1xSgZWdheR/RWsAuvcg1DdEjdV7B2fYOPNPm8x0tlNmE/j
         hnfZGo7TBiqISYdVhCnYremv5C6rfiQdCVrkrWDJ2SCv4k8p4lZf6cDSNxRpC/0e6ydM
         oJFPM1oZ1Oz6UN5lERgMzfDltBLvgFnDYXyHDHepKLi5qCbSQGiWYcWvVapAbkVDVZM7
         kkKMbwzQ+y9m3LXYiu/H5cTpU7Vt+mJm5uk1ow6Rb6h889EPpJZq8nRl+c0T4ejNoyt0
         VBprecfmG7TsMhgxy8WhSbUVjg2yQx2bkgVgOv0BPZ8Bb8CMQraD72x7kL5+9TFscMhg
         15Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685030901; x=1687622901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USQa14bxm9/gfk0iTFn1mMIzz0dadrwCcKOKR8DDgzQ=;
        b=fvGWaQ4yS2Yt/eCYZXqHdidJzszN7z1V0Lb54kyxIAHsXXufy8L9xbujJQ1ydEDTWh
         y+5aIHkjdunsJ6NdG5nqbnewLOlxz6twKlaP8cn/uT843QSQgtXICHRl9RSim8KHfUfu
         GE5m4kVa2YbhNp1pILHpOvOIaDaZjcX1BSxvsg7V7j5NSJHvnKVKMIFDHiTFop74aXn9
         dtEGD58taC/cWbPp0G/95WK1HjU0fgbYbrjd+gawc2e3TJYL3li8S2/ecG+Qb1EAdd4E
         iYcHqnGArsR3R6ZRXCmrhl5a7BZONz/GYinIO4p9c+NzHFIyw19gSlyupseXrRVM5xH3
         xB0Q==
X-Gm-Message-State: AC+VfDzg7sOoxvwKudVg9/PTi9PUYYIVZgZ6euA6Y4XYsQ4wTPQnd8zG
	JdAwGskYV09JetMRRNgTShw=
X-Google-Smtp-Source: ACHHUZ6hqDma7sqnvdnFTlwYvxCGOVKRH/UBaY12+lVWEC1CRJshhvo5HN45DYQ5qq2WPMdx85JqBg==
X-Received: by 2002:a17:902:e5c3:b0:1a6:8ed5:428a with SMTP id u3-20020a170902e5c300b001a68ed5428amr2528473plf.22.1685030900944;
        Thu, 25 May 2023 09:08:20 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-81-153.dynamic-ip.hinet.net. [36.228.81.153])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902a50300b001ab12ccc2a7sm1611450plq.98.2023.05.25.09.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 09:08:20 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Min-Hua Chen <minhuadotchen@gmail.com>
Subject: [RESEND PATCH 1/2] ARC: fix incorrect THREAD_SHIFT definition
Date: Fri, 26 May 2023 00:08:11 +0800
Message-Id: <20230525160813.39408-2-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525160813.39408-1-minhuadotchen@gmail.com>
References: <20230525160813.39408-1-minhuadotchen@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_090827_579713_0EDBCEF9 
X-CRM114-Status: UNSURE (   9.93  )
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

Current definition of THREAD_SHIFT is (PAGE_SHIFT << THREAD_SIZE_ORDER)
It should be (PAGE_SHIFT + THREAD_SIZE_ORDER) because the following
equation should hold:

Say PAGE_SHIFT == 13 (as the default value in ARC)
THREAD_SIZE_ORDER == 1 (as CONFIG_16KSTACKS=y)

THREAD_SIZE == (1 << THREAD_SHIFT)
            == (1 << (PAGE_SHIFT + THREAD_SIZE_ORDER))
	    == (1 << 14)
	    == 16KB

Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 arch/arc/include/asm/thread_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/thread_info.h b/arch/arc/include/asm/thread_info.h
index 6ba7fe417095..9f9dd021501c 100644
--- a/arch/arc/include/asm/thread_info.h
+++ b/arch/arc/include/asm/thread_info.h
@@ -22,7 +22,7 @@
 #endif
 
 #define THREAD_SIZE     (PAGE_SIZE << THREAD_SIZE_ORDER)
-#define THREAD_SHIFT	(PAGE_SHIFT << THREAD_SIZE_ORDER)
+#define THREAD_SHIFT	(PAGE_SHIFT + THREAD_SIZE_ORDER)
 
 #ifndef __ASSEMBLY__
 
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
