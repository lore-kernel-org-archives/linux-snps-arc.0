Return-Path: <SRS0=figV=H2=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C6FC433DB
	for <linux-snps-arc@archiver.kernel.org>; Wed, 24 Feb 2021 20:18:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 846C564E20
	for <linux-snps-arc@archiver.kernel.org>; Wed, 24 Feb 2021 20:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 846C564E20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Content-ID:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bivlx5W4m5CH3BvqvxpZDrTk8yMRdw5x/XL7odZ2hSI=; b=Ssdm/aJQ+lqrU2Vq0hRkCB0ydA
	5BV/lFrkueujfBHNiQQbt6X7jN0qCeb1Rq+hk7fFpeszhTaeMFAC9nXhM3+97mvxoVGw6HgL9TLOP
	L44IweEeSaAEwhVRGRRlkcBDosHLjhkNgZubO9FX/nOyz5Lsf/pmABJOmVOQ3to/7cpewqxNK7QHY
	8gEdK1Cw0ACyvhRKcw18SkJ8GyMOawrrgA7DHKaJE1g9VYN62f4O9PhENCqaqEPpWD3c9i4HMiYut
	7Qe7Ll6K4aMpxMQlozXpWxvmNi8lvr3MuiR4LU6GvweHLyYNU4msC46tO7inEweNTeMk5+OiByXTp
	dN9s/8Gg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lF0bq-0004GD-Js; Wed, 24 Feb 2021 20:18:10 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF0bo-0004FT-1G
 for linux-snps-arc@lists.infradead.org; Wed, 24 Feb 2021 20:18:09 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C2A1DC0080;
 Wed, 24 Feb 2021 20:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1614197884; bh=2EXcO8jCJ2hM7X1catzmavwntfYaiEZtbfCXdluxGQs=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=g3RIwRgJh7999hk1p8jdkO35kf/IOpe+Y/l8pwqmxbzsubhKXCRsymc6gkh8enJK7
 o8zdtQK5hsOSPYjBjMUihywV4fjoQXjILum0I8tjThc1lrWTcIEQKYZ3aIXwj6ba6O
 HNrbbQDPYzBfcWarhpZPiteLT5jnDO7KO1bwB7rfPQW1QcGWWqLDmuH/bsLsv55b46
 rqbEL69CHGoHcrTMSmYQR6ZDA2MuwLGruZziYMryhVI9Mp8gQuts/20CVeZp3WdvXk
 +oD74T54OSYDEmJNp+pWQ5xnzHCPGQkCFhs+FG8qpd0CeUrlsADTMAbpX1tOzy3PCw
 nqO3trH9gbUTQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B25ECA0063;
 Wed, 24 Feb 2021 20:17:58 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2B99380270;
 Wed, 24 Feb 2021 20:17:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="XWEaHGsP";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahwe4MwNolisX4TRq2nwQ7QjXqQjqm2/o+/X3Ed7C8Mf/HiV6ng2oXs8rfGnoRt8+oJ/kGG9QTUXjRbaIn3MCtzm8q4xgxgo154cqgECFK1T9tszaxGN8GczRp26n2a116TNLS+PLNdKrO5S54vJxoCJJtifJCUtEaES4c+OZ4KhtPo4WtVo9+26+LZWbP95KmgJDrqtOGRTPYBF0Ngq3DnMnyRonmb6yh614VNkk7vZy+HifI3wISGog9XFqdPHvte5qMirb2SJam3uCclUuxPorfncicSi0zIFAfTQU6H9RHkBuJLGrmUbRyruplwJ+6Okjfq71H8rnMUUEF2NLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EXcO8jCJ2hM7X1catzmavwntfYaiEZtbfCXdluxGQs=;
 b=fAQT/RBm6/SYRvGJfvN4cVudlCrERovbN/sByVVwFs1YAOZUpQrm+y+3k50m7LxMjsZrK58e5JS/46IIx6A4Yf8361jxSHXLojb9spdT8xee210FUos5U5IUM8xEwkl55thh+osXvO9DwlqvlKLoA7rlq2/hPvIV7fohlLPxQp7rYi+gPUaJTf93TKoBovTqUOH6psoP2R/J6na9pBCAKRZXDZNw/tFefS8IKVjUeLjuZqvioslk2xN4QvTCANLAj2te4STEKqtYYLMcSxEysQanvuCCZiIRs4Wplx6tcbXAwyq3bhsHE7UsTCMfqatK9gJw4v3p0iNAN/04fPQhSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EXcO8jCJ2hM7X1catzmavwntfYaiEZtbfCXdluxGQs=;
 b=XWEaHGsPQUROHUD7erPbgsOx2TkKt/w7QXhIvZmYbsO8c7BNGhVbi4jMOpYhMQLkj+a2cH05nnptYxMak04VjE9fz2YN57OogXM4a/P8qjR9uV+cpVWNoL5qrELxaP6dyxFw8p3P1pFVTX+MmEbwZAUbaWcuhIm33VTXZD1aq2E=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2901.namprd12.prod.outlook.com (2603:10b6:a03:138::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 20:17:54 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982%7]) with mapi id 15.20.3890.019; Wed, 24 Feb 2021
 20:17:53 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "debian-cross@lists.debian.org" <debian-cross@lists.debian.org>,
 GNU C Library <libc-alpha@sourceware.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "debian-glibc@lists.debian.org" <debian-glibc@lists.debian.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: ARC rebootstrap prereq (was Re: switching ARC to 64-bit time_t )
Thread-Topic: ARC rebootstrap prereq (was Re: switching ARC to 64-bit time_t )
Thread-Index: AQHWAwU1+G2qa2pZHUGmLInRr97YtKhaX+MAgPEHl4CAABHjAIAAXOqAgR338YA=
Date: Wed, 24 Feb 2021 20:17:53 +0000
Message-ID: <72128fcf-2409-ef98-4e77-bc2ac40ccada@synopsys.com>
References: <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220162735.GA26634@alf.mars>
 <2c3d76a7-fa94-d16e-2803-a98a4761e427@gmail.com>
 <20200326055408.GA31088@alf.mars>
 <775ecf3d-bc33-ff9c-347d-3b2f0db6c509@synopsys.com>
 <20200826154354.GC8835@alf.mars> <20200826211627.GA3969691@aurel32.net>
In-Reply-To: <20200826211627.GA3969691@aurel32.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b07fc706-9648-4283-c7bc-08d8d9014472
x-ms-traffictypediagnostic: BYAPR12MB2901:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB290144B6B252B35F297D31C7B69F9@BYAPR12MB2901.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0dFxG9MAI6MRDUt+y5HYtrKFrmfisQvNjCgr4Z+qgvsimlILErffeIAWkGRnqNvp9PFjAuXYy0cagzK0Nx5uNFFvTkCC1My5M1SOtM5i8QJv3nCzPsea84006Yd9Vf6+j9twsh68nhdqO3eYS/nKB78Tz8T27Ml30ghuGUnKMPrWWA1CjjMVgD7nTe44XUJwcNpvNGgoocVcWrUJpFj0XvIB7Vch1nfVZqKbOESZqxephvo+7g2mjH2xML3zRyY9gF38nNKrXg1VYy6aFb7qoc54WEVzq1JyZB08315rZHLAr28jgimX6ats4tJwn/RCuxi4mmDxiXYq5lhnY6Q1vhffQOoQanDT3ogkA/AAOUM97qIqJaed6mOJfaIpaj5zWkPiDhEu20ttl6IHtCGM6uzG+y/FEPTJfAmeJC0YC+5SZQ3G7jY9AmKYH0wCni0XKO24s6lKoGGEndwfNZbckpvbv2C6jCms4Bq4tn8VlPEBfSMubUMUe52jZqNNd/K9D3JWtjv0CgbrTmx0C/9Sl04A7f8ZGguSMpKdJfr91cPJNPWoDZekW7zWX1UwisxcayNAgaPdG6lew4G8Ir5LZ0BwkKdaJSkKcL3i4Gyr6J4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(346002)(366004)(136003)(396003)(110136005)(316002)(8676002)(31696002)(86362001)(6506007)(66946007)(6486002)(66556008)(6512007)(71200400001)(66476007)(64756008)(76116006)(5660300002)(66446008)(478600001)(53546011)(31686004)(8936002)(2616005)(2906002)(186003)(36756003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aDFDY0RVRkdDblZUS2YwNSswL2g3T0Q0VGRuVkxJWlBWMWJpdW45NnprUWpU?=
 =?utf-8?B?czBBQlpwTzE1TGpHR3pGcGdKOG1YamFMaFU1M3k3V28rWkRubDh0SzVkeEVL?=
 =?utf-8?B?dW5lS1Nmc00wUHRiK2V6RGpVS2gxdlFuOFl2RnduMHBlTmlKelpHLzVqVENF?=
 =?utf-8?B?ZW9ZZzBXR0h0NjR1L2lIaXFSeXpuelNQRnllMXk2bmhIK2hBbjIrdzBONmd3?=
 =?utf-8?B?a2FiRkxSSVdYSzFpZjU2QkFpbmhrMDRPcFkrUnJ2dDVPSXJWd21CRjB2Uk50?=
 =?utf-8?B?YjBHSFBlSWVqd0ljVFM4cytWb3F1SmhIOWdVT244c0FZTXlHb0xJL2tXSWJC?=
 =?utf-8?B?T1kvY2pZVTN0Tlo0WUtYZmZGeHFWQ1psSTNVWDJteTlGTVpiSVhJNzNNRjZ2?=
 =?utf-8?B?cGEwWWVJaHl4c3VETWx2OFhpMnZXOXBaaWVKYnhjWXRxcEtSNTdMdGtsSzJ4?=
 =?utf-8?B?T1lka1hzbkhiL20xeThrYzE5aXdUOVY5VFlqaG5LL1YybkRmbVhyUUlLa2Nx?=
 =?utf-8?B?TW5iZE0zYmN6aWI5RmlZVHZmTDRTRGdQc0ppMzIzTGQ4VTJiNkx6Z2FTMnZt?=
 =?utf-8?B?M1UvcWlma3VlR2ZVSW8vWnpWbmFkRmRDaWVNeWFyS0ZPZWFJVkFIOHlvQmU0?=
 =?utf-8?B?blIxM29waXFFTnQ1bmVrOUR5WE5ueUZVRmEydXVtWVc0ZExXU3Nva3VKTFJH?=
 =?utf-8?B?MURoL0xSdFY4Nk5CSk5sOHA5d1BnRXp5M2ZyYjlOcW1lUnVMdDFiQUxjYlp1?=
 =?utf-8?B?Tk82elQ4YVhIT0ZGVFQvSkZqbzBBSXdTcm1qVk5JdTQ1bjFlaUtFT0hPRjZi?=
 =?utf-8?B?dGMrRmZObWxrWUFQWDdFMGlVZlQ5aVFxUDdJdlNoaWV4RFIwY0JFcHFWZmh4?=
 =?utf-8?B?MWRkNXZLMXlNWFZGYUtXdmJONGQ4RXJhdVJQVHJiU09RUWlFdml2cWZIQU5X?=
 =?utf-8?B?TEhsTENkZnFvRFZQZ1dXQ2h0Ry84UGJrMU02RnNJTGVlT3QwY1pzbkhYR3kr?=
 =?utf-8?B?ZC9JdUZUcytRUUhpT1hVaDdGcjV3cjlKSkZ6ZlV1UEdBVndUSm5YNjV4WlBU?=
 =?utf-8?B?eUZWSW1IVWtRS2I3cnlFV3lvb0NzQ254UjFSTGc2Q2ZUdGE3bnpGclpxWG53?=
 =?utf-8?B?T1R6ZHRueWRYQW1uelN6eWN1dldEbDVGTHVPYy9JUjd3YU1mQjBGbGg5azgv?=
 =?utf-8?B?eW0xeUJ5Q0FKY0FUc1B5Q0czOGN0NGVkWjJNTTVvWktyWG9QdE50TW1VaHpx?=
 =?utf-8?B?RFBDbU03bzk1Z0N3b1NlRzZrbS90SW5vVTI3UUR4ZkN5TXdyV0lJS1pmNjZ4?=
 =?utf-8?B?S3JnSExZa3o4cTFLaG5TTW04N0FzbDhsSjBERmdraFF3OTJGbitBaFlSUzMy?=
 =?utf-8?B?VjVoMFFjNWVablVtRjNTb25FY014N0lIYXdyL0NVVUlNb3F3bHg5aDYvV0N5?=
 =?utf-8?B?Ny9zUTRVMTUrNjlsQ2RncXZ2MzdvMXVSdlQ3UmRwVGNHUW15alUzclh2NGIz?=
 =?utf-8?B?ak51ZzJxRktoTERZT3dPTWVXRGN4UkIrYWlQWmRPQTdndVowdXdLYTJ4NVJp?=
 =?utf-8?B?dDhDVXJFRitvSDlOSm5ueWU2Z1pRM2d0bWxHUzR6bFY4U2lWSVVYZzZXeTNs?=
 =?utf-8?B?MUREamg1MzEydkVBVk1XRFNjWGp5dUpwN3RpQ3lrVlFmN2NZZjVyVVdJaWJW?=
 =?utf-8?B?eW5DUGdYaW5QanpiSGpvekcxeE11Z0s1a3BaTHFQUDFjNm5paWV1NHphak4y?=
 =?utf-8?Q?vH3xzjbK6K5kH3xi5o=3D?=
Content-ID: <5B49CCA1998CC1428AB7164A9BB7E4D0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07fc706-9648-4283-c7bc-08d8d9014472
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 20:17:53.8553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RZ6w493jvn2OCs9dw4yznF9aENX+3Q21PT+t1l4nt6YYb+UBQ1ON+n9qLp91gkNDnL5X9VFkV41UlA4P+gg8Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_151808_567064_CA7F9870 
X-CRM114-Status: GOOD (  23.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Helmut, Aurelien

On 8/26/20 2:16 PM, Aurelien Jarno wrote:
> Hi Helmut,
>
> On 2020-08-26 17:43, Helmut Grohne wrote:
>> Hi Vineet,
>>
>> On Wed, Aug 26, 2020 at 02:39:53PM +0000, Vineet Gupta wrote:
>>> Following up as ARC glibc port was merged upstream in 2.32. Can we now give
>>> rebootstrap a spin for ARC Debian enablement.
>> That's great news. Unfortunately, it's not that easy yet. rebootstrap
>> requires the relevant software to be packaged for Debian and the glibc
>> packaging has only reached 2.31 yet. 2.32 is not even in experimental
>> yet.
>>
>> Trying rebootstrap with an experimental glibc is not entirely trivial,
>> but possible.
>>
>> Aurelien (Cced via d-glibc@l.d.o), are there plans to upload 2.32 to
>> experimental anytime soon?
> No it's not planned soon. glibc 2.32 has removed support for nsl and
> rpc, so we first have to do the transition to their replacement. That is
> libnsl, libnss-nis and libnss-nisplus for nsl, and rpcsvc-proto and
> libtirpc3 for rpc. The nsl transition is in good state, but the packages
> are stuck in NEW. We've started to work on the rpc transition, however
> there is a lot more work, we have at least ~50 packages that FTBFS and
> need to be manually patched to use libtirpc3 instead of the glibc
> implementation.
>
> We definitely need to use experimental to test those two transitions and
> ask for archive rebuilds, so it's not possible to upload a 2.32 package
> there.
>
>> Alternatively, can we segregate the relevant diff between 2.31 and 2.32
>> and apply it to the unstable package without bumping the version?
> I don't think that's really possible, new ports introduced in version
> 2.32 will have all the symbol versions set to GLIBC_2.32.
>
> Regards,
> Aurelien
>
>
> PS Helmut: Once libnsl, libnss-nis and libnss-nisplus are out of NEW,
> you might want to see if they can be cross-built, and if that impacts
> the bootstrap process as the glibc packages are going to depend on those
> (in the same way as for the libxcrypt transition).


Checking in to see if things have change since my last posting on this 
topic.
Is glibc 2.32 now packaged for debian so we can attempt ARC rebootstrap ?

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
