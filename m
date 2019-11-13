Return-Path: <SRS0=eCxK=ZF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56761C43331
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Nov 2019 03:41:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21E49207FC
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Nov 2019 03:41:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZMugvkrn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Tzuprlip";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="hBDHtQLE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21E49207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=coJATMbt2zAPRpkNAEpn0Pd2ydc++P9hCSLEQRUKpCQ=; b=ZMugvkrngoxcif
	cnLuFtZxPK8mOaIqqhNJny72LcAitTikL5zcEhOXZV5GjQZBVNfOSKeFxZPh7usg3/RtGJUbzTeJR
	lE2mH3S9Rxsc5323HDE/dKV2H8PsPZzMYEuapvZX7Mz6bOJ+ccwhDr2rcOD8qwWHLUOHUhMnuT+Zq
	jg08+7wanH6RyTJMWCeoI/IGrHt0Gpz0w+WUZd4hKcw5Wlz8wyaSHKcP4Z3QeblKOaAlLcXOAEIL+
	L80us6rri0gznvYjpm3cUI5GnLpRaNaxwztZSbuV7SF4GRUqlJb+1ZoxzbL75rNEl4kXEnbpjTi7g
	UpJyPPVflCujo68TtpRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUjXV-0005WX-EM; Wed, 13 Nov 2019 03:41:53 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUjXS-0005Vu-2x
 for linux-snps-arc@lists.infradead.org; Wed, 13 Nov 2019 03:41:51 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C0A21C0E56;
 Wed, 13 Nov 2019 03:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573616508; bh=+t67LCehzvWKooDj8FUQDyGGGQlzshVG6o8F2O7FznQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Tzuprlip5bnoDyRb0a7iQyG5tFtAe8s9R2m6I2Cq5Bm35DpqDrvrbPYbJZD+bT4zh
 RxseQb8nDw7fkpFxI1dmbUiYCKbKLHrrJNdr5/Jw4vFZgArJa7cwnOSGgYl5x9OSbz
 LRTCaqVG67S6qazOGfMZiqGbPsi9tntHMRotkyO6Dv9TNuq8XJbNKbpdHanFmdW9+/
 5gwyJmKLQhNQYkM1rohawV5zbFw/mxDtHj8oqW/AykiS+UuZkdlIw9kSInELspQjZW
 AuPtUTwADOxAOh54AWH3TBGvNCR+jwkgij5pxFFt12IHrnuJeuVE0mEvLBMLy/VKLn
 UJQXrbbEJco8w==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 43266A0066;
 Wed, 13 Nov 2019 03:41:47 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 12 Nov 2019 19:41:47 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 12 Nov 2019 19:41:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWTiZxedVrPORoTvTFhLy3TjoEODgTNzUMFdlxLfsdqgv3/vW3yA/ZlJnctuXBTx4Mj9X8jc8Mkd0T5r3bSBvaDJ8ek4OCIFQ1V1bYzAwM1ltUm5GzMszfES3X1l4vgbdSm9FcKc8oAeJTn+rZTvq8WYqs6dH+SLB71NVCcLTuG/emPuuDkt0CbLLPDU7tW80X4KW2QauX+SnC+WKI16U76SMwc0cUrhIhdbz0FTBdSEuZOETh2TCr9Nj/4PXCHqF5+sZBd7e2nEu8urOnyp9PfNk0QK9yIaFJ7pd1z90EgdQNVqO1MDk0kfj91pJhi350CD6ZoPWN+t1ZYlh4Pk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+t67LCehzvWKooDj8FUQDyGGGQlzshVG6o8F2O7FznQ=;
 b=eJOlwMD3NP7rFktjqwM2EgEGIPVc8cVO4hpwkLs38uoyrRsAvYO74WVLu7P1xxIqMhW64qr3feFUWSLGzflPJyo4WxuwLjPPyZTmVafAQqwVWmSdE8Dj3uLq78/jMBLSzN6cV3HG3JbegrJ5cS/ga/FNyCXH7SUl/UMg8/eJWjELkji4VucjwNa8Jxvr14TKe6Y496up4WotmZQRQPFmyRM/YOeBQrn8qsMiW/pVx2N6Anj0cAZmjAW1VyzEnw6cdCvw2EkhcUmpFo62OOwC/xVUO169hNm4+7che/NLsCTHJcy7z9S/+vxjLtgVulmT227vrGLifWzw4UB/oGd0mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+t67LCehzvWKooDj8FUQDyGGGQlzshVG6o8F2O7FznQ=;
 b=hBDHtQLEoASRiPtTNEbmVJ7L8cfUevNFdnMaTg/pLgh41obEauFIMPv3BEyKxY3y50WZDuLgVc8BWy3Wv041hmmg4qrHjsB94xnyPcKdojGzF9UrjrNl/Hq6Kw/6c9EyUfgIYBqHFZllS3suypR6ktJUthwc1xBQewUsXZPjunY=
Received: from DM6PR12MB4089.namprd12.prod.outlook.com (10.141.184.211) by
 DM6PR12MB3209.namprd12.prod.outlook.com (20.179.105.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Wed, 13 Nov 2019 03:41:45 +0000
Received: from DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd]) by DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd%5]) with mapi id 15.20.2430.027; Wed, 13 Nov 2019
 03:41:45 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "buildroot@busybox.net" <buildroot@busybox.net>
Subject: Re: [PATCH v2] toolchain,glibc: Allow ARC big endian glibc builds
Thread-Topic: [PATCH v2] toolchain,glibc: Allow ARC big endian glibc builds
Thread-Index: AQHVk/9xWYC4UTc+j0ymgfspUqLwOaeIgIoA
Date: Wed, 13 Nov 2019 03:41:44 +0000
Message-ID: <6c2f89b6-763c-c286-d901-f31adacc092c@synopsys.com>
References: <CY4PR1201MB0120ABDDCAB8033A0268CDC1A17E0@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20191105173502.11553-1-vgupta@synopsys.com>
In-Reply-To: <20191105173502.11553-1-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [24.7.46.224]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e35847c9-734e-48d6-83a2-08d767eb67b2
x-ms-traffictypediagnostic: DM6PR12MB3209:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3209F7EDADE18F033F42F881B6760@DM6PR12MB3209.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(376002)(396003)(136003)(39860400002)(189003)(199004)(86362001)(107886003)(229853002)(5640700003)(6512007)(6486002)(6436002)(65956001)(66066001)(65806001)(6916009)(2351001)(31696002)(4326008)(81166006)(8936002)(99286004)(81156014)(1730700003)(8676002)(3846002)(2906002)(6246003)(2501003)(6116002)(54906003)(66476007)(58126008)(305945005)(7736002)(76116006)(186003)(14454004)(486006)(2616005)(66946007)(66556008)(64756008)(66446008)(102836004)(256004)(26005)(5660300002)(476003)(478600001)(11346002)(446003)(76176011)(36756003)(31686004)(71200400001)(316002)(71190400001)(6506007)(25786009)(53546011)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR12MB3209;
 H:DM6PR12MB4089.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yKlwOE6S+wGyl5+rsUJy2zoYl3YYXpmWmf5ju8zSvqMhUg5YzYsyZIq5ReLtDb+l/nljyhXUAW3QclNr3M68IvlcuL6zAgqafpuQcOGrhgWgyvJuEdZHrgcZb9wFWvWiwsY+VwgjK6UNr43Lryesmlyk9IxHZzwacdluqQGODdiI4oWxeE1MZGCiZrDjOM58SfNlPauUjMiS3dIUBlBpYA+LxmFLgCHtY58Iwa+nOwCAB+zheLr8tewEZs7XSUtpbgA78m/Dh8sX94AR5WO6kNaRJCc6v55S4q4szNHe3tRXSLK1eGUG9rLeBvCGDaInaLpaNfKOnYRdXI1xVHL/Gs1r5lMicfUV4JIctDlLFwiW/uWWzdhbvxKpc4ARAZLcaKnFKUxrRfSXgvZGLSG8RkpCanyGQlxKirx/Mxr36k0T2SknyMvdDgNHTvH0jehY
Content-ID: <A22DFC8260A7E547B51F742BA2E578D0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e35847c9-734e-48d6-83a2-08d767eb67b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 03:41:44.9588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QgtDG5jRL8mvQ0R9ijv+cK/n0YCQimzVVvnVtKEeDQbTuTvXQQF+nq3iPu551oCadjHUpiHFUB+zXZ0snYr6hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3209
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_194150_199038_491390F5 
X-CRM114-Status: GOOD (  15.80  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Ping !

On 11/5/19 9:35 AM, Vineet Gupta wrote:
> Apparently big endian glibc builds just work, if we let the endian
> header allow that (which prev was #error).
> 
> So this patch bumps glibc to version which fixes the header (this
> hopefully will become arc-2019.09-release) and then enables arceb
> in glibc toolchain builds
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
> Changes since v1
>   - Use BR2_arc iso BR2_arcle && BR2_arcbe
> ---
>  package/glibc/glibc.mk                  | 2 +-
>  toolchain/toolchain-buildroot/Config.in | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index d46063c5d111..754408881397 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  ifeq ($(BR2_arc),y)
> -GLIBC_VERSION =  arc-2019.03-release
> +GLIBC_VERSION = ec681dddfa99894513c85da7d5d257b60d04f915
>  GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
>  else ifeq ($(BR2_RISCV_32),y)
>  GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index c0612bf04176..327314585b8e 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -48,7 +48,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
>  		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
>  		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
> -		   (BR2_arcle && BR2_ARC_ATOMIC_EXT) || BR2_csky
> +		   (BR2_arc && BR2_ARC_ATOMIC_EXT)   || BR2_csky
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
