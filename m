Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B727EB7EB5
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2026 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTHg70A+u0SfMTCyZnotrbdgLM37R9d6/WrT5Bs42L4=; b=mvAM19LTiWLmV+
	3+oDTzIyEH1P6s4s2qbMWKGWG8vfhJbd7lmmXGoXs9vYT1Y7KZpNEAn8tDlOD7JXs9TYGpIivugLO
	Jn0WM/NWzxRjfRSmLobU7pwuytc0I0nbKzYiVndBxHrSOue/6+mnHm9iwXkiAqgqy4Np2pNDc7vlq
	oWFb/LLhjP4lx8yIwLC3wwE5lvePkLw4oTlQ7Zh4C7grYKGp1ifNvmZj/5myt97F8F7xy5m5bEcap
	jy5/dlAtav20FD7LIhCibBvw7tj4/E+acxEHfKMmEhc9ZPH9WAIEcrdILSW5EA+uCAnjTJ6Lb2gxe
	HsUH7+iXv/4IsRJ/r/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi9A-0000000GpL4-34BU;
	Wed, 04 Mar 2026 09:04:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi94-0000000GpB0-3Ef8
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 04 Mar 2026 09:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=; b=PSU0r2v7rR6BsOAUDVXitc8NIl
	W85j9rJVGWU1tgdiEhomjJkecDAfXwieH09FovSnayD/OXse+Knz+K12bsRyBCxRCqZtbW1SEZlV9
	uatewEF/BR5MOnqLb5JggBvbJAFI+35Yk3v8v1ilb80GL9erXNBNq6Mwe3wsDeVGQMuRPVtFdFGy+
	ABC8JJcPo4zmYrD+mQ0SupUVchxr30k1Izi7d3kd1pebjczyoVSFDzFJ60epkl8x29JBkeMNFqZjf
	dQZ3Lpnp6FthjXPeIKJFbrVapVDu1Xp0hrM8VJOvOd2ntxeG29H8taabNiIKTqMsw4n7FhTwyT5KH
	H3ant3Ug==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi90-0000000D1B5-1Pk6
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SUMZ2861188
	for <linux-snps-arc@lists.infradead.org>; Wed, 4 Mar 2026 09:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=; b=LZ5ZeC1kqTnN1jFh
	vCca7TV1UKLuarWNNA4j74IoHQZeS4rJ8wyjWtEjFDwOeF5LL3i4PnB/RtNWZk9c
	WyhH4S9YFRvmPpc5DDWtNq0Lq7gVxrQuyl7jXzEbNBoJOvYqY4FEi2nhcWKRIYhc
	Zn0ZezifGODDAv6RguH2+n4lz6j6XJtVzi8WCuvy6g0/Rm2g1Za1QiGg18MnZsQt
	LxXLnZIpg4RalfuDBpF/CIraKi91ur9+sQIPVX3xDa9cuFhzDc9DYM+q8+wJzJlF
	TMjqx7cw9Gq5Cw3kk2q8+PQ+IyRTcHcTOFocmDDfXcv5qgLhgSrVLF0TRjDNjCBg
	YOz7wQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9k96t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 09:03:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c882774f0dso4198107585a.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 01:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615027; x=1773219827; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=;
        b=czylflvMYKIzL+VpdhdjFjZYZ8FZzHCCiXAzn1A3UI82zzzuR05vGMEC/pRxIxFmTL
         8N7FCFouVmaPc3pwe7h5m6SXwKc5NJ+SjgVf1vuPWYxcz3zuLmRVD0RaI363cC4VBSd9
         lvkCY+T5vpueVJZFljNcInh90yoyqGhFIwyELGBD2XIamr5efBpLevNQVAqvZ4pCA+e9
         hGgNlEF4hOG/AOP2QzHbyeY15gvK7zHmNa24xGz3B+PD6fjTJ4QGrY1LzNumKb76i1Zr
         yOXuV0sDhLFil3dy8ncrinnpfBj1qDxHq6ocpmkzjqygiZRXphspz7uo8J/mLeUiceL6
         idzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615027; x=1773219827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=;
        b=aTgjBYnMyd+K1bMtpEkgEuohI7EweKuPzcIpVrqTsJ8pWtqVfKt5oEhKZujasiTZtn
         N6lOGiVT0SQhc21UmlK4svKX5eBlYpX+DDSkLpeJQXcnmME0KFFmqNZ1wM9JiwaJ7r+Q
         xp2h+3ghav7qmM4u2l1mH4zL6ifEB40tHTeBOtsOYdjGI8sJIdb8I+zDtyDycthsB0W6
         dZX+D4cCz2bE2HX9cY/PzpL0W0Jvvaj7LqrMvufpSPpjK5WpD/ySajOYPrWvfxUpVFb0
         OLU7srfQqmOafyzxnQuaWktZLbpBsApzTE009xywC2OQ6UBavE+4t+ye3lWqYz0btvip
         ZFEg==
X-Forwarded-Encrypted: i=1; AJvYcCVkpcVH3Bb7W8LkbBx8AOQD+Wb9E5Pc9Myoux/mm9y3imzbqBz+vivV9GswaElLBs0XUy9cU8JHmLPSL6C/iw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywro3fwko/Enu16+9zGPeOc+LMcDEalH67o62Gjghg1+zkrI8Ye
	T+8HF9FjpfymBqLc103Yquj+PyYKpyl1yRmg/lVWQrf2hrDV50E82acJ/7oqc05rzKg86BcKDST
	oahDvxWrdW0qJAcrmaXv8N+TO2i5CGDoH4hUvUv0NOje6frrIpV4TU8kQYiO67PShZNvd3j78sk
	4=
X-Gm-Gg: ATEYQzySEI3JrPK54hWMVGMSjr3kpCFqPb80q8nAKxC/t0qJFhEWPTgeCxqfd/p6dKF
	8PEXgEP9zGHa/kPhwJt0+HAOzhIaJCHv49ogQXVxTOTGnXgphPSF6gnLkRHdG76HdvILCPEycYF
	/GEnwaHYvvzhw/HIPEllp8XzMwRoe9yhcblD3UvGtsnIJNV+MFspwwHK++MJgRA8BoSd8H4kIzi
	Qpn1PZxmU11Ex5UWmt31/N6bIVeCbzjwauql2iKrwr9yx9SDoERedX4qonBkVs0+RDsWDt8keqd
	v43EhIuAgvB4VzL45GS1eOfSaG5PB62vhzSGNkVKN1hYXEYc/8eEfwNBBS24tSi6KQ6ITwZWYaw
	W9dot7YOK0KocAYqXHNuLjv4RLYq6Fsa6U0v0w6zJ5uA6Qna1XCiT
X-Received: by 2002:a05:620a:31a4:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cd5af818b8mr152243285a.41.1772615027067;
        Wed, 04 Mar 2026 01:03:47 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cd5af818b8mr152238485a.41.1772615026584;
        Wed, 04 Mar 2026 01:03:46 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:35 +0100
Subject: [PATCH 14/14] media: i2c: drop unneeded dependencies on OF_GPIO
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-14-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MCUltpFZ7WmEs+Zx30xfCDFOTCP7ddjGHJyyrYpihXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U2S+uVTRDUZjbW42G7Pde+e98yExCfHmKSl
 HuuGodjDTOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NgAKCRAFnS7L/zaE
 w04sD/4l9ifYSWVyk+wcaQpjTACkURD2eCeWi7XG5/uxKcFxPRjOjYbnVCNmKnRiNYQHTnOdZAD
 RHEPNL9Tmn5V/K3zGBvodWKK7DoWQJZcGQLrC8VNmiFODSfkjheHHtNx6K9SzWyk4fsz/3U9/Do
 uRHRJZ7f7yJAP3QJaZ9QxWkzuAC8If42NLay9hfVcfo+kS0TOu1NNRM+6gXMA5Y/pP4FlXYs8DC
 IsZC4Qjx9Hx0bhbmMqrIpAUFk9OaN3t+oV92DLq/zFIvuNHMy0/L8N/wiyzmLbnZcfTpsf6+Qgp
 4P2FgxgqxO9yyi+cm3IA9XfiOCzuJOPteySq4NcdBekIwuXhYMeYRNqInw0HjhWFwbiAeFthwO3
 DOQAqM86R5V0bfFnCvwu7MoqjY1SjVWit3ZOt/iTOhJSvBydJJ8pgS8/ULEYw/m0sZuvYNvGOV6
 lYD11td3ysN/HbFMLVs6zX9Rr75VDl7CdXbXSc4aQbBdsN1WHf0tu+5dKq1slodk3V/ZxT2jL86
 Ns5Z37xaPgZ8pZRZw86cfDDtlRD4+3qaW4Zkd8uc9TQlPBg2iVpIMvoZdChHXBocSpd4F921tHV
 NqGZ8FhAn8Awi3Dn3ouTs3qouRo73WZp98ukYqMVfXEjl4gbfeCP/mjH85au2MmJuJ/7PUDuHTk
 DzYrk83TwNVNPsA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXyc/PjIbJ79t+
 VpV0aZ0iWNWuF+nbUyxA+776JqnYh96galc3jJXgChgwjo2Nt/crNwyJ/s2EDRrgWltEEdHiHlm
 hI72fJ7XfPpTo9e3mklwD1oLyVFhFQuflcNElnseXtHuUfV4xOTg3H+nLmdAX4LWJxR/f6c0BLG
 7UKDWSWwVhw/qyWheR3Z22zKyHCeiXO6FkVAoSM2rMC1Mo8Z5fwqZr4wK9zvZFb1V6/sFkp3slw
 u8E01lyF7wfveRvsWXbEouSwRJPqUXbE/7YBdjPSrWFcTwcn+vx+QeGbSLtcjZP4JbFTwXCk1ps
 /V+Q4TCRel55ZXY/pk6+jX+4tit9htGkUPB7iNgC1gRvI5ImV1TueG20ipRKXWvCqBXN9RroHnR
 fokgiBv83deitpX5JygCTmg5LG01e4pJhIwaZqOUoG7pXHpxR3tCnzPFDbLFVxZrpwzllAe+wud
 R2Z/p5ws3qXEIoZWx1A==
X-Proofpoint-ORIG-GUID: xXm_be34GXs10qnrTVnhlIBpdMO9Vf_f
X-Proofpoint-GUID: xXm_be34GXs10qnrTVnhlIBpdMO9Vf_f
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a7f573 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=jH2LZSAcktARuhmwcr4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090350_626749_ECAE212F 
X-CRM114-Status: GOOD (  15.02  )
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
 drivers/media/i2c/Kconfig | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5eb1e0e0a87ab350060567f578960c0e98940d6d..40b6fa3fe38b8d64d029d385f1acd1de4480aa69 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -237,7 +237,7 @@ config VIDEO_IMX319
 
 config VIDEO_IMX334
 	tristate "Sony IMX334 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -248,7 +248,7 @@ config VIDEO_IMX334
 
 config VIDEO_IMX335
 	tristate "Sony IMX335 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -268,7 +268,7 @@ config VIDEO_IMX355
 
 config VIDEO_IMX412
 	tristate "Sony IMX412 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX412 camera.
@@ -278,7 +278,7 @@ config VIDEO_IMX412
 
 config VIDEO_IMX415
 	tristate "Sony IMX415 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -689,7 +689,7 @@ config VIDEO_OV8865
 
 config VIDEO_OV9282
 	tristate "OmniVision OV9282 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV9282 camera sensor.
@@ -1244,7 +1244,6 @@ config VIDEO_BT866
 config VIDEO_ISL7998X
 	tristate "Intersil ISL7998x video decoder"
 	depends on VIDEO_DEV && I2C
-	depends on OF_GPIO
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1282,7 +1281,6 @@ config VIDEO_MAX9286
 	tristate "Maxim MAX9286 GMSL deserializer support"
 	depends on I2C && I2C_MUX
 	depends on VIDEO_DEV
-	depends on OF_GPIO
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER

-- 
2.47.3


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
