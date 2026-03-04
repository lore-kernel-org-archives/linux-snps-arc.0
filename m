Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0B8EB7EB4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3xbe3Li50rhYDjxyU8jV6DRugbSdkmt53lkUZ2X3Y8=; b=LB98J0vQxBEYmD
	uG5PVVbmBxmTJYHwVks2FcK5bXgHPuyLwu1rrqekaPPkJ+sGik6/OplPFT6N9Il95paAQuy9kEA5D
	pVuKlpRJsnOaAXuqRStdpCs8PaMUUEHd0CiUf064VPFu0whLcuPiaHA/Gak8EoNORqsW1cx+irBmj
	C9tROn6jPVxzRjF3O/JKgB/wCWcA54Z3RO8+6O2GXyGNHctaCBKiuW6cZv9IEN57LMIzGRn6UJeMM
	wZCX1tozd+/Z63pkrfjN6+XMoW+DwQblKWgoenT1r7KpKd30SycjrbgU6eWcuNy17w+WH1qjv3ciQ
	05kU/NKC7h4kCYhPzDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8j-0000000GofL-3Q6q;
	Wed, 04 Mar 2026 09:03:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8h-0000000Goag-1cmE
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 04 Mar 2026 09:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=; b=PE+mo1CebUdrqDAHenVpI2JvqB
	HupkYr4I5phUM34AKG1YpCxtdt4Z3VUyDzr1QWfBrn8nE6gDQ3jiibjjoC+akHy1gZCa04YvJw5aT
	lxEzmNsvD8JxoPZNDHc5NznVKLsAzETUIm9eMKdN3JpN+IN4N+L2Ub9nqA37QJL4V6+A9JKo4SOa9
	sW2z9pYfjEH+mrvqNeQpG/iF8VVCa7LHQ5CHXPuUzncYLr/zSpCdln/aHHqyurq+FzY1xZIGr6JuO
	vjPonOu1uPug4iMBiWI2ar5cxzRzvoF0wegZjDHdl0kuk3p5st14af7V6txMI2aB+8ykQjpCk3cgk
	JKfH9vlQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8d-00000004CDa-3Soi
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SPgh1677902
	for <linux-snps-arc@lists.infradead.org>; Wed, 4 Mar 2026 09:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=; b=KM1nxb8aj0tWlKAq
	b52Nx7se77o3CBamhSkfMSBNL/LoHsX6BkUJw8XnmD1Hk32c0FZXccAxHNksV1kf
	fNRo/k1ZAt3VNvk16Evg4xhW52CXIfNhQiqDirLYASsnk31X4aLnKZmGdfZypEwU
	YUXXRyyM6MQxSqtbgN01xRiU7PnUPmyqJNjLj3J8QnRYxDI7QOvrOQ2ZkNSAKCtM
	a7lNFKTSwcYExx9osupgM7HO+JzSxfF+A/fFW5Vyyx+qhBCGWyYkzfftDhOr+6xh
	iSCVrsUVqMbrd409to0DbK/MIt8YJrf7MQPa/SWIJn40kd+UAL3tUJrNjzQTJDaI
	g5mi2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73ha5ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 09:03:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb390a0c4eso4283193685a.1
        for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615005; x=1773219805; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=EeZLUEfXAVBeIuvXTruoxGqlso2pBJDDTdirNzFuP9vaHgNz6S/ZfqpMgmt6VA11bz
         AdCwlOwaNsdlRefZVLKiM8E68ElszxHvsDMkTEIy05LQjEte0Oo6iXYiismu/LCxySH6
         HmtsorrupmSUn1IIXVWiRz+cNZkzezhSuCBA55rv3/UMpg5YOQk/DTCmpcy7GuxuFgQR
         DiygfrPcFZNUuwITjCKQE9ugYI4ImbdVej8oF4ZbGR3B9NbrluTebiRhKV4RP3Se/lNv
         LSi3k3bzv3/J7Cv7iOzOi+Omw99INz4hwa+ueYCdxKDoZBw3O9reUStRjGdmYAWPeMMA
         lmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615005; x=1773219805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=RfY0Hymf7Hwm9u4KMMROoa7sVIUqoUqEmCIH4Du+exUfVbGKmfitPXBb0EYfqRwoRL
         V+tEuJunjyINGPQKJZS3eN7cAXcUAUTGOozoe1M2g5IxMkFetUCsYDxD6O6X7aED6PgK
         s0bk6pLLPIYJJjB4G2Pize2ppC01bJJcuLWRovbYUmowVdXOjHlF9X0lJLBoeBVvou9e
         t/F0rqFUJSa0bkSPrUMJ0HHeG2aNXwa5otQYu/Sx+Ht/3GIBIye8+QhmbaHWqPJ0/IAc
         gtDDajdzKBMntLjQ5sRJmCtlFcS7dVHJtLOHUiWvgGRePXyAP2QRnDfwitZbty3DjEtq
         i/lw==
X-Forwarded-Encrypted: i=1; AJvYcCVwJEZcpgZJ8K7ogoZ2CakOksjMneSzvkNFnmIv01ltkVWt4bCbpR2RfEqGA7NYNJND3COlg7uxZqiuD8W3pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLac9IGmoQjys8MWrOuRMpLHE8ImK11AOyw5Foxqu1JajaxG5u
	0s1DKKZoyGY6uQnVlNAginNt9dwS909pXHendpVFZDhtFIm+BgMwsbAoAQpxglgJwj68xLiVjj3
	uM+ZDQBgrHVrmm1JjqSaNMcDy92jdKLJo2Yrp2N56xymAoCnllkMFH+UAl6NTCZMrfawLiKAG2y
	A=
X-Gm-Gg: ATEYQzw3Y1SCqDOM9CsyqbMvoBOUKa4T3muSNJV7cssJZXUrrHyBbggt2Nb44FyAm1A
	XCG2BYBqs6EKoHeXzh+kdGKkYYqe4GBIZ9MN0RXgvJT70OUmJTNVhR1miQ5Mm5fY2VJs87vI72Z
	WFldKLIgzS/LvKI6wbEf3wPXqlR6FdQODH1cvHTRLGzEYgIEL12N2z5erZ31NJJbnW/TGKEBTlq
	CpJS81o/U25SqkktiUCxI2p3EmnTaPht3A1dgOMwVyAslAHr144QZvrkf0RntOFofYGxGDKsf4S
	fNQcFHN9MJVBO35JzEfi+ytsyW6RPitvnjL0PaucvDWxPN2ZeWkve5MGT+awqspFZRDSt3g5k5u
	88yr1QMm/M6lP4B/c5mTqLF/vMuAJLdRHa2vi0OGZ81Z9oPH2Hh1Y
X-Received: by 2002:a05:620a:2a11:b0:8ca:2e37:ad07 with SMTP id af79cd13be357-8cd5aedc525mr148299285a.8.1772615004774;
        Wed, 04 Mar 2026 01:03:24 -0800 (PST)
X-Received: by 2002:a05:620a:2a11:b0:8ca:2e37:ad07 with SMTP id af79cd13be357-8cd5aedc525mr148296585a.8.1772615004301;
        Wed, 04 Mar 2026 01:03:24 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:29 +0100
Subject: [PATCH 08/14] leds: Kconfig: drop unneeded dependency on OF_GPIO
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-8-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=808;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=esqrcU2iBVY8ci/hzt1UovcnezFcilbxILgA7vFytvo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UyednvCwSCoZ+nWGbhEbuv0oD/DsD+ub+SH
 Bayu8pZbRSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1MgAKCRAFnS7L/zaE
 w1PEEACFpMfWSUuL7d1juKi1HvQOLE5EdxG8E6A4QaKtXdS3ANVfIy0qrGuEIUQXgicbWadwYfl
 OaTottfXrufEJmdI0fv5wm/Ba0Ce+dGauXb9LT3oWERf8IIESub3fSBxQR47tJ3RvMiImrdQvVN
 kKc/LD7R2+gjpCuPPTddvQZJ0tlkKy8e1ZTmaa/hkzkJ94XaN9nPnEIdFCu9Kr62779GyMchvXx
 BxRd++vsdgYSwLCw/buTmw5zNTr370yDqP+1qH+rVjMxtfO9Zw8zkY6hmSt2xTXNEqu7awNMt87
 y9s51NYMLEt/5kNRRBWwiQXOTueyUnFLcKDvppzruElRsoI/mAX658xGSGoP67hp+abb3nb6OLi
 JL4vTng9bv5lINhV3xT8Atk3VZh7t7iysgSY7rfnm/j5+USEIwNtWYLtSKS/Joc6vNav3MgRLhO
 4LmEv8gppfOWfvU+papRncEUoxZKfsuyg5JDM3qszyQdUxzbvR7uaaxIY92hvizidXOfkzZHiUm
 xis1G8tdtqLlUrRO525gB+cnSkXockjuD9cvWhGSr90WATkl8RtxCNSTacO8tjTGK7UiE0PavPA
 wmJlJkD5UNPd6btvf4QqiFjWdL6XosBMIn6BtwfkGMIKJS7BPu0sIS693sDZqL7tU3J1U4xbUVW
 GuGQMI9pJeVyrkQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: kTp7sHHsu2NEPb9qbXFplzqGTft4EsIA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX/TYXP9wyvXGi
 4xka+SKaZ4OmMoOUZURR8CCuwyT7K5TDbN899Xy2UzQpsl2pmxZvCpKj7P48M+oYYwPxRN4MLlR
 Mayj0G26xndbIMcyYEx0gJd4bQSjNVBOXsw+uvftGvjYxym/moVg3uX9S97oIlFvlMEOhFPwFsr
 Yf1a2z6LK34gRgokM0qTis17iKORlbygCMWVkePgQhv1qzCyscb/xvq6XzWPJc0b+UqIr5JFfAd
 ltjdbFwQILBjiX/t5/oTDaEMHmAsUR7gyZadJwHdQ+fPcXmdeObEn0HeeVWOQce5sZBZ9u9dbdX
 dd4b/3njH4OeJJCgTvj6rwKexUgo4c/eCIOw/CHY/y8nHzRt03kdCwd/13FfTK+4PhbuZdvZhZ2
 Yi4/ZUT6H2xm5uZaWH18RpaJjlw0/xHcoGHiEXIM6byXKmNdeFIwIBPJZKRXxQriXaOy4uZvKI2
 nT+wKUEwY8Q+OHKZecg==
X-Proofpoint-ORIG-GUID: kTp7sHHsu2NEPb9qbXFplzqGTft4EsIA
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a7f55d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ULgK7OEL32dECu8VbM0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090328_533494_86B05434 
X-CRM114-Status: GOOD (  14.52  )
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

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/leds/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 597d7a79c988b35f304e953e873af3afe2ae04b8..f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -765,7 +765,6 @@ config LEDS_NETXBIG
 	tristate "LED support for Big Network series LEDs"
 	depends on LEDS_CLASS
 	depends on MACH_KIRKWOOD || COMPILE_TEST
-	depends on OF_GPIO
 	default MACH_KIRKWOOD
 	help
 	  This option enables support for LEDs found on the LaCie 2Big

-- 
2.47.3


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
