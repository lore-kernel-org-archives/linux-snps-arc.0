Return-Path: <SRS0=AhAi=4N=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF000C35E04
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 16:56:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45D772084E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 16:56:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MArW3/oB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="M1kWhqlV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="M1qA4f+A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45D772084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFjhpct413eAjYMKly96/ZnVEuxsBVR9uaarXtZbVnM=; b=MArW3/oBiPQRQ6
	QHku619l2OjVKORgJTSey5ooD3C9scbPPb4z/Hz5fso12wkymQ6J7xGJiAK871QdVxiRATd9Wr/4B
	hZTPYvcSGFTZ1C5KnyH474nkdAtLNeZrQso4tcF8S9eMZOGBCzd5NFkr4Z441mmFPS0n8EcSYcaaZ
	x8BshIFBNmv5CrDBnsDteECTq0LRGCHt55Ns67TPx3adNhZLGJ7qjq39ogsPLnnpMwqecwgLI3Dn0
	HQev9+p7nslhUT54ivZmaxl22YJdlyMjizP9B+4v1ooIqDdQH6qeoieTE+KENm8yyrKCztwar5TkB
	9iEaQHTssZVG6Xvb/7Bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6dV8-0008PZ-VD; Tue, 25 Feb 2020 16:56:06 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6dV5-0008Ou-UZ
 for linux-snps-arc@lists.infradead.org; Tue, 25 Feb 2020 16:56:05 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 503FBC0F11;
 Tue, 25 Feb 2020 16:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582649761; bh=B5eavFaxnVdHgnhCYaAGdpRRpEXBwcPyFVP+pajvjno=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=M1kWhqlVJP1JWiKmkIqcmMSN1gKl420upB53K1pJb0CbYPXOkB2z5SL+MYrialtEB
 eIJg8kMiEv+0eqh6xnZY9ZtSVV6povZ1trrYHlHilOJDQFEDoPDR4TriavhXlaP8ee
 E9vgX0P9WRsXKeCOyjRrbFwniPOaqYXm2h0wQqH1FsSaLQJ97tCPDXkrLp0qo4ZCiT
 tO6mC+CV/8oIHI+UF5vFvlSJig3+p+0jIxLa+5CdOjQj1nKs1jDtRcETYThpFMqg3o
 E9OaPnhWeUMpkIpE+d0doNBOAxbNsVvYzq4ZN48fce5lr/WW4jWsU1zDijaQDOvlIU
 pS/bWGgFE23DA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9DDB2A0086;
 Tue, 25 Feb 2020 16:55:58 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 25 Feb 2020 08:55:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 25 Feb 2020 08:55:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8g0bVmN5Dj/CpjMcvtmzPW39EYOzsO8xJPfKh0nh8sxtFL9Af4OcWS5l4W553aPWSlMcCmvY43Yp6QoaCY5pbZMPluA1h0sPOW/UDvlqEtim7M5LsXDXgAhmJQjhtFQEG1k47cUcE5J0Hs87R2vBXSylJoe79mLA9W6cPTGwuPyYR7cFDb1QfEfEb8eAkZC6tkwIGc0ir40HKQap2h2vu2DOTqiJVfgm+j+Qg1TVuknvmkYLsJopJqO4bLZcCy37Fz+kxU5QpmqqY6DI7asV9l6J6G+ffFNzDw1cZaRxq0eKRNy796bZeyX9h/gAqbXHIq9B/cdMXUs3zr2+jipIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5eavFaxnVdHgnhCYaAGdpRRpEXBwcPyFVP+pajvjno=;
 b=Ngqa81TnYbF/CfO8vc2vmdPuznk/JCmZPGM02z0x2yQ9htFvhWQbBTmBwzjsD3kRKuRiFKD5VjVukm1WlDFblT/W037ZsN2wu49Cs10tPyNFo9xz/TcTV1gTHYxc/KQo9OZSQmQ1N1yG9WVsDIFpbgVds/r5bbVCDA3NF2qQJ3Yr0VqC8H4YFQMu4AAMa1arUi08NzCwB6vbb0+sypIPx8VMbMcYvVsTHsuN1jOqcpae06Ibbp8fDwTxbJuNDgMJMEy6VIJUSz7K1RVyNymzcNe6tX7xc6O9/0G8PZ1LW13GCy+mpz8+aeNMcP09oqr7dXa44Yutqc4jqMGQ4PnozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5eavFaxnVdHgnhCYaAGdpRRpEXBwcPyFVP+pajvjno=;
 b=M1qA4f+AHXFxQ3JPkDduYsMbUthhX6498tuWo/z+0WbxDawNOCLj7GOv0NoApiTWqWBlyqlvXuWK2iP6Ps9SpRo7fwIHVrQ9NMkbB5rwoz7ST5YWe9vtq59F1BP246AOkRa0mh0LmE25lPUN0rANeE2fH/3pwc/XQnCUZYT0ZUY=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2984.namprd12.prod.outlook.com (2603:10b6:a03:da::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Tue, 25 Feb
 2020 16:55:49 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 16:55:49 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v3] asm-generic ABI: Allow statx syscall despite
 fstatat64, fstat64
Thread-Topic: [PATCH v3] asm-generic ABI: Allow statx syscall despite
 fstatat64, fstat64
Thread-Index: AQHV6/xu0M3nqLDqfESav1XaP04H0Q==
Date: Tue, 25 Feb 2020 16:55:49 +0000
Message-ID: <164d39b4-4d5b-a0a5-1939-af25e7eca47d@synopsys.com>
References: <alpine.DEB.2.21.2002250008160.23654@digraph.polyomino.org.uk>
 <20200225002941.20951-1-vgupta@synopsys.com>
 <df3e9d71-7d5b-a03b-7b6f-4aa034684307@gmail.com>
 <alpine.DEB.2.21.2002251609090.25788@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2002251609090.25788@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: cf59e1f2-691b-48d2-8aa9-08d7ba13912a
x-ms-traffictypediagnostic: BYAPR12MB2984:
x-microsoft-antispam-prvs: <BYAPR12MB29843F3224D1DE3273BE446CB6ED0@BYAPR12MB2984.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(396003)(136003)(366004)(376002)(199004)(189003)(5660300002)(8936002)(81156014)(81166006)(31696002)(316002)(2906002)(6486002)(86362001)(54906003)(4744005)(71200400001)(8676002)(6512007)(186003)(36756003)(4326008)(2616005)(6916009)(66446008)(66556008)(66946007)(66476007)(6506007)(64756008)(478600001)(76116006)(53546011)(26005)(31686004)(41533002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2984;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DqlmkmXBz5aPZ4naWHXHFZHziJZ3m0R5fuRx7EdEn3vBFdvy2VlxY1F03VkaWT7acT07roZbR2WdK0My+4zBLWHy2zL3hED8ArnSK71t8qIcPEbc8rgjgeopUsJGWJjD37vPfeqQ1pyEwYajJtsXqiWfvWVjH0v1qo35+0hbUHD555aDaWLD9S3rgiU8BFoaEsnpg+S3obLFYcKvDsQcGiOk7VgStsNi8bpdpRNTE7ocMkRuP4PFWG9QbZPOo+5rzm/cx1GtF6ti2UT07wpTOGbRQ92mO4jfxucihspgGXsE8S8iOFmO2lsb9QMBtIV9G58uo/FJpFfb98Lsi5rERQMaO8MTMS7PkCB7hgxGWGKRocB6Q0o9J2NofcDqQbONRoAqcw8kxdd2Xxci3jfbLQ8zWw8ln/mCrysxplbG9VcqCO76movcRBUAq7Aq4NmEK23g9PrUXwFg/t/8SSSjf7NXOg/ffCtA3ZtbcWjmToFwWyfvvBoHFuswtRkJEKhE
x-ms-exchange-antispam-messagedata: 2UmfUabYpIUi4yQoXUYqtPSkVtsc83kpOBAgEO4qUPqoWakgz6GXfwLeQIzU9BfeMb7GL1sXEy+VStOFuUqvC+XkkgtcK2oy9o6l5UZyMp7Uva/k4J/KeDEJJC63VrncHQ//CbOIJF7HMFDoELsHgQ==
x-ms-exchange-transport-forked: True
Content-ID: <632F2AB70DEE3F49B233C98C0E80A69F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cf59e1f2-691b-48d2-8aa9-08d7ba13912a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 16:55:49.7114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aJ/Z5p9cQ6cohsqQ1lDnK/wbvAZZZqZ/lVF229f9lBfSLaSlHsh9/GkoxQc3Ky9Wte5dSeKd7j1LTTDwCbejjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2984
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_085604_104367_ED3E1D22 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2/25/20 8:10 AM, Joseph Myers wrote:
> On Mon, 24 Feb 2020, Vineet Gupta wrote:
> 
>> Oh wait. Can we avoid this churn by simply undef __NR_fstat64 and __NR_fstatat64
>> from ARC sysdep.h ? And it will then automatically fallback to statx code !
>
> If all files needing this information include sysdep.h, that might well 
> work.

I agree that this is a valid concern. If we really want to make it water tight we
could have the build system enforce this with -include or some such ?
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
