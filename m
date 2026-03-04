Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD94EB7EB3
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2026 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kC401SaW6ArmikO3+tH822F5DCSy+sVUGG2nIy4vA0g=; b=FRpThmezpjRO8Z
	xaNndE/UwGW/Z2ASZfZl/QMnvkH1q90hPhZIiv0+awEK96l9Zt7jKlNFcHbCZeEjPdGuOAEYbbLd3
	XJYZfIyApXciYnMjxL83zNLLtU/8wYkgEOyMO/gjzq1riMqm7b27AyvjNstNIPceJvC2gAgqcfSNg
	A+1rbjFD088E/FlNdt/uOCtk3Rl/frzHKCM8F4wZ77lB5CuHqvKkvkoTfCzU2lQv7vERLJZoAuoIf
	2eJJNAKULjQrKO/Wprvz0ah700YJgZIWYvTc+v8+qth0jy2t87j83qng5kg2qxsIZGkzwvVNhw4Tc
	NQrBD0uSMoB3IL7lq2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi88-0000000Gnvk-177L;
	Wed, 04 Mar 2026 09:02:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi85-0000000Gnub-04gw
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Mar 2026 09:02:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SXxe1072475
	for <linux-snps-arc@lists.infradead.org>; Wed, 4 Mar 2026 09:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oemXeHFiAD8fwC6Dvlocm0
	aqSqueWx/Mi2JGUCBaDkQ=; b=P11c3pKEW59ZBshwgxJxorRIb/Cvzay+2NGICC
	TUIUByAaAlcJ4kZ2u+UQRh4xlir4oUZ+Q4bGcQlsbPpUNxvswgzYkQGeGnf14P6Z
	cQyRSBvUq28fC5gx6GVvkfsI0fZSqw/uzBYgsGj4SDJoTSWaerzUDMO3bOVZa+GO
	WHl188CFGvZ1icutpN8PmB1fhnMHjGSISUiSpwMVEYdAcjiiBfAlQiuod4toeHcj
	O0r8mK1uDg9SCCe2nZPDDCy7UP7vKNiEqXPDGeazBlvFXHErYyAGTVHX6OMBYVqK
	snkDYFGNPNyWf9q16AhJCZHo6WGOQbvwCO3SUEWD6ILYkaaw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpcxfh0gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 09:02:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71655aa11so6150286085a.3
        for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 01:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614971; x=1773219771; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oemXeHFiAD8fwC6Dvlocm0aqSqueWx/Mi2JGUCBaDkQ=;
        b=UkMrHotm+FwR6VEnQMIoPYqQnzcrwgB6qdXBUu4rDDtjJ+bc4gLHoLaAqFxUtdW/lN
         8/EF48ps8F+YZ2YaWVpb9srAUTolv4NowlyLrrQJAICbZSKQtIGZx6b2FaWIXgzgZaAY
         a2jBpGK8Rpprso7cdh3/stbyIz8bHYLI7ckj6NG1oOcf0QWy+WxJvoGZ8GZ4LwtBHq3c
         GKYXGCj2IIMFUO/MdT7/JzFnFHIIH0SksmZLd2kd3yXO3LnKfGxJ0IPZV0gVE7SGYyiy
         YOO0a4d563CYbDyQAbKmqLQ2BBkRvEpSHcsb4/GQNzA+QezXPjYABOcXXEnoztlDLRDY
         f8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614971; x=1773219771;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oemXeHFiAD8fwC6Dvlocm0aqSqueWx/Mi2JGUCBaDkQ=;
        b=OTG6LJoKI4G6t2dKR4orCRUYUf9Ukz1a18AoUE2lrFgIipw/0ZRQfxwruSpirYCM9e
         UBYGwkZUTHIkuoEcFmNup8Ns7Vl6XjBTgsHYMtGYmRfqJ2WpFwLW434Sexa7lTjasSXx
         MJqA2B94HKvMQop4Dyg50VBDdSkdXDdF+MsYi633vBfEvdX1l68ScuQ0FGm+ifcLYwqP
         eXt8QDqGSNZVmnt829g433hlWTdtEOANYQa6Z+duagxze/oNQdyM92UZsWAPsNokm2nb
         9nUeuVTEMnp2kcpBP2ID7CV9T7+Lj/GJI8zsTgWAFeQwbctmP2CFsVbylZ69CmtDK1pc
         ae7g==
X-Forwarded-Encrypted: i=1; AJvYcCXIz0XWvcVeukM6yQMcXlNWqGFgHaFDq4HE2uV9dq5QuLKpgNePyeP+fcdEpuZIwr2NB1B2KBm1HUmGop7dNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbhKV3OCjBFaKG3gsGvIbvGTT+yrMJLwtNP8Mo6A5zTzf4lFG0
	EAIsqDa7AWwD7sef8kR439BJ+3Z5ucyCsFXytwAP/inh2oR0F3E8CRpEyyCYeeRhot38ooin9aU
	F0F0tlia1PANa6f3UIB251xUUhodrXDw50lcxIADs45DDeTJSCpHAY4FyMOSAKOVAIZg2qz/1mS
	c=
X-Gm-Gg: ATEYQzxwUaysY9kqS8txK+Ig9QREl1KGLygyt2Q5gEySgcGi0SUiuAHf1EFbAYEr0oB
	hC7E0sAe2iavRvF//BLM9CJFHT0gqDOVUTI1aWxj6EU2mnBKGeY+p7+eOniEraSH8uOhjwNXVKB
	jy07BMfNcoHx2P030rdb/dbyjdQYgJWNQoGceVUr26E74+LMMJ/HFSUiZavPmcnNI61owL8riXy
	5n33ij2vpRXgrucNocf9b05qkbjdmlUlbT4oaRNng6g2KLKy8OuQAAVmpBUo+sBzP8mzGOoNT+5
	zBYJKonQsEIz5XiAJE9PuLMY78Rofd4077cShHtFQ7aye7hdP8XB9cgpHiTnpDh7AxqZsaqXX5o
	C8qB4V56KYxkyG/1lxtxAqFugmsREiTAY8ZL0GXAAkuKWv8tFLGcd
X-Received: by 2002:a05:620a:258d:b0:8b0:f2bd:4762 with SMTP id af79cd13be357-8cd5afd3c5fmr156643285a.75.1772614971133;
        Wed, 04 Mar 2026 01:02:51 -0800 (PST)
X-Received: by 2002:a05:620a:258d:b0:8b0:f2bd:4762 with SMTP id af79cd13be357-8cd5afd3c5fmr156638885a.75.1772614970677;
        Wed, 04 Mar 2026 01:02:50 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:02:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 00/14] gpio: remove uneeded Kconfig dependencies on OF_GPIO
Date: Wed, 04 Mar 2026 10:02:21 +0100
Message-Id: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB31p2kC/x3MTQqAIBBA4avErBsw+6OuEi3ERhsCJxQiEO+et
 PwW72VIFJkSrE2GSA8nllDRtQ3Y0wRPyEc1aKUn1asB/c2C4vCyEhx7JD3OZGa7GLVAre5Ijt/
 /uO2lfCyoFdRhAAAA
X-Change-ID: 20260304-gpio-of-kconfig-e257ea7c9a09
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vzKg2CmRZRz9tDx8jerfN1FNHIadNDJlHWQvRijQXa4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UlV7KEbnku5SM6ln9ww7x/7ZvkbRgT9akwX
 ZTKY7PzrYiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1JQAKCRAFnS7L/zaE
 w5VxD/sFAI2igPWylEwWYYIK15BDRKiW+6YYGAfBqLpYl9ZCdmVgeZD06r7JMW6noA5hFzEkv66
 pvwjnkkl7u3DFOw8V3GJsnoNOOowaj6Scqektj5r5FiQwuHc5I8abfSLEsV+V4cO0v7ZKq29NWM
 Slk6AkPOz4Dk9WvQW94bOEYC8bLWudd5dgScZ5sDtsXB2ZVkOU4Un4t2pkX+8AD230La5Ao4gHq
 2nfPT5kU2Ogk9EZLOE66LyX5r1zO/Vj5OAtjgB62Cm3oV01ZLErMP+entT0fo8yY5ScmRMaFpUo
 3lszEgJlDfA1/ZDe7YGcx1Iqfxnt3/YFva8swh9EU9K0fTllltoiemPhEcDsQa5L+CR683lH/5a
 FVYvSL0skiru5EDCrTdHr9OUO3u/OD/twdunXvFtT4F/LzO3iDxvE4CEGqlnI+tyOOv2IzMGGGv
 vbQtrKM8lRKn0N/IC77/tT7IX4aqycoE1lunxb24p/sgoxdJc7e5jEgkPRPmXIOB76VxKbGc0+n
 1F3iiZCY9qL3lsySV+j+61W3cjjIYoI/L5iDJbnwnolQDGAK7PEXv6yL4e4j8aGyXOwDd8Gq1aO
 avM0vTJekP9BWzuxJMN/Y9MbMnlPvTbKHGY0BPgrchdO2JNNJztzOUyRDL4+1lGfij7PFp3V2kf
 qVTMwUWNMgBvbzQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 5_T-cTViVnSoE3eznXI8tPQx4wBiDr39
X-Authority-Analysis: v=2.4 cv=R4gO2NRX c=1 sm=1 tr=0 ts=69a7f53c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=RbMT-lXscSRh0E1VkaUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXxy/3tXJmT7KW
 wmJzTmLPAnlkXO77Tq769HhEg3uiESDnkhd06k3ERl88Y4xHZfcW1E3rKp1fT4cFnFF4tM0W9Ln
 gUf3MmSepdbOENaSwWTq5ZnVQOylOKszIZGB+PnUcDr4HIVY5w7znW3b8pzRdizFsp8m1lrrcgl
 wozEtG6cZvu/s2oZs4jFyMc5so6rs1cI3kNzfV4Rpwt3baoa1JIBe6l/+TtMNhDTfYXC9Q1SyXe
 Epj6tgXJj4L6kFI2w8c7LIRmRmAlAVl3b6HTcqyPCnasEJ15usl+nZsawFS2bfj6PASD3OIXI3g
 9waKRNd/az4SB3NWcJhZNMGg1f2GIoGaAgscrzBFH8q5elZRH99vDmSivnl/M4Ua9N7hJKBEgjS
 XKU2/atjGDGtn7a8F0MIWy6OKTaV011Ew8uDSFVZJHe26YnHeOMaYvTMuLWRH8bOZidx17r4epw
 7zZ5YfDm1wLy7jfEfUQ==
X-Proofpoint-GUID: 5_T-cTViVnSoE3eznXI8tPQx4wBiDr39
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_010253_055361_A3ADA073 
X-CRM114-Status: GOOD (  15.96  )
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

NOTE: Each patch in this series can be picked up independently into
maintainer trees.

CONFIG_OF_GPIO is a switch that enables the compilation of the gpiolib-of
module. The module itself handles GPIO lookup via the OF-node tree and
is automatically enabled on all OF systems. It does not export any
public symbols to drivers. There is no reason for them to select or
depend on it in Kconfig.

This series removes any such dependencies from Kconfig. If a given entry
has no other dependencies than OF_GPIO - they are converted to OF to
avoid new symbols popping up for everyone in make config.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (14):
      arm64: Kconfig: drop unneeded dependency on OF_GPIO
      arc: axs10x: drop unneeded dependency on OF_GPIO
      powerpc: drop unneeded dependency on OF_GPIO
      net: mdio: drop unneeded dependency on OF_GPIO
      regulator: drop unneeded dependencies on OF_GPIO
      gpio: drop unneeded Kconfig dependencies on OF_GPIO
      pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO
      leds: Kconfig: drop unneeded dependency on OF_GPIO
      hwmon: drop unneeded dependency on OF_GPIO
      watchdog: convert the Kconfig dependency on OF_GPIO to OF
      bus: drop unneeded dependency on OF_GPIO
      staging: media: max96712: drop unneeded dependency on OF_GPIO
      power: reset: drop unneeded dependencies on OF_GPIO
      media: i2c: drop unneeded dependencies on OF_GPIO

 arch/arc/plat-axs10x/Kconfig           |  1 -
 arch/arm64/Kconfig.platforms           |  1 -
 arch/powerpc/platforms/85xx/Kconfig    |  1 -
 drivers/bus/Kconfig                    |  2 +-
 drivers/gpio/Kconfig                   | 53 +++++++++++-----------------------
 drivers/hwmon/Kconfig                  |  1 -
 drivers/leds/Kconfig                   |  1 -
 drivers/media/i2c/Kconfig              | 12 ++++----
 drivers/net/mdio/Kconfig               |  2 +-
 drivers/pinctrl/Kconfig                |  9 ------
 drivers/pinctrl/bcm/Kconfig            |  4 +--
 drivers/pinctrl/meson/Kconfig          |  1 -
 drivers/pinctrl/starfive/Kconfig       |  2 --
 drivers/pinctrl/sunplus/Kconfig        |  1 -
 drivers/power/reset/Kconfig            |  8 ++---
 drivers/regulator/Kconfig              |  2 --
 drivers/staging/media/max96712/Kconfig |  1 -
 drivers/watchdog/Kconfig               |  2 +-
 18 files changed, 31 insertions(+), 73 deletions(-)
---
base-commit: c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
change-id: 20260304-gpio-of-kconfig-e257ea7c9a09

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
