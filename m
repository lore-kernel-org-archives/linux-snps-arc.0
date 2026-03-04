Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BE1EB7EB5
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oVfvj8nqofReSxFFwhIU18cVrmp3S9kwv15ttZeCG8=; b=WLsrU4LFrn+BJH
	aZUpWKt9O4VbsxwoPkyjkPG2x2nnrrXMLQmktRxCVgdQrSE4GRfa4LuEymzYOnRakoQbDyopzTBao
	8Vw7aY6b/iXd9lSQJq/8jH/FS4Q48XrJe8ru9UVmQ0C7ck6tYxt3EzSlLU58Jp6gug1pt21OIGtIp
	Ik4MXiV3SISN4GGM1gVmy6e8r5XoAb2hnV3k91ySbV7EZXbTZ6EgzGIHhdF7MNgLGFiRxp8kOpTCe
	C5ZEEtzDbx73WENJHQUtUE2IFa2ApuKgsFbAaNcWrDtId3bMuSeLFqShp8hpn9g0b3s78Wf2mL+8x
	5jqd26OOS7fc8SOwKAyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8z-0000000Gp4h-2Uch;
	Wed, 04 Mar 2026 09:03:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8v-0000000GowW-0pwl
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SUHb945154
	for <linux-snps-arc@lists.infradead.org>; Wed, 4 Mar 2026 09:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=; b=QdZMEtFgACYOjWMI
	zjzVX6lMjeoh+r78CfuICfgv9KDzAQZTu6KfE+KrrT1ykTKi7e4CYCdfTNGINBoM
	QSExrDbqbBxmj3tBQiPFvxeuzRRQSDl+poZtc2GiB5rhgljz5+G24pLOrvcwewxU
	pYsqrxoXUJFClpuhe2E8leDDjPsdFRzIZJSgAfp9Ghgra0RJdTjdn9Jsnder13bR
	HbQ1qDprRZGko0coyeip/5xZo65evvgkr2rEJRBwt0V1xVKnMomV3AVasglwv1r7
	GtRyf+P4zvLDaw/qGQ04UOc/WK0I/6QmoIDXKz8etkL7/Xm9J9qSM5rH4oRpuXmh
	DZdOXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfcd10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 09:03:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71156fe09so4094899785a.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 01:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615023; x=1773219823; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=fiKbYcUpHJKplwRCpIU8uIi9AUJlKB+4ewE4jpaEy9FINuHtToX5TrvXS2/l1nGwoh
         t9pSKd4EkBqznF+BNpoDJiQtaQNJ7IfEYTwp25rFikt3KzXr8EExpCqOmABaY6hr9Y5G
         1f1iqaXKEBaS3rJNa9FlbDIrFI940bK0Gfq42Z/prEFV+7/2uFoaSzA/vlNafILflefa
         2cncbO1BS2MdHfXSkEkIjRMXbePgURYt0VtpXZ1EMHBsCDIMm4XtV6fFpHXdjgPv+hVJ
         I3j9A3uzav7mEarEsdTDsYWZEwTOgkxRJTQDsj1thcWskxViWKcT39Y6FPv36RRIhVm1
         Wgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615023; x=1773219823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=eK0KG/IJ2nA98qg3Q8PoXUYE7Nwgrv+hoWsJGmDTGPWTQvB9vh8kfxR9wn4TTwVcQV
         kbLBMHyRLIJBqAWTG1UtVUPkdOhk4KGTyHtO/4VH4owfCS5E/SjjVpDM3ofzfYEpQjiZ
         2rykuE+v1e3zBc8btugHHE8sxLU1LWs+7t1tPOiCzGkYBTVuQyaqO/iuk/vYwMnjPAC3
         9ve5V6kKYjhzCD337BvNTsP2vhIW+gq7K/JU0KZL0igdklx2YiAaV7m8/g26vkDZmOe1
         TrqLuj97oV9J461Bi9weMN++gSBThhUanISQo6cIDJ84fShQJf4KBnSO3Q7GAQWPH3XU
         IxsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCdeO+rjc7F5EXorhUTYf4jY5sWb/1jVquWWk49KHcqyhfnUnMEhTP1N44rAl/RET8InUIsqMwvurg/GfqAw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy6xypvPRG4mLI3ezJApnFquw1FCTQC2XVa0VpN57iRm/YSQnf
	dqA3UdAoBWZaWQQx6jClnYzZM0hULreJptHFSmt27TlJGi+6kUBZlc+9OP0Ofl89Gxku6I0ZgSM
	+XatdW+6epuVB0dMdFWCqV/3AcFVLjw4UvOUWN5/H16HpYz7MWzTbYD4+VW9qXHOzmCQSaPmI3U
	8=
X-Gm-Gg: ATEYQzxkZfaxEIOwKBSjvvgvce6ml+8Qaw8RATNiTpS5gGoDxI5JUkQa5J88yACfe4N
	0gCWhp/rF87XlZWdBoNqzypaPtAo7Uvy5EBH8a0EdpRkPWf9cLZavtR1OP6HVPTiS7QAMMly87B
	HHqOBUxWiVNjq5CpVwsBrTxMYAFIYS3SF1cllarjoD+dYsf20e5XTRz4lSGB0+0vqZoAoWBDyKZ
	rqIDNZUGtr5zDiN+ywQGeujSOXmfDHvAdilKzrDCIe9fA2mD/5X5TZYBB821RkmbiJLiKgbXaEB
	9IQ6IgyZTDlSuoJ20R7rEKhW0Hlp1Jz1RNkXQt23SaebNRan1MNarAa8kmSeKBNjBnsxXj9o+cy
	Nlcl5O9dK3fi45247dGLi+9/cg0dVsuKxG2Ahdpt83uLaLyWaLtyP
X-Received: by 2002:a05:620a:1920:b0:8cb:72b2:2a05 with SMTP id af79cd13be357-8cd5aec6d38mr153997385a.2.1772615023239;
        Wed, 04 Mar 2026 01:03:43 -0800 (PST)
X-Received: by 2002:a05:620a:1920:b0:8cb:72b2:2a05 with SMTP id af79cd13be357-8cd5aec6d38mr153993585a.2.1772615022782;
        Wed, 04 Mar 2026 01:03:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:34 +0100
Subject: [PATCH 13/14] power: reset: drop unneeded dependencies on OF_GPIO
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-13-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N/KccnxICgrK3rI/2fd0AqdTwq45Oh63UAkAjH8PkgY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U1CAGsVjzpABaYhlFKngSKy+KmCDgU4eXzu
 q57RqMlO2iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NQAKCRAFnS7L/zaE
 w3DqD/9PZaqFjzHPxlhtWo0GqKJVg102IgVfZj/tA1PX7Uxh4/ynWD06yEWrPqhz1HEI9+x2S13
 yT8h28khnaaDI7C4bitx1j6T6cBtXKG5ufSmOkJr7wT1tYcNZd/3B3la5kezelJHlO4WaYK2N6S
 7tgOp3PI+fHBk6JB3126BC2M2XslfGsNRD5RVx++QUGo2DzuXzmWeTr6TgOh0epi9Tq927CSyVo
 JhBLXzNP1AYZKgvUllA84Q2jiw1dqzcC+GXtZtEkFNtYaMJ+N7dcg+kCtF+lk1u4LhMyL5kosoE
 TIXVNq8/9DX5lElAy6BopXJ1esiI4bGjbih1MVq8q+b8OF3DjymUIjNn4q0Ycouumh/Sd24yOqC
 spOSRP4SpSQtdcEhskbiHKywGf6nSVFFAdQcTy0T9Ptf0tuBZSQqh74Myp3webWzBqORNxSdsMa
 a+XpmTJFYPLXAkrQ5UcoRhH2RJbwlcgxuHWQkuG+L3abK3YeuiNH1Wrv1zw4gUPM6/deV9ktxKG
 ju1I9zXk9Rt4mziW0BQZvu6PB5hSJYPW0c1cnhIkG92TA/65fHEvvVcxqAiYNrb87i+QKO2c7Ke
 jbLnEh8hA0NpgmS98XZAw6b1RSS/T/rS7ehewAVW243xTprAfg7qz8uO5ohQq9Lb+3RaXVhAzkq
 TicUPD4/aipoB2Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX/wVYxqjiX5zT
 P24BeIQ5ab1fokVMbCcFfNNUH6us/ep0M39+vfIhYl1Mb3NcpeivJyb/BCLhcajgi73lPFvAXje
 e29hfaWGuJe+7Zy4K+GI5kTEb7Cs1Zc6nT8ILx6GjHF+oEE6wWAShX8bTpFjzpmnXkSEaTpzEfN
 0lLI3Yw4rShdytcEnQF8Ehv0yOcPb8pFoNMAGVgAD5cgXiJK2dQcx8ntHVggAeiE5+YhUcoLJpg
 EjeCZu+yBqemlVNxVU53ewdDHSq4RVbGcnfXtBecrv2A8iAGlbPiaCkO1x+WadJMT2Tto5a+bec
 fQzZh5/sK4LveqsBEEOSZVXWCZgRV/PA5QmgR91dFKsX8rq8uk6TZsk8KYZEzWKrQOaf+j/f65t
 SRzSSy/nZ4hH7/0pfsZXa/O9Oy786cj2dPT6JF2YZAxuTCbok4pBa8X5eFA7+QOMDdzYgXe/WzJ
 ta22pr18hoimT5sBpBQ==
X-Proofpoint-ORIG-GUID: oQLqo6C3-4zIQRO-Vfp_egyvtXVvyKBc
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7f56f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=esZZGTiVAK7d0sqnEIwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: oQLqo6C3-4zIQRO-Vfp_egyvtXVvyKBc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_010345_473550_E2BE0085 
X-CRM114-Status: GOOD (  16.75  )
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
explicitly. For Kconfig entries that have no other dependencies: convert
it to requiring OF to avoid new symbols popping up for everyone in make
config, for others just drop it altogether.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/power/reset/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index f6c1bcbb57deff3568d6b1b326454add3b3bbf06..8af398b4e6f7fc5f2ecd92f11d03c43cdefe1ab6 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -97,7 +97,7 @@ config POWER_RESET_GEMINI_POWEROFF
 
 config POWER_RESET_GPIO
 	bool "GPIO power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports turning off your board via a GPIO line.
 	  If your board needs a GPIO high/low to power down, say Y and
@@ -105,7 +105,7 @@ config POWER_RESET_GPIO
 
 config POWER_RESET_GPIO_RESTART
 	bool "GPIO restart driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports restarting your board via a GPIO line.
 	  If your board needs a GPIO high/low to restart, say Y and
@@ -181,7 +181,7 @@ config POWER_RESET_PIIX4_POWEROFF
 
 config POWER_RESET_LTC2952
 	bool "LTC2952 PowerPath power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports an external powerdown trigger and board power
 	  down via the LTC2952. Bindings are made in the device tree.
@@ -198,7 +198,7 @@ config POWER_RESET_MT6323
 
 config POWER_RESET_QNAP
 	bool "QNAP power-off driver"
-	depends on OF_GPIO && PLAT_ORION
+	depends on PLAT_ORION
 	help
 	  This driver supports turning off QNAP NAS devices by sending
 	  commands to the microcontroller which controls the main power.

-- 
2.47.3


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
