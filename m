Return-Path: <SRS0=tXg0=K5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17779C47082
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Jun 2021 20:29:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8AD6613D7
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Jun 2021 20:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8AD6613D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WssD1UM+nZ1uaprvbDjqh38bjO0rGTm7kgy+GMa3Gj0=; b=ALRzG2e2H2EXIc
	FseUp4pIxh2pOyg8LHkvkUIUuH5lVEsUd1tCFGZZMilnkKsTXf0blD6Nh9k7zgTPXJrxEL5Wmtppa
	h34l9JGUVrWylAdHe0tJPGWgcudq8pF16iwTuJTQB7+RIFVQiiScBF6SB4Ma9mN9SNmyjyz2RfqdL
	n58Y5zJWCELXiuzpL/Ce8flqjqKDOsrdxva78cF6YewwSAhcmsgmfauud6FxV0tpMptw25STiCzxd
	c+wPh6s5F6BdKhkaLJ6tF0XhO7/9K3R1e5tKrZ1+ReFZOuuTNAgcP5eQiEmCDuIAm5SXbu3zfbD72
	kNVeAHl/qzuUed7wCAtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lotyM-00AVMG-AX; Thu, 03 Jun 2021 20:29:46 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lotyG-00AVLA-2S
 for linux-snps-arc@lists.infradead.org; Thu, 03 Jun 2021 20:29:41 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 88CB9406B4;
 Thu,  3 Jun 2021 20:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622752179; bh=odf/XhCb5lBf3bFd2ru+LnNxlLgtKoLRXC2FXCmokXw=;
 h=From:To:CC:Subject:Date:From;
 b=kPWNObBhQ4MUfUuh7pgDpIRqaOlNll/cp5NQCgLltX6deSTmeoztEokB6/JJHBx05
 isiV2sYZFttmwKWvEpUZGWrTCua45Uwcq6sxB0ctYonCl5jSG5/Eqn6ERJvGTfMWi8
 JjTXqB86qTQBQEWKY5EEwwIPay6+eFnrjIPYNq25fGhiOevOhvO5D1Cmj3PU3RhvSk
 mHOgbj3m/E//rYKygDhQbnMuSwz3d5yp34xJPll6Jds9PEIi4jk9QCTVYZplqW0Jna
 8zIEyHwW+XjbkCOhtrG5JHpofdQ0BKP5yurp5Sk2pqQTWZlNNCReEASXuyH87ipoGw
 +l92RO033pYVw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6AA99A0076;
 Thu,  3 Jun 2021 20:29:38 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 902268000C;
 Thu,  3 Jun 2021 20:29:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="GYTtjrB5";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNR6KWJeOlM5oF+8tiCYul1Is505ThTas8mekjEPrgVx/GrIfc03ep+18wAVvYodYDEtMeVDVS+f1x/+tECzR5DLdG9ELJa2noYkEgwTqTv2xkRH9EiPJT/YR4Dp2v935e4WCg+V5YEAJmP2niqdzTxJ3CD7X8xL3FCdH1CzatWGQBnjtFoOwwQGGRX5mKQpAwxoVukdWYmduPZy0yV5QcSpeO0JDT8AQ0JEq7wD36jI8aSdZAF680iscnLeJkt+XKjdOzeuhz0/wUNtFSDErJPGMu42h4E5NvUhfznZhjJ47G4kdrDB5k5r96AHZyO8tJ/PquotPm3JbeaoL6Qeig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odf/XhCb5lBf3bFd2ru+LnNxlLgtKoLRXC2FXCmokXw=;
 b=cdLDyGciqjAcWAEsyeesPiCXUQg2hAQTuYgcyl1+QiNFxauaCEgmY0KG2yp9Y69nSXBJWHieBDCrAzPA7FPLdpZ3kCTS5fXBj9/FBk7Cg/PE9/SrBJh0puxm6xwU2XPnE4BTA0PGQvP3WNo8wcZfUu0vYbMJ0G31CcwkeoNxoW9+JloP0M033LucDkPHxxDhyz/pR40A3BmGL4/WueCgecBl2vdnpNws9fv9zIMtDbAU3xr7s+/xMZuapmgk5kFbwMIBbXg/3RceEN6GM+00Zj2Jtc31oDT+YXuC0jnFXv9eS5oA5gm5LZs4SEv0CcBenNhjbLIoICY7XRIXbdBibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odf/XhCb5lBf3bFd2ru+LnNxlLgtKoLRXC2FXCmokXw=;
 b=GYTtjrB53UXLDBGKAmuxPgGy3cmTT/q5+dJgkyEqbJIqJVZ4LbMj1XBUDh904ggxGoxbicftS6Z1UniPZbxhX67/k6reOOuhRonZHr/V827jQhxHqY+Yt8fLDdB28plLLCW14TtLHao1qy+2nE1uusYB9L+n+Sx6Qq1Ty14tVgE=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4211.namprd12.prod.outlook.com (2603:10b6:a03:20f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 3 Jun
 2021 20:29:33 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4173.033; Thu, 3 Jun 2021
 20:29:33 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "submit@bugs.debian.org" <submit@bugs.debian.org>
CC: arcml <linux-snps-arc@lists.infradead.org>, Helmut Grohne
 <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>
Subject: Debian: jemalloc: add arc support
Thread-Topic: Debian: jemalloc: add arc support
Thread-Index: AQHXWLcpUDW43PaiIkO36r3ROaQQXg==
Date: Thu, 3 Jun 2021 20:29:33 +0000
Message-ID: <9b92e66b-920c-51d3-c3c0-c8010905dda6@synopsys.com>
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
x-ms-office365-filtering-correlation-id: c546f002-7cc2-452c-f596-08d926ce4c41
x-ms-traffictypediagnostic: BY5PR12MB4211:
x-microsoft-antispam-prvs: <BY5PR12MB4211175C6D3757E0256512D9B63C9@BY5PR12MB4211.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +9RW4GN6e4kX9M5uAXyUHlvAiYgQXd3tqYfUDkRSaVXlfawf1wqYJa42H3wh1eb2IjHBbv+LqspmZXM3dHi4W6hn+sRagsrpc/HetcmxZJQZJF7XmZhKBDAXtR6UJ3Z1vQ+VyDZPM5ZBLASC3n6Ny9TUQwXY1MNAfcIEfk5FBCIHHtbIEHkwlFzU7dyAKTHMaHSvdSXkHIFc6WBLsxK6deJRPepEn334kb1WcZ1mugGJW5vKZE3X7P0v9blLyHXX9MHzzJscY354d7fJGRChqEqGdDfHlV6fy7GPiNNjtkpWT5dpIcPwHCmvCL5RvzGAR/V/GeJ+fCk25wJqI0PxTB+GeI/qORoW/4UiapKBPg67fK6VoW5aWhEU838Q5xnQdj2DmHIYNVZ/YBL0SWrL7qWnAtB391Hr27YDlrS/6bQra8DIAVCwhA7JbiYAV29vQDxAIBhW7NqIaSaPU+zdaA9a/pLuIgSKgOEorzZzz46mo3eWDm777cu8ptdtn7PO7ya8iDtR4U9GN63vNCWup/ftrnBf0a9WNdZhUzlDGcYrmMT1BCtkZDccI/bwQYcLI3f7Q5w4lTZXTvLxy10dcDtZo7GgB6JMbVT2T3WKX1P+LTsJpWqWki3GUYKLvYgRmeG96dXpaiANOzfIJW1vwDw3Nsz7la4MU039tWjRxEOjHNvfa9bQawcGz9gv/5CDSAwSWPLY99WHod+qezU/1/88Uk+cfLvo4qtvJIUNF+ne0xHLeJ490mwtKxzGQVBsaLvkKrFkk8kgIQBnYRWYHwRPAsuS2RI3AgGhqPVCegu3SarC6b1zz7Ak8DL+MXcDnm6BI1T4F2dQyte6/mE/dV3LTsJv57ENhXLtuq3TK0w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(346002)(39850400004)(136003)(316002)(4326008)(5660300002)(6506007)(36756003)(6916009)(31696002)(2616005)(558084003)(8676002)(8936002)(76116006)(66946007)(66446008)(66556008)(66476007)(64756008)(478600001)(966005)(186003)(31686004)(2906002)(122000001)(38100700002)(6512007)(6486002)(26005)(71200400001)(83380400001)(86362001)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RzdQUmgyaTFldEgvK25ORGhCSDhsdENLaGtQai9yejMydzBHV2xJOTRWVHls?=
 =?utf-8?B?emJMR2Frd2lUOTN2N1U5RW1wT2prMEVuYU96elpJbGhjKzBSY21pZE9XZDR1?=
 =?utf-8?B?THUrZG9iZnFzemtjdytpbnQ0cFFaTVRRdlkyVW1CMjdBaTlIRmo2dUVIWW1r?=
 =?utf-8?B?YTVoUEcvdHRNbXl6T1FaRWhmUXRiUTVnSThrajUvLzZCMDRtT2xJSlJUbVRu?=
 =?utf-8?B?cVM0MCtvMjVrVU8wZSswZjgwYmdEcDRrdkYzd1IzYzllbUhWbmIrRGp6dTYx?=
 =?utf-8?B?WmhRdU1rNnZseW8za1ZmR1Q0SStidFFQdXo4dUwwdzBORDJib0xXUzl6K2lJ?=
 =?utf-8?B?dFlKc0F3NWhncW1RUlRYRTUycUxmNzNvL2dUYnRDRHhHUUorM3paVW90N01N?=
 =?utf-8?B?TjYrdmhaTXNsMlZxdis2YjRaK3p1R0pFOXd4amVSYlV4c2hTb00rYkQvaEtH?=
 =?utf-8?B?N3VqTjU4UnV1QnNvWXJsdkV1V3lVYjlkc3AxL3VrR1R1NXRYNXdycTN5N3Nm?=
 =?utf-8?B?am1kaTZMZnN3QWRONHJVWHVjbmJzYU9kSGh0d1NRVk9YcDdXdGFZdnVnK0Y4?=
 =?utf-8?B?Z0l5M0t4V1pLYmVyUXZMRkg0WXFybkFoNWlhUlROZ0dCQnAvMkkzSUNyeTFB?=
 =?utf-8?B?cENzeGJZMGRqTnRWbFlBR1dMYXpVVmh0eDhpazY5M1Z4WVlhd1JVZTZtYmlN?=
 =?utf-8?B?OFd5TWEzT0ZINmNzWkhsSWxkWkMzdG5xYm5lWStIWjZyOXV1bVNBYnRYbE4z?=
 =?utf-8?B?YUlodHpKTXd6SnNNamZxZUZlQmk0aVBLdXc2eXUrWHJQL1N0d1R0OGdrcnhI?=
 =?utf-8?B?cFZQcHh2bHVuc3d4Y0d3ZUdmOFlhdTczRGIyRW9NbjVOaExFVWtUTkM0VHNS?=
 =?utf-8?B?SFpESDY3V09NZENaMUtxMGxXZ21wWlFlV0EzdUpMMjI1MmtCM2tTSmJiTndM?=
 =?utf-8?B?ZG9KNVBIVGdhRDBiMGZ6cHh3Q2ZCaVJ4aEVMVnYyTVJtdUR4ZG9KL0hxZHpR?=
 =?utf-8?B?OVV5YVAybytXMkcvVnJRRXJybnJNVWdGVU1icm1zMEE0U2RrYmRQZ2N2dGd2?=
 =?utf-8?B?cEgya0hWdEM0VEc2d3pUZVc5ckpzV2ZZMlRVYzdFaWRMZm9CTXkrU1UvSy83?=
 =?utf-8?B?T29OVXR1YURYN3l4ekxRc0tLazg3RmtnbWFRL0VsendLYk40dXdSYmh0b1Fo?=
 =?utf-8?B?VjJnYU5zalRCSDc5cFRCUVZSbDlTUHp0WElwOVAxdEg3RHEvMVRtSnhMNzFa?=
 =?utf-8?B?YTJlQ2QySUkzdUorejV6dUtjT1NMd1loN0N6aVBoZ20wOEQ2Skdld1RDaHVp?=
 =?utf-8?B?U1JKbnZGdzVXZHE2VWttd0JySjh0am5RSWFjYkxYTnEwVjhObEtzMTFqNDBx?=
 =?utf-8?B?MEZIcGdKR3l6R1MxYTNtYUtaamI2d3ppVHV1UXZRSGEyS3hhOWc0RGFNZ283?=
 =?utf-8?B?SkhnWTRWdzBMb1poWThJcm9HelVocE9rZE1ITkdXVXYydTR6N1c3bGFSdWky?=
 =?utf-8?B?L1l1RTM3UDFwRzlINkR1cGZEdTdsV09memwzdmdRQ28xNWQ4bTg2dndsTXdN?=
 =?utf-8?B?ZXQ4T2tIK1RQZUt1RnlraTFGSXhEalpoQVREZ1p1ZWduNnBveGxHdm5WWTNX?=
 =?utf-8?B?cXZFWW5JcHFSS2lQOFc4Qjc3L1Z2QVVGUFVEeUt1WHBxNnNrOXlHNzJrbFAv?=
 =?utf-8?B?YUo5OVlyM2tpY25PTFg3VWFlSXdNMmljeXJjTzRDMHN5Rmp2emY1aS9ESnAv?=
 =?utf-8?Q?1DciR4axqkWhF4XKqQ=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <95CAF8A864099B41B1A879BC09E2A3CB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c546f002-7cc2-452c-f596-08d926ce4c41
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 20:29:33.2866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vvg3Ej1GzBUS3ehTHv6I/QvlRUxviWylGnXY9aUCKrB+ktKTLDt+a7ueh75j5rlQusSRyptDcMX/CArGLFJEPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_132940_152295_CB7683A9 
X-CRM114-Status: UNSURE (   7.79  )
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

Source: jemalloc
Severity: normal
Tags: patch

Hi,

This is needed to bootstrap arc port.

Merge request exist in upstream jemalloc:
https://github.com/jemalloc/jemalloc/pull/2070

And also in debian
https://salsa.debian.org/debian/jemalloc/-/merge_requests/5

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
