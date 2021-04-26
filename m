Return-Path: <SRS0=GR/N=JX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EACC433ED
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Apr 2021 16:30:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A484611CE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Apr 2021 16:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A484611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6UrDZWyp6E0qRIG2TH4CxUZlG8cpfRPhXhnUL0hYUoc=; b=Z7RU7MhVauGbRj3tYz7Dc2n7R
	WLucmprrAP/GS6XxiEQ/JR3XRD3ao1/2d+S9/74RO63dAPOXmFpbnT0GZtebw5x5KWgc9NLuDKoXb
	hiE7yfk2IotI6DIJaoj/6lVUJvbFX+uL+Jcx93YM2qfAZuUEFh027hI14JjeEu0pAwrSnvCcGT+Xj
	B/u/5qttQvGy2s8OMHh8f0bH0q9SRuQm7UeM3oWFiDWezfHpCfiilyF1YV44wylZui5zQpl6K3Bvk
	UX4NwdFbbaj3Hnryj7sgVNT08w9d1odgWYu+2+JQyp5Kzb2CQ24PBCMiXNqYmwx2+VwyuAMe73Cow
	7DD82NDeQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb47Z-0085PP-Ky; Mon, 26 Apr 2021 16:30:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb47U-0085Oh-Kd
 for linux-snps-arc@desiato.infradead.org; Mon, 26 Apr 2021 16:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Description;
 bh=gtGHIibvEtBL1PbPk/kfrCYVDSCQ1ER3fZuVsPvVZ3I=; b=4PzWratqRBtIZ5pQwgkdBIcczl
 d1ytZZjAbvLt3ozM61Nf/2t+4EDci9gCty1RI+nrqWWZpU/SBL/NipZadNy6DN/Yg1UE15uWzwtFo
 FSLiJRK5IrG1u8Glw9hvyr1RxsUerNq56J7+8kJKeCywCeiizWdVrSfetTi2BX+es7nFrFzSp42y/
 9Jp0JVCSyqH6HtI5qhwEXMH526R46Y+AYBsT71hMHtIY7PF+j3fhQBq9m+PyNahIa0KSZ5NhL15SH
 Qdn0QhY+fzZsHj160vorgn+w+h3Up7YnFCnKK8qpRsJAvnU0VNErpm6dhLy/w/j7ryAe9l8OS7G3o
 pqCMfT8w==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb47R-00G5fk-Ia
 for linux-snps-arc@lists.infradead.org; Mon, 26 Apr 2021 16:29:59 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 922A140775;
 Mon, 26 Apr 2021 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1619454594; bh=gtGHIibvEtBL1PbPk/kfrCYVDSCQ1ER3fZuVsPvVZ3I=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=TTRauFG1Ymw2iVEiTS0M3cvj3wrW1Gm2nYrcFevF8V81clp8asG9OFlcwhcNwtOFH
 4JaTpsCNyJqXi8OGhF8Y2cHeKLkD+Xvb5dIEMOlElKe4ISJmBFwVI5qO/nYZvmGhJG
 U5LxATP/15gbQp3ORelyeY6lsi1y2Zpush/QSOik034A7vXyDrP2qTFtZj5Kf9rbg9
 h9GVOfaaucz9GLf0s26imC2fImAZt4JA+0dvsDvy+RL+aorUfvQuZXcs4sGUxEqnX8
 +CNpyqJGs2nwJlSA7vUBZF+IOZebivXedTIgDlZ3JTEQQcX8n6iDERoA+VbsHe1lDd
 VLtZDbvKw5uJA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 84D70A006A;
 Mon, 26 Apr 2021 16:29:52 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 866ED800BE;
 Mon, 26 Apr 2021 16:29:51 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="FFurdxKv";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGnY0HM8xmhNr7jv/G8xEkjXkQ2ptoELgd0YR6p3SjLW46OuRfQFw1Gs6ml8hMUkX27+1kqA2MHkkYAV6ZwGpRDGtzS+k6kiRhoz5TJ1eTUyF8tUuIPpzpDi+8gs+c0BzSlBBlMWHAF+OXcSh9Lb7tAIq/cGieDUYFgaX7c9H2HTwPO6CH6HumpeGGKdgkB5vgarDxUpcIeJxOmd6TvKOjAz86emW5jFEIcqewBPdxXzd0krJ7L3uMfUJwLHofPNdQ3oENIkmwu7vSbtIs6X6NwNBatCWxWhDDoeMXCyVemVQ1Fw/PHastNe1ymRohheCxHKGXKaFbQ0MasY7OXbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtGHIibvEtBL1PbPk/kfrCYVDSCQ1ER3fZuVsPvVZ3I=;
 b=UTRIw3OTDW5gNxS2tTsTzHNK3uKPR9U/jx/NNSIBCjYbcYDCbH0mFvvrKlkhof516JQLkT9WBYx2+KZi3F9gYxXPMODyFQVIhRhPE48NKQrb35R53h4I1y0gHocbcybW0EQZ3kPbn6emTIHJWrciXnVaEcyLPg6r1RQuoENQyMwhNnM55pbWixNi2Af1BD+ux9XhXGoke0E0En5Otmghy2nbQIryRdVXcgRfGrnL84rta30srQQa1bv7fsdFpSKK54gVKObdHopCG3KJ3xYsXc22Qqh9wSokEImxbhfBIgl32ZtPDcpD9zRcauaYoDgMKdlAjmdUfSY0qyvU7QF1ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtGHIibvEtBL1PbPk/kfrCYVDSCQ1ER3fZuVsPvVZ3I=;
 b=FFurdxKvRSQSWrO7SJpDsVLhINApwxVtIbfij+88PEPgSqYrW0e1z3LjSlDvmBzqTCKLwG0Blk1UR9bv6HSIIZgYzi1zX3aQP8Hee/7W8oJxKsbNLzcGiBVm7IUslYwpnAPeQp22EKXbGyDFDcfaYHBAEylMZuWvJ2+AlhcvijE=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4641.namprd12.prod.outlook.com (2603:10b6:a03:1f7::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Mon, 26 Apr
 2021 16:29:49 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 16:29:49 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Vladimir Isaev <Vladimir.Isaev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
CC: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ARC: Use 40-bit physical page mask for PAE
Thread-Topic: [PATCH] ARC: Use 40-bit physical page mask for PAE
Thread-Index: AQHXOoQeRoAsdo9ybEqvN+qAfiw8IKrG/bcA
Date: Mon, 26 Apr 2021 16:29:49 +0000
Message-ID: <5010e4f4-c881-6c9f-b24c-4a87d9a4d55f@synopsys.com>
References: <20210426100801.41308-1-isaev@synopsys.com>
In-Reply-To: <20210426100801.41308-1-isaev@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 6b3ea9ac-fb7c-4388-57be-08d908d08303
x-ms-traffictypediagnostic: BY5PR12MB4641:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4641653B878EA9F86D7781B2B6429@BY5PR12MB4641.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MGweKZW0S7L9aqtiMFlQExeG4kHUXOES9btLoOGPFol0SqxdsE0i2m4kiGX2v66+D/Tc1IxlhPi3LNVBe6Zp8IszUqyP1W8+CZCy0WeKf5rOc6d9AbqHgo045LgNECu6BeJIHs++YrQ2iAlGQ1WyqVTFNfEnRbx6D3pGG/E4AAy/H5NohpbbdOf+KjX79ZeNs3bjaIg4bJa5KlF5UmL4fWJTa1buWPf4htt3STiT8w4SBih01sgxscH2kCx6Htb/MqnYfyfvFhELAwPkkvhL9mjNuwKEG/fjMS3PU5n0MDGIWJSzFsJV92qb+ngsCAQuR+0xIa9uY5ifJrrZwZ1KoUMi9BZTlwxfafs4UE3Gd1sf7Ig2ixdMBMaTd3SSEjXmxNnXT0SE/OSS4t0043ohnLmzbyJ8N3P0+xVhkIlMC9rY+CykeDoOrUUaulvbtYMZjRbENmx8ulECAGlHIij5n46q5nCxbmSp0TvkhRQI/bKXw3W1h4gNCASR6hANvKRXWTBzWcFZzz2TKk4C5yn5Jn1b/OTceJKewZrNmWOOgps+Qx2VnINAxJ5cxNFXqE+w1mXjdsXuWilJvUje+gclSPWZGm0qQdRtwL28DUGp1f/I9dDJCxMm4Z06qRaAGdj76tzB9c0MNUIdqCb+qnLkPz8h4JROrsgYyBWneFK/cJwMvwiu5jTwLk8qrLNhEhB6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(366004)(376002)(396003)(39860400002)(53546011)(6506007)(31696002)(64756008)(26005)(186003)(2616005)(36756003)(122000001)(316002)(66446008)(86362001)(110136005)(66556008)(478600001)(5660300002)(38100700002)(6512007)(54906003)(2906002)(71200400001)(4326008)(66476007)(8676002)(31686004)(83380400001)(76116006)(8936002)(66946007)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QTNkMU80SldqL1dOME1ITlczMkMzMERwSXRJQXU4Umppb0Z2Y0JVOVRGRzRC?=
 =?utf-8?B?RU9NKzlSZm1WV2M1WUtHMHdaOHdZUnFoZzFISlVSZCtMRitCbTFMTHdYMk1G?=
 =?utf-8?B?MVNIYnZoc1RCYWdLU0xDYnJaOTB6TjRCcVRrVEFOUVoxZUp3MGNSTDc0MU9S?=
 =?utf-8?B?N3dkbnF2K1FaR0tDblg3bTNjMWlTbTlCbkFaVEJHQThBeldoRW1PSEVCdDBm?=
 =?utf-8?B?T1o4THllQkxKT3plWkxHNDZPcVkvcHBqRmhXMkg4WE1qb3RldUVkRDY4TXAr?=
 =?utf-8?B?V2tyTlEwTjBOMlZUdFViUlc4NmpONUM4VTEyUlRXc2poZWNoN2l5TXhBdzJQ?=
 =?utf-8?B?cGo0MWdlSEVxOHhLd2tINTgveDhIcThYMXpkMVZBWFllOS9ETDF0clQ0RVhK?=
 =?utf-8?B?VkNQZTdER2ZtZEpVMHgwT09CQUpaUEtKNlNHa1B4NUlFRWJmTm1ubWF4ei9L?=
 =?utf-8?B?dDlhdjhSZVo2aG5LUmdJTEdrZm81VS9jbkdYOU9HTlpPTk1WT2VIbzF3R3BY?=
 =?utf-8?B?M2dNRXg3WnRkeTBKTjhYYThUdno5UzRHaHdrMWVLZFc4KzJBdzI4SW92dXA5?=
 =?utf-8?B?Wm1YNU8yNlhST2FRTWpwK3JTelJndWUwU20xNHVtdWd5bG9jdTJKeG5sc1Ft?=
 =?utf-8?B?NHpwM1BuUEp3eGhzY3Vrc3hOZjZwaHB1TytDd3F1MFhrRHZsanZzRkM1dEox?=
 =?utf-8?B?ZmVLNEpFR3B3enptaEtLYlpaWVd6bUVSUEFlL3I2SGdNNUdpZVd3K3BXWlhT?=
 =?utf-8?B?RzdlQnpyT1dLeDVoTzRkWURab3VpRDcyWkE0YTVzbGlYcmwzT3lkdElEU3RP?=
 =?utf-8?B?NnJJZHVHcFd6VFJHam5qSk1LVjFYbUZUQW56K1h0QkF5WVZiTDhwaHB6WlBk?=
 =?utf-8?B?ajdCcXJEWjJGU0hwejN3d1FzaUFxTXJOa1ZBenM3QWFJUHV4azAyQXc4K2d5?=
 =?utf-8?B?YkZ1Q0RuSlcrZFMyNFZJNXgrUXBKWUFBVVVvQzFIZ0hQKzZJS3BxK1RqcW42?=
 =?utf-8?B?S2d0am5FUDVOcyt5SlNMc0JMV0FkUkNVeTI3ajZjdjhOUUtFTC81QzIyQUhT?=
 =?utf-8?B?MXhrb1FDZGx1V0dPTERzeGVtM0JkdGpSRml3cFlMY01XTkNCaVBSNjVlbjBn?=
 =?utf-8?B?b0d4M1k4T3A0OTFWWDhuL0RiVnVjdGFrZFBRc3g2OXB1d2FpYm9COW1LM0xt?=
 =?utf-8?B?amY1b2U2SVhaQmFpakhxcW10bmMzbDZmSGpyMnk1cFVJVHcrV0pJK3VzQVBC?=
 =?utf-8?B?cTRTclNTb0t0RHZhajJMa0pWRU1iRnZoMXM4QTI3N0dnc20waytEOHhGZkV3?=
 =?utf-8?B?dk1IckRiOU9RUkN4aWpqeC8va0w2NG1rMVBrbCtEbnowR1BacFZWNE5OV0Fi?=
 =?utf-8?B?QVdJd3liK0oxeDZjSm5xMTNKN0hWcFAvZDZlZE85N1pMNldiSTViU3ZscWZh?=
 =?utf-8?B?YVYzZmtleUhWcVhCQmZSRmdJblluR3YySVVRNXp0SlJZbGN0V1FlVS91akZu?=
 =?utf-8?B?Zm1yY3h5cFBaNEFaajZhYjBhN0NNSXV6QTlZMzJXL2U0VGdPcjl3Z1pNTnVs?=
 =?utf-8?B?L0VXb01ZbXNWVVU5Y29uOEpCTEVSQnFpaXI0WDRVV29ham01VlY2NmVpTndS?=
 =?utf-8?B?L0IyWXNzOU8vaU9JdFJoQS96V2ZGd0FQRUdDSEVOZWJ4emF0Yys0WTBpM0F5?=
 =?utf-8?B?S3FLbFFHWUxEKzBlbVptSEZ3bnV1UVlmWmw2SWExUjlzMi9Xb1JxUzFnY2lU?=
 =?utf-8?Q?fIyj2mJTeaOui3MgJg=3D?=
Content-ID: <6EEBFC917976FE43AA7719F7A6FD8389@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3ea9ac-fb7c-4388-57be-08d908d08303
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2021 16:29:49.2790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QYnEacBob5gdRfd6HdmUErKDRxS3mUlpJ97OLOEhIgg9myrDvUk8Pe37GLvyp9eQXSbI7QfCkU/7aZwAhpR0QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4641
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_092957_642553_BD9D2795 
X-CRM114-Status: GOOD (  27.35  )
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

+CC Arnd

On 4/26/21 3:08 AM, Vladimir Isaev wrote:
> 32-bit PAGE_MASK can not be used as a mask for physical addresses
> when PAE is enabled. PHYSICAL_PAGE_MASK must be used for physical
> addresses instead of PAGE_MASK.

Can you provide a bit more context : like w/o this exit/munmap on 5.x 
kernels was crashing - with the actual stack trace.


> Signed-off-by: Vladimir Isaev <isaev@synopsys.com>

This also needs to be CC <stable>

> ---
>   arch/arc/include/asm/pgtable.h   | 12 +++---------
>   arch/arc/include/uapi/asm/page.h |  7 +++++++
>   arch/arc/mm/ioremap.c            |  4 ++--
>   arch/arc/mm/tlb.c                |  2 +-
>   4 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
> index 163641726a2b..25c95fbc7021 100644
> --- a/arch/arc/include/asm/pgtable.h
> +++ b/arch/arc/include/asm/pgtable.h
> @@ -107,8 +107,8 @@
>   #define ___DEF (_PAGE_PRESENT | _PAGE_CACHEABLE)
>   
>   /* Set of bits not changed in pte_modify */
> -#define _PAGE_CHG_MASK	(PAGE_MASK | _PAGE_ACCESSED | _PAGE_DIRTY | _PAGE_SPECIAL)
> -
> +#define _PAGE_CHG_MASK	(PHYSICAL_PAGE_MASK | _PAGE_ACCESSED | _PAGE_DIRTY | \
> +							       _PAGE_SPECIAL)

Bike shed: Can we call this PAGE_MASK_PHYS

>   /* More Abbrevaited helpers */
>   #define PAGE_U_NONE     __pgprot(___DEF)
>   #define PAGE_U_R        __pgprot(___DEF | _PAGE_READ)
> @@ -132,13 +132,7 @@
>   #define PTE_BITS_IN_PD0		(_PAGE_GLOBAL | _PAGE_PRESENT | _PAGE_HW_SZ)
>   #define PTE_BITS_RWX		(_PAGE_EXECUTE | _PAGE_WRITE | _PAGE_READ)
>   
> -#ifdef CONFIG_ARC_HAS_PAE40
> -#define PTE_BITS_NON_RWX_IN_PD1	(0xff00000000 | PAGE_MASK | _PAGE_CACHEABLE)
> -#define MAX_POSSIBLE_PHYSMEM_BITS 40
> -#else
> -#define PTE_BITS_NON_RWX_IN_PD1	(PAGE_MASK | _PAGE_CACHEABLE)
> -#define MAX_POSSIBLE_PHYSMEM_BITS 32
> -#endif
> +#define PTE_BITS_NON_RWX_IN_PD1	(PHYSICAL_PAGE_MASK | _PAGE_CACHEABLE)
>   
>   /**************************************************************************
>    * Mapping of vm_flags (Generic VM) to PTE flags (arch specific)
> diff --git a/arch/arc/include/uapi/asm/page.h b/arch/arc/include/uapi/asm/page.h
> index 2a97e2718a21..8fecf2a2b592 100644
> --- a/arch/arc/include/uapi/asm/page.h
> +++ b/arch/arc/include/uapi/asm/page.h
> @@ -33,5 +33,12 @@
>   
>   #define PAGE_MASK	(~(PAGE_SIZE-1))
>   
> +#ifdef CONFIG_ARC_HAS_PAE40
> +#define MAX_POSSIBLE_PHYSMEM_BITS 40
> +#define PHYSICAL_PAGE_MASK	(0xff00000000ull | PAGE_MASK)
> +#else
> +#define MAX_POSSIBLE_PHYSMEM_BITS 32
> +#define PHYSICAL_PAGE_MASK	PAGE_MASK
> +#endif

Not a good idea as you already saw the kernel built bot complaining. 
Granted we have the old PAGE_SIZE cruft there, but that's not the 
precedent for adding more.

>   
>   #endif /* _UAPI__ASM_ARC_PAGE_H */
> diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
> index fac4adc90204..eb109d57d544 100644
> --- a/arch/arc/mm/ioremap.c
> +++ b/arch/arc/mm/ioremap.c
> @@ -71,8 +71,8 @@ void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
>   	prot = pgprot_noncached(prot);
>   
>   	/* Mappings have to be page-aligned */
> -	off = paddr & ~PAGE_MASK;

This is offset *within* a page so upper bits must not matter. In fact, 
with this a bogus offset like 0xFF_FFFFFFFF can turn into something 
weird such as 0xFF_00000000

> -	paddr &= PAGE_MASK;
> +	off = paddr & ~PHYSICAL_PAGE_MASK;
> +	paddr &= PHYSICAL_PAGE_MASK;

This change is OK but feels weird nonetheless. ioremap is intended for 
actual IO regions and not just making making normal pages uncached. I 
know you tried the devmem trick to do this but I don't think that is a 
"production" way to render uncached pages in PAE region.

>   	size = PAGE_ALIGN(end + 1) - paddr;
>   
>   	/*
> diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
> index 9bb3c24f3677..15a3b92e9e72 100644
> --- a/arch/arc/mm/tlb.c
> +++ b/arch/arc/mm/tlb.c
> @@ -576,7 +576,7 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long vaddr_unaligned,
>   		      pte_t *ptep)
>   {
>   	unsigned long vaddr = vaddr_unaligned & PAGE_MASK;
> -	phys_addr_t paddr = pte_val(*ptep) & PAGE_MASK;
> +	phys_addr_t paddr = pte_val(*ptep) & PHYSICAL_PAGE_MASK;
>   	struct page *page = pfn_to_page(pte_pfn(*ptep));
>   
>   	create_tlb(vma, vaddr, ptep);

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
