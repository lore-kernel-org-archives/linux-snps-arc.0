Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAB0C38BE1
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 19:03:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5D0F2080D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 19:03:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VIn1yUDf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bUp/kLaa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="TAJKf5Yl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5D0F2080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g60iVovn7qqKvo6GMkaqmenaiAj1hAKEqtm7HlmfCAM=; b=VIn1yUDf3Fi/qV
	VQOIpf2/d6qaCN2pum3OAx6xVmAwTBssMQ0JYHicRJe//ot1Oq5JSV6M2Vx7dG9RlXND3IccxcE1z
	p0Usa+lHyssMTkrwLA9SNEF9znu0AWCZjTU7k0DmlMTb53tNw/PVtHt1As27HKXphIwhrCgHzkPKX
	WcsXJvPhsi0BlDmtQDVa9MJq1k0u8rGIHT72g0FsX49gtz0GBBGKGp4o+FTmmed25StC0d+vWw8r6
	XnttC7ZFsdWb1XK9yzo4L3ruE1I/dc3V5rRKQwow6XbKyIFlxD9zvTXfZ5MMcpyGRcR2VhdN9YI0P
	GN3uruM5KxnmbQaSBzYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6J0d-0006b6-Mf; Mon, 24 Feb 2020 19:03:15 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6J0a-0006ab-Sw
 for linux-snps-arc@lists.infradead.org; Mon, 24 Feb 2020 19:03:14 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2F1CFC04D1;
 Mon, 24 Feb 2020 19:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582570992; bh=HfuV9U71U8kiGhkhu/J/mog1RJHsWxgECrZHI2P69fw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=bUp/kLaaueNhoC7Za/RU+ItpEefMiBhNwNh51kXkbPjGtmWlTRsWcppc038AyAMdz
 ZWGImeO0Bc5ImLVIN9x1G3IDOyJOGcGsmBu2f90wsEKXrkxnAntwm/AC4vLhzWjacL
 HG6jop/tSk+GZj5lSe+qNP/NsXQKL2DrK6Agcf94Lg+aNPunSMdm64PytKp+rdR4fE
 C412JzHFVho9+JgwE84A6TpOkVd90fUZ8kzAclk0wQhG3hhJnrC44binxtkDmM98eM
 FMjaDuVrTHcIOp4eJ92pCQk5dZXvFYgJIY03as1y/ycEs+ltX9wdhGDq9U7HIeqWKP
 yTF98BeNfdq8g==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id BBED6A01BF;
 Mon, 24 Feb 2020 19:03:05 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 24 Feb 2020 11:03:05 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 24 Feb 2020 11:03:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbvazAZrrpreQriIW4dIaY6ut6dRKbsKtL1SNQJp6Y9NTDP5xCHRfhFSY8q/OqdEXJQ4tTjx6jXZDRbA+MEOann7ixkkQNzGYLsAa6ZiXwekea4yu9VtOovZ0PKC0I6rWdm9A1i7ahDrEjYxOydN1PSHNetroCaS4SMJYetJV976mI7h8jrdqreTwyTyAUguDwnuii6MFlCEbeo2yY3jZH0dorO1z5WK+sGH4AKk5EFmjmrcyVdA5/nPRoBh/pdHT4a8pFWGHmE7qa1GSYj2l9VYgf68TkbHVaRP9LOa8HLOEVLI+ulrZLlZ081yXjaBeIoaMR6I9GAqHeWTusRjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfuV9U71U8kiGhkhu/J/mog1RJHsWxgECrZHI2P69fw=;
 b=TIjz/2EvEcvhV9eWo4itLYrM/Qyh9OPbT+W3v1MnC6Lj+64q2xrjIprFUN7r24yNBbPuXKVW3YNuZhVnWVUZpP9EHloChn0aib1Js8t8fkEXmQn+8EIBwFejn+yRILunpQNxCCeDAwB0v56MsvuLqLP3/Xxtej6mIEo5BUweOLddqvjd+oNKi0R3sIBpes8YdQNTBWhl3mH9T5MJce1NhfOyjG4YGgn/GZuPFrqJSBMsWSptbvlK91WI3QYOQAU/43K886FHvN2C/GAl0IISLi9nQ1nHIbrT13osb3Ykuo5PUgVXfy8ktCrNj0OQBFbNXV8ckcNml93J0MsTO6jytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfuV9U71U8kiGhkhu/J/mog1RJHsWxgECrZHI2P69fw=;
 b=TAJKf5Ylys2Um+dJTX4E2dbU/Qt5twfKJiM4OhfuE3me3SMNqKSm+h3yoF99TWtMUYwtjEnd3AyWWPG8QUNr0z3p+0sZ3QstW+UIwL8M+oaAil0G7zXwdP+peTA8aDuKOhS3/taXyVD7P5S6UnTPgqNB55l7Zms65FuXg8q+ax0=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3446.namprd12.prod.outlook.com (2603:10b6:a03:d7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Mon, 24 Feb
 2020 19:03:03 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 19:03:03 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH] asm-generic ABI: Allow statx syscall despite
 fstatat64,fstat64
Thread-Topic: [PATCH] asm-generic ABI: Allow statx syscall despite
 fstatat64,fstat64
Thread-Index: AQHV6z+RR5ERkfrbXUGAB7RmYeDq3qgqrSHagAAGcgA=
Date: Mon, 24 Feb 2020 19:03:03 +0000
Message-ID: <d56495ad-c532-9e00-7f67-fa2626f9d901@synopsys.com>
References: <20200224182305.28027-1-vgupta@synopsys.com>
 <87wo8bn839.fsf@oldenburg2.str.redhat.com>
In-Reply-To: <87wo8bn839.fsf@oldenburg2.str.redhat.com>
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
x-ms-office365-filtering-correlation-id: 07f07bf9-d32b-46f7-e13f-08d7b95c2ccd
x-ms-traffictypediagnostic: BYAPR12MB3446:
x-microsoft-antispam-prvs: <BYAPR12MB3446E01BC871477D668A42D0B6EC0@BYAPR12MB3446.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(136003)(346002)(39860400002)(396003)(189003)(199004)(6512007)(86362001)(6506007)(6916009)(5660300002)(4744005)(8936002)(478600001)(4326008)(36756003)(316002)(31696002)(31686004)(53546011)(2906002)(54906003)(6486002)(76116006)(186003)(64756008)(2616005)(81156014)(81166006)(71200400001)(8676002)(66446008)(26005)(66556008)(66946007)(66476007)(41533002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3446;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HP8WfL61Ycw05fSGC1JcFQLdUePZ5K9wkq3dh77Da7B45Ikii4DjpImANXIylu7YxLLr1C8gYpbCkN6Es3n7OPB1t8R9pAglC73KxORIxYOqUFmelIXtBAKeDAX0LNKFINi+fFTqd3P86xi36iMho2wRbDhKrvgeWHQLwsWF0Gb8JCCu7imMZ/omTexcKS6xV1TS/WIxObPrxYyTsgKSblCBc99u+TphVxvpi466xbqJAnf4JhtnN13ohXYGZPgrY3ZAKwjXjL1G8qeFE3mpY27llorS+n3WB/Xh0mz832KRZGgzI06m49MhJutIjEiZ7/bbzx+cin23Wk37HMKLrnrXgrNbRgWEruSjBbu/qvmE214wLw7GCXTTMlwXIr2egZ3BMcrJiHexgo8sAek4XvNcw5FDMC7wnXtSX0zzpuqeR7o/rzP4e0McIOv7Ia36trefE05Kj4zSsjOchBctVt+Az8VxE6jD8yzeqjeZrEozNY68M7jZ/OfSXlrx9YzE
x-ms-exchange-antispam-messagedata: 8HWLxuXPLkIs1fHIIJQvYEG5wMg6PJQKLSffhoox8WoKfhZG0A9W1ooh8jrEczbLGqh7iCMOoJugvMDOcguplHOq6Luc43LE2Ugk5ggcnuCILdBnin0ZkBYn8HRVnlvPWqJ3hG50IO3VRpmszroCjQ==
x-ms-exchange-transport-forked: True
Content-ID: <184E16D0E1589445ADF7269F9AFA0D18@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f07bf9-d32b-46f7-e13f-08d7b95c2ccd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 19:03:03.2766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IsnKvmZ2c+vyEOX3UPPBCEC3JKumU6zYJh+OLmfkLfPPVHovrEV2R0aRGMTVyD8Oq02D/3ax9fMC9/HEo6vhDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3446
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_110313_067676_0F49A439 
X-CRM114-Status: UNSURE (   9.02  )
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
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "lukma@denx.de" <lukma@denx.de>, "arnd@arndb.de" <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2/24/20 10:39 AM, Florian Weimer wrote:
>> +# undef STAT64_IS_NOT_KERNEL_STAT64
>
> Sorry, I think that going forward, we prefer that such macros are always
> defined, with values 0 or 1 as appropriate.

And that means we also need to additionally define this to 0 in all ports which
don't end up including the generic header ?

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
