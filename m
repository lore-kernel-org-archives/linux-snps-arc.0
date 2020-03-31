Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F75C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 19:25:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F377212CC
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 19:25:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RyLXdiya";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QHUuzmEA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ArkVVZOM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F377212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=naa8NlVjkMLy0Hc8N/BidKl0863LwKKYIMla6c+haYg=; b=RyLXdiyaRxiqUm
	Fdemy++mpkEec2a4l/Fq6SJFHpD207q1YGZOxtBdeWCYh3T9v06YyxQkV2o86BlxnvrEB+M4L4QMX
	K4Z5qhckG8oE6HOruSYqO1SrfHWFNy1yeWSKso4xhUkh/XwuitvZ6V+FwSKeChdhycBABrl5X9D2v
	Rynn9qo5RkN6DiOEj4sG2bIgV+2APaacr9ZUbfLpqGdUhJS6Xx+gwxGiSz5lKCDqKdX0sr+ifaRqb
	S0274UhCAKvPXZmNOIqR6iDIzTCtBZA4li0Agl5KqxIAuY+4rOwitq4Z2zDiXXHKu+9/U1ZyukiQH
	AWqgGyhqtjrRAl8jDseQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJMVM-0003jJ-Oy; Tue, 31 Mar 2020 19:24:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJMVJ-0003hq-QY
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 19:24:55 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 971E243B61;
 Tue, 31 Mar 2020 19:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585682692; bh=5yPc7j+/2yQd+Cq6IkP4sWfv+6eu8udT8W80ATwNys0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=QHUuzmEAJ0y959Xf0rzLINJaUvHq2lYJS0HcF+K17SdIvxiEt+bCa8BCv1V2Qo60x
 3BIcnd4orgNQTOXgo2KZpoYuEsYFRSrW/py8W5Oycpe7moztAxFxtO5XwBQfWekoPu
 FYCEkdooxsreNnJt/CY1w41Bvm7f8ronk6ge4tLGCIierlRlyKxlsy92idOK4H6e6L
 deRpBi8Zzkp8RnUj5aNohHiGlse0+9WL+vogLjw0QVBzXl+WvUjUuipZ3wRoL/vsUs
 JF8XCzWFLhAd+KWdG8QOjUv8ot6Dmctx0UyNwespPr4leWlv5FaHyp0QfhiLZxDj8d
 +lb+y323VPvPg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7FF13A006E;
 Tue, 31 Mar 2020 19:24:47 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 31 Mar 2020 12:24:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 31 Mar 2020 12:24:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WscdOgMaI+z9tUOwLr0uFMl+Y+HWWVTnBk6lsNvctBOADQsDW1IAwHKZ8XrWbRDL2EZifNijV+QKmg3iyCHHcXpvu1PKDIt2XM184ELvXCwJeX0HR87jIrbDv+l5xqvp0mFAvjqqJfTEU9VPLZV/UxhUS8ADQuNwO9tSnqmp2Qo/lbpoV6NmW0SWpBfmX3ayngDIIQhxMA5tLcZX/wQy8Ifua/iQaA0aTHzk6m53RskY9eTKVCkpz8r0TTXXGNPU98K6MJuQFMjtQxswlXKyq3M+3MkkOGZHv7SXUpN+WoDEaXtNLp/jfyVsBCzwLixThqTOEe+9gaBOxIi5Ja0nOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yPc7j+/2yQd+Cq6IkP4sWfv+6eu8udT8W80ATwNys0=;
 b=lBpLmOOBeV7UOcdJvyPgNN5iMmhMSfpUXxajk092YULNqoFapAmzJopEYxeKUJIL3397FMgSfDFS0EStLlgufzFJy5BWY/ZlhunM7YNtPbFeGdRqWbuHzL4UxvKv2bLdnzP7mhsqQmtqLRZpwK4l8HAzRedIeux371ApZP650g5qii/B3vm7Nd7nGhsGNOhL8MOZYF9LpGndaDcyk0iTrWbkD5BGT4F7rFLRfGZXyntI3qfUSuMUp5pLP1MkSRqYN8HWO0UBnQb6KigMvTE313lWDK/tFngtzEerQctP4ACxXYf21n6O1z6R5L1N4gqflMAPjVNJTAnO6OiorSnhhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yPc7j+/2yQd+Cq6IkP4sWfv+6eu8udT8W80ATwNys0=;
 b=ArkVVZOMOOPutrCygIApqN5xl8ZHOYa7dAm4U+yI1MYUZvTr1uafO+7lYoX3908PzZIhhPsS8LPYk8ptPblXACH+ESI4x+joxTaqSromr3oWmBuvQS0g4/wsMeU6veEVWE6PHF5IV6nnY/zXbp1R1T++QorD6oVtJxgEqV7dCro=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3288.namprd12.prod.outlook.com (2603:10b6:a03:130::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 19:24:43 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 19:24:43 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH] provide y2038 safe socket constants
Thread-Topic: [PATCH] provide y2038 safe socket constants
Thread-Index: AQHWBYDbfeMGxKt7Gk2A7SsJcwT4aKhjGQwA
Date: Tue, 31 Mar 2020 19:24:43 +0000
Message-ID: <8a1f8ccd-8136-acc2-0ed6-da9398fbaeef@synopsys.com>
References: <20200329041612.4071-1-vgupta@synopsys.com>
In-Reply-To: <20200329041612.4071-1-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:2878:237:6628:fcbe]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 856055be-ddb4-4b8a-d702-08d7d5a92a5a
x-ms-traffictypediagnostic: BYAPR12MB3288:
x-microsoft-antispam-prvs: <BYAPR12MB32881346F8BD03179A72ED87B6C80@BYAPR12MB3288.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:497;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(136003)(366004)(39860400002)(346002)(396003)(6916009)(81156014)(8676002)(316002)(81166006)(478600001)(6486002)(71200400001)(31686004)(6512007)(64756008)(54906003)(66556008)(66476007)(66446008)(5660300002)(6506007)(76116006)(2616005)(66946007)(86362001)(2906002)(53546011)(4326008)(8936002)(186003)(36756003)(31696002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5zAdztm0PfDaDx7qon+QG9J354ng21XxvsPbNTMl7r6A9m9U/lUKgm+b3zj9ZBrqy0f1fqUN7rUv4wNdXtRL2WHkRKKQGH0jkj+7z9Anog7aQT+eURbryzLL4r7FceXh2G1nBC6Oa6rMqQM3V8M7HUfPrFY1q6gELC+cN2GrxUAIHYbruy3KdvbjumjpHy4EBayOdV1/3BvU37xChXLJc4RI+qPHczJj9O8BqTMlMyok+AwvK1b0RyMg1eVpeUbjRaf9gyDcw4Z7nLlMM8XMhe1XYfqbCL96625bRY9LPNwErDcG2JPa0cXRwL0x0zpBvjEfhbzObhLw+xrT0iiEh/WuQchhz9K1bfOLXUrfITwibZNB+CSCUF/i6iHeq/AFHla2GgHMoDVAFbmXuOFS2dSWtm5DjQFkwQQKJaXDVfqWIqxzfuxFt9aTyYGQ3fUv
x-ms-exchange-antispam-messagedata: MYi6fWKMiNTat2DkwKcN8x984d50E1cUlO2LNahISysGCHP62qEBq1O3V81l1vnVdGPHE45UmiLHAhdw6Etc+qW9A+ZNxYpUrp95sFUYeCfzwM084q2+OJdy7GbYG8ZAQeq7T4niV/sY00hZLXON83w3UdpzA0BP1v7EsKPAT0uqo1FfM0F5Snt1IiYm6RYDV+A9GHNM0Jk+pBM7CCVaJw==
x-ms-exchange-transport-forked: True
Content-ID: <2416B5FEA9A4C444B9CEA618F2A92031@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 856055be-ddb4-4b8a-d702-08d7d5a92a5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 19:24:43.1650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ll0E1x8fLzvTYoVaXlFkHqKRU0Bw+fPZFKpZCa9/7KXXdVa1azVGZySM3JKKp574BxXRUJFmQffVgPj+ZL9Zxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3288
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_122453_898212_EB2CFE9A 
X-CRM114-Status: GOOD (  13.30  )
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
Cc: Stepan Golosunov <stepan@golosunov.pp.ru>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alistair Francis <alistair.francis@wdc.com>, Lukasz Majewski <lukma@denx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

ping !

On 3/28/20 9:16 PM, Vineet Gupta wrote:
> These will be used by upcoming RV32 and ARC ports and any future ports
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  sysdeps/unix/sysv/linux/bits/socket-constants.h | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/sysdeps/unix/sysv/linux/bits/socket-constants.h b/sysdeps/unix/sysv/linux/bits/socket-constants.h
> index 9dcc19cd5380..8a48ae7d0ca2 100644
> --- a/sysdeps/unix/sysv/linux/bits/socket-constants.h
> +++ b/sysdeps/unix/sysv/linux/bits/socket-constants.h
> @@ -20,6 +20,8 @@
>  # error "Never include <bits/socket-constants.h> directly; use <sys/socket.h> instead."
>  #endif
>  
> +#include <bits/timesize.h>
> +
>  #define SOL_SOCKET 1
>  #define SO_ACCEPTCONN 30
>  #define SO_BROADCAST 6
> @@ -30,9 +32,17 @@
>  #define SO_OOBINLINE 10
>  #define SO_RCVBUF 8
>  #define SO_RCVLOWAT 18
> -#define SO_RCVTIMEO 20
> +#if __TIMESIZE == 64 && __WORDSIZE == 32
> +# define SO_RCVTIMEO 66
> +#else
> +# define SO_RCVTIMEO 20
> +#endif
>  #define SO_REUSEADDR 2
>  #define SO_SNDBUF 7
>  #define SO_SNDLOWAT 19
> -#define SO_SNDTIMEO 21
> +#if __TIMESIZE == 64 && __WORDSIZE == 32
> +# define SO_SNDTIMEO 67
> +#else
> +# define SO_SNDTIMEO 21
> +#endif
>  #define SO_TYPE 3
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
