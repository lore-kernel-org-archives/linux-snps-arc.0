Return-Path: <SRS0=tXg0=K5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54635C47082
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Jun 2021 19:14:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF781613E4
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Jun 2021 19:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF781613E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N5ogncxvCukTG7xBeKbdSgJldhGX14/mbLz/+98vdfc=; b=HlAUDvXuLS+IG8RfoxDj6kcVJD
	vpJgfNYwss2OoIAcuDMCKlj9pjKScfCE2GCmyOC5uPRslxnBnAIiKHFAX+LhA6fP1WoovLFe1a4oS
	HGF3qkmFpUdyLcgczGQJVrz9L4abSbophgB+sW4v0KjFa9Xgpn4WnsVDyJZ5b8z//z8AvOZX3YFWJ
	yLpOP3lAUzW4qT9J35QoOMEhkNziVOVabAFJg3vca3hkkY8evDpbIRjVu7QP4nvf05wEqYL7L61ev
	Ni7mKcBGQEymkWthazk0H2yzrmeer2H6klimZqGpay02xKJWoH4JDEKK5xTsbhONoDxuUSV+g/Gin
	4DLL+tKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1losnY-00AJ0u-BK; Thu, 03 Jun 2021 19:14:32 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1losnV-00AJ0R-Sc
 for linux-snps-arc@lists.infradead.org; Thu, 03 Jun 2021 19:14:31 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9BD6E406E3;
 Thu,  3 Jun 2021 19:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622747669; bh=O243dUOkYpI9YxzbJGX13XYbIpnJiYrBy9G/qAsBkfY=;
 h=From:To:CC:Subject:Date:From;
 b=M9yO9RKpBmac0S90TKQDULrwkW9egDmC8AWPfTtJzIVTX66mTCPZWPwwotAeQwsZ0
 x9PyB73b7a8E6H2UcSeduz90Wga9ckWweJhN7r8szouvZKvEJLs2pgagslh4k2uoU+
 RvUxauVEGYBxlSFn2QxrRrHl5+lvc0llS0BWf2f4hUuNmnFC/90Fo+ChF2kYCr4RgQ
 nj+G2AaPKITwItLr3zCSDHe00yNYaxyIoBOYy8b2j1qs6Hy94FRg3uiGAhvgvJF1AS
 dSgCVHqBMaFobUon56bFC2s992TfEUl7yvhWkMlplABHMEaknL5OrW8q358PP10lZ3
 3xrciPUb14dag==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id A92ABA0070;
 Thu,  3 Jun 2021 19:14:27 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7D741400CC;
 Thu,  3 Jun 2021 19:14:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="O9lpeN4l";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USz53vq1DQ94gbhoLTmQsJBBLflv5IefYWFzwQtm02f3dJw3We6QAnrX/8V9s2tA06S306EFtK90ESN4wNXVj2TR+BOe5ZC2HuTC7xAKQ6JXLWut6KQtfXfcmSrkMvX9cGt9IQoS/fF4rx77a/qTO811C8PdmmNcOmnfTs8HxTVAZOe3EE6HLPt3TMW6poDnGmWe8gmWZeJihKt9VtKS9GSpyUf7H/tdy68UgAIXOTefhV+MIKzD77tGlkMrjfWYtXPSe3k7XLipobDBSB8pnXUeMtqDuB8hbK5z2l5bH72e5GUymol7kei6HH+heWFFr5ds4yC1WroSmxAF+R+/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGXyn0Pd4jKn0YSH6euVsPFbxWuMO2ZZaR/QqR5lIwY=;
 b=FxlAcUxQ4dws8WLOFniDNTzCu0wYEX6f+yAIfjBqru8aRzCmeVDGZEVWJg4mMoBAkbKFmTxHcxv//+P6vRAn7SeeDjAGgBbvuvSSv9q7SbxXbkAYZB9b0XCtlcdLgQUJK2pJNrBOc2ZhQ0G/qAY9GILvK0myssEuylhJWHiN9f95WY5iOTjWPklcY6MhdF4FROE9M6P8UbNRjxbv02+IEuKMBP1ClQypS1TDl3M0WNBoyoKMPLWSvwXkm188gw482ft3G5PtZzWg6nVe1i467YTXVd94zfAZag8ehlOXo9kxLiqdF0cEhBA8Xz+jKghGCNEeD5C5qjDAOJIpXE5PjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGXyn0Pd4jKn0YSH6euVsPFbxWuMO2ZZaR/QqR5lIwY=;
 b=O9lpeN4l7HoRDVvk9BOBgT7kIAinDorSZveUUJ6qPWEGhdtUKOK3MW4tqb0wTLMdJFgSeHqO1BrMqN91y0thbi1++ykGVY9FrmPNBx8eI5eH7vN5oWitSyNUmZ3I3/tUJLau61vBka/QuXXfxbUa62kG3xMrF/GXCphu0Ul1v/Y=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4050.namprd12.prod.outlook.com (2603:10b6:a03:207::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 3 Jun
 2021 19:14:24 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4173.033; Thu, 3 Jun 2021
 19:14:24 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "submit@bugs.debian.org" <submit@bugs.debian.org>
CC: arcml <linux-snps-arc@lists.infradead.org>, Helmut Grohne
 <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>
Subject: Debian: openssl: Add ARC target
Thread-Topic: Debian: openssl: Add ARC target
Thread-Index: AQHXWKypifsHD+IFxUi/wh5gnb9kyA==
Date: Thu, 3 Jun 2021 19:14:24 +0000
Message-ID: <a04109c1-e502-b979-d342-5c28ed558863@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: bugs.debian.org; dkim=none (message not signed)
 header.d=none;bugs.debian.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 885fda51-9823-4a65-7295-08d926c3ccc0
x-ms-traffictypediagnostic: BY5PR12MB4050:
x-microsoft-antispam-prvs: <BY5PR12MB4050894C9DDE06DBC99DAE86B63C9@BY5PR12MB4050.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UKGimBT0dqK6mxtoAQyOQdmdyvtT8s0M1W2Xwr+3iolcMLDRVma6VCPpfOnYRoI2DJBE8rvidPc28khkVdgqDoR2JxXGN1AJWeGD+sB2Ltgj7zidEBVadfbOfo9GRX1NX9wv0Sh/OxRdC4c8ndMJJgHcenwFwImldZC3wouLPhUS7T0t7MRNo8w3jftds/xRJPhwE3TqPXpCX8GWu6qyY7et6ltgcx4q3foXJUblX+b4QfVv0XZCn3q989MX7QR2V9rvYQhvl+Zn7Ut9JifeoWotvHT0GToDGKbKAThakTsgnVz5iyQpVPgLyfmkhY6hDdo2Vy1zC7gFPDR2pm4WqngrDBMeKGnRv5kf0dmTGugNLVUAxxvBmiWo/w+vBj2iecry4WNCDs9UNZNjjaN9at3WgdSfvs2vGBEVShckLvlll4LQ38zGJ01u9nL1lVSHa5VV0kp8Ugc/lCC7fSAxqfbT6SffC4eKHWHZHTlKt8cge/+gKW5TMHQ+6tJwDIcpI5uI37HFDh8jN7LpfZN4lF2Y1KWHwlwsZ/qSDexNsjCSw0XG14TOpEDlSMuF6DaaUOBG06hVt1vH5x2xVZIwo64ndoWSrXIfLm0MIxlVlddOAnOWfzUHJfAtmOWohxn7hCmDSfORtSUa4+kcgWDVQMyy6tMNglJIjFoVGccQ8/1ebDx4FfG7HlOkba7F8+8F
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(396003)(39850400004)(346002)(136003)(8676002)(54906003)(4326008)(5660300002)(8936002)(71200400001)(558084003)(99936003)(478600001)(316002)(6506007)(2616005)(66616009)(66946007)(76116006)(26005)(64756008)(66476007)(66446008)(66556008)(2906002)(31686004)(6916009)(122000001)(38100700002)(31696002)(36756003)(6512007)(86362001)(6486002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ODBHdnc4a1Z1WTFjaEg5dXQxWlVrWUNiY2FEOHY5S3V4N29DYnl6aXpodXJW?=
 =?utf-8?B?V1NpNEVoTlFCU1R0aWFlL21NeVJTS0Y3YTRNMnVlSXYxNWlHaHl3QnQyY2d0?=
 =?utf-8?B?K1FhRTc0d0NzczlkUTYvdklSMlNZY05EZE9kM083SlVkNmU2S3Mvd0lrd3B1?=
 =?utf-8?B?MW9Id01jeXZ0U29ieGt0T3h4K05nanl1UmtyN2QxZ0RPZTQyN1NNN0kwN1Jh?=
 =?utf-8?B?emdMczcrekl4Y0h3T0FET0VxZ204dTBMYnRLUE92c0RrOHpRTjdCdnpYWTJS?=
 =?utf-8?B?Ujk1WFl4QVJOSzdUWnhLa0tVQk1aNGZFb0ZsYjA2Y0M5cEdVNmFBdThaMFpq?=
 =?utf-8?B?by9QSDZ3a2EvaEZ5V1dUWG5PQkxKN2FrM21HNDF4UExobGVWWVNBMS9QVXdC?=
 =?utf-8?B?WUh0SXN4aFZ6SkpZaGJ5Kzh5Vnp4MlhEOTA0MWgvSy9BZFZLY0FWRHNHdHlQ?=
 =?utf-8?B?cUZyNmYweWltWUNSSVFjN05WZDlMWWhYZnpORDhxRGtLWmRHT0Rtbm1hbm1J?=
 =?utf-8?B?cjlHYVBOYjZqZW9MakMxMGF3Um0xaVVMb1N5RkN5b29VdnErdWF3MVVoa1pT?=
 =?utf-8?B?WWdITndpWW1wa1Q2MTQ0QU80QjB0YjZhTENmNUptVS9yNmcvUjdjeG50MkdC?=
 =?utf-8?B?dVBhdnZEaUxNZVNEUUY0WGJwMXFKbnNFUXUxNWpzek9EclBRWnB3bkh5WFpH?=
 =?utf-8?B?YXVXeks2MTg1MFA2cmFQajdVb2Y2K2FMTmZFMmR6M0NxT3RoTERPMEhqOGhT?=
 =?utf-8?B?SHJKcm5iUU5QM3Znb0J0SWhFdS9EcVQzQldCN2xWcm5walVlanJ2dVBJaEFM?=
 =?utf-8?B?c1RUU3BuUXNCc2JCYnYwbzdxSWNyTWEwM25YN1E2UEI1ejM4bmp6emp5ZG5t?=
 =?utf-8?B?STU4NE1rajZPa2ZlWkpoVW9sQ2NhUnlnbUptb2d6MkdqbFIwZEppSFprTGhD?=
 =?utf-8?B?bHVoZVl0ZzZUWE9xb1RKbGJwem5VMThmYzFZdmh2Zlptd0FOQ3hFNG90amRN?=
 =?utf-8?B?ZjhvTU1vdGcvRnMvR3FZd1ltejZvZ1NLeWNpYXJGTXFPdkV2L2Z2N0xJUVR2?=
 =?utf-8?B?cTV6ZVhFV3NhZk5YNVRFU2xiUGFBSGdURFd1aVY2N0MvbmdhK0tROEhZbUEx?=
 =?utf-8?B?RDduRzlYa0ZqaVBtQm1RaWlmbmFPaFlMM0F5amdvYi9OV1ZENVVCUklXTmpt?=
 =?utf-8?B?TWh3bTFBK2F0ek5WNXdIcnRyNmFDTHBpczg0bkZUTmFLVDhON0V1YVg5WWQz?=
 =?utf-8?B?WXBvSGJvL3J3a0owWGV4M2lYZUxOYVJYY3o1RFUwZ0d1L092QmFZM0lVVUp2?=
 =?utf-8?B?YmFzSUpqZDB5WkNiL0JRMHpWZEV5Sk5icXUyd1hrUGd1VFRBS1J0Y0c1RWNZ?=
 =?utf-8?B?c056dTZsZDY1NncvalJWZ3dZQlJpREd5QjU0bndVZTV0TDBYQitBT2YwWFpU?=
 =?utf-8?B?VzY0a3d4QUg5bjcvbDBQKzZaVG9SYTY2WkVIdkJIZ3A0bzJmc3h1NFNsUDFU?=
 =?utf-8?B?VmxFemk0bVlhZUpyOGVEdEdiSFVYWTBaUGVCTW1qdE4zVXpBSFBuYzBFNFFU?=
 =?utf-8?B?R0pQaGFpRFhlSEU2V1dpdkNSM2xEcm9BdmJrZEtlKzhRN0ttQjZBKzZaT2E5?=
 =?utf-8?B?ZS9JamM0d0FVT0xBZ1l0bjdrYXVzT0dTSWp1TWErSzZYOGxaMlY3QUp6MURs?=
 =?utf-8?B?WUg2dTlyTGxPZW1kY3Q4cHNDa3VKZVQ5Q0pFNGtwQnhBNHZaakxwWVhtdFdu?=
 =?utf-8?Q?VVyg7yBxEVnyRlIN6I=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_002_a04109c1e502b979d3425c28ed558863synopsyscom_"
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 885fda51-9823-4a65-7295-08d926c3ccc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 19:14:24.3449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PAfMECeokBxw48jRP85LK9QjGW3lltQwTMCKyveTkY7ANEdxK3LyNuKKxh/rA6Oulh1yJTzGM5dskF5EYxglhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_121429_980682_AE64A58F 
X-CRM114-Status: GOOD (  17.14  )
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
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--_002_a04109c1e502b979d3425c28ed558863synopsyscom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <0998F54046ABE74591C45FD2AB84DF53@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

U291cmNlOiBvcGVuc3NsDQpTZXZlcml0eTogbm9ybWFsDQpUYWdzOiBwYXRjaA0KDQpIaSwNCg0K
VGhpcyBpcyBuZWVkZWQgdG8gYm9vdHN0cmFwIGFyYyBwb3J0Lg0KUGF0Y2ggYXR0YWNoZWQuDQoN
ClRoeCwNCi1WaW5lZXQNCg==

--_002_a04109c1e502b979d3425c28ed558863synopsyscom_
Content-Type: text/x-patch; name="0001-ARC-arc-target.patch"
Content-Description: 0001-ARC-arc-target.patch
Content-Disposition: attachment; filename="0001-ARC-arc-target.patch";
	size=1371; creation-date="Thu, 03 Jun 2021 19:14:23 GMT";
	modification-date="Thu, 03 Jun 2021 19:14:23 GMT"
Content-ID: <24F6FDFD0D0B9D4A93598F6BF7FA4986@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSAzMjY4ZjE4ZDc5N2ZiODA3YTkxYTcxMjY2MjQzZTM3NzQ5NzExYjgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogVmluZWV0IEd1cHRhIDx2Z3VwdGFAc3lub3BzeXMuY29tPg0K
RGF0ZTogVGh1LCAzIEp1biAyMDIxIDEyOjEyOjQ2IC0wNzAwDQpTdWJqZWN0OiBbUEFUQ0hdIEFS
QyBhcmMgdGFyZ2V0DQoNClNpZ25lZC1vZmYtYnk6IFZpbmVldCBHdXB0YSA8dmd1cHRhQHN5bm9w
c3lzLmNvbT4NCi0tLQ0KIGRlYmlhbi9wYXRjaGVzL2RlYmlhbi10YXJnZXRzLWFyYy5wYXRjaCB8
IDEyICsrKysrKysrKysrKw0KIGRlYmlhbi9wYXRjaGVzL3NlcmllcyAgICAgICAgICAgICAgICAg
ICB8ICAxICsNCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZGViaWFuL3BhdGNoZXMvZGViaWFuLXRhcmdldHMtYXJjLnBhdGNoDQoNCmRpZmYg
LS1naXQgYS9kZWJpYW4vcGF0Y2hlcy9kZWJpYW4tdGFyZ2V0cy1hcmMucGF0Y2ggYi9kZWJpYW4v
cGF0Y2hlcy9kZWJpYW4tdGFyZ2V0cy1hcmMucGF0Y2gNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQpp
bmRleCAwMDAwMDAwMDAwMDAuLjY2YmU2YWZlY2U4MA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvZGVi
aWFuL3BhdGNoZXMvZGViaWFuLXRhcmdldHMtYXJjLnBhdGNoDQpAQCAtMCwwICsxLDEyIEBADQor
LS0tIGEvQ29uZmlndXJhdGlvbnMvMjAtZGViaWFuLmNvbmYNCisrKysgYi9Db25maWd1cmF0aW9u
cy8yMC1kZWJpYW4uY29uZg0KK0BAIC0xMyw2ICsxMyw5IEBAIG15ICV0YXJnZXRzID0gKA0KKyAJ
CWluaGVyaXRfZnJvbSA9PiBbICJkZWJpYW4tYWxwaGEiIF0sDQorIAkJY2ZsYWdzID0+IGFkZCgi
LW1jcHU9ZXY1IiksDQorIAl9LA0KKysJImRlYmlhbi1hcmMiID0+IHsNCisrCQlpbmhlcml0X2Zy
b20gPT4gWyAibGludXgtZ2VuZXJpYzMyIiwgImRlYmlhbiIgXSwNCisrCX0sDQorIAkiZGViaWFu
LWFybTY0IiA9PiB7DQorIAkJaW5oZXJpdF9mcm9tID0+IFsgImxpbnV4LWFhcmNoNjQiLCAiZGVi
aWFuIiBdLA0KKyAJfSwNCmRpZmYgLS1naXQgYS9kZWJpYW4vcGF0Y2hlcy9zZXJpZXMgYi9kZWJp
YW4vcGF0Y2hlcy9zZXJpZXMNCmluZGV4IDU0MDAxYzBkN2YyMi4uZWJjNzBiYzcxMDFhIDEwMDY0
NA0KLS0tIGEvZGViaWFuL3BhdGNoZXMvc2VyaWVzDQorKysgYi9kZWJpYW4vcGF0Y2hlcy9zZXJp
ZXMNCkBAIC00LDMgKzQsNCBAQCBuby1zeW1ib2xpYy5wYXRjaA0KIHBpYy5wYXRjaA0KIGNfcmVo
YXNoLWNvbXBhdC5wYXRjaA0KIFNldC1zeXN0ZW13aWRlLWRlZmF1bHQtc2V0dGluZ3MtZm9yLWxp
YnNzbC11c2Vycy5wYXRjaA0KK2RlYmlhbi10YXJnZXRzLWFyYy5wYXRjaA0KLS0gDQoyLjI1LjEN
Cg0K

--_002_a04109c1e502b979d3425c28ed558863synopsyscom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--_002_a04109c1e502b979d3425c28ed558863synopsyscom_--

