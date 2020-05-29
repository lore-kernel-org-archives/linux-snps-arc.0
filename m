Return-Path: <SRS0=GdQW=7L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADF7C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 21:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04AEC206A4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 21:13:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tFBn8lmg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Jr+G7u41";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QXF2L7/a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04AEC206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k/BNNAAuJxk3NLo32AIR+79wUzj+chr4FLs3UuJkoVk=; b=tFBn8lmgbVGI7j
	91ywdoD+EZnGBbzeVBq5eo/M33B2EKUOfq75b1h0M3cmlySQOy7gEBTliGOIo4viLlUWIgRdm/Lii
	EuMys5n0OLSciBDXdCkwIbmlLRPKnTtUUHVx5zPR3OJzW7PRG9azv37IzLr6YHr1Mgts2d0onlUxc
	p47eAjzGggZcZqyahL6lEnMu3LSz56YUk8xCTZQk8I7Oo+rZAqbQS5vOvK+ewUoGuzqL8WvKGiD/7
	PyD59cqkaELiNT3pHwNkk2BqNt2/UkPnpiePuhBEg+NpInDHHyumGpsht4I9dBiKEgGpPLgUns2KZ
	ikbMt7ODE2j6MvBXe5Pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jemK4-0003mj-5H; Fri, 29 May 2020 21:13:48 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jemJv-0003eM-3F
 for linux-snps-arc@lists.infradead.org; Fri, 29 May 2020 21:13:41 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5492540954;
 Fri, 29 May 2020 21:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590786818; bh=DZlD13KRz01iZjWq6jbdE8Wp5MHyxFRutIvYDT0k6RY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Jr+G7u41cMXjWmZ+28+pRUTNfMrLORm2qKXWLKw6+tyuYE1JTocozWhxe7/I/PLuQ
 wC9kdLmPgTnyhGVfdQd3CcKyg/fPQ3EOmECweXpiQh5hvk2/xvWhaK7+EevPTfpQNT
 tR++5mkxgsohqlrZr09gG81aajFQj5zxYICJSes6TZojOAqT7MjdLwMVrKrFBrjSPo
 NmrezVL1X+y9JA35M2MNe08vhlabhTWwWQgbkE0I/FvFPZFhT9UH+Zt+FbrQCvkhD7
 6nfFSHvUUlYLzuplQny3yDoQbIgKI9o1+jpcbnyqEHDbZgaCDBUZRB9G5dqIzUOG0L
 0/3GFFQTaDTGQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 41877A006D;
 Fri, 29 May 2020 21:13:38 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 29 May 2020 14:12:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 29 May 2020 14:12:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CknDvk5wE4/5O9oCDvWSe06IO4aF2C6NGlmUuyNkdE5+CFs9P0t9DciDFwaH9S/1Rl1I5TlHkPIg0MNI7lMloxcczmr6ghfngaiKCYQFVovznhJUJlf4QwzrY9dxYme+6WgNOkoMFfVrug3STgMBfVtwGhrrowgTX+/EeWB6PF78e6yWlS4RZilQz2zW82zbiQXASizZ7s4a42wFNyFGtYTxaGpH2MePMAA6JVS0hRt3xJ0pCkxq+WYEfZoJ3jpnrHcnWQJ+DSmZZGStZd7a/xfZKpvTGcZjBHgPadvzlE3iWZDZ7naxr2VSwE9t3r4d91GukEskCWRClM/4O2q8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZlD13KRz01iZjWq6jbdE8Wp5MHyxFRutIvYDT0k6RY=;
 b=K13r8QCmu9HAraSGwdhp37W/PyuZJLRnfTAUVDsagSEs3bk0EB9akYiWot64cyI/wwCFMzgSiGnAzRY1kfa5ICuqmIO4S7Bi6J6IyNpX7Q6XhM8gCNB5PnyGmAHeq9VpiQlgtSICODJ5jcROYRZr2DkVWx+wbwXVvCXbjNtrd4T5PtS5ujW+CydZeJaVTI1E/lkCVBB4o6wr3KgMS4aNjg0f9PtV6gOLKO3iNo6tnvLwVIsrEtyHhTiUrJIBPqRsmcW6CH7nzOaExC8SvxWZkUFBQaUTzQniF9exZk4HON+zmvqkrckC+k/NBMrP8F1M4N+hv8RRnIFEaxGfhq29wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZlD13KRz01iZjWq6jbdE8Wp5MHyxFRutIvYDT0k6RY=;
 b=QXF2L7/a9l5iwOp47kiV+l3Afczskuu4fJ48fIKyHeRLwJ9av8+mUUzyP4ColUp8RlmkeLXsF88rIcstUBcH/T3dWjH0Hkw70lXButvf3Ofdlmj0McSVrOdhPCIP0Z4ILsoW9E6ZjnKJNxLFUL2kVN+XZtQu/nhJMF9FOKThRUI=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3511.namprd12.prod.outlook.com (2603:10b6:a03:132::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 21:12:00 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 21:12:00 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH 3/3] ARC: [plat-hsdk-4xd] initial port for HSDK-4xD board
Thread-Topic: [PATCH 3/3] ARC: [plat-hsdk-4xd] initial port for HSDK-4xD board
Thread-Index: AQHWNbAvzpsMMWNQkEymClD4bFX7Lqi/kDIA
Date: Fri, 29 May 2020 21:12:00 +0000
Message-ID: <b60c4a56-0d52-79a1-425f-a458baf84287@synopsys.com>
References: <20200529115534.22883-1-Eugeniy.Paltsev@synopsys.com>
 <20200529115534.22883-5-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20200529115534.22883-5-Eugeniy.Paltsev@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 605d1664-2ff9-49bd-ea56-08d80414eda3
x-ms-traffictypediagnostic: BYAPR12MB3511:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3511FAD586E7E52628FDAA99B68F0@BYAPR12MB3511.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: thAFOpwh4dtqdONivF9ctlLMJTW/07QU04ZEu41GUcSA6U3qoD7ZIMTD+OpEQX+67LdoK4jx5n984Cm0XRa9EagIxLuVdlczpYGsp4VGsAZM8cu4jug77S83QvuLXB2FDE24pWm6m7c7IEMF9u9o//9j+fF8SgPIuAm050bUiK2wOvo97Tg6KpWtnVtlop44jhr4tSF4bnpz9Q46B3RDUMk71NlZqDvdRj7qnL+3vYp+m4K32nlGUj7hgJ4LuOjhKYjqSy5f5rU+3ZSLUcPryIVmIfBcrFqXBbH0j7sj5Sndd1JYTlP9W5ir8b20zotxIeDKsjuDCLUD5GOuVihn24GMnfUw1csRCQdmT8UFajSdK0bGmIH6w4qM09q5+movE85XKGBEcCTZn1HxPJIM0QQgUzvdL5sZy2FbGQsiKgwRvQI0f+SfRh7aXG33f2d7YRdcCu4TFBFTMAvIZVe2TA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(39860400002)(366004)(346002)(396003)(53546011)(71200400001)(31686004)(31696002)(6512007)(6506007)(26005)(4326008)(5660300002)(30864003)(186003)(316002)(6486002)(66946007)(8936002)(76116006)(54906003)(66476007)(110136005)(64756008)(66556008)(66446008)(478600001)(83380400001)(2616005)(2906002)(36756003)(86362001)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ZaFJlQz3rcKZOvv5AitjUNe+MRPXRjjcxRQQdD0GixJeLSXwACCkeUKWHb9BHR/R3V8aIyLPdOyVvCLMPN3dRLyEG2UjBs0XjZYEn9Pb2fqu8HzH/WpFKKkid/tR1SU45Vs1isbQJcpNhZGTZ2AOGTWalibpja66pL/bY4wjumx4iaEYriNn+St86AH+gkYXwimPFSl21jZ0Y397a4q81rPXtFFHRJKjfLssJtxO3H98zxnhTNS4Msa7NF0KrC+eorWVjaRLZQUGOIfDqyAYZfnLgg7j6Tak8TpfyEJPK4P2nxStjzhyJYFAdgFscK58nW/FE8cG8ktD04MWHYDtuKsjBMPYgyjO5og/C73XlkJ71ENwrSGEArzj2yrYuj5JG/Nkc3P8cFpnejVTWt807xU6zABKpB3c0sJ653rH7RADff0n6S62nREuH9qFRTvmzfA9xOz555s/Wj7i+j/y5R4+0fC0u+xlVUaBSCNk7o0=
Content-ID: <BE0A9C02B09F2C45AD269149DB96F93B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 605d1664-2ff9-49bd-ea56-08d80414eda3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 21:12:00.3595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRT6Tjw7/HtYh+NgBZL+kukV8ueGphABXaVcVr+5VPHPfpIs+GrlJacwKFDyq6JaWsB7tLOx4s1WvpzIeKwSZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3511
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_141339_189442_D010B50B 
X-CRM114-Status: GOOD (  25.11  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

+CC Rob H (it seems the CC in patch didn't go thru)

On 5/29/20 4:55 AM, Eugeniy Paltsev wrote:
> This initial port adds support of ARC HS4x/HS4xD Development Kit board with some
> basic features such serial port, USB, SD/MMC, SPI flash, Ethernet and others.
> 
> The HSDK-4xD board has much in common with its predecessor - HSDK board.
> However HSDK-4xD has some differences in comparison with its predecessor:
>  * based on quad core ARC HS48/HS47D processor (instead of quad core ARC HS38)
>  * has ThinkSilicon GPU (instead of Vivante GPU)
>  * has ARC PGU and HDMI output
>  * has separate SDIO controller for WiFi module
>  * has additional timers with clocksource independent from CPU clocksource
>    (required for DVFS)
>  * has performance counters interrupt
>  * other minor stuff
> 
> NOTE:
> HSDK-4xD and HSDK may share significant part of DTS so we can move this common
> part to one .dtsi file (as we have done it in U-boot). However we have quite
> enough out of the tree patches for tweaking HSDK DTS (patches in out
> verification flow, patches for run in simulation, etc...), so I'd prefer to
> keep HSDK DTS untouched. That's why HSDK-4xD DTS is created as an separate file.

I agree we need a different version of DTB for wiring up perf interrupt and gpu
(whether full copy or common parts in a dtsi I don't care). But just curious if
the "other" mods to DTS were temporary "hacks" for various testing things or do
you intend to actually productize/upstream them at some point. I mean you can
alsoways create a local copy for those and point your .config to it, do that is
not a reason to create a new dtb !  I know this is bike shedding...


> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  arch/arc/boot/dts/hsdk-4xd.dts      | 322 ++++++++++++++++++++++++++++
>  arch/arc/configs/hsdk_4xd_defconfig |  99 +++++++++
>  arch/arc/kernel/devtree.c           |   1 +
>  arch/arc/plat-hsdk/Kconfig          |  24 ++-
>  arch/arc/plat-hsdk/platform.c       |   6 +
>  5 files changed, 451 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arc/boot/dts/hsdk-4xd.dts
>  create mode 100644 arch/arc/configs/hsdk_4xd_defconfig
> 
> diff --git a/arch/arc/boot/dts/hsdk-4xd.dts b/arch/arc/boot/dts/hsdk-4xd.dts
> new file mode 100644
> index 000000000000..2b7f76a01e3e
> --- /dev/null
> +++ b/arch/arc/boot/dts/hsdk-4xd.dts
> @@ -0,0 +1,322 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2020 Synopsys, Inc. (www.synopsys.com)
> + */
> +
> +/*
> + * Device Tree for ARC HS4x/HS4xD Development Kit
> + */
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/reset/snps,hsdk-reset.h>
> +
> +/ {
> +	model = "snps,hsdk-4xd";
> +	compatible = "snps,hsdk-4xd";
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen {
> +		bootargs = "earlycon=uart8250,mmio32,0xf0005000,115200n8 console=ttyS0,115200n8 debug print-fatal-signals=1";
> +	};
> +
> +	aliases {
> +		ethernet = &gmac;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "snps,archs48";
> +			reg = <0>;
> +			clocks = <&core_clk>;
> +		};
> +
> +		cpu@1 {
> +			device_type = "cpu";
> +			compatible = "snps,archs48";
> +			reg = <1>;
> +			clocks = <&core_clk>;
> +		};
> +
> +		cpu@2 {
> +			device_type = "cpu";
> +			compatible = "snps,archs48";
> +			reg = <2>;
> +			clocks = <&core_clk>;
> +		};
> +
> +		cpu@3 {
> +			device_type = "cpu";
> +			compatible = "snps,archs48";
> +			reg = <3>;
> +			clocks = <&core_clk>;
> +		};
> +	};
> +
> +	input_clk: input-clk {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <33333333>;
> +	};
> +
> +	reg_5v0: regulator-5v0 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "5v0-supply";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	cpu_intc: cpu-interrupt-controller {
> +		compatible = "snps,archs-intc";
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +	};
> +
> +	idu_intc: idu-interrupt-controller {
> +		compatible = "snps,archs-idu-intc";
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +		interrupt-parent = <&cpu_intc>;
> +	};
> +
> +	arcpct: pct {
> +		compatible = "snps,archs-pct";
> +		interrupt-parent = <&cpu_intc>;
> +		interrupts = <20>;
> +	};
> +
> +	/* TIMER0 with interrupt for clockevent */
> +	timer {
> +		compatible = "snps,arc-timer";
> +		interrupts = <16>;
> +		interrupt-parent = <&cpu_intc>;
> +		clocks = <&core_clk>;
> +	};
> +
> +	/* 64-bit Global Free Running Counter */
> +	gfrc {
> +		compatible = "snps,archs-timer-gfrc";
> +		clocks = <&core_clk>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&idu_intc>;
> +
> +		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
> +
> +		cgu_rst: reset-controller@8a0 {
> +			compatible = "snps,hsdk-reset";
> +			#reset-cells = <1>;
> +			reg = <0x8a0 0x4>, <0xff0 0x4>;
> +		};
> +
> +		core_clk: core-clk@0 {
> +			compatible = "snps,hsdk-core-pll-clock";
> +			reg = <0x00 0x10>, <0x14b8 0x4>;
> +			#clock-cells = <0>;
> +			clocks = <&input_clk>;
> +
> +			/*
> +			 * Set initial core pll output frequency to 1GHz.
> +			 * It will be applied at the core pll driver probing
> +			 * on early boot.
> +			 */
> +			assigned-clocks = <&core_clk>;
> +			assigned-clock-rates = <1000000000>;
> +		};
> +
> +		serial: serial@5000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x5000 0x100>;
> +			clock-frequency = <33330000>;
> +			interrupts = <6>;
> +			baud = <115200>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +		};
> +
> +		gmacclk: gmacclk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <400000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		mmcclk_ciu: mmcclk-ciu {
> +			compatible = "fixed-clock";
> +			/*
> +			 * DW sdio controller has external ciu clock divider
> +			 * controlled via register in SDIO IP. Due to its
> +			 * unexpected default value (it should divide by 1
> +			 * but it divides by 8) SDIO IP uses wrong clock and
> +			 * works unstable (see STAR 9001204800)
> +			 * We switched to the minimum possible value of the
> +			 * divisor (div-by-2) in HSDK platform code.
> +			 * So add temporary fix and change clock frequency
> +			 * to 50000000 Hz until we fix dw sdio driver itself.
> +			 */
> +			clock-frequency = <50000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		mmcclk_biu: mmcclk-biu {
> +			compatible = "fixed-clock";
> +			clock-frequency = <400000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		dmac_core_clk: dmac-core-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <400000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		dmac_cfg_clk: dmac-gpu-cfg-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <200000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		gmac: ethernet@8000 {
> +			#interrupt-cells = <1>;
> +			compatible = "snps,dwmac";
> +			reg = <0x8000 0x2000>;
> +			interrupts = <10>;
> +			interrupt-names = "macirq";
> +			phy-mode = "rgmii";
> +			snps,pbl = <32>;
> +			snps,multicast-filter-bins = <256>;
> +			clocks = <&gmacclk>;
> +			clock-names = "stmmaceth";
> +			phy-handle = <&phy0>;
> +			resets = <&cgu_rst HSDK_ETH_RESET>;
> +			reset-names = "stmmaceth";
> +			mac-address = [00 00 00 00 00 00]; /* Filled in by U-Boot */
> +			dma-coherent;
> +
> +			tx-fifo-depth = <4096>;
> +			rx-fifo-depth = <4096>;
> +
> +			mdio {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "snps,dwmac-mdio";
> +				phy0: ethernet-phy@0 {
> +					reg = <0>;
> +				};
> +			};
> +		};
> +
> +		ohci@60000 {
> +			compatible = "snps,hsdk-v1.0-ohci", "generic-ohci";
> +			reg = <0x60000 0x100>;
> +			interrupts = <15>;
> +			resets = <&cgu_rst HSDK_USB_RESET>;
> +			dma-coherent;
> +		};
> +
> +		ehci@40000 {
> +			compatible = "snps,hsdk-v1.0-ehci", "generic-ehci";
> +			reg = <0x40000 0x100>;
> +			interrupts = <15>;
> +			resets = <&cgu_rst HSDK_USB_RESET>;
> +			dma-coherent;
> +		};
> +
> +		mmc@a000 {
> +			compatible = "altr,socfpga-dw-mshc";
> +			reg = <0xa000 0x400>;
> +			num-slots = <1>;
> +			fifo-depth = <16>;
> +			card-detect-delay = <200>;
> +			clocks = <&mmcclk_biu>, <&mmcclk_ciu>;
> +			clock-names = "biu", "ciu";
> +			interrupts = <12>;
> +			bus-width = <4>;
> +			dma-coherent;
> +		};
> +
> +		spi0: spi@20000 {
> +			compatible = "snps,dw-apb-ssi";
> +			reg = <0x20000 0x100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <16>;
> +			num-cs = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&input_clk>;
> +			cs-gpios = <&creg_gpio 0 GPIO_ACTIVE_LOW>,
> +				   <&creg_gpio 1 GPIO_ACTIVE_LOW>;
> +
> +			spi-flash@0 {
> +				compatible = "sst26wf016b", "jedec,spi-nor";
> +				reg = <0>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				spi-max-frequency = <4000000>;
> +			};
> +
> +			adc@1 {
> +				compatible = "ti,adc108s102";
> +				reg = <1>;
> +				vref-supply = <&reg_5v0>;
> +				spi-max-frequency = <1000000>;
> +			};
> +		};
> +
> +		creg_gpio: gpio@14b0 {
> +			compatible = "snps,creg-gpio-hsdk";
> +			reg = <0x14b0 0x4>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			ngpios = <2>;
> +		};
> +
> +		gpio: gpio@3000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0x3000 0x20>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			gpio_port_a: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				snps,nr-gpios = <24>;
> +				reg = <0>;
> +			};
> +		};
> +
> +		dmac: dmac@80000 {
> +			compatible = "snps,axi-dma-1.01a";
> +			reg = <0x80000 0x400>;
> +			interrupts = <27>;
> +			clocks = <&dmac_core_clk>, <&dmac_cfg_clk>;
> +			clock-names = "core-clk", "cfgr-clk";
> +
> +			dma-channels = <4>;
> +			snps,dma-masters = <2>;
> +			snps,data-width = <3>;
> +			snps,block-size = <4096 4096 4096 4096>;
> +			snps,priority = <0 1 2 3>;
> +			snps,axi-max-burst-len = <16>;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x40000000>;  /* 1 GB lowmem */
> +		/*     0x1 0x00000000 0x0 0x40000000>;     1 GB highmem */
> +	};
> +};
> diff --git a/arch/arc/configs/hsdk_4xd_defconfig b/arch/arc/configs/hsdk_4xd_defconfig
> new file mode 100644
> index 000000000000..bf78f745a0f6
> --- /dev/null
> +++ b/arch/arc/configs/hsdk_4xd_defconfig
> @@ -0,0 +1,99 @@
> +CONFIG_SYSVIPC=y
> +# CONFIG_CROSS_MEMORY_ATTACH is not set
> +CONFIG_NO_HZ_IDLE=y
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_PREEMPT=y
> +CONFIG_IKCONFIG=y
> +CONFIG_IKCONFIG_PROC=y
> +CONFIG_NAMESPACES=y
> +# CONFIG_UTS_NS is not set
> +# CONFIG_PID_NS is not set
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
> +CONFIG_EMBEDDED=y
> +CONFIG_PERF_EVENTS=y
> +# CONFIG_VM_EVENT_COUNTERS is not set
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLAB=y
> +CONFIG_ARC_SOC_HSDK=y
> +CONFIG_ARC_BOARD_HSDK_4XD=y
> +CONFIG_SMP=y
> +CONFIG_ARC_TUNE_MCPU="-mcpu=hs4x_rel31"
> +CONFIG_ARC_DSP_KERNEL=y
> +CONFIG_LINUX_LINK_BASE=0x90000000
> +CONFIG_LINUX_RAM_BASE=0x80000000
> +CONFIG_ARC_BUILTIN_DTB_NAME="hsdk-4xd"
> +CONFIG_JUMP_LABEL=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +# CONFIG_COMPACTION is not set
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_INET=y
> +CONFIG_DEVTMPFS=y
> +# CONFIG_STANDALONE is not set
> +# CONFIG_PREVENT_FIRMWARE_BUILD is not set
> +CONFIG_MTD=y
> +CONFIG_MTD_SPI_NOR=y
> +CONFIG_BLK_DEV_RAM=y
> +CONFIG_SCSI=y
> +CONFIG_BLK_DEV_SD=y
> +CONFIG_NETDEVICES=y
> +CONFIG_STMMAC_ETH=y
> +CONFIG_MICREL_PHY=y
> +CONFIG_INPUT_EVDEV=y
> +# CONFIG_INPUT_KEYBOARD is not set
> +# CONFIG_INPUT_MOUSE is not set
> +# CONFIG_SERIO is not set
> +# CONFIG_LEGACY_PTYS is not set
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_DW=y
> +CONFIG_SERIAL_OF_PLATFORM=y
> +# CONFIG_HW_RANDOM is not set
> +CONFIG_SPI=y
> +CONFIG_SPI_DESIGNWARE=y
> +CONFIG_SPI_DW_MMIO=y
> +CONFIG_GPIOLIB=y
> +CONFIG_GPIO_SYSFS=y
> +CONFIG_GPIO_DWAPB=y
> +CONFIG_GPIO_SNPS_CREG=y
> +# CONFIG_HWMON is not set
> +CONFIG_THERMAL=y
> +CONFIG_REGULATOR=y
> +CONFIG_REGULATOR_FIXED_VOLTAGE=y
> +CONFIG_DRM=y
> +# CONFIG_DRM_FBDEV_EMULATION is not set
> +CONFIG_DRM_UDL=y
> +CONFIG_FB=y
> +CONFIG_FRAMEBUFFER_CONSOLE=y
> +CONFIG_USB=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_EHCI_HCD_PLATFORM=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_OHCI_HCD_PLATFORM=y
> +CONFIG_USB_STORAGE=y
> +CONFIG_MMC=y
> +CONFIG_MMC_SDHCI=y
> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_DW=y
> +CONFIG_DMADEVICES=y
> +CONFIG_DW_AXI_DMAC=y
> +CONFIG_IIO=y
> +CONFIG_TI_ADC108S102=y
> +CONFIG_EXT3_FS=y
> +CONFIG_VFAT_FS=y
> +CONFIG_TMPFS=y
> +CONFIG_NFS_FS=y
> +CONFIG_NFS_V3_ACL=y
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_ISO8859_1=y
> +CONFIG_CRYPTO_ECHAINIV=y
> +# CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_STRIP_ASM_SYMS=y
> +CONFIG_SOFTLOCKUP_DETECTOR=y
> +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
> +# CONFIG_SCHED_DEBUG is not set
> +# CONFIG_DEBUG_PREEMPT is not set
> +# CONFIG_FTRACE is not set
> diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
> index fa86d13df5ed..81f881af7356 100644
> --- a/arch/arc/kernel/devtree.c
> +++ b/arch/arc/kernel/devtree.c
> @@ -27,6 +27,7 @@ static void __init arc_set_early_base_baud(unsigned long dt_root)
>  	if (of_flat_dt_is_compatible(dt_root, "abilis,arc-tb10x"))
>  		arc_base_baud = 166666666;	/* Fixed 166.6MHz clk (TB10x) */
>  	else if (of_flat_dt_is_compatible(dt_root, "snps,arc-sdp") ||
> +		 of_flat_dt_is_compatible(dt_root, "snps,hsdk-4xd") ||
>  		 of_flat_dt_is_compatible(dt_root, "snps,hsdk"))
>  		arc_base_baud = 33333333;	/* Fixed 33MHz clk (AXS10x & HSDK) */
>  	else if (of_flat_dt_is_compatible(dt_root, "ezchip,arc-nps"))
> diff --git a/arch/arc/plat-hsdk/Kconfig b/arch/arc/plat-hsdk/Kconfig
> index ce8101834518..3bf80eceebae 100644
> --- a/arch/arc/plat-hsdk/Kconfig
> +++ b/arch/arc/plat-hsdk/Kconfig
> @@ -3,10 +3,32 @@
>  #
>  
>  menuconfig ARC_SOC_HSDK
> -	bool "ARC HS Development Kit SOC"
> +	bool "ARC HSDK or HSDK-4xD SoCs"
>  	depends on ISA_ARCV2
>  	select ARC_HAS_ACCL_REGS
>  	select ARC_IRQ_NO_AUTOSAVE
>  	select CLK_HSDK
>  	select RESET_HSDK
>  	select HAVE_PCI
> +
> +menu "HSDK / HSDK-4xD options"
> +	visible if ARC_SOC_HSDK
> +
> +choice
> +	prompt "HSDK board type"
> +
> +config ARC_BOARD_HSDK
> +	bool "ARC HS Development Kit"
> +	help
> +	  ARC HS Development Kit based on quad core ARC HS38 processor
> +
> +config ARC_BOARD_HSDK_4XD
> +	bool "ARC HS4x/HS4xD Development Kit"
> +	select ARC_LPB_DISABLE
> +	help
> +	  ARC HS4x/HS4xD Development Kit based on quad core ARC HS48/HS47D
> +	  processor
> +
> +endchoice

You also need to update existing hsdk.dts to add CONFIG_ARC_BOARD_HSDK

> +
> +endmenu
> diff --git a/arch/arc/plat-hsdk/platform.c b/arch/arc/plat-hsdk/platform.c
> index 0b961a2a10b8..74e2508cfd1e 100644
> --- a/arch/arc/plat-hsdk/platform.c
> +++ b/arch/arc/plat-hsdk/platform.c
> @@ -331,7 +331,13 @@ static void __init hsdk_init_early(void)
>  	hsdk_enable_gpio_intc_wire();
>  }
>  
> +/*
> + * As we aren't going to run HSDK-4xD Linux image on HSDK and vise versa let's
> + * don't add additional machine entry but instead add new compatible to existing one and
> + * resolve all differences in compile time with #ifdef's.
> + */
>  static const char *hsdk_compat[] __initconst = {
> +	"snps,hsdk-4xd",
>  	"snps,hsdk",
>  	NULL,
>  };
> 

I don't see how the comment above relates to change. Infact the change *does*
potentially allow one image to run on other (with say old DTB).

The change itself is good ether way as  ARC_SOC_HSDK ties both tof them together
and we don't need a different machine array.

Since I don't have the new board yet is there a technical reason we can't run the
image for old board on new one (assume I don't care about the GPU and ignore perf
interrupt).

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
