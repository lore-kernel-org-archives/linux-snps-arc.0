Return-Path: <SRS0=r7t1=4G=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D077C3404B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Feb 2020 23:05:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 323EE2173E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Feb 2020 23:05:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oXaauR8P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TGpSCGlx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="eq8ojNeF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 323EE2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUcxSW93uh/pzeZACJlfzVMM6Eyb4m/eD7Zo0MAjCZ4=; b=oXaauR8PR11AOT
	2kfwewfcmW/xSfdi6SW09pXmwYWwDleq4sLp4cuhJLvUgUkVazcwoDE5Z++OO8hGwWUthOKswUFBI
	5kUkknYnWTSfQ+gNF2FxZIaKdzhmJOLAaVItkFudRAHrna6FvpNzN9oML1s4GFJ88G5m03FtG3WMC
	UXxRTyaitdu9vRHJqn5WJI2grBlYXDljHXmxj78dx5w6cm6xiu9GkiVmAwVKVIblOfQUAg0Pxsugd
	3SJJ0BZ40N4MQwMZ+eLtz8f2JppW08Wxx3WvZ8KEHc8mmavmlg6HtC/jLR33cetRopyqIk+z5PSWH
	pfmifkZ1c2QffPRV+pdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4BwB-0001VG-G1; Tue, 18 Feb 2020 23:05:55 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Bw8-0001Up-82
 for linux-snps-arc@lists.infradead.org; Tue, 18 Feb 2020 23:05:53 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1C1DAC0091;
 Tue, 18 Feb 2020 23:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582067150; bh=pYHAp4LIIahE58DmrS/DA3WrDXsh5inDD2OBbmqwM0A=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=TGpSCGlxiX0kkKzMXVh0KH2i/+4wl2H9rgHcZAOvQOYCUbeodvT8RtdOq0eesSQfB
 hqCArPIGBe3LkMM+xVrPPSjgqDS8Hr8Q3IvKhcQyjfx3S+A6y0wbTjQeDuV6T3KJOD
 m+bt7IYIE+AdJxEiKP9Um7t+CfwZnMaKt7kOcs/SkQvt5+sbCiw1sCc7kqaWrMr0mP
 Q15tEw8uBPWj31lLelobZGXJUqoVMS0gH0AvCntJGmfsZ+bqXufZ3q7Z47QqRE5PP7
 gia1jFubUrrW85VgUWTQu4zjmWpdlIdVnkGSMPU0WuZZGwCwrDP0+coGqBFCI+kwzt
 7aII5AW3ZkWrQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4D7A5A0083;
 Tue, 18 Feb 2020 23:05:41 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 18 Feb 2020 15:05:30 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 18 Feb 2020 15:05:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYs0lKlF44cZnoI03x8nVnpWanwSOfK0N93Ysrp449ZFk8VumYRuZr0qvkyWct4hn2KVB8mHcneZdClQnWiRqlZ1AzA3guC0vshhUVanGwj7kHS1pn/5cVlSbC47gndCVp2j4KHU3UV+m2HiYpvkdd+AcJ2FRcvboGqa39CXkOPutmVr5jGD3SRFdJwSrdjN8XgMuTwWp+2zLe9CujstbduMK8aw6NvYxC0R9JUhsQJ/+DjBLiCypBLJyofD8QYMSwvw3rxzAD8+r9Zepu/JOxY9rtCovrCQuM8qd4e2XYCJgjMSAkByf1w80KHO3sbZht8eY1J6jQoMWtjWnwdnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYHAp4LIIahE58DmrS/DA3WrDXsh5inDD2OBbmqwM0A=;
 b=CYa2Azjx4JF5neQwmGtkQJdofCt5+xLvwazQpfJIbM4LycNtvXk1iBo0PWfO6LMqWyxkWV7BYK+pzuE3F7UwwMj8KGHtNtyM6ekfFCkuiOIIxblUW7VHybM5ZlY/2KrCYWnRNird0CeAeHYRCDl8CsquPGdCCL1mZLZwpPgLl4Mm/0VZTF1n9K/JTHagwfJ8CqSbDzTMdwQ6r5IzJeCKpBb9jh1Arb5t596ZWCciA+Mfs1hwPIDrOlVI8jHgtUhGROqu3Jfna6jTdEDKH+EkSyL1IX5O0Z9DyGOttKuNB8lc+xchq2ASyTCEYsjp0Ko0ytxqmvKYcjXjMMecOErKcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYHAp4LIIahE58DmrS/DA3WrDXsh5inDD2OBbmqwM0A=;
 b=eq8ojNeFsir38e5T9juMjgP8VLMZFBD4zQOuFVfEMS1WedWNvPd5yAvsv0j1x8wUTyMxHf8+eybazmoIS3dMIyCqrZJ8Uoy43UVjwjluRqPCw02AL87YMR0YR5M5nIXQsjV/9y3S/YEfEyYHzlvknumslgp8W0Yi7CyCVqQ1f3M=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3000.namprd12.prod.outlook.com (20.178.53.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.29; Tue, 18 Feb 2020 23:05:28 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24%7]) with mapi id 15.20.2729.032; Tue, 18 Feb 2020
 23:05:28 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Alistair Francis <alistair23@gmail.com>, Joseph Myers
 <joseph@codesourcery.com>
Subject: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use 64-bit
 time_t and off_t for RV32 and RV64)
Thread-Topic: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
Thread-Index: AQHV5q/pCFVOmaVdJ06JaXeiw0J3Vg==
Date: Tue, 18 Feb 2020 23:05:28 +0000
Message-ID: <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
In-Reply-To: <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 7f86992a-6250-4d1e-da3e-08d7b4c70b9e
x-ms-traffictypediagnostic: BYAPR12MB3000:
x-microsoft-antispam-prvs: <BYAPR12MB300006AB1B52838B6AE9A363B6110@BYAPR12MB3000.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 031763BCAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(39860400002)(376002)(136003)(396003)(199004)(189003)(86362001)(26005)(31686004)(5660300002)(66946007)(64756008)(66556008)(66476007)(66446008)(81166006)(81156014)(8676002)(76116006)(6486002)(6512007)(478600001)(316002)(8936002)(31696002)(2906002)(71200400001)(54906003)(36756003)(6506007)(53546011)(110136005)(7416002)(4326008)(2616005)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3000;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XIqTPiHkftjIF7ycSoasFoc2bUwRrdVYk/Y8Els0xRSZDeQBFYqwxzra/TY+51MQZdu+U5Zs7vVMkg9vrAmB/9dVTgQVUrTKKpnUL4rzCDRMFl6cvT12LPKSM81tQH3onTnMnZ59AE6B9aOL/ibr7An07YGFKIiCzMUhVzVujnAPK4vUdNwPBZwOeKjI4AHly1ghrDBDoXk6NiroKuVw037/cGhY+YBmYYw5tzq9IZMx8cKX7j310vc7KJuLASmL7FfxPtzFNRZRFy6fUAUABpYPQwptmvcYELn6sn59iIdNLfn6MrMgHThzInHeR5C5ajBBBPgK88dfYJjj/Ief/5D6vEBu+dfb9sfEUK1FW1w1tJobxB4t2dramnk2dtHZP2ArAjoqGzK4eUTYL0nbo0QOkOqeUedu5zbArQFIp9U/1R+oFqOfSxyS36oDM5J1
x-ms-exchange-antispam-messagedata: magRk5Gs9PyJ0dIM9DqDpLF9e9uZkTDYFkoDh0hudIZaIVez5ZAZOWvvMUutFkR5UbjUly0Fy8kBTbfRdbYNzCUGpSaBwMoEZWBqpt6g+U2pkXHEteEpa8Tq2ZpzqJbDv2IiSaHrN7Av420RuvJsQg==
x-ms-exchange-transport-forked: True
Content-ID: <0022C64F7BE2E14F99787537BE8B46FC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f86992a-6250-4d1e-da3e-08d7b4c70b9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2020 23:05:28.1156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B6Xfenajco28MdTDP7uGrzm6h1TrukWOpTqe9cXXQZy9Dagz3kn2gzEPVPRQCGDa9bfr+0JIFKQKuDNFY/KvcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3000
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_150552_426448_81FDFB42 
X-CRM114-Status: GOOD (  16.41  )
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
Cc: Florian Weimer <fweimer@redhat.com>,
 GNU C Library <libc-alpha@sourceware.org>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zongbox@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>,
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGkgQWxpc3RhaXIsIEFybmQNCg0KT24gMi8xNC8yMCAyOjM5IFBNLCBBbGlzdGFpciBGcmFuY2lz
IHdyb3RlOg0KPiBPbiBUdWUsIEZlYiAxMSwgMjAyMCBhdCA1OjMwIFBNIEpvc2VwaCBNeWVycyA8
am9zZXBoQGNvZGVzb3VyY2VyeS5jb20+IHdyb3RlOg0KPj4gT24gVHVlLCAxMSBGZWIgMjAyMCwg
QWxpc3RhaXIgRnJhbmNpcyB3cm90ZToNCj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvc3lzZGVwcy91
bml4L3N5c3YvbGludXgvcmlzY3YvYml0cy90eXBlc2l6ZXMuaCBiL3N5c2RlcHMvdW5peC9zeXN2
L2xpbnV4L3Jpc2N2L2JpdHMvdHlwZXNpemVzLmgNCj4+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+Pj4+PiBpbmRleCAwMDAwMDAwMDAwLi4wZGEzYmRlYjVkDQo+Pj4+PiAtLS0gL2Rldi9udWxs
DQo+Pj4+PiArKysgYi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9yaXNjdi9iaXRzL3R5cGVzaXpl
cy5oDQo+Pj4+IEkgd2FzIGhvcGluZyBuZXdlciBhcmNoZXMgY291bGQgc2ltcGx5IHVzZSB0aGUg
YXNtLWdlbmVyaWMgb25lID8NCj4+PiBXZSBuZWVkIHRvIHNwZWNpZnkgdGhhdCBSVjMyIHVzZXMg
YSA2NC1iaXQgdGltZV90LiBUaGUgZ2VuZXJpYyBvbmVzDQo+Pj4gZG9uJ3QgZG8gdGhhdCBmb3Ig
MzItYml0IGFyY2hlcy4NCj4+IFNpbmNlIGl0IHNlZW1zIHdlJ2QgbGlrZSBmdXR1cmUgMzItYml0
IHBvcnRzIG9mIGdsaWJjIHRvIHVzZSA2NC1iaXQgdGltZQ0KPj4gYW5kIG9mZnNldHMsIHdlIHNo
b3VsZCBtYWtlIHRoYXQgYXMgZWFzeSBhcyBwb3NzaWJsZS4NCj4+DQo+PiBUaGF0IGlzLCB5b3Ug
bmVlZCBhbiBSSVNDLVYtc3BlY2lmaWMgYml0cy90aW1lc2l6ZS5oLiAgQnV0IHlvdSBzaG91bGRu
J3QNCj4+IG5lZWQgYW4gUklTQy1WLXNwZWNpZmljIGJpdHMvdHlwZXNpemVzLmggLSByYXRoZXIs
IG1ha2UgdGhlIGxpbnV4L2dlbmVyaWMNCj4+IG9uZSBkbyB0aGUgcmlnaHQgdGhpbmcgZm9yIF9f
VElNRV9UX1RZUEUgYmFzZWQgb24gYml0cy90aW1lc2l6ZS5oLiAgQW5kDQo+PiBoYXZlIHNvbWUg
b3RoZXIgaGVhZGVyIHRoYXQgMzItYml0IGxpbnV4L2dlbmVyaWMgcG9ydHMgY2FuIHVzZSB0byBz
YXkNCj4+IHdoZXRoZXIgdGhleSB1c2UgdGhlIDY0LWJpdCBvZmZzZXQvc3RhdC9zdGF0ZnMgaW50
ZXJmYWNlLCB0aGF0DQo+PiBiaXRzL3R5cGVzaXplcy5oIGNhbiB1c2UgdG9nZXRoZXIgd2l0aCBp
dHMgZXhpc3RpbmcgX19MUDY0X18gY2hlY2ssIGFuZA0KPj4gbWFrZSB0aGUgZGVmaW5pdGlvbnMg
b2YgX19PRkZfVF9UWVBFIGV0Yy4gY2hlY2sgdGhhdCBhcyB3ZWxsLCBhbmQgdGhlbiB5b3UNCj4+
IHNob3VsZG4ndCBuZWVkIGFuIFJJU0MtVi1zcGVjaWZpYyBiaXRzL3R5cGVzaXplcy5oIC0gdGhl
IFJJU0MtVi1zcGVjaWZpYw0KPj4gaGVhZGVycyBzaG91bGQgYmUgc3RyaWN0bHkgbWluaW1hbC4g
IChObyBhcmNoaXRlY3R1cmUtc3BlY2lmaWMNCj4+IGJpdHMvdGltZTY0LmggaGVhZGVycyBzaG91
bGQgYmUgbmVlZGVkIGluIGFueSBjYXNlLikNCj4gT2ssIEkgaGF2ZSB1cGRhdGVkIHRoaXMuIEkn
bGwgc2VuZCB0aGUgcGF0Y2ggb25jZSBteSAiQWx3YXlzIHVzZQ0KPiAzMi1iaXQgdGltZV90IGZv
ciBjZXJ0YWluIHN5c2NhbGxzIiBzZXJpZXMgaXMgaW4gKHRoZSBoZWFkZXJzIGFyZQ0KPiBjaGFu
Z2VkIGluIHRoYXQgc2VyaWVzKS4NCg0KSSBndWVzcyB5b3UgaGF2ZW4ndCBwdXNoZWQgY2hhbmdl
cyB5ZXQsIHdoaWNoIGRvbid0IG1ha2UgZnVsbCBjb3B5IG9mIHR5cGVzaXplcy5oID8NCg0KQW55
aG93IEkgaGF2ZSBhIHZlcnNpb24gYmFzZWQgb24geW91ciBwcmlvciBuZXh0IGJyYW5jaCB3aGVy
ZSBJIHN3aXRjaGVkIEFSQyB0bw0KNjQtYml0IHRpbWVfdCAtIHRoaW5ncyB3b3JrIGZpbmUgaW4g
Z2VuZXJhbCBidXQgSSBzZWUgc29tZSBhZGRpdGlvbmFsIGZhaWx1cmVzDQp3aXRoIHRoZSB0ZXN0
c3VpdGUuDQoNCkNvbnNpZGVyIGlvL3Rlc3Qtc3RhdDIuYyB3aGljaCBjYWxscyBzdGF0KCkgYW5k
IHN0YXQ2NCgpIGFuZCBjb21wYXJlcyB0aGUgcmVzdWx0czoNCml0IG5vdyBmYWlscyBmb3IgY3Rp
bWUgbWlzbWF0Y2gNCg0KfCAuLi4NCnwgc3RfYXRpbWU6IFs3Ml0gNjQ0MjQ1MDk0NDA1NTc2MDcw
IHZzIFs3Ml0gNjQ0MjQ1MDk0NDA1NTc2MDcwwqAgT0sNCnwgc3RfbXRpbWU6IFs4OF0gMTk3NTY4
NDk1NjE2MDAwMDAwMCB2cyBbODhdIDE5NzU2ODQ5NTYxNjAwMDAwMDDCoCBPSw0KfCBzdF9jdGlt
ZTogWzEwNF0gMCB2cyBbMTA0XSAyMzA2MzUxODc2OTM4OTI0MDM1wqAgRkFJTA0KDQoNCkluIGtl
cm5lbCBhc20tZ2VuZXJpYyBzdGF0NjQgaGFzIDMyLWJpdCBjdGltZSAoc2VjcykNCg0KwqDCoMKg
IHN0cnVjdCBzdGF0NjQgew0KwqDCoMKgIC4uLg0KwqDCoMKgIMKgwqDCoCBpbnTCoMKgwqAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdF9hdGltZTvCoMKgwqAgwqDCoMKgIMKgwqDCoCA8
LS0gb2Zmc2V0IDcyDQrCoMKgwqAgwqDCoMKgIHVuc2lnbmVkIGludMKgwqDCoCBzdF9hdGltZV9u
c2VjOw0KwqDCoMKgIMKgwqDCoCBpbnTCoMKgwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdF9tdGltZTvCoMKgwqAgwqDCoMKgIMKgwqDCoCA8LS0gb2Zmc2V0ICo4MCoNCsKgwqDCoCDC
oMKgwqAgdW5zaWduZWQgaW50wqDCoMKgIHN0X210aW1lX25zZWM7DQrCoMKgwqAgwqDCoMKgIGlu
dMKgwqDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0X2N0aW1lO8KgwqDCoCDCoMKg
wqAgwqDCoMKgIDwtLSBvZmZzZXQgOTINCsKgwqDCoCDCoMKgwqAgdW5zaWduZWQgaW50wqDCoMKg
IHN0X2N0aW1lX25zZWM7DQrCoMKgwqAgLi4uDQrCoMKgwqAgfTsNCg0KSW4gZ2xpYmMsIHdlIGhh
dmUgNjQtYml0IHRpbWVfdCBiYXNlZCB0aW1lc3RhbXBzIHNvIHRoZSBzdHJ1Y3R1cmUgZGl2ZXJn
ZXMgd2l0aA0Ka2VybmVsIGNvdW50ZXJwYXJ0IGZyb20gdGltZSBmaWVsZHMgb253YXJkcy4NCg0K
wqDCoMKgIF9fZXh0ZW5zaW9uX18gdHlwZWRlZiBfX2ludDY0X3QgX190aW1lX3Q7wqDCoMKgIMKg
wqDCoCA8LS0gQVJDIHN3aXRjaGVkIHRvIDY0LWJpdCB0aW1lX3QNCg0KwqDCoMKgIHN0cnVjdCB0
aW1lc3BlYw0KwqDCoMKgIHsNCsKgwqDCoCDCoCBfX3RpbWVfdCB0dl9zZWM7wqDCoMKgIDwtLSA4
DQrCoMKgwqAgwqAgbG9uZyBpbnQgdHZfbnNlYzvCoMKgwqAgPC0tIDQNCsKgwqDCoCDCoCBpbnQ6
IDMyO8KgwqDCoCDCoMKgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPC0tIDQNCsKgwqDCoCB9Ow0K
DQrCoMKgwqAgc3RydWN0IHN0YXQ2NA0KwqDCoMKgIMKgIHsNCsKgwqDCoCAuLi4NCsKgwqDCoCDC
oMKgwqAgc3RydWN0IHRpbWVzcGVjIHN0X2F0aW07wqDCoMKgIDwtLSBvZmZzZXQgNzINCsKgwqDC
oCDCoMKgwqAgc3RydWN0IHRpbWVzcGVjIHN0X210aW07wqDCoMKgIDwtLSBvZmZzZXQgKjg4Kg0K
wqDCoMKgIMKgwqDCoCBzdHJ1Y3QgdGltZXNwZWMgc3RfY3RpbTvCoMKgwqAgPC0tIG9mZnNldCAx
MDQNCsKgwqDCoCDCoMKgwqAgaW50IF9fZ2xpYmNfcmVzZXJ2ZWRbMl07DQrCoMKgwqAgwqAgfTsN
Cg0KSG93ZXZlciBnbGliYyBzdGF0NjQoKXdyYXBwZXIgY2FsbHMNCnN5c2RlcHMvdW5peC9zeXN2
L2xpbnV4L2dlbmVyaWMvd29yZHNpemUtMzIveHN0YXQ2NC5jDQoNCndoaWNoIGZvciBBUkMgaXMg
anVzdCBkb2luZyBhIHBhc3MgdGhydSBzeXNjYWxsIGJlY2F1c2Ugd2UgZG8gaGF2ZSBfX05SX2Zz
dGF0YXQ2NA0KLSBoZW5jZSB0aGUgaXNzdWVzIEkgc2VlLg0KDQpJdCBuZWVkcyBpdGVtaXplZCBj
b3B5DQoNCsKgwqDCoCBfX3hzdGF0NjQgKGludCB2ZXJzLCBjb25zdCBjaGFyICpuYW1lLCBzdHJ1
Y3Qgc3RhdDY0ICpidWYpDQrCoMKgwqAgew0KwqDCoMKgICNpZmRlZiBfX05SX2ZzdGF0YXQ2NA0K
wqDCoMKgIMKgwqDCoCDCoCByZXR1cm4gSU5MSU5FX1NZU0NBTEwgKGZzdGF0YXQ2NCwgNCwgQVRf
RkRDV0QsIG5hbWUsIGJ1ZiwgMCk7DQrCoMKgwqAgI2Vsc2UNCsKgwqDCoCAuLi4uDQrCoMKgwqAg
wqDCoMKgIMKgIGludCByYyA9IElOTElORV9TWVNDQUxMIChzdGF0eCwgNSwgQVRfRkRDV0QsIG5h
bWUsIEFUX05PX0FVVE9NT1VOVCwNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTVEFUWF9CQVNJQ19TVEFUUywgJnRtcCk7DQrCoMKg
wqDCoMKgwqDCoCBfX2NwX3N0YXQ2NF9zdGF0eCAoYnVmLCAmdG1wKTsNCsKgwqDCoCAjZW5kaWYN
Cg0KQW4gdGhlIHJlYXNvbiB0aGlzIGFsbCB3b3JrcyBvbiBSSVNDViBpcyB0aGF0IHlvdXIga2Vy
bmVsIGRvZXNuJ3QgZGVmaW5lDQpfX0FSQ0hfV0FOVF9TVEFUNjQgLT4gbGFja3MgX19OUl9zdGF0
YXQ2NCBhbmQgaW5zdGVhZCB1c2VzIHRoZSBzdGF0eCBjYWxsIHdoaWNoDQpkb2VzIGl0ZW1pemVk
IGNvcHkgYW5kIHdvdWxkIHdvcmsgZmluZSB3aGVuIGNvcHlpbmcgZnJvbSAzMi1iaXRzIHRpbWUg
KGluIGtlcm5lbCkNCnRvIDY0LWJpdHMgY29udGFpbmVyIGluIGdsaWJjLiBJcyB0aGlzIGlzIHJp
Z2h0IHVuZGVyc3RhbmRpbmcgb3IgYW0gSSBtaXNzaW5nDQpzb21ldGhpbmcgaGVyZS4NCg0KSG93
IGRvIEkgYnVpbGQgYSBsYXRlc3QgUklTQ1YgMzItYml0IGtlcm5lbCArIHVzZXJsYW5kIC0gZG8g
eW91IGhhdmUgYSBidWlsZHJvb3QNCmJyYW5jaCBzb21ld2hlcmUgdGhhdCBJIGNhbiBidWlsZCAv
IHRlc3Qgd2l0aCBxZW11ID8NCg0KVGh4LA0KLVZpbmVldA0KDQoNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBs
aXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
