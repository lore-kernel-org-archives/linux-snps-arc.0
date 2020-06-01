Return-Path: <SRS0=EH8H=7O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B272C433DF
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 18:13:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 298A02065C
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 18:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a8mJlBdb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WLGiGuG6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vcZAJ/JI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 298A02065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gbbHsJ12w1zJUimW1gyNX5QSqtfJD/cc6qUKsJD8/MA=; b=a8mJlBdbYnVwcS
	yf6DWW7Ei8GllTzHmn8UHnJWU37ROWGCb3wjIAJLLMMoAGG+466pPY74N10tYtPx76O7GlKZ4BrDP
	HgSZCZpL2UnzjFxCIT25oPItltZrmPCSqFPLfeNhWB9mA4HiEJNhW4fAjrYrL3R5pogrmpfSjgvSZ
	2zIZQFK2ij+oit4SvjUqti/LT4/Z1nEHj3Y8AWDvkkL1DRAlWhVsZReath0sjCcTAPcItyHe7Y20G
	lkOWKi+71gcS3/RpxQeT48bEnU6rYg2o4Z4IDLKvTyO7quH9qpbTUtooRzGeSmgGFAGvpOq1ne43E
	YzADABKm+/isEyEp0e7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfovs-0001Qh-G1; Mon, 01 Jun 2020 18:13:08 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfovp-0001Pm-Rt
 for linux-snps-arc@lists.infradead.org; Mon, 01 Jun 2020 18:13:07 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D6BC6C0081;
 Mon,  1 Jun 2020 18:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591035183; bh=3A/p0m0aHcLGvW60pSFhdCxNZLdwuvpMYxWJBkubQxg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=WLGiGuG6ar4u8gJE7F0QXGft5mgII2isoWM3X6dEAV1dTYa1XnrNHqpjCZJzgafEX
 1AVXJCjcUGDurP6mbWO6Lz7n0Ne4GTOFtM/wZggyIXr3kXmWIvwzRIfqvf3Rcei/yC
 BcYjB2iZZOQwB2G7RzE+C1S3AhL/QOkPEsDqlvDYY6VuASdARihvj5ov4sA3/KcVg2
 Oq6HcRnFanSbFP26skzlzndPMpZG1530iDG+xgeDgiKyWQb5gEL3bnKs4UZ+STt5kQ
 UmynPGQeFdWfV1OveDXQ8mN219/tNniJsfA2NZc2TC4UvgJFhxQ6SbObPjwDC/Z0ox
 8E8NCuJpq7IJw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B2575A0071;
 Mon,  1 Jun 2020 18:12:56 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 1 Jun 2020 11:12:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Mon, 1 Jun 2020 11:12:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5VCATYZbfPjIS8KfBa3ZMjCo7xuc8iCabafOE3uVAVexbwAEqb3O3LbbXzV7zzaDZxjdF3DDEHDQ9IP/qfWZs1iu9CXXefj5DbHTQIaP4RPcdV/g4RicgkpZ+wr9ep37laMPfl5hsZEv8icreMMXn3+dyxJ8/Ssa0ptyA/HaPFQlMQ5/FumZD16K+k2Ky01fgdK9MEPMD7/Dc+rZOv+yN+g1tXa9Uw174VWrMZSoGcx6D+3E3p5O2RLa8vq17iDBHbY9BB0PigwomOPIXHhc4Oefdlppp6oJFY7s0tPhKKbi/55morVTdk/IwEOOczHIwySH1+oOGgy9oWy5ZpN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3A/p0m0aHcLGvW60pSFhdCxNZLdwuvpMYxWJBkubQxg=;
 b=lh4w9D3KqurlXEmHvOi29i5fq5YcmwkZJJJmWBgO6ZT/c0LX7dfEubUuwYMcrjUQMyVouZemXciYAW0GbCqG2H6/oeVcrEDyjrYO8nlNQsM0DmSykYwUMf68wUJQGTHOylbjgcXeQOcv/pzx5mvyTfPquouDhuh0k+rcAwd6Q6jsCPvV6CrIFXHrqF4uEhezY2bWo2QfzngFhryUGSil29GSVGVUDmdqnWYjPJRQz1l8AtjovAdfeCUbuvcVLhZLc9hioPeE/CzsVf8YGail3uQe/HyUsn71TI22MBGR/BeXUBkqHi3hRdyHg1HE31hNZQjtBp/QBJH4e2Coqjsr8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3A/p0m0aHcLGvW60pSFhdCxNZLdwuvpMYxWJBkubQxg=;
 b=vcZAJ/JIadaewAQJzKO13y3fXLnxPWYLX3TmTSNSmP+mOa0qYS6Qe9kB79WwAHn4ypt6WegNtPIkIVyWzmQ3zd6m0Q4k/5l4e7s6KWWbRSJO21rbIb5VMdoJuwvXKMtntc36pUZAAyLBZoSRZfiYXijZGVq6hO6Gebe5FLHpWk4=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3254.namprd12.prod.outlook.com (2603:10b6:a03:137::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18; Mon, 1 Jun
 2020 18:12:54 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Mon, 1 Jun 2020
 18:12:54 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fw@deneb.enyo.de>
Subject: Re: [PATCH 2/5] iee754: prvoide gcc builtins based generic sqrt
 functions
Thread-Topic: [PATCH 2/5] iee754: prvoide gcc builtins based generic sqrt
 functions
Thread-Index: AQHWNiY9GLXczNbRUEKgmTtm//wKWajD0uFIgABBW4A=
Date: Mon, 1 Jun 2020 18:12:54 +0000
Message-ID: <86ca83af-7e4f-b33a-6d7a-83a5b61f02b2@synopsys.com>
References: <20200530020047.5490-1-vgupta@synopsys.com>
 <20200530020047.5490-3-vgupta@synopsys.com>
 <87pnaiyimm.fsf@mid.deneb.enyo.de>
In-Reply-To: <87pnaiyimm.fsf@mid.deneb.enyo.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: deneb.enyo.de; dkim=none (message not signed)
 header.d=none; deneb.enyo.de; dmarc=none action=none header.from=synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: febe1523-3373-4dc0-e5e5-08d8065767d1
x-ms-traffictypediagnostic: BYAPR12MB3254:
x-microsoft-antispam-prvs: <BYAPR12MB325426217B77E5E94A32D2D2B68A0@BYAPR12MB3254.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:82;
x-forefront-prvs: 0421BF7135
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VNKDgBIMXmm10TXM7zDd4igMmbEEfbMTcfn3nUS5i7zuzVXQ4Vw7wOgYv+3goIaxvOs2TE7PQLw8GlHXsOcvM4mSzGMAOsj8F251aebLESqwZvt6zK7yS6PdLEMlUiUZH5sugmq1lighqW5rFEbwnLS/u5x1rZODNDC8+6xFqxnr1jYdrp8/g0Q+5ZgIeNaF95qln7sm5bDmLNAqoRM0F1J1pYqep+uzIPv9zLXq36a63UeAOwZkoj6zG5vf9bTAdPabblVy/LUryIoua7DNcKX0ssFF6jAeJxKclySmABnRsSfFeNb35IYgpZYqgKuqpa3MFb+q4A6krKZVHlAv6Jnru5We7hULtAtI7iYb191sbiWEC7GgIkR850QyaguYl2A79ea1zkg0HHlAaW3CWw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(396003)(136003)(366004)(346002)(376002)(76116006)(66946007)(66446008)(64756008)(66556008)(8936002)(66476007)(6512007)(316002)(8676002)(2616005)(2906002)(478600001)(6486002)(86362001)(31696002)(53546011)(31686004)(36756003)(558084003)(4326008)(71200400001)(54906003)(186003)(5660300002)(6916009)(6506007)(41533002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: epHvdWmPsrlH07fOobj+2P4Ldg8BfUOwg3lpnHje/vjFzQE+l0Z61HkmsI6x4kg71yG3WsGEsTYU/sUVL/w7AWLaitGGPHBIBc560AsIkRg5HDxV18lR2BmQfqsk0Ey4EoedoQ1rppMNDabh7S1Nk467RdPJQ5X7ZAYDceGTnBw+vMo3Y3FA/tny9r1/jsO6+5b7BiB4XAH6sssxNBDCg2QOvrw8d5SBjYp3JwshyxQQl6huEHb4OvogVwzVCn9Us2Sc2I70dPCbox2/cOPP4FnfMa5rlwpPWCwzhc7Xnt4O1Sgapjjdbs9NOM13qOn+LgEzGTULYE5XbHCpwvIoo1uDIYrKyCEaDCSa7q3OkbIQ0tx+bTObYV2qtFRwAczjvLWAAiQhxYXjvD9LRScbleeQqga3+2154aq7tVWiO3r8u9wMIumzYa9j7Fo4ioNb1XCaJ6CpV38c8H3CvX/HBRjYJH4xUFebWWsvCPiDwadl12pAMfYi8sZB6EFzxILO+LG10rEcPcz1gbSIbI1Uo+6Z+h2I+jYAMQAvOuzjULuz9j+bpZnAcWDVjFFemHlb
x-ms-exchange-transport-forked: True
Content-ID: <C8C26831F398D8418F1984ACA75B6C3A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: febe1523-3373-4dc0-e5e5-08d8065767d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2020 18:12:54.5226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jmKAWGcAbhtFQpsVv1//fOWLq2NK4Kk4gI/UUzKr7ekmDI4izUPgmwCxVCuQ7cu1ZiqBEKx6VLRJQ7hiuQAGig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3254
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_111305_972766_40A3B8A5 
X-CRM114-Status: UNSURE (   8.57  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha @ sourceware . org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gNi8xLzIwIDc6MTggQU0sIEZsb3JpYW4gV2VpbWVyIHdyb3RlOg0KPiBUaGVyZSdzIGEgdHlw
byBpbiBjb21taXQgc3ViamVjdDog4oCccHJ2b2lkZeKAnS4NCg0Kb29wcyBzb3JyeSwgZml4ZWQg
bm93Lg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBz
LWFyYwo=
