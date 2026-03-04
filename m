Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648C9EB7EB4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8BHEkpfrHycUyLM8Kg2GrBJ48Xcz1y3PTWI0qX4d4n0=; b=tiZdPkWMaFHM3E
	wHDQ1GkMGmDXz+qmlg3P2cf1qtCcn/sBZ3izAV0vyU5uAimnwdMxowqstdco/iSVEAp90y9DO4Uhl
	r8evyx0DJKTnzinVZiGEE1Cc/uiOeatMQkksp2tazxr4lGRSfEScBQHv8XeeqnO7CfwqTp+130uLl
	5cJHdArBVGZijfp0zTDEKutUalMXWPLYuZjBchnBe9v5Xk3vwaey2D79hvEbQBiCLfn4omfkooxvo
	h6acd5yPeV4X6r3Xsv9M+zUXeqwRNRpcqyViZ0kcGA5NsQDdMrzHCLNYiK1W3D+oaVzfGiPv5PSO7
	nGvStOSF6in4Tggwd6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8f-0000000GoZF-44VS;
	Wed, 04 Mar 2026 09:03:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8e-0000000GoVW-02oy
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 04 Mar 2026 09:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=WLabK281ljaRm4Q5k6ndGIQLgmuJ6H/0UUBtzqck2mc=; b=cbnrNKbH79zNjX+JeK4SwotBtd
	CutfPCgB9I+fJZFY7vREdilS8F7MJelin5nUmrrLMZVoIXQZ1tJ7wCu+Fm6dxS8+sfZrupQpGod2o
	v5cW2gOf7oN8odz0Z1XH9qwtn+Y7Q8SoOq+jYs+gspZ6y9O2zUupRQyh45emab02cZJwXKRiJTn22
	DEybGuLnODCZE5vJs9HwMyHRzRwuHrpHLCc0fq6ojYzSAKnvY7chFINXlC48DOAnans11eBf18nu8
	PCFIws9lmvxmmVP+PViquGWi6Hc1YxEugder9tSvv0Va+BsdOpi8u4gq2q4aOiqLC8KwQAZcxnm17
	xxuVAs0A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8Z-0000000D10C-0npQ
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246D70j1203235
	for <linux-snps-arc@lists.infradead.org>; Wed, 4 Mar 2026 09:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLabK281ljaRm4Q5k6ndGIQLgmuJ6H/0UUBtzqck2mc=; b=WXlKzKttibLWM6lY
	USy99v7KTATS7VKSoUVVsokh/NLxR/Vtw7+fgvlq6IvC7nR4qN2bdu1yNOfsogF4
	Y+FC+n+OHC6ukxVkLDk1BCTbc9FLqCT2gQdaXUB7/p/6ONCdxqXUzWnlI9J+qk7o
	MQkacFzcPx3Nwp7ElGN+kvyruwaNCT89hZFpiaSMxG4+Qkf+S543tynxMrxMuGkI
	Tt3W/jGDSXVGe+/d9Dw6BjxYjtUwLQ8ZkGyfZP5MVGxmz8PbCNKm5KC5b5zPQhe+
	cD8U7cjo3vyXtkyRSYeZ38X3hRSGuebJ0FDseBxnTMLAfjBVXb44o/UIPQxm2F/H
	+mA3Mw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c0jtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 09:03:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70d16d5a9so3929960985a.3
        for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 01:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614996; x=1773219796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLabK281ljaRm4Q5k6ndGIQLgmuJ6H/0UUBtzqck2mc=;
        b=XNZuCurrdqID2CN3V6/WEuvHGC1TdDpNkfG2aojx5jdUOuiQcae1/WH5s5zYOD6mYf
         0Ell324XjYJ1K1QnacJHZLynLnVEr75ZQixrbiyGUlnNSY6BpkFrL/ja6VaZOUczF5oq
         v2SZ5MRCOI4VsMNmdNIcxKmyX0w9mWahaLh2bSZpxOSTwHuNqK+JHgfs545H3Z7Spu2M
         Bi/G9iicBjQse1VvnPPAj8tODpkym3ynbwIGNxs5gEzSNL3jcN/abv9U/AkQHafABInI
         GmgvvIYSxmVG1GiNFVPz1iaCxTNTE9wznLemvdrpnc4gOox3RqL2/vzkRhoVdfi8s/Hf
         76Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614996; x=1773219796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WLabK281ljaRm4Q5k6ndGIQLgmuJ6H/0UUBtzqck2mc=;
        b=Gyot6UChxLPLW+TK7l9Yc4/dyVUT3c2j8mX8L51Q2wyc6mR2mHANpKAw7xCCaXzSOD
         NsgBMOgfyHoxxDZqWIAvj/9TJh5RwLo8Ont91CgUUrWsjMyybO5uIy3uf0hJJODh9IrK
         htguCzF1SOJVwxOAr1FHvgx4/tBGyT4RyZn80mSONhVs0/BH+Try3pjU8UQhJB/HTuWg
         QzQWf1Ws3Ngwz65Lw36r0/OF7JRx2kLh+w8XW0Vu4z9LpOrO7SYgeehhXDEnpZNS9j70
         Fx/6Q+ylq4zMYRLNj3SML4Q6H7299URsYESq/x7QG7nkR2crzvkRffDnHZCpgA8WNu6t
         w+yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBNa7AQgRV/yorouQf4heD2cc4mvyYA+hOBg2HfkByRvW0xP8t+saVu0R/sGB3Xot/U+ieVjBxmXsCJkdyIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTEctZ4ESUh7AJupzKrFQHdE2nPc8cUoEvQH5dGjxoFpEfv48B
	LLM5aXnY745ppioGY9XcnEcGOx1IOQ27RZUrqZSB5VKOn8MfVO4ldCVJ5ZngHIkGggs+AYkct6N
	w5yb/iFZcSqbJbQM3antVgXOi7P5QyC+CvKgvm57Wo0FKX5JAvbJq3tbm4bmNt/H/NuszqK0kp+
	8=
X-Gm-Gg: ATEYQzyL9RQRlk5xW0gDla3tzj0M7KNsf95TLi2kA2Q3p7AO6nQ6j/rtb3lUDfCXtF/
	UmQmlrGs4OJk431jllkB2948/YiR7zEqclmDtvv30ZXgSUyIlS/paJcsvQtD+pRs50Sl86x1SEC
	glRh3n5D6vuAoLUnDzwwQGd5ykixkVTR003Ae+a6tJx+SH9EBV0QcmhHrn4i6NmQvEqwpGPlBYR
	rekuJQH62+/WPw9TLT2UrfzivNNrdlyNV5aCkfBL8zs6NAGSNYYRl5XOEF8Ul6AxqvqE89GBAdR
	Xk9/IVa7v0af/Msbc8+/hwyFOmMZi7y99Ktj7DwBvIpRtH3KfHcps4MLpvtRDWQJ5WzbkJy7Ozo
	qbEPDbN9d1FVNxmY0S+DFmZtyIoE32TEBAn+RqNUSGLqn5l3FAU1n
X-Received: by 2002:a05:620a:2681:b0:8c5:2ce6:dc2 with SMTP id af79cd13be357-8cd5aec6a25mr161916785a.17.1772614995753;
        Wed, 04 Mar 2026 01:03:15 -0800 (PST)
X-Received: by 2002:a05:620a:2681:b0:8c5:2ce6:dc2 with SMTP id af79cd13be357-8cd5aec6a25mr161910785a.17.1772614995108;
        Wed, 04 Mar 2026 01:03:15 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:27 +0100
Subject: [PATCH 06/14] gpio: drop unneeded Kconfig dependencies on OF_GPIO
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-6-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10217;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4fbp6KU0HzzSL9Nt1PKq3lQF7ufXuCLrwnMnj5C0HYw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UvwNV5i9DxT7xjaoFV2uDvE1EtMAw8HvDnM
 8NpI2C4iUaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1LwAKCRAFnS7L/zaE
 w8AUD/9BUoN96u9/mKm/uAVbSL9A8gdaZT8sxstCTm+Wb3kNPQjGD8iuR7iWT6TbKfmohsn9mhv
 ZNcnoB5aDrTz/qsDmdz58d25eJFcJaBRF3Mod6qXIAFavIrtFd9kyuuEz4jlB5guPGWURaaL7S7
 O7qh1Nsy5lFlIYDnki35NfBPYLG+JsXbf14gYYyHdIwzrKekP2hipib8XCuAD12Desq322adTDi
 NzCT+HX0IcYy2Z88F4IxHURwqWEQ8CkxFn1VlQnqD4QGx6Jq92M7GEPIvvayNwApGNw2PEkAPSZ
 Mg9upcBiTom0eCjPbKtsvpWqRZlkWHqt3bUOKoF2lCd1na6X0E3nHh662NWPu1c/nn3urNPkuHQ
 RH41caQIfICXnHz71sn0fiz8MsCyT+dpC9I7PZF7g0vvglGwkKYsUUyh+wNWIXHkpCA9lSiqjlh
 dEUUGBcb8WktVVX0tZ/+oj8KOfjCLkuGR2LEymQAs098UKVi8qQjRSlblbaTE+kH3IkJ9fBRxG4
 AdxSmxfyenMVl/wPl2jbnDhPs0hVGdUFWvzH+zRSNNhs//hKHgkXVnbq5qiLKiuhaapt9Blmk5t
 nArxmXSIGM2D1wsFIJe0ZPAfd/39foonWe26GIsOgfxtz8tL1ABdrnJQXWL0vIu5AEeG9qRwa8P
 8nI8rPipspBLORA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX9FHAgh2GsdoA
 9Xrk5r5EHZCbAI25fFhiw9IFtnlZdZ+jdpckTy4QrRmLB+SOPNsrMDVBjlJZEB/arxHTXcZvn6O
 +Qoo3MyA7aM/tOL+jS4r7vHobLyvLNQq+76JD2zQOXcDH0hZ3KhFoae0I47XccdTpGZl0Fs2N3h
 S5E8SltFRXyFCd7Y20fbq/3HiB9la5quEznsOJ+4aBvsnCsydc9+rDWqy9gltXOYTIFfrfJ9efN
 Ul5Ze/1YHlkbvjMinMMm8vaT8weswV4v73N2bo/3LwuQwTquMh3wlvZAP1DRi5BnhcyU7E9Vmfh
 FoinO/47Do4HPrqjgHw0kdT62qxMswTczrAIYYTxxBB23MbzBDUKJPYnTFJqzG+Mx7ZeEx54Y+u
 9dJyK8dNNj2TDGN1tj14bahW0E4ucULk2KM7dXDaHM8X6VTRx+7RlHy3uuOZdJZJm/u2PvmFZY8
 rX/rfitIF1PzoEtgewQ==
X-Proofpoint-GUID: tcEJK2h0kLNHQunU18MITynQAv6DjYD3
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a7f555 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=os9z4gxJ5ke727RypPIA:9 a=r15waxpOa3ezfu1y:21 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: tcEJK2h0kLNHQunU18MITynQAv6DjYD3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090323_891310_74DAEA83 
X-CRM114-Status: GOOD (  16.36  )
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
explicitly. Remove all Kconfig dependencies/selects for GPIO drivers.
For those that have no other dependencies: convert it to requiring
CONFIG_OF instead to avoid new symbols popping up in make config.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/Kconfig | 53 +++++++++++++++++-----------------------------------
 1 file changed, 17 insertions(+), 36 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c19794e56bbac7539250c09beaeb7..e649384f436e7fdd6ac633d9caad94bbee724439 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -145,7 +145,7 @@ menu "Memory mapped GPIO drivers"
 
 config GPIO_74XX_MMIO
 	tristate "GPIO driver for 74xx-ICs with MMIO access"
-	depends on OF_GPIO
+	depends on OF
 	select GPIO_GENERIC
 	help
 	  Say yes here to support GPIO functionality for 74xx-compatible ICs
@@ -175,14 +175,14 @@ config GPIO_AMDPT
 
 config GPIO_ASPEED
 	tristate "Aspeed GPIO support"
-	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
+	depends on ARCH_ASPEED || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to support Aspeed AST2400 and AST2500 GPIO controllers.
 
 config GPIO_ASPEED_SGPIO
 	bool "Aspeed SGPIO support"
-	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
+	depends on ARCH_ASPEED || COMPILE_TEST
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -201,7 +201,6 @@ config GPIO_ATH79
 config GPIO_RASPBERRYPI_EXP
 	tristate "Raspberry Pi 3 GPIO Expander"
 	default RASPBERRYPI_FIRMWARE
-	depends on OF_GPIO
 	# Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can only
 	# happen when COMPILE_TEST=y, hence the added !RASPBERRYPI_FIRMWARE.
 	depends on (ARCH_BCM2835 && RASPBERRYPI_FIRMWARE) || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
@@ -218,7 +217,7 @@ config GPIO_BCM_KONA
 
 config GPIO_BCM_XGS_IPROC
 	tristate "BRCM XGS iProc GPIO support"
-	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
+	depends on ARCH_BCM_IPROC || COMPILE_TEST
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	default ARCH_BCM_IPROC
@@ -229,7 +228,6 @@ config GPIO_BLZP1600
 	tristate "Blaize BLZP1600 GPIO support"
 	default y if ARCH_BLAIZE
 	depends on ARCH_BLAIZE || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -240,7 +238,7 @@ config GPIO_BLZP1600
 config GPIO_BRCMSTB
 	tristate "BRCMSTB GPIO support"
 	default y if (ARCH_BRCMSTB || BMIPS_GENERIC)
-	depends on OF_GPIO && (ARCH_BRCMSTB || ARCH_BCM2835 || BMIPS_GENERIC || COMPILE_TEST)
+	depends on ARCH_BRCMSTB || ARCH_BCM2835 || BMIPS_GENERIC || COMPILE_TEST
 	select GPIO_GENERIC
 	select IRQ_DOMAIN
 	help
@@ -248,7 +246,7 @@ config GPIO_BRCMSTB
 
 config GPIO_CADENCE
 	tristate "Cadence GPIO support"
-	depends on OF_GPIO
+	depends on OF
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -280,14 +278,13 @@ config GPIO_DWAPB
 config GPIO_EIC_SPRD
 	tristate "Spreadtrum EIC support"
 	depends on ARCH_SPRD || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support Spreadtrum EIC device.
 
 config GPIO_EM
 	tristate "Emma Mobile GPIO"
-	depends on (ARCH_EMEV2 || COMPILE_TEST) && OF_GPIO
+	depends on ARCH_EMEV2 || COMPILE_TEST
 	help
 	  Say yes here to support GPIO on Renesas Emma Mobile SoCs.
 
@@ -329,7 +326,7 @@ config GPIO_GE_FPGA
 
 config GPIO_FTGPIO010
 	bool "Faraday FTGPIO010 GPIO"
-	depends on OF_GPIO
+	depends on OF
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	default (ARCH_GEMINI || ARCH_MOXART)
@@ -383,7 +380,7 @@ config GPIO_HISI
 
 config GPIO_HLWD
 	tristate "Nintendo Wii (Hollywood) GPIO"
-	depends on OF_GPIO
+	depends on OF
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -434,7 +431,6 @@ config GPIO_LOONGSON
 config GPIO_LOONGSON_64BIT
 	tristate "Loongson 64 bit GPIO support"
 	depends on LOONGARCH || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -447,7 +443,7 @@ config GPIO_LOONGSON_64BIT
 config GPIO_LPC18XX
 	tristate "NXP LPC18XX/43XX GPIO support"
 	default y if ARCH_LPC18XX
-	depends on OF_GPIO && (ARCH_LPC18XX || COMPILE_TEST)
+	depends on ARCH_LPC18XX || COMPILE_TEST
 	select IRQ_DOMAIN_HIERARCHY
 	select GPIOLIB_IRQCHIP
 	help
@@ -456,7 +452,7 @@ config GPIO_LPC18XX
 
 config GPIO_LPC32XX
 	tristate "NXP LPC32XX GPIO support"
-	depends on OF_GPIO && (ARCH_LPC32XX || COMPILE_TEST)
+	depends on ARCH_LPC32XX || COMPILE_TEST
 	help
 	  Select this option to enable GPIO driver for
 	  NXP LPC32XX devices.
@@ -499,7 +495,6 @@ config GPIO_MPC8XXX
 config GPIO_MT7621
 	bool "Mediatek MT7621 GPIO Support"
 	depends on SOC_MT7620 || SOC_MT7621 || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -592,7 +587,6 @@ config GPIO_RCAR
 config GPIO_RDA
 	bool "RDA Micro GPIO controller support"
 	depends on ARCH_RDA || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -642,7 +636,6 @@ config GPIO_RTD
 config GPIO_SAMA5D2_PIOBU
 	tristate "SAMA5D2 PIOBU GPIO support"
 	depends on MFD_SYSCON
-	depends on OF_GPIO
 	depends on ARCH_AT91 || COMPILE_TEST
 	select GPIO_SYSCON
 	help
@@ -654,7 +647,7 @@ config GPIO_SAMA5D2_PIOBU
 
 config GPIO_SIFIVE
 	tristate "SiFive GPIO support"
-	depends on OF_GPIO
+	depends on OF
 	select IRQ_DOMAIN_HIERARCHY
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
@@ -673,7 +666,6 @@ config GPIO_SIOX
 config GPIO_SNPS_CREG
 	bool "Synopsys GPIO via CREG (Control REGisters) driver"
 	depends on ARC || COMPILE_TEST
-	depends on OF_GPIO
 	help
 	  This driver supports GPIOs via CREG on various Synopsys SoCs.
 	  This is a single-register MMIO GPIO driver for complex cases
@@ -683,7 +675,6 @@ config GPIO_SNPS_CREG
 config GPIO_SPACEMIT_K1
 	tristate "SPACEMIT K1 GPIO support"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -699,7 +690,6 @@ config GPIO_SPEAR_SPICS
 config GPIO_SPRD
 	tristate "Spreadtrum GPIO support"
 	depends on ARCH_SPRD || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support Spreadtrum GPIO device.
@@ -707,7 +697,6 @@ config GPIO_SPRD
 config GPIO_STP_XWAY
 	bool "XWAY STP GPIOs"
 	depends on SOC_XWAY || COMPILE_TEST
-	depends on OF_GPIO
 	help
 	  This enables support for the Serial To Parallel (STP) unit found on
 	  XWAY SoC. The STP allows the SoC to drive a shift registers cascade,
@@ -742,7 +731,6 @@ config GPIO_TEGRA
 	tristate "NVIDIA Tegra GPIO support"
 	default ARCH_TEGRA
 	depends on ARCH_TEGRA || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	help
@@ -752,7 +740,6 @@ config GPIO_TEGRA186
 	tristate "NVIDIA Tegra186 GPIO support"
 	default ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC
 	depends on ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	help
@@ -760,7 +747,6 @@ config GPIO_TEGRA186
 
 config GPIO_TS4800
 	tristate "TS-4800 DIO blocks and compatibles"
-	depends on OF_GPIO
 	depends on SOC_IMX51 || COMPILE_TEST
 	select GPIO_GENERIC
 	help
@@ -780,7 +766,6 @@ config GPIO_THUNDERX
 config GPIO_UNIPHIER
 	tristate "UniPhier GPIO support"
 	depends on ARCH_UNIPHIER || COMPILE_TEST
-	depends on OF_GPIO
 	select IRQ_DOMAIN_HIERARCHY
 	help
 	  Say yes here to support UniPhier GPIOs.
@@ -797,7 +782,6 @@ config GPIO_VF610
 config GPIO_VISCONTI
 	tristate "Toshiba Visconti GPIO support"
 	depends on ARCH_VISCONTI || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	select GPIO_GENERIC
 	select IRQ_DOMAIN_HIERARCHY
@@ -806,14 +790,14 @@ config GPIO_VISCONTI
 
 config GPIO_WCD934X
 	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 GPIO controller driver"
-	depends on MFD_WCD934X && OF_GPIO
+	depends on MFD_WCD934X
 	help
          This driver is to support GPIO block found on the Qualcomm Technologies
 	 Inc WCD9340/WCD9341 Audio Codec.
 
 config GPIO_XGENE
 	bool "APM X-Gene GPIO controller support"
-	depends on ARM64 && OF_GPIO
+	depends on ARM64
 	help
 	  This driver is to support the GPIO block within the APM X-Gene SoC
 	  platform's generic flash controller. The GPIO pins are muxed with
@@ -1111,7 +1095,7 @@ menu "I2C GPIO expanders"
 
 config GPIO_ADNP
 	tristate "Avionic Design N-bit GPIO expander"
-	depends on OF_GPIO
+	depends on OF
 	select GPIOLIB_IRQCHIP
 	help
 	  This option enables support for N GPIOs found on Avionic Design
@@ -1144,7 +1128,7 @@ config GPIO_DS4520
 
 config GPIO_GW_PLD
 	tristate "Gateworks PLD GPIO Expander"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  Say yes here to provide access to the Gateworks I2C PLD GPIO
 	  Expander. This is used at least on the Cambria GW2358-4.
@@ -1567,7 +1551,6 @@ config GPIO_PALMAS
 config GPIO_PMIC_EIC_SPRD
 	tristate "Spreadtrum PMIC EIC support"
 	depends on MFD_SC27XX_PMIC || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support Spreadtrum PMIC EIC device.
@@ -1606,7 +1589,6 @@ config GPIO_SL28CPLD
 config GPIO_STMPE
 	tristate "STMPE GPIOs"
 	depends on MFD_STMPE
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  This enables support for the GPIOs found on the STMPE I/O
@@ -1615,7 +1597,6 @@ config GPIO_STMPE
 config GPIO_TC3589X
 	bool "TC3589X GPIOs"
 	depends on MFD_TC3589X
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  This enables support for the GPIOs found on the TC3589X
@@ -2005,7 +1986,7 @@ config GPIO_LATCH
 
 config GPIO_LINE_MUX
 	tristate "GPIO line mux driver"
-	depends on OF_GPIO
+	depends on OF
 	select MULTIPLEXER
 	help
 	  Say Y here to support the GPIO line mux, which can provide virtual

-- 
2.47.3


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
