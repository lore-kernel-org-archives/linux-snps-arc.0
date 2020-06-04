Return-Path: <SRS0=KRsc=7R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6055AC433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 19:01:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 342ED206C3
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 19:01:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f1XoZy0a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AcFtzvNc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mGpf7pAz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 342ED206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qtzvWW4G0+Ziq94n3VmE0QTRBfhiiRPeaWTAnz0ffCg=; b=f1XoZy0az3etC6
	CUWs3xRweV346l00ehDS6fCElt/t3JWwh5o6+bmUJDr067YlZcxCuCr5WISPz4mKhQamTcI3bUY/4
	dJ7show7kJmKW+PolXiVNKQb9qoMHKxtsYZD39AQlBFC69aE8TXRjBUy0SP6VGn2Y/p/kSghlXeZp
	ovfJLu9rnABYyEZU2e3pR5mLCVR8W08N8qN0UpdL+5ijAP4vEnN+15z3/2URTS6XNnkfi649E/ae5
	G8Uq7nmMxXvGH4cpwblEDjZ6WG/JVFqENSIYglROcy5Afz3FWvoYDdblc10HrDrMkfsEftNpa3gla
	JFnjvGQxP8xOTQr+PMJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgv7H-0003Oe-Em; Thu, 04 Jun 2020 19:01:27 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgv7E-0003OH-PX
 for linux-snps-arc@lists.infradead.org; Thu, 04 Jun 2020 19:01:26 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BB29CC0081;
 Thu,  4 Jun 2020 19:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591297283; bh=FWfAV43p4vV489KPEQiGuhFFwKKma7anaMg6SOMcoC4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=AcFtzvNcO+uKws6L1psCKqLJAEOWMGes51LU05xu3WRaEEZdpVgbwKSI8WBi1/8wy
 iAmmLTMGeuf68I7VB3HKAKX716frLcIa8W1d++v7jmccz9B0KT391CNim0xWPJbkVl
 i0kx2rxHra//l/zVvAUbaZVS4/vUaIQAgjyNqb1lgyT1dr8fGbjMEKcohSg9bbYnHt
 eSK6W6PR/E/8txJSNzkAMFRI1AvaKKwyNtWs/yc+mK/yLGDYA4xivvwPVBUAjcL8Ll
 lHfW63UfLsGA6nayNq84gJGcqESaAz2xTw4Qeb5PVW9no5ZxySZC5r9p0ROblIS8na
 VH1z5Df+YxFMw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 39794A0067;
 Thu,  4 Jun 2020 19:01:23 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 4 Jun 2020 12:01:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 4 Jun 2020 12:01:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THrZ3IU3SjkGjsnOHzi1NIfqxjtS82S9u+4bvI6OxCnV0tcP+Yho5TWcN6d+O5Tb/CeCWLTzPlom15GgIDgBwjVQOgDuKHh7kJ5eVFfmXk6J4hRQ7CiG8qs9WUGcFbDziOZqafBKDcheIdJVpReacVXt36dlA+7oBVbLGUJRUbdLA84yjkCKOqoI3DDkEHX6Lp2nL6ZFmPjtwXwUa1KJaURkTQ5ij2CUs/1NdNvu+zPBm2sQG+lYQbho4085oTf1fbPbT1qE2rrkbtPUL3NqrbKm1XJbYF0yFZcgkUsDQ1Ou0z3bCRrxG91xH0DRw3D7/DR54nWJCVBX5Y6vPBKZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWfAV43p4vV489KPEQiGuhFFwKKma7anaMg6SOMcoC4=;
 b=acMhLfnsISfdMS88mX1cPhpIR3GmMDcsFiRo96u+ep42pmXQcroIj6EvKnph4BlDlPRynkMDEdS2UyN1BrqBJaGo1n2aNU8Ye3gl1OcdhfUrrF1Akjn14wPQwsLbATv1q/V/34jPkPXBCZm3Fpg+0Mq39IFeABGA87G6U8qrIX2pZJy+MMSCsxU16iUYeU9CDW5tYoM/GJo67hYg+tLZqZXaqupub2Pip8rEj3V5fImtb2XR+WO+jIOCpx104MB3NJ7SEzDBsvhHyVYzs4rb7lBtwkGH6uNebNV33AhqhP5NCq0ZIHACd2kCRBjYlc+wv6E4a582XQO54zpEQdEczg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWfAV43p4vV489KPEQiGuhFFwKKma7anaMg6SOMcoC4=;
 b=mGpf7pAzH3hdp3tnQ0AmJhQsLa5t/G0xizDiVon84Vzr3WFZBdOBsveQMy4chwLmvFxJ0LossESGnRpwQvxZfoCZhthMN/Ai5lcgsNjGZ7RL7P4fn24N/9MG2vq6vdbX+aTjo9bIxeNA4wpyPLvZ/ExdLxaGMmPh7LG46OIuMOI=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3349.namprd12.prod.outlook.com (2603:10b6:a03:ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Thu, 4 Jun
 2020 19:01:10 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Thu, 4 Jun 2020
 19:01:10 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fweimer@redhat.com>, Vineet Gupta via Libc-alpha
 <libc-alpha@sourceware.org>
Subject: Re: [PATCH v6 01/13] ARC: ABI Implementation
Thread-Topic: [PATCH v6 01/13] ARC: ABI Implementation
Thread-Index: AQHWOeJDZB/yK5sq0U6kMk4LJ9e8t6jIKsKlgACmfIA=
Date: Thu, 4 Jun 2020 19:01:10 +0000
Message-ID: <009f0364-4089-a032-2cfc-beda06bfff2d@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-2-vgupta@synopsys.com>
 <88508d10-2d29-026a-bb54-ad607154ab87@linaro.org>
 <a56a35d4-3e9e-9a88-4be5-8553d5f11ad3@synopsys.com>
 <87mu5jxkv7.fsf@oldenburg2.str.redhat.com>
In-Reply-To: <87mu5jxkv7.fsf@oldenburg2.str.redhat.com>
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
x-ms-office365-filtering-correlation-id: a3843d31-5456-4b6a-4e0a-08d808b9a50c
x-ms-traffictypediagnostic: BYAPR12MB3349:
x-microsoft-antispam-prvs: <BYAPR12MB3349ADD6B12955772408148FB6890@BYAPR12MB3349.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:35;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 31Iqg+iJwRV7sUthXceHhaJZAn0Ti5N0i23kT8uA87OiCKUFpsoYUvuuR+g+Lk9+6EDGfcc+4S4d99QDRL9LCHiaIBprHMqEnpL0yE9CrjCBzYWzNbUDQOu8PZfCUEs7caQkL5GV5b9xoQ+DddmV4A+MtamVJBjWKdqOnuZQcrdO4y2PwO+wcg0TiSHL+HBW4kRlKpiN6RZxTQYLHzWhPNldHUrDdCvy/qUmgAWJr2jfGpKanZNKjQ9yOai1f9wrjjtAof8XfJemgx0MMhIUteJpu05qpx6AhdcieUGjqTu9hkSxXEuGC9gj3B11H/fzoyWzq+rJRd+4JiL5jab92u8a6eoa2gkntW2LwvwOD5MPA/J2WvWZXlX3LfyfNF2F
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(366004)(376002)(346002)(39860400002)(136003)(36756003)(66476007)(478600001)(66556008)(76116006)(83380400001)(66946007)(66446008)(31686004)(64756008)(6506007)(31696002)(53546011)(186003)(4326008)(86362001)(2616005)(8936002)(6486002)(6512007)(2906002)(110136005)(5660300002)(8676002)(316002)(71200400001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: zrTQsDoOXRHWzAZWGkUhD7nP2tJW7AQOHMj1rQGrJaTsf3deGCLYoa/EdWwhAlHMtHx+Uy7W4c2WGnM9WOdRN5qcNGWlZI04oMPx+jktYPkhieoII3JhZ8/A1HFhsLQ6ldSaVKeLUQmHs7LT4i/uelRszNQHvz78vqY8A7BU9Q6Hfw59YH7MD+R1uHWG+0+a5q0r4P4xQEm+xNKSf1eSgBKC6VDq1ELkBzluZoFDf3+u/ZINP62UFwEqmGDd1ZCNNQ2aTnTOR6Lji0KN0WqaASR3YedHJTNgRoV32ZpfYMBbOPw2xkmh4bNdm2WdnG0wgl17j/RnvE/pOiT9VD1km5mtdi3EKDYZpnMTgji/MFASv2tIBdii6QRQ30unF9wlEQxk9MoEmjlnTU67fZ+uvxzri29kHsZMXLMm9GtBRFdDSDtx+pVPFYCKKcp5bnFT17QRfWWaZbTUZdjt/NyIMkvE87Pgb41zi38WASmBEzy0YVZxkH4KRwZfg17GHt1/II80aksTegLwJ/OKyB6Ih9/EZ0CfleSws0jIBIAHnW5O3x938Gk8vcBpdFeQgwXA
x-ms-exchange-transport-forked: True
Content-ID: <8D1D6E1436C03A48BE6CAD3799E6651F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a3843d31-5456-4b6a-4e0a-08d808b9a50c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 19:01:10.1985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JznyT/dLuzlAmuTIsyBkW/I1d96pqkl+4KXH+lMj5n1y9zOiYPEBKnY5KKB13Eczju99Vnil2iN8z1e77vGTNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3349
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_120124_911559_1385F331 
X-CRM114-Status: GOOD (  17.82  )
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

T24gNi80LzIwIDI6MDQgQU0sIEZsb3JpYW4gV2VpbWVyIHZpYSBMaWJjLWFscGhhIHdyb3RlOg0K
PiAqIFZpbmVldCBHdXB0YSB2aWEgTGliYy1hbHBoYToNCj4gDQo+PiBPbiA1LzI3LzIwIDExOjI2
IEFNLCBBZGhlbWVydmFsIFphbmVsbGEgdmlhIExpYmMtYWxwaGEgd3JvdGU6DQo+Pj4gK0VOVFJZ
IChfX2xvbmdqbXApDQo+Pj4gKw0KPj4+ICsJbGRfcyByMTMsICAgW3IwXQ0KPj4+ICsJbGRfcyBy
MTQsICAgW3IwLDRdDQo+Pj4gKwlsZCAgIHIxNSwgICBbcjAsOF0NCj4+PiArCWxkICAgcjE2LCAg
IFtyMCwxMl0NCj4+PiArCWxkICAgcjE3LCAgIFtyMCwxNl0NCj4+PiArCWxkICAgcjE4LCAgIFty
MCwyMF0NCj4+PiArCWxkICAgcjE5LCAgIFtyMCwyNF0NCj4+PiArCWxkICAgcjIwLCAgIFtyMCwy
OF0NCj4+PiArCWxkICAgcjIxLCAgIFtyMCwzMl0NCj4+PiArCWxkICAgcjIyLCAgIFtyMCwzNl0N
Cj4+PiArCWxkICAgcjIzLCAgIFtyMCw0MF0NCj4+PiArCWxkICAgcjI0LCAgIFtyMCw0NF0NCj4+
PiArCWxkICAgcjI1LCAgIFtyMCw0OF0NCj4+PiArDQo+Pj4gKwlsZCAgIGJsaW5rLCBbcjAsNjBd
DQo+Pj4gKwlsZCAgIGZwLCAgICBbcjAsNTJdDQo+Pj4gKwlsZCAgIHNwLCAgICBbcjAsNTZdDQo+
Pj4gKw0KPj4+ICsJbW92LmYgIHIwLCByMQk7IGdldCB0aGUgc2V0am1wIHJldHVybiB2YWx1ZShk
dWUgdG8gbG9uZ2ptcCkgaW4gcGxhY2UNCj4+PiArDQo+Pj4gKwlqLmQgICAgW2JsaW5rXQk7IHRv
IGNhbGxlciBvZiBzZXRqbXAgbG9jYXRpb24sIHJpZ2h0IGFmdGVyIHRoZSBjYWxsDQo+Pj4gKwlt
b3YueiAgcjAsIDEJOyBjYW4ndCBsZXQgc2V0am1wIHJldHVybiAwIHdoZW4gaXQgaXMgZHVlIHRv
IGxvbmdqbXANCj4+PiArDQo+Pj4gK0VORCAoX19sb25nam1wKQ0KPj4NCj4+IFNvIHdhbnRlZCB0
byBwaWNrIHlvdXIgYnJhaW5zIG9uIHRoaXMgdGhpbmcuIFdoaWxlIGxvbmdqbXAgaXMgbm90IG5l
Y2Vzc2FyaWx5IGFuDQo+PiBhcHBsaWNhdGlvbiBob3RzcG90LCBpdCBzZWVtcyBidWxrIGxvYWQv
c3RvcmUgY2FuIGluIGdlbmVyYWwgYmVuZWZpdCBmcm9tIHdpdGgNCj4+IEFSQ3YyIGRvdWJsZSBs
b2FkL3N0b3JlIGluc3RydWN0aW9ucyBMREQvU1REIHdoaWNoIHdvcmsgd2l0aCByZWdpc3RlciBw
YWlycy4NCj4+DQo+PiBTbyB3ZSBjb3VsZCBoYXZlIDIgdmFyaWFudHMgd2hpY2ggY29tcGlsZSBk
aWZmZXJlbnRseSB0byBvbmUgcnVudGltZQ0KPj4gaW1wbGVtZW50YXRpb24gb3IgYmV0dGVyIHN0
aWxsIGhhdmUgMiBydW50aW1lIGltcGxlbWVudGF0aW9ucyB3aGljaCBjb3VsZCBiZQ0KPj4gc3dp
dGNoZWQgdG8gdXNpbmcgaHdjYXBzICh3aGljaCBJIGNhbiBhZGQgdG8ga2VybmVsKS4gRG9lcyB0
aGF0IHJlcXVpcmUgSUZVTkMNCj4+IHdoaWNoIEFSQyB0b29sY2hhaW4gZG9lc24ndCBzdXBwb3J0
IEFUTS4NCj4gDQo+IFdpdGhvdXQgSUZVTkNzLCB5b3Ugd291bGQgaGF2ZSB0byB1c2UgYSBjb25k
aXRpb25hbCBicmFuY2ggaW4gdGhlDQo+IChzaW5nbGUpIF9fbG9uZ2ptcCBpbXBsZW1lbnRhdGlv
bi4NCj4gDQo+IFdpdGggSUZVTkNzLCBhbGwgaW50ZXJuYWwgY2FsbGVycyB3aWxsIGhhdmUgdG8g
Z28gdGhyb3VnaCBhIGZ1bmN0aW9uDQo+IHBvaW50ZXLigJRvciB0aG9zZSBpbnRlcm5hbCBjYWxs
ZXJzIHdvdWxkIGhhdmUgdG8gdHVybiBpbnRvIElGVU5DcyBhcw0KPiB3ZWxsLg0KPiANCj4gU28g
aXQncyBkb3VidGZ1bCB3aGV0aGVyIHRoaXMgaXMgYmVuZWZpY2lhbCBpbiB0aGlzIGNhc2UuDQo+
IA0KPiBBbHNvLCBwbGVhc2UgZG91YmxlLWNoZWNrIHRoZSByZWdpc3RlciBsaXN0LiAgVGhlIEFC
SSBtYW51YWwgc2F5cyB0aGlzOg0KPiANCj4gfCBUaGUgc2NyYXRjaCByZWdpc3RlcnMgYXJlIG5v
dCBwcmVzZXJ2ZWQgYWNyb3NzIGZ1bmN0aW9uIGNhbGxzLiBXaGVuDQo+IHwgY2FsbGluZyBhbiBl
eHRlcm5hbCBmdW5jdGlvbiwgdGhlIGNvbXBpbGVyIGFzc3VtZXMgdGhhdCByZWdpc3RlcnMgJXIw
DQo+IHwgdGhyb3VnaCAlcjEyIGFuZCAlcjMwIGFyZSB0cmFzaGVkOyBhbmQgdGhhdCAlcjEzIHRo
cm91Z2ggJXIyOSBhcmUNCj4gfCBwcmVzZXJ2ZWQuICBUaGUgRVY2eCBwcm9jZXNzb3IgcmVzZXJ2
ZXMgJXIyNS4NCj4gDQo+IHIyNyBhbmQgcjI4IGFyZSBoYW5kbGVkIGFzIGZwIGFuZCBzcC4gIFRo
YXQgbGVhdmVzIHIyNiBhbmQgcjI5IGFzDQo+IHVuaGFuZGxlZC4NCg0KcjI5IGlzIElMSU5LMSAo
SW50ZXJydXB0IExpbmsgUmVnaXN0ZXIpIGFuZCBhY2Nlc3NpYmxlIG9ubHkgaW4ga2VybmVsIG1v
ZGUgc28gY2FuDQpiZSBpZ25vcmVkIGhlcmUuDQoNCnIyNiBpcyBHUCBhbmQgaW5kZWVkIGNvdWxk
IGJlIHBvdGVudGlhbCBwcm9ibGVtIGFuZCB0aHVzIG5lZWRzIHNhdmluZy4gVGhlIHJlYXNvbg0K
aXQgaXMgbWlzc2luZyBpbiBmaXJzdCBwbGFjZSBpcyB0aGUgaGlzdG9yaWMgdXNlIG9mIEdQIGFz
ICJQSUMgYXNzaXN0IiByZWdpc3Rlcg0Kd2hpY2ggaGFzIHNpbmNlIGJlZW4gcmV3b3JrZWQgaW4g
Y29tcGlsZXIpLiBBcyBvZiB0b2RheSB0aGUgcmVnaXN0ZXIgYWxsb2NhdG9yIGlzDQpzaW1wbHkg
aWdub3JpbmcgR1AuDQoNCj4gcjI1IHNlZW1zIHRvIGJlIHRoZSB0aHJlYWQgcG9pbnRlci4gIEl0
IGNhbm5vdCBjaGFuZ2UgaXRzIHZhbHVlIGJldHdlZW4NCj4gc2V0am1wIGFuZCBsb25nam1wIGJl
Y2F1c2UgeW91IGNhbm5vdCBsb25nam1wIG9udG8gYW5vdGhlciB0aHJlYWQsIHNvDQo+IHNhdmlu
ZyBhbmQgcmVzdG9yaW5nIGl0IHNob3VsZCBub3QgYmUgbmVjZXNzYXJ5Lg0KDQpHb29kIHBvaW50
LiBUaGlzIGNhbiBiZSByZW1vdmVkLg0KDQpJdCBzZWVtcyB0aGF0ICpqbXAgYW5kICpjb250ZXh0
IHJvdXRpbmVzIGRlYWwgd2l0aCBzYW1lIHNldCBvZiByZWdzIChpbiBkaWZmZXJlbnQNCnN0cnVj
dHVyZXMpIGFuZCBwZXJoYXBzIEkgc2hvdWxkIG1ha2UgdGhlbSByZXVzZSBhc20gY29kZS4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMt
YXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
