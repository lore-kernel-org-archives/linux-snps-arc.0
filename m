Return-Path: <SRS0=ruUp=KA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451F3C433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  5 May 2021 22:27:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BC52611AD
	for <linux-snps-arc@archiver.kernel.org>; Wed,  5 May 2021 22:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BC52611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wrSWaOUNwTJIUlCkvBRHzjp4uGteDJ2KREibBLNR+p8=; b=K29nCMMsX5tA8RxHNoVSphhLy
	cDMjiW2BTYOp15d1iz8Pc27YFnG2y/u1XmJZsoj/sYxPFVHrKW9BUlhJgQhjcY9lni875RjF6CvnI
	aRB5p14Jw4mOj8H+65IiNUjXkHcihWV9Mg7gkqh+oEDxTNYqBDawH675lnjzHo7UhFHpvwsiyZYTQ
	R0VHT8qcefLDOZ+cyVqF8PqUB1GmtObuQMjP5b5yTiymQVtKc3SklHVTDIKlSC9G6kgl+nHXOkPa/
	IY8N8XnUfYm5PGE78GA5AQl8qm9bpVeTC9zz/zR7tkgP1xWvnu7qOSV9E00E7q1jTblPWODuAyfkk
	Xc3sEX7Qw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePyz-002UWJ-67; Wed, 05 May 2021 22:27:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePWI-002Rff-4b
 for linux-snps-arc@desiato.infradead.org; Wed, 05 May 2021 21:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Description;
 bh=XzzaDX8PbjyjOF4uxroAFhyrwkqCS4EyxFblsm0Bqsk=; b=ct1S4X95r4mxTLEMugnfTTtKRs
 CaB1WfA0XmYd9g74SspF3T5fIPzrhlSDSawsD+h1RTID5uY5qk4+m14gwq/Xf/7rMjCRJE/nJDnKU
 PWz4FdhKiv/+gJFyCeNNPoJV/zCp9YCp+XAzxCioVjMAjCwnvKFuYt4+X5n2Cllp8G5lXGMunhju1
 BjsKqMeJ4F8MVAakfjcSv68KfUEu6hXnDstwYKUnJnXuLwdf8onOt1LDJbHHlIhk7EGp1k7JySZuz
 NutsbmqeeWKeZuZvvzCOnMq3M6hhXtMHPGqvlglcHnH8GkEdo5gwqMJ5WZdQfWNgDclQfTi6ACE7e
 geLp2BPg==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePWC-005JRz-Jm
 for linux-snps-arc@lists.infradead.org; Wed, 05 May 2021 21:57:22 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A97FCC0097;
 Wed,  5 May 2021 21:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620251837; bh=XzzaDX8PbjyjOF4uxroAFhyrwkqCS4EyxFblsm0Bqsk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=W0oVO8JtNKii8XGN4KunVR+h3On4YfzEv5O3lu6AugI5Tb8sW0phqkWuOlTBB947q
 q4Mpp8IdsanSpkKnSuhnq8thdDvTazwhdN3pFkWRWJ/jin8+fGTb6aLTNsqmDkEXU7
 PpnzMePLFTDYhmrxRuiSLQoS7D+u8MYk5ADd7wtR51MRSQ/CbUYuAnN+gvLC6y8nrl
 EZFFrAScPItuWIWeTYDWZGITYRIGPhBBz7Gb0DMXe5dfqbK1BSggoEFIxHey18TTuk
 Pky1wNQLa+TNTxNHjs2UXkMcIAlx8t5mvyCyrPxWCWq1dhi90cacyc0047BfDiOlnU
 GsbrjyHMTKYHA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 37D67A0096;
 Wed,  5 May 2021 21:57:14 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8509D40155;
 Wed,  5 May 2021 21:57:13 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="n8sXWGtd";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGlbbYq6HcpncQYHUCP36QyeXgnRaSQY9w/JI9YPaLT11Fc6/uO4Polu8OFGkoLV7G85MCVV+ihEAgJ9IEhRdMOcLh666K3kwHBXU/CEwpYiqIZ1ZN54J8NSuw9DQNlnDXbU5SH8ZyUPjgCACfxSXJSMBkHEkVHuwGrx40nI0qXm/Caj19B1HrwMOh3YazFBqVqK+uGgbs0XkdzmS7iAbtdOpDQi9THP6lx2o7/NcbqWT63Y4VNOGPrC4D6twanGlCDTmcbQy2e1jaUgn1HCZdgXwbVOyO+kf0b/gERZx6UMLwHsuaM1GHnOTww9tXln5HwIEMboAbhQGtpz1/jb5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzzaDX8PbjyjOF4uxroAFhyrwkqCS4EyxFblsm0Bqsk=;
 b=k192IWPC5gc23MhbfiXB3NHt7gUIsdLvGS/MVgcfhRrax43lX5KjMYBl02+cshKWtV0sSxnpDiNHgge+fWMN5rUac4QkJS3R+r8C02NP0x1zLmhlIx1UsiV+Oc0JAhAkmdXP407jfMIdv2G4EcuOrP2+UPi+Xy9PDePPk0sYqUtJXrIadhSIPBgP/3Jk8jBek49lByqBsli12vlI4BracpZdOSKWA1Ur6m6GyUgbjUEv64Dn+XHRS50ohpiOP41/2Py0DWVvaTCxC5kgIGARr6s3YvHdbtNqnv1g5LuDDIeGuo2Gc9r1w8IoZlseaNV1JzcYbGZ1c6HRisvoOjLR7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzzaDX8PbjyjOF4uxroAFhyrwkqCS4EyxFblsm0Bqsk=;
 b=n8sXWGtduwSdT6+m/zaZf2yN204Q2Qm0hDxAViUDd9ePeCEVHLORLz28ApRDv2fVpVUNpqa8DSV87He5VTgjvgNHEUp6nVGhPw8Uw57hTR0sfTaugnrUwvpTKZc2kvzwjAbwWjNyF1yL1nsw7qBjSdoc++CpmF/7TXRQYdGqGXg=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB3827.namprd12.prod.outlook.com (2603:10b6:a03:1ab::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 21:57:10 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 21:57:10 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "config-patches@gnu.org" <config-patches@gnu.org>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] Recognize arc64
Thread-Topic: [PATCH] Recognize arc64
Thread-Index: AQHXNue0QgK3e27ljUOU/Vw8g57r4KrVhWGA
Date: Wed, 5 May 2021 21:57:10 +0000
Message-ID: <ff44547a-9e1a-a421-4263-2cde2ebcdf65@synopsys.com>
References: <20210421195118.158464-1-vgupta@synopsys.com>
In-Reply-To: <20210421195118.158464-1-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: gnu.org; dkim=none (message not signed)
 header.d=none;gnu.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03049dd0-cf1a-4bee-a945-08d91010bba0
x-ms-traffictypediagnostic: BY5PR12MB3827:
x-microsoft-antispam-prvs: <BY5PR12MB3827B3D285D8549F53E93DE5B6599@BY5PR12MB3827.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zxcWb8m7TFTIJocniF4axOm+eKWmsmPW60PJstnk+/Pz22/zdlBHq8xvcZuEcaabaexz/QOiCL8PGO9ggjLcfbt9bDC+LUQg4txQd19HGNcK8yNkJIMcQl3Snyay/+g4XMXLiThVZqqrZ2R3JomhnYtjGCtSQICGV/T+IAn4NqTkX7bVQ4afGkS3RAP/a3NkqkOjgHaa/xaWeLUAgg57m7p9H0ybp81g+nKkjURh/iugZme8hmP/l1cmwtIGkt4V+RLP+jZQhiKG7Khxta6qDefDS9ATL0Og1Meeg9cSgSrNhhLr/CarVqedZqyBvNHM0fVuB9Mu5D0C1gvarsyf1tWcpwsdomPuffDG/sfFgrocx2dsnFXluWV8l1Eoq57ZAjhCKwHc2c6/runyLNOG8Zw+QAi2n6zyOaNI5IQ+VT9acPggNHPlLexo9r16iEqIEmDPTsNtEPiMc3+hUNCsVTckbOInnDVU4zxti65VlBRlwBJjhPz0xL3oEsg2bBJsjBiUo/Bo+zrrvMynoyS1Xqzdq+xX3Tj1ehvlfoLeNPpw63Irn5lsn7uNzftiTvIP1W5c5OiWrCQtYI5svr7vycrRBx1frQpgTc7ei4RO2keTvpfDH8tERUZJFGsEoDLZImYwwpDhA1xiLJCqwNCJ+6y00+WmwZ3PnM1X53/bXnT8kkRDZaF0NpHzIAbsXSdRtnaF9P/sdV8uMPGx5yDXeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(376002)(366004)(346002)(39850400004)(83380400001)(186003)(64756008)(66476007)(26005)(76116006)(66946007)(36756003)(71200400001)(6512007)(31686004)(2616005)(6916009)(66446008)(6506007)(66556008)(4326008)(8676002)(31696002)(2906002)(6486002)(122000001)(316002)(478600001)(53546011)(86362001)(38100700002)(5660300002)(8936002)(2004002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RlFYakpYeWtXWER2dlBzOUhsUHk0dGptbDNlYTR1YmRaWlFKRjBDSlFVb0JY?=
 =?utf-8?B?RHpxVEpLNmRRYVJWUmtlV21qcDIyak94b2VlRXh0eGhyTjRQTmFXcGhya0V5?=
 =?utf-8?B?TmtBR2gyZXhtbXpZMndYRXEzc1RwQkV6amtSQlFqL0duK0tmYmRZZDZJbW1V?=
 =?utf-8?B?b3l3dEZZTHkxQ2RPV3FTUHJXQ3lPWHpodlRFek0wSlN1L1phUThsb2JUOEJs?=
 =?utf-8?B?TktjckRncUE1YTBEamdrb0xrUGtnUVVYaS80Q0h3NWN0WGdTR0tRR0xBbjdy?=
 =?utf-8?B?QmxVREJ4MkVGVHM4a012WTF6emozSUROZ1AzV2JoTG9XckFhejcycjc0NmNs?=
 =?utf-8?B?MnhoeExpOE1YeG1mcmQ0VXk5a1k5OU53WWZuRTN2UFZtL21OeTNCcnN2cGtD?=
 =?utf-8?B?MjlJT09Ta2s1RmlnTGJWamI2cWhGUG1QMGhyOXRVb0F3d1dxQzBDWXhKY3Bz?=
 =?utf-8?B?NTZWN0lqQTVsd3lQTjc0MEJ6QkRWV1Z1WS9lYjl1R3lxZnZVU0VtZ3Q0YWlM?=
 =?utf-8?B?WnE3enRmV1YyVTNRY204MFJrZVZiaFBSTkZXWGFhaHE4dXFHZDA3OW4xTGx0?=
 =?utf-8?B?a0l1V0tJRk84eUlPUi9sSnpmSmdZaSs3NUFodUJVcUx4OHFNVS8yZytJZy9I?=
 =?utf-8?B?WjRycEZoK2FJcnh4NHFlV2Z6ckNXMWV2T0lhQ282THV3cVI5SU15T01LblY5?=
 =?utf-8?B?dU9Cc2RobFBPMzhMbW5remxXQTZCRnF1VU95SDhmd2E1ZjVUbkZ4NXltNHRk?=
 =?utf-8?B?THVXOC8xdDRxVlR5VEV5QjJUTWJUNXkwNURiWVViemdoL0NjbFRYQ2lNZUd3?=
 =?utf-8?B?MElrTVJ6OXh3akJsT3pWOE8ycHZreFBrYzRydy9vSDZPaUFmL2NJaUJDSXdF?=
 =?utf-8?B?T3piWWlwQTN5WWMxaHoxSFlkKzgrOEVJTTFScm84MUJhYSt6OC96ajJCVklB?=
 =?utf-8?B?WnRsZ2cwQUVrSlF4VWR5V2xKVHYzU3h1ZC93UFBPYTRtUTgzZkwvTXVmTmJa?=
 =?utf-8?B?WFppL2RWa1BaeTRpcFptbUUvVDBUSFBoNDFzUXM3ZUdyckVIUFN4TWFUeFJ2?=
 =?utf-8?B?MThraEFnWnV0Y1BjekhZcWl0cFRIL1NVZzVabVd4Znl2N1d5NjJTbzV4bjhJ?=
 =?utf-8?B?Wm5Wc3VmVWhmWjNDQnlWSml2UVhsbHYya1JmdGNkKy82SDdYSU9rT2dvb1Jj?=
 =?utf-8?B?K1R2U1piMmlaRGVjRm54UTRaUjZIa0dvREUzclo1eVZMa3d1QUgvM0h0TDVs?=
 =?utf-8?B?K2xBWENQV2lXN2tpRnRQM1NrbTZBOE9SK0x5MG5vMlYwdWZPdVhITlV3Rm1E?=
 =?utf-8?B?bUNWR2MvdDJWSThKSmYrRUZHMm10ck1uSHRJeFBXZzBEa2U1RFc5NXE5Mk10?=
 =?utf-8?B?Rkc0TW5YNmk2R0daUEFhSjBMcmdrRDVSZGxobkNtZU5QZzhwWlhYcUFBOWdN?=
 =?utf-8?B?SWNTKy95YVlZY1pkN2xkM3QwRkZTd1IzKzJDeUsrZUQ2cmR4VlJKLzNFU294?=
 =?utf-8?B?Y1JDRDJoRDA4aWt5RXZJdVU2aXYzc3lDSTNCYnVXVGQyUjA5TngrSDJzcll3?=
 =?utf-8?B?cWlCVlk4STNydWIybjNiQW16NGRaWHJrbGhoUVdDcXIwNEVLMDlMeXNmRTFk?=
 =?utf-8?B?K0NyRmtsTDZQMG1aYm5VN2tjd1NjUklRcUs0TVg2SExpa0xqQ253MksvMmls?=
 =?utf-8?B?TUs0Sks1NEVlR09KZHg0aldySHYrSnA3VEVOTlE2N3kyckZrbTJWUVY2Z1dY?=
 =?utf-8?Q?yzL2fOfiBPEWDOCy4U=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <10CD6F4F96FE2B40B095E7D4CD2883DB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03049dd0-cf1a-4bee-a945-08d91010bba0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2021 21:57:10.1576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R/VVd/2Q+UQZO4Dfnfgx1/nLWRi6+2UBnEEqj9HVnzPGjK/oCHwzSV1sRkmMhDv9i6lGH1KeWiJO5ApdJWWfkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3827
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_145720_790378_CA8141A8 
X-CRM114-Status: GOOD (  24.19  )
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

On 4/21/21 12:51 PM, Vineet Gupta wrote:
> This paves way for setting up arc64 software ecosystem.
> 
> $ make check
> cd testsuite && bash config-guess.sh && rm uname
> PASS: config.guess checks (135 tests)
> cd testsuite && bash config-sub.sh
> PASS: config.sub checks (852 tests)
> PASS: config.sub idempotency checks (789 tests)
> PASS: config.sub canonicalise each config.guess testcase (135 tests)
> 
> * config.guess (arc64:Linux:*:*): Recognize.
> * config.sub (arc64): Likewise.
> * doc/config.guess.1: Regenerate.
> * doc/config.sub.1: Likewise.
> * testsuite/config-guess.data: Add test cases for arc64.
> * testsuite/config-sub.data (arc64, arc*-elf): Add test cases.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Ping !

> ---
>   config.guess                | 4 ++--
>   config.sub                  | 4 ++--
>   doc/config.guess.1          | 2 +-
>   doc/config.sub.1            | 2 +-
>   testsuite/config-guess.data | 1 +
>   testsuite/config-sub.data   | 5 +++++
>   6 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/config.guess b/config.guess
> index 1972fda8eb05..a6646ed28258 100755
> --- a/config.guess
> +++ b/config.guess
> @@ -2,7 +2,7 @@
>   # Attempt to guess a canonical system name.
>   #   Copyright 1992-2021 Free Software Foundation, Inc.
>   
> -timestamp='2021-01-25'
> +timestamp='2021-04-21'
>   
>   # This file is free software; you can redistribute it and/or modify it
>   # under the terms of the GNU General Public License as published by
> @@ -949,7 +949,7 @@ EOF
>   	if test "$?" = 0 ; then LIBC=gnulibc1 ; fi
>   	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
>   	exit ;;
> -    arc:Linux:*:* | arceb:Linux:*:*)
> +    arc:Linux:*:* | arceb:Linux:*:* | arc64:Linux:*:*)
>   	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
>   	exit ;;
>       arm*:Linux:*:*)
> diff --git a/config.sub b/config.sub
> index 7f7d0b055ac5..d70247c08d12 100755
> --- a/config.sub
> +++ b/config.sub
> @@ -2,7 +2,7 @@
>   # Configuration validation subroutine script.
>   #   Copyright 1992-2021 Free Software Foundation, Inc.
>   
> -timestamp='2021-03-10'
> +timestamp='2021-04-21'
>   
>   # This file is free software; you can redistribute it and/or modify it
>   # under the terms of the GNU General Public License as published by
> @@ -1165,7 +1165,7 @@ case $cpu-$vendor in
>   			| alphapca5[67] | alpha64pca5[67] \
>   			| am33_2.0 \
>   			| amdgcn \
> -			| arc | arceb \
> +			| arc | arceb | arc64 \
>   			| arm | arm[lb]e | arme[lb] | armv* \
>   			| avr | avr32 \
>   			| asmjs \
> diff --git a/doc/config.guess.1 b/doc/config.guess.1
> index 75fbb236fd68..f79f1c5f10c5 100644
> --- a/doc/config.guess.1
> +++ b/doc/config.guess.1
> @@ -1,5 +1,5 @@
>   .\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.16.
> -.TH CONFIG.GUESS "1" "January 2021" "GNU config.guess (2021-01-25)" "User Commands"
> +.TH CONFIG.GUESS "1" "January 2021" "GNU config.guess (2021-04-21)" "User Commands"
>   .SH NAME
>   config.guess \- guess the build system triplet
>   .SH SYNOPSIS
> diff --git a/doc/config.sub.1 b/doc/config.sub.1
> index 317c8c47a180..9d52cebf58d0 100644
> --- a/doc/config.sub.1
> +++ b/doc/config.sub.1
> @@ -1,5 +1,5 @@
>   .\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.16.
> -.TH CONFIG.SUB "1" "March 2021" "GNU config.sub (2021-03-10)" "User Commands"
> +.TH CONFIG.SUB "1" "March 2021" "GNU config.sub (2021-04-21)" "User Commands"
>   .SH NAME
>   config.sub \- validate and canonicalize a configuration triplet
>   .SH SYNOPSIS
> diff --git a/testsuite/config-guess.data b/testsuite/config-guess.data
> index f240e9ce61df..73908abb4e06 100644
> --- a/testsuite/config-guess.data
> +++ b/testsuite/config-guess.data
> @@ -35,6 +35,7 @@ amd64 | 7.0_RC1 | NetBSD | ignored | x86_64 | x86_64-unknown-netbsd7.0
>   amd64 | 7.2.1 | Isilon OneFS | ignored | ignored | x86_64-unknown-onefs
>   arc | ignored | Linux | ignored | ignored | arc-unknown-linux-gnu
>   arceb | ignored | Linux | ignored | ignored | arceb-unknown-linux-gnu
> +arc64 | ignored | Linux | ignored | ignored | arc64-unknown-linux-gnu
>   arm | 12.0 | FreeBSD | ignored | armv6 | armv6-unknown-freebsd12.0-gnueabihf
>   arm | 12.0 | FreeBSD | ignored | armv7 | armv7-unknown-freebsd12.0-gnueabihf
>   arm | 12.1 | AROS | ignored | armv7 | arm-unknown-aros
> diff --git a/testsuite/config-sub.data b/testsuite/config-sub.data
> index 101a4c45ec39..0a59eaf1cec7 100644
> --- a/testsuite/config-sub.data
> +++ b/testsuite/config-sub.data
> @@ -59,9 +59,14 @@ amix						m68k-unknown-sysv4
>   apollo68					m68k-apollo-sysv
>   apollo68bsd					m68k-apollo-bsd
>   arc						arc-unknown-none
> +arc-elf						arc-unknown-elf
>   arc-linux					arc-unknown-linux-gnu
>   arceb						arceb-unknown-none
> +arceb-elf					arceb-unknown-elf
>   arceb-linux					arceb-unknown-linux-gnu
> +arc64						arc64-unknown-none
> +arc64-elf					arc64-unknown-elf
> +arc64-linux					arc64-unknown-linux-gnu
>   arm						arm-unknown-none
>   arm-cegcc					arm-unknown-cegcc
>   arm-coff					arm-unknown-coff
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
