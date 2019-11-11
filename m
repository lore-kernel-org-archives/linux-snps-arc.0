Return-Path: <SRS0=N5rj=ZD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED04C43331
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 21:32:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0A332173B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 21:32:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bVdRT9RJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GBEm1l04";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="J9C+Tbm8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0A332173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BWiSRQF0rt9Nb1Y5un+o8wYH+l00HRdNAVGsYdT2/Yk=; b=bVdRT9RJva+c7W
	KUuk/SX+MT/P2pZqaOYWgkpFZsTSABtzS6mg0c1tOp+dOsuduHYAWytZEXhoGqE5XPoHyX6h6Jcv2
	jT5eUFy/4QyWmKMmReuAgBiUrzQH7maS/0Zz4KO5acqG/ykvF0KPJZyZ/ZvmbVDFhQYutDsKThdwM
	N0u6x/cR53m5n7bG6Bwo6MXJvcRmNAo0snJZEiLVu8SSUDMF3irGG7bn8dnNQpAV5TbnR9QO9r5lk
	bH3xmhce+iANacBtsoXQ6hoihM7maW/K7F6p5ePDzmYixpOcxcsKYQOF3re1CYFP3sNClRHCbA5sm
	ffXw/zYqCOOuOxbvqSZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUHII-0000Gv-Mm; Mon, 11 Nov 2019 21:32:18 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUHIF-0000GO-Mu
 for linux-snps-arc@lists.infradead.org; Mon, 11 Nov 2019 21:32:17 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 597D4C08BF;
 Mon, 11 Nov 2019 21:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573507934; bh=D7fyQPXEALkbVxATLqsx7exj2dsO2P92HCdcLaCCl9o=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=GBEm1l04icBrf6nQnsdykaJWtP6uem9F9QPb761Inq2gbyEYX8NweOrH2a5x9OnLh
 I0RZcGDAiOheXr0e0nwfXOJEnXFeqnWUt+KauZcjCYEgiZOqkFw/H2uAvy6rFXkmbM
 azzqiidV1oDykbSpUJUo78+tYGDn0Osn1S9rnz4oNjxJtVPlXjoPgWrITRjLqXpVAZ
 LXlB2e+eyDqp/kUk34xMypHi67F16fCTc2ZBgQxUX1t95d67LjuKvcv+tB47gqlhfg
 VwpwpKI0vAPD6HgjHsTuCkUWG0kgSi0fry5YMxFOJw6n4s48XDiawuAE+w4wCWDXKd
 vd/Xr1Dj9nvfQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D4483A008D;
 Mon, 11 Nov 2019 21:32:12 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 11 Nov 2019 13:32:12 -0800
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 11 Nov 2019 13:32:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwATm1x744AfJEqpsc6YHrr/EreNA9lweAp2B+gRpgjzda1TyGE9NWL+S8vLsb0kM7a8gtzchOLwFLsYcmDdown7tLeJe7yo9qd5/IiR62Jdz5u2wehdaezxj51ZaWsz14tfpowkxQsjthZr5s+AfDqhmfXRv2YEFEvogN7Du2B0wiWEjaUe9rrv8Wm4hkyJp9WD1SJJ9FSEjqd5AdwFzbJIfXTvCi10Kx+y2Q91tsjBGqKiTmssLlyly75hfz1BgZmH3Ygg7Q32z5W7ojRNSVcMNQaymTFJGfq5cFA9dlDRGxUpOC/khztbpCRTIShP8LzPvmgSGfhEmrQnmZJacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7fyQPXEALkbVxATLqsx7exj2dsO2P92HCdcLaCCl9o=;
 b=nwHgNXMIeiu4MC1pa6/iAfDcL9udLjzFtD+PpdqBERnX1LsrPdW3HD/mCCXM1CdJvZL5Lq0bWE+mbK+kaNwfVLvkqhyJsEtn++bN7Gwq3lqMIFWUonRLxg4XrkVl0Z1vZUdLw/tKIXfNmeQ7LdLj5arW79doswj4z62iYUV/B2X1oBheJ4WY5VBGPmIZ/Q2DoMkkGnxMAaaXEZZ05AcmfIbtv4z5+Su2nXYv/7BZKvjSmm4c5uyoApjYq1lPyq38g+DQ90coapLrav/LSOTY15yFCv/YYuRdfMWLiugNV206HB0xJVsXi8+LjgueM37/9CoWeZfkuV8PB4soeuAY9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7fyQPXEALkbVxATLqsx7exj2dsO2P92HCdcLaCCl9o=;
 b=J9C+Tbm8SkdCuTvRlg4GEIt0TMGkW/kQDtrtpMX6e9q4NuGNf9Ke75/R6E+LdbgsceOp9lGxk8IFYK1dg++JbiwGrlv6gZQvsr+XVxAgh4yYFn7TgAt/Fj1XejX4kQAlUFzRAHv7EJTwAPc6FAzKLYmN2iuPvW0aaHRaLCDHF0k=
Received: from DM6PR12MB4089.namprd12.prod.outlook.com (10.141.184.211) by
 DM6PR12MB3690.namprd12.prod.outlook.com (10.255.76.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Mon, 11 Nov 2019 21:32:10 +0000
Received: from DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd]) by DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd%5]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 21:32:10 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/3] arch/config.in.arc: Introduce the ARC
 optimized hs38 config
Thread-Topic: [Buildroot] [PATCH 1/3] arch/config.in.arc: Introduce the ARC
 optimized hs38 config
Thread-Index: AQHVlwQ5JRKddvHAsUiu4CabG7QmWaeGUssAgAAnpgCAAAZ5AA==
Date: Mon, 11 Nov 2019 21:32:10 +0000
Message-ID: <1b9054bb-3c8d-2c36-d5c1-83b6993cc2d4@synopsys.com>
References: <20191108174112.28183-1-vgupta@synopsys.com>
 <20191108174112.28183-2-vgupta@synopsys.com>
 <20191109144656.3da6a1b0@windsurf>
 <1112f6a7-8a23-6cd9-0af0-76e0b92e496b@synopsys.com>
 <20191111210900.GH3419@scaer>
In-Reply-To: <20191111210900.GH3419@scaer>
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
x-ms-office365-filtering-correlation-id: 990a4847-0501-458f-453a-08d766ee9c2d
x-ms-traffictypediagnostic: DM6PR12MB3690:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB36909BC6A541D5CF3650D578B6740@DM6PR12MB3690.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(39860400002)(136003)(366004)(376002)(189003)(199004)(6246003)(8936002)(6512007)(8676002)(186003)(4326008)(446003)(81156014)(81166006)(2906002)(11346002)(256004)(6916009)(26005)(107886003)(31686004)(2616005)(476003)(486006)(66946007)(99286004)(65806001)(3846002)(6116002)(36756003)(6436002)(65956001)(66066001)(305945005)(76116006)(76176011)(6506007)(54906003)(66556008)(66476007)(478600001)(64756008)(66446008)(14454004)(102836004)(6486002)(86362001)(71200400001)(316002)(71190400001)(31696002)(53546011)(58126008)(7736002)(229853002)(5660300002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR12MB3690;
 H:DM6PR12MB4089.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EvlmHpVRJ4Ju+O1EMu/KBrcBvj0zzicLL+ePRpjI3W0/6f/L7LLMMXOX2RHe7zNszhR+3Xz7pG+8FCCC9Snu2pJsXkkXl71YchQmdlei3M7ijesrdIBM6acow9lXyGInC8HVUhIkOKnWD5scwxoEY+kULBPkpv1NAvONH0DQd8R3oB3TrA8V3R3LDyg8lAcJ3w+ig/fpT9q0c4lkPym4WCbFimeL5HWZU5JUSdGSeNxtO+GrqNehvVFAGQMUwz0TiNr+75j8+MiVwuBjKgeRqMoOHO5fip5zBYBsLKsJDqv2YhaA1bnvPPt/TjzZeYir9DPrsml9Je7PzNEZDXPbqNuM9H5knk7VPG5lukA+5/6ByEYacWNSzS9VJadJPJo5uvm5HfWfRmxmzCYRxcAxnMbokd0ZPzRA5uFkOObHQrzMJPvt4dMUfYSc+ZXYG4rO
Content-ID: <459E85BFFAD12940BA5A7B663700B424@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 990a4847-0501-458f-453a-08d766ee9c2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 21:32:10.3810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZEPB8Y/Fbkh9fti1sh8/xTAEI/yQbcJ41BFVj0sT5JBRDt9Y1I/hA81iqGiCiF7jlK1skmvYvVPK34ySpL5Qog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3690
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_133215_909285_BAF96D17 
X-CRM114-Status: GOOD (  19.26  )
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGkgWWFubiwNCg0KT24gMTEvMTEvMTkgMTowOSBQTSwgWWFubiBFLiBNT1JJTiB3cm90ZToNCj4N
Cj4+PiBUaGlzIHJlLXVzZSBvZiBhbiBleGlzdGluZyBuYW1lIGlzIGEgYml0IGFubm95aW5nLiBJ
bmRlZWQsIGFsbCBleGlzdGluZw0KPj4+IHVzZXJzIG9mIEJ1aWxkcm9vdCB0aGF0IGhhdmUgYSBj
b25maWd1cmF0aW9uIHdpdGggQlIyX2FyY2hzMzggd2lsbCBub3cNCj4+PiBiZSBidWlsZGluZyBm
b3IgYSBBUkMgc3lzdGVtIHdpdGggYSA2NC1iaXQgbXVsdGlwbGllciwgd2hpbGUgdGhleSB3ZXJl
DQo+Pj4gcHJldmlvdXNseSBidWlsZGluZyBmb3IgYSAzMi1iaXQgbXVsdGlwbGllci4NCj4+Pg0K
Pj4+IEkgc2VlIHRoYXQgd2hhdCB5b3UgaGF2ZSBkb25lIGlzIHRvIHRyeSB0byBiZSBjb25zaXN0
ZW50IGJldHdlZW4gdGhlDQo+Pj4gQlIyXyBvcHRpb25zIGFuZCB0aGUgZ2NjIG9wdGlvbnMuIEkn
bSBoZXNpdGF0aW5nIGJldHdlZW4ga2VlcGluZyB0aGUNCj4+PiBjb25zaXN0ZW5jeSBidXQgbWFr
aW5nIHRoZSBtaWdyYXRpb24gYSBiaXQgYW5ub3lpbmcgZm9yIHVzZXJzLCBvcg0KPj4+IGJyZWFr
aW5nIHRoZSBjb25zaXN0ZW5jeSB0byBtYWtlIHRoZSBtaWdyYXRpb24gc21vb3RoIGZvciB1c2Vy
cy4NCj4+Pg0KPj4+IFNpbmNlIEkgdGhpbmsgdGhlIG51bWJlciBvZiBhZmZlY3RlZCB1c2VycyB3
aWxsIHByb2JhYmx5IGJlIHF1aXRlDQo+Pj4gc21hbGwvbGltaXRlZCwgSSB0aGluayBJIHdvdWxk
IGJlIGZpbmUgd2l0aCBtZXJnaW5nIHlvdXIgcGF0Y2ggYXMtaXMsDQo+Pj4gYnV0IEknZCBsaWtl
IHRvIGhlYXIgZnJvbSBvdGhlcnMuDQo+PiBJIGFncmVlIHRoYXQgdGhpcyBtaWdodCBjYXVzZSBw
b3RlbnRpYWwgYnJlYWthZ2UsIGJ1dCB0aGlzIGlzIG5vdCB0b3RhbGx5DQo+PiB1bmNoYXJ0ZWQg
dGVycml0b3J5IGZvciBzb2Z0d2FyZSBidWlsZCBjb25maWcuIFdlJ3ZlIGJlZW4gYnVpbGRpbmcg
TGludXgga2VybmVsDQo+PiB3aXRoIHRoaXMgb3B0aW9uIGFzIGRlZmF1bHQgc2luY2UgbWlkIDIw
MTguDQo+IEkgdGhpbmsgdGhlcmUgaXMgc29tZSBtaXN1bmRlcnN0YW5kaW5nLg0KDQpOb3QgcmVh
bGx5LCBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgYW5kIFRob21hcyBhcmUgYXNraW5nIGZvciAtIGl0
cyBub3QgYSBzdXBlcg0KY29tcGxpY2F0ZWQgcGF0Y2ggYWZ0ZXIgYWxsIDstKQ0KDQo+IFdoYXQg
VGhvbWFzIGFuZCBJIGFyZ3VlIG9uLCBpcyB0aGUgd2F5IHRvIGNoYW5nZSB0aGUgbWVhbmluZyBm
b3IgdGhlDQo+IEJSMl9hcmNoczM4IG9wdGlvbi4NCg0KWWVhaCBJIHVuZGVyc3RhbmQgdGhhdCBw
YXJ0Lg0KDQo+IEJlZm9yZSB0aGlzIHBhdGNoLCBCUjJfYXJjaHMzOCBtZWFudCAiQVJDIEhTMzgi
LiBCdXQgd2l0aCB5b3VyIHBhdGNoLCBpdA0KPiBub3cgbWVhbnMgIkFSQyBIUzM4IHdpdGggNjQt
Yml0IG1weSIuDQo+DQo+IFNvLCBhIHVzZXIgdGhhdCB1cGRhdGVzIHRoZWlyIEJ1aWxkcm9vdCBj
b25maWd1cmF0aW9uaSB3aGljaCBwcmV2aW91c2x5DQo+IGhhZCBhICJwbGFpbiIgSFMzOCBzZXR1
cCwgYnV0IHdpdGggdGhpcyBwYXRjaCwgdGhleSBnZXQgYW4gImV4dGVuZGVkIg0KPiBIUzM4IHdp
dGggdGhlIDY0LWJpdCBtdWx0aXBsaWVyLg0KPg0KPiBUaGF0J3Mgd2h5IEkgc3VnZ2VzdGVkIGlu
IG15IG93biByZXBseSwgdG8ga2VlcCBCUjJfYXJjaHMzOCBhcyBpdCB3YXMNCj4gYmVmb3JlLCBh
bmQgaW50cm9kdWNlIEJSMl9hcmNoczM4XzY0bXB5IHRvIG1lYW4gdGhlIG5ldyBIUzM4IHcvIHRo
ZQ0KPiA2NC1iaXQgbXVsdGlwbGllci4NCj4NCj4gSW5kZWVkLCBpdCBkb2VzIG5vdCBtYXRjaCB0
aGUgZ2NjIGNvbmZpZyBvcHRpb25zLCBidXQgdGhhdCB3b3VsZCBoYXJkbHkNCj4gYmUgdGhlIG9u
bHkgZGVyb2dhdGlvbiB3ZSBoYXZlIGluIEJ1aWxkcm9vdC4uLiA7LSkNCg0KUmlnaHQgdGhhdCdz
IG5vdCB0aGUgcG9pbnQgb2YgZG9pbmcgdGhpcyBleGVyY2lzZSBhbnl3YXlzLg0KDQo+PiAyMDE4
LTA5LTA3IDAwYTk5MzM5ZjBhMyBBUkN2MjogYnVpbGQ6IHVzZSBtY3B1PWhzMzggaXNvIGdlbmVy
aWMgbWNwdT1hcmNoc8KgDQo+Pg0KPj4gR3JhbnRlZCB0aGF0IGtlcm5lbCBidWlsZCBpcyBqdXN0
IG9uZSBwYXJ0IG9mIHB1enpsZSBhbmQgYW55IGxhdGVudCBjb2RlZ2VuIGlzc3Vlcw0KPj4gYXJl
IG1vcmUgbGlrZWx5IHRvIHN1cmZhY2Ugd2l0aCBkZWZhdWx0IGFwcGxpZWQgdG8gZnVsbCBzb2Z0
d2FyZSBzdGFjaywgSSB3b3VsZA0KPj4gc3RpbGwgdm90ZSBmb3Igc3dpdGNoaW5nIGRlZmF1bHQg
dG8gLW1jcHU9aHMzOA0KPiBDaGFuZ2luZyB0aGUgbWVhbmluZyBvZiBhbiBvcHRpb24sIGFuZCBj
aGFuZ2luZyB0aGUgZGVmYXVsdCBvZiBhIGNob2ljZSwNCj4gYXJlIHR3byBkaWZmZXJlbnQgdGhp
bmdzLiBJJ20gT0sgd2l0aCBjaGFuZ2luZyB0aGUgZGVmYXVsdCwgYnV0IEknZA0KPiByYXRoZXIg
dGhhdCBvcHRpb25zIGtlZXAgdGhlaXIgbWVhbmluZy4NCg0KT2sgc291bmRzIGdvb2QgIQ0KDQpU
aHgsDQotVmluZWV0DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXNucHMtYXJjCg==
