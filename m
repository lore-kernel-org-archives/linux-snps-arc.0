Return-Path: <SRS0=TLQJ=5T=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0726AC43331
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Apr 2020 22:00:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9BF9206F5
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Apr 2020 22:00:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sEikF/yY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fU2mbi/J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EJTDPuYt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9BF9206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LL+EIuVqmLD1V3iPLxUwCFer0zcQuUjH4EQyrHOrJZY=; b=sEikF/yYHwc6Va
	8yQCrhDIUCTlBExkrecTAATgAC8kTguc9Sq4JTA3IPdkaWUitJLFWZvHikZXVAKAez5x3wFXOd+9R
	A71aM/3PEtjPoVcNpCXIbLtn/zYKP8pOG/uV4OPEWuGWvy8RQpZfp9Zdl7gily78OlacAqD3CfgX9
	SiyQo+ejjsTBCVYx8PzaEHbw8aIpDvWSa/i6vf3ZUJ6wTFLYVFerm/SyxxKbxDUbUyL96gvppt+wm
	R4Ji51milh0nta+aYoqV0RRMC9rTZtvORVRaIBTw8IIg52v5On8F8M8vaaihvO++iHVOif6DOj6uK
	qb9L0z1iwbywNmosPtDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKUMF-0006KS-Ob; Fri, 03 Apr 2020 22:00:11 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKUMC-0005Ip-De
 for linux-snps-arc@lists.infradead.org; Fri, 03 Apr 2020 22:00:10 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AAD96C0096;
 Fri,  3 Apr 2020 22:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585951206; bh=xeoKf2NT+Dnyg0AvEw5NamxbJx7PD7Cxx/KksBf8avE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=fU2mbi/JTMjY6t+kwQfWi7FfnUGDM8swKgOhUPxrAu5UNDQKjTRo0N+l/XYVzwQGt
 ylj4SVIOyhUh6TYZQOV5fdcoXGySgSRQaALVH9RgWBAVbBtyPrnYSsJs8M4feO5lZU
 /9FGHeNkcRmAP/NOUD/TO2s3meQejYolkAc0BX21v7hIGCOyFhFPyfNp/p5kth6lKk
 kwmKeSKc9Bq7ryaPW4OL7VUue9JkX2LzP8I+9O4J0BRkxFfY34Qepd56BtEiubZFvw
 yLL+p4rv39npI1M/CFEzKGPhXLVcZz3jrgm3TZIuV0XlM34V8S32U8wxugzLckU797
 X1p7pxn9xoOZQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 13C81A0072;
 Fri,  3 Apr 2020 22:00:03 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 3 Apr 2020 15:00:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 3 Apr 2020 15:00:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLGDJJDiGcS60fZfxBVMd04/hSFrr93HHFCvVGK1Vj/BOlC2l9QSvdwhvk86kOyRC9U5GM1FV2VAsebIFH9YTSIO+9dOoCnYmXwlYRMbGes/5vQrQQf2Bvj2JAUP41rPtpHVMnnr4SjapSWs7b6E8i5shFjC5eAoMFLSjmsnZQ4t6T9oPFMXngPc3U8qglHMZAV5+i/OOwM82cLJgIKkcM+CtODCPT5ceIaGA59f9Uq+TRUILlYjdXAdJpUtbxV3PmG2MF7Mr/oAnivaRbSB3ejpX/urAn+tEW5ggLzAkrMEAPkrD72BWXiUxDq2PvK26C+iMrGNWez5YKazz1MS7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeoKf2NT+Dnyg0AvEw5NamxbJx7PD7Cxx/KksBf8avE=;
 b=Bw64w1eLyJUOkWGxVDARZE6lXyhCbWZvnuo2GTrtefGyheEf4jlSk3Lg51WIC7q5sLcQz89dC5NXGflT4f7McmAmJdTPEsLjAJOJkKBjpyVjf1FNSGfB/ijLGe6aB2LE2G/ckhFr0Z64AOhftqkgm2DiVW4tub1zNrYlCh0s9CQ94NjDb72GpB0lOd30OsOTiVNFfClMrPJSoZC9FSCT5F64/xzFYR5sP5n+d3OHa0x0FDrdyKZ225RhF+TBuednfHAIWkKj79igp3nbaHkfII538e4/bO9pOtvdCZ983G8kn+sz3zx92SXu+lyttlJnpaLq1cPjA3m3z1hOaJpmtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeoKf2NT+Dnyg0AvEw5NamxbJx7PD7Cxx/KksBf8avE=;
 b=EJTDPuYtn4bLpqFtx2uOwxOA1qvUmmRI366/kW2BZdWoeEog5JngJBHsyHp6LkrVv2A7RnU8cL9DMBBbH8T8c6LfUmOa1FktQjgk5b4dZM75PT5Jjzc3K8xY2bWdSDVsRLuoFGkTCYVWBxF/xDbg+XB1mtHenoYayuLjTlZQgNE=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.19; Fri, 3 Apr
 2020 22:00:01 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Fri, 3 Apr 2020
 22:00:01 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] ARC: Fix ICCM & DCCM runtime size checks
Thread-Topic: [PATCH] ARC: Fix ICCM & DCCM runtime size checks
Thread-Index: AQHWCRfcKCnfYlxDV0y863/IP8FliKhn9D+A
Date: Fri, 3 Apr 2020 22:00:00 +0000
Message-ID: <e6d6dcb1-9bdf-fab1-75d6-379b6d04dac8@synopsys.com>
References: <20200402175428.18823-1-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20200402175428.18823-1-Eugeniy.Paltsev@synopsys.com>
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
x-ms-office365-filtering-correlation-id: ae1b7644-9fde-4a8a-ddb6-08d7d81a5b67
x-ms-traffictypediagnostic: BYAPR12MB3176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3176A9989ACCB63CC4E6E207B6C70@BYAPR12MB3176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0362BF9FDB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(366004)(396003)(346002)(136003)(376002)(86362001)(81166006)(66946007)(478600001)(31686004)(54906003)(53546011)(6506007)(31696002)(2906002)(66476007)(66556008)(64756008)(66446008)(316002)(76116006)(107886003)(26005)(81156014)(2616005)(4326008)(110136005)(6486002)(5660300002)(6512007)(186003)(36756003)(8676002)(8936002)(71200400001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XLn5chdsbcwdxkaotHOPrGZvjZ4UAjJie2NTwEiiRH3v6COY8CZtCoKeZlUGYUFHcbgxlFrZ6IIzINIGguShCfou4RNQpIaCj5dtMBEFdIeW2KZ1Q2s5Wcu3uekV8c7+GqFU0Ndt3+a3aLozrDV6JHlciWO2KJbLeHnP1dN0dJUIUG57RcN2wz0pOY9+YDeokT5gz5fm7SYlevumlBn4kAQK1fTKcsDhVLwPu5Nypohg9wyOR2GNmL3mzV2SHsYcZyP+a04R9/FatUaGSeaNlXgmXL3LVKwP0BkO5gTm1XvYu8P9WaWpnzuxDCc8YVPaKB4lY74EdsSmCBRlsLbLW70vCf3qVN6IWLs33WBfzkU3dEZhm1etK+xpHcMu2cvH/JGeFN4Hgv2vA0Up77YEi/92kTRJfN9ztWjlEiWVVF1IA5kPDnkzvNoWCVyKY3A0
x-ms-exchange-antispam-messagedata: UQkhZh/oB7G6oeytf1Z7YBSVuCDcs6dW6TDIC+IkdbEcFkNiXshCqLuhqvECLFecjuNQVTjuPfcwjxVWR1FCUGpYRwTCBwCoF1h1po6ZM6NfkXQhNMYoXYRJTT1tHrQHCWUY1Akkd9VSp6DftFUW7Q==
Content-ID: <8CB6C1E884A29D4AAFD29AB46D781BA8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1b7644-9fde-4a8a-ddb6-08d7d81a5b67
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2020 22:00:00.8348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q8LldBcb366+3HQe+ewrjalU0kJ2j1YCex2/g6WURlCkjPKVhPE0u5reSICRuUUQgZ6gLlget5BX+u94951MtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3176
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_150008_565524_3933AE8D 
X-CRM114-Status: GOOD (  17.06  )
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
Cc: Alexey  Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 4/2/20 10:54 AM, Eugeniy Paltsev wrote:
> As of today the ICCM and DCCM size checks are incorrectly using
> mismatched units (KiB checked against bytes). The CONFIG_ARC_DCCM_SZ
> and CONFIG_ARC_ICCM_SZ are in KiB, but the size calculated in
> runtime and stored in cpu->dccm.sz and cpu->iccm.sz is in bytes.
>
> Fix that.
>
> Reported-by: Paul Greco <pmgreco@us.ibm.com>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>

LGTM. Will be added after merge window !

Thx,
-Vineet

> ---
>  arch/arc/kernel/setup.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> index aa41af6ef4ac..efdedf83b954 100644
> --- a/arch/arc/kernel/setup.c
> +++ b/arch/arc/kernel/setup.c
> @@ -11,6 +11,7 @@
>  #include <linux/clocksource.h>
>  #include <linux/console.h>
>  #include <linux/module.h>
> +#include <linux/sizes.h>
>  #include <linux/cpu.h>
>  #include <linux/of_clk.h>
>  #include <linux/of_fdt.h>
> @@ -409,12 +410,12 @@ static void arc_chk_core_config(void)
>  	if ((unsigned int)__arc_dccm_base != cpu->dccm.base_addr)
>  		panic("Linux built with incorrect DCCM Base address\n");
>  
> -	if (CONFIG_ARC_DCCM_SZ != cpu->dccm.sz)
> +	if (CONFIG_ARC_DCCM_SZ * SZ_1K != cpu->dccm.sz)
>  		panic("Linux built with incorrect DCCM Size\n");
>  #endif
>  
>  #ifdef CONFIG_ARC_HAS_ICCM
> -	if (CONFIG_ARC_ICCM_SZ != cpu->iccm.sz)
> +	if (CONFIG_ARC_ICCM_SZ * SZ_1K != cpu->iccm.sz)
>  		panic("Linux built with incorrect ICCM Size\n");
>  #endif
>  

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
