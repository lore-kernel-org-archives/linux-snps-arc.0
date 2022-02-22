Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695E3C43217
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GzuDL0WzFyHW3qU14X1ORUTHzJEevVxD219/dt6skxo=; b=fvKhhxFqyrckcL
	vRSd7qBzjiwPoHgIqjoWU2WAZ+QSi0WEDCdh/jvPJxUn6sXrp1CcfjU3NA9aKmj9d0fP2Ztew95oJ
	PrBUYNaWHiqkBw2o/+mMxvEmSVyUpwGEHPgDBsVHyoBKpcpWsZwHNsb4vkhNNvudGwiflN9c2+kvC
	FStMPfdHZnYYWfSC9AIAh7pCCMin2BZ1+Ce8XEYZpSfyfOAn0u/CIXQkJa9d5wJio7MOSMeBgkVxb
	0F0TSQUrykU/URSL1HbECAOGtBFlMYJUrDBfEn2qczfGfGTI+ClC1A2+7EMaKbIyGZ7QEPTiRZJww
	tmV2LGbnmxOxJvp7K4DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVx8-009qhJ-Q5; Tue, 22 Feb 2022 14:15:42 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVwr-009qUF-Sx
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:15:27 +0000
Received: by mail-lj1-x230.google.com with SMTP id e17so19757219ljk.5
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4gyYEhPeAnSY1Pta4tacguMbnijkVO4Hr+s4Kcce0Wo=;
 b=oYR9NBawDuRru9we6zFbBzbxjtlH2YEX6nX4P1PdXvmsw1XbyaElLdo8S2oXrHK+A7
 /QgPJjtGi/aDYLb0gWiTIGoAMNE7SDEHGfJX59m7M7U4xzk4WnCALyAOymPkEaYofu9c
 5BizIchWCcEte+fC2er7MOp5zVV3neW1KfHPAkv/O9we5ltz/WA2Hph/o/OU00o+3LbP
 7VcPFgF35HQ6hk95GDyib3in8lwSrBq+27Sa1zG723HMBl6ENoJpDJIf/omMFdJELxgb
 gqwdisTdVZD0RB5mkt9i/s6YXySeOp9CALzJlISMBnVKlq9jajiMXcTThj9jj7vPuLJz
 VfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4gyYEhPeAnSY1Pta4tacguMbnijkVO4Hr+s4Kcce0Wo=;
 b=GL+pgd6g1arb5Wh510TD45Nm28o4xLOnSDaml+i2xRHUcccYnk0iSaDTotrHeGk0gt
 DDc+P4j0tC70ogMT731T5aLI9dzzEjCK8JCm8Mdg8N7rT1JT1SgXoiXydmiOKGDpN0XM
 tn+Gw0zgsS6oSdCqozv1aabBcPphqwkPZVJRa+B7pGAOhP5EnvBzQJzzrk/kSobSgCj1
 m5KKQxGG1L9c2v1OI1MRrrklb6BTd52ma82WxwDC4D/MMOvG8jGCq7SGh1dIohZgrilm
 ITiv0ffAPqEB2Fzy/elI7BjNJToBehybG1VdN/FjIsFlGEbdiT+hfZC0Srp8rfdMRzbK
 4gOg==
X-Gm-Message-State: AOAM532Y2AB6yShKOzpM9WtndDuR21b117/vexDemWXt6Q89JXHmNkdk
 cPPGVxnPqDzakmwA0y6buhQk82rmEPE=
X-Google-Smtp-Source: ABdhPJxVbuKZuCOcSSoDAPNVY/gaC7NUA5Xs70uMPenzsyVHp1L3UCgCQseK34nI19KktgDkluVcsw==
X-Received: by 2002:a05:651c:12c5:b0:23e:1f55:35b4 with SMTP id
 5-20020a05651c12c500b0023e1f5535b4mr17046388lje.58.1645539324270; 
 Tue, 22 Feb 2022 06:15:24 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id m8sm1707047ljb.131.2022.02.22.06.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:15:23 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 10/13] ARC: checksum: elide ZOL
Date: Tue, 22 Feb 2022 17:15:03 +0300
Message-Id: <20220222141506.4003433-11-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222141506.4003433-1-geomatsi@gmail.com>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_061525_985465_E6A13010 
X-CRM114-Status: GOOD (  13.18  )
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

From: Vineet Gupta <vgupta@kernel.org>

Add checksum implementation based on double load/stores
if ZOL is not supported.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/checksum.h | 58 ++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/arch/arc/include/asm/checksum.h b/arch/arc/include/asm/checksum.h
index 0b485800a392..435017be9900 100644
--- a/arch/arc/include/asm/checksum.h
+++ b/arch/arc/include/asm/checksum.h
@@ -29,10 +29,13 @@ static inline __sum16 csum_fold(__wsum s)
 	s -= r;
 	return s >> 16;
 }
+#define csum_fold csum_fold
 
+#ifndef CONFIG_ARC_LACKS_ZOL
 /*
- *	This is a version of ip_compute_csum() optimized for IP headers,
- *	which always checksum on 4 octet boundaries.
+ * This is a version of ip_compute_csum() optimized for IP headers,
+ * which always checksum on 4 octet boundaries.
+ * @ihl comes from IP hdr and is number of 4-byte words
  */
 static inline __sum16
 ip_fast_csum(const void *iph, unsigned int ihl)
@@ -62,6 +65,54 @@ ip_fast_csum(const void *iph, unsigned int ihl)
 	return csum_fold(sum);
 }
 
+#else
+
+/*
+ * This is a version of ip_compute_csum() optimized for IP headers,
+ * which always checksum on 4 octet boundaries.
+ * @ihl comes from IP hdr and is number of 4-byte words
+ *  - No loop enterted for canonical 5 words
+ *  - optimized for ARCv2
+ *    - LDL double load for fetching first 16 bytes
+ *    - DBNZ instruction for looping (ZOL not used)
+ */
+static inline __sum16
+ip_fast_csum(const void *iph, unsigned int ihl)
+{
+	unsigned int tmp, sum;
+	u64 dw1, dw2;
+
+	__asm__(
+#ifdef CONFIG_ARC_HAS_LL64
+	"	ldd.ab %0, [%4, 8]	\n"
+	"	ldd.ab %1, [%4, 8]	\n"
+#else
+	"	ld.ab %L0, [%4, 4]	\n"
+	"	ld.ab %H0, [%4, 4]	\n"
+	"	ld.ab %L1, [%4, 4]	\n"
+	"	ld.ab %H1, [%4, 4]	\n"
+#endif
+	"	sub    %5, %5,  4	\n"
+	"	add.f  %3, %L0, %H0	\n"
+	"	adc.f  %3, %3,  %L1	\n"
+	"	adc.f  %3, %3,  %H1	\n"
+	"1:	ld.ab  %2, [%4, 4]	\n"
+	"	adc.f  %3, %3,  %2	\n"
+	"	DBNZR  %5, 1b		\n"
+	"	add.cs %3, %3,  1	\n"
+
+	: "=&r" (dw1), "=&r" (dw2), "=&r" (tmp), "=&r" (sum),
+	  "+&r" (iph), "+&r"(ihl)
+	:
+	: "cc", "memory");
+
+	return csum_fold(sum);
+}
+
+#endif
+
+#define ip_fast_csum ip_fast_csum
+
 /*
  * TCP pseudo Header is 12 bytes:
  * SA [4], DA [4], zeroes [1], Proto[1], TCP Seg(hdr+data) Len [2]
@@ -88,9 +139,6 @@ csum_tcpudp_nofold(__be32 saddr, __be32 daddr, __u32 len,
 
 	return sum;
 }
-
-#define csum_fold csum_fold
-#define ip_fast_csum ip_fast_csum
 #define csum_tcpudp_nofold csum_tcpudp_nofold
 
 #include <asm-generic/checksum.h>
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
