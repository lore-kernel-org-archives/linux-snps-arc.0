Return-Path: <SRS0=tXg0=K5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67116C47082
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Jun 2021 19:51:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15FD6613D7
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Jun 2021 19:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15FD6613D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kIUv5nOmIT9tU4/NrkSlAEBIwuV8uXOkBNHqqERw/uE=; b=NyrYEFlKWSDXg3fvOQaPlJ3n72
	IiRVBtg+kYK453OmcpYUozSIGYbzc5EXtJdb1+qDQJKOR2PhRmePGMd/H2UpFttvcD8iqhdtk4dcq
	T9qqenWFjzoXwx407hGb4Rpn6KM0MFAGvU74QUWcyhDs+S9bqLMjtpFlYs8fLtIQNjezr3cPlpTfp
	1RvIhFWIrevESalGHXoa6aOzNlsHagU2O53YyatVcInNyJKeMypwnnQyPEsKOkaTijpZ0c6r85cLg
	Cxd5yThlY5d52fU0GOQMNjebIr7vFhVwEUNdI7Gt9GRrGiKdIXcuSioK1td3M5AHnEI9QQEy5b8x7
	wX84xHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lotNh-00AMVy-JW; Thu, 03 Jun 2021 19:51:53 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lotNQ-00AMU5-0W
 for linux-snps-arc@lists.infradead.org; Thu, 03 Jun 2021 19:51:37 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A3885C0828;
 Thu,  3 Jun 2021 19:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622749895; bh=rNW8UMRBADyZ6IcztgiNJP9E7RMUzoMi8fMy+xpFPV8=;
 h=From:To:CC:Subject:Date:From;
 b=IXmvxn0aGk336MN1trKj1vYCA1NidNtNT20RAI/q1U+DIQV/iMyAJjlPwMbBMCQ56
 y5jheYTL6ANXTW2GSfcurr/6rdnQCRN9GReLa+5O6yipy/I2K+5RTM8/b/9BTmX2LD
 R75xj2/CuvmMjNaPPPHtQfQoDKmoxdugKfa9F6xpeTwCqX+fMeJXVnKhw+1wzAChUZ
 uCv8n3iozumeBrHNvVZEDF+pkW5d7TAAx+H5HVRUdwdoe0PBoeR5OxhbfFMJqe40UX
 BdX6I23v/cAINW3+goElUcRVcefmRXmVMtFIFewh/hKcFzCb9LcyYzz2Tz9dT1YyMP
 O0tde9TwEL0NA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id EAAABA0076;
 Thu,  3 Jun 2021 19:51:30 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id B86BC400A4;
 Thu,  3 Jun 2021 19:51:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ONU+arOF";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWQ5a6Gtswg4sHE7PGfV6mSF5PTNuGcbgQpSHl1zuN8xhfeeI7Vga4gr+YQSJFJCCcapTKDqdfGk4MAHpI5dJDfyGfV+9cvIHXBULwjtcCaPLM/k51yDQNCu7W10YACQoTgVyoA3RtDIt9wpQk5BP9f8QJpl5HvTo5ZlIHRWPy0AfJGPrtZBsSSpwin2EGwoIp06vWoASPRz2NMFJ9yaV1o5DB4n/XlKH/hux9tUTk3dJHb+pIcjgztV8hfMg8JgknvnwJ+Pmqvaj9JL6xWt/kFHLLJwqEsgDin1aU2/IqwzZbqH1ZMrn51nchvjmiSwNqD9GHLRfKKjXeFq3cQpiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXsIiJJDVKuF6psILOD1eplkl9hyxwWr8gYCfQyRDEY=;
 b=RWQ2MqSnAEOSdD7IZOnd/693JDV6pD2p1iZy8MHGOaYzBjLY+Dr2VMZTau41OT8Sak+zZvrsZ+Q6i+3Pw+poNpW4LsgWBvgwWEImrpD52OYSPIcssPQzCJLsGrKJkIZAqwdVapFxQ1K4ewRQLvCskSO4LI8j2aJrCO5WCPJgpKDvUSSP9PpOYObVqEXA11KWb++JKkDRLdEHp0vXWiSsEisjtYicxuT40ZsmPTXD+QP+WDLWNwIZ8PCUy1P17TEwmkBIilqdMi0kcFqpebVOjuio6GOlp/B4HUo0ZVkbWCkkbwkmD6EREJlNJwcwLz5lwofzRz4X9qtPBMH7JsaA4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXsIiJJDVKuF6psILOD1eplkl9hyxwWr8gYCfQyRDEY=;
 b=ONU+arOFCAGYN5N2Nym84UVKWzpG9lkfsJCP9sX79Csd7bUWTaHtaeypPbwBqaIK34iIRB61xaSK/hFLY9K+y349kIsz+GgeOZVjdNdg9ZG36qs3DzeHZDIDURDA2OxbNzdfTGXu4LBinjn3TIzW8LNLNNqHb/xpKmXwofeqgz8=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB3859.namprd12.prod.outlook.com (2603:10b6:a03:1a8::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Thu, 3 Jun
 2021 19:51:26 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4173.033; Thu, 3 Jun 2021
 19:51:26 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "submit@bugs.debian.org" <submit@bugs.debian.org>
CC: arcml <linux-snps-arc@lists.infradead.org>, Guillem Jover
 <guillem@debian.org>, Helmut Grohne <helmut@subdivi.de>
Subject: Debian: libffi: update symbols for ARC
Thread-Topic: Debian: libffi: update symbols for ARC
Thread-Index: AQHXWLHW1Xj5vj2QpUecG+TibI02xA==
Date: Thu, 3 Jun 2021 19:51:25 +0000
Message-ID: <f66e6756-8ed2-a82f-b075-e75267feca7e@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 4cf4e228-13f4-467d-4ec3-08d926c8f8e0
x-ms-traffictypediagnostic: BY5PR12MB3859:
x-microsoft-antispam-prvs: <BY5PR12MB385931C1CB9F92C6255669FCB63C9@BY5PR12MB3859.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:446;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: osnYh3KAnozl6+cY2032N9nFq6/WccSNh++T08M/KTgigD5CzZa9ffK8buT/S62OvI+lsi+1u4juEC5VQCD/aFslhQ9nF6Rae7MPDX9kumKoWWLz8bzbfBFS0hZwKIarIcb61kVrEQ6ta+EM1fxnHXkvkahE39dFu7PeRMB1c+jHomt1MacQZarlxTvRFdqlx+lfWZgHD2R1I972JiZASSF2bX3vyLZns2vCCaBTHNfG18m9vP9gbUmCIj63RHp6xWwI81lUuOzkLBnPDP5FwaKGVOOBXQFw6exkTyB+bLwXyed6NNyY75FPmtAEpORqnXI6nmIXBJ+T2e1xr+Cd/cDoC48TPo4uVFmUjmWa00M2s1mc+zwRHCRjN3QgebzbX3VzonfsyUfEf2uONzMcq/TWsIuZhlLApPR1Aw2k4g5Sfu3PDKnN9iSN+IIcYY0edZamJ8y8CDr2rewM+qYAK4kDFaz5shlKvCkhpt2THa1t23wRluQoC7pvjbjRXNTaLJdgDs9aqGikFbvIWbgPcvCOtn2HT8Ew4c4VNDOpaZY0bCg8RPa05P8w2sed1RAbiXdDxMyPZQhChSPsVfhgChiAoLVgZKYAoyKVEvcYWEnt9r1JAXKRTVHPpAdJJt9w8ME+JnjQAtlrFz+DT0F75BT+kfeE1zPCznFNnVUXfCRFxCCw0Md2jBtMYgpsSHex
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39850400004)(376002)(366004)(136003)(31686004)(316002)(71200400001)(76116006)(6916009)(6512007)(31696002)(186003)(2616005)(8676002)(2906002)(66476007)(66946007)(86362001)(66446008)(558084003)(26005)(66616009)(478600001)(38100700002)(36756003)(6486002)(64756008)(8936002)(5660300002)(99936003)(122000001)(6506007)(4326008)(66556008)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?a0w1VEkrNkJRZlJEZjdxQTNCTUtsODZqc0FPNE1FcVFOY2hoM2xLdUhyM204?=
 =?utf-8?B?VDEzbk0xMm5pcGdpenRlQ2JDRGVQYTdGUlI3ajZPT2NreXdFVGVKNkRjTnhj?=
 =?utf-8?B?Si9ScDh4eGo4RGhwelpuRWhxM3JDNWRpSDNaSmVZSWJpNVpvTlAzNm1CaEox?=
 =?utf-8?B?TWMrZlNMNWxhSG81MkxuZ1d2emw3cDFjR0U4VUQ1UkpVK205cTZVcEhNeENu?=
 =?utf-8?B?dHFkSUdaWmdkSlFPdnhieW9hdktrYVo3MmUrRGQwQUdRNTVyd1BrNTlLelNh?=
 =?utf-8?B?K3pTRGpINHU0aHlVNGJneVM5QVgzTFgrMlozQVpNaFUvSVJaNXhScENEMG8z?=
 =?utf-8?B?VXhJZ0Nqc1NYbUZKblVhWHhHUmxzRlE3N3ZoejZENCt3MU5DUnN4YzB4aWxz?=
 =?utf-8?B?MWJRVHF4RVpoclRnRi8xN1VhenJLVFhHUzROcDVIaE9ZaUl1WE1ZMmRNSzZO?=
 =?utf-8?B?QkhmVGFvNmVqcXU1aWRySnh3aWFzWEROWnRPMGJ0ZmZMVnNCM0lNTndZcXZo?=
 =?utf-8?B?SVJhVnRhcVN5ajVTcjMyMHdybGdsU0gxNG1yMDZ2ZldkRGFSRVdRK1dnL3RC?=
 =?utf-8?B?eGY1YjRiYkpIa0M4aW1uZEpxdk9PVlB4bnpiWVErc3lqTWttQ1Z1NC9MbUpv?=
 =?utf-8?B?SG5NcGdyVURPejVPdnVaaTlSbFVzVGdDZTlTK29RKzhBUEFBMFFzNFNwcnNn?=
 =?utf-8?B?NHZTcFdnQi9mVEF4NW1hRjBNU3VyV2dTMW5KZnlvUU5PaU5ta2dCUlZaSUZz?=
 =?utf-8?B?Z0l1NUtZeGY2NTJPd01FR0xXdTdSRG5jVndOMWt5YXFyZFBvSzdPNzdvc0R2?=
 =?utf-8?B?Y3B4bnU4Rm0yT3FrMVdpazhyd0t5N2ozNW82QXpyY3FkekNycWJEbjdtYjN2?=
 =?utf-8?B?eVdySzhWcG5lZW8rMHhnZGlzVklUbFRnT2FTSlFmQUpuZC82Ky9jZTVyK3h2?=
 =?utf-8?B?YXdLVm82Ync5YWFKRUJWd1RlRkRJQUw4Qis4VmxqZzJQVTlHS0JndGg5OFhu?=
 =?utf-8?B?U2tHcnAzWUp3bk8vKzZScGptZG5SVXJvUklEU3dOOHVvQ1NFekxTbVdGMTdX?=
 =?utf-8?B?YjJEaFIwNWpwdGdqVkhycUh6NkgzT044Yk5ZWFVDL2FRQkJmSVlITVhIVDNi?=
 =?utf-8?B?VWEzdHJiaDh5U2Rkc3lYRlc5YnNFdU90eVMzSjREK1FOeXlwejdtdW9SWFF0?=
 =?utf-8?B?YjM0cnM1T2VFYk9MVnBoVlBNTGN3OXI2ZjNiSVFoVWcxQUxqaDRWekJKN2h1?=
 =?utf-8?B?dWRXQWFrbWt3UWFJaURTeGc5MTZDMk1WcXJJZGU3cEIwTXRzM2o1UDBPVTRI?=
 =?utf-8?B?VVdnRFVyL3diQnkrRjFoWU14UXdIYTNWQ1duVEN0dTFGdFZ4QjROY3NMbmhW?=
 =?utf-8?B?VDV3QWR3TW52M3l2TzNzL2V3VVVzQlRueGxWVE11OUVJY21HL05rd083TUNG?=
 =?utf-8?B?WEkrTDRsS1oweE1XZmVKbnBwZ1dEdFk1MEgyNk1sVDZTWkdlTzZCOWZaZ05G?=
 =?utf-8?B?NW9SZzVqWnltUlhWSTJNRWcrcFpqaGQxanZKK1djb1FiSEVtdUJXN0ptb2JY?=
 =?utf-8?B?M1RmVjhBSjVEZDY0WEpxM1h4NVRYRi85Q3pqeE4xaEhHbXpGUzgrQXYveGE2?=
 =?utf-8?B?M3JTcERreHBLTEh6TFNVTEhrV3MyTFpGOVUwTlQrOCtSdEcveUpMK3BPejlj?=
 =?utf-8?B?NkY1RnZnREl3NUd6ODBua0R5WlRGLzlwWUZTaFlLTGZMNXRTQk9FS3FnTVp4?=
 =?utf-8?Q?4lqdZPbR4/e+M0QJqU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_002_f66e67568ed2a82fb075e75267feca7esynopsyscom_"
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf4e228-13f4-467d-4ec3-08d926c8f8e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 19:51:25.9300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vja9nJx5oTic431jNlrOt6v11n4+ag2CwHJ1ybV6OoaABRqaLpVR9T2ZR8aKK2OB1FvYCX5SZxzqaDjtq32gzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_125136_155971_7A347D58 
X-CRM114-Status: UNSURE (   9.48  )
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
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--_002_f66e67568ed2a82fb075e75267feca7esynopsyscom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <2599457B7C2ABB4ABADE12ED3A30EB6D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

U291cmNlOiBsaWJmZmkNClNldmVyaXR5OiBub3JtYWwNClRhZ3M6IHBhdGNoDQoNCkhpLA0KDQpU
aGlzIGlzIG5lZWRlZCB0byBib290c3RyYXAgYXJjIHBvcnQuDQpQYXRjaCBhdHRhY2hlZC4NCg0K
VGh4LA0KLVZpbmVldA0K

--_002_f66e67568ed2a82fb075e75267feca7esynopsyscom_
Content-Type: text/x-patch; name="libff-arc.patch"
Content-Description: libff-arc.patch
Content-Disposition: attachment; filename="libff-arc.patch"; size=810;
	creation-date="Thu, 03 Jun 2021 19:51:25 GMT";
	modification-date="Thu, 03 Jun 2021 19:51:25 GMT"
Content-ID: <3C9837100E49CA48B5BE9EC1A9DAB487@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

LS0tIGEvZGViaWFuL2xpYmZmaTcuc3ltYm9scy5vcmlnCTIwMjEtMDQtMDIgMDQ6MDQ6MDQuMjkw
NTU0MzY5ICswMDAwDQorKysgYi9kZWJpYW4vbGliZmZpNy5zeW1ib2xzCTIwMjEtMDQtMDIgMDQ6
MDU6NDYuOTE0NTU0MzY5ICswMDAwDQpAQCAtMSw2ICsxLDYgQEANCiBsaWJmZmkuc28uNyBsaWJm
Zmk3ICNNSU5WRVIjDQogIChzeW12ZXIpTElCRkZJX0JBU0VfNy4wIDMuM34yMDE4MDMxMw0KICAo
c3ltdmVyKUxJQkZGSV9DTE9TVVJFXzcuMCAzLjN+MjAxODAzMTMNCi0gKHN5bXZlcnxhcmNoPSFo
cHBhICFpYTY0ICFtNjhrICFuaW9zMiAhcmlzY3Y2NCAhc2g0KUxJQkZGSV9HT19DTE9TVVJFXzcu
MCAzLjN+MjAxODAzMTMNCi0gKHN5bXZlcnxhcmNoPSFocHBhICFpYTY0ICFtNjhrICFtaXBzICFt
aXBzZWwgIW1pcHM2NCAhbWlwczY0ZWwgIW5pb3MyICFwb3dlcnBjICFwb3dlcnBjc3BlICFwcGM2
NCAhcHBjNjRlbCAhcmlzY3Y2NCAhc2g0KUxJQkZGSV9DT01QTEVYXzcuMCAzLjN+MjAxODAzMTMN
CisgKHN5bXZlcnxhcmNoPSFhcmMgIWhwcGEgIWlhNjQgIW02OGsgIW5pb3MyICFyaXNjdjY0ICFz
aDQpTElCRkZJX0dPX0NMT1NVUkVfNy4wIDMuM34yMDE4MDMxMw0KKyAoc3ltdmVyfGFyY2g9IWFy
YyAhaHBwYSAhaWE2NCAhbTY4ayAhbWlwcyAhbWlwc2VsICFtaXBzNjQgIW1pcHM2NGVsICFuaW9z
MiAhcG93ZXJwYyAhcG93ZXJwY3NwZSAhcHBjNjQgIXBwYzY0ZWwgIXJpc2N2NjQgIXNoNClMSUJG
RklfQ09NUExFWF83LjAgMy4zfjIwMTgwMzEzDQogIChzeW12ZXIpTElCRkZJX0JBU0VfNy4xIDMu
M34yMDE4MDMxMw0K

--_002_f66e67568ed2a82fb075e75267feca7esynopsyscom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--_002_f66e67568ed2a82fb075e75267feca7esynopsyscom_--

