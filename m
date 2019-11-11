Return-Path: <SRS0=N5rj=ZD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01E8C43331
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 18:47:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C29F520674
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 18:47:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gN/rMP3C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ztvq7m59";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="oVC9ZaAZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C29F520674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPPQ2YvcBi1i4RBKV8I+jO6CB46oO4YEBbRycRMx4+s=; b=gN/rMP3Curwh7o
	wdrUIcxFUNCWvTXPPTn1WyUfylQjdMAAfPcCsR3VdjKNTlPyM/bh5/MIB2re+urH8u81Dg++2syYc
	tLdRksSdXBho6DYyprhu8JNCF3B63ANz3/PrBdK+2lIBAj+cm9mfqib2Jd8IfCSlrBeKCYsqUSVQU
	+Gkcc3VmxRrgmo+36mQ0g2OuUGqUjTem1CL4pJXhslYPr2BJcK26bsiHQaO8cZu4P9Bd89VBRnCbF
	j3JE/uwTn/NOhOMZb5OtJsziDcB//akj+LVNhH4D1XUQXpeWGFO7uGC17fNmzhxEV3VyBi0AO5Zrq
	yfNIaNtDr09CTGHrVBYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUEil-0006wa-Gu; Mon, 11 Nov 2019 18:47:27 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUEii-0006vE-En
 for linux-snps-arc@lists.infradead.org; Mon, 11 Nov 2019 18:47:25 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 34886C005A;
 Mon, 11 Nov 2019 18:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573498041; bh=IIagoJsu2/kAF+K8HaZUuZ7/7dFn/LYlawXvinzIQno=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Ztvq7m59J5+r/ZwGdOK+jZfnLfGAGqOBQbOBr14gnIBkUCZQnCznx8XcxnvGSMzrO
 N9lllo9NkvZRg/NWds36im5662t9S9h+2iGJQW0IrdvB1ixu+Q19ITuhwggEJqzCzL
 2IuFsjMGUAvKRsy0EqApar3QlWx9+tbEmKueiSl4pwxMgpFotsXI735SfoEj6yQlnP
 HzC1Bj3Vm2kaYz1vCWWutW2VNw3WhZAJXoOoZ8zmMQrzQqR5UIJW2QdjshVIOqQG41
 uwbmfYpgyX2xEe/gAPtEeJUywfP4yG6sP/ryfOWQasFCBOiPBiK7pszxgDQbnl9156
 DQ9ywlQRZal7g==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 00B0CA006F;
 Mon, 11 Nov 2019 18:47:13 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 11 Nov 2019 10:47:09 -0800
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 11 Nov 2019 10:47:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJHB1FoqmGLiA2zPzX0JJjk8jPUgVdSroZnrLH2OpjjLO60fZPlv5F9pQu0kIWa99yb21/d/99CRmLu6yeYUEzG5Oot+b0Wbbv7qozRwcWrlRJ7hwRlhyLR++kNXuIdL2WwX8Dqbker+KUCbBMfzgpK+bnpUhe3xte1XFuWLySo5fJNSNckYIBhe5aN2rxhIxFxgebrzpvTjYUPd54KgfEouXkFjH2oQKnBlnYsLn7I7QtNuc7L23TGw99W6rsjCOjpdPZv4kR00pJG9NGW3TGAbo4WS/RoFU4iXBb+BDmRoIYKI6KEgHhAqWmh6Y/Ay/a550+/Ys+0rG0Vf1bvdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIagoJsu2/kAF+K8HaZUuZ7/7dFn/LYlawXvinzIQno=;
 b=nE+N/1oKRHx13StTZndcFUMVZC9mc01T4ZMwF6/wAoTplHC8OX321DU21HuThKQgKEGtsQDehvtEPE3Lwc3biHPIeEIMCoh5RW/tDIH/uaOhhXXY2CeIpjYVj6TK+2gmXEtmQEnjDVlsaS+x3Hjtn6k/JXk8fBB2TKQvILwDhqfk04fmQFrJJ2vBYwmXylYJ+5T1x1RmgnrJBqm3mATChYOrQ2iLCitUC8jnurD0Ea8oybA/57tUP3FqhuBZF1rw6ka0Ge1RWr//jxXgRdNAga1+M0Qv0lluL3bk/RciGJ7WxXPq+qA2MMEiM19YQjOjj5ECcLlqZmZ156/lw+LoWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIagoJsu2/kAF+K8HaZUuZ7/7dFn/LYlawXvinzIQno=;
 b=oVC9ZaAZGFOM2NlFmmaDDiXFIlri6X5gGC3QFC4k5+C96AudPY1CWW+ZheSIgsmLnA9ZeSK3/tIUoWweje+3VtwqBLjyVLvfFXnbXotnZNOgkUsDKKsAXbnXHtOFSXuNQ54FysgBbR4zXqC794Hj9PHv8Kk0943B1E7Rcfk0uwU=
Received: from DM6PR12MB4089.namprd12.prod.outlook.com (10.141.184.211) by
 DM6PR12MB3210.namprd12.prod.outlook.com (20.179.105.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Mon, 11 Nov 2019 18:47:07 +0000
Received: from DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd]) by DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd%5]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 18:47:07 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/3] arch/config.in.arc: Introduce the ARC
 optimized hs38 config
Thread-Topic: [Buildroot] [PATCH 1/3] arch/config.in.arc: Introduce the ARC
 optimized hs38 config
Thread-Index: AQHVlwQ5JRKddvHAsUiu4CabG7QmWaeGUssA
Date: Mon, 11 Nov 2019 18:47:07 +0000
Message-ID: <1112f6a7-8a23-6cd9-0af0-76e0b92e496b@synopsys.com>
References: <20191108174112.28183-1-vgupta@synopsys.com>
 <20191108174112.28183-2-vgupta@synopsys.com>
 <20191109144656.3da6a1b0@windsurf>
In-Reply-To: <20191109144656.3da6a1b0@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53f909e8-1b7d-4e5b-c62c-08d766d78d57
x-ms-traffictypediagnostic: DM6PR12MB3210:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB321044BBC115DE3F0F2570CAB6740@DM6PR12MB3210.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(136003)(39860400002)(376002)(366004)(189003)(199004)(31696002)(486006)(71190400001)(71200400001)(76176011)(6506007)(102836004)(2906002)(53546011)(99286004)(6916009)(476003)(7736002)(11346002)(31686004)(446003)(26005)(25786009)(66066001)(2616005)(65806001)(65956001)(36756003)(3846002)(305945005)(4326008)(86362001)(6436002)(6116002)(66476007)(66556008)(64756008)(229853002)(6512007)(14454004)(478600001)(186003)(8936002)(66446008)(316002)(8676002)(81156014)(81166006)(256004)(5660300002)(66946007)(6486002)(76116006)(58126008)(6246003)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR12MB3210;
 H:DM6PR12MB4089.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9+9q968nSUn2qU6j5y3+IlQRLIL71PoCgh6aiQ6sEFg1i2dvy9w+MtcR+R3lSGY6HZdUk7FBlAeefjEFD6NE+M8HPia2n0GMLqvL13l5Y6M70PrM7Eh2olS9jRHC2AUtpPuXyyX/Z6jKDW1QHwBKwldZPUYq3gczGF4+txc9dn2seKQ6pzbYZMmKy8ek2mYmRmvpgVg0456ky9DxBxvQ2NfdovJCybuMtSv7IlLeHMuEd7mfr61y42KxbX/rCCZ7wtrBuYhZWeJUBJxxlVRRVRMrtINKr55PitROJKHV0C6/mUNvYDLYlRNeoi8a41gcY2py2YQCO8bxT1uWfcm+apo4WsZg5VNX8o7O974O8RyawuYbpRrUj0WcSjSlOJa6jeMiZQd/PgnzjPj7R58Ev2mr1FGNjsUvI5pLLxMq8ogrOiaEZSq3DQukre2TC8/w
Content-ID: <8DE2DF31AE899442867961B49F0D700C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f909e8-1b7d-4e5b-c62c-08d766d78d57
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 18:47:07.0251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F+0rCaNDCDv1GEk8q3IZ3snr8pwEDTax9WrQ1I0BkBYJyF8k5fgyuqp7YJIabRH/CiNN/HHr7R5pvnLlGYwtxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3210
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_104724_573464_AA8A92E9 
X-CRM114-Status: GOOD (  18.94  )
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
Cc: "buildroot@busybox.net" <buildroot@busybox.net>,
 Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Arnout Vandecappelle <arnout@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGkgVGhvbWFzLA0KDQpPbiAxMS85LzE5IDU6NDYgQU0sIFRob21hcyBQZXRhenpvbmkgd3JvdGU6
DQo+IEhlbGxvLA0KPg0KPiArQXJub3V0IGZvciBsZWdhY3kgaGFuZGxpbmcuDQo+DQo+IE9uIEZy
aSwgIDggTm92IDIwMTkgMDk6NDE6MTAgLTA4MDANCj4gVmluZWV0IEd1cHRhIDxWaW5lZXQuR3Vw
dGExQHN5bm9wc3lzLmNvbT4gd3JvdGU6DQo+DQo+PiBUaGlzIGNvcnJlc3BvbmRzIHRvIC1tY3U9
aHMzOCB3aXRoIG1weS1vcHRpb249OSAoNjQtYml0IG11bHRpcGxpZXIpDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogVmluZWV0IEd1cHRhIDx2Z3VwdGFAc3lub3BzeXMuY29tPg0KPj4gLS0tDQo+PiAg
YXJjaC9Db25maWcuaW4uYXJjIHwgMjEgKysrKysrKysrKysrKystLS0tLS0tDQo+PiAgMSBmaWxl
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL2FyY2gvQ29uZmlnLmluLmFyYyBiL2FyY2gvQ29uZmlnLmluLmFyYw0KPj4gaW5kZXgg
YzY1YmIwMWYxZjRmLi4yODQ5NTFiODJjZWUgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL0NvbmZpZy5p
bi5hcmMNCj4+ICsrKyBiL2FyY2gvQ29uZmlnLmluLmFyYw0KPj4gQEAgLTExLDEzICsxMSwxOSBA
QCBjb25maWcgQlIyX2FyYzc1MGQNCj4+ICBjb25maWcgQlIyX2FyYzc3MGQNCj4+ICAJYm9vbCAi
QVJDIDc3MEQiDQo+PiAgDQo+PiAtY29uZmlnIEJSMl9hcmNoczM4DQo+PiArY29uZmlnIEJSMl9h
cmNocw0KPj4gIAlib29sICJBUkMgSFMzOCINCj4+ICAJaGVscA0KPj4gIAkgIEdlbmVyaWMgQVJD
IEhTIGNhcGFibGUgb2YgcnVubmluZyBMaW51eCwgaS5lLiB3aXRoIE1NVSwNCj4+IC0JICBjYWNo
ZXMgYW5kIG11bHRpcGxpZXIuIEFsc28gaXQgY29ycmVzcG9uZHMgdG8gdGhlIGRlZmF1bHQNCj4+
ICsJICBjYWNoZXMgYW5kIDMyLWJpdCBtdWx0aXBsaWVyLiBBbHNvIGl0IGNvcnJlc3BvbmRzIHRv
IHRoZSBkZWZhdWx0DQo+PiAgCSAgY29uZmlndXJhdGlvbiBpbiBvbGRlciBHTlUgdG9vbGNoYWlu
IHZlcnNpb25zLg0KPj4gIA0KPj4gK2NvbmZpZyBCUjJfYXJjaHMzOA0KPiBUaGlzIHJlLXVzZSBv
ZiBhbiBleGlzdGluZyBuYW1lIGlzIGEgYml0IGFubm95aW5nLiBJbmRlZWQsIGFsbCBleGlzdGlu
Zw0KPiB1c2VycyBvZiBCdWlsZHJvb3QgdGhhdCBoYXZlIGEgY29uZmlndXJhdGlvbiB3aXRoIEJS
Ml9hcmNoczM4IHdpbGwgbm93DQo+IGJlIGJ1aWxkaW5nIGZvciBhIEFSQyBzeXN0ZW0gd2l0aCBh
IDY0LWJpdCBtdWx0aXBsaWVyLCB3aGlsZSB0aGV5IHdlcmUNCj4gcHJldmlvdXNseSBidWlsZGlu
ZyBmb3IgYSAzMi1iaXQgbXVsdGlwbGllci4NCj4NCj4gSSBzZWUgdGhhdCB3aGF0IHlvdSBoYXZl
IGRvbmUgaXMgdG8gdHJ5IHRvIGJlIGNvbnNpc3RlbnQgYmV0d2VlbiB0aGUNCj4gQlIyXyBvcHRp
b25zIGFuZCB0aGUgZ2NjIG9wdGlvbnMuIEknbSBoZXNpdGF0aW5nIGJldHdlZW4ga2VlcGluZyB0
aGUNCj4gY29uc2lzdGVuY3kgYnV0IG1ha2luZyB0aGUgbWlncmF0aW9uIGEgYml0IGFubm95aW5n
IGZvciB1c2Vycywgb3INCj4gYnJlYWtpbmcgdGhlIGNvbnNpc3RlbmN5IHRvIG1ha2UgdGhlIG1p
Z3JhdGlvbiBzbW9vdGggZm9yIHVzZXJzLg0KPg0KPiBTaW5jZSBJIHRoaW5rIHRoZSBudW1iZXIg
b2YgYWZmZWN0ZWQgdXNlcnMgd2lsbCBwcm9iYWJseSBiZSBxdWl0ZQ0KPiBzbWFsbC9saW1pdGVk
LCBJIHRoaW5rIEkgd291bGQgYmUgZmluZSB3aXRoIG1lcmdpbmcgeW91ciBwYXRjaCBhcy1pcywN
Cj4gYnV0IEknZCBsaWtlIHRvIGhlYXIgZnJvbSBvdGhlcnMuDQoNCkkgYWdyZWUgdGhhdCB0aGlz
IG1pZ2h0IGNhdXNlIHBvdGVudGlhbCBicmVha2FnZSwgYnV0IHRoaXMgaXMgbm90IHRvdGFsbHkN
CnVuY2hhcnRlZCB0ZXJyaXRvcnkgZm9yIHNvZnR3YXJlIGJ1aWxkIGNvbmZpZy4gV2UndmUgYmVl
biBidWlsZGluZyBMaW51eCBrZXJuZWwNCndpdGggdGhpcyBvcHRpb24gYXMgZGVmYXVsdCBzaW5j
ZSBtaWQgMjAxOC4NCg0KMjAxOC0wOS0wNyAwMGE5OTMzOWYwYTMgQVJDdjI6IGJ1aWxkOiB1c2Ug
bWNwdT1oczM4IGlzbyBnZW5lcmljIG1jcHU9YXJjaHPCoA0KDQpHcmFudGVkIHRoYXQga2VybmVs
IGJ1aWxkIGlzIGp1c3Qgb25lIHBhcnQgb2YgcHV6emxlIGFuZCBhbnkgbGF0ZW50IGNvZGVnZW4g
aXNzdWVzDQphcmUgbW9yZSBsaWtlbHkgdG8gc3VyZmFjZSB3aXRoIGRlZmF1bHQgYXBwbGllZCB0
byBmdWxsIHNvZnR3YXJlIHN0YWNrLCBJIHdvdWxkDQpzdGlsbCB2b3RlIGZvciBzd2l0Y2hpbmcg
ZGVmYXVsdCB0byAtbWNwdT1oczM4DQoNClRoeCwNCi1WaW5lZXQNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBs
aXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
