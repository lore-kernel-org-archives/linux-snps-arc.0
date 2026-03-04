Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76CEEB7EB1
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yC4m8zXtr6S5vN0xagTA6HsIAl1Je64Fl6l3fyWcEjo=; b=HCHDb4YDWmacjn
	myjcAEcFSyXAW0fTl6eL85Z+l5r/HeoYRofqhyf4cJkyiXplF3l76UNv+1yTANQt2jo0geT1LUfXC
	gU/12xoZ5PWgzaQ+rRzkK9K+m0y7cuFBcpNsbTycFpkjW8AE8S9mfd2vEpFmNdYbBLKM0C/lEDIL2
	Y2vNlrRv/Ty2Fa9ON5p/LVI5LBUJCvukqMYJA6xsS1nvf/VjBnXALNMhZYojXY1mPC4bKDJyXBE5U
	sCnVIMJw5+zdj4yNOlmIHZvsZtwAPWcptEI2aJzwOkAHdDIakAYDKBSaQa0hw07l5dDKL9z6rx5OF
	0gMynQ2I81ou9mTB+VEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8M-0000000GoBj-1r4W;
	Wed, 04 Mar 2026 09:03:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8K-0000000Go84-0yOx
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246D70h1203235
	for <linux-snps-arc@lists.infradead.org>; Wed, 4 Mar 2026 09:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=; b=CmgN3vXaekSaNadh
	ZT7wjE5zhtUjH9dVHbJ/+23pBDJMMktK3ugLgmdPUjhKl5R7NQNX5eB8GvZihjmW
	SG8Z8+qtv68sx2172d7+3YzCi+PmbIlW7tAIEwpkwhecp3TlrV6hz2CdV23d1s6R
	og0TtdZpDSuXvxKVpODc7/TaWjzGKlj2QJxLmTT5BTKHqnZgz532HTNjzzKewK5S
	82hJ1D07JKQ290NCCjiaC0iObNREoolAm8kCj6bb9KnjDVxQK4bp0IXZGZwzcxwF
	to7XSDq6cGPz1PsdMqbCXjO+3O98PpPwE5Q6bWvEaG9UI3y6LChwykzE4InKTHca
	thwXYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c0jst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 09:03:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb403842b6so4865378885a.1
        for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 01:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614987; x=1773219787; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=;
        b=EFidHSkCjB4dV/wXRXCwv0MiTFBD5j8u4P8FfOkzliPp11p6Da8VpsVwmsRpHcDhzF
         4J+/u/4IJzGrGIc9RhUaixVGz/JoTIP8qsG1PnpiGyyuIfZA49jWLlz5hRrba3sdabVl
         bET1ktCBxZEI2vCK4OHbqzUHp4t3Cl0mHWPiQslBIRcjGr0pw6EjhtMeTahWf7EQPxSw
         KynrTsO0lB64XC2Jrnc8iy9h4dU4D6i3yL4aANG3VHbAmuUxK+SoJaVKq7xqDJnlLF7y
         Dr62W15FO/CTW2u4S1kzRmp4dsYmZGiPEzIDv2y8vvAS8bR7pxvTQj9mPtsiM+q1F/D4
         CN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614987; x=1773219787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=;
        b=YmTDQkxMiMn0DjGuP12nGfb80oBdXpEyf9wIZk8Df61h7DtH8S+qeoBtvaIfhYbCsP
         AawtjSasysuhl7PvWtaPYIC+sN+xgzRtzC11Q5hDb8MXu3tvuucsQ1d2yHgy99RlGCBH
         NCdtRU9GJQajNV3AhTaNPTYk8pV8BXGJkPM+y5q7FFyIMaZgOBGgSeYUl5DJ6BiJcYMf
         LeMr2O47NWdc2qYX31rwetICIuNtfzO+OvuF6rlcKGecQVZdxqcUeoyxWB7YQjoqQi5b
         kdGtFcQ+9eBKnLfV5Tf4UEhfmGaQxNO5F4rPKCWPOhnogSXNYEjJIJbCWPYktwOjCeFF
         tCqg==
X-Forwarded-Encrypted: i=1; AJvYcCVvW7Luyb1oEiJkrZh2urfbATCc/I0D0cxmek128a7C9U8rQFW3QkgijhheGuY0wWZ9Eyji6TzfJHngrLS37g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+IBTU2t3GXOuJuk/EvA1+lCnTJSnzpmOqqSLg98bv1JgJy4Fs
	AhRvRDLfQGZuUeDCixpzKXhR5l1DWlgOqRcVa9eeoicsMS4kfNYqZQPJgO5+5JSGKzNMBWHaIli
	0nfijzudVusS1EkBnX+gmvMKbu2cFpbsGUP+vNIduPKNI6Cfns9lL2Gf876oMLhPQjvXxiMQ4nd
	0=
X-Gm-Gg: ATEYQzyXNdHlbNWfyIhYi+LnyfwN1rvNGooK0yJrQ5+gm9oKQ7GJzwiJjOrN6NUaXQn
	oGoKmKgKtF/FWWVapDyuJ6VjMS7JM9LbQufTI5/PKrS3ote1udnP2qXOY+DdfTQKYM+a2b5oQEx
	GjOU7L4ZQHTV1cOnUhLECOVxggmvYsrRYgt5FOTLIazREq8xKErx2j0qhz7tQRxHeMDPVrmnBmk
	Sn2o6FFnqDNkajnMbGWsRbVLnAIYoh2gSXNwgMcFIz/smtg2m+hfplkCIu24Q9QbKUOzgslnGQA
	5EfSmkeutyi7eKm0cJyobhBaLfBt6lMz7npQrsdCyu1rj0PKQ2I4mTR5nlnPNjiFZ1siyBt9CWe
	IDUqaXpJkK8iZHUH4FFbNMy5HpXoAAXfe4+9Ue1Y/mGnvHWgHvqjB
X-Received: by 2002:a05:620a:1928:b0:8cb:395e:2b3b with SMTP id af79cd13be357-8cd5af13613mr171207285a.35.1772614986763;
        Wed, 04 Mar 2026 01:03:06 -0800 (PST)
X-Received: by 2002:a05:620a:1928:b0:8cb:395e:2b3b with SMTP id af79cd13be357-8cd5af13613mr171201185a.35.1772614986228;
        Wed, 04 Mar 2026 01:03:06 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:25 +0100
Subject: [PATCH 04/14] net: mdio: drop unneeded dependency on OF_GPIO
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-4-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HYhh5175MjWDCW3hz6XHSycHBy64wcX8wW09sbGX2gk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UtHU+xio9zdO/39jyV4sjCCRssE3sSle1F9
 oGNe0udP32JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1LQAKCRAFnS7L/zaE
 w9XhEACRbGUQlbl1BceBLfGv1qLoKBaiUTxgwkTWKHN/9SH7vkusJhdtf7kodxfePqY4X6DdocO
 Y8J3BLBxYwWhhbSpRUBiTN5hm0e3LQ659eYtRyYQXZc0EwxeF/SW7J0W6aoPCnbRotyVLi8AELW
 3eTait+WSivwEw4Cu2IITjlJh9a308KeWw3vyvggIuIp//7I+AsB5x6XjLXlLZQFpErC+LVUjVk
 t9PA3piMLGXAym/P4tFgSYhAus6gdj4FFhtvf54JN5RA8fX7MhNlkqmDxWxU/jwWHMFZfNQ2xsk
 McgwcMZMLc44FZWKYQxwGYA7sYj6q7jVSjuhCDqu/lO99advfd2avAlB1rUTxkxLplVzyazwH/e
 ZaFppHMLvMnWGGToCN/Pp6f2hZ97FOOfHnRfGU4TXiTVbAGIn9BYhVqaRcxFr7yaHKAi0XY5X7e
 ad94XLXh5XYEv2uKCm7cU4JI2NvD7Mh+EK3wxA184srvnT7tRET6BeGKZUX5C5S5SNV81VbKjzE
 ced5x9ixEkDibW1GixB57MKH3kDaAVs36QuGY2w6Ghpy9p6VtzEb6kTuAnPoJI7M1zKyVL6Kz/p
 xFdxte9/mEi1MhtXrNVI86b8HLFK0uaR8FjVbOWzeBGSA0J6Z3vcPbQ0AdmRGnvPBElOAJayp7t
 XmJyi+/sS06aLHA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXxPK5BW0FFdzU
 B7r4S3cbOZTxx9D7FDQvHr2DyORs4QUPL9a715XU+9qX6v3HzXIE3wFENg/cZdzplZNlQapW3Qz
 fTZAr+cUS5PDHCoHHL5L6XSoDCA80MUcQnsWZI7wdxmWmud1tooFpDRS1linJl3kzopbgSSdnog
 DZZEqEq8H5T8KrpouaBGOjU/FtMxulUuCy/UrUthiJujPr6rnHVWv0+kLdZ2dqIRx2hETAcTGV8
 o/WlfgsEA/IRdMi+BR/ExIme2O0pulibpnI/QwVhF6xBb65xjBvx4kvwooWsZfVF0EceB6Sw/cs
 e3Ik339R0y37hl4LW+4qudCcrw1kGsaU4TtvMGfZEgDrvpNZhYG0Lg1OkDATeJ+/+TD7pw5A3Qd
 vzGUo9V9Y+famzDLINpdgiQ00FrR2Ebf+k4NnurI6NWKeucb1tc99bbP2L6GgTnoF94w7KUBlgc
 s6Sa7IcWl+pWiCYkiTQ==
X-Proofpoint-GUID: wKdYe1xm9MLiC2leMMu8tJIYDZ4rCNTd
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a7f54b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=wUbH2sL_sFSbtn_y6v8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: wKdYe1xm9MLiC2leMMu8tJIYDZ4rCNTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_010308_297295_E1413E56 
X-CRM114-Status: GOOD (  15.89  )
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
 drivers/net/mdio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 44380378911b7d72e7289951fca90282d731913d..d7ca7fce7a3b86a435fac035534260146f114bc7 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -247,7 +247,7 @@ config MDIO_BUS_MUX_BCM_IPROC
 
 config MDIO_BUS_MUX_GPIO
 	tristate "GPIO controlled MDIO bus multiplexers"
-	depends on OF_GPIO && OF_MDIO
+	depends on OF_MDIO
 	select MDIO_BUS_MUX
 	help
 	  This module provides a driver for MDIO bus multiplexers that

-- 
2.47.3


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
