Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10614EB7EB4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIC5mMboL2WVmtyou/NslSQPwRYoamzHPBYyfTDWbmA=; b=kNf9UTIrwkBvKG
	EiqQEXtCyQqg/BeMVj+DYPK0TVETE9SG8GZQgsN3pV0iFpVFUcxXiyo4j3Eputj0Y+Wvamzct5AMb
	wSdWWckTJaDF8JF7okLGZhtKWDD6QE6fHUDiT7R09Rq8/nY2+0Bvty3eGBOnUcYuYb6DI09beTlI0
	jq2MUtc0XDOx2poj/D9tQ1Sdk+ZbGNV6hOv9kGnva98rt5Aq3s0zfvs2amkJIYyodKSm92mzAxyvp
	vIwmpl+82j39bsE6GQSlyhKWvVeeDkxPy1RTCt5Bq9El+t1mc1mknVguWGzY1gZgEwZYy3k2lRPBs
	YYRxaMDdXmlSX3D32spg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8t-0000000Gow4-46Fv;
	Wed, 04 Mar 2026 09:03:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8q-0000000Gop3-2CPv
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 04 Mar 2026 09:03:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=V4DdJrigh17FkqHoOs5hVpX7lVxAfGwxLPSOp0C/QmQ=; b=b4iQ3P9wQogAS3dxTRf2oX+xMZ
	hS6Es2Le3cUmNtfds1zmggFx9HGiJ7tlCTY+XcJkGvodizK5rIUiurxvNAA2EiwJWRmLE5Ajnsots
	Su75YfD+ByDDrOVRBNRRfLwMo4IPnWR16CviH1AZRCSKV4gOFaVVkmcErDlsJpcoELOIYlM5y04Ht
	A9lPzq5k0w4OrisHd57x9rx4xONxNgjP4tBE9rpbtZ5n8kC3FB52IIzxl4HrwKtUlNoLakh2s3zOF
	Fyl7F6PBZjSQKWkS7Ef4ChnwgcmPIlNjBQGq+My36cPyVOs2HKdI7w/0eFwd78y9+H2z4DpDfYA/x
	IOaKoWgg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8l-00000004CHP-0KOs
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SlVE1073120
	for <linux-snps-arc@lists.infradead.org>; Wed, 4 Mar 2026 09:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4DdJrigh17FkqHoOs5hVpX7lVxAfGwxLPSOp0C/QmQ=; b=D1m8qnvk3E5LhfpN
	3QUokB1mBSULrq/CdIG1gvd6CO8eOlzfQSz6frcriPGOVobjPUD7eQqddi0kPWW7
	LbjMvyAguQ0HaBgVtyx93QHvRTCo2bPd84Y4+GvyvQVfYCJse9JhM47kgvuIjenM
	FRAskzPXpM5Dt3drsssUvDqk8KcXz32SAU6JRDHeTbjWrsEhzH1n7L2X9AM29pgR
	1LjrxlnR88mTD7Re2O2hVilruhiy4vGOGYZlcR7J7r78Ipw8TRrAZAlx5CsWP49Z
	8YRrd7Z+1qSFEpv6ae2lephx4GZIpjJNQnokM35jHDfMSE+AT04D4THaXNEr/JkR
	bTADHQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpcxfh0ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 09:03:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cff1da5so3927186285a.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 01:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615012; x=1773219812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4DdJrigh17FkqHoOs5hVpX7lVxAfGwxLPSOp0C/QmQ=;
        b=DRt39Gnnm2SMWeiMoSSsEjdZ4+Mi73BbmOrxB5JT1rsMbKqqh7TITvhHNJ0RV4iGyY
         yL7HV64Kisi9DiRnqRCjuwbAUTjGr9d9GT3a2tg+PEtdXcqd1qX5pWpN7mpMQG0v0lZl
         PwgafhD/noANmzVQyTyBUm4kEyxPBmzkKHwGZtcTFOz9Soz/w3TXyrqRmeDk8nbeyw33
         el4KjhqtkhuCh3yFJZw0MoJrgt8Tte4uTmTnadRWxLTPCl3dGNsRdMh0aNc2/+lKfr/Z
         ztQ6L+XRdIGerVKHsZww4CNA2IQ/7DJMvVWsdQHEzlW5DYzZ9ZQlxlvt5sKpi0ufp4ds
         Wi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615012; x=1773219812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V4DdJrigh17FkqHoOs5hVpX7lVxAfGwxLPSOp0C/QmQ=;
        b=iDpOESCdH/kmcH/kA9vookeTLK3JVwJxSn/SAl2Wh813ctEG3Q6/GHYESTGG5x0tNj
         khQbsLPKQ5JiVScgJ8M7dEGnaDPDRUy7IIL8YmcAGA4w9gV4czUmtByvqq05L/6QyOVG
         O5i/F/HuNh59qwxVb953BKMzwtFXcnbbgtUWiQQKS3TmIqU6AIFajppwxWpxfnjI1Vyd
         kKbsRB1jNVlUtWA/uHzjq7YBb2uHOkLoWjik0S9EhZt+Efu4j3t2IxUJ5102wNPbA4Yg
         4kcB29EvOps3zTLhVTtKS0io06oos/71+91ryI4tsu+/7gtY4/+ccKoSgBvnlBzVh/k6
         z86A==
X-Forwarded-Encrypted: i=1; AJvYcCUAxBea0tSkZlluDtK8wYrIt1AiCwayNvqiQXV/t5FVtkOptZZXKVfTVAlVVwv6xdHMvHXfxs+zu0/EYGX4Uw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuM8nZL+AmlDFQfxT+5fVTASPiDeVyL+v0j4uE8yHIwtee2l15
	oX4tvG+zsIJCEXZjG1trAR5LSiPqFhOgac8iEt+CMblPWhwqflSi+iQQvhhCs3geFcxnp1Hg6pK
	+UTRklzFpTHHtyAuRMOPcCmYbSS9p96etwQxvj7Ol1ZO2HbobtbiFOhPl8CD7yg3Hx9C4facBL3
	k=
X-Gm-Gg: ATEYQzzmBfALsoIeBlkBM1wTHFDdnz9z3mRrbs81N3zwGY3if/US/ZwKiHaI52KMewJ
	kynF0Dv4WIIK8m//X+jrlsPhuQhOWHBmjZT8QzXk19LVdTgRoaqRNFVbHgu7crapM6fEVXXs3Qs
	DE3+t3ZArxK1Jvp6mXjMfRNOd8Tyk7+l19diS/pskS6C6jGDhNOy0z0aBmySKaaT6dVlHMVBjyX
	vKxhf896937hGQlSNx5B8AaJpYCpjj0XAfHMP4HVw4YhvLogjpBYC2/jqUpQRWYaHpQYhDlP2Ms
	DFfOmbVrveLBB5PoFzHPxiTsfR00nvWT7caIJikLC09O+A7A4Yovb7iidzupCFzLXy9fAzYL1cT
	LLaFgSx19r0qW+2folu6rv1WYoZIZO1BM5HH7qtpTFNkZluN25Oen
X-Received: by 2002:a05:620a:d8a:b0:8cb:5393:20f8 with SMTP id af79cd13be357-8cd5aebfe1amr147313885a.2.1772615012011;
        Wed, 04 Mar 2026 01:03:32 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8cb:5393:20f8 with SMTP id af79cd13be357-8cd5aebfe1amr147309985a.2.1772615011499;
        Wed, 04 Mar 2026 01:03:31 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:31 +0100
Subject: [PATCH 10/14] watchdog: convert the Kconfig dependency on OF_GPIO
 to OF
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ThHFh3NlTGr3cmL2+FqY9w+FucoHGvdn5gmiPzKUOnw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UzSi5Qn3DgaD6FivvuKNsOUmi1EyHHFH7/+
 rwJ4ztzm+mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1MwAKCRAFnS7L/zaE
 w2w4D/wLgntjU8j/CxmGWummrsoPSeGrn5cCG8PaCqyxiIKXvDtsH4EKd9slSZb07jfj5yDj1Uv
 Hd8iwoA0IAl6pyIMV8F6C/Le2nEX7Ag7qKCpG7EJ1SGQNamiw0jejArYX8VqkDPB4WQ41l93U7R
 /iOjI+luNjSk9ILZc2s4d1gffEwK0h4ReEorHioIZZJo1QR7SYlvfnspGsytExzS9DaE6BkalDm
 MZLZeaXNysxrzwAkbWhP6fqxo7ce8EhXQzu5U6cyfnjIoKwj4BhY9wQT1vlqcKYu7qwSVCLLwRv
 34dGqURaxeXWUTxumDYguIk0OCt95kbMkJZ7I4gEtIOnoIYXmoE0cXQi7q5eKTHEx1Pdv68JpLm
 xUME2wVPPXUFvYpnkGg9WctfBpmtH0SG0C2Cm9kjCIo++i/NcoGl6yF6nhXUikBqO/r6xnXxM1L
 4i/5PHvnF7c3MgEvaXLjzXmtMjDihQxuFpBA/rXFEgK+cDMLSostTYnJgZaWZWTIqz48EyeBDaE
 3oyY2BMrSsjPTPJvgwUHeksiIYVrTNq30Dy6zjt6d1hl4fWedFAUf3WqvY8s/nfm8xIYBlTZ6i0
 2iigsSnPenUOrcRGMY5Y9N9i6rZROJNbSrXdfQFtt3gUGgfoSeHrntObLfNOa/4G+sndGUQspVe
 1RAylqZe+NoE1Lg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 6uGPl0uQ7Tp009fm0Yx_P3T1Nhh5gItW
X-Authority-Analysis: v=2.4 cv=R4gO2NRX c=1 sm=1 tr=0 ts=69a7f565 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QGo3Xwuj-Fjf7Q_gFxoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX1eaNidgSf0TZ
 L0aJ1WLjRoeM5AVTdQxvvWtIW2Yt2VdVXMRE2p8J6WeFfXNmN7V44QdjxJcjxCzNB7UbosPRPoD
 qhy8J2nuctembpupuI+i5S9snPmdTCcJhKIITRiVKT9TtCo0crPLUvCvraOLwanVv47uSa/P5ux
 ue9bvopCiVBGioi2FEzuUoo8em9l7p+WMkUVLSHDzPpzhZNsVP3BALqLrP/OOtBzgI6SVJ+7aj3
 78BeyVAyFKyaQNr2w0KU9BtYLyqXHs9Md7S0e191jAJrJaya4iaqWfS+nTaxb2EEaJStk/s5nxo
 fDYK2mOlSz6+nFCMGtC2dK9vQM4+FFALgH1W0W8XJRzU+EurUDZeFPiuWHjwS3uLr4wGUCbi2DP
 mKGl4B8Gr9YHBvhNUnjgfHgEW2MkUaMOo5uWpV7CgtEixT+yUZYyPa1p1TdVHohPp6xm7uJ82Ab
 Xm7gLCEHQ57Ypv9cyTQ==
X-Proofpoint-GUID: 6uGPl0uQ7Tp009fm0Yx_P3T1Nhh5gItW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090335_523876_0D31F931 
X-CRM114-Status: GOOD (  16.52  )
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
explicitly. We could simply remove the dependency but in order to avoid
a new symbol popping up for everyone in make config - just convert it to
requiring CONFIG_OF.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index dc78729ba2a5d6e035ed3cbe5c2b631d11b76b20..ef200339a22a6f9c51a46c9c0b8466add74313e2 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -250,7 +250,7 @@ config DA9062_WATCHDOG
 
 config GPIO_WATCHDOG
 	tristate "Watchdog device controlled through GPIO-line"
-	depends on OF_GPIO
+	depends on OF
 	select WATCHDOG_CORE
 	help
 	  If you say yes here you get support for watchdog device

-- 
2.47.3


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
