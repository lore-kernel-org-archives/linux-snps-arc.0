Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC695C38BE2
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 19:27:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8455D20836
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 19:27:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dajqz1ca";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WrfqGSIJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="Pz3r5fak"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8455D20836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJLAL57Myk4sqIQ3+3an/weJ/WKYhsZHZPt5IP2WrzQ=; b=dajqz1caYhIfwg
	cUt79IDe4GzNoq3cBk/DIShC6ElHVWOMuQRuaMXlBnlrgI/VyQ5tP6nsiZiyl5wkTPeGDu4NvlNpt
	HeTbu5HCa7H3ubMu6GAMdKA67t/oUzoE8z/mFEXYEJRrjLTo0cqnjU6PrOBmoLXTp1q1DsIsnt8ov
	DJCyXmtMI+7zZ9DOTMEPY7qQC8QTZW+pX1B6OBohGq0GXPgSvh6fKhhWD7lsd18yTJkN3LtAb/U8f
	Iu3V+kM07Kb7pAxxVN1UaNlba/jUrVPTdXTfLqAImdXkqbX2541Y/nYy8W24eGy4xx2krks6t+e3H
	ZCsFsD+fG4rpVf9uMK1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6JOR-0007pf-GA; Mon, 24 Feb 2020 19:27:51 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6JOP-0007pJ-26
 for linux-snps-arc@lists.infradead.org; Mon, 24 Feb 2020 19:27:50 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 62AD5C04DA;
 Mon, 24 Feb 2020 19:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582572468; bh=yOV7/rQoKQrA0NIUH3Nsfifn+cr5bMfne/sMeb3kVJk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=WrfqGSIJ3G6e/5fCcKbH9pFD879rreYh5HwcF5TcC29kwihCGIkTJCt0J5jiJCo00
 nl6go4A0t1SYDxzCoTBjAaQZgAtLIwvU8W0wHSeSBbfmluVUSShzpijxWG6O4ZB0l3
 vJqF5TdCRdS87BXpj0RCulJkKXHq4aoV//rcDMcm/zPzWAQ8SkvoxFTJk6bL8ne5t4
 H3WjbkTrmQF8hZOe05nZO+i0vgkKawj+IJR0muUmZBo91JNHaDLBtHt4Geu0q+4Fn5
 RTwy7lbR9hSs860SOsoavkUMUIT9Ghg7dURj4tZRE2hFgH5AO49aZnGvAvkb0AMqcg
 9T6ktfoWqFGWQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 32DE2A0086;
 Mon, 24 Feb 2020 19:27:48 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 24 Feb 2020 11:27:48 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 24 Feb 2020 11:27:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9y6EZEhs2khjWcnJSUVJXqcmn2T+FkjP9ehyM9P7MzFaaAiFVvwD2sxizLf5UCW4kESxt1xYUwHcRockHQ8A8IXJq4FQAC9xBcajCmhr3Eh3N+Z4+6QGEJD4+jtmc2OyWYjywMXYo9Hp34gGlXaTlJnVPwja5AAFAK+U4YcD27Im2+29xYOTcy65nC9aDJil0N9L+FzNfIB7drMnRVaEnH4lkgglf8ijhMN079gxs0Vg5/Ocu75cNPzJ2wOIrdg5vXb5L6ApPjEV3SnltRZdPHV45mGz5MMBP48dseRQKWw/ojfbUsu9K4yXFeLV/5IUImPr2IS15pTGX3KVcRc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOV7/rQoKQrA0NIUH3Nsfifn+cr5bMfne/sMeb3kVJk=;
 b=UCk0d8Y6DuJQaBzmlYuu7nsFemMRYWgxkWYebNrqXQRK8crivVWmBwIQJ+zmR/FQdkrxGYHHzLxVCurwrrZKwGKbRqOTPCLEgqkLXZ2/vED2kSvMizCmaWIfMpdNvhStXmMFUj+yR4Q/8mOF8zDtDOVH/6JJ9K1WJCzPq+dLqI+Kuuw/6pR+HrJA8dWPx8Zzvb/2ziiAKSggBGB+lvYElo6Ww9xq5vt/d9pc6vj8jJfR/0HfBqkeUTgpOm4OhDIu+se455+GHOVfg5517D5Ml9W4DFHrVXezP8EHbYZ16JyFbYG6nWWEMM/RHaY1RNHXG86RV1stVG/jXQNVc5IC6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOV7/rQoKQrA0NIUH3Nsfifn+cr5bMfne/sMeb3kVJk=;
 b=Pz3r5fakhZIrDghIo/+fMBs7o2T4+BEuOMJ7wWskzqCMO3iCtO/SatqeRoKxfcbBdDIQ+az3V2UabAn6jILFEDzAPHVvU7yEdOeNb3iD25/q8QN3gutzVwx1157sr1BZrtAa28oEGL2mI3uWoPqVqrfUsT34mMAtxnzt9kJ5EkU=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3093.namprd12.prod.outlook.com (2603:10b6:a03:dc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Mon, 24 Feb
 2020 19:27:46 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 19:27:46 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH] asm-generic ABI: Allow statx syscall despite
 fstatat64,fstat64
Thread-Topic: [PATCH] asm-generic ABI: Allow statx syscall despite
 fstatat64,fstat64
Thread-Index: AQHV6z+RR5ERkfrbXUGAB7RmYeDq3qgqrSHagAAGcgCAAAMHyoAAA+AA
Date: Mon, 24 Feb 2020 19:27:46 +0000
Message-ID: <b9937e72-f5f5-8e7f-3723-cccec83fb7ca@synopsys.com>
References: <20200224182305.28027-1-vgupta@synopsys.com>
 <87wo8bn839.fsf@oldenburg2.str.redhat.com>
 <d56495ad-c532-9e00-7f67-fa2626f9d901@synopsys.com>
 <87d0a3n6iq.fsf@oldenburg2.str.redhat.com>
In-Reply-To: <87d0a3n6iq.fsf@oldenburg2.str.redhat.com>
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
x-ms-office365-filtering-correlation-id: 0f556d00-c5ff-489c-794a-08d7b95fa0a3
x-ms-traffictypediagnostic: BYAPR12MB3093:
x-microsoft-antispam-prvs: <BYAPR12MB309331E440E08A116F7E3489B6EC0@BYAPR12MB3093.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(136003)(39860400002)(346002)(396003)(199004)(189003)(2616005)(8676002)(4744005)(6512007)(186003)(8936002)(81156014)(5660300002)(31696002)(6486002)(26005)(53546011)(6506007)(81166006)(54906003)(31686004)(66476007)(66556008)(4326008)(316002)(66446008)(86362001)(478600001)(66946007)(6916009)(71200400001)(2906002)(36756003)(64756008)(76116006)(41533002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3093;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fZKosrZL3aVQN3WOe7HjpMSy3vUyLX+gL/9gwyyO3RnhC+Rwuu6C4JyMpMzmMo4m7REbxr5wDj6w2CubpHao8pztCbjtxPVzLcGDYX/DkbURGaD9R9Xw6Gaf/aqcZ5eU7IznKgbSJ5lXCOnZx9oVw/RjtYWLsj2ZEkeFRlK6mOzr2icf7p2W3YY4K9H5ywHOrDz2drCF85DCI/femuy/bHClHNupvhgG8D8M4MRR8kFercCFl0GKPNZ8jtfGoKi5NZdC9bNNYg1QkxVLXp8jMl9DG5AyaAqCiuGWZTnDSp4rP2n2Kq9AKjCh+aIeJ4OJ07bBVGDLmxPN4/f//d92URwrFc+MwI6qPW0XdQNkiGVumGUqgBNg5w7+FIbT77QsJXlnDzDFZsBfoHozn0dkjmr3ks1zRaRtOT9rGByIwQAGdCqtxE7liex1k+V1+1KvGJGtcPzFFcLFdb7SMkLH9qXFCnAGOZpDDAVURrz9gBc=
x-ms-exchange-antispam-messagedata: FXMaXBJvQVgdHfkk8spkiIqPPuyZduOFINPA0cL8YH1GuZy48zSKvRFcFFosUhHRDDHewU8ODBqiaRnlq1J4fSW3s0dFeRZF/NoenOEqFxTKerKcL+c8NSQEfECxhki1TfIU115juAHM7uO0mXS3NQ==
x-ms-exchange-transport-forked: True
Content-ID: <AF60717D5E16C84BAC7D5C50BD819667@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f556d00-c5ff-489c-794a-08d7b95fa0a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 19:27:46.1715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R+DoM09gI0+iolByIT0xjwQ5odyLVdhCe96DbI/k9DnkYVJVrOvP/dhWOcJ3UdQ+OBG4N91u12+IB5qg8Mf85A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3093
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_112749_168791_FBFE512E 
X-CRM114-Status: GOOD (  12.83  )
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

On 2/24/20 11:13 AM, Florian Weimer wrote:
> * Vineet Gupta:
> 
>> On 2/24/20 10:39 AM, Florian Weimer wrote:
>>>> +# undef STAT64_IS_NOT_KERNEL_STAT64
>>> Sorry, I think that going forward, we prefer that such macros are always
>>> defined, with values 0 or 1 as appropriate.
>>
>> And that means we also need to additionally define this to 0 in all
>> ports which don't end up including the generic header ?
>
> Yes, or move the definition into its own header, with the default for
> *future* architectures (not the majority of the current architectures)
> in the header in the sysdeps/unix/sysv/linux directory.

Adding a new file would seem too kludgy. Adding it to existing arch headers is
still OK but then one needs to know what exact syscall ABI each arch has as even
asm-generic ones differ depending on when the linux port was merged. And the only
way to know that is to do a build for each arch or is there some documentation one
could refer to.

Thx,
-Vineet


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
