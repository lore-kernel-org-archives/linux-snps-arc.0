Return-Path: <SRS0=zy2i=M4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E3EC4338F
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Aug 2021 16:18:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FD9060F58
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Aug 2021 16:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FD9060F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFpPE+0lYk0UUdXIrzOUTJReh6pi4dp8fbVk5Rwrt0w=; b=BBwdDeXusuesuu
	RhnrweMXDMJPeoA88ftb9ZoiZirCxE5O1/R4sM7VkKZdgQZktkxud6Xy6FK/DR7up3GXIhPf61g0B
	kxyre4rI6lR/fwvr7OfTy0vLrqLHKmCIeGBkWzpwKhNRz2iaBFhA6hSpXJ87EK+0xC6qwEH5EL4he
	M+bwHnwyeHPcs2qkWxZMFHblegwccqD6v6AGJOMki8vhqo5evf0qWWl/8FeRAP7qC3QVHFWRmyTgW
	BDIPEkQJGVZ/X6lXLCIEfaHN92zjvRCq3ye25ItDrGiukLN9ZCQPfiWokYFrFtH/DAf4pSftdXEkQ
	Y5pe4/8RwFpE3oqYKtNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBg4x-00AENs-OU; Thu, 05 Aug 2021 16:18:43 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBg4v-00AEMy-AP
 for linux-snps-arc@lists.infradead.org; Thu, 05 Aug 2021 16:18:42 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5E17C463AD;
 Thu,  5 Aug 2021 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1628180320; bh=7GV4mZ75jBZij1Nvsdm8iU3QO5WV2w5Bro8s/lh3P1A=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=NXDSOAKxyQnpC0mY8saIeDXRTrM6zTcyfF22KBIDxNQoWMkQnydykcMWaxb/Jz72Z
 jbUG7Z6UTJ697LFFVh31LEZSjtyLQe2e/HRa6TsyoB8OrAiO2xJ+BhHNPhua4pc8sw
 ORwew3lHl/+iJWzwDd30Rq0ae1PcPXYSUxqJzBKAYLoSXj9gkRBzzoZHBGRNUhDc6o
 yann2JRSTdD9CuJApt3hC+jNxwJrkWFlBOmKDVPSFLLvak3sRRwkCurKqULGzjxVMb
 qa/Bt+H5GywXRlRIwUv6BvZ01RKoYaFjsfVxEyQmDkzf3tTzbt2FfuGlsuJ6Ikimzn
 gCAXac++3yvOg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id A8DFDA0077;
 Thu,  5 Aug 2021 16:18:36 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1B0C440044;
 Thu,  5 Aug 2021 16:18:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Xnw4uIV3";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4k1RugoPIwpfcR/GXeptGT3a35X4RJxCsZIFia63D9yfcd7J2/jV+J+Qd2SWQuouhm+ZB5VebBWm+8q7aeEXhGaxqrQYzp+p0E3ak4DNrM6sZJGh4uBV7Osa6GRZoqrNMaN3u9/w/3cUzvZi3ztWur4m/XJo20lfRwNvtRLRWVjNyhErierwSf6rWP9xVIFRIYQOXu6dRz/f14ksl5BQYHD09ryeeZ9H8WeKwpW6uMiaHDSf3a2ojfVzGEHpqDLIL8efudomGYlq4c78KfhN0JXsoEFXd5JC9VD24NDiw3rhNRdeWwcjdHdfdhK7E4N8Ci/erXqc8XFAGBTEcAD8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GV4mZ75jBZij1Nvsdm8iU3QO5WV2w5Bro8s/lh3P1A=;
 b=D+S79dMqUNYEV4SuxTUi0WqO/xLCwUa0/umblE/vLhfOS1/N//a5UVgH7ZYrkrgNVt+562cV2ENT66ZJeO2zYmxrqQHbqpCOg/ZIGBWeFdpbolvit6KH1oAhNSDdw34RoGVH84k5tjMXdMMTq1vmbe7if4jlpNptfuETNBl77jDa9To8FMtpIpCkrgeLXiUyrU5hKU5DmzBP/Bps0y/tvfYdSndsbYzTm/BXjsEyV50XMavaZvXpEF8l3iyF5HSiAuWndOeYGkUVK+zq+Xga3i3hbxCxC1qPk0R9BWaO4JdAE2WtjUtVuaxiYg7+EXO62ZwCBuI2mYeGaPhOx8glmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GV4mZ75jBZij1Nvsdm8iU3QO5WV2w5Bro8s/lh3P1A=;
 b=Xnw4uIV3j3q+2u6CrDagCJ1q6kGpD7iO10CH4EdCk4Dn+2oLj+Gb7aZeTigKEPQzjDh5wdeuJ/xdedy1X1H7+hgZpSCCeCdefa5o0hJwG8iFIaLEOrnhav9SmdxkuQxePhzyyjRPv5wozPGUX1HL+A+QSHB/IU8AyC+2Tnz/YW4=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2853.namprd12.prod.outlook.com (2603:10b6:a03:13a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Thu, 5 Aug
 2021 16:18:29 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee%3]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 16:18:29 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Peter Zijlstra <peterz@infradead.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Vladimir Isaev <Vladimir.Isaev@synopsys.com>
Subject: Re: [PATCH 00/11] ARC atomics update
Thread-Topic: [PATCH 00/11] ARC atomics update
Thread-Index: AQHXiWUsYM7Qe9Ne8kiewYojDmK9GKtknlqAgAB55wA=
Date: Thu, 5 Aug 2021 16:18:29 +0000
Message-ID: <2c2bed36-1bcf-ae34-0e94-9110c7e2b242@synopsys.com>
References: <20210804191554.1252776-1-vgupta@synopsys.com>
 <20210805090209.GA22037@worktop.programming.kicks-ass.net>
In-Reply-To: <20210805090209.GA22037@worktop.programming.kicks-ass.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org; dmarc=none action=none header.from=synopsys.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf536f14-0658-46d9-c110-08d9582ca998
x-ms-traffictypediagnostic: BYAPR12MB2853:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2853AC1E6E511365FB7A387AB6F29@BYAPR12MB2853.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cQxC7+5Vmm0pRcOFGNLVIu+GhjMPjZbMOv6R1E0mGnVCXt9m04rARSMigNgiSrL+G87Uu8CECeTdbesudWo0Ml2RQffK6T/IPsPbLhAMH3oIxxDB/J5gUprD6ldDOpzzpX/GNf0M9REYul5aftvXKQzHXW3u95/kX/9rL9NpJaSxSyilEtuLDcdICe1mBWiCGBA603RtX7+/ILeODKxaky6wZGoXYVDO1Wz5m3EwG5IHHHJiTdzrSiel/iUWZo5hy+IVgWmx9X4zdvrik8KpTaY4XrNXq9/E5tdqNmdhV+CEct7jOQ95uv0eHSjo1CnKHyfOuDA6/JWlo3YhQWyvaVnJI3igx8HbXRghV9yUM0ja3+fbeERFgs8VVfsQclekiK25d6X9LolqGNJ3E8VhSHQCrfa0NbWa7YdZ+TDW1yDaXRUUvHejag8hO3QSHC7h0mZOQV7qPMe7j+qQ8M1t0mhNPL02XrFfEFQ4XBl9CUuRfXgEd7n7wqeUK2NaysXKrMyIICUu2+gTqzqlzfWM+OVa8740vRHPN3wnXGhtMKR4zfWOdcXtcCOIOYIBKejS++NQZI9nBeNBbbHp7WKgjUBpoBbxD00u0FLnX1ttSLLbwjiTIp87aMgHJotYMMMOvIoumr1h23MMcn7UryN+4Le1YsiqH4Vcc9m0gC6DvH3zjJ5kn0a9HMh1pra8AlMLfyo9/N7FftQRFwxNqVe8McatgLGUssy8J/KL1exs4QcMHGDJbdDr27VY3ND1x+OWOSElmCReXCCJKBnhMsMv1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(39850400004)(136003)(396003)(6512007)(110136005)(54906003)(2616005)(107886003)(86362001)(31686004)(478600001)(5660300002)(26005)(316002)(36756003)(38100700002)(71200400001)(66946007)(122000001)(6506007)(31696002)(2906002)(8676002)(53546011)(6486002)(8936002)(4326008)(186003)(66446008)(66556008)(76116006)(38070700005)(64756008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SldPdURsUFAxTCtOc1dQalJOemN4dXV0V1RhT2thTjhRSVVRc1JlbUZMQWF1?=
 =?utf-8?B?U0ZoS3ZHcmlGSXBwa2ZkM01sT3ptQi9VYkxuSlRMN3Jybnl5aVpUeHVBT0tU?=
 =?utf-8?B?Y0M2R3JvZm1ISllnSmxzYmhOM0NvTlBpcmR0U1RRZ2d6U3BqWXZ3cncvb3Yw?=
 =?utf-8?B?ckxxOFJubkQveDlRc3Z5ZUsxcUh1R2JRZ3dMekpsYmN3RS9oM3R1bkppbXlW?=
 =?utf-8?B?YjRWdlBPNTVRV2E2UlBhTzV0SG1ibEhGaUhKL2swWmNLTkZ5d1FwYlp3WVBL?=
 =?utf-8?B?bXhBSW1Fc2tBcFg1WGVhbFRtWm41cGtObDhjWVhFNHp4TWhCeVpsZ3o2b0xp?=
 =?utf-8?B?NXdhdWNGbnRZZkRzS2VHN2JDYmExbDJkeDErYzEvYUU1VzZ5dTJTcXI2Y1ly?=
 =?utf-8?B?dGk3OUNZeEJjSzFxNVlGb2w4b3RMdGdjQVJMcXVSUTlVOGRVR0d5V204dW5J?=
 =?utf-8?B?WU9ZNlNsTHJzWjQxR2I5eGxCLzlVc25qRmxvSXc5NmEwdkJqcDdhS3hmbVo2?=
 =?utf-8?B?UG4wSzRmT0VXbHRYUnlhNkJSZkdXVUF4aEFKWW5iSmJOcHpWcURCSUFPZVNK?=
 =?utf-8?B?VTNPRksvTmJqaHl1T3RPZi9HUlJCOFZPWm5JbUttSXdkaFZQQ1NCKzlJcFlU?=
 =?utf-8?B?dDFEdFd5elJtYnR1aUQ0VjM5SFVHNXdyV3YxaDN1eHRCdlhzdURKQ2Y0amhk?=
 =?utf-8?B?SHI4REJZQ2RWdDE3RUo2OGlmRkkxYVJXY2RjZXk1YkNZREV6OTg0eVVIUllH?=
 =?utf-8?B?b1FwTkk3N3ZNM01GYXJGRlIrVGdjQmZSb3V2NnFYY1lKSy9WbjErWCtKZ09k?=
 =?utf-8?B?RjV5ZE4rUnVLYkp2RUNFQStRWWg4cFAxTzhZRzZZdGVkQ2tlM1p4cEpKZGdW?=
 =?utf-8?B?VFZNckRpREV0OUo4eFptRmFVSWhRY0dVSjM2NHd2VmZ3d0VZT2FaWUU4NTVZ?=
 =?utf-8?B?ZklpT1VYTUxDSjVORWc3WE9oRWFkbFFkKzJENzh6R0FkTDVnRUc0Z3U2QzZu?=
 =?utf-8?B?K3lIRFNyNk8zbGpwU013dXFUek1zUjlxRERFYTFtdWZHdXRUdGtOVWJNaGhw?=
 =?utf-8?B?WDBJMElKOWJtMlFlY3R5QkpSd3o1MGcwcm01L0Fod1NBNE1scWNEODl1Yjdq?=
 =?utf-8?B?bk90aFZpN3VmTzFtTml6NFZpcTl2a2lyQnBTNmpDVVZFZUdDS3c3cWZtSWJM?=
 =?utf-8?B?N0VWMVB0bHZIMDhnYXZQWE95bHhRcWtmSkxldGo4Ulo2NVI1YytVaHdyYjdh?=
 =?utf-8?B?V1dmTENLU1JveTlFc1V4S2FicEUwZEFTbThITXE4d0ZHQysyNkltQjhhRXZ1?=
 =?utf-8?B?STJ4WFIydE45NnBleExGdytLR3B0eC9uVmNkNlh0OW14S0o5Z2puanRpNHZu?=
 =?utf-8?B?c3BteHE0VzZLcjFvRGlmUkIwWldLSE5HajZBVFdUam5NaCt3eHM4STdDeDVW?=
 =?utf-8?B?NXdTTzcrT1ZMd1RBSnFBWlFCZFNWS2RqSHlLL1JJMnRzcWlieC9RNnJnR2F4?=
 =?utf-8?B?L0puekt3dmZDTHVDRjdKZm1ZUWxlc2x6dXErbzdhZGsyRDBGdmpXRHFVMWJM?=
 =?utf-8?B?SFhhOFhTdVJqL2pqZy9WMC9DL1pUVGVNRWJFYVBIcXEvSDBnYnplaHo1enNj?=
 =?utf-8?B?Tkxub1ZsZFZ5NUtJNGpUSCtPakNWcjdLNEdvMGlBSFFXWVJpZ0hyQXZGU2pm?=
 =?utf-8?B?WWQ1QmYvazhEUWFwU1liS1VKY2ptQzBzVmxwWWIwR0kxZmZyc1RFOW9ZQ25P?=
 =?utf-8?Q?b+2RN8ZdVSL5LC7OfA=3D?=
Content-ID: <CDA06E26E765A343A814EF1E6D84DE79@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf536f14-0658-46d9-c110-08d9582ca998
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 16:18:29.4542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TtrEfBai6mZLWO6TUqMm+jt9L/fWuJdqjzETnPUdfpCDP/I/i27bkPGC2Yqt0p+VrIwiXmrnzGcuv32dDThm/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2853
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_091841_498626_A6E4E4A6 
X-CRM114-Status: GOOD (  13.46  )
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

On 8/5/21 2:02 AM, Peter Zijlstra wrote:
> On Wed, Aug 04, 2021 at 12:15:43PM -0700, Vineet Gupta wrote:
> 
>> Vineet Gupta (10):
>>    ARC: atomics: disintegrate header
>>    ARC: atomic: !LLSC: remove hack in atomic_set() for for UP
>>    ARC: atomic: !LLSC: use int data type consistently
>>    ARC: atomic64: LLSC: elide unused atomic_{and,or,xor,andnot}_return
>>    ARC: atomics: implement relaxed variants
>>    ARC: bitops: fls/ffs to take int (vs long) per asm-generic defines
>>    ARC: xchg: !LLSC: remove UP micro-optimization/hack
>>    ARC: cmpxchg/xchg: rewrite as macros to make type safe
>>    ARC: cmpxchg/xchg: implement relaxed variants (LLSC config only)
>>    ARC: atomic_cmpxchg/atomic_xchg: implement relaxed variants
>>
>> Will Deacon (1):
>>    ARC: switch to generic bitops
> 
> Didn't see any weird things:
> 
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Thx Peter. A lot of this is your code anyways ;-)

Any initial thoughts/comments on patch 06/11 - is there an obvious 
reason that generic bitops take signed @nr or the hurdle is need to be 
done consistently cross-arch.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
