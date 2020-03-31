Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3335C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 17:58:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5864C212CC
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 17:58:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PMewW7UV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ky6uEhvv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KHz6bF5e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5864C212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJi16M0v1Uh3e22jPalIEqu+DUkH9x6UJLVxZwFT9VQ=; b=PMewW7UV5H3jmw
	v9md12w3yh53k5fPjFfTGhc6RjG3oEwMKJei5FuTPvVyKMRbj4bkUUIypHiyhOq+bpdiZm5iRB/ln
	X2QajAso7bFyg1weeX43aZQEy4kakmOcon7X2qkjRB3IONJKfQZZe49xjltOhJjF4X6Cerm83cl/p
	y+DSWHoo7GgfnLo4qDgEDYINiXcqinpwNbqrrjpzRI/RkUky0midc9C1TnWYBWGNQ80iK95J6QyIl
	0w3b9olCu/kgSL8LvycCMv3MUKfKvI2A1BuHtRFn0MJtbz1Un387/nNhL1EuG4Rid3cD/HU503AGd
	wb3mdQjKCv8d1bnyhpRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJL9U-00014b-3j; Tue, 31 Mar 2020 17:58:16 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJL9Q-00013d-St
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 17:58:14 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2C30840527;
 Tue, 31 Mar 2020 17:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585677490; bh=pEGVDaUBRhwsiJAVxyuAheO7NbfRVOOZ7bzyrLEImR8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ky6uEhvvTwLIJtR6uLskS7j7fFzNfPoNTvF7/6sh6FlmaFd9paGtRILv9rPdrIlRj
 m7BWdBGJ7NRLzPG4Oik5k1cknQfpdD/JM8nhGPwYfLDnsF6j7CCrj0ho2EkBzHKVVn
 CZDpxSM8Jpw2Ks/TMFneqjj0TYpMOAfSxdsHIBVVs2iHe2t2tX71fFcTz2FgExUNf0
 cgq7Tzlw1lVtUwsczDAVaKCSy4e28Vqrw6cc6fbIs3qXvAg7fyvJds9B16Y8RxeX9v
 iDzCXDTO2q16F+nfP+j7Z2TF3N5QUQykX4NXh/yz8aZU1l8VLbabxnk/FbILkuPhaC
 jHarNODhCh1JA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 69EC4A006C;
 Tue, 31 Mar 2020 17:58:04 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 31 Mar 2020 10:57:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 31 Mar 2020 10:57:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gK1VEZJMufjfY9mAVv40buvM9b91gJSOhhdOZIJOrFqIPCQQy+M5m89hSE8YoYSEDP6oZBhD5k68pEOlurw7CFHEsMSpDbhkowbhKAnzZYWvgrYm9onawCDBM4U8ks19mr/oY+O+SC88gxYv3x2qN6AoRq+LD5Eaq3zMEIakWMkoKA9zBC9q0ZRWuVzAoBEqrr160n2BMGEAYrpMtGbuMx4Tq++hq4HvnZjEDITRgxHC+7IBYYaWw3DmnM2alYArKqjCne2+iRw0CpiEqt0thJlNw9xzBV76u5WL15gtu6VgsxYeQyysZm3xelAePFpyFh71P7Gq8sIvvlTkAUxqGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEGVDaUBRhwsiJAVxyuAheO7NbfRVOOZ7bzyrLEImR8=;
 b=C5eOpvf9+H4wU958IJwU5r0kuzPhkkUiFtmo6nhS6VpG7knaVeixIYAevxFtxpeK4TZvyYPnSjSLtR3k+GZ2y8c9YkCxo6P7yTZlx41GV2TsRquoZ46aJdzZv0hxdCOGYdPq494rh2uE3PGUhh9h3BvWzCxV0wkRJ40+kB01bTACb7Kqq5THkRYJLDeSHhJRGVWQbEkWmHiPbcZ5xZJUtYqBX67mybrbNgl/UHpsG+fue577jdgXezeGZ/sU1X5D+Jg+rrILRHm9sxMntp4n8rsv5JU7PJ43QyTrup/PUqgHOV4mdrYMoQpdkfkzvbn3MWfDs0tUQDIGy1zrrbRaPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEGVDaUBRhwsiJAVxyuAheO7NbfRVOOZ7bzyrLEImR8=;
 b=KHz6bF5ey7HW59P7W2yMym5pq50Cos/uus14p1DEPeKbVSNyVMot6Uox7Xozq7DrDKNGBEU38L8hvQkP7FS9SQ55XtsdOH9ySHz0JSRytzahbGoAal6HrZnQCa8Q1W8MHUmxxbuwONxv/IWmSaESwlcJJOOpYikY7yjAG59iMK0=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2870.namprd12.prod.outlook.com (2603:10b6:a03:12d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 17:57:44 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 17:57:43 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Claudiu Zissulescu Ianculescu <claziss@gmail.com>
Subject: Re: [PATCH] [ARC] Allow more ABIs in GLIBC_DYNAMIC_LINKER
Thread-Topic: [PATCH] [ARC] Allow more ABIs in GLIBC_DYNAMIC_LINKER
Thread-Index: AQHWBV3Xyr4b4o2+F0mAj752BCtP1ahifWKAgABqKoCAABl5gA==
Date: Tue, 31 Mar 2020 17:57:43 +0000
Message-ID: <73641424-e286-c4af-de31-4fd0c751804e@synopsys.com>
References: <20200329000503.27897-1-vgupta@synopsys.com>
 <CAL0iMy0f0tt6UtBRyT1hn=FsvF5tBYVKmcxHq57rDbc9YEtO0A@mail.gmail.com>
 <CY4PR1201MB012004563CBA85075C153D99A1C80@CY4PR1201MB0120.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR1201MB012004563CBA85075C153D99A1C80@CY4PR1201MB0120.namprd12.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: d625b3cc-d965-4eb7-16e9-08d7d59d0367
x-ms-traffictypediagnostic: BYAPR12MB2870:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB287055C78F48096B62F72256B6C80@BYAPR12MB2870.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(39860400002)(346002)(376002)(136003)(366004)(31686004)(66946007)(186003)(64756008)(66446008)(4744005)(5660300002)(76116006)(66556008)(54906003)(110136005)(316002)(81156014)(66476007)(8936002)(6506007)(478600001)(81166006)(8676002)(4326008)(6512007)(107886003)(71200400001)(2616005)(6486002)(53546011)(36756003)(31696002)(2906002)(86362001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9iqSfLwsGhQpLYiRhQzFQpYETsHr1m3kPQ9luw36+ReulixGCeQDLMGVY76nhvHGPnqt8olY8E/NSxcba8Amkp9JjxyNhs6TyGRpG4vsJ8J0DrfOuZMPXZ0kVOnGcALhoQJ2QBBHaGgr52reL5Uutouc9DGpkrY2+2xhO9V7IY3uDTPJDDByVt4oiFNYT24vWOnrtHu976gz+/8uLrltTLLAjUIPImIHNvZPwRUhm1mgtSK2UadX1eCIN7s0ISCpX9qH7cley7l4qpAYGlutMlvm5yHSwkPapIYRNL2/tsrsErQb1imn7HuEvnu88WuZlLxtfAgd6vtLMdCT7wOS31Aiwbm9/FcRMpnDMpXb1b3UyUvmVxhec9TeJPzLT1BQtpGtHalRHmTLsn8po5OO+E7K4RKoe2EAOKDDWhAxQLqZSNWw8mf5sRXrJS4/QkSu
x-ms-exchange-antispam-messagedata: ZrylrS9RlMnXuQ0sWr/zdHph6VfZmC+ZwfscFTBgzOnPOjZEZbg3FXFAscU4a/4I9foTRrRgBj1GMO0fYyKuojWD6UGQFAg7zmqAN6TpTTDGPGx9GcAEsjmVgv5kDbim8ZAjSRzvubjdDReDOzHEcd/aqdJr1wgvgVCQ5/sTC2BC/inDE2LPKy4FMrZXXzJOaM1B8sw3qvLY37N9mxh9CA==
Content-ID: <A65AF6780B5A4D44AB5B0544DDEDD9E4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d625b3cc-d965-4eb7-16e9-08d7d59d0367
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 17:57:43.8035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fb0E8kyBUkb2rOeznkbrp3TIrQa4Xt16NMP2a1mqyXeU/nw1z2Lue5Uf4xPiPXqbqSIeT+LAzPWQ7ccB2cpiZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2870
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_105813_000855_D342868B 
X-CRM114-Status: GOOD (  10.61  )
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
 "gcc-patches@gcc.gnu.org" <gcc-patches@gcc.gnu.org>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Well its a hard requirement considering glibc is still using gcc-9 !

Thx,
-Vineet

On 3/31/20 9:26 AM, Alexey Brodkin wrote:
> Hi Claus,
>
>> -----Original Message-----
>> From: linux-snps-arc <linux-snps-arc-bounces@lists.infradead.org> On Behalf Of Claudiu Zissulescu
>> Ianculescu
>> Sent: Tuesday, March 31, 2020 1:07 PM
>> To: Vineet Gupta <vgupta@synopsys.com>
>> Cc: linux-snps-arc@lists.infradead.org; gcc-patches@gcc.gnu.org; Claudiu Zissulescu
>> <claziss@synopsys.com>
>> Subject: Re: [PATCH] [ARC] Allow more ABIs in GLIBC_DYNAMIC_LINKER
>>
>> Pushed.
> Is this one eligible for being back-ported to older GCCs?
> At least GCC 9.x would be really good.
>
> -Alexey
>  

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
