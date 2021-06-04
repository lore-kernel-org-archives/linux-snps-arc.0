Return-Path: <SRS0=rV/3=K6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE862C07E94
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 14:06:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F6AD610C7
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 14:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F6AD610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OD7kQynavYQDlELGRfmsZN7NhBD31ZpNZYFe9ZwBW80=; b=CmILXThBigAK8K
	g+O3msME3Bo5DCFqoAisnFIp/KcgyhNjIcHANiO2tbzoG2uIrAoxg8ggEs6xxY18/JKJ4nATk1t8f
	RLX97Uug57ttEkhfYQLY2MBURz9Pkn3gy6jfUxfuFsbs5gyh2sawjDfl93gxASVh0oHxX9EbOkwVx
	ilO2O7RpZgbImc3bDwhfsy6eUPchOiu3QrDswVdGZdwcenewxlVbzR3l3YVT5eMJ7X9aYsS4yzuzi
	y4dNJiWfOtvphaeWusPveFQJ1hsWqKIdgqu2zsq6dNEbABTqLC0G4WuYbeYmLMHJUMkj/TQnU0ru9
	CMkwHNZ0UWuFjd2pslSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpATM-00Dr7k-SN; Fri, 04 Jun 2021 14:06:52 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpASK-00DqUS-EB; Fri, 04 Jun 2021 14:05:53 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8EA63C0948;
 Fri,  4 Jun 2021 14:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622815547; bh=lDc1TXRmxaIu/J3fgNg1AIt0F9QtFw6WMkbSShzi5pU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=IDcL8cPAYVE/evmH68aRvYq+1NPjdX4nR9aB0zBNwgZ+7QOEGoomDkwH+Q5JZSXt5
 wwFuBgNPNucib9nL9CfWmmpTfPUUQVPM7v4pDsPshH0fAz/+bFYw0HTw9hNnHbDGo9
 NOLP0zWXWoCf3st6K0xD3/cSFf8MguCDnRtBvXd7o0aIMom9ElDgTDWlkNFjLuaCE0
 HGOxpc67rHjoxfDE29v65HEu66wsOFqjFv4JqZUAx+OUd81ACUrLXhOlGjv8QDzr0y
 jBrlCFJX2fcvp492GXvbGr1/bE/7u82YMStIj+0xAseCfDJV9tof5wC0tw7P4t6Ia2
 bNat2dQ/Nv6Yg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id D3329A0096;
 Fri,  4 Jun 2021 14:05:36 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0A2DB802D7;
 Fri,  4 Jun 2021 14:05:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="EIfqmYGn";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KE+c4CEAWb07/XAqgCtBEq6Z54auUpBN0HCyrGKSVwXEpi4C/mke4Lx5lywul+zPQlSZiSK/gZA2RA6T1eZl7yoNlYWs7C2mUedk3PzZdqkkvFlOem2SHn4cNnJrIpS57lb621xXJy72CjYd/spFa/JKKIR41JsbeZ7dx14KZUezz+8Cc2VDBDIvbwDCxWOFa5uuTGQ4kJK7zOLFey0PSCeh+aTv0jWAyvfTz52s/a2KTQ1/imdcw1IOUuG3Y5k77P2YMTFUkk9Y8ytL91aa1KomBvnF2NqIIBsbn6lBaJhxPUAAjpffltwPo8kgS3jzIsYVG4CW0b/ESnslCwIDNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDc1TXRmxaIu/J3fgNg1AIt0F9QtFw6WMkbSShzi5pU=;
 b=hqEWSHKl7WD91bUSH7/81bCNIKnbjIyUBh7mDVeg3LBVGoc2Td6YLX3EROhCECilLGkB/TUSHzJX8yiu2OJHYKsoSQ6qDztsAQzqjfeOVlYL180MdpEGMRnOphgVaGGd1V1Pqt+w3UmuwRnAMPyecwnirJx8+xQBclkYcumY5y2cbPHiVjGtCBHnFHClW42YuVVBCoopVuBBJ6TkNoXh5GtDAcbifCG9xoiaVmrl4GvrG9t1z+tlF2usR/myH5RTwvxGGTExK+e9V6VXPnNFJbo+8SmKx06LIN5qn+ohwiIAqdOeXHcg0+xrBToVDxDpXIS1zvcGKSxU1CJ0QirgKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDc1TXRmxaIu/J3fgNg1AIt0F9QtFw6WMkbSShzi5pU=;
 b=EIfqmYGn+tPSE4EBSd5N5Mo/W2wS8KvGTY3jamO5svHMieI11ILFqd1aGhwaarm0xj2y4T/EYustdnf+OI8iVOQowaJoRbvAH2wOMKmEDkAiGTqXFoz1b86vvn4djM31DKkEsCiQyafV76Aj9jCHx8Ob2M3EtomSW3KshrwrdHM=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4919.namprd12.prod.outlook.com (2603:10b6:a03:1d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 4 Jun
 2021 14:05:29 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4173.033; Fri, 4 Jun 2021
 14:05:29 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jonathan Corbet <corbet@lwn.net>, 
 Matt Turner <mattst88@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>, Richard
 Henderson <rth@twiddle.net>, "kexec@lists.infradead.org"
 <kexec@lists.infradead.org>, "linux-alpha@vger.kernel.org"
 <linux-alpha@vger.kernel.org>, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-ia64@vger.kernel.org"
 <linux-ia64@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-m68k@lists.linux-m68k.org"
 <linux-m68k@lists.linux-m68k.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
Subject: Re: [PATCH v2 2/9] arc: update comment about HIGHMEM implementation
Thread-Topic: [PATCH v2 2/9] arc: update comment about HIGHMEM implementation
Thread-Index: AQHXWQ3SLXGjgTsRn0u+dr1cGNF2WqsD4z2A
Date: Fri, 4 Jun 2021 14:05:29 +0000
Message-ID: <f8d4e27b-7b3e-8412-9897-ab3b6aed5725@synopsys.com>
References: <20210604064916.26580-1-rppt@kernel.org>
 <20210604064916.26580-3-rppt@kernel.org>
In-Reply-To: <20210604064916.26580-3-rppt@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bef1fea-83f5-4fe9-9116-08d92761cf60
x-ms-traffictypediagnostic: BY5PR12MB4919:
x-microsoft-antispam-prvs: <BY5PR12MB49190E8E88D86ADCA8373B9AB63B9@BY5PR12MB4919.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IjKz2Ldw4gomkfoFpCtLSFsQcV5+/7xWCJH+9FA++rEqrdvmFy/F7h09PEjWTjBK7tNlFBCFaefbv0ME+KnJsuq3QQliJgfWYCSc3sPxFb8XEiaXJBGez9BtuwqnFJjKnq/slYDcwSnStVQN6daWiMC2Nob34KnFyn0ozcwcd+VpMy0OR0ozDGItmr7zC5DsUbgRiuvUFD8JGNIJ4RJpor67vERhJqwwe1b8ToWT4KJiw8fylifbJhXV0A5uaG1lUmetqBrEChd6JF9kv4aBdAzoxea7xAkiE9XzNv9CXWLNCyVp4EvNcD6KVEwG+URaCPGT+2oYd9d3gL4TVAsDqPCrex5t+ZKQCPFdYRB91ZUVfu1lzMU0hLJ/96KOHph++nq8jQM1XX7c5mNmQiD4IagHzUDMZQgXAz1cfVE3cHTUzw92Royey0aoRpHoc4jRska7DnuexTf8IplJgyIZJUVW4Yh0vjk/Mlr0Em6M0lsleh7W4b3Y9CITChSrFZIMwWYmQ5rQ3BilGH4W+4s1lvTSsfSMpl3elqmymM53P5mJRzftn+yI8DUrNqhpWCRiaFCPK8JAXN88LbHIs20yFI3nABz5HZfKrcWeELVrfBjujnN3lA3O0ndeMfquTVdPScwYmC8v3aCm8VEIklzUsFDiy/sM3ZrwrXYtVBWourfoxTa8gO1wxOl7s6hE1/e8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(366004)(396003)(39860400002)(31686004)(6506007)(4326008)(66946007)(76116006)(7416002)(122000001)(6486002)(31696002)(86362001)(54906003)(38100700002)(83380400001)(316002)(36756003)(110136005)(71200400001)(478600001)(6512007)(8676002)(186003)(26005)(5660300002)(2616005)(2906002)(66476007)(66556008)(15650500001)(53546011)(66446008)(64756008)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SDFJNGNjQWF2V3dLOXpOekwzZ09GMzQ0TENjRm54Y3YxVVdBWHBOWkNGZFU5?=
 =?utf-8?B?cW5ZNHl3UjFEVmVzQ0U3THp0K3NrTXJuSW1ndDVFM1BINXlSR3FUcFRMQ3NU?=
 =?utf-8?B?bmVlc0dEWmJxYWh0b2lta0FOVkM3ZWdXSk95V1dlLzkzbkJuYWdRSU9SOWhz?=
 =?utf-8?B?WUF4b29yK2tUazdBcVpQZU54R0RWVyt5T3ZXOUJBMjZ2OURwaEZORjYvSThI?=
 =?utf-8?B?UldITUgySmN2YnVFUzdaTkVKeFJCaEYxNzdsaGs0QlU4ZktFeUJtNEIyVXVN?=
 =?utf-8?B?K0h3MkhscXNibGNzaGZnMHdDcUFQamRjYXNta2JuTUZVeS9nNDY5b25uT2p0?=
 =?utf-8?B?T0dySnpJd3EvaTFKWFY0SEQ4akJRbXY4Y2dEZWdpRFVZZ2Jwd0c1SVhPc2gv?=
 =?utf-8?B?R3FsNGNObnVyM0hsamp2bU5MU0I3dVRtYXdseDc3dHJHK1FFUWtqcEFNWi9C?=
 =?utf-8?B?cTVNZ1FOeDRWbFNnQVpuK2wxRE9aMGUycklQV3pQRE5iZy9CRnR3V2VvM1pN?=
 =?utf-8?B?TlhJNTBqaG54Z2xDaTNqQ2pGeG1HaDkvMnhFc1A0U25rUXhtWlArR0czQUVq?=
 =?utf-8?B?d0IvVEp2eU4vd3dWT29QaWdxTktZSDdtZmJBYk10Q0d1L3ZCVWtiNW5WWHgw?=
 =?utf-8?B?enhlc0hvbnlOcDBKOFRqYms2YUc2QUUreG1MQ2hxZlFFQUFYTGZNdyszUjQv?=
 =?utf-8?B?WXBpRkdjdWtUeThkQUgxQTA3RlU3Nnc3bzhyK0tjS0NvRjJhenZEUTFGK0w1?=
 =?utf-8?B?MVY3QzlqZURFeFZWTTN2bDQ4Q2Y4YUF3b2RyYTFyQ3R5ZnF2ZWpqYmk5cjNP?=
 =?utf-8?B?WVlFeWRCMG9VTkRhUE1BNkM1RHgwOUdhS2J1NXVHTC9nTUowR0VyU05vN1Ji?=
 =?utf-8?B?V3YxYTFiV3JWaVpRTlBDUGpjYWt2c0hRQTVYMm1lWXBQaVlxNWU2QmduTEYz?=
 =?utf-8?B?WjlkMGlPbUwrSkwyd0VRUms5cGJ5SEJpRlNreUw0ZjNiOWI1Ny9HaktmenJI?=
 =?utf-8?B?Q3hVSW5YS2E5ZW5maWR3VXZSbURwT3pDekdpMFNueXJ1WC8vbjRPVWt6emVS?=
 =?utf-8?B?SW9GZzVDeDV2TUdyek9icjVjYm96Z05HcDFoamlLVjNGeG9LQlZnRWhQUDJT?=
 =?utf-8?B?UXNwaUZER002Y0tzQnZJcVVPTE0rS2p2UDg1M1BUUVU3bHRjQjg1TDBVSDBL?=
 =?utf-8?B?WGFCZ2FYYjhacHBmQ201OUxvczQ5dHY2MTZJQmFzVEhzbWJCY2ZxQU93UkxV?=
 =?utf-8?B?bXNRbFZITVo1UTRDaEhtbEFadHBESE5QNGFHSUMrU09RTmhqcFIrdHVJbmFO?=
 =?utf-8?B?V0srWm8vYnd1UEYyRndIMldtV1Bsakt4N1F3Y09KSEt4WGhwQ1hBY1ZlWEcr?=
 =?utf-8?B?Wld0enhsSEdVTUQya3ZxT0ZKZnpEVk80V2lveGQ4b3FrZGVzLzQwTkRFSkpI?=
 =?utf-8?B?bGFRWTM4ZVdZeXdERmczQkFJUEV4Sk9zR3l1WG1UNE9ORG9TeGFYSkFoclFr?=
 =?utf-8?B?QmhMRzhyUmZtai9pVFFHZWl3Q1RZTWdQZ012Vk5hR0ZjYklQZnNEUjdPNnJT?=
 =?utf-8?B?dlo0WGpQdjFTWW5MSnFwSzRXbXV4aDBGKzNhUk53Q1RCQUgwenBDREtsUVZp?=
 =?utf-8?B?SVZVR2JSY2tmb08yLzNHS0pyRXBjdk5uRmt3S3Vhek4ra1ZCSWpJd3IremxP?=
 =?utf-8?B?OFFTaW54czJWeVVReTllNVZTdDRjTnQxRzJBcVlTRmNBRnJ2VFBKMzJwZVp5?=
 =?utf-8?Q?zWhVVsxKaP/VGygzWejq4syepZxntFAIpPuIhfM?=
x-ms-exchange-transport-forked: True
Content-ID: <0E3C551B69CF23418C2D5E10015FF616@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bef1fea-83f5-4fe9-9116-08d92761cf60
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 14:05:29.2729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y3XhvvKnucGxpLE3grPWcFd4371K2+4B9HRXQRvZX1BlX+QOt/T6IWP1/ijOZ3T11ZyD4T64mYszpMzrds/Aqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4919
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_070548_586245_0AB45115 
X-CRM114-Status: GOOD (  24.35  )
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

On 6/3/21 11:49 PM, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> Arc does not use DISCONTIGMEM to implement high memory, update the comment
> describing how high memory works to reflect this.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Acked-by: Vineet Gupta <vgupta@synopsys.com>

Thx,
-Vineet

> ---
>   arch/arc/mm/init.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
> index e2ed355438c9..397a201adfe3 100644
> --- a/arch/arc/mm/init.c
> +++ b/arch/arc/mm/init.c
> @@ -139,16 +139,13 @@ void __init setup_arch_memory(void)
>   
>   #ifdef CONFIG_HIGHMEM
>   	/*
> -	 * Populate a new node with highmem
> -	 *
>   	 * On ARC (w/o PAE) HIGHMEM addresses are actually smaller (0 based)
> -	 * than addresses in normal ala low memory (0x8000_0000 based).
> +	 * than addresses in normal aka low memory (0x8000_0000 based).
>   	 * Even with PAE, the huge peripheral space hole would waste a lot of
> -	 * mem with single mem_map[]. This warrants a mem_map per region design.
> -	 * Thus HIGHMEM on ARC is imlemented with DISCONTIGMEM.
> -	 *
> -	 * DISCONTIGMEM in turns requires multiple nodes. node 0 above is
> -	 * populated with normal memory zone while node 1 only has highmem
> +	 * mem with single contiguous mem_map[].
> +	 * Thus when HIGHMEM on ARC is enabled the memory map corresponding
> +	 * to the hole is freed and ARC specific version of pfn_valid()
> +	 * handles the hole in the memory map.
>   	 */
>   #ifdef CONFIG_DISCONTIGMEM
>   	node_set_online(1);

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
