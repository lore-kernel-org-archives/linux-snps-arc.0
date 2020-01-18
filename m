Return-Path: <SRS0=ZCzF=3H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4746BC33C9E
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Jan 2020 00:53:14 +0000 (UTC)
X-Greylist: delayed 213 seconds by postgrey-1.34 at mail.kernel.org; Sat, 18 Jan 2020 00:53:13 UTC
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eI0Yh+ZD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VXPq+JGi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="JGtSpZ+b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE0B122464
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE0B122464
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Jan 2020 00:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QH4OUhDyR+XFAlnwYa05/vat0bfuI9Yptbp8IsETucY=; b=eI0Yh+ZDa3Yasm
	kmQL1p7Q+ZG5LLGhFYQ1HBz3/lZ5v7zqJ1HmuGMUglIT3MSTy6ELtZxY9GOPPhWpgOcfkXGXihDNv
	GP7UGzarK9EXLWUU7aFScQZ1OqhV2rXAR+o6vMH3xM44NL2HSeNyW7sioQCDvrMQn4+0Ra+0XstwY
	BKkqbFjqzOt6NTMNFSzaxyLQcVeD3IzkStj4ZzgXn5/nq8+d9njtD4kOULl1cp5tKVijK7yPIxgOw
	zUWGi1pPduB9Ca2x61pvEJvgSO8QVqm6YjI3qXdM/PB189dy3hihIzKaHLF11FYqnRGPQfbpmrv/p
	CxF5DdhPCoCkBNNVaOjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iscM7-00031G-1z; Sat, 18 Jan 2020 00:52:51 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iscM4-00030w-A8
 for linux-snps-arc@lists.infradead.org; Sat, 18 Jan 2020 00:52:49 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C5D3FC00D3
 for <linux-snps-arc@lists.infradead.org>; Sat, 18 Jan 2020 00:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579308767; bh=cXk/7YPSYOVtKSzt2GnKkn/aRlWstbbKm4qcu9c/OSI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=VXPq+JGi21w4LI5JfuHjeyU4QksCvfKskCItro6jsBZpzOvCMMiG7Rss2esp+Qvm5
 coVaVJCBN9EWPZrJNrV9tGPjRLwqJA+SMokUa2WwXTb/A1A7TPOh8HRuELYA0sPi6l
 q5PNrVDioKSy7JL7EAlWaT+Qp+l4Szil6SunCELulZfea0zNpxH8bAdidJMfe5S+ZZ
 e+gvBAQawywXSfmYRYCfMwtD6uA54Cp1sTxH6ZHZkCaPTdgOxln1nJC9H8E2Cm/6gd
 GkyXg+9ZhrO4ZkrcbqCNk9kRjTRB8305EMIkt5YZVmu8Jt1e5VDMz0yZVNz06FNKxz
 NJeiOEegJ3XrQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 867EDA0067
 for <linux-snps-arc@lists.infradead.org>; Sat, 18 Jan 2020 00:52:47 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 17 Jan 2020 16:52:46 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 17 Jan 2020 16:52:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJJfVhPHVypa9OAmN25JXBIBqKqx964Mj2fVToLkuoY4DgPQXVrEgjVnz2dJY48iM73NI+iOYUnkFBySDECRcnqAqk11JkbGDGTd+9LtVNcG6nzVmuzRv6YO3wGYmTMTogiBAWm0mbnSbzCRPWuylKdjhGhE0isOarzFGZDJLRbGr9t7/G70KIVbdUR1TH0OEI7n++sKv3CW2EQddQamvgOmU/Dyz0OuhRPRoxXnNklafdNUN9X5cbQBzoIZ2bq4DCPS8llTSAnTDPonzqjJt/cGHVSGv6JCXDrtdedtrfEgu87tfoiS8+2i4X/oYww70tI5yJXIYgq/b+f/qZq6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXk/7YPSYOVtKSzt2GnKkn/aRlWstbbKm4qcu9c/OSI=;
 b=mcEAdKALLt5B7e/0ZDeXwkx5rhjdGRFLubq4PmQdPNJtU6KoYuH9Hw8xZIGetc5hvioiC31Ivzgyx/zhSv4To5gKrRyL/XfraJEmD5bHwp8MNMCTUMYfQFMoAsbLqi+woazv7hIfnMyy+h0utcAdwAUjsc53GndfNklCgdjqNS2ID6PYp/bssqMuZtRZkD0yGgqPjR5XeShQ+Nfsbx63bEKaDtPzEZ89eb9P/kE95xzDgAft0dN6RlHxrz8dslftcCXLtGpUFxP4dFPEF+IEo5Nkcc5MqWzJ0oVKHs3/9jrVBIRBPcorvMUFFbuEpJJM/zvOXWYgJPcMvE0DvpjplQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXk/7YPSYOVtKSzt2GnKkn/aRlWstbbKm4qcu9c/OSI=;
 b=JGtSpZ+b46qOC83zdYMA96HNrI6lCLMde7o0nekkYDyVyA1COVAOll78EL+cJqoSyyT+aAb3nkiYtBV5Sfz9Do78pXPQB8GuoAC1iBoIslo6uyxXPKbLcX1nDHIRSV1of8ZkEIgCEj9snx6zX98aiYAnbHns62WB8r7XpA2P5hQ=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB2615.namprd12.prod.outlook.com (20.177.125.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23; Sat, 18 Jan 2020 00:52:45 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2644.023; Sat, 18 Jan 2020
 00:52:45 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] ARC: fpu: preserve userspace fpu state
Thread-Topic: [PATCH] ARC: fpu: preserve userspace fpu state
Thread-Index: AQHVzZkvvM1ELL5hOkO48rYSB65z2afvmAIA
Date: Sat, 18 Jan 2020 00:52:45 +0000
Message-ID: <9fd48331-d7c2-b1e4-89a7-88f8f8b6ce90@synopsys.com>
References: <20200118004905.30201-1-vgupta@synopsys.com>
 <20200118004905.30201-3-vgupta@synopsys.com>
In-Reply-To: <20200118004905.30201-3-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e643e213-0b21-46bc-5702-08d79bb0bb2b
x-ms-traffictypediagnostic: BYAPR12MB2615:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2615413EC7A349096A7AE6B3B6300@BYAPR12MB2615.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 0286D7B531
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(136003)(396003)(346002)(376002)(199004)(189003)(8676002)(6512007)(31686004)(36756003)(71200400001)(8936002)(81166006)(6916009)(81156014)(478600001)(107886003)(4326008)(5660300002)(66476007)(64756008)(66556008)(76116006)(66946007)(66446008)(6486002)(2616005)(31696002)(316002)(4744005)(86362001)(53546011)(6506007)(2906002)(26005)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2615;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yQ8I626aaTpJSXowBidYLg0vC+87CUz7Pbk1js0o1QM+gTpk0Enm17ZmQGwm89pCfIzB/XlensLqKbb2vldgQciBMLpq2fiWxR4YemU5e72q65Rd9tjqhpG65ODmMHxVxW3/rhigJX3jTim/H84jFu6McsZlKjnebptUGU19g1VdtR6a++E+u0HDG0m6QP7nbI5yPUqYNYYG0N/3ccO6Iyjojvny1h4zj4xr0Wj4nIA+pQwOhOFFs+SLUQvtC/Fx0SvXm65SwYvMQUs36KytcejMyQpA6G27/MC6J3+s4tI/dBAGQiJofTP4x/aaQ7UWWVGbH1AkrU9CC587a0E+YFKYQLT7z5+XTw4uM5daPfWLnef9yWRy8Pk9v1hh5IOm7EXzE4anJoN7MEtQ5byT4EXnjnGfJOFlirtN+9tkZmi8y90CZGFRC9aMJRVk0PRU
Content-ID: <905943AA17D56F4C814B92B7A62EF6CB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e643e213-0b21-46bc-5702-08d79bb0bb2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2020 00:52:45.2323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /PDNwUF5c8aZQrTRvki0qtR++j07qCOfezvSWGEO45xzPI5EfKvdQRPb0Ba4g+u/TkDKZZF8/v2qUbPir9dYOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2615
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_165248_609782_B0E0AD74 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/17/20 4:49 PM, Vineet Gupta wrote:
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  arch/arc/Kconfig                 | 15 +++------
>  arch/arc/include/asm/arcregs.h   |  2 ++
>  arch/arc/include/asm/fpu.h       | 54 ++++++++++++++++++++++++++++++++
>  arch/arc/include/asm/processor.h | 10 +-----
>  arch/arc/include/asm/switch_to.h | 17 ++--------
>  arch/arc/kernel/Makefile         |  2 ++
>  arch/arc/kernel/fpu.c            | 28 +++++++++++++++++
>  arch/arc/kernel/process.c        |  8 ++++-
>  8 files changed, 101 insertions(+), 35 deletions(-)
>  create mode 100644 arch/arc/include/asm/fpu.h

Please ignore this stray patch - this was before i split it into the 2 pieces !

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
