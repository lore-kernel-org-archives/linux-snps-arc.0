Return-Path: <SRS0=tXg0=K5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA976C47082
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Jun 2021 21:10:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95C3D613EA
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Jun 2021 21:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95C3D613EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0Pk+rnVd6i9bc1L8S/41yJ/KJHX2sDKFKxJAIocRldI=; b=PmHmRV6yz+VfAI
	VPPvuOW7JxFfq4e1pBJ8W/JEq2VMNbsVzHEN/9+RjxviaHcWc/TkPlLZ0usFKcI8UPnUG4zMso4Ev
	GZyOF44Oz0OEEyOlU5YOLBGWW4xFswkVXpQLOElY1lhnupfqQQGappJstgu4v0ML5kPeyKOVL5IL+
	8JdEXdzOay3lrENn6zgr/VnV6Zx55VWiCOb4Uc1NVgpJHBIG+EhBMsK3U/tAGWrIvdNZNqyHnHs90
	o5LSaD3MV50LvOhZrl7rmTfTr0QT2aE+75T/CAbPW28+jkvNjbZygGrytsTm5JxYOtzzpdbMJuCub
	9zU3C/JahtGGiTBidi1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loubs-00AasU-4E; Thu, 03 Jun 2021 21:10:36 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loubp-00Aarf-Ep
 for linux-snps-arc@lists.infradead.org; Thu, 03 Jun 2021 21:10:34 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2D635C088B;
 Thu,  3 Jun 2021 21:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622754632; bh=w5fS/ib2WKdXKy43w4zLsV564I1cw9JiAmAM9Boi0IE=;
 h=From:To:CC:Subject:Date:From;
 b=LhDhfoWo38H7x6W0PeRSayJ5qZZzgYLgmB+LF8terxpKajAp7ZSSfufmia8CxMUnp
 RAVyDKSRNER9asB0oLhz2EJNg5OncQOB7GQ5YehTcSb3MK2OasK8nhCRIF8lF1BMaX
 yZco7WfaC/p5ve2bugorzrHdtj//4uVAoZXvSpfInN2U3k7WUJ5vzqgE8/BjUbydqy
 PZ6MnFO2sczA/pHQFa90f2ZtjwSKW0vxqmesxdCQPBnLu/6T9f94BZFQy5MCfWTjC2
 mnt2jGYlRgKWWRUccSHyX97F++eoI771GVnpdqz/a9z916exwLcZfv6nJWi+MD8gii
 9v+zrH8q3Qiwg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5C091A00B6;
 Thu,  3 Jun 2021 21:10:31 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2175.outbound.protection.outlook.com [104.47.73.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6DA8D400CC;
 Thu,  3 Jun 2021 21:10:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="WpOEU8pe";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLSKDYTspx9oPBhLHcAFZjTbdj9Oyt8ZvZDynJ2qpGDZGHzgWDtsRVIf1d+gbqWGYTpWWCmSop5Hy3GWC/44RMo47jSCnY/jl0vgfoSwFtr1wC/5di7TQHy+KwN2Y5caoF2znhv/qmyHwatTV8r6+0/41sPEsNSK5qpdEf6/l9iN7iJDTZc5q0noXpRPTL8xIGleYl9mYvh0AW71MmJesmEu5wMHc7ZBWwBWXKvEGZFq0n5Ag9IeBLblJ/htVc8a2I0L2Q2olH8mB8TEKtiJi41pj2ZOrI4LTpdfroiOSVCvaYKuzy5ibxcYCd89d88mhFAbxcv9b7MorW+bKXxCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5fS/ib2WKdXKy43w4zLsV564I1cw9JiAmAM9Boi0IE=;
 b=eCQ8X+YbxJMaOd0Bax0IZdCOHLK5oRDizhoAa3oQJKzPJzrZ63efhelsUQeqUp1Wcwfq0UrBmrN1GNyCosoXEXN7nDB76OpX03TUWTPqJWtmEoU/7LVc0uJrX2FsSFocr4fzZR4VaxmRFxoBQaZXP1XlYBeIvOxXfkt2ZXXOVLg7DI35mlXvB/UcB/b0kcaDTdNpr8aEZblKqAC9oXpya1Vu6OP3JNqbLY+X5gEcRyrThfnYslx+PxV9GqTzMxWimGH9/K33A+i6qFWXVr/0Qzs5aggCilm3edCbnZXj02Y/xxG3XtZnrfP3G7xQTa0NapZxfwH6gSmKPJ5GDcoTjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5fS/ib2WKdXKy43w4zLsV564I1cw9JiAmAM9Boi0IE=;
 b=WpOEU8peHZXvayXKOyeyBuVCFJSZKT7K0gfoippRo3ZkK/7Zu5qeOKRZkyVb7Mak4DW5euB/9q9KLbhG3RN1thncQkk6Disjzt+429Ph/flBxM/nDYYDgn7dMW+v+0uYZvvL2xsFk4LMy4yNKvym3NadBsiEp30x+1WH6o/x+XI=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3349.namprd12.prod.outlook.com (2603:10b6:a03:ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Thu, 3 Jun
 2021 21:10:28 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4173.033; Thu, 3 Jun 2021
 21:10:28 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "989444@bugs.debian.org" <989444@bugs.debian.org>
CC: arcml <linux-snps-arc@lists.infradead.org>
Subject: Debian: jemalloc: add arc support
Thread-Topic: Debian: jemalloc: add arc support
Thread-Index: AQHXWLzhFoYP3xcQd0iucLUYfmue9g==
Date: Thu, 3 Jun 2021 21:10:28 +0000
Message-ID: <f3f674af-2d4c-118f-cc08-a5ba2b44dd80@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: bugs.debian.org; dkim=none (message not signed)
 header.d=none;bugs.debian.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bb9767e-720d-4f27-fa3b-08d926d403c0
x-ms-traffictypediagnostic: BYAPR12MB3349:
x-microsoft-antispam-prvs: <BYAPR12MB334973B6E46676BB7C31F4CDB63C9@BYAPR12MB3349.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FXqHc8tIs88m/R/pH8SdSGviFTQHOz51QuXheKDMIT0pY+GN7mPUbxAZAOs4ygDBaK2XY2q6Pc/SXODGu/pgyrg0vUWGjXgplhSes9mIhqVz4AZpKBwtWxZlunCLpPaFubeNWuG7ZJ3lbYPIjj24dbevpARD3Zgyfo8IMNNos1PrINhakIVbQx+/GN1TKsBfZBFfPRbCrtyA2avhVh93DsacQqtjV5uzGEGxZQ/es3cKI7X66nCGlcJ7ERukPDrRdkCDOu2w+DoJEj13YysCfWmYvkiUY6w2zgHqvb1qeMH2Xp/wV57gQ0B6Yq012M2ZpJgk+5WQGU70vRJU9yyzAbklSSvzmoIrculCp6gevGJVYjZzis5A21aK9jxmW+xkACjdnByRZD6AvQO+qzWRmzpc/H5Ibrw2cF7aHa6Q4Zxp/jLwrqIMJ4olzUzqB60RnAS3dD/9/i5P27Sz+d2HhHFA9cJ36TSAvyRnTaLIelUbBSgvfS5YUhbz70LXcOArb9ZplXtkd72CjydfxGBDqiflJpZF79TAC7VwCIZqp314vlz/mU8sEqj3DB9jiOefiQD9pjcLERfIlzYRIG4W04CHKO0Y3+x5Amxa2sNCuPZZaYZYEuWWkXrsInLs1ZaE5O2EQQnL61EovdZSF6eH6Mtdr0E4MxOqRngDNCYrFMjsKeL0a/SfWYFmrUFm7sGE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(376002)(346002)(136003)(396003)(366004)(4270600006)(66556008)(38100700002)(6486002)(478600001)(6512007)(122000001)(31696002)(66476007)(2616005)(64756008)(2906002)(71200400001)(8936002)(558084003)(83380400001)(31686004)(316002)(6506007)(26005)(4326008)(6916009)(186003)(86362001)(76116006)(5660300002)(8676002)(36756003)(66446008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dW5IT2pCUU9jNDM0eUVOMWNXZGdWTm5kWkhhRmxSYWpjQmtndk9LN0hvWlhw?=
 =?utf-8?B?cktpUkZJeDkvVzMzTzZQb2JJSFBlWDd0Tll1Y3JmNDluK0xZUTR6SVNYWXdI?=
 =?utf-8?B?WjE1WVhvQU1MT2FOcFhVL1h4WmJ5UG1OUTA3T0M4cUFrQm96cTVpZ3hMWEZm?=
 =?utf-8?B?eVcyVEQ4Y1ZwZS9JQ1NiTjk2UFFaN2l5bkNFNkw4TlRDcjdBUGNjMWJVRkZx?=
 =?utf-8?B?RWhWL1ZUeGhaQ1pzU1F1MEk5VzdXOU40RWhTT1lJYWVTMmkwdytRZWI2WTgr?=
 =?utf-8?B?R2JtYnRpU2hZeUlzWGpQUU0zNGc4THQrS2l2UFZSRDJ0SlYvMmNrL0xHZUhi?=
 =?utf-8?B?RmpzeTJDT1VJODRWOWJQMytCREZBZ1hkQXpKMHdrOVY5U0lQMlpZNEhsNnQx?=
 =?utf-8?B?bUwvUE9KUHVTM1BlaEFYdWVZK1pnVUY5cTR4cFpORE84ZFIzbmQ1Q1I3VGlz?=
 =?utf-8?B?V3IyWVl1dFlpVFhYa0NXVGRHY2tQZVp4R1dURDN1VVlCcUFWZmlNNHJ6bnJv?=
 =?utf-8?B?UU15YWV6ZXpBZlZsRGtRaStNZXd0OGpUTm9rc2xRai9yamFSZjlHQXJpUG5r?=
 =?utf-8?B?d2F2ZU03d0pYN2JjTEdmcTRaTzE1VldyR1hvOG1pSUNpbk5CM0pSRkxyVHdR?=
 =?utf-8?B?ZW9Tem55KzVVZmR2SU5taER6UlQzbjB4WlFGZ0FlUVdkaWVBeWJKSW9wMTBz?=
 =?utf-8?B?ZDRxdmRydG5aVDRsbkEvbDNtUzhlajJWS0V3Z240MytBZ2w2Qitma0F2UElQ?=
 =?utf-8?B?RWRFcnZWekxOZDErcjBpcVdiQ1hhSktmRWNDejJzdFVNQzVwNUhOOFVTTmIw?=
 =?utf-8?B?L2VrZWRtdk9sWTROUTVRN1RqNnRwUzVKcGJFRmdQQmtPWG40YkhheVR3MzFN?=
 =?utf-8?B?aW5ObE1tcVJIRDNpNVhvUG42NXR1dEdZUjJpczN4WXpwY2U5RC96YVZtdjVW?=
 =?utf-8?B?ZmtJaFJmUk9Pd1FkY2hYUWVIazV3THZaQitCa0c1d05nSE96M3Q5UWFhR1V5?=
 =?utf-8?B?SmFnb3AyaFdwOW4zL2E5L091M2xrZWxVVVVmSHBraXZ0VVZaZXdyWFUwTTRR?=
 =?utf-8?B?cjYzK1NHbk9lcVBJenc0QVVjUCs0aGFIZFBRaVBkbkFqb2xkbmhoU1dqZjRz?=
 =?utf-8?B?NjF4bmo4S3plN2xRanlQQXZVS2crSE5ZTXJyV21EUGFETkxuSkZ5UU50UTRQ?=
 =?utf-8?B?TUZBV2lIQ1JnQXd1cDA5NlZjR1NsL0wvbGFFUVR0ZlRDaElyT1NlSXdYT1JX?=
 =?utf-8?B?SWhsQkNJSEVGcXJMYXYvdDFuNEwzOHFyZDlabENvZG5YL3Y1R010bTVsd1hW?=
 =?utf-8?B?eFF2VUJqcFZXUExvaDRqUlFHckpYbnNKVDNYMERuaWZVVnNoMmliREVYb3I2?=
 =?utf-8?B?V3ZtbVg5OGdzUDFqOGhqMjU2d1h3RGJWYkNSc3htckE2M2dNU1Bvd1R3ZTgx?=
 =?utf-8?B?Z3IrbmoyeS9hRGNJSjJOY0F4cDMwcFo1Mk1tRmpQblFLMWRITmhYSjFHVHZF?=
 =?utf-8?B?QzdXNXA4UkJxbWROdzJaSUVGVjlvU2ZPSUthWjJXTTdiVWY1QTNXdU42UUQ3?=
 =?utf-8?B?a251a1BIbDdQbjcxRWFCRi9uckFjRjFzR25tY2Q3Q2tIa2FaeUFoVjEzNjNN?=
 =?utf-8?B?cjNSWk95b2FmRm5tWGp2a2JNOVVpOGUwTjRFeHJrUlE4aENWYlZ4bnNxMWM2?=
 =?utf-8?B?Q0d5eHcxSkIvR1ZFNnJURHJXNmtWaU8xblZyU0dKSEpyTUNZd0MyTUxOTi9O?=
 =?utf-8?Q?UmpnUFtUu+aRqjL7RU=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <5AF22B14D952A944BD560E5349FB7419@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb9767e-720d-4f27-fa3b-08d926d403c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 21:10:28.5447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +v3ovpmIOh5Q2pddF6m2V1/cX1jf3Ys+EplNZqrexFXMnzs0ZhLmMEtRAlGa/XjQHSZRovkBCc+NppH8VEaPxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3349
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_141033_646482_62FB6379 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Update: upstream change has just now been merged.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
