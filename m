Return-Path: <SRS0=KRsc=7R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1190C433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 23:56:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B6C4206F8
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 23:56:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dSUUfO/w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eo58V6vP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GilogHUZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B6C4206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klOJ1yBxM6E9qen1sBe4+89f1w5jedcxwrpSduedKYA=; b=dSUUfO/w0BxLRb
	2JVZZJvourbGqmNruo8V2gppEPUdiGBeIPMRM3I8raY8XFu43ExzgaPLMK28ueqTJMNCS8XgrcqYs
	uf/3Q/65y7v9iJthvauEtDWAz/J9z0RwR5tjC4kfkDblHuGaOrbsa8EjafmXbFh8JkT8lVnAeoAUM
	FroESQenUwZ1ARI+rdZTbDOmABCHmRtni+lj7pstyhSWDxmeUG/mVES5+ElCGPi+nvUaXRqRY7fd0
	UoElHWVise5S1JL0Tn1io2M0MxR7Exdrxcu6lg4gMPNUjV9/w+vqsGRvLXozyEWmJzDUtK2VjuCzp
	9RxujU1P2rGp6YaC+Cow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgzj2-0003uS-Jt; Thu, 04 Jun 2020 23:56:44 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgzj0-0003tV-J0
 for linux-snps-arc@lists.infradead.org; Thu, 04 Jun 2020 23:56:44 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 20B4FC0089;
 Thu,  4 Jun 2020 23:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591315000; bh=nKBUlJfszxjnHKfn/2yK9J5J5e4rt788PnVrBagY84M=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=eo58V6vP1nvEn/ao70Y0uz0PE5QFoQ8VeDtCP25enKxenv0ZFbHAB+4mMkLY/LCQ0
 tQWndJRnQLkwhljNkGLCiU7NZmTfuPqjCN7Az56Rddn6mQpMfL/NJWBWrLuCdgOXFT
 VCeXdAgrTI7SE7pkosSUIKvLx4V2pI3vFv2fFpjFK/m66pdUq1nWVlGy4sQofHFpyH
 J+bBKN7VhEU9C/uKLw3o8hsVtsGF7o9YVXonNl0dTS8tMJK89fRYTBjjnID4vfrPno
 1x79epXjULaLpuH1Z8QSrrLj+HDX4fR3nPiZ09gKdG4q6RS0TvK+2yN9kdAfY/ZwiV
 g7hFRvoWBhRZQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6AC13A0071;
 Thu,  4 Jun 2020 23:56:39 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 4 Jun 2020 16:56:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 4 Jun 2020 16:56:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqBICrRrZvqVD47SP/vUc8PzkqNxEddvdvuGHkUpebAuQj0zN4tvx6yyNV95gDi58NSJDxBJ7j0RIiUukkzBexaZ+b+T+E4Vf4NqiN3haTfXrz9eoi1y26u9Xx1G4EwkDKe9qsoUgc7TR1nuP1G3z9RY0BATHAN0qFsu2vgcOghD7K/ZOyzDb2+Okqof0RjsMjY5rkgIyNfnomof4/3I7sZ6DkLphnCRDUf+h+yoS7eMn6g6hdlX49EXhD5qgj2FBZeulIKFGDwKcGji+9OfBIY+7KjxHvYyabX7KNtzqc4lzml/PDk3+3HvXrDh1LbhxBlIJUvcEdH8jSPN1JwZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKBUlJfszxjnHKfn/2yK9J5J5e4rt788PnVrBagY84M=;
 b=FvHnXHxd02M72bXUhgEJDlVMczC1FH2jQonS++BWDpfc1Ypr5s+WiXrx7vWBDjWbj47Q51Y4hvZ90FCiz+cfRG4+1g6J64oWZGYdi6qb81jhHRFRxbVJtOT78mYT/7506wZoH3OYGKO2PSJZp6y2dN9v90LZ8M5oeyjQLLhyboLqVrnFZ4i/Ixp3KDrjP4UbZ/hIOU5UA80XviExzFICIITD26uqLUhHTVAAHpny59FBh3mgnceKTaiilOEKq/xYw2CvFkAaIah/9yEaIkE0y34S+bAZW/I+gt1SLUve1oSBABl8G29OwT0fkT7fEteueiasQPQTJMr50MIkR8BO+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKBUlJfszxjnHKfn/2yK9J5J5e4rt788PnVrBagY84M=;
 b=GilogHUZtnnXinyg7tnErx6UDX0tTX/hJeL8Cdt6BLUH7FKpB4Y0S4MMDh3+Re+r47g88YLZ42ujqEoS37qG71Wywr3vvlQdpBgXx3AsrswwnHFn4j0aMTqAl39MBnf8SjnwiWF1dKwR9QrpD9A/Ee9Tsj5pJFAoPsrkn2gJy2k=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3398.namprd12.prod.outlook.com (2603:10b6:a03:aa::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 4 Jun
 2020 23:56:37 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3066.019; Thu, 4 Jun 2020
 23:56:37 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fweimer@redhat.com>, Vineet Gupta via Libc-alpha
 <libc-alpha@sourceware.org>
Subject: Re: [PATCH v6 01/13] ARC: ABI Implementation
Thread-Topic: [PATCH v6 01/13] ARC: ABI Implementation
Thread-Index: AQHWOeJDZB/yK5sq0U6kMk4LJ9e8t6jIKsKlgACmfICAAFKOgA==
Date: Thu, 4 Jun 2020 23:56:37 +0000
Message-ID: <10ca0b6b-b20c-a555-6624-167faaca333d@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-2-vgupta@synopsys.com>
 <88508d10-2d29-026a-bb54-ad607154ab87@linaro.org>
 <a56a35d4-3e9e-9a88-4be5-8553d5f11ad3@synopsys.com>
 <87mu5jxkv7.fsf@oldenburg2.str.redhat.com>
 <009f0364-4089-a032-2cfc-beda06bfff2d@synopsys.com>
In-Reply-To: <009f0364-4089-a032-2cfc-beda06bfff2d@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 850a93e4-0c8d-45c0-66fb-08d808e2eb6e
x-ms-traffictypediagnostic: BYAPR12MB3398:
x-microsoft-antispam-prvs: <BYAPR12MB339899AA18E03F7A66411A1DB6890@BYAPR12MB3398.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:35;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qSrQZhRL8dFUZIxrbWg3Lai5EiYs/IuJ/SG4SF98mzFXZQknvXh7+F6p15s2mADpvU+nLEZl+99UGeJoP6MTrsu6xsf7aGzUZQfF8B45G2GnVxCnfh7CXDuG0+rhqeAt4VPw2q8BEee/IZnhD45+XM95V16SvoVcmQcEWOWoETeeXnnrNhKWtnjU8ov5sTXtX9iKGsCW4GX8C8igaorxrRj6lma4d4ul8MHac0ikljuIwPo7NmEzkLZoa0Gm5rvXjHExk2n9osUYQfSNQucFNRfMla/1xGMFWVxja75mAIOSo2W0WY3kUfk+M6uoGbQ9wUvHNVQ0wAGNI/7NzEt0Wc8LkmEHqKozwePumXfVBPKhVfD5ueSIM+YiMUBTJ1em
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(376002)(346002)(136003)(396003)(39860400002)(478600001)(66556008)(6512007)(316002)(66446008)(76116006)(110136005)(83380400001)(6486002)(8936002)(86362001)(31696002)(31686004)(36756003)(5660300002)(2906002)(6506007)(8676002)(71200400001)(66476007)(66946007)(53546011)(2616005)(4326008)(64756008)(186003)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 5RxXAS38svEGlIU9MKSGmgWcCgBFiJh70D0dzgCSnj0mJwj9U6TjGoR/jzc+53fpzH6MBjN/O2Cgg9UbiL2dlEtDeDmyrry+PEnV+CRu0M5cx6KbqCsm6Rrz605vDTA7wNp92IL28IjrhjbMzb7SO4SOJEu3VshhQG9m5wSkHFM3+lTY6/JatlzpTjLaB3GSbpz5YUIQuBeUMp6gCYUDHljCB+/GqNEjiXlRKxcixLrX0F2GNRQ/YI+RpZzaczDAEbeAnW5C2V1cJzO6EBi0EKfoT5pHwoGWAf5o+iOv45JYiVJWTJ8KUd9CzwVJZHS+6QDvgb57WhP+5FqLJkdnJs7W3aSp/YHC7+3rr0Uf+5IK5UxQYjKQRjsGk75tWtkOy3oYJAQAe9KWZWwPMN0GsTs+aqkFmJh59J7yIG0LfAH5dy8wJUth6yceC8gN2tqrvyNN3xJzfG8F7Lw6UgSC8bVKUXUffVKeaGIa5bnQsq9faugj2TE5V213gvc6+GV30DlZ8y/gi4w1lOtXvChkhs3/hUiGK6orjt1wBO/ti3yisEnKTavsY4iMxQMx6YCr
x-ms-exchange-transport-forked: True
Content-ID: <61CAE3202173534188AFE0B66480F95C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 850a93e4-0c8d-45c0-66fb-08d808e2eb6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 23:56:37.7198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0fbyESIKI+BvuHrvqsKWHuYsGqBKi/7qGNeTpikk/FAeuKBDJF6k3etQWBF+wnEUspE+rx6Xph/Qz85spCVzCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3398
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_165642_761845_7D03E7C2 
X-CRM114-Status: GOOD (  18.80  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gNi80LzIwIDEyOjAxIFBNLCBWaW5lZXQgR3VwdGEgd3JvdGU6DQo+IE9uIDYvNC8yMCAyOjA0
IEFNLCBGbG9yaWFuIFdlaW1lciB2aWEgTGliYy1hbHBoYSB3cm90ZToNCj4+ICogVmluZWV0IEd1
cHRhIHZpYSBMaWJjLWFscGhhOg0KPj4NCj4+PiBPbiA1LzI3LzIwIDExOjI2IEFNLCBBZGhlbWVy
dmFsIFphbmVsbGEgdmlhIExpYmMtYWxwaGEgd3JvdGU6DQo+Pj4+ICtFTlRSWSAoX19sb25nam1w
KQ0KPj4+PiArDQo+Pj4+ICsJbGRfcyByMTMsICAgW3IwXQ0KPj4+PiArCWxkX3MgcjE0LCAgIFty
MCw0XQ0KPj4+PiArCWxkICAgcjE1LCAgIFtyMCw4XQ0KPj4+PiArCWxkICAgcjE2LCAgIFtyMCwx
Ml0NCj4+Pj4gKwlsZCAgIHIxNywgICBbcjAsMTZdDQo+Pj4+ICsJbGQgICByMTgsICAgW3IwLDIw
XQ0KPj4+PiArCWxkICAgcjE5LCAgIFtyMCwyNF0NCj4+Pj4gKwlsZCAgIHIyMCwgICBbcjAsMjhd
DQo+Pj4+ICsJbGQgICByMjEsICAgW3IwLDMyXQ0KPj4+PiArCWxkICAgcjIyLCAgIFtyMCwzNl0N
Cj4+Pj4gKwlsZCAgIHIyMywgICBbcjAsNDBdDQo+Pj4+ICsJbGQgICByMjQsICAgW3IwLDQ0XQ0K
Pj4+PiArCWxkICAgcjI1LCAgIFtyMCw0OF0NCj4+Pj4gKw0KPj4+PiArCWxkICAgYmxpbmssIFty
MCw2MF0NCj4+Pj4gKwlsZCAgIGZwLCAgICBbcjAsNTJdDQo+Pj4+ICsJbGQgICBzcCwgICAgW3Iw
LDU2XQ0KPj4+PiArDQo+Pj4+ICsJbW92LmYgIHIwLCByMQk7IGdldCB0aGUgc2V0am1wIHJldHVy
biB2YWx1ZShkdWUgdG8gbG9uZ2ptcCkgaW4gcGxhY2UNCj4+Pj4gKw0KPj4+PiArCWouZCAgICBb
YmxpbmtdCTsgdG8gY2FsbGVyIG9mIHNldGptcCBsb2NhdGlvbiwgcmlnaHQgYWZ0ZXIgdGhlIGNh
bGwNCj4+Pj4gKwltb3YueiAgcjAsIDEJOyBjYW4ndCBsZXQgc2V0am1wIHJldHVybiAwIHdoZW4g
aXQgaXMgZHVlIHRvIGxvbmdqbXANCj4+Pj4gKw0KPj4+PiArRU5EIChfX2xvbmdqbXApDQo+Pj4N
Cj4+PiBTbyB3YW50ZWQgdG8gcGljayB5b3VyIGJyYWlucyBvbiB0aGlzIHRoaW5nLiBXaGlsZSBs
b25nam1wIGlzIG5vdCBuZWNlc3NhcmlseSBhbg0KPj4+IGFwcGxpY2F0aW9uIGhvdHNwb3QsIGl0
IHNlZW1zIGJ1bGsgbG9hZC9zdG9yZSBjYW4gaW4gZ2VuZXJhbCBiZW5lZml0IGZyb20gd2l0aA0K
Pj4+IEFSQ3YyIGRvdWJsZSBsb2FkL3N0b3JlIGluc3RydWN0aW9ucyBMREQvU1REIHdoaWNoIHdv
cmsgd2l0aCByZWdpc3RlciBwYWlycy4NCj4+Pg0KPj4+IFNvIHdlIGNvdWxkIGhhdmUgMiB2YXJp
YW50cyB3aGljaCBjb21waWxlIGRpZmZlcmVudGx5IHRvIG9uZSBydW50aW1lDQo+Pj4gaW1wbGVt
ZW50YXRpb24gb3IgYmV0dGVyIHN0aWxsIGhhdmUgMiBydW50aW1lIGltcGxlbWVudGF0aW9ucyB3
aGljaCBjb3VsZCBiZQ0KPj4+IHN3aXRjaGVkIHRvIHVzaW5nIGh3Y2FwcyAod2hpY2ggSSBjYW4g
YWRkIHRvIGtlcm5lbCkuIERvZXMgdGhhdCByZXF1aXJlIElGVU5DDQo+Pj4gd2hpY2ggQVJDIHRv
b2xjaGFpbiBkb2Vzbid0IHN1cHBvcnQgQVRNLg0KPj4NCj4+IFdpdGhvdXQgSUZVTkNzLCB5b3Ug
d291bGQgaGF2ZSB0byB1c2UgYSBjb25kaXRpb25hbCBicmFuY2ggaW4gdGhlDQo+PiAoc2luZ2xl
KSBfX2xvbmdqbXAgaW1wbGVtZW50YXRpb24uDQo+Pg0KPj4gV2l0aCBJRlVOQ3MsIGFsbCBpbnRl
cm5hbCBjYWxsZXJzIHdpbGwgaGF2ZSB0byBnbyB0aHJvdWdoIGEgZnVuY3Rpb24NCj4+IHBvaW50
ZXLigJRvciB0aG9zZSBpbnRlcm5hbCBjYWxsZXJzIHdvdWxkIGhhdmUgdG8gdHVybiBpbnRvIElG
VU5DcyBhcw0KPj4gd2VsbC4NCj4+DQo+PiBTbyBpdCdzIGRvdWJ0ZnVsIHdoZXRoZXIgdGhpcyBp
cyBiZW5lZmljaWFsIGluIHRoaXMgY2FzZS4NCj4+DQo+PiBBbHNvLCBwbGVhc2UgZG91YmxlLWNo
ZWNrIHRoZSByZWdpc3RlciBsaXN0LiAgVGhlIEFCSSBtYW51YWwgc2F5cyB0aGlzOg0KPj4NCj4+
IHwgVGhlIHNjcmF0Y2ggcmVnaXN0ZXJzIGFyZSBub3QgcHJlc2VydmVkIGFjcm9zcyBmdW5jdGlv
biBjYWxscy4gV2hlbg0KPj4gfCBjYWxsaW5nIGFuIGV4dGVybmFsIGZ1bmN0aW9uLCB0aGUgY29t
cGlsZXIgYXNzdW1lcyB0aGF0IHJlZ2lzdGVycyAlcjANCj4+IHwgdGhyb3VnaCAlcjEyIGFuZCAl
cjMwIGFyZSB0cmFzaGVkOyBhbmQgdGhhdCAlcjEzIHRocm91Z2ggJXIyOSBhcmUNCj4+IHwgcHJl
c2VydmVkLiAgVGhlIEVWNnggcHJvY2Vzc29yIHJlc2VydmVzICVyMjUuDQo+Pg0KPj4gcjI3IGFu
ZCByMjggYXJlIGhhbmRsZWQgYXMgZnAgYW5kIHNwLiAgVGhhdCBsZWF2ZXMgcjI2IGFuZCByMjkg
YXMNCj4+IHVuaGFuZGxlZC4NCj4gDQo+IHIyOSBpcyBJTElOSzEgKEludGVycnVwdCBMaW5rIFJl
Z2lzdGVyKSBhbmQgYWNjZXNzaWJsZSBvbmx5IGluIGtlcm5lbCBtb2RlIHNvIGNhbg0KPiBiZSBp
Z25vcmVkIGhlcmUuDQo+IA0KPiByMjYgaXMgR1AgYW5kIGluZGVlZCBjb3VsZCBiZSBwb3RlbnRp
YWwgcHJvYmxlbSBhbmQgdGh1cyBuZWVkcyBzYXZpbmcuIFRoZSByZWFzb24NCj4gaXQgaXMgbWlz
c2luZyBpbiBmaXJzdCBwbGFjZSBpcyB0aGUgaGlzdG9yaWMgdXNlIG9mIEdQIGFzICJQSUMgYXNz
aXN0IiByZWdpc3Rlcg0KPiB3aGljaCBoYXMgc2luY2UgYmVlbiByZXdvcmtlZCBpbiBjb21waWxl
cikuIEFzIG9mIHRvZGF5IHRoZSByZWdpc3RlciBhbGxvY2F0b3IgaXMNCj4gc2ltcGx5IGlnbm9y
aW5nIEdQLg0KPiANCj4+IHIyNSBzZWVtcyB0byBiZSB0aGUgdGhyZWFkIHBvaW50ZXIuICBJdCBj
YW5ub3QgY2hhbmdlIGl0cyB2YWx1ZSBiZXR3ZWVuDQo+PiBzZXRqbXAgYW5kIGxvbmdqbXAgYmVj
YXVzZSB5b3UgY2Fubm90IGxvbmdqbXAgb250byBhbm90aGVyIHRocmVhZCwgc28NCj4+IHNhdmlu
ZyBhbmQgcmVzdG9yaW5nIGl0IHNob3VsZCBub3QgYmUgbmVjZXNzYXJ5Lg0KPiANCj4gR29vZCBw
b2ludC4gVGhpcyBjYW4gYmUgcmVtb3ZlZC4NCj4gDQo+IEl0IHNlZW1zIHRoYXQgKmptcCBhbmQg
KmNvbnRleHQgcm91dGluZXMgZGVhbCB3aXRoIHNhbWUgc2V0IG9mIHJlZ3MgKGluIGRpZmZlcmVu
dA0KPiBzdHJ1Y3R1cmVzKSBhbmQgcGVyaGFwcyBJIHNob3VsZCBtYWtlIHRoZW0gcmV1c2UgYXNt
IGNvZGUuDQoNCkl0IHNlZW1zIGJldHRlciB0byBrZWVwIHRoZW0gc2VwZXJhdGUgYWZ0ZXJhbGwu
DQoNCk9uIHRoZSB0b3BpYyBvZiBBQkksIGFuZCBjb25zaWRlcmluZyB0aGUgZnV0dXJlIHBvcnQg
dG8gQVJDdjMgd2l0aCBzbGlnaHRseQ0KZGlmZmVyZW50IEFCSSBJJ20gdGhpbmtpbmcgSSBzaG91
bGQgc2ltcGxpZnkgdGhlIGV4aXN0aW5nDQpzeXNkZXBzL3VuaXgvc3lzdi9saW51eC9hcmMvc3lz
L3Vjb250ZXh0LmggKHBhdGNoIDgvMTMpIGJ5IG5vdCBuYW1pbmcgc3BlY2lmaWMNCnJlZ2lzdGVy
cyAod2hpbGUgc3RpbGwgYmVpbmcgY29tcGxpYW50IHdpdGggdGhlIGtlcm5lbCBleHBvcnRlZCBp
bnRlcmZhY2UpLg0KDQotVmluZWV0DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
