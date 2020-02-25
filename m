Return-Path: <SRS0=AhAi=4N=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D375DC35DEA
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 01:16:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99D7E218AC
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 01:16:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pAY6YAS4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="heLeMms6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="mF7DpeQ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99D7E218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPJYZpGnSVgBdtQoC0x3ah6Y4KvNZUB4f8U9oF61n8g=; b=pAY6YAS4f4KH00
	LnfywfvGjytNDy4CMUMN7zHMn6JRzQSycihp8WH4P4nQlTxDW51a2LiKJOgaH53MQ4C+RgGcMLt2d
	v+4sI2vXq34MQZ8bmkXpf3kvOkVXXDb2w5pExzR7/upj8dF5of0+y+zA8PtroW3kNazznTwoXJmng
	PNlCcrgsjaXTgCna1HOdizufPpFs7ZbuJmsQNdZBsqeXPw/7MQRz0E0EeonRDt9ZEDhmeub6TtHi1
	iftu7T4BTeN3rcUp9HSX7Ij3GDqlUkeEkYgSxBNKyB7ljKfmI9CfoUfw1IrRoJYAxWSkHHB7uZh4m
	D7pkEUgN1kCPnV0LGDGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Ops-0001o6-BI; Tue, 25 Feb 2020 01:16:32 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Opq-0001nf-3n
 for linux-snps-arc@lists.infradead.org; Tue, 25 Feb 2020 01:16:31 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C6898C0099;
 Tue, 25 Feb 2020 01:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582593389; bh=gwh4U0hrJwPrUu71kdY2t+sPPYu8MxADeTINl6FXXgQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=heLeMms6LVMjKjiLm4gJdxoonBJuuQWjNROObibyRyHEn1EZO9t4yIzuGIZ3uy6DG
 7+ur+vvM8Z0oGBu5tZhDs4jA2mPNd/8tzDwny4NvIfqiW2QLxbLalO40V63kRPXrhJ
 sekiaWDXTSU5o4wdnYBaTNZoFRkaKsdjSRBrwtMLxQBnFfp88mPam+Na/Tl16osbaG
 nDYXgR/z2jjkHIcg3H/lHMyFpeGZmngqQWxyPU7FunhbxM9cmYnjAbCee8Sviqg12t
 GBQpq5kacDXvfCzqwETSP7bxgzXjBRY9f8wRqHJvCygER7isZJ+E3dw3UUXDU8uyPH
 vxGL7ZIBhpKaw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2D4BEA008E;
 Tue, 25 Feb 2020 01:16:20 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 24 Feb 2020 17:16:20 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 24 Feb 2020 17:16:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQyNYtt/urj6itAPmN6kYMQD24HFjODiUYJcBg07RbK8r295kvJBHUu1gsu2U1gvthBBvDjAujut7sFORiysmu4s14UpN7Z7dwFXwPekIGgnR5wRCZDNn71JxL0dHNG25Ud5J/WULbwL0+gso84eUL5tRpqYotQaglMdoREYrv7nd1yOcFzy3h+JT0wlUXPkvJ07xYU/46nIYxiQJErtx50Cu3ZWhkS8Lq9sd/aOWQoQwAQEHvbpVPZLLdfbRLx6ioTWZT1B3GN+tIHcw+jl2mIk5d+oCXxVA7+BNb6qJQDh1w/GZcAb09G5MZYQT3V7W5EKXOHQLFBwQQHUftoZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwh4U0hrJwPrUu71kdY2t+sPPYu8MxADeTINl6FXXgQ=;
 b=I+i794ijuAHF0QYf6dvMVyA5DYWHEm4sI9whAkKx4h0/a7+gme3lbISMUZOAbEFIt8kYKvGaalv6sfzsFrX6gmvAxODj5rgMmsVSJdcnt8qyu44VZhOXFfs9QUq05PY6PpfyKwBLGB3bC2w2l6JxIA8mVtBMhh7xbm8+IGYUF8G1aElYKdVayZ9+7sHUutXVo4MgtDjaFATnuzE3huGtJokx9N+lIeeO/DC2cmsN4uYx3YelDGZDTFxUEEi/TipKhT4Y6tBVGdX2T+PUF7IN/Una+yUkyxvaj1ltdrrzb5wjWtZulIAgUIMlw6sYVExO1K9vbAgOXaIdaA1w4huZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwh4U0hrJwPrUu71kdY2t+sPPYu8MxADeTINl6FXXgQ=;
 b=mF7DpeQ92K3UAadOPEcANtNdvvI81HRxW9rCpYnytq92ZtUgrhk5Wqa9r2bn7KYOnFy4wj3WQw8zHfoF9wchh6U6BJ5lPyfFdEokMsYAqXJqSOkJlAJDWfnVvrg0yfl3TyTWVWba4CmbZGexi2tKnofOGQTDlbpiInfMxth6/VU=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2757.namprd12.prod.outlook.com (2603:10b6:a03:69::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Tue, 25 Feb
 2020 01:16:18 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 01:16:18 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH] Force 64-bit time based syscalls for TIMESIZE==64 on
 32-bit arches
Thread-Topic: [PATCH] Force 64-bit time based syscalls for TIMESIZE==64 on
 32-bit arches
Thread-Index: AQHV60EXsptB0BIT80udv3Wsyvdra6grFx0AgAAEvIA=
Date: Tue, 25 Feb 2020 01:16:17 +0000
Message-ID: <0b9ee43e-bf84-b472-12d6-1f6425abfd71@synopsys.com>
References: <20200224183413.13629-1-vgupta@synopsys.com>
 <CAKmqyKMLjb3rRh6n02_rL_fuh5cofBViJ7D1kNeD7r3rEYnkTg@mail.gmail.com>
In-Reply-To: <CAKmqyKMLjb3rRh6n02_rL_fuh5cofBViJ7D1kNeD7r3rEYnkTg@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 9066d5b0-7ecf-4f8d-b8bf-08d7b99050ff
x-ms-traffictypediagnostic: BYAPR12MB2757:
x-microsoft-antispam-prvs: <BYAPR12MB2757DEA43620CCFA2A04623BB6ED0@BYAPR12MB2757.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(396003)(39860400002)(376002)(136003)(189003)(199004)(8676002)(81156014)(478600001)(81166006)(186003)(31686004)(6916009)(26005)(53546011)(6506007)(71200400001)(8936002)(2616005)(4744005)(54906003)(5660300002)(31696002)(4326008)(66946007)(86362001)(66446008)(64756008)(66556008)(76116006)(6486002)(6512007)(2906002)(36756003)(66476007)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2757;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H3ZJQLfLg402ahTc4Wj81dTN+bpYFa+PhxP1FiOrlPFUwvPcvNnIw9TWHSwODZqyYU9N5huVYknrRH54rwr9BskTr6wJsfIkTxRlEBY2C4Ah7FHg33qxftSwa6Dly9PrXUP5P7qZtNW6ji3VityfwdgD0dZmVjHCUvgxLJgAFO75aGOiq6wJrD+hVSs2Pjm0a7pS8vf8XKizH91q8eWYhkAwwXaolPcPZyn2EALqaNng3/H3Ka0gaTDHqP5FRd68o2yFoXuLZiu8rf+6OEc6wPG+ezd9QOqPDNkERBY4thXXMBihZpt+GV2Q59+MgcdZLOry7H6dd6XUV+xNyM0sUAHP/MoQD5OlVI+ifSygRx+fcgHpdK+XNpkfJKJHbUJZAnUT8IAu1U8zMaZbe+R+bw9pBaMTO74X1Lmr9GK9SvVhRZqzTtSlspm97D+dbF/3
x-ms-exchange-antispam-messagedata: EZpCQVy6rhv4HJ4UUIg4fjeqwf+gfr+5pcothxpB5ZZJeePpLGLN/53roQ4IdhbEZuwbSg0nORhYX3N7FWga8Bap1Yqm669vtngIiHCNMoYhQ5TMZonaH1xhddqlRuWsYezzrJ6FoIdoUBqwneRdPw==
x-ms-exchange-transport-forked: True
Content-ID: <796ABB2EB8B1AA4585245E31050F25FC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9066d5b0-7ecf-4f8d-b8bf-08d7b99050ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 01:16:17.6113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sBh2KTI9/dntjt5Lbf8oiroqf2zqxJYu8vPuN4nXgnM2y73zAVJFBqWe8SiYAV31UVroxAk2D+mJHiePNRBeNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2757
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_171630_285111_C7A3868A 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>, Lukasz Majewski <lukma@denx.de>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2/24/20 4:59 PM, Alistair Francis wrote:
>> +/* Override syscalls for asm-generic ABIs with 64-bit time.  */
>> +#if __WORDSIZE == 32 && __TIMESIZE == 64
>> +
>> +# undef __NR_futex
>> +# define __NR_futex __NR_futex_time64
> I think you should do what RV32 does and wrap these in ifndef's

ARC asm-generic ABI is different from the ones newer arches have. For us the these
syscalls already exist and the idea is to replace them with the 64-bit variants
which requires #undef.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
