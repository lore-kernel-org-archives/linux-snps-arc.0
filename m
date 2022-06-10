Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F00BC43334
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jun 2022 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jjTXvfkjJRAxjdmgLXgnZqQNeq1pQneMU0nI2A2rjBc=; b=jbTExK/0HkVRgu
	Tx6D6NBmL8zUziGdxZ7goK54w0rz6W+g24MxHQiW6a+4Hfz1AkZ9TgxbuCkhmZ66IQD745AMo9RUY
	qb51cBiaXZrON67S5QYxD1O15iB1vqaFSPvrQfwgyVY5ErYnd0iXET1OdbutnQkxbEFRnvWbsjxTF
	K1/60riEyWKu060yIs/wV+tpIj7mmhKGWqV7v4OV6j0Bl0PxZDJiR89rs9BED0zmbOY2pYQ4Dt1Lb
	XyiV53upZZ5B814qlWET8m2ec3i7+GGkmpSDvwI1dg48/9g0zOAel7yCF/V9BJ1+WAUtPYrsYDd8D
	bzJQCp5HCNDelCHm4dOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzeLp-008HxO-7q; Fri, 10 Jun 2022 13:06:57 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzeLl-008HuO-Vi
	for linux-snps-arc@lists.infradead.org; Fri, 10 Jun 2022 13:06:55 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A23A040AB7;
	Fri, 10 Jun 2022 13:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1654866411; bh=C62HX7czJ45PoyqOlH/n7NrdO+QXIpha5gHwiMFQe7E=;
	h=From:To:CC:Subject:Date:From;
	b=IZD6fgIP3aL6hxIZcdx7gYwjkumLIx5TvmPEbcWmff4UfOzhRSHCVIJWBM29NdoJ+
	 /9cfT2rOX1eJZSEmWSdG789Nw8maCdxiHg5EdC53oXW5iqh2y6DNuQYrYv/9ZEknz5
	 sC/S3ddk6avCPvuD4hKv5MdUG9oa6tFt2ZcHvcMLh0zJy+XuL29RAx8tQkGgmVYurX
	 HfXp2fzHxrnrNGHVf+f/tsta2HTpkzhutlmVzp7LBLYHzRwtt6bX3hQTWKwnyuLBZo
	 5WBemm8r82yk0WkY0cm7ARlS+wFOB4hlW+vW77gjyRdvwf8vY3r9AlHCeraG3USe5J
	 t+Q+xGkycgF5w==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 8A561A005C;
	Fri, 10 Jun 2022 13:06:50 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 358CD80002;
	Fri, 10 Jun 2022 13:06:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ljCsOTBZ";
	dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clOaA7tjkbl5Cl9bk3gBEnOP59NrP/wv6mzH6UjsNc6PaY7GdR7wILv7ej7edXp39VF8OUmwWFnAFZa8TM+J++hY7CKKNMV3xGWT/YeA2ffRhJlxZTgQQcKUm/sFzZbVgmDnzDreASvhuIhRTUnCA4wniVoB/+1QGqFb63TlZTf86gGtDLvn8yTFstgdXbuCdBFt0/GJ3yFT1hcuWrKgNxG0Q6m9m6lOKOZsgwv+FC5ZgJizUcHS0SBXCE4EvVSj+KvI6UJjSW98qPDDAvowR2yY4At0kamBhwh3lif77hinLW8Tet2CwcD10r77NhvqmLmwfMTAIKQd04qbocgUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C62HX7czJ45PoyqOlH/n7NrdO+QXIpha5gHwiMFQe7E=;
 b=YrfSwvk4uBNhb/QwY8kC0d26ZEvNPToW/yCYV9Tclq8vEm1yje3GdKJSJrWe7MUUgD7p5xr6Rsy13ECXySb7SKp5TdnYhUIuTCUinZD170lXfoDoz4ka8jmT84nqqcQ5rpKDXbPibMD/wloNSWmy0NJyKf5hbWR3gn6uABu2OSjdcq1PDtgIIQdAIaJomlgXKZ/hvdeJ/u2qUCg4XiQQdhFW4OwR2qPtw94GF2rq4H7FO6AQ0mmGUSJDIVm+HSilsdiSMJ8jimwLIU7/8r+52AdHVs4c1JYhVZiEPd4EX+hdyd1Z0igY/oV982aw0m0GRnAtkaAJ/5mCN6DX4DLx+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C62HX7czJ45PoyqOlH/n7NrdO+QXIpha5gHwiMFQe7E=;
 b=ljCsOTBZQ+41rsRUym8Er/22mQsH7uBNToMdfqJM9i/kLxqIQUIDb30j02J789cZVGN17pfab3VzyVCAa3ylN6+/BnORb3RJM0uNgCpPH+aGnoEOl+WDQJMRtg/eD7oshGkKjZDvGnWKKQnoQOD6C10ieqaVFCzMD+wmovtl7fI=
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by BYAPR12MB3558.namprd12.prod.outlook.com (2603:10b6:a03:aa::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 13:06:44 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::1175:61f1:71e9:2038]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::1175:61f1:71e9:2038%6]) with mapi id 15.20.5314.019; Fri, 10 Jun 2022
 13:06:44 +0000
X-SNPS-Relay: synopsys.com
From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: [PATCH] package/bpftool: add a patch to fix cross compilation
Thread-Topic: [PATCH] package/bpftool: add a patch to fix cross compilation
Thread-Index: AQHYfMrvfBx90GUSbU2T8ai7WLSsGQ==
Date: Fri, 10 Jun 2022 13:06:44 +0000
Message-ID: <304ec481-de9b-6bcf-bb76-f9c1a7ae92a3@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98ef1b2f-3ac7-441d-ed29-08da4ae211d1
x-ms-traffictypediagnostic: BYAPR12MB3558:EE_
x-microsoft-antispam-prvs:  <BYAPR12MB3558CDD80DB0CD6C724D1483A6A69@BYAPR12MB3558.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  X4HxM/tsLr8nNTD/kN/MY9VpL4CK7tm9WLh8IFzSjMr54H72lyJY2CIivLUPi/TZcxIX9AyYXLYz2nUiHg9APfSgl2/jyYd8WYzcS/xn2aZK1QYu7duz3d9LRSFGNwxO65jL2jAbAJveRqnAnDD91uRSr6v3bpEjJQYUP0+jHRhiKR4xax4rRRWqoBpAbKpL7E3w6baJBA3RqnSu0RAKSQU/Cawx73X9FmRu2n4AY8FHP6U8IeToCXM6ALLhQovmF0AG1KEJf8To/4XV3vTDFtFitVvwjgjD/ayv4x3ssnOvBenHkIHcO95ds5eRF5XSVgIgHEyBUnoJ4gQ8Qi0/LyzOLGR4/x/Q+nB1LXLEPzJBt8To+lKCWUTduqlKlPU6+lKD+K3Iai36yHw9KfvWmvY8GtfMHa/x2cu+v/teFgsK99m/njB/zCPWk/72zFFyLzGJ4JHDf5qeoetUvwXAJ5FfPUuPeptFrNGc/Ds2ky9Xf+yR7sAD4n8laXuQJzqr7ZJEqc8aQvPVELUKjy/V3hUPtQ9sAkROz9urFG5hbWqE/Usi++am8hoGRdHsVh3vxc7Zl6lT/lQ2PxFvmBKQrsiL+ZMS4la8bqkurVdnMw1YIq1WuKbEQ/fn0fGphLadSIpl8k6y1h+4kdxZ7NGJta+L42yyiUz8n2cLbis8r94f9jI0onLlLr+KPImuWgN8oAHN/XTnQbw3TS+nNMW2aEHSE3XEQucZcbVUarlpodzAAW0E+VnX6Cqk/4HGTw7ZSrfCkEZyv2FF9h9sJw20ui/dwKmvCa32WYG+pypNy2N+B9tA4qA/BH5VJ2yuiH1pMuWdW+VQo4h9qXz9z8h2hA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2782.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(966005)(38070700005)(2906002)(6506007)(122000001)(6916009)(38100700002)(54906003)(316002)(26005)(6512007)(66556008)(8936002)(31696002)(66446008)(508600001)(31686004)(5660300002)(86362001)(64756008)(66476007)(4326008)(66946007)(186003)(2616005)(8676002)(91956017)(71200400001)(76116006)(36756003)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZjMvRFdtMzFHNDM4Rmh1akpFYkNBWHlNWUJaN0ZDcWRONFBsZ2h0SkJYZm0v?=
 =?utf-8?B?WGpHckFPQjVSeWh5bGFzTzVUeE9vdGo1eTB4enIxZTd1L2xsK0pYazQ4OUFi?=
 =?utf-8?B?N1cxblY5eVAyRHAvK3ZmZ2d6ek9HQW11SVpMdHZaMmo0VnMxZlR0bExEVTZx?=
 =?utf-8?B?dnNEOXhLTTBKajBvT3ptbHFWQU0rc2ZMT1VPcXRQSDJwU0gvcWMveFpLSG9N?=
 =?utf-8?B?dzViclpyYThzS1dpWjdXQVpKaVFOSEYrb0l5TUJGSCtoQVBkNmJWVkg2TkFM?=
 =?utf-8?B?TnM2WmpQTlVqYTR1M0tteFVBQ0NoYVMvYlE1SW5nRkx4OGtsSElRYi8rMGVx?=
 =?utf-8?B?K1BNOWdHQ0U1a2JlWjMraGE1WTZsL2JnNmJTTklRQVFkYk1MMnZseDZvcDFV?=
 =?utf-8?B?ejIwTGkxdHVWTXg5R2w3VG14VWRVZURpMkxSdmdKZkFDMFhKRlNmblhieHhF?=
 =?utf-8?B?b3VkTnIvb3BYTUw5YW1PeXVWVkJNMFRaVExwSWZ0ZmVpZDdrSlVXZ29wSDMx?=
 =?utf-8?B?dXV5ekNmODk0NXRlMGdsMVJwSTZxUytFakhwRDcvSHZzYSthLzBlajk4RVZ2?=
 =?utf-8?B?Q2I3ekpZSkxJajJoSmYwN2tMQVBvVVM2VFNoRGVFNHF1Ny9QdHN2eGovRTNV?=
 =?utf-8?B?MHBmMld5RUk1UTVMaU1JbThGbGwyQzNwRW1ZMkhqcDBNQUtnL20rWlVWN1I1?=
 =?utf-8?B?UEtNWk9HaDcrdk9OYWhFcVJod1phREJFUFVrdEpMWWVBandKT2Q2eTI4YURa?=
 =?utf-8?B?czBlN21EMTJsb0loSjNHRjVKbFdLVjVraDZxR1NVellyblg3aXdhUWxVT256?=
 =?utf-8?B?VG9PSlEzc2tLT05MSy92RFNVeSs2N2J4eWE3dU9JSHR4L1A3ZzJQdWpwSzFC?=
 =?utf-8?B?K1JvY1lHZjlQY1dmTlBRK0JLZEtqamtNUTI3TXhiMFVBSlhqeVcreFBQZnNE?=
 =?utf-8?B?ZkZRK3BWaHB1K1BCOE1rbTJlWmpEa1ZabU4yRGxZRlBTMThDaVpMaWc1V2g1?=
 =?utf-8?B?UHB2ZUdqNTUvdHdYbXZrNzV1UWEyNzk0azZMSDZJTTBScVJ2RStzK1NHc0Ny?=
 =?utf-8?B?cG11VlZQaklia1J5N2k2RFdJOVE0YUdsYktJU0ZGdGkySVg5cWY2cGJnTHNJ?=
 =?utf-8?B?OTE3S3JJVkJoSzFpK1FWZnlUMDVWTTZrc0RBQVNCVWN4Yys3YlJyblNiYjdH?=
 =?utf-8?B?WHc2ekNsMXpDb1VSeEVxTE1Yeld1dkRkMXZWQ0lKYnlvRGVEL0R0TU9Iano5?=
 =?utf-8?B?cFJoV0FadDdoeTY1QTJSVTdBbTlzU0dxWEQxUk9VcUtMN2dNMHBab3ROZHRM?=
 =?utf-8?B?LzdkMXI1aHhydktSeUE1QldXRTRaVkZiOStlU21OYmZ2MTZXSndsbkhzd2dJ?=
 =?utf-8?B?aGptMm9BVFAyRjhtblNBUTAvdlJSQzNNQjRaS045dWIxWkxqMVEzRDhCMm1E?=
 =?utf-8?B?YVFDNDluaUt1cU9kZGxrR1ZEMmxEWTRoUWdkQ2M1eitzczN4QjhqTWtRYUVQ?=
 =?utf-8?B?eXg2NmlDQm9MRSsyWTdPdFd1dXZ0WGdnREdLTGJhRnIwMUwrM2JGR2RudzVX?=
 =?utf-8?B?RXVrQXQvdVFDSWtUQzlDa0tEZi9pK3JxaVArcTVIeE1sWkcreDNSOCtlc1pj?=
 =?utf-8?B?MFc2RHJWVXV2RUkvUWErbGd5S2dBRkpxYVhnTGlyOUxiY0E2alZRUDF5bWEz?=
 =?utf-8?B?VHJaK1VHbDU2TlVWS0RoaW1xNDllVWQzeWJJUUJzRFFpSzJidlBHeUNGN1pr?=
 =?utf-8?B?dVRDNmcyaVB6dlZXNlpKYjhqa0RCSkc3dy9kcTUveGorMWJsRW54YkFGMDBl?=
 =?utf-8?B?OVUyeGJrdUFPS282ODBaVW11QXFHQ2djOGJPV0Z6RVBTSEFOY01ySWdaQ0NS?=
 =?utf-8?B?OGRSNGQrNDdFT0NZTHhqL3MxR2JxSUhBUVBJM0lpdWtFNUhjeW5XV0N2Nlpi?=
 =?utf-8?B?QnpMRFRCamYwZUpFUloyR0VrWTdvRTEvV2lScENTaXlZbEZJcXhpTHE1eHY2?=
 =?utf-8?B?ZlJqai9XYWl3L2g2Y2N5b05wWnNENWg2cFFiWk9xdGtTN3R3bG5JR0JsZDIr?=
 =?utf-8?B?UjBWV1RIaGdzNEZJVjdjeGJPUWsvYjhEakduSXdwcEt3Q21nY1ZvL0JMcmdT?=
 =?utf-8?B?Nm1WYWxaYW13M2dSOGVhSTJTWStscm9qMU1aSTBYbTN0ditTZDQ0TWhLR0tD?=
 =?utf-8?B?Mk9aWG8vN2piMmRwQlpiTXFiRkZrMnlDVForTEQ0SmRMcGxRcXdoZkUzbW5Z?=
 =?utf-8?B?Rnpxdk5ScUo4V3puZUNiVWNPc2pyOUVUSStLeTh2QmtQU2gxaEgxam9Ya3g1?=
 =?utf-8?B?RXpieWtGcjZkOXRRQU9nQlZkT1o1S0RDVEtiNU9URVdGTkd5ZStuQT09?=
Content-ID: <555EF8B0F523B846B9AD3DF58682D031@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ef1b2f-3ac7-441d-ed29-08da4ae211d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 13:06:44.7756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +UrI+3XMmRSaWvi7fivyZKdvG4SwsnzTDSCiJ/Q/CPcj0JuUw2Qygb5WmJijZWom07U23A/9udCtaeQMM8NjZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_060654_102049_A8DC107B 
X-CRM114-Status: GOOD (  16.06  )
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

If on the host machine the "co-re" is supported, bpftool will
build a bootstrap version of itself as well. In that case, the
cross compilation can fail. This commit adds a patch to remedy
that. The fix that you see here is already upsteamed [1].

[1]
https://lore.kernel.org/bpf/165477661272.11342.13015777410417612477.git-patchwork-notify@kernel.org/T/#t

Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
---
 package/bpftool/0001-fix-bootsrap.patch | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/bpftool/0001-fix-bootsrap.patch

diff --git a/package/bpftool/0001-fix-bootsrap.patch b/package/bpftool/0001-fix-bootsrap.patch
new file mode 100644
index 0000000000..03f4231cca
--- /dev/null
+++ b/package/bpftool/0001-fix-bootsrap.patch
@@ -0,0 +1,32 @@
+This is an adapted version of an upstreamed patch [1], else it won't be
+possible to cross compile bpftool if "clang-bpf-co-re" feature is enabled.
+
+[1] bpftool: Fix bootstrapping during a cross compilation
+https://lore.kernel.org/bpf/8d297f0c-cfd0-ef6f-3970-6dddb3d9a87a@synopsys.com/t/#u
+--- bpftool-v6.8.0/src/Makefile
++++ bpftool-v6.8.0/src/Makefile
+@@ -51,7 +51,7 @@
+ $(LIBBPF_BOOTSTRAP): $(wildcard $(BPF_DIR)/*.[ch] $(BPF_DIR)/Makefile) | $(LIBBPF_BOOTSTRAP_OUTPUT)
+ 	$(Q)$(MAKE) -C $(BPF_DIR) OBJDIR=$(patsubst %/,%,$(LIBBPF_BOOTSTRAP_OUTPUT)) \
+ 		PREFIX=$(LIBBPF_BOOTSTRAP_DESTDIR:/=) \
+-		ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD) $@ install_headers
++		ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD) AR=$(HOSTAR) $@ install_headers
+ 
+ $(LIBBPF_BOOTSTRAP_INTERNAL_HDRS): $(LIBBPF_BOOTSTRAP_HDRS_DIR)/%.h: $(BPF_DIR)/%.h | $(LIBBPF_BOOTSTRAP_HDRS_DIR)
+ 	$(call QUIET_INSTALL, $@)
+--- bpftool-v6.8.0/src/Makefile.include
++++ bpftool-v6.8.0/src/Makefile.include
+@@ -12,11 +12,13 @@
+ ifneq ($(LLVM),)
+   $(if $(findstring default,$(origin CC)),$(eval CC := clang$(LLVM_VERSION)))
+   $(if $(findstring default,$(origin LD)),$(eval LD := ld.lld$(LLVM_VERSION)))
++  HOSTAR ?= llvm-ar
+   HOSTCC ?= clang
+   HOSTLD ?= ld.lld
+ else
+   $(if $(findstring default,$(origin CC)),$(eval CC = $(CROSS_COMPILE)$(CC)))
+   $(if $(findstring default,$(origin LD)),$(eval LD = $(CROSS_COMPILE)$(LD)))
++  HOSTAR ?= ar
+   HOSTCC ?= gcc
+   HOSTLD ?= ld
+ endif
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
