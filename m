Return-Path: <SRS0=rV/3=K6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BEDC4708F
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 05:17:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39EA36140C
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 05:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39EA36140C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZRgIvVfB7G1ReL087c6f/bUqXNTEdJ5AMblGhU60pEs=; b=MAVT2HX5U2kqrd
	vvUWPmKE+6alEGW9MN7ka7x34qQEiuEwbB50GxtTM3DpTSBO1glVBO7iolRC3X8HWGNeYU0fjUfAX
	Fj5jcQ85rLZWDrKMi4DPsMyphWNmDGPku0RMFN0kbR/C2H4w2OgcaScui63j0XI+E8FZteZZdXXbB
	ZtbL3E2YP0WK9juoB13cbTF5p7wnCs4/4eRAXnvqNaRov4Pbld9GJoGxbRKIE3xU+3GiOkODeHHRu
	QeRm/RaA2J6TZcupUxDlylftwmks+cpF+NH17hFXviDNLsvoP4ol4OXKCPjoFCAx7YI1/pb3lRGI+
	kSGwFvsXYmi0Wj0QSyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp2Cs-00BZMP-LP; Fri, 04 Jun 2021 05:17:18 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp2Cp-00BZLN-Jq
 for linux-snps-arc@lists.infradead.org; Fri, 04 Jun 2021 05:17:16 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 151FC4062F;
 Fri,  4 Jun 2021 05:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622783832; bh=1jmRPXMgMxpux4cPll67cEC2R3xsklSezCvCdpawFY8=;
 h=From:To:CC:Subject:Date:From;
 b=KHvHieArZPe/fTwWd5SGm0T4zpEFrEbWx64zHjkKtt+EMXCZEPR/CnOMIcBcTxQE+
 42iDsQV48oRgF5vUxeh0zG2Qm2eMmI3XcYTCzlRrXlxM0eU+1t3Hmraej7+du/5jbR
 R5AlVltsxr0jj3ay7+qqg4mtfzGXy8gN2evn92Htn0if/0ec/gimRsVnQo2RZn7jU1
 sR28oYymUSDH8saWYkpEWNN46sex9bi1yFz21brtSI1Ev9Ud4EexgzTukDqbeGKzVu
 8PoSjAi+5yseZtU8l0htd3m74XIqUSR9Jm9r0mP/BsdgaOaMcU20h8x0VR2kRxRXHt
 cE03HEod/6HKw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6AD83A0096;
 Fri,  4 Jun 2021 05:17:08 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 286EE4009A;
 Fri,  4 Jun 2021 05:17:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="UPjfjh/k";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5arOg50aknOBUL/9eKFEs3De0bGH7L7RR2p7K83VC7n5m041r8ZQWZCplv58WqyMrB+mUg7ACTeu77vwiGCZhs1LrycGDAok9GdkndYMJa4GEeZq+Bt5ZycFCumEroM40buVQ78zdmxbVnE6MNDcqXxmELhx0psIsHILcMYdsHMZY65DqTwLiL/aUGhV9CJnMMCaFFoxFuNyARDeVMj4v735lBq9Kk6YSpqu3tXw/AONmdEI2VxklWVASMebcqcsdcYt25oTzolIl3FYDDQN6MdQ/77Pk8u89DKD4OmV922FaqoPRBNqx9sY7POAzWh2roY8qEH9vHoXmKSQfbCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jmRPXMgMxpux4cPll67cEC2R3xsklSezCvCdpawFY8=;
 b=Ojj4o6NVgbOGwR4DPg+mIOu1n/Ja7wFoqLO0E6OoinnJSMIDlaJJA0FMuu3gn6CqiuRK6YjqT2d3x1ROuX2B1oEpfX07vcseHWgIYSiHRNCciwMWG4VPgMAfnUC9g13JDt6Z+xpdh1YQ2IwSLw6N++c9hA5Nh2XmIx0eBJrwaWPmnxYJnufz9HWnWDEdnb0TwFhsXKvDuZk8/cBZcRz2Yyqg9yuW7VghJUffq9qYTYE9A75JqdjA+1LC6ckZZ46oQhaHbi832dpryrqzDpVTPvFWsfk6QNTK5L9rm2BkxJfNNo/KXC3oODikMoA1HEjMQaxbA7jtEHmAU8nheZ2ebg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jmRPXMgMxpux4cPll67cEC2R3xsklSezCvCdpawFY8=;
 b=UPjfjh/kLBBzNPFg3mFn3hLZxAshmaLa1eykjiRRdOJmEdQ3GeBFdZQX9NGszAN/blP/R7MXvjp1VNHS3GGNot4uEpbe4oLFzSs3VFaaV/aVYS08bDDW0GaknwXZvVCC9l7UVpQQ2Z7gD7TpKYDUuJWELCLLYKp5uoguaP/hVYs=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3351.namprd12.prod.outlook.com (2603:10b6:a03:de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 4 Jun
 2021 05:17:03 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4173.033; Fri, 4 Jun 2021
 05:17:02 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "submit@bugs.debian.org" <submit@bugs.debian.org>
CC: arcml <linux-snps-arc@lists.infradead.org>, Helmut Grohne
 <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>,
 "debian-gcc@lists.debian.org" <debian-gcc@lists.debian.org>
Subject: Debian: gcc: add support for ARC
Thread-Topic: Debian: gcc: add support for ARC
Thread-Index: AQHXWQDaJZC6Zg83DUSzs+3gkZqFnA==
Date: Fri, 4 Jun 2021 05:17:02 +0000
Message-ID: <c975d326-fa6b-9fb7-6f7b-a30217bc136e@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 37f42c89-af14-4953-9d7b-08d92717fcc6
x-ms-traffictypediagnostic: BYAPR12MB3351:
x-microsoft-antispam-prvs: <BYAPR12MB3351AD10EE4960AE362EDCB5B63B9@BYAPR12MB3351.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:252;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oURCQvXjjwO2RMsjmm89i0SAxXktfsxlMpBDxDyrbDHRy2xbuVGp5H0MLqooK3nSO8VKCWd7QsouJcEFg8O/dATffeK43xuZVaqo1fNQW2OaYc+fr0SMrl0YlH40T9p4XoqB97UGFal9e3NLj9jnWaZ/nu1Q+QIUnagQ61Ek/kcRnfIyFA6W8bdfuxIuDZr0ZqDErnJjktlg+hLIULpPyP27EI9MHnb3wBA/5Xo27joiruYLCQ9UhUqAv4axuPcFENRWCx+Kjj5o01jBkIoO274ROX0P+J2z0yRZRrJyxTCeoYqj+yqI3w/6/egqWjF+xRQWU0H5HN8MwPSsVswi/CBMSfcPfrqwmsETvodUqeEh+zII8C76gTEWWKrgW8ia89HPmCUQUlVsNuKKmQNmTIMlOFbGNNATt4Nh50IwtqJoFe6X16IlHMI+GdhhYUd3OWt2PXsFoUtlzWMwPicAjlSJKNEEcpPFsgiHe7K+Op5ZaBkRvWKjrMG5Wrzps8LWCzN3111kRN2DpTtX0aJa4E3XTmw6jmTynSul58HAyYFGVlAPoWT4tuNI89eJPwwSeLBAsKRe6n/mKW4e6gVqDSSV3UoEX6gHgYRUf2qG66uH+ljofmbN/vjj8IyuNW+SJDKRSXe6VzbdIRO3AIL4v+Xq4bGQM2FTsjZH7DFBg2FH9joeNWuzyRkaqERU1mwr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39860400002)(376002)(136003)(346002)(26005)(86362001)(36756003)(186003)(6512007)(8676002)(66446008)(76116006)(64756008)(66556008)(4326008)(66946007)(6916009)(6486002)(4744005)(54906003)(66476007)(122000001)(31686004)(316002)(38100700002)(478600001)(71200400001)(31696002)(8936002)(2906002)(2616005)(6506007)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UzZyNnNPN2VsSjdic2d5WFNCL1MzRjQxeW9UUm1kZ0JoNXRnb0VHcFFoY09K?=
 =?utf-8?B?N2VYemdKVlppTUlZYjY5NkJiUnVVTTd5MHlVdTIwMjk2TFhBMGdGWWJIR0sx?=
 =?utf-8?B?eFVoUVgvVVIyYzV2UnRqUDJtNmFjbGJxSWpUQ1lvdktvRksveDRXWjY4WEhY?=
 =?utf-8?B?Nk03dFB3bjlvbXFYTmM4ODVkcllXZ2hoR051a2xhS1pIZ3cwSTVyekxGcGtI?=
 =?utf-8?B?TXYvaTJPMnNnNTlWR3JWVCtoZXlHTmVKTDExQklDaG83b0JjcmxhRGloc0Rk?=
 =?utf-8?B?dTlLSXBxZXhkQm9jOXBZSS9pYmx0NzBVZlZJR21tME44QVRZa2FpSi9rVzds?=
 =?utf-8?B?R1JIK08zV0ZJTHV3OWoyQ3dBU05QNUhMRUpIZzRTZzZocXVpR21iMmI5YXFG?=
 =?utf-8?B?SXhtODhTZW9ONkdWTmZuT1BPY29DU1dLOWJpMURYWTltTm40a3dXTGh6enoz?=
 =?utf-8?B?WVdFb0dkNlZKdUFsdFpyYmJKUlh6MFczbWQ1NEUzV0MxdzRuN2NqN2s4ZWYz?=
 =?utf-8?B?eXZ4S24vdnUzRGxrdjQwQkgzcjYzSkJqR2kxSjRnenlMTEo3dXhZdlExNFZy?=
 =?utf-8?B?SERwcEhEL1k3cmRXYlh0UHU2akdYaHdUbnVSb2twME5jQVlBNTBneUtWeXFx?=
 =?utf-8?B?RDFLYUdBZ05hT2RGSW8rd3BIOHRBcDA3UVhvZVRwRXZmaVJNQUNxRnNxRnVG?=
 =?utf-8?B?UFNwVHR3SU5iSWE2RVFydzYxUEFDWXpqUzI5Qys3STRVME1sd1ZQM2FnTVdS?=
 =?utf-8?B?aEtjS3FYOG93eDIwVHo4TnB6amxIRk1nencvUW5wUldCZ1d6Zk9aMTlMT3Fx?=
 =?utf-8?B?STViQ3ZtY1FiUEpidkYzdzEwL0xuVTFEUXRVRHROZFY5Y3J0MHlSQUJ2TGJP?=
 =?utf-8?B?K3F3YjJrR09xWEE3TWRwOEliR2s2clRlT2FVc2E0OW1Gc0psSDkzT0lXcUtI?=
 =?utf-8?B?YmJyL3d6di9LVzk1MHVCOTFXaWplRkdvWm0wR2F2V2ZSRXo0UmdCYnJYcVI2?=
 =?utf-8?B?VEY3aGk0SkR0M0RFRk4zbVh3d2k5U2VWeTBVVzkya0lLRmlxQUp0ZEd5OEpx?=
 =?utf-8?B?QWZPbTNzS3VBdGpBZ0VqK3hoYkpiN1YyMXZqK25taFB0RnMvbTladHFvS3BV?=
 =?utf-8?B?QndES1E4bTB5clozODc4bkRNR0NML0xVT29ZM0FqSC9CNHpPa1p3RGpWcDMz?=
 =?utf-8?B?SmIzRnBFcnFabVMzSVhqR0xtZWtUR29hbk12NDZUeFNiZy9LcjRCaWpaVDgr?=
 =?utf-8?B?bUdFaitQbWVMSVFibUs2cE5wckhCeXVKaUtlMXVqdTlWWjB2UThqNDQ4L0RZ?=
 =?utf-8?B?bUtTSzZvd1ZVSEIveXJucFNHTnFlWGt0bFEwVGV6VlhPYTBsUWpCK05ZeDFD?=
 =?utf-8?B?UFc0NDZ1aWtZZWwvckVxWkRCNTg1RTRVMXRtVStjT2UvM3MvNC9mMnowVGVT?=
 =?utf-8?B?RFNXQXFXZWpReDcwdFhhdUhCVTR1MVN5b2JTNXUwUExmVEgzaE9acXpaZ1NL?=
 =?utf-8?B?eVl3R1BtY0RCdjloM2lQNE5sdXBxVndvYzNmZW5xTGIyNnhOME5HQWtaMVNO?=
 =?utf-8?B?dzVKcGU4Y2JDckJxMG5JaEt0SGp6U3k3dmF6Tjh4eDlHL3pOUTBoZXBqaU1R?=
 =?utf-8?B?YjcrMktsS09qbnU1Nm0yOC9acVdhckZDUWtqem43TDgyRXlBTE8vU2NLeTJl?=
 =?utf-8?B?TXZERG95RWt4WDhhdCtXNUVSbS9QN3h5M1UzR1kybFVrTWFiV0x4WGFsU0Zj?=
 =?utf-8?Q?fJN0TXCLtewIN6zhVo=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <AB2DB77BDAD6484AA4F5F1C36D9281E0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f42c89-af14-4953-9d7b-08d92717fcc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 05:17:02.6182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bH76qvPqSXbLGif11HPxexistLiEDnyVJejk4ddNgdFn12bx7iqt3ph3Mjj2lx8tdgBvnpLuDAUQXRGiJBo5fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3351
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_221715_769423_D1BAFEDF 
X-CRM114-Status: UNSURE (   9.65  )
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

Source: gcc
Severity: normal
Tags: patch

Hi,

To bootstrap arc port we need following changes to debian:gcc.
These patches are based off of 10.2.1-6 as that's what rebootstrap 
builds are using.

- 0001-ARC-upstream-gcc-driver-default-to-hard-float.patch
     This change is already merged in mainline gcc as of 2021-06-02
     commit 46d04271a498 "ARC: gcc driver default to hs38_linux"

- 0002-ARC-debian-rules2-gcc-disable-multilib.patch

- 0003-ARC-debian-gcc-defines-for-multilib-multiarch-enabli.patch
     This is equivalent of following for arc
      - debian/patches/gcc-multiarch.diff
      - debian/patches/gcc-multilib-multiarch.diff

- 0004-ARC-debian-gcc-add-build-toogles-as-for-other-arches.patch
     This is equivalent of following for arc
     - debian/patches/gcc-hash-style-gnu.diff
     - debian/patches/gcc-as-needed.diff


Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
