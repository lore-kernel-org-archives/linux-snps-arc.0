Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CCEC43334
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jun 2022 12:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uYbN9wok6CIQqSXKckV0NLELqOawlJGLdTjVM9Y54l0=; b=ZTyF8vOS9yZCI+
	VvTygbI1lfKKkdAGA4AQHzOZiDty7/pxW8uXzPlgQ9Qe+2jf03sBoUPWEAPw4dS/X2ylts4crIjbj
	J2pd9+pf0CsWLqBF41mrpH/YQtsenaABsDQ1+qJZQEoakMRWcTC6yIH3z6iP8QRf/t4wYIWNQHRIn
	IphsmJI1K2UjylH12b4jm/S0p4EfmrE8QUYRf3ek8yD/sIp3BIbW7Op1Jh8nbKYKbjGn+SRNx8PGS
	DcUBX6f/K/pzBmrFPlbz9dgU/JBEmRHkz/fu3oM/iIIGRChaCGPjPbWxbCwvfBMtWffcwN5h+Iqa6
	F8j9/DdHZ/l2VSrnc/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdxP-008D5C-02; Fri, 10 Jun 2022 12:41:43 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdxM-008D3Y-9G
	for linux-snps-arc@lists.infradead.org; Fri, 10 Jun 2022 12:41:42 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 244DEC03D6;
	Fri, 10 Jun 2022 12:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1654864892; bh=KGmNIRbl58SgrKiyml8lOA0b0q2P3DMMVcSwzblwHcg=;
	h=From:To:CC:Subject:Date:From;
	b=kZGJy4vsCC4SBLQZQjtbZ3GbKc6BLClwyoUdry/OuhHnxEJiwoW2G3EeChLm2ZcwJ
	 uYJoaYFdfcqmJf9rMccmg4K6Gf151pcYEv63+sfLp2TAZsPVfQmbptCzeHIkWnjZDq
	 jr6uigXeJ4dhINrPwOWyBiX1Z4bokENpTBGESk/x7+iMthSUNgUTyqEO86rxqGl1Y0
	 811u7Gj2y3pue/+GcIl/Lq93GXQhz5+yV0R8/ZT5l/l5WN3CYWW9YgDzcw5LE/IifR
	 qaQmrbA3NAKXJkQw3apKkvko1Lij/m7ZIy8hs/7/KQd83gp8zyABPbKbhRuyL9pcIu
	 kehYsYHyBQdvA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3F7D2A005C;
	Fri, 10 Jun 2022 12:41:28 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4359C40060;
	Fri, 10 Jun 2022 12:41:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="RL+0lnsP";
	dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpA+xzD65ILPR0mrFTbjeK6h8d0V3z/0SMlJXUIAV/1ZvxAz+2huTm+zLR2+9XwKaqocRiw974fdLnd4qhZxD71qhZEeUi0BkEx2YtFWxg9JnuvGguq5M9xSn2XEvgbNGRTQ+TlFUKWI5fRNIiWByhEvKH9oCgUgcFszUBkFr7J8RcUR/3quyWoI/F4kYND0ctEic+AFLxPkVyRobM6ms3ahArqaH6iL7ZuE3wXrYqsIHiotZ6JGKKoin9JewV5wf8irWxBNI/b6NdUpmt9O13hv4slFJEd83vL1ZwNIgO3HDdZoZqbscajc88yfGTF21kOTwBihn5gtZ+UcEqOycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGmNIRbl58SgrKiyml8lOA0b0q2P3DMMVcSwzblwHcg=;
 b=fo5tkeWYK8EDQYvGRPJybQJQIoHtgmccsGfBkT5OdiGbPG0KK4RMqZmneJNqy4SCaspnA76x8gOpSm332bf1T3C84mIaPEBIRyz7gTBnnkJGGJqFiPrNI9DLCxs0L9RHWpLt5Lg7W4WbeMJ0lVtJ/La1uIMDJ4kNzussqd55IBsO4b1kSvTQzYW56dfdpuz1Dd8dHn9inTRxq+EeaoYczA8mM3f+/gL4m9AThiXo9UPnUWk/E60G3/X8IGoQesWkDdg7X/vzkwpA2Xz3g1yhjdz9UM8xFFE/b71VfavDKoR0edgJoExWdE7adaigfDDlzDwiz9wa4uX5id7XoavtTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGmNIRbl58SgrKiyml8lOA0b0q2P3DMMVcSwzblwHcg=;
 b=RL+0lnsPAKHkRFbLD80rUdL5Q0asGEu9da8MEqW3IJzLVRqVxMT7Qb8dT2cac08bAuwcXI3Zzs/6Jzd2Lj1WZrrjH6w8TA1nEKDROL9jP66D+CnQIG6gwRnR1xmfj9B2RoUMPiPwR/hxaW///b+fEX+me+HiIco9ngNVboBTnOA=
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by DM6PR12MB3417.namprd12.prod.outlook.com (2603:10b6:5:118::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.16; Fri, 10 Jun
 2022 12:41:23 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::1175:61f1:71e9:2038]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::1175:61f1:71e9:2038%6]) with mapi id 15.20.5314.019; Fri, 10 Jun 2022
 12:41:23 +0000
X-SNPS-Relay: synopsys.com
From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: [PATCH] package/bpftool: add a patch to fix cross compilation
Thread-Topic: [PATCH] package/bpftool: add a patch to fix cross compilation
Thread-Index: AQHYfMdkpmuDVy5DA0uK5vivScNFfg==
Date: Fri, 10 Jun 2022 12:41:23 +0000
Message-ID: <3313bb71-8a5c-f34c-82c5-8f91c72ead28@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58e2fcb7-5f57-41cb-f83b-08da4ade8704
x-ms-traffictypediagnostic: DM6PR12MB3417:EE_
x-microsoft-antispam-prvs:  <DM6PR12MB341780C51A66C00229EB65D5A6A69@DM6PR12MB3417.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Qv/XMSWtdO84Z73w1dMafA+r6Dtg7ImDCjMdZC8RU0pZEoRQRqcW87FuhpFf7u1QMvCPzBdX1RL9op1sW2FjaTIHxcqUKlkaAoKAcBDQx2IhTlr1BGJf5HnoGIW6ulI1rWPBLxeJd4z1CjqovqXF+Zj1VFqopigksCf/gfE0qRrx5YJt9luCd9/Nvz983HUNjR1GltEeusDyZUCHXdB/fBsJo1I7+C5V1eugWc+Ax4Z0XF0DayMOSS4UYTDrfSkS70n2ksyIpyjv+g8s4cZefL6J2kK0hoyCuOI8+CU2/jFPgEBXkIew6Fxyhgc8nvMttcpkQgy7FJflQQlnQov08RUxqhOU1bh5H4cQ+jr2/Ve42DM0zCHdC5nV9SbvquqAeMC7SxKf/L/TwpTNu7VqGgdNmtlXikDQ47q9UJDxXu0joQpZtnXeFo4Zu+zYDoomMYT5+uYh+iLzTpDR2KMokvdxYmhuOO31LJBawaVPI2cjr/wpDIlYHvqRgesmmGvOd+T/NR9NxvEMl/ubt9Vqa452IL8yYnqwPq9HwclZhFF7KJvc+IbVVHuhv2Kc85/Lag3h8N2MZr+4Zpl8Cpxkfkd6p8yC03tRauv8SnFcY3xcqJx4Ik9C3+NsCQuqP3CjMHcsgTH0HPeVgvbY/O3Gpp/oWUZL1W85Y6qVCP0+3sO8FZ4b0eWIhxk+RTrvSanzFNNdiIPxiJ6tY8C2dZX5M8bA7kUCKEDPWrKINOpm7awRxFGCHfcfGrkP/Yty3WaOS+7k/HrcHoe+QA64LN0R8a+DkijzMNF4bflEfPijEkTN6Z2N/nKsEDE8FTIUPyykBOYUxXaZfaaE3u8tuNsxgg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2782.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(8936002)(54906003)(26005)(186003)(6486002)(966005)(6506007)(38100700002)(508600001)(86362001)(5660300002)(31686004)(36756003)(2906002)(71200400001)(6512007)(122000001)(6916009)(76116006)(66446008)(66556008)(66946007)(64756008)(66476007)(4326008)(8676002)(91956017)(38070700005)(316002)(2616005)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?a1BsK0o5SDgxZkJ6ck8zKzVJQURTYTlQZmFORjN1SHR4aCtwallFYTc3Tkh5?=
 =?utf-8?B?RXZ1MFBiN2tGTjZ2VzdHc2lrc0JTYmlyR25ORGN3OGdEa1Yxb2ozWUdscDBk?=
 =?utf-8?B?RDZFdU1LY3E2d3lwN2h5Ykw0czBsajRuSVhGaERYMHpzT0hKWGlhZHpXc2Zp?=
 =?utf-8?B?cnlLVlNycWlSa1dmYVlJL0RHajY0V1diaG0wRXRsV2hOVkFVTnEvdWhPeEZo?=
 =?utf-8?B?MFdGYVE3R0dNNjdNQ0NJRDVnV3VlTVZOUVNYb09oVnVrNVFhdmRzMjRIUEFh?=
 =?utf-8?B?ZnNrcFlWOHlNTHgwU1hyRkowblpXVWsxZWJpZmdlK2pIeEM3RlBTSmJIQUZn?=
 =?utf-8?B?ZXJtRzJOS002dXZLUkxVMUdxOUdKeDhzbkpkb0ZaQU9vRnBzbnRpOWVXL3ZY?=
 =?utf-8?B?WFJHUDBBODZmTEtyOEFXRjVlZHg2MXNiNXFPU3VjWVBwT3ZYNnFtMUtjaXJi?=
 =?utf-8?B?UE81enFQKyt5L3N6ZWsyc3hvajVBWHJ6Y3lqQXR2WjhSV1dxUzVqRURwamky?=
 =?utf-8?B?RHNxWG1WSVc2TVM4Vi9jZ2svSGI4OVhiU3lVY1Y0MkxpZHprSDVKT0dCM2lj?=
 =?utf-8?B?cmhYZXpOSm9MVE9HUmxZbG4wRUZRai9EVXRXMU9vUFppdnBLcFpSb29rdkN4?=
 =?utf-8?B?MnQ1MlpOVjlrenByNnZQaW14cVpCTzBTZ0FzdlMza1V4Ry9yVHFBT3lTSGNW?=
 =?utf-8?B?VDRTd3VXRXpFODB1bjhxUFNGdmRXUy90VnBBdWZJcjlOU09lOVZkaHBXZE5x?=
 =?utf-8?B?a2o4OGowUFpLc21MU0JlaElNZ1hYbS9PMXd1OVZtTWlMRUwzZkZUT3JTc3BR?=
 =?utf-8?B?TFNmN3hJZnk4NzR0WVF5cDFEWmJvUXU1TWFXTDlIeFhjZkE3eFdNMW5CVzZN?=
 =?utf-8?B?bnlxWWRtYUYvSkFBNDZvKzR4S24rdU5yb2NkYS9WOEhieE1uQkg0cWZWZVow?=
 =?utf-8?B?MVEzSUZuWThpOVZSZ3RzTWZBSjhDbzhRYjdxUlJDdEJnajE4VTZub0cxSjla?=
 =?utf-8?B?QmRKdG9SMThmUE9IbW0vVTkwak5UY2pyaXY3Uk1xUThZdExNM1ZpMWdrL0lY?=
 =?utf-8?B?RGYzSEdteWJmSzBvcXZBR3RNYXhJUXZCcmFSNHQyaG8rUEYvdy9WVUFCSkZv?=
 =?utf-8?B?eXJoQWtPV3djcXZiSDR1T0thLzg2czY0a00vT0dKY2lGSENjRXBJUTV2VlFB?=
 =?utf-8?B?NnBYMSsvT2FpYlJzMzN2TWxJeTMxSjdMOTRZakk4dThTMmw5SzJiR2pVTDBj?=
 =?utf-8?B?ZTg2ZTg1Q1hBRGY1N05XUzA0dmpISTNsaFZsZ0FxYjk3anB1TE1PTzFDeTBQ?=
 =?utf-8?B?SkdsdTJrVnZ0QTZDWWIrV0ZSbGYwSUhXbkVIeU1DY2dVcldSbUp2UEZQSEJX?=
 =?utf-8?B?K0M4ZGxiU2FiM1NkYnRCVDNnOU1oVE02MVdKZGl2MXI3SGxRM3p4QTFXdVdr?=
 =?utf-8?B?Qm5LajVoQk5vcnJOdENhckZ0TnJJRzlVOWF0RmVVdFdGOVRYK290WXJTVGV4?=
 =?utf-8?B?c2prZGdFMGh3Ym5aNHF5b1lpVzkrR21kaGVJa1I3a0hqdmdCancyTU5SWTRs?=
 =?utf-8?B?M3B4SUw1QmZzUW9pY3ZaV0puWmZwSXVSeDBMZkRXMVRibnBOemFLUUNUL1A4?=
 =?utf-8?B?d25ZbzMvRlNTOHk0cVRVQ0lrNDJVcHNXSWVBQXltTmVXNFpmK21Fa0xLcW1R?=
 =?utf-8?B?OGVZMzNzUUwrUzArT21GOS9UalVzQTZHY2hoQnBwSFBvM3pTbGlwWHNlSGt3?=
 =?utf-8?B?TzAvRlJMUVZGc3RpalVKeStpNnpRQXkvS0FKdDBpVWJtYVZ3dTc3SzVMS1pk?=
 =?utf-8?B?ZXhRVDlxcEdTdzhXN2ZiVVNXY2xidUNGZXB3M3hRWnZPZUs5QUx2MjUxcFBB?=
 =?utf-8?B?RVhDektTUXdoWkMrUkdXMy9mZzg1K3crdXgzaTg2azRzUkI3QTFKT0ltQXly?=
 =?utf-8?B?bUVMVk9aeEJUSFU5ckhqLzQxUHlJTjlDK05PaUNIRWhlVmswRk9sakJ6Y1FW?=
 =?utf-8?B?ZXNvd2FHblkzUDUvR1IyanJ6TnpxSnZ5YUpQYUR3RCs5cDNHZ0t3Tkg2M0tG?=
 =?utf-8?B?YTZKS0hycENLcGJ3Y1ZSTXIxeEZpWE1hSjF4YUZWZWVnaTFCM2Izc2FNRzBx?=
 =?utf-8?B?a2YrLy9RS1NRQVBTbUFwcy92azZwNzRSZWJXYVFLdERWMGpEVUZ3R2tJMU0z?=
 =?utf-8?B?cThtMzlnVnZ5bi9za1VjNVFHMVkySVVBOThJK05zcDZCcFl6QVBNaU55aENH?=
 =?utf-8?B?cmd6SmlWbkFtWm9vSmNQTEVxNUN0Qmt4ZEl4U3doUjhXNjhsVlIrek5kL0dq?=
 =?utf-8?B?WVQzaXlZbHFMWURUbmNuTmU5YWFCbDlWd1JqU05XTHFvWC9tNjNqQT09?=
Content-ID: <7B53F47CA78CA242B50F6E1314C4A79F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e2fcb7-5f57-41cb-f83b-08da4ade8704
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 12:41:23.4635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sPOq5bMrC7WLfMdecpZM30H8KYWl0jHWenN8zxrVHtVC2Zny66ii0LS9JWui2tLtXZ929AXQUcqCC1x6rJNS4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3417
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_054140_595632_FEEFD9DC 
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
-- 
2.30.2
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
