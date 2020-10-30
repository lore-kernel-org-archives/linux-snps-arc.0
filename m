Return-Path: <SRS0=eli2=EF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09490C00A89
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 18:48:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22A3F206F4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 18:48:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ydJlJLkN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZougkZQo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PkG+c3+R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22A3F206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Content-ID:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xL2lwzySKcdceFqPKUMDrfenlUo7qXuysPhp/kMQkF0=; b=ydJlJLkNeLwqS8qMgdaUFBfga4
	oN/dubuhzsd24t3yFMCSrnsS49Z90TG64dYZK4FmxlzoVRLHKdbf1d05vtvsIEnSvrVQtH2R6aM74
	zSZeKVXnE6uPghCtPQWY1m0lq6BD5LwAC3rwgF0ttN3gib1kx/6zx7/nNHyChv4RIMaeH6Yu5zbQR
	hcb6X0VvekqeH01IPDjA1e5cXTTGSEQ6cb0XhNFgnMaKTPLSmA6er4ps6+hUui6Dh/RLh7WQx2H1A
	R4AF2UPOtmyJUsThF4EofjMTm0T+DD1Vg2FNTguMMOTyKIN5XGTGaexx9iEzNI26Z9v0QnuMORIvU
	2dM1htOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYZRQ-0006ZQ-TY; Fri, 30 Oct 2020 18:48:00 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYZRM-0006YP-W9
 for linux-snps-arc@lists.infradead.org; Fri, 30 Oct 2020 18:47:59 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 958BAC00A7;
 Fri, 30 Oct 2020 18:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1604083674; bh=0KUvq86K2LXqklk+d1mcjzW5oVGP1hlaVboZCKmEOjw=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=ZougkZQof2ldPdwKkFx966fHMFyxUJLD5Thv9eewkkYFCiC36iiJbcH5iJgYm4DlI
 iK49XMblBol1MtmCzjt3OgXTSz9WKvqwBV+onmVCeX90Yi5B4icNPr56O0rVGVyZOt
 S4oeZ1BzXrup4Ir22/GC+DOWlgaV84EObtvqXSi7QVwWPTbA7e4AoS/8gs2Um28vs8
 LASZvkmdVY9aDkd21Q2vn5hmxFSnKG6icWE4rjRV1p85/pfEaGyawXhc/lYpVq+Puu
 gH/RXiYP9adHwwUwCY7cDFT+nCzEldwUcFYkj3zQ+qs18N2fAVMagKBAa8/P+4pkXC
 O4fY67LnjayMw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3EA02A0082;
 Fri, 30 Oct 2020 18:47:49 +0000 (UTC)
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2050.outbound.protection.outlook.com [104.47.38.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8770B400E5;
 Fri, 30 Oct 2020 18:47:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="PkG+c3+R";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUAGzwaZv3NkUxqxloeoKaXNb3NXsyUgNpf8V+tBthGTCwcxgNxvGejM+tRr/nZCcLEIQgzor7uElcnEuR0P/irVF8eS6PpXmfw6UFlfh1yplsROpE8PYFKwOpu6JsEFiDGRm0ggw9OUwBXp/cQluz2u1sXmXZUPuBfKlfw/Q9RaNBnT02meYu8kKmjs2KmFppr3jdFyF1nQ3bIYrEFRI7TuSV+cjtfr/+lIi0pPhppExmfLpYHQ1kkStPxkMcec4/0uGijLbrBQlsC941L02iZyOi404sigtgSRVa6P/qqxA5wztwAPtUw0kP7xr3CXOV/orFvb3/ir09gZaaiBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KUvq86K2LXqklk+d1mcjzW5oVGP1hlaVboZCKmEOjw=;
 b=PmARRLeheNF0L5goH0XlabchIu1z5AQiQv9w3dYck0/No2Q7BIBkN9C9KgDRRuavzSdxxIBli8WLHyaHdzPStjh7WCf24xooNEpLRlEziCsbPc16ks1Wlb8HOZkaYRij8LU9wIfzjN5rXC5H3oaPWaoQSfE+2WkR+l9fRqxxJLisp7V6ZMIo4//rPYRL41lFKWGCfWFNnilcmb/9aV/2j+bKDJXdt4jMyLP9wEcaeeOfxwrkcdRj1Sl7Q1C71bHk/5ygNiNdGVz01Wd/w5XM4NwhH9nxstlMGB/pLpJbG6EvrepErxzmMW3Te51loQWfotkjE9qDN3EAHoQrN1Csdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KUvq86K2LXqklk+d1mcjzW5oVGP1hlaVboZCKmEOjw=;
 b=PkG+c3+RIrdULNQF4HvFv64McsbojskMeMmYOGwZhDHdU3nyVjbKe6jq/xg2T0YzBuYwSq/87eR0C9VqRz/fBJ4wEVyjNpiMDys65UsRHEJrbIDJ3RtMdt4OPAAWf6mcPbcnZaUHqysjOXSCxm8L29y7j1UH+7ISKE9CzwBl1hg=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2744.namprd12.prod.outlook.com (2603:10b6:a03:69::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Fri, 30 Oct
 2020 18:47:43 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31%6]) with mapi id 15.20.3477.034; Fri, 30 Oct 2020
 18:47:43 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Jens Axboe <axboe@kernel.dk>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] arc: add support for TIF_NOTIFY_SIGNAL
Thread-Topic: [PATCH] arc: add support for TIF_NOTIFY_SIGNAL
Thread-Index: AQHWrg31QcbIo8s3W0SB8T9Bc5NeLKmwfi8A
Date: Fri, 30 Oct 2020 18:47:43 +0000
Message-ID: <faa0272e-9719-8fd4-323c-b32fd4c9ccb6@synopsys.com>
References: <6b89e805-c645-e738-794f-05ba6be68d60@kernel.dk>
In-Reply-To: <6b89e805-c645-e738-794f-05ba6be68d60@kernel.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: kernel.dk; dkim=none (message not signed)
 header.d=none;kernel.dk; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 979ecae4-2827-4588-178c-08d87d04492e
x-ms-traffictypediagnostic: BYAPR12MB2744:
x-microsoft-antispam-prvs: <BYAPR12MB2744EC570BDACFFFC3BFA86AB6150@BYAPR12MB2744.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HbrDRtv4DHrcOuzxihvLM/fxQ7Pe2GI9n3u6GmgvpdzIUHKpDRlBPEel9FERDl4cPC0IQlncUM3JlReki9PYLB8/mX+wr2p5F0jFHr3pAc45JlhIANJn1oMOHwsGGTDJKVuz0alw/GBcv9QpTy7YCrQUxVce4JVDup1tiXSFGZpDEvt8u+nQqNfdgU92yEKWLMDyMFIsG8ttufVY27WKAqk5j5G0tUhO9vTjetbqN+NJtelWPmheRTBzey1TiR7tkD2pUoZwcYECvXPOnxtEN+prA2ii5GKViwxC8juoDpDnG/gi/2BcrPnc9gtVv8vQYXntvA0WWyt4yvxan18Xx1DmYY1a6d2radSUOdbwuI9styb85VTF7tyPzhmiP5RsL7osRdeL/0gtVznTdrTr+ZW1OdeYdKGjL8xxiKszgetPp8JEhpa3YsWnXs/G2ZVubVk5hYJi36CHSGIbbWJzlQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(66556008)(64756008)(53546011)(86362001)(6506007)(66946007)(66476007)(66446008)(83380400001)(478600001)(76116006)(31686004)(5660300002)(966005)(26005)(8676002)(316002)(71200400001)(8936002)(31696002)(186003)(2906002)(110136005)(36756003)(6486002)(2616005)(6512007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 5oNhrGKrds0LDBCD+LYHpm004L6LF8bBOyL0cYH1lhNM+2/SWW8pz+HWFGmvEhhgHXg7KWx/j0Ynz4y0IKbcg5vI1WpgGaRHPXfOoKFgu9D0tSFQX3bY2QSkZn+kplO3GIUvKNdEWL6E2t+cD+BuoQBGe+yUUuHXtybQNvATiaAHYBT+Wdf5MxNRpcooVPjV8RzXDab5liIbeye4l+xavFKCm5eIwiyx67thUkWysWM61g3cgYgNh3SL0CzA3I6VQT9FOUyAPcxXfUyedEqIs1BWP+Jgy63an1pVkrx46r3/BdDxU87E8wAAQFB0f1uLD65WRtTE6PPayKIDkgJb8HgOi6e66YPp7X/+q4B5AfpUJzZD2MuS8OuNoA47lOPMnjlrLK36OTzD7ssJ8e5P9mSvYn7u2LI5OOu0+HN4pnpL1S+HBED35H5cMNlkTOS90Kk+8nu3EDb7dgZtbtOxDP3qWstYCb6lwIRwViou+dR0FmPnh2f78rk/LbK90bmpi3vf2xpGfopqWQq3bDxNtj6nrVZOAdGf988m3OplCaDJoqwIxMWYksTs5wFuYUyzUXOMem3Wj2iJeYZGCSvW5kcv06UBm/tbzmPhC1uIoO5KO6OHFerWtOphwMHhcc72vqWOVKq2h9hY/grApGJ9XA==
x-ms-exchange-transport-forked: True
Content-ID: <6234FEF97CD1E643BAB82AD72B16C93F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979ecae4-2827-4588-178c-08d87d04492e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 18:47:43.3004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3QLT/EWvl6ICd6HlJZpjHKEGEuc3rvhMGohFadzLnnLWVhVVctZ+cQ3Vw3MQEiYlbKNB4nDVXNHTQMtzbjFpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2744
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_144757_478979_B850AB33 
X-CRM114-Status: GOOD (  21.74  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gMTAvMjkvMjAgOTowOSBBTSwgSmVucyBBeGJvZSB3cm90ZToNCj4gV2lyZSB1cCBUSUZfTk9U
SUZZX1NJR05BTCBoYW5kbGluZyBmb3IgYXJjLg0KPg0KPiBDYzpsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcNCg0KDQpKdXN0IHRvIGJlIGNsZWFyLCBBUkMgYW5kIEFSTSBzZWVt
IHRvIGRpZmZlciBpbiAxIGxldHRlciwgdGhleSBhcmUgaW4gbm8gDQp3YXkgcmVsYXRlZCA6LSkN
Cg0KDQo+IFNpZ25lZC1vZmYtYnk6IEplbnMgQXhib2U8YXhib2VAa2VybmVsLmRrPg0KPiAtLS0N
Cj4NCj4gNS4xMSBoYXMgc3VwcG9ydCBxdWV1ZWQgdXAgZm9yIFRJRl9OT1RJRllfU0lHTkFMLCBz
ZWUgdGhpcyBwb3N0aW5nDQo+IGZvciBkZXRhaWxzOg0KPg0KPiBodHRwczovL3VybGRlZmVuc2Uu
Y29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvaW8tdXJpbmcvMjAyMDEwMjYyMDMyMzAu
Mzg2MzQ4LTEtYXhib2VAa2VybmVsLmRrL19fOyEhQTRGMlI5R19wZyFPbzRrd3I2WXk4eTVCeUM4
aklPTmpVMjhnTHNxcHlmelQxMHU1a2Zkc2oyRS1VMlZJWFFzN1N2VG1CUklrdXBaJCAgDQoNClRM
J0RSIGlnbm9yZSB0aGlzIHVybCByZXdyaXRlLg0KQ29ycG9yYXRlIG1haWxlciBmdWRnaW5nIHRo
ZSB1cmxzwqAgYW5kIEkgY2FuJ3Qgc2VlbSB0byBmaW5kIHRoaXMgbXNnIGluIA0KbXkgbWFpbGlu
ZyBncm91cCBzdWJzY3JpcHRpb24gaW4gVGh1bmRlcmJpcmQgKGFsdGhvdWdoIGl0IHNob3dzIHVw
IGluIA0Kd2ViIGFjaGlldmUpIGhlbmNlIG5lZWQgdG8gcmVwbHkgZnJvbSBvZmZpY2UgYWNjb3Vu
dCByYXRoZXIgdGhhbiB0aGUgDQpuZXdzZ3JvdXAgYWNjb3VudC4NCg0KDQo+IEFzIHBhcnQgb2Yg
dGhhdCB3b3JrLCBJJ20gYWRkaW5nIFRJRl9OT1RJRllfU0lHTkFMIHN1cHBvcnQgdG8gYWxsIGFy
Y2hzLA0KPiBhcyB0aGF0IHdpbGwgZW5hYmxlIGEgc2V0IG9mIGNsZWFudXBzIG9uY2UgYWxsIG9m
IHRoZW0gc3VwcG9ydCBpdC4gSSdtDQo+IGhhcHB5IGNhcnJ5aW5nIHRoaXMgcGF0Y2ggaWYgbmVl
ZCBiZSwgb3IgaXQgY2FuIGJlIGZ1bmVsbGVkIHRocm91Z2ggdGhlDQo+IGFyY2ggdHJlZS4gTGV0
IG1lIGtub3cuDQoNCg0KSSdtIGZpbmUgZWl0aGVyIHdheXMgdG9vLCBiZXN0IHRvIGRvIHdoYXRl
dmVyIHlvdSBhcmUgZG9pbmcgZm9yIG90aGVyIA0KYXJjaGVzLiBBbHRob3VnaCB0aGlzIHBhdGNo
IHBlciBzZSBpcyBicm9rZW4sIHBsZWFzZSBzZWUgYmVsb3cuDQoNCg0KPiAgIA0KPiAgIAlHRVRf
Q1VSUl9USFJfSU5GT19GTEFHUyAgIHI5DQo+IC0JYmJpdDAgIHI5LCBUSUZfU0lHUEVORElORywg
LkxjaGtfbm90aWZ5X3Jlc3VtZQ0KPiArCWFuZC5mICAwLCAgcjksIFRJRl9TSUdQRU5ESU5HfFRJ
Rl9OT1RJRllfU0lHTkFMLCAuTGNoa19ub3RpZnlfcmVzdW1lDQoNClRoaXMgaXMgbm90IGNvcnJl
Y3QsIEFORCBpcyBhIHNpbXBsZSBBTFUgaW5zdHJ1Y3Rpb24gd2l0aCBmb3JtYXQ6IEFORCANCmRl
c3QsIHNyYzIsIHNyYzENCldpdGggZGVzdCAwLCBpdCB3b24ndCB1cGRhdGUgYW55IHJlZ2lzdGVy
LiBXaXRoIC5mIHN1ZmZpeCBpdCB3b3VsZCBzZXQgDQpDQyBmbGFnIGJhc2VkIG9uIEFMVSBvcGVy
YXRpb24gd2hpY2ggY2FuIHN1YnNlcXVlbnQgdXNlZCBmb3IgYSANCnByZWRpY2F0ZWQgaW5zdHJ1
Y3Rpb24gc3VjaCBhcyBCWi4NCg0KU28geW91IG5lZWQgc29tZXRoaW5nIGxpa2UNCg0KYW5kLmYg
MCwgcjksIFRJRl9TSUdQRU5ESU5HfFRJRl9OT1RJRllfU0lHTkFMDQpieiAuTGNoa19ub3RpZnlf
cmVzdW1lDQoNCg0KPiAgIA0KPiAgIAk7IE5vcm1hbCBUcmFwL0lSUSBlbnRyeSBvbmx5IHNhdmVz
IFNjcmF0Y2ggKGNhbGxlci1zYXZlZCkgcmVncw0KPiAgIAk7IGluIHB0X3JlZyBzaW5jZSB0aGUg
IkMiIEFCSSAoa2VybmVsIGNvZGUpIHdpbGwgYXV0b21hdGljYWxseQ0KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcmMva2VybmVsL3NpZ25hbC5jIGIvYXJjaC9hcmMva2VybmVsL3NpZ25hbC5jDQo+IGlu
ZGV4IDJiZTU1ZmI5NmQ4Ny4uYTc4ZDhmNzQ1YTY3IDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FyYy9r
ZXJuZWwvc2lnbmFsLmMNCj4gKysrIGIvYXJjaC9hcmMva2VybmVsL3NpZ25hbC5jDQo+IEBAIC0z
NjIsNyArMzYyLDcgQEAgdm9pZCBkb19zaWduYWwoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpDQo+ICAg
DQo+ICAgCXJlc3RhcnRfc2NhbGwgPSBpbl9zeXNjYWxsKHJlZ3MpICYmIHN5c2NhbGxfcmVzdGFy
dGFibGUocmVncyk7DQo+ICAgDQo+IC0JaWYgKGdldF9zaWduYWwoJmtzaWcpKSB7DQo+ICsJaWYg
KHRlc3RfdGhyZWFkX2ZsYWcoVElGX1NJR1BFTkRJTkcpICYmIGdldF9zaWduYWwoJmtzaWcpKSB7
DQo+ICAgCQlpZiAocmVzdGFydF9zY2FsbCkgew0KPiAgIAkJCWFyY19yZXN0YXJ0X3N5c2NhbGwo
JmtzaWcua2EsIHJlZ3MpOw0KPiAgIAkJCXN5c2NhbGxfd29udF9yZXN0YXJ0KHJlZ3MpOwkvKiBO
byBtb3JlIHJlc3RhcnRzICovDQoNCg0KSSd2ZSBub3Qgc2VlbiB5b3VyIGVudGlyZSBwYXRjaHNl
dCwgYnV0IGl0IHNlZW1zIHdlIGFyZSBub3cgaGl0dGluZyANCmRvX3NpZ25hbCgpIGZvciBlaXRo
ZXIgb2YgVElGX3tTSUdQRU5ESU5HfE5PVElGWV9TSUdOQUx9IGJ1dCB0aGVuIG9ubHkgDQpoYW5k
bGluZyBzaWduYWwgZm9yIFRJRl9TSUdQRU5ESU5HLCBzbyB3aHkgZXZlbiBib3RoZXIgdG8gY29t
ZSBoZXJlLiBEbyANCnlvdSBwbGFuIHRvIGFkZCBhZGRpdGlvbmFsIGFyY2ggaGFuZGxpbmcgbGF0
ZXIgPw0KDQpUaHgsDQotVmluZWV0DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFy
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtc25wcy1hcmMK
