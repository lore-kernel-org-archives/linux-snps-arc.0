Return-Path: <SRS0=4mcz=5W=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77274C2BA17
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Apr 2020 18:55:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C2C206B8
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Apr 2020 18:55:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sliPUWCV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="f2gJ1P5j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Iqf69WXQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C2C206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uL0stYuGrqj44uiXWEUIs3LfqpjqW8ExJOUsLzS1H3U=; b=sliPUWCVjh0GI3
	/TzL6n8bjpXsKjDsrjR1JW1GDeekVj7b2/NIocdO/hjJDbRVf4zB4Vqq2qQJRv+lf9Xma57PW4/pb
	oNmxDc8QYWwMdUJYhjvanGjXUnjiEsE06pBj7PNZpOXsEP5ix2HeGU6QUkUWy7o2aehOdfA5IGqEv
	CPsXiJPTdgSnBSHDsQApQuvYI6yepPRciMuh4fVz7r6tYpFVi53gNgnCuV7k+w+G8rofreMtprKJE
	ZPT8npq66TZzG9zgaQorUzw90sxqgJ7g7xDcWHrLwX8WY/rRWrzkCXFRJSRQnDK7Y3EvxphyZHzDK
	iZRF8gQNGEL+VEkZT+HQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLWts-0007js-Eg; Mon, 06 Apr 2020 18:55:12 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLWtq-0007Rl-ER
 for linux-snps-arc@lists.infradead.org; Mon, 06 Apr 2020 18:55:11 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4104340503;
 Mon,  6 Apr 2020 18:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586199310; bh=QFk8y5AwR/eEB4m86AmjNKRKiynX7pqS9UNZbimtoQQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=f2gJ1P5j6Hvy9uaYKiiukscxiV4/c7jQKnoIjvI35vDeKxvfwYmyzgrB5wJF7AGvd
 Brxxuao5siclI1QyYk14avN78YAdZ6ndZpw9q60hIgQijfS97/U9VErH23T7pFy2fV
 cvE7vT2xcxa7SO4m6nS6AUMASAFTGYMO/QHoUVEOnxc3Kh+vydd8fDRaowFtkRYp+9
 BbEcXlCu0PyWVpdUC/Kkga3Ocsn2n2s/5q7VVwKLpNTebph3sbvfTPPSWr/nofN0gw
 vQTGsU8qOljM6yZD29T+itNKqdDr1thf/YJGN82DLfG+UN1RON9yS8/f8TEDqwCZfA
 /rn6UwNvSoHrg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2BC4AA00B4;
 Mon,  6 Apr 2020 18:55:10 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 6 Apr 2020 11:55:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 6 Apr 2020 11:55:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMKYbSSZbS05f0uagjYVtJlB87/9jmKw9tQPRTbAq+OZahRAm1FDa/v1P99D8flmsB9OiNY2IpJjHK710bfOmzDN7UEXD+4Foc7hVxHTIESx5UJsEhpHCq4EK3R4peQDm6yMfGdf+Mq3tygLn/Ohw1chVPH8PXWEFP6hXI/REhfiyl5hu+FQ4BzNTqBbceOrePtPVGx4hlxBv9lYiIvpRVrOs6JXj0O4w+qvDgLClQFVWOyj2/dlEpvEPqXaTlYYzEvTpPIfYf6e1Ag1swnrFrimSMsSXnMocsLmwaLg+Yn53fXcu4kwK5xakkqH0JBedxDiC2ihi88R5y6B7jpqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFk8y5AwR/eEB4m86AmjNKRKiynX7pqS9UNZbimtoQQ=;
 b=E657uBqPsWQ7/8dsaHWPknNWogtOQ3eULgVOd41CxmH1Ai/swa9j0VjfrDK/Ak5vvn4n0RQAlJyKR50GkdxAfnYpG84PGYTwqZXaXsvndOGmZIF0RsflaNGTRJezU856XEOw7rqlJ6kyBVk9D5kyvgGjsbdDrdGVRpBH2jHkbhx3weT37q6zsKdlVFM//Rfwz7kGyp2FV+l/sltv1h56uQjqwJLRhBdsAYYKb/Hm1dSd1uOplMJq5KgnYJTCZo+2wh5RnO3+nloY8o/hP0M2UgcizM0mbCftf2xT6xBT35sJU0bMAR0Cp6G2A7V6gXKyW5StDv4AlsHTlMKPF2rHWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFk8y5AwR/eEB4m86AmjNKRKiynX7pqS9UNZbimtoQQ=;
 b=Iqf69WXQwjlVoBjQxZE2EFaNwmih0VelKJixC+DVFrbnta2XqkgDmHbZBYjSM9QMLMMxTD66fOTf+V9nOZI+ZLhvK4RPg/C8ZjHmBy3bVA1HxrBSnFhRkG7xPIhqPwjEDYg3Jp5AV3yitidDnNhFHQicvnokCi7eVDoWV3uzJ+4=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2597.namprd12.prod.outlook.com (2603:10b6:a03:6e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.17; Mon, 6 Apr
 2020 18:55:08 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2878.018; Mon, 6 Apr 2020
 18:55:08 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v2] provide y2038 safe socket constants for
 default/asm-generic ABI
Thread-Topic: [PATCH v2] provide y2038 safe socket constants for
 default/asm-generic ABI
Thread-Index: AQHWB6PqYTbfA7IijUqRmITzYdB8aKhseoAA
Date: Mon, 6 Apr 2020 18:55:08 +0000
Message-ID: <7ba99a07-381e-af29-e0d7-4484e25dbcac@synopsys.com>
References: <alpine.DEB.2.21.2003312122350.30236@digraph.polyomino.org.uk>
 <20200331213208.22543-1-vgupta@synopsys.com>
In-Reply-To: <20200331213208.22543-1-vgupta@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 1313b0d4-682e-426b-03fd-08d7da5c073b
x-ms-traffictypediagnostic: BYAPR12MB2597:
x-microsoft-antispam-prvs: <BYAPR12MB259775AADC2E90583376DC66B6C20@BYAPR12MB2597.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:632;
x-forefront-prvs: 0365C0E14B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(396003)(376002)(346002)(136003)(366004)(8676002)(26005)(316002)(66946007)(81156014)(5660300002)(6916009)(66446008)(4326008)(76116006)(186003)(66476007)(6486002)(2616005)(64756008)(8936002)(2906002)(81166006)(54906003)(36756003)(6506007)(31686004)(478600001)(86362001)(6512007)(53546011)(71200400001)(31696002)(66556008)(41533002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ob9duzb5/r+1rO+34YfvjJTmuGI/gAYJgYDmzYePv11YVRLZbYqBMJyZeD0s0GBguQ9XBQMfmz1yazWlYE42QIyQcgPaVJNXcxu3bwGER85ON75UX5s55UUJH/QB425xk78cfbLaGd5rIb7FNr3BxIFiTMBIvoPnOrY6fPLfc6noLWLay8VgNnc4oNIGR63proMui5v1dn+cPuBWmBjobaHBp+SlIuydLmq5cGaqP8UAMKx2omx9BuCbsGtzOfPCAAjFRlzDFpZIO4So6TRQ0r+2oxvWZwHD3TMUNw5FXsrR+Yi7tHxiatQU1NGT/q4BTFrFdIpev1tCV4s79QpSfJLeE0x94KPGoBBFhH1MdDGhUFUKXp+gxjQID81ElMklqBPo0Fyefz4evlZobIZQ7PJWVXHWd8k6KzIRUl7HAJgTuUAFUzoAUaZWoYTkSvhCyLbQ2s6Fg8pHf6hxLPDF3nDZz6h2DnRJTZ/avegI5Juvjv0NT+EDG6EFNIhA6p8Z
x-ms-exchange-antispam-messagedata: Eg5CJClWps0ZWF9+WvuD8uxEVFAj0H4+lYusCL+gXrWA9k88Mfj0ITJgXXm6Lu+rtk5nJ4lMVvA86dDY0utDzlvuFw0NLaAJqC6QZi4QCzxNxolyqjLCg5UKzWKh5NE+s7HNxUZ+1di0Sqw02gA+hQ==
x-ms-exchange-transport-forked: True
Content-ID: <C61F1EAA954FAF41974CE0BB00403981@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1313b0d4-682e-426b-03fd-08d7da5c073b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2020 18:55:08.8039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GwVs0Hu8i3afg6kxCvVOO+KLeOzh6EIHdaWzrVw/SmjV8tQWrhAJEDQLIgj16CdL5sl9pIHIbTrDXxm1du+dkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2597
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_115510_523144_96727EF4 
X-CRM114-Status: GOOD (  14.25  )
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
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/31/20 2:32 PM, Vineet Gupta via Libc-alpha wrote:
> These will be used by upcoming RV32 and ARC ports and any future ports.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

ping !

> ---
> This is a straight copy of code originally written by Alistair, hence
> adding his SOB as well
> ---
>  sysdeps/unix/sysv/linux/bits/socket-constants.h | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/sysdeps/unix/sysv/linux/bits/socket-constants.h b/sysdeps/unix/sysv/linux/bits/socket-constants.h
> index 9dcc19cd5380..d02e1cbc7cf1 100644
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
> @@ -30,9 +32,19 @@
>  #define SO_OOBINLINE 10
>  #define SO_RCVBUF 8
>  #define SO_RCVLOWAT 18
> -#define SO_RCVTIMEO 20
> +#if (__TIMESIZE == 64 && __WORDSIZE == 32 \
> +     && (!defined __SYSCALL_WORDSIZE || __SYSCALL_WORDSIZE == 32))
> +# define SO_RCVTIMEO 66
> +#else
> +# define SO_RCVTIMEO 20
> +#endif
>  #define SO_REUSEADDR 2
>  #define SO_SNDBUF 7
>  #define SO_SNDLOWAT 19
> -#define SO_SNDTIMEO 21
> +#if (__TIMESIZE == 64 && __WORDSIZE == 32 \
> +     && (!defined __SYSCALL_WORDSIZE || __SYSCALL_WORDSIZE == 32))
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
