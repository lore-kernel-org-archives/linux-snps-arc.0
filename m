Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EFBC0044D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 18:44:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF55A20736
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 18:44:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B/V1d919";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EEQrrToM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="oR6x0nZ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF55A20736
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXQ4na4xFwz2EQl5H6CZm0clw9P1zPUZFm9Ipulso8Y=; b=B/V1d919y691fg
	IXY6lpKptBMmdk6MqhyuCT7J17kgzkyHIxzyDrlrud17+tRJhklOHeJKaUL5Lk1mDcOMpsbvbzc8U
	qvrCruQQPwkFoh+VTYVgr0/LmsdSNzF7LwVX7V7g9mP2v8wWVRMBYP/2R2Lqfv2y1+vOOUww09cGV
	6hld62lh6KyGIQ2HpSrgMjHr1MiWo36tWfONZUZvTmeYxJzsKzd5moGCd4o0jVBGpHNoVOYugs5NN
	9PXoBQxtEzYgPbuLyNbd9rtUS8Mj9jee1QLahWv8qeilduqEWsgDgwcKJsi1wAdtcMItBOi8BbAIM
	9DLL2zMpGrNyjof149/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC6LP-0005oH-QT; Wed, 11 Mar 2020 18:44:39 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC6LN-0005ly-1p
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 18:44:38 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 06E01C0F6B;
 Wed, 11 Mar 2020 18:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583952274; bh=8hjwrgsQu9UMb161wRiSlb3DyhMDMFM35fIEWUBk+pw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=EEQrrToMBDYzelNhPDAzWdyRDmllXqsNN/yUfhM/6Ak7n2omcy10E2lJmlQuxlq0J
 mIjJHt01T7GU1gBCTdcCr6m40kGWgB1Nd0olHnydVTy+WDpDx6YAqiOyB8QUxiEd+u
 k9QwpT6Y+HWQOMRBys9R30ZSSnwRAHSNnzusE8aooLm6pOHaN7hricUWUg8Adb9OKD
 aaonBPK/lJD9nLmnkrkLIIQBO0WhIU43balakm4whYHVxEX6vNiVLjkhzsvBv0M+ZI
 oj8OKqyDYWW2Vfp+Bpzw14R5CAf2PdX8IbvQ2/Ik3BhA3lXc248PkzkKxIX0Rq9Hl4
 nTxIA/M+dLLyg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 668E2A00D5;
 Wed, 11 Mar 2020 18:44:32 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 11 Mar 2020 11:44:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 11 Mar 2020 11:44:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UumgroKJSP8Bzn1HHSLBy2hC9qhqmkbvUovZpnZ03mhEH+Y7vLjJQsrEv2xTgEkvYgngwi+X1pc1fR6K9oW5rF6UOYlZSJNT4EpOnMKaQtewqkK4XulJEM/6L0LUIPOp/zzJw1SYjmAI6STK+z/iOqXviSns4Qw5rQ8FpvFJeJpmDrF3Jt94GQ29QPrl11qLqfHqc+8kZYhbZ5GBdV3rlUM5WgsJrHYeK4FPPCEuH41k/fT4rILA8T9A4C5cD6xMhEGr+H55TrOqUiNEwD9uTULECAjU/ta98JomwzUQRWRItP6ZrS8a1V+UuGOWUXSWe+XYP6Vps9kNGOIOw41Yog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hjwrgsQu9UMb161wRiSlb3DyhMDMFM35fIEWUBk+pw=;
 b=KKjAz1kqH+tWTBvkxhgl9uDLbmnpzesvasRWsfvXyWoVnmAkKPdD4Nmx0msc4GU4ujPnb9jD8bNybhMeHgd5Qr5K/0BflITRwKc5i8dfcqUY4J3+lWMDxbu2QP9JxEwbdGBO1THUP7ULeW5pgx2FEgsfu34ql6zPGsGeJ+jEo0OYo4LLXCvFkhkEfZ/y50mL5hWMCNHLfgyvy5hpW1d3pW4gJvwS3ewBPhi1pQe+2MS639J/P/C9cvNAN2cV/3hL38DZ8xYEHs8BOIARaiaRoIdwCW2lkFJl0y9VCTlHT0w0LBlRkj7fDBj/ggRsgimTt0mQfu/exaxOW6yo7FrjHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hjwrgsQu9UMb161wRiSlb3DyhMDMFM35fIEWUBk+pw=;
 b=oR6x0nZ3o7MA0bBtPp5HV5wFRPzZN3X4zwDWqGoYbJ/ViHah6pLpoPktHabyEDhnFF8h6a4z4jcSpZmoAoegKfOO8pNeXDTid+w8NAyydMlu/3BkIFzT/EkceOevBcp+4o9dlopaLJaG6QPPW6tA11raYxGac8jTD6HXonlauds=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3191.namprd12.prod.outlook.com (2603:10b6:a03:133::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Wed, 11 Mar
 2020 18:44:16 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 18:44:16 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH] Force 64-bit time based syscalls for TIMESIZE==64 on
 32-bit arches
Thread-Topic: [PATCH] Force 64-bit time based syscalls for TIMESIZE==64 on
 32-bit arches
Thread-Index: AQHV60EXsptB0BIT80udv3Wsyvdra6grpW0SgBguMYA=
Date: Wed, 11 Mar 2020 18:44:15 +0000
Message-ID: <28d6ac17-5c47-5b16-ec32-abd629f0cce1@synopsys.com>
References: <20200224183413.13629-1-vgupta@synopsys.com>
 <87r1yjhv8l.fsf@oldenburg2.str.redhat.com>
In-Reply-To: <87r1yjhv8l.fsf@oldenburg2.str.redhat.com>
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
x-ms-office365-filtering-correlation-id: d97d06d1-e9ce-42cb-85df-08d7c5ec3351
x-ms-traffictypediagnostic: BYAPR12MB3191:
x-microsoft-antispam-prvs: <BYAPR12MB319198D70A9164070E7ACC01B6FC0@BYAPR12MB3191.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(396003)(136003)(346002)(39860400002)(199004)(66946007)(71200400001)(66556008)(81166006)(66476007)(66446008)(478600001)(64756008)(53546011)(31696002)(6506007)(2906002)(8676002)(36756003)(86362001)(8936002)(81156014)(5660300002)(31686004)(186003)(6916009)(2616005)(4326008)(26005)(6512007)(76116006)(54906003)(316002)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3191;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YmSL5iI1XGcjjHsqNzr5DmzoiCBKKPp7lwyWWZ6RUOkNuE8o9nPHJ6Jx7gaKnMWFWZGenT/N7p15udVJ1we1FFrzmfNqWgByO09hHDJG6pGpsb1d0Nv6tW6ma8n8mB3Y4WvBlo5nXC0cfi8Oxbo0PXgMbWxMmBvY2FIvFyhqj53rW82j2NdE7543oUq3II5K+A2yrAnGecFj2GkXtHzXpNoTDUHhe7Pt+6TNc9uECyh3eVTa2dwuJYqndLyxILlYk+nl1/8glCjSCf7d48nWqQyGGPb6NDEj94jhG6CxBNWuRGUCLQ13jROxXnnUINFgV/6sRfw8mfc+SC/G1T8MAwxAEi3ddJdajU8OGrkfFvborPVRenLu3SFnyZYheYtsMkJQ7fkun9TZ8w3IxkMiJ7MQoZN8uhBPpiVjezIHPdn2nG3Ofy79H6HMGKlZ2VzG
x-ms-exchange-antispam-messagedata: 5wRYf04HDlLY7rQqGVMzVw/ogw7Kf6Cblh2XdEdsL63aw8iJhlMe/TBWmAFc/d8ItDU02bPyaL+nka5VVlSOn0fhAVsfNJ60UP3cjSnNcuy1MbLKPzwLS6xWW1xACAZb5EGNRQsLYZOp3Z5G0sohsA==
x-ms-exchange-transport-forked: True
Content-ID: <DB7325348ACF2B46B5419924383922E9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d97d06d1-e9ce-42cb-85df-08d7c5ec3351
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 18:44:15.9089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gNOyXvTW0iyzrNeHqNGFqKftjB5t3z/wxbRO8FfqVTZqpdsvG7dDaFXwdGq43fNaN7BpPFNjHYGVOsz+v+zgTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3191
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_114437_179528_E2F6366E 
X-CRM114-Status: GOOD (  14.11  )
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
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "lukma@denx.de" <lukma@denx.de>, "arnd@arndb.de" <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Florian,

On 2/25/20 1:27 AM, Florian Weimer wrote:
> * Vineet Gupta:
> 
>> +/* Override syscalls for asm-generic ABIs with 64-bit time.  */
>> +#if __WORDSIZE == 32 && __TIMESIZE == 64
>> +
>> +# undef __NR_futex
>> +# define __NR_futex __NR_futex_time64
>> +
>> +# undef __NR_rt_sigtimedwait
>> +# define __NR_rt_sigtimedwait __NR_rt_sigtimedwait_time64
> 
> I'm not totally unsympathetic to this in principle, but I think if we
> start messing more with the system call numbers in this way, we should
> move away from the __NR_ prefixes and use our own constant names.
> 
> Otherwise, the results could be very confusing, especially if there are
> exceptions to this exception and we need the original system call number
> after all.

OK I understand that redef could get messy. How about simple #undef of the 32-bit
syscalls so they are not available in general and rely on generic code to fallback
and DRT.

Do note that this is mostly a "preventive" fix (for single exception see below)
and new arches will hopefully not trip here as they won't have the 32-bit syscalls
to begin with. It is applicable to arches with slightly older version of the
asm-generic ABI. And for same reasons I can even move those into ARC sysdep.h -
what would you recommend.

FWIW the only relevant piece here is futex which generic lll code expects
__NR_futex and we need to undef/redef to 64-bit variant (either here or in ARCH
specific sysdep.h for RV32 and ARC) so having that part atleast in generic code
will help future ports avoid the copy/paste.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
