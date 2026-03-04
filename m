Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB75EEB7EB6
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zb8mapWdJrioix2lVerMkHQHucjrNZp0DNMaDCNBslQ=; b=f+quS+lWL4+GE6
	YGZnh4TRC6PgTfMbIZOnDkrNl7WBOScfYKTt9JHKFlfpQgICb/MpXGtUfddM/lmKosLUh79CGB08R
	XAfL6KfPxVlPTC7h4v7tbfwo1h0fpw5JL+j5ISW2hC9LsehhHPl21lY2keFtCHvu68z+Nf49Pz0D9
	Ob3wLekjH9ppmOfQzz3RoZfZ4x+0A/siOrU8znZ+OCrrXBCu1eQkOb3hJIYvh7LUANwuWprKZU0Q4
	6Awwy5ozqYblN9qPnj0cH1pE+wRb03mlhWzVZ3jwaCy3ICsto2F74J9SAg2o+L9f+I3/gJjxDn77+
	P8pvck3mbTNoLWqPsqcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8q-0000000GoqO-3LJd;
	Wed, 04 Mar 2026 09:03:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8n-0000000Gojw-0iDq
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SRfP2275140
	for <linux-snps-arc@lists.infradead.org>; Wed, 4 Mar 2026 09:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXe7yqpNlx0nn9pWZexCvsUEZyocSRhg3uagVwfHYkc=; b=Gss/iCg+rWOjO0XI
	FXiPOngq3YEIyQmyihV0ROxspnZCr/RZST8qpwokUZCARGNd0v2MZcqSg0NdflPU
	KtgbPek6xlYE0v2Yqm5iaAUuATqBTQBVQcGuHLEXoOqixaaxVkwdoPeoL1goc/Qk
	EBCDU6QbtqYmbjnruimWpk05rlzR7HSFB9Kz0WyacIQWoK4xchg/NY4nekGS0qer
	foPIQrHahLgMVT4qZjtx4adFTd/8Hv/LtVOiAkTNUYFdPeEf2ZzDyLmRyhpGK10F
	6UkSbMAN/pYC7L8nfVWPOWzCsuTI0OcapeVVNpjjy2W+CYkkxvaMcy8E1OGIf942
	q7/Qmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4ms609-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 09:03:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ed6c849so931381985a.1
        for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 01:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615015; x=1773219815; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXe7yqpNlx0nn9pWZexCvsUEZyocSRhg3uagVwfHYkc=;
        b=g4YCKTRLOsuzUsHfM6tKRwHV/3ezcWCqeeY6HTvLy0FoOrM8nHd/4X62z4GhHhW++4
         SdJwK0CrVOFLl2IxC3NXBvJL3ENZAHCj5kDDvGemtu+0mgw8X4mEidjyxFtEaF5ZsvUt
         Q9IuWuTIN1p6sOzgX3KF3Cmy0r50iAEOfn3xpN2FFy/Ve7Fcei/zaaT6TegkZjtN9QmQ
         Iu65CmVti/c5xip6cQdAKraJCdEkyJ+3QFsis4XizhnWBvrnhbAeqU/g5pG7eAmO0mvm
         pWnhClLMlGVsfH6C9Y0YmmpwP0dY/vqUmJ+eTxJA56MntuhFG3BbFsY4Lk8s37jIoR4l
         JRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615015; x=1773219815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yXe7yqpNlx0nn9pWZexCvsUEZyocSRhg3uagVwfHYkc=;
        b=I/Uwh6JHSyakELOn51x60x+tmCAfonqcj+oWUMjmR/Hty8cQJ35V8DMstlsNyosrv+
         /asTvgWNREX/tzAi6BfnG206yxUJN9ooiZmiinI5AF1sfUJ/dqYKft4MRWHidvvxxnj7
         7LzFHV+deWKIY8ehxAhpQhfvPXbIaHEXqet2jjN/hhPdMxSq2fVUQwt9igJoWpGMv43o
         UerAbhmKSToQoffcE8BUnW9ZJBb5uY+KJjdlCFHGOZ5kKRiOGeRXDsQi5QXwFQMVmKri
         nbHDZeNd/WIee+FdBHTageRNNjCRkI5X0BNRNdL6WO4+ftcRtkMfisUARkO+XchXavP8
         v/1w==
X-Forwarded-Encrypted: i=1; AJvYcCV8SD7m4/bVba37IkybC0sXomFqLqGPWnkfDqs9Nx8Bh/oG/o4Y8kS4m4AS9J86wX8a5vxmk3zUW3EAUKI5cg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6hLW1L+2aCEKQQNC2fil5vu5RPLMo8j8lJEaiRBfd2dC65AE5
	DExX7680zAzStu9qnhRgtniz2OJlD5FiGoSDbfQjUh32dqsG7g+FfKY5g+kjs4t48gUVIZWwAiX
	/4sk1XgV7jSmPI1dY6n0atq5TCaTCr/QFfAaBu3ZDitXD7LtwovGckRbjTxFtPfbgP8ijfshAYP
	Y=
X-Gm-Gg: ATEYQzzRQl9uJ1wgyP9V+FQKPUqmlJiBtE5eJRqgfW6bJpiyXjLj3RwcEsg/82lgGWr
	YqrUXSTwzC42k08hgk1Tu/57sSR/DhZlvhsDBwudDKkAqzw16fpITPD5cdZORh8Re05jTUva1dr
	fELUAqul9rG1974/1wOU8VJbZLuIbkguDGnh/kgGspwDMcUAXWxVjEYNWuMmkf13tBe2vMMPVVI
	baxtdx3mgpHK5gZ8ij+8eF3jo4PkZun/Fs58rE1lzQgoR5ejhbRp1q3k+S8shRzND5VLpa6X6rI
	Tp6rkkXN4gNYU7PN3Sqc+i84JOGWtgR0sinD2lOZxBIojctgyRaMPJ+Zw3isIB7+fE84NoC/ZbL
	C1WA7PBYKdolwxpHHx9PQCK+m5SF2qww5MxbQQ2ENdMRvWNFxsLkh
X-Received: by 2002:a05:620a:4011:b0:8c6:b45b:9e2e with SMTP id af79cd13be357-8cd5af80331mr160327985a.38.1772615015401;
        Wed, 04 Mar 2026 01:03:35 -0800 (PST)
X-Received: by 2002:a05:620a:4011:b0:8c6:b45b:9e2e with SMTP id af79cd13be357-8cd5af80331mr160323385a.38.1772615014945;
        Wed, 04 Mar 2026 01:03:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:32 +0100
Subject: [PATCH 11/14] bus: drop unneeded dependency on OF_GPIO
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-11-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7Yu8AGLKirVDPA2TPrB0ciJheoHEe4QHGDZcNV0GmnA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U0GLkuzkdEz+C3tJvMp4AQ7C/WH2/5dCKx0
 BCzpx6BvgGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NAAKCRAFnS7L/zaE
 wwhCEACKXR8hW1IiOwR5KrvLRZgVvnxKgGPrC7L6xvxbiMUnVqeZDdh88R5a2U1Wr74IbeHLexp
 rrr50hvFMkPBnqhcQUtaCGZFk4/IKdKBTRif0xGrxJPtzugQE0tbQJj4lG73Ur+ncT9BoVtw4hp
 FsLDV54dVcPs4TKwLyNm+WCt8rpMjkD/eXQbVEZrw/xKLWNEZX2oRJo+dAPmsuAOr6paT48MdnN
 94Ek6kcqmo9P7VNgd7eTUikvn5ZQgYLs2gJyL3S5zXxaM7zGsEuE3o3qzVL4gUdOVrHxAMH3Vvr
 wo8TVnlirQfO+VngnItzgph3Ho4ATc95hFNirM8vjoCYiKifg9cziAaa82BZJmGJ43sIM3KpDEF
 +B6l+y/Kiz0jWsIyHHEqWi8ZrS34Y9hvIaP3eMMQ7OQpykM8x8ZbZRBd/sbK30im2Lx4fQ3qep1
 3DFSIMuHYg5sCKcgHz5zat9wm/aWg1LRmAohRvpwpF7dIsvpMDjrRDh5uQ9ryTHDRC9/3Oq20RI
 UXfzyjkKqs76K/4BmBISIcEVedtzYk62EOzPQ6hQLumZHoD8Q+OB1CeFKHjn7rOa2xQMVjeaqrS
 HsXOM8riL1ke+k9oIyQPPiwLnwdIqnDlE4yYfagLgPQTn81GkMlMuuQ9AVIKf2MaYI34UwFxZiK
 rwNRQQIFnuJE0Kw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: vut3oG9pqizPzKv_wDdvr2vzWHb1_bVD
X-Proofpoint-GUID: vut3oG9pqizPzKv_wDdvr2vzWHb1_bVD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXx1W1MwBHHgfN
 RhammsRdUBBBGoqrdmnqwqKCkJU4E/mISAda7ngTYIhbAjfTCgQKVBDtSlEfpeEbqwhP1bysrvM
 l+YZbkSoTUQli+lz4lZS5a/eM1fqgqo8Jh5kArMH8YwQe1ECjxEtDhcdmXAL4i+5gKFI5P4RLDw
 YEJWeNvV7F+P0peO/uREWvmQXPYG+L7ehMhYtvVwGWDZkZhVkTSyjuzEqDS44iEkUg6AFXZPob8
 M+K7d2Rtf5gQj0MNuVTfGNyL/yxB7BOWE0PaWjjgMq4xYSPB/l7mQ2l0n1NtJBU9vPv+wbdmu5W
 iYVB5/wIGDPObgMd5ptLc+ksYxSVT2lSh7cOWi2fCld2SCuKL/CrOjyhjasa6eLptsVYW2kt8eO
 VP8hVlVRjPq4OAugyCdHu+KQLx+YbkEP5BtBknRAhkxidEeyMhhNUCUTRsKBV50CfJqv1LeN8Ml
 /tn6relmrzKwI3rMEzQ==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a7f567 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=myaI65ZsvjZLdZNFwr0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_010337_355343_55E23B35 
X-CRM114-Status: GOOD (  16.25  )
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
 drivers/bus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 2a1b46f07080b3533a9787254aec2e67cbe98310..c7dca0b5fb857a263e1ee730ede6002e88c418e6 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -236,7 +236,7 @@ config TI_SYSC
 config TS_NBUS
 	tristate "Technologic Systems NBUS Driver"
 	depends on SOC_IMX28
-	depends on OF_GPIO && PWM
+	depends on PWM
 	help
 	  Driver for the Technologic Systems NBUS which is used to interface
 	  with the peripherals in the FPGA of the TS-4600 SoM.

-- 
2.47.3


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
