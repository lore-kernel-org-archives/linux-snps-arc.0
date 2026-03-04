Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A1AEB7EB4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CeHgFLedQ0w2jlB1EhBZrXkWuuSNSsDMtzczKlmaGiA=; b=15vrP/+xc5Gngn
	fyGa5sc6wbKEh+epQU9n1hZOVtFYnLdKKnOVpZjyvbw5lrMjbrf8q1VZYq4h4U9cUaZEAyw1hcas6
	abyjftWMrUFCnpPaLHsN3ozOA2nYjbMCHxr/aJYwFn/HA9TBVdYx2GZScxUe9y/uiVpomRF9T9A6G
	G+4fGPutWUXmRqBWS6/GMhkhoyekmXXW7u3lXcVz0i0Ws32SoOo2MFsTgiOKYTRGgnQWxUGUmAydT
	JsPrJpUnLcfulp1noHa+TSvp6Ij2jHTXRZHPE7sublgKHl6kC+evBVfDqNgFSLGdvonTodZCFhlFS
	L6ikx0S1/m75yfKQ39IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8z-0000000Gp3v-0YbH;
	Wed, 04 Mar 2026 09:03:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8w-0000000Goxd-0eh3
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 04 Mar 2026 09:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=; b=Td+rSg93flEVcB91RvyoHRKscK
	F3EHl2fc/YrmFyS6kdZDSsHdAJkN+ogSlnDXi3pQPrvB5nD1QBrBCpVf8VP5XA6REwP8ouBiEcVtA
	SGYeJ0lkcQzH/D3YIMPhvHEveXxIFu2ZQD+RfOVm7ayPYSOH1EApjGqbscxaNCE0IL7p0kDL9urMz
	hylAoFgbQ83Uymhim3VyB8cKUOfPeumI3VzXAswRaLvgGHrlrPTHbiGUOe6+QTYyCG37Hu62dFm7E
	Z3qMPI6foCFDnEKah4hgzAwmv+fpCmmILaFeqQKRrbp8Y+KdVfULEHb3Fw0jdM/w7k9iM5x/iEpAy
	F1saDxCg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8s-0000000D17v-1TqH
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:44 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SiHB945468
	for <linux-snps-arc@lists.infradead.org>; Wed, 4 Mar 2026 09:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=; b=HUvkTtYIGHCF46cT
	vzFc6J6pDnXt8HmS67vhxuF7vL53WUanXgs0NbH+VI5EVRDnySVd8Y7UZWIL+2+X
	6esk1LCKZeg8BlKjca74TYxulLvKMKzwRHuf0pTLbqexTMJQjJb2tyrkS3HJkYa1
	OZagmawkFeI4w93zRbxy0aCpFx+H0vJhb+sqvrcP3K/oymnAd1Ce/IZ9qU+XxKgC
	0HknP2Oz/5e6O9DS9aizV3ROR4E1dvMIN2m/MqCqdGgBqiDPHCRy0j72cYIlQvkc
	NWZF3vdPFc2nAHBFbiJV/d6bP48ch+3E/q8AkJYdRYjJzqWtXUd5yQcEKq6u7sVU
	yGBMZA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfcd0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 09:03:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c882774f0dso4198074285a.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 01:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615020; x=1773219820; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=;
        b=Z73JdDKE4nj0P6KJfMPiMXVrQjMDc5Xx33fdYYT1gekps0rGfFhAOZtEOHFEKUEaVG
         bDiOLhoTjEisDDEvA0cjblB29ewx/fsHWXy8gAMNfp90bXwsIgBzw6zTggcNxsGhdnPX
         VqIG4gXcD13joDJQBF0m7a5s1ZDsqzjZeKncUj5bBp4ibmppEsNgP7n/rKXXrfKthCpE
         bm9C1Zld/n+n29OaPjm9CT3ZTM6DuirYZy0MdhxYY2In+ZmbihvMlAlucPYoXxiXpSKS
         GOOB2Kq4o3D0afV0Jhu32thg2VDU/sBtwd+Yj1/KtObMFMFnbiD+U1Y2RMlwtD08v+Sv
         boTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615020; x=1773219820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=;
        b=NnU/vHaKzRPx/dBLfUeqhTXSPKjD2Z45OVTxW1FDLWLAHf71QEAX33RpPs9WtaDLu9
         uHZkCEbFLIayBXeiyYefZRht5MCDJRbmIYaFV9IhjU+Rh5/tCWpfEb76q8z0cPVcTVza
         ZByQGDjmd2MsI0pK73FVVqoJpQL6bXQJ9PZfCkqzAwvukP1hTYOwMvgXtTDDYXxSLP5o
         49j5rwJv/5IuBHhtjsXUmm9nmoCDC5br9mLsAtonaWytR2pYBxQmyf07OM68i9Qg5Akl
         4DYD9suHv5kkV2qxV6Ib0qJGOBqY5qT3hzv2L/rARNvzf+AMK6QrII3jc2bMK48CTzgE
         Dn6w==
X-Forwarded-Encrypted: i=1; AJvYcCUofLviRzw2HPgqbvBI286vljV6zKmVplF5lQwiBCUFqx5zR2uf9zdh4F4vUnOCsTO0uc/cngNg8Rpp8i7hIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yynv4Ym/oUGY/qHeyjmGtuR1Em3JKLJN/2impXyeyWmNk8Hd8mL
	yWZPO+Di0x9XTbwpTDYsjw2M96BfmEW3NFqocA08rbQs0yYgCWgkQsBGgwm687dOHUkMA9eAC+O
	I03LUR8r2uZPZGMlmGpRpVKWmdqerzEyT3oFJeh+SAHfCKTLC9IeCdDPnYUfC45wosOaB1QJGtU
	4qVKXFy4M=
X-Gm-Gg: ATEYQzzdp0fPQv74zGNX0BFdIu0dZKUD37e1Moo3MCdzi08z9QNEGxO+IwB700n8b4N
	leuBbxZAVMstbJKcr8Yxu8uxw0g6wKzzsIexyt3CTYiVGBa/mmnfD4OPYXhIpE5TWCnU/Ep6YKs
	qxIw2CErazAdsgT+LoCdMYAHyANZhK58DB2MaBcrCM4TXQuX3SdHuaAmAUOdxswkNdqjZOgI5Zb
	jydBH9CgsIaM72AdzVJuyNulC1KBKzjAz/k9hxUtF/5TXE9eIPX4ye/ozfida+s7YkpGGH2IOLo
	7B+8EKRtIiodg6bGX1ysAtC9URl4ftoxh92HXly8nrJV7Ke8WUg58QRgsY+bCQoF5bjWGE76Ak0
	gKP1DmCB8a3EMSqFhTfhmcYHT1dySPMo3K9gq5pJXgaRboU+krOGQ
X-Received: by 2002:a05:620a:3949:b0:8ca:3854:8110 with SMTP id af79cd13be357-8cd5afc0c38mr159219985a.72.1772615019777;
        Wed, 04 Mar 2026 01:03:39 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8ca:3854:8110 with SMTP id af79cd13be357-8cd5afc0c38mr159216885a.72.1772615019300;
        Wed, 04 Mar 2026 01:03:39 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:33 +0100
Subject: [PATCH 12/14] staging: media: max96712: drop unneeded dependency
 on OF_GPIO
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-12-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F9ytT2vvzgyeiU8WNksbCaFX6Hz61vWU6GkVZMPweL4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U0YPpmr6EkC/Xcj5u6S5E3hZ52MCZJ0xQCq
 e6KcvDJUhqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NAAKCRAFnS7L/zaE
 w6ghEACtFFABHdrYTiZk0+F+HrOgj/2q9yn3zJKW2IUhc5ip11gsNxaZvRGYVoD1y9TrvFt77ji
 PFlWiBoM2qd2vxnADhudDyeyhkhNYjJeDPoyAS5BMkPEjo34LXOvRTt2jdNLcS0Yggitruyx3rl
 tEMtfMKolvomXC1gG17ZNj7PMDSOq+VsU9spkQ5TnrTJBHuLzzCCb20Glo7TFGAKZmQ9F/s0b19
 CUq+HEdABlAp8r2rt5877/AjCvFT2Y5YZvCPq8kKs3IF/vYAOnCW5j2f5VAzI9q7Ryf3HLlcbK5
 UJCVo6O1bKbH/P8T/DiGfR6yISzdNn12TXv6iYwwd0f8GUzMVVWU4l/VSepOfpcMY0K3ztQqHyH
 OJbQaN9cutXu/UrO0GsSwbu1XiTOcjKwXvZUgFMQyIs9mLHmwogfAqtgtlcKK0dfWKBTFtMk0R5
 Ya4MZuCMDiHuGEpWbZafXSaoIsowZpMZLWWMyck9cGXExUWFEtZza+r21drHqGw0M2nsB+Rdfuu
 JCtHW3W8cUNbtFfx/qtGTP4U1lvK2greeMzLTCgxtApLXz2h0CYhpOv1ETFzQr5gf0Ef9O6klZ1
 ifje4A7FNyS1+Sgh1NX897ZJ1aNIEh1ABIBtSAc4rvOd/HV+rMhsfL+4AhwtauXWv2W4fdZB9GW
 TlHYCNXye0s/o2w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX9w+zYXO5/ms8
 Tg+TEc2AGbh+AoeVlA20i+VcCHWHAvTBPMGSMitJi32+wYrhFowfX/WBp9sVxOtwmu2uBP0CWJp
 KqComH6jahLmKYO9qS+cYmnaBrB88VzFZUpZdpNIJ2LghVJAjNHmy4N5Yi8BQSNCSWiQrDku1Hc
 CXRfU1qaVcKFK8xAggrkD6tVOZI1mHw54FcBTGGPh6YvpCgr7xBPUKG0ZWeCigthdZJMd/xT3Y4
 dIYERl6se17uCIW7jbmZtvKO9ul3+H2nvrY6ziJUHi4UzKn9R+7bHPfKTBeWlJS9PSA60UfzDQl
 FrQkek18VwL15gUydS0qdkex1XlL9wmkCW3S+3+KB6wf4q98m0PzoyCQ/CZbgltNUWUiW3xWVw2
 VwAgBTMQe0POfhIowKMAhfFUCulGLcSJZXO2G7oiXBdHhLeaOdxzlEzd6chz4WAw8ZhDVCKqiWt
 oHTHTMEfXrvGAg5+xmg==
X-Proofpoint-ORIG-GUID: 1etyKI6qei3ga7c9_mbjfNEIqGiOuF0W
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7f56c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=lbdJfbWXG8Zdtkr9XfcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 1etyKI6qei3ga7c9_mbjfNEIqGiOuF0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090342_634392_037FBD52 
X-CRM114-Status: GOOD (  14.80  )
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
 drivers/staging/media/max96712/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
index 117fadf81bd086cc3e5e95210503000d9e4d8738..93a2d583e90ddb2b797c5167a6d3373836e88126 100644
--- a/drivers/staging/media/max96712/Kconfig
+++ b/drivers/staging/media/max96712/Kconfig
@@ -2,7 +2,6 @@
 config VIDEO_MAX96712
 	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
 	depends on I2C
-	depends on OF_GPIO
 	depends on VIDEO_DEV
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API

-- 
2.47.3


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
