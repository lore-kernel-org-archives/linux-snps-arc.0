Return-Path: <SRS0=lpWb=6G=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C37C54FCB
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Apr 2020 23:01:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 783532076E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Apr 2020 23:01:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SXiu7Kpx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YFTAtKBC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="uVcVbTzF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 783532076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmwzhA3rBFPJUeFkXjiO2/LychY0OdDWNDThJ3jSvJA=; b=SXiu7KpxNYq9Ns
	kstYzinIpIeH202N5KGfewFWRbWFSpAXyMeYcyDlyyR4+DSfeGrbWDx7knx9JbI/zv7M3dSL0HJwy
	rAictvFGVwoqIymxoj7sxV6fie4UTgCC5pd/n8NZ5Mfd4YFPPshusLLwXEigldOEXK2uxlpa3sYVn
	un/mcXajw8LcUGVGpCdjBstjU/NjsxYNUPvI5qUgAJK1/PCSAXUnhXCPJorRdAlFTwmnjkbyqiri8
	Rdd0bnGBCA/u+sVS+jrzwIiidtl5NifWORc6QeN8JNu79lFBV0PmDyyd/iXYrlN7Qba5akXOxEAzE
	S2yNUk+Cd7+T+SoKcFFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jROMq-0002tC-2J; Wed, 22 Apr 2020 23:01:20 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jROMn-0002rs-Jn
 for linux-snps-arc@lists.infradead.org; Wed, 22 Apr 2020 23:01:18 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1FF0EC033D;
 Wed, 22 Apr 2020 23:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587596475; bh=9tmstFuAlwIu5L/sga0yfdJYvsYFFxHwBDKUFHzRVqo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=YFTAtKBCrthWZlWqBASWnf4tPX9KaU+tS2euu/WZ9wMb6LOIhyH4dyg9iV7Tkx1PL
 xitoDvGCWO/Bi8NTVnQ+gDtZF4nyQtDjMTOLLu1IHQtrpXtxk4n1n/JRJiGUWaw3G7
 SVIRKQhgpex9bwsbh/72z46tZgvrwzGLeq2zOrFKYPkDjR5V2lRht81C88JvGDnJlV
 ecwSTHkGsyuqUPQMMJPqBdA2jPgQYSFv0zwscLIUvWeigVcYBi5eY5Gn0TnLDnAT4U
 26G97qQALogvTrqTt6ZwvkvMYpM0C4N6qMCeCsxbgb259NJF+FZ7OyFVdwA5MritaL
 UPf8GxILFQDIw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 738D1A0083;
 Wed, 22 Apr 2020 23:01:07 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 22 Apr 2020 16:01:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 22 Apr 2020 16:01:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbkFA6unTcqkF6ABH19xKjXGvId7t4dji8Eb6RwSrihu40QHVS5qLiKKs/nxcR3y02+rs6OTe1PK6JFcm122SBc+DNQLhy/Ql8Jn86QqQHTkCbpjPtEBttuK5P/5Ig1Kek12AiF5vVykOvfIqYSDdocUITopU64FusrnX84kVzW72pDVV7hIJm0CmiMz3JPQDoi2p/tlNyvXbIMcJIaTDr6w0emewnRuzukQV48uwy1GNQvhj5f8ZspLOoe3LENJc4hLTeVuFO3C3diBRKFWGhF1pHscxAOnfAajoHLbLJvBTu+3uK2LOiU2DUm6MDBkxXBrbSVRlbIB/qS8esuRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tmstFuAlwIu5L/sga0yfdJYvsYFFxHwBDKUFHzRVqo=;
 b=cU6qVXVRLIK21xsg82JCBb50yeYqGXDGe4ClVHaPVoPg6RLWvE5sc00U6VkwKvSqZjBRohFVPBZVaLXRh3woFeJS0ToysizFln2M/RsNQXCMtKPxcouwssGfB+2xiS9PDXHOncdAQD+LmLd8LRMBVsxOy4AwnqzreBgzXovAOuehhHpyIQMIioL9RNRThtjerUgAVybcS/S/Wj/wEdpc7L4B0AgM8dQPTrlkX3dwocTSHhNU7Wv1Fzcr1LauaPOapmmKsdI0bXS6P4FLNKB8IhU5BfycN4YHTPff3xZ84D5UMfClQIkyc8vVrAWnjLDn57vKdlPd9oJDc4bxeARxyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tmstFuAlwIu5L/sga0yfdJYvsYFFxHwBDKUFHzRVqo=;
 b=uVcVbTzFVS77rInjcchouhYb+3KYOZROQ4VG6eQ7hsdNLiVmHkQTSbyFGIiYVVfEpDona7wpKDNrdbw4b09YoIH/YQfzTXz8Nof6Ra8Y4G5mR90aMCqdvQ3fJT8ND0hYVCqy6BYNjnuPhsD5SbuWkQUJVTWGJ/Vduj35fpFoe7k=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3365.namprd12.prod.outlook.com (2603:10b6:a03:a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Wed, 22 Apr
 2020 23:01:05 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2937.012; Wed, 22 Apr 2020
 23:01:05 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fw@deneb.enyo.de>
Subject: Re: [PATCH v3] Make any 32-bit time based syscalls unavailable for
 TIMESIZE==64
Thread-Topic: [PATCH v3] Make any 32-bit time based syscalls unavailable for
 TIMESIZE==64
Thread-Index: AQHWB6YXXY4j5+K2H0eFv1trJub2pqhsekUAgAsm9ICABoALgIABEoPAgAawuAA=
Date: Wed, 22 Apr 2020 23:01:05 +0000
Message-ID: <2aeef265-420d-e04c-96b3-94d23d1cc536@synopsys.com>
References: <20200312183325.594-1-vgupta@synopsys.com>
 <20200331214717.23902-1-vgupta@synopsys.com>
 <c87dd5b4-8be6-714f-3210-4cbfbe89a069@synopsys.com>
 <9eda9480-d0d5-07ec-3a99-83e61b076a2a@synopsys.com>
 <46b17be4-da49-a6d3-3a07-accf406302b7@synopsys.com>
 <87y2qs68ms.fsf@mid.deneb.enyo.de>
In-Reply-To: <87y2qs68ms.fsf@mid.deneb.enyo.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [24.7.46.224]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83f8ed77-93ce-4def-6385-08d7e711096c
x-ms-traffictypediagnostic: BYAPR12MB3365:
x-microsoft-antispam-prvs: <BYAPR12MB33652D7F6035F8AFED318927B6D20@BYAPR12MB3365.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 03818C953D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(376002)(366004)(39860400002)(346002)(136003)(26005)(66556008)(64756008)(66476007)(4744005)(66946007)(2616005)(76116006)(4326008)(31696002)(8676002)(81156014)(8936002)(2906002)(186003)(86362001)(71200400001)(6916009)(6512007)(54906003)(6506007)(66446008)(6486002)(478600001)(53546011)(36756003)(31686004)(316002)(5660300002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i0dyA+8Cd/0OFV3vNQ+entwW3tMXW6k+NEYTYToGYE46yNENIL/DPrMhoOQq3HWDYu629M+pH6809ELk2PuVZT4RTG0pk8e42JOfgXDDKrhPPBtX8qjRraBVLxsVuEeuZoD59D/iZvmCTDlmMgdYLtJL0Zb8iRZgrJ4NFSfUP7CwbidPCgt7w9WNJrNmBq07YIQt0iojl5wTdjqBuH1FZWvZ/buQ+70n9WHKYO1RDCdRDfDvAYZ5hcJ+FL6YXpeSJh18/PxTfG/KFnP6GDQgavAj3WYPcoPPuN5jNtLDUsP3DBwQSAnyZIxeZpdTSonSYBGgxeEs/yNhaCa8NnemlhxedG2+kz/FpPD4S2yDKH0rlL1/W7aOBxXN2CFnJP4db9LGpdWjpZIuXoTfD246ayK6aA7TKryzy3L72EOaE6TptRq3364qMiq5LnGRTdKV
x-ms-exchange-antispam-messagedata: N0Voc+03hJvRxPiWIiQnKwze+GO4WbN9VrvnEzYvm2DdfPFk9SjtiP+FJQj/kWj1iDS5gvDFhNIo52CF6Qbx7HkNlgzbF9SbdtTa+AJLxj9h+RdVUgZOVb8XV3100YED6TGsuNnJv0G42T5359zxuw==
x-ms-exchange-transport-forked: True
Content-ID: <F8C129221D041E40AE79961B447D22B7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f8ed77-93ce-4def-6385-08d7e711096c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2020 23:01:05.3273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RjV6BUsa61KEcaZ4vStLNnLvso+9QMH0yi9UyDbTIzfws6XldB3ch5N7vlmpBhdeMhQxTIOl5YgYQkcejmCneg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3365
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_160117_744847_0F73831F 
X-CRM114-Status: GOOD (  12.07  )
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
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 4/18/20 9:50 AM, Florian Weimer wrote:
> * Vineet Gupta via Libc-alpha:
> 
>>
>> If this is not suitable for common code, I'd still like to add this
>> as part of ARC port to safe guard against future snafus.
> 
> Have you tried to add the #undefs to fixup-asm-unistd.h?
> See sysdeps/unix/sysv/linux/arm/fixup-asm-unistd.h for an example.
> 
> I have not tried if #undefs work there, but they should.  If not, we
> can fix that.

undef works great in arc/fixup-asm-unistd.h
Thx for the hint !

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
