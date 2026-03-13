Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B982105F7AC
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Mar 2026 13:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11Eu7Y3G0WNwRrBHrCoIeguKbtdbkqWsvuPai1tHU30=; b=UM/D+hONR+Wmp9
	PKm9D5dvS4Twk2r9XIYeP7w4xsJG7cNR0/e7vJPIxJEH921PrSIugya22RQ9Xi08KngaTwC0g5qrp
	uZtZp8Crbu3+7s0fnEaxhfwv1zKWwu1pTnYUOAO/usR3YPLSbbTap5HbNTWfxwkl8RBugaU/F82LD
	qdQOast2dWM9QlDV/wkHHSYt3F0tRjsmQv+JTm6w+iO/+Y5c6lqpPxT304hnmEhqls/EJXvKOdlx5
	+0ZP9rHvZEWtYmLP0MMn6xtn2HjOlPZixuP/NEXhUx1lTGy3WkjROw7+lthqGsQshmnjY9IMvFjsf
	21Rzw2+1xAVwJJtoMaEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12oa-00000000JMV-2lwN;
	Fri, 13 Mar 2026 13:44:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12oW-00000000JLX-1pkt
	for linux-snps-arc@bombadil.infradead.org;
	Fri, 13 Mar 2026 13:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QoZHIkugLvxBFz6S6an3vh8XxLW2VljccTx776RcMfw=; b=d/ILotqr6zpoTdfOiQ9ZoMJHSy
	MjNDAYNRBZ1LSX5bTUK1Frllh4/3ELsuhiJJMzTkawWjRJY4Jv5thpc8qEYYPdVI+KxTvSJqr9xq+
	k2UdmCTAMe/A2+eLbMG6L0mD7/26pbEspOkV8w0oVuhnNDj4YUeMeoDomdL9gAw9989lYjG50QVLM
	Iv+3HzKM72CzKWMe59X8pVHwJy2TUthAIz+CZtsTU4AeGLar0oixjYbH/GpPo/HOvU0l9pJnXPDlS
	6AD2bwyF9RNoQXUV15r2VfYl2DQiH+hmFZpnop5B4NuTIJoPxXXa+fM2pjmo72P4E0XZpmD9Fryec
	0y2liZZQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12oR-00000003QgP-0jit
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Mar 2026 13:44:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7inSs2263477
	for <linux-snps-arc@lists.infradead.org>; Fri, 13 Mar 2026 13:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QoZHIkugLvxBFz6S6an3vh8XxLW2VljccTx776RcMfw=; b=KtbSMsLtNsll432M
	ZTzKQXe8T/DK/n7b9XjI6u2X8hEFxS6+vToHFGAIETMkOYmiyrVQx1Ron0HTNUGw
	L/7hqLNFcZtO+7ieK6wWqj/GrMcUMTkirbNDQOXKEyEzX++Y07x36vS4BckJkiBw
	i0e+TKFjJYkL6k4y12GD35M2kL8ToRgaS6v3aDis+sQW046oTfw6VRUKYvC55XyU
	GavC+gmfdoZZxfCSN9TNUX7z0/IKdGFuTV1BuxzhmfyaKB9OzNJ/1nmkV5iIg9BW
	H8cIWU+Z3DaF7xCU6hevUNHgxDD88Y9uGNl2srLPZ4lN68ffEs3Qj3IQtVVXyVOS
	oZVnQA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4s78a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Fri, 13 Mar 2026 13:44:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd849cd562so1384296385a.0
        for <linux-snps-arc@lists.infradead.org>; Fri, 13 Mar 2026 06:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773409454; x=1774014254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoZHIkugLvxBFz6S6an3vh8XxLW2VljccTx776RcMfw=;
        b=bjkqoJFmhJF08aXIKYUh6CpBZOzDjmzcl41fuAhI8jqtfc2tUfjCBJOz7hi26UvMuY
         8F9kzteCq4v2FV3Psb3L9VYu6M48zc9NQn6WpZWJ1ttvI9hrRjXlRceC7P8X+v36irS7
         YAWF06Jk9oX9bQ1URDw0+DGfMq+F6Ow+uAwyQ9TPNOietQBtOOFgu14aR9b3Czy2M7gv
         ZF7ZqsH/MVEpJWVocgUti5Ws3dgmNASXlruek51vTB4dvU2MDiTuqAYyZDrRuV9TG8GC
         J4fgNUNml1TczIOoAq0bIUM6s7UQo7ibS5jHHTAVo6+MVreMjBBk6xhChi3bzsAG43kl
         H3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409454; x=1774014254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QoZHIkugLvxBFz6S6an3vh8XxLW2VljccTx776RcMfw=;
        b=VYU4NpQt3dJEIn6bDw60TcZade4KbB39m/aHDHp6Kd98R55rtMjDue08YEeb6jhQ3U
         VOHyym2IQ2w51aonZEK58gHymnqCBJclNEe/lUgbAZV+Cd/sSI9miJjpdBMSEfzEaywH
         gE9oeUAfdSADs5psCY928DKNpYIytNWPkHzBW3uZPshbSDY7B2G+yWxHgl9KB5R+Oe3l
         SwpvojZUbCLezQQfyODNi1tCXxfeNHnR28NmzR99/wZn4wlKAjO6rpnkQTEMps02itXA
         rnXSxH1MwEIiRp7GR/d6J50AwBWJkJJS0YrYi+UhMBzxW5XWoPX5tXWYtfCYBmh9PEoL
         pi5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFefAh/6ib4foFCfY60ygWv335C9/7McCaudhH1XwMI4A4hPC+RUSoB3fUAZYoAYkH+yDtnnrNIriQglK9Ig==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNoN8mY2J5Dl9g4Vi4voWp209f5EqbWt+csbxKYWzoWt5DcVTS
	fTB8SdjTt+VDq54SghoSZsviVTtjpbfWFu0rCaBMh9zfYVPG/1/RpLQJ0ychJOugZgJ6rPHeK7V
	J4rPHg53/Flg3cRwB+AHKPO+ebzza5TSJ76l7+N5ZMvKnWuhuu4nDTiBi/tTEuSFQ6vqiz6LTQP
	Q=
X-Gm-Gg: ATEYQzzpXRtq4/qQQNLJpEkbohqrEsTv6K4/qexOguM4wjV8k7VC5B8bTkPnWloivJm
	cJbB2UTWyMtaCqM8R7ojacN2XGRSml4NG2PxHesHzBQ27vnWlqGkpyM+yAaq5MSuSEG7CGW/sUi
	BKPzddqW9zSO9bINdxoduWVKFvPEqJnsaDXKDSxJG0ipJkmP2a1ZT6a7A42kijWx7qThylE1xR1
	yNCInrdIAaTJ8AlUlS6oWDvL5Rmu3Y2vSp6ojVj+XlxZUeCG4ubsJeCqWMZOolp6Sy8un1+N9p3
	LCYy5JZhTWUhCEu5wmR1e97ke9z5agnDgr89Z+NKf87h4DmeyMUUdU36wn2FTPp+A0G57JLImaw
	TfnyTU2PIhQCCqTI0TY3plwXyCfdj86nYbOf2/EY+KwKdV1XzK3w=
X-Received: by 2002:a05:620a:4623:b0:8cd:8fb7:7aed with SMTP id af79cd13be357-8cdb5b5fb55mr457718185a.49.1773409453942;
        Fri, 13 Mar 2026 06:44:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:8cd:8fb7:7aed with SMTP id af79cd13be357-8cdb5b5fb55mr457712985a.49.1773409453455;
        Fri, 13 Mar 2026 06:44:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:f055:6536:e7d6:661c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b4dasm17696873f8f.18.2026.03.13.06.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:44:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
        Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH 00/14] gpio: remove uneeded Kconfig dependencies on OF_GPIO
Date: Fri, 13 Mar 2026 14:43:53 +0100
Message-ID: <177340937994.51547.9424773605486301589.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: f83Dyz9fI2sXVoA3syq0V-qXqtEFluDD
X-Proofpoint-GUID: f83Dyz9fI2sXVoA3syq0V-qXqtEFluDD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwOSBTYWx0ZWRfX23yODfnhj9SM
 b30SgDGjzckDQTqCFsIbUMALEWtb6p4cuntvyT3V+VOlT7s7D2kzVAXI1NWXMA+Q8lnooxCBAhj
 PzYBFHkVmdu3VJTAwFY91uZzxxR26+L2ncVQ0cxOpYh5mLlzuPeLVKgY3IO+nYlkziag5rm36EB
 jz3sx9FRexljt1BvrTDaXoxhlNQjc3MpkfGyBEady9nXL22i2Su72CzSZbxGkZVKcAutwd6E78P
 EmWqBMWUs8ZuqSCP6Tsd9yqp6YQ4d1nyB8vz4j5Wp1qFIu2/+viTM6CGqe1Jy4zoe3Qw4HyjZoI
 572ZaCoG6/77hHuqATsC6WP5utTCs5Vgf41F7qMqzHsKUTtZZS/mAxDd8Nq5vNLLBJRCpddOt+t
 heoWzQywPjTnSpqvcGPhI+LyXVa5VGCQGyAI22DEXlHgzVFBuapwivswcyy117HFfAM7DWhDFsH
 ooWjcwsAAtz0NPkYgoA==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b414af cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5BVL746LnNak5i1nQvMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_134425_210295_E6682EA5 
X-CRM114-Status: GOOD (  15.54  )
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


On Wed, 04 Mar 2026 10:02:21 +0100, Bartosz Golaszewski wrote:
> NOTE: Each patch in this series can be picked up independently into
> maintainer trees.
> 
> CONFIG_OF_GPIO is a switch that enables the compilation of the gpiolib-of
> module. The module itself handles GPIO lookup via the OF-node tree and
> is automatically enabled on all OF systems. It does not export any
> public symbols to drivers. There is no reason for them to select or
> depend on it in Kconfig.
> 
> [...]

I'm picking up the ones that were acked and will send a smaller series
addressing the issue pointed out by Guenter.

[02/14] arc: axs10x: drop unneeded dependency on OF_GPIO
        https://git.kernel.org/brgl/c/d2cd20f7c2a4e4bf4fca844c01e925b112c5a2c5
[03/14] powerpc: drop unneeded dependency on OF_GPIO
        https://git.kernel.org/brgl/c/dd1cdfb20e44e295512080dea508771b6a1f1c0a
[05/14] regulator: drop unneeded dependencies on OF_GPIO
        https://git.kernel.org/brgl/c/bf017304fce10933f18fafe140bf749fb9672058

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
