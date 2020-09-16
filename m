Return-Path: <SRS0=otmf=CZ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA91C433E2
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Sep 2020 04:22:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5ACE20770
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Sep 2020 04:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dHT+8iwQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bK22b9ts";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="oEyDWSUH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5ACE20770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N+iVqDBVcBOSy6CZPEasrsren03/NqJABgXF/YyjIv8=; b=dHT+8iwQg55Ko0f8bwVKeFeDy
	N/7H6Iw70vx64Xc5i+xXEJ3qCwqR3PqbkUrf5JC59iN9bOKDMJdvUc9g0QEgyMOgA+DwnEmq/9ZR7
	352fT50ZhIPZlNpkMr1JD3RC8pKkvKqf3nNWDrbynGpSTU9JhG2hBcCWS+Jl2qwfiP9N5Pka045KI
	Q7iVCdZwfnapkhqh1745TneSr/AqZJ8feX62SZV8anSn/Djr0NDNRwua6aG481BAngB5XLEVNONb0
	Vr/eIqCzuLepRJbLCexGSpMwLFyx5DUYjyABrKX62HoTlTSobuYxTuzqh4KM5cxTDjZC8MmqkTQ9M
	ZhgmnQG3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIOy5-0005bq-2z; Wed, 16 Sep 2020 04:22:53 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIOy2-0005aa-UE
 for linux-snps-arc@lists.infradead.org; Wed, 16 Sep 2020 04:22:52 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C69B84025C;
 Wed, 16 Sep 2020 04:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1600230162; bh=WErLhpGO5m7UAcUgfF3NCLhtsivgfDeRgRxZORESnHc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=bK22b9ts121g7fzbDvVNgpdf82CcaIzl0hhoByjHKLJKTBXIGlbHxzj8ov+Q8exaB
 1Ilkkf0ok41r8R+B9mgtr+LEopcxkSH3j5i0uo1mm5GKaH+B9n7rmr3JGXJMwMBAFb
 c0nx06q1+mbZROwLhgx4/+iIH59jZD2xK7+lp23YEFTDfFHGgY/1cFb8R0o7NQd4fO
 nQwlHOB49pw2KluTxgFO8qS4B8DHK4Wi5k8se/W5aHI9Dtk3S9smaIj45ziyieGX4Z
 ckcUZm1NJ0NAOaWBTqjd/0Dka3BmDh2D16t2o8dGeRMg0acuu+uo/3fjWJoRfoI1Lo
 uSZ47HjMHRVpA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 1BDEBA0063;
 Wed, 16 Sep 2020 04:22:39 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6939F40147;
 Wed, 16 Sep 2020 04:22:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="oEyDWSUH";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFOYWB/E4CVDsVfH0Hzc0oQ4gYR0DotFI3rqkec0NUF/g5LdjdmTAO70spHBe5qZjTfM6K/XRh941CDXky1SfJYMgULFeFdGFeZCAavxch+9jCgtglysguhkUXqOmCZMNsUqIbuywUQuQxIH7i0XGF7G8L/2KuC+8L7NHdpDnaz+ZbLyD1CbaGQhSmGWXRByIXhyg4YxdGTWm1xrsNqb0fXwet6E9AOLpkqGRuX4fAQaRHOdSXwYtvWgZWaOp+JpQkaAgkmJaK5ebDUdOla8bxhIDjG9eHogymUDzZymlTDAMbz3X3TQd9zAbIqoo3IzJA9j8y+TGK8+G2nKwJ9QEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WErLhpGO5m7UAcUgfF3NCLhtsivgfDeRgRxZORESnHc=;
 b=JtCvHfKXRvhINeW0PU+1k4+o/GmibbkxlrVlyyjOEACxfVb/nz4m0FcYeVG58LROWtb/29BAk/o0fSjA0LgA2W3lCAbslHIS8is0zynYkPxddsYZ4pOceJxCBn5UBpI9QnnVIheGWcLFuaWdv0ufyMhheYlZWi+QU77LggRztMwjFjMCVyrJE9n2HBhhVx8frfjh8dlCiOcB8xp1jXtnJlkbHJCrjzPOPeNbt3p9U9L2NZmto6QWj9+rs2fKrcikqFU4t8ehCMeA06EmLLUCdkribBC4jGA3pw1oa2tUgT+TOQo2+8/PMh6ZmvQwxDg2m9XRYR26onpZEF44vc5/Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WErLhpGO5m7UAcUgfF3NCLhtsivgfDeRgRxZORESnHc=;
 b=oEyDWSUHml1JCAVC0/av12t7SFTd9PqNn9FwMgMlJGbYchqCAQ1UYijAEZyVlE0vQ14QXH/ZMT3ZOx7lhfvY2HnbWh1CWptQQGDiUhqYhsKBA2LXa3FsE8Kd8Kdip7dCXIu+VfcdIkCU4FmOKNoR2nsRnY/fzOK9Qhs41P3L37o=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 04:22:36 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e%5]) with mapi id 15.20.3391.011; Wed, 16 Sep 2020
 04:22:36 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [Buildroot] [PATCH] package/glibc: ARC: use upstream 2.32
Thread-Topic: [Buildroot] [PATCH] package/glibc: ARC: use upstream 2.32
Thread-Index: AQHWit9N0OB0dIfv2EO5tfcyW4aXM6lps9MAgAD4b4A=
Date: Wed, 16 Sep 2020 04:22:36 +0000
Message-ID: <94daa7f5-5780-9716-cea8-a355930e33c6@synopsys.com>
References: <20200914213748.3953423-1-vgupta@synopsys.com>
 <20200915153324.318c612b@windsurf.hq.k.grp>
In-Reply-To: <20200915153324.318c612b@windsurf.hq.k.grp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [107.3.145.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed91cf45-c764-4716-9c69-08d859f8242e
x-ms-traffictypediagnostic: BYAPR12MB3479:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB347993716F94F862156194B4B6210@BYAPR12MB3479.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Oq8h+ns2Tj1o80sm+/0K/9yogorXwHlpJxJ5j/gzpfNF4Zb15FhTsRcwPjHhSKsEPBf3kfb9/FgCXqffxWK7YQq0io8X3J2+tXUUFV397yjfH9CzTUbfJMivLmXU0vrYxw1BVlhePG95zxWuBx4wkpyUogGGlVutY6P6RniKB6P2maBVWRUHRarOj6qruNI9WDjjUeBcgBOXimw3nAiXZj4DJFeR+RPmFCxKQzq8Lg/D8mjqijnbCfr230zn+Fv++Rc2Fo5FT9pYzDrPb7gFO9xl5qxflB9PB0KKNOzA74FV/yjmUGDIbEUmidbyk0UGb7c3Y/2U7rgAlkREL38wEEBCHBEXU0NLGRNyXAOmnbHyK2IB1Xam5r7NlMyN7TuD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(346002)(396003)(366004)(376002)(8676002)(186003)(83380400001)(2906002)(36756003)(54906003)(110136005)(86362001)(478600001)(31696002)(6512007)(71200400001)(76116006)(4744005)(6486002)(66946007)(66446008)(8936002)(64756008)(66476007)(2616005)(66556008)(53546011)(107886003)(6506007)(5660300002)(4326008)(31686004)(316002)(26005)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: M3iAfbY70fcxws/ubFMJynvdUSR8JJbiY3jrP36TI9OpleYauH+hRai3+hJS7JPHoqFG8gSGI0CTDRgiHKsVfmALm7IEkP8+WXg3OEaeyPPFB05AXL7qs9TIhwh7bXk6ad0/B0o9KD5YWJDGeUm+gn2+vVXxoeBjA3u8LKwUatSaDpw1+zGI+NKyjKRX5dJV8JlbHYXfKJlwye+W/g5P+fTaxjh6eCmPgKblWS/9NdR6rkyAAeU0MdrvlZc7n2rtZtMqsARpfH4BdCM2F9+xONEmDsq9kufe1w7OBuDHHec1+/18qEAzkTFhA1gtwJvIuFgFz35Cfh6Su8SKFYdbw7sxifxhxGNyEm1PQHg7t336Ddrl/75IJa0Igx593NTxJoK43qVljQbb3dxOpFbRWWaAJLxhwyKu/Ds3WHg9vVZgihAhF5M6cGN2fI9xt+uJv8HxWDv1g73pGmAXluvIZOYpiFbSQGTK5xVTudziFiqe/v2z3NDhKkZj8D6IYLzVRIEZ+yBwBjr61Gc+vaZNgiIUsvr95wb/2dJlMZzXtDJMW7kfdPe5TKH7QHsJBfkoJsVPEJWVDKygfScBwhfNRBfdPwae+50eCKidgDgnGX18BY2DW45mNNoUUyagUWPTntMtuCFVmjbpamZSNsgJ3Q==
Content-ID: <6830DA458034444B8822BC8898A65872@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed91cf45-c764-4716-9c69-08d859f8242e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 04:22:36.4412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w7Z+PgOgRYnYlcW3dkvbVDZC3m5l7V8Lhw/Baz+7gKNJ6CoIZqOv3ARR1XP9dvc6hKab70WaAyMNY3igJLunLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3479
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_002251_374991_A3B14ED1 
X-CRM114-Status: GOOD (  17.10  )
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
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gOS8xNS8yMCA2OjMzIEFNLCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOg0KPiBIZWxsbywNCj4N
Cj4gT24gTW9uLCAxNCBTZXAgMjAyMCAxNDozNzo0OCAtMDcwMA0KPiBWaW5lZXQgR3VwdGEgPFZp
bmVldC5HdXB0YTFAc3lub3BzeXMuY29tPiB3cm90ZToNCj4NCj4+IEFSQyBnbGliYyBwb3J0IHdh
cyBtZXJnZWQgdXBzdHJlYW0gaW4gMi4zMg0KPj4gVGhlcmUncyBubyBuZWVkIHRvIHJlZmVyIHRv
IGdpdGh1YiBhcyBpdCBoYXMgdGhlIGV4YWN0IHNhbWUgdmVyc2lvbiBhbmQNCj4+IGNhbiBiZSBy
ZXRpcmVkIGluIGZ1dHVyZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBWaW5lZXQgR3VwdGEgPHZn
dXB0YUBzeW5vcHN5cy5jb20+DQo+PiAtLS0NCj4+ICAuLi4vZ2xpYmMuaGFzaCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArKw0KPj4gIHBhY2thZ2UvZ2xpYmMvZ2xpYmMubWsg
ICAgICAgICAgICAgICAgICAgICAgICB8IDIwICsrKysrKysrKystLS0tLS0tLS0NCj4+ICAyIGZp
bGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+PiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ2xpYmMvMi4zMi0yLWczODY1NDNiYzQ0OTVmNjU4ZGNjZTZj
ZDRkMTFlNGJhNjU3NGE0NmY1L2dsaWJjLmhhc2gNCj4gVGhlIGhhc2ggZmlsZSBmb3IgdGhlIEFS
Qy1zcGVjaWZpYyBnbGliYyB2ZXJzaW9uIHVzZWQgb24gR2l0aHViIHNob3VsZA0KPiBiZSBkcm9w
cGVkLg0KDQpUaGUgaGFzaCBpbiB0aGUgcGF0Y2ggaXMgZnJvbSB0aGUgc291cmNld2FyZSBkb3du
bG9hZGVkIGd6Lg0KDQokIHNoYTI1NnN1bSAuLi9kbC9nbGliYy9nbGliYy0yLjMyLTItZzM4NjU0
M2JjNDQ5NWY2NThkY2NlNmNkNGQxMWU0YmE2NTc0YTQ2ZjUudGFyLmd6DQoNCjA3ZjM4MDRhYmJj
NmEyMzMxNWYwOTU2ODY4NmMwZTViYjgxZDcxNDI1MWNmNTM3ZDI1YTM2ZjgyNmNhZTU0MGLCoA0K
Li4vZGwvZ2xpYmMvZ2xpYmMtMi4zMi0yLWczODY1NDNiYzQ0OTVmNjU4ZGNjZTZjZDRkMTFlNGJh
NjU3NGE0NmY1LnRhci5neg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXNucHMtYXJjCg==
