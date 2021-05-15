Return-Path: <SRS0=I9+C=KK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9F6C433ED
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 May 2021 02:58:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C7776144A
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 May 2021 02:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C7776144A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VMJx/K0/BJJaQiUeBUoxtedU2jOnL9LOZORdUR6GbQk=; b=SxWKnhYQXg3NoPsYVgalyIzNdS
	6hbCIknQY5yamizebSbXBUSbcm32+uiocvJFQU4rd58VflgSwT0TtNLj0rC+2aMFbXXuGZ3wLKhLV
	+oS1L1xGjrxvasAzOAOOMkQ4l0s0+HfLGNHsaeXHyD1xfjLS94H09XGKQvtVFrJRGDeZ7WOI9slub
	aUT+t4Syn0Joob/MV80iJqfmmiMSopMRKsdK0l+tjTEhxawtahOzOB1lEutxgg5PayDYvfzC0ogLU
	AduF4QsoZqVsuCZE2iWEnRTd9uo8ltohjTUi+AuFz2k3N/Xo4517cPyB0xwEIG3C6yjttvjhnC3hF
	qRLfwu7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhkVd-009YeE-0N; Sat, 15 May 2021 02:58:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhkVa-009YdI-Gm
 for linux-snps-arc@desiato.infradead.org; Sat, 15 May 2021 02:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-Description:In-Reply-To:References;
 bh=rBJzVIBpsN39H4GQaowPUFH1Fj5wnBxMBOlq4cBXRhY=; b=h22WZFPJqAtpGPIb6Z63sBYfr/
 Lru8Nm6N6eCJFVaa7Bo7khBPf6NQ/3gbGf9Y7Xwt6MkDJ2IVia6fdKIffpvRsvXvOKvIOp+VSO9d/
 ycma9mgO48YGKXFb+nE2ZNO0zSfvycEkWmPwysmcC1QGcMCnUs5yF3w4C3ignxLzCqyamWW5SHVvO
 EjNXo8yx6uYsgVDAz+DMYI867hQQEy37Iu6+3olGnMJ1BoboBIoBhbRCxG5WewWuRsvcjrrssNv8v
 8CUIWWYFLa5IdDLOH8Gd1Wxow4Qlqv+4kXYhlXiq0CBH0fa/HnUMN7GFj9ZqOyI9TOOzHbnH2fyqt
 HdcK4XZA==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhkVX-00CMOM-Bk
 for linux-snps-arc@lists.infradead.org; Sat, 15 May 2021 02:58:28 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5FBFBC0AAF;
 Sat, 15 May 2021 02:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1621047505; bh=rBJzVIBpsN39H4GQaowPUFH1Fj5wnBxMBOlq4cBXRhY=;
 h=From:To:CC:Subject:Date:From;
 b=aJqZHqin4OScBATsLwvn0czLoEuseNypGDPPDmYcg9nbw5yaCNx7d4cwicDr8ODDJ
 aIeQhO8Ddrbx74MN8/Akmx6yICSPdl821WWeJ460OvjenzFowVyY6glrrw1Wvh8jWz
 PYg58tvJ8SyaMsAUFp4nV562U50AhTG8pL3yg0OOHrRKB7wvY4GPfAHYxNcNrdaCTj
 uodo9TsF10TJE+0SA0zlNhSmIBoHzRr+eTFopvCZhxiOftjfETN4XwpcbMxRJ0108Z
 W737yoDMO310NuZzRLVjn73qQRBla98eVsS1v2rpwNxM71n1f0aAEa1Qg5ZzU7prAD
 CJ6yOas0osi7g==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A0B80A0071;
 Sat, 15 May 2021 02:58:21 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id B1B5E800C3;
 Sat, 15 May 2021 02:58:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="rLsVlPkI";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X15yydaob+PZpsPErBlYE9E5TL0IGKlwabdHYUoLut04GY0WeE8i5YQGnrsFVOIEzemNvBajTB/OrNtcizJd8LZY+q1DGIiDCYksnGDh58LCD2hD2bc+R4Jlh0KOEPGeeCLh82J8BwD9yUpQwlSRfgpknwGHEPEuA36rAzvKpu4FQ17+YHb8YiGl+G6ZZ/CfGHjg1PGxkrh362GwFBh8aHi0OtdutfmprXlnE2yJ6UKFqjHHfvdx7cTNV3mmYPB3a9Mqijdcai5kvpMZG1XUMXB7Ezp7/sUW5TWD9npixcdWUF6dKV3q35oWKML3h1ViuVuE7WZyefhtlcXF+neWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBJzVIBpsN39H4GQaowPUFH1Fj5wnBxMBOlq4cBXRhY=;
 b=h33GNtt2cO5+ARc3JJDwx83t/HeFCqP7drf56hISJABJ/lXBnyNkQYpR3y58YFJzTFPzzKP32/CK9vGxjXrEGXBlBTgJi9Nk9RcHbV5u93soZRzRpToKaXuJ8ZXEFcEldbdcUOfqIT8O0Yf+oiWNet5enA4ktO7HcTQEjLns0eA8edNGvITZ5jUkqebmS/AI+Skrx26aL6UcZuUGyTf+hy7sOLfk/eQho2fNXO3LmzQ5juJFulNJ0ewNM328wOkJ3MDwBKf85sQbIlN3usNte09PQk+HzSydlRjIdmkoDWzafUNPZLF4CYaAfJt1dQRGy1O6orEnZw+VPJSk9TW0hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBJzVIBpsN39H4GQaowPUFH1Fj5wnBxMBOlq4cBXRhY=;
 b=rLsVlPkI73jS8m8om+TnsaTH/7IDZ8fVf1FJnuf+7UiczycLoIbuVQeWuU5BgQ2NRdo3fTWrQ3D1ukKWji5myV6VlLJUIGFV9SG7DE8TyNmkOhLKWYyDS/TwCcmm1Wl2safVs+sQ9gGJkjm11qaXW2z9SgZRJuq3ex7RfSeXCSo=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3640.namprd12.prod.outlook.com (2603:10b6:a03:aa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Sat, 15 May
 2021 02:58:18 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4108.036; Sat, 15 May 2021
 02:58:17 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: arcml <linux-snps-arc@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Vladimir Isaev <Vladimir.Isaev@synopsys.com>
Subject: ARC updates for 5.13-rc2
Thread-Topic: ARC updates for 5.13-rc2
Thread-Index: AQHXSTYnRctHD9Oqnk+1C3I7Co3BWA==
Date: Sat, 15 May 2021 02:58:17 +0000
Message-ID: <8a78b8b6-9daa-698f-7ff5-613682ff223e@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5fcdba8d-cac2-4658-8958-08d9174d4a74
x-ms-traffictypediagnostic: BYAPR12MB3640:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB36409E6DDCCAACABDE7EDDD1B62F9@BYAPR12MB3640.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:213;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ogD+DqjdKNUqp4Hf1jOLFVFTt4Dh9pwAaPVOVGc90ZS0u9IVthWTRyTLY9+OWlq1tAq+FWSMZCL13SYbXG4XitNOkOdgG4L0vE4xO1wPxD7tulITFCZ0hjTdUQdvzZuJ2utV9qDDOLJ1tUzsKr8lJvsDNTf7Yk//YKpwRRr/ykWRXxdUmckwv7FJzo5Y7g19Qhjoyj163oX4IhCsp6kp2/m+JGOGjIHugyL4GGZzny3s95IqwKrKHuKV5OqDkg0um73O+ZY4kAV9rp+L165IulnFFHhPz5ry/cdDGmuMk2Fj9oXWGoB0RwD8qF2nLbAAstR/sHdJSmfjlz2oGZVOs2WbyWnB29HdyWWZXEpKwJnndSzwvaMUIqv9+NCSDSbkdLBVzhzN5F64zJYGXvIF04CaAch8t6yj/bMz7lc1+6bXFcK2GWaw/aIBV5cUqk72b1bJspwJjS002GCpn9mJ8AjJd7ekR8NCzWj6bcBHI1eBlWtT27uLswmuqKh9oa45gcrO4Ad/tDsCy2bpTy6/Lbv+PdwTu4hLdZm5FKsr+8RWdvNTY2UtnCnZQeoPjas5o9XyZUTKO8YAzo8VX2V5zMCcVq+q0iYCH/CxjuBp4pg9yvMn9F3zUSInxt5VsyeE6ijeoiMETr2MPnzps420eIFtI1m1t70KAhPzVhUkx2ql37sZX7RVV6B92KPvHQ+6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(366004)(346002)(39860400002)(396003)(2616005)(5660300002)(6512007)(76116006)(8676002)(15650500001)(66946007)(36756003)(83380400001)(478600001)(64756008)(6486002)(71200400001)(66556008)(8936002)(66476007)(66446008)(86362001)(26005)(38100700002)(107886003)(6506007)(54906003)(6916009)(186003)(2906002)(316002)(122000001)(31686004)(4326008)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RXdLeC9MN1cybWVPVzhsUUxEaVJhQ0Y4cityRlVkcHBIVEVhWkFlOTNoNEsw?=
 =?utf-8?B?MDlHYVpNdHV3NWNDU3h5Q0MwREdYQytXdFdvTkdWanFxTkdhREZYTGFBRlMy?=
 =?utf-8?B?UzJIRXZGckxpdERZVmtLVUNSRzJkZy9WdXJOMDBuZHBlZFlmVTIwWURzVUp6?=
 =?utf-8?B?M2xVSHFTekNBVzhtKzNhOEFjb1Z4NU1EYnFMcHZHRDlqcndEMFo2VFVocUVR?=
 =?utf-8?B?cWFvOXk3N2VZbnlvd1JwdWRTZWlkWC93aWpkMmlYSzFVSy9sdkRIUXUxSlVn?=
 =?utf-8?B?bjM1aS81ekZMbGU0MW9SRHM1L1liNW9qYmsvQnFZTFFvdFU5VmozK201bmM0?=
 =?utf-8?B?QnhKK1J4S3dpVndyM1Z3RWhScEp5RkQxazcydXRFU2R5VmJwOHMvbGhqVkQx?=
 =?utf-8?B?a0RDM0FPUExWRXNzdGprZnlUTzJFaVNlR3o4clNTRDNLeWdBMFJmTmFYTWVR?=
 =?utf-8?B?WVN5aTk4OHhDdXZReVVSNWFEWEcwWXAzUThWSENUTlBPRFhuc3o2QjBkdHlT?=
 =?utf-8?B?REVCR2xGY3Q2UGpqZHJ2U1BzaFVKUi9ra2x0ZE1ydU1GYWs1YjYyVFM0Ujlx?=
 =?utf-8?B?ZEk2MExkUDd5SUNtMklxWFZ2MkxKZEI3Mjk4aEVGQ0VtYXFLNmNMN0tTaHRY?=
 =?utf-8?B?aTNPWWlLWnpLZ3JOTWRjZ21mR0JyQUc5bVd0QUxEZ1NLVHlJU2pYRGk3Y1Z1?=
 =?utf-8?B?NkFtNGJZOHNOUEJDa0s4TUxQdHpxKzVLUDFCcCtSTmRzVFpIa3c1dFdHVDhV?=
 =?utf-8?B?cWwrMmZWRUtYUlRuL3B6dm84WWNxWWlIbXptOWQ2c1NJeERYY096cUpnQjg3?=
 =?utf-8?B?dGlraE05VEVocTQvbjN1L2NTY0lGN2VDZE1hVFBuL25Xc2QrU3k1VDN0QTg5?=
 =?utf-8?B?N01VNS9SOGtDdDk1Y2JlN0paY3NTaHo5ckVLOTBzWXByRzhmM1BkZk1WUzFO?=
 =?utf-8?B?OGdYdzdGQnpSSWtpU0c3Ulhia1FCOUVnSVVobHJRMjZsNGZXY29OUzBRL3pC?=
 =?utf-8?B?MWFhYXhMam1uZzdGOEhvSy9hdGRpcm03aDNuUXE0OVIrUE9ja1B6ZnljUllB?=
 =?utf-8?B?aG1XSlpvcTNZa1JQaENoVjlJVENaUUZxQXUwZ0FPRGUySjJNTVpDTE5YQUhn?=
 =?utf-8?B?RC9jVDJ1NEJzZEQ5K211anprT3FZeXUvNFdMcUR5N1lMSjNCMXBndUdUMVFS?=
 =?utf-8?B?V3kvWmZyRVlQd0pCUEI1VVp6c21RQ2VRVGlFZWU0Q0ZZZ3RnNldUZmtsUGlS?=
 =?utf-8?B?NTJPemZGMTFVRzlyMFZ3OXZQOVJZMXRleVg2TXc1ejF0cFF5ZXA3R1k2WUVa?=
 =?utf-8?B?VjVaOStxeFFVVDV3d1R2L2ZpWVBqUGhCYlRqVjZTV0NUZjAxQ0U2dEovbUdK?=
 =?utf-8?B?c24yME0rYkVSYkNVdDdVRGpGd2FSQU40QStzYnVRMHhYREU4K2lwdXp4QXND?=
 =?utf-8?B?OW5GVUFrSWVuUDVXWE1HVFh1eEhHMzczUFBBejJ6cVhmVEhEcW1mc1BCUERV?=
 =?utf-8?B?dlQybEJvMGxGQnhWMm5MWjZha0t1VHVmM3AyeVh4VitWWnBNVTlEZlNpdkMw?=
 =?utf-8?B?SDNFNkJHd25QRzlUeTJ1L0d5Sk9FRFF3NkRYbVpsZHR2UGNsbGV2dDZyY0dt?=
 =?utf-8?B?Ykttd3ViRXlZWmxEVHVNNXV3bTc5a1JacVBjWGZjeVVzVGFkRDV6Qmhoc0Ir?=
 =?utf-8?B?VC95aWpZa0lYMC9TcXE3OG5pWFhxZGNDMERudWxMR2NiTzBRR3g3Y2Yrb1Fn?=
 =?utf-8?Q?XJ7xUUqgFvBPFVmeao=3D?=
Content-ID: <093AD1F849174646905275ECFB4E67A9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fcdba8d-cac2-4658-8958-08d9174d4a74
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2021 02:58:17.6788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M4pwD292C93J97eIVT54Z9pgTx3mDdBybh91ebsOpoTQMq6wXHma5Ag0zyeNd6eeIqVAIQBtKAR//K7lYtT4QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3640
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_195827_535747_43296F80 
X-CRM114-Status: GOOD (  13.53  )
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

Hi Linus,

A bunch of fixes for ARC for 5.13 cycle.
Please pull !

Thx,
-Vineet

----------------------->
The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ 
tags/arc-5.13-rc2

for you to fetch changes up to 1d5e4640e5df15252398c1b621f6bd432f2d7f17:

   ARC: mm: Use max_high_pfn as a HIGHMEM zone border (2021-05-10 
12:38:59 -0700)

----------------------------------------------------------------
ARC updates for 5.13-rc2

  - PAE fixes

  - syscall num check off-by-one bug

  - miscll fixes

----------------------------------------------------------------
Bhaskar Chowdhury (1):
       arc: Fix typos/spellos

Randy Dunlap (1):
       ARC: kgdb: add 'fallthrough' to prevent a warning

Vineet Gupta (1):
       ARC: entry: fix off-by-one error in syscall number validation

Vladimir Isaev (2):
       ARC: mm: PAE: use 40-bit physical page mask
       ARC: mm: Use max_high_pfn as a HIGHMEM zone border

  arch/arc/Makefile                |  2 +-
  arch/arc/include/asm/cmpxchg.h   |  4 ++--
  arch/arc/include/asm/page.h      | 12 ++++++++++++
  arch/arc/include/asm/pgtable.h   | 12 +++---------
  arch/arc/include/uapi/asm/page.h |  1 -
  arch/arc/kernel/entry.S          |  4 ++--
  arch/arc/kernel/kgdb.c           |  1 +
  arch/arc/kernel/process.c        |  8 ++++----
  arch/arc/kernel/signal.c         |  4 ++--
  arch/arc/mm/init.c               | 11 ++++++++++-
  arch/arc/mm/ioremap.c            |  5 +++--
  arch/arc/mm/tlb.c                |  2 +-
  12 files changed, 41 insertions(+), 25 deletions(-)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
