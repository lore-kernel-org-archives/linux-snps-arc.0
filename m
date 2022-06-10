Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DDDC43334
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jun 2022 13:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jjTXvfkjJRAxjdmgLXgnZqQNeq1pQneMU0nI2A2rjBc=; b=hkSURs6NrEscHo
	jn1EVH43b/yLmp9o+pvYuTiEiHrlqCzQ97rhvt8TlR51Bp2bM/LRIKRQhB5Zhn3cZ1a8BKLXWVFnN
	fcyS1H2IN92sfWsYOlxKIpaw/szjXQLbWQPzUIXYLap9Yx71TZSSxBJgsalcRzEBaV6TvvIyGlnhB
	HKEo8vd8JZ2BTsi+coanVFoud1+9NGFaR/LfSdNo4eWn7E2lYUqK2ArgKVPzGrNmgse1+Ata6L6XA
	HGGw3xKPxTzbD8DX00yvVg4syawMPGizZcJvn52427O7yy9PZnw/MpMGasswTKYohxUxn8o8Wfdwr
	dilqaqM7qreQ9k516jCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzeaV-008Le1-N6; Fri, 10 Jun 2022 13:22:07 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzeaS-008LdL-Ux
	for linux-snps-arc@lists.infradead.org; Fri, 10 Jun 2022 13:22:06 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7ABDE40A69;
	Fri, 10 Jun 2022 13:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1654867324; bh=C62HX7czJ45PoyqOlH/n7NrdO+QXIpha5gHwiMFQe7E=;
	h=From:To:CC:Subject:Date:From;
	b=aA2k54htEQxeZrhUA6H/JofJuvn6B3yxPbCQmvBhnZlLNlbxCQmEkf9rHdCY2N8yh
	 3q8hcJ2DBkN1u8ScEpzkt8jHWj/zIG/rm0h1TYIw+/OzIlMoWhphXJ5ORLA+opmCaX
	 jj/rcQfEcdKykhVJwFcnUEyQlFq2zftUxUYuT5x6rtcmtmWWeQdx/gt8/kI5wnXP1B
	 TSniQGs23fAbuYg1R+jNU22uu3UWP8+4QRXvWo1HRbF2JRSCENWSqc0JgnW1+HxE8Y
	 vOTkiMMVPUv07fLXdi3Ke5As/1LbGOH2WYSQhEnasi6kX+iCd7hXkIKCm69rMriJk+
	 ypRfbGakjrEOA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 97370A0065;
	Fri, 10 Jun 2022 13:22:03 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D921A40042;
	Fri, 10 Jun 2022 13:22:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="pTySaowY";
	dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIFYs2EbKybGM9YNqNzoFqZGljLyN2oFdhn55f8Q6wF7MyKYz2+6VmNYRCafGovHTY/D3PLdHKqKQtGRSD481+HfeFxCBeaRSosuKIb+/gIAYqLQdJvskp6LR6inM5Ad7C+plgbm2nc0cwEVzuIA/o+y++OlDeqUpifkK4Sr4acxUvCuZFMBwYSSvLeEid4G03fSR/QZLdDkqwnBu9RspCVL8hjZnxZ9egd3b8cVHGyW2gzNun5JxOojC13QNodUSJlYccuQ736faMRSRBleHi2l3w5Ru1K/oD8nA14HwD4P82vMtj2GsXSclZjkLRdhhax7UlxI8e6BVyAgUHr/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C62HX7czJ45PoyqOlH/n7NrdO+QXIpha5gHwiMFQe7E=;
 b=PwB/NyBD8fx4sMZiRNcJ9VRwGNkrQmHNAjoNSM9sy9Kq3QeOcxp0Pyky9zRLuK4MIHNVRbVXFb7bsTTpd4IDBlriQNo5O+z7I+ZUovudwJFFo/xmFXY+4er/L//7/IEV4KCvjNWpOvFbc3DvF2XQDzCxK+mpZzfpMvy80EjyiaU4/qZl4whLM3WX9wjeo9SL5TkJiwLkQ/z0XCvUJyd6Z7oOMlvvlkCtlSGZglvTtBNPZXJf7wXV4PygvtA4UK4yIkfHUYxT87qiQasepNXSDq5ROQG9xYrDBxDrRV2LIebI41LbwMji/rL99AweDVz08GirO1WJ1T+4pmpTI/zZ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C62HX7czJ45PoyqOlH/n7NrdO+QXIpha5gHwiMFQe7E=;
 b=pTySaowYMY9tATFSQVhmT73XKY3P+F0S14Em0WmVkQct8aqqKNgj2Io8MeqruXIZDzAJnW39zX04ECWJdBOHJMjkAKCx1w3LJlLOfiYrIo1FG02bl7V9UhsdQtG13T5GZUWjqgo57MW1TCgKiVx8CwRe9F8gQSkUaXFfEfAq5PY=
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by SN6PR12MB4685.namprd12.prod.outlook.com (2603:10b6:805:b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 10 Jun
 2022 13:22:00 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::1175:61f1:71e9:2038]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::1175:61f1:71e9:2038%6]) with mapi id 15.20.5314.019; Fri, 10 Jun 2022
 13:22:00 +0000
X-SNPS-Relay: synopsys.com
From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: [PATCH] package/bpftool: add a patch to fix cross compilation
Thread-Topic: [PATCH] package/bpftool: add a patch to fix cross compilation
Thread-Index: AQHYfM0Qf3TwoDwdH0W2CissUGLr6Q==
Date: Fri, 10 Jun 2022 13:22:00 +0000
Message-ID: <9db25812-d433-99aa-74c7-d3fe5f3aa9e4@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73d1f5eb-5985-4f49-62e3-08da4ae43352
x-ms-traffictypediagnostic: SN6PR12MB4685:EE_
x-microsoft-antispam-prvs:  <SN6PR12MB4685FAF41D1BC9E7FAA3363FA6A69@SN6PR12MB4685.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  kJkLLebOdcHDhD+FJbNreYXh9AxfNRef5q4O5W/5I8EWC4jOlQ66unv2w3LYosvnCh8crvSeakDEAn3qkGuQv8eNy3ghBKXfWfoWmemDvKkUKVBvDt366rzvnXl2objzunUyBm5BK9jISpklzpo0b1L1nfXW8KVGW8aAgZVZ9D6HghMnT1KQnRzdXt9hch5jDQZKwu4HzD/APUqmkpbZNL79mC+st7Z/pvzKHe8TMSCMhlYKl6xGgwob6cNfiMnVl9rfcUr535z+Iv12+enpI8eYBmOjsTVNlc1zp1QENN3nnUJZGqf0cCpu0cSCNbTrN+SFQSC7/OUi95KYHLFltez6sIEBwlC7IBCp6iarfEVzq7sfbAV7Mhk32itZ1PkOPX46yWADEDP8RvLaxtve2ynHAoCVnbniDfsk6ZmE1ds0NeDQF/HWE7gHqcvEoAr9jHyWLS3RrzRuy6ugZRC1mnfMwdcn/YZQjh+2StJIK4e36Ny8ZKVx+6t531ugHqN3ZDnIecLWHASgzhy0DM0/MdOtXj/oRU0IJiKjJN4jgIukw3bwRM9VQWYH73/8+2REWD34w5i2bwOOkwfB3MSsWfyNe635DvXFmFUzpD/auxPacKIVRRidsjLGKcFLXXPIDPYiMQjYlWndTBfEx/J/UHv6TVKNUoZUV98Ty7dk8cNrO+E+a5jT/3KTX8Ca+wzefwF9FcHt3+ua5mJt9lbcRO0WmO1w4FX79uGq/6s4GrKLRuIeXpBYaIlKEe9/hHddcE+w3xwAD0BSeWDNlZa44c0bpAPzqeLkEFiUQFSlMZRkokwY0RWystCGVoVz+unGSO1HO5knMRfpjIr8V8AKIQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2782.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(966005)(66556008)(36756003)(66446008)(64756008)(2616005)(2906002)(8936002)(8676002)(66476007)(76116006)(38070700005)(31686004)(6512007)(4326008)(26005)(6506007)(316002)(86362001)(5660300002)(91956017)(66946007)(186003)(71200400001)(54906003)(31696002)(6916009)(38100700002)(122000001)(6486002)(508600001)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?amtFemJCNm1qL3d0OVBuaFE3V0RSc25PQlh2RS9IcHpYN1M2cnY3WVJOcHg5?=
 =?utf-8?B?RjV0R2hqaXB3VG03RFYxTWY0dHVSM3o3Y3o0UjdKdXhvaCs1b0pRWTZKYW9h?=
 =?utf-8?B?R0pBSFl2YVEwTG94ZTMvMWoyamZBZldwdmFCaURKTVZkeTZYZ0RZNGltdzF1?=
 =?utf-8?B?OEZDdldlNzV2VnBneGpzRUdBM1JWelFOUUJINDZiRnM2ak5PV3ZEMXo3QzlU?=
 =?utf-8?B?c2hQUjRYdkUyUUNLZmJqL3locC9sZDJHdVRHTXFIcjNIYU0rSlRRUzhMRXZa?=
 =?utf-8?B?ZmZCZkdaVFZERVJCekM3UkU1ZU9lN2lSWno5YmRONFNaTi9LMHV2ZlI4bkd2?=
 =?utf-8?B?a1FOTnJKaE9OZEpCaEsxOTNoSTNvSUZWUXlrcXMvSEZGS3RvQUlCYVFJWDlQ?=
 =?utf-8?B?Y1dMc0hUMEN6QTB3eXprdWtrNmNWQUtWYm9FaCtNWVhnZWNDQWkyYlZPRlhj?=
 =?utf-8?B?bnpqRVpUZFVnSy8xNjRkRWVTWEIwTTJYTXNRNVhtVUx6RUNoYXYwRG1tQmkr?=
 =?utf-8?B?MFVwRWg0S0JUN0NYYlBHK0gvdVZ5TXEvOTBlVmNCZjVkMTUvb0FISGU2cWlH?=
 =?utf-8?B?TVBFb21Sa29KZngzWVp1eU1rS1ZVVlBUKzU0TTVZbWdmaE1UYndTaS9DV294?=
 =?utf-8?B?QldhcnlMb1I1SkdPWnhSWk41akxkTWxubUxDZStSMEFaOStLcmFTY2Y4T0NI?=
 =?utf-8?B?cTk5dUd4YUs2SVArcDNoYjUrSzBVamREdmx0Z0ttSjh3TTBmREJkTXNOTUND?=
 =?utf-8?B?b3lSZ0FLNkhCNVJlakJlTTdrSEtRdDZ1dm5DZXk5M2FXN3A4RjdyVStHSjdF?=
 =?utf-8?B?OHVWTmlvUTdVZHI5Vk9KODIra05TVmthTlUzbkhXeUIrZFJyK0RpSm1WdTdR?=
 =?utf-8?B?VUFQL2ovbElSY2R4VkUvT0ZiNVp3Nnp2S3p6RFQyUVR0RXJZZENtRnpPcHR2?=
 =?utf-8?B?WDlLanJuMjlNcngzMFJrMm42RllXaFJTT0ZYeE1vbXRjamRxMXJ4bDhiTTNn?=
 =?utf-8?B?LzZMNGdTVTU5N2ZneFVaM0NtU1RwaEZkR2c5SlJaS00xMG9TVGFhWVFlOHZz?=
 =?utf-8?B?emFpUDU4N3BMaHQyM3FHQjU0REVkd3ZCa004UVdlUVpTeTE0elpBYnpPT3dM?=
 =?utf-8?B?bndtYUpMRWZjVnlsVVJzUUdJaU5RcFdwcEdhMWRtay9BZnUvcHE3Snk5Y2V0?=
 =?utf-8?B?cDVIU2hWSkt6eWhtK09HNFhWTUI3UU81anVuamNROG1uMEJZcFJ5dTRrOUMx?=
 =?utf-8?B?aXZ2ZWYwV0VXaEpiRmJsVGhYOHdoRnhwM09MSHVpTkovZVdmNmhURm96V2Z3?=
 =?utf-8?B?THFWNVZMK1hFaU44YVFuN3hWNVhyTnBTNzZwdzUvRVZ4L3VOQ05Ga3Q5RTdv?=
 =?utf-8?B?T0FHRHVqUlJuVHM2UTc0aENLMnY5UDhsRnNHRnBpUkMzMnBDU3NQVWwxd3hM?=
 =?utf-8?B?MEx1UmdZVTZ2R0lkV1JRQlY2UTFZa20yUzQralVoZ25NT2FsbVNWT2k2QkhN?=
 =?utf-8?B?RFFFOW85Wk1Za3RWTDZlUUswcEZvV05tR2hLdFVhWjY5bGVFeklaZDRZYkZz?=
 =?utf-8?B?VDVGSDdMQTUxRVBTWjBxRXBmbmlINFYvTHhQRVNxcUNhTjh3djZMOWRETk01?=
 =?utf-8?B?SWdBcnkwRVdVdW9NNHNuSnh5b0lXN3Y4MU4wWHlJQm9NM0MwaThIMHgrb3dM?=
 =?utf-8?B?ckV3OXBmWWYvcFlva1RQdU5iSTJkVE83UUxEWVFEMUJhVmlpTk9zQkRSa0F2?=
 =?utf-8?B?Vys2Z0dwY29RNE5yL0xaVUcyUjBLMG1rdklHUzNVZW5ROEZlV3JIN2NQNDZP?=
 =?utf-8?B?M1hOV0pHb01oUCswSnFGZDBPeVB4aDFzUkdoV2l3aDdWUHBpeWxzS29pbTM1?=
 =?utf-8?B?b1FqN2tyU0JyQ3R6Rk9ZbW45d3lFWmM0cVhOaW02YVRvYjhmYk15NDVzSXdp?=
 =?utf-8?B?SVRYSjZmbG0rTjZVNG1nMEUvYWRsT0s5WldKb3dFUHN2RHdIMHo2OEZvU1Bh?=
 =?utf-8?B?RXY4L0xzWk5uaks4SEFCYVV5OEs4U2lpeHFJNWUvV2lvK2ZmT1RnRFE4WHFi?=
 =?utf-8?B?anFFMWtPT0QrL2dTVE5ZZ3YvK2g4bHlubkpLTWNRZFNPVVlUK0tKc3RMWXRQ?=
 =?utf-8?B?TDRiUyt6ZjNvc2VWNTI1eStMam5ZMXJQbFFVR3ZMR2NpNzNrRlVTSXJpajlB?=
 =?utf-8?B?N3htMnh3ejNxdHZBWnBCZFFBZ1dQZmpFc0Rkc25uN3JydU9vUElTNVlOZTZp?=
 =?utf-8?B?SWFVUXBKTXF3Y0wxajVKazIwR1lQMmI4ZVZwbndvRHJXTTVaalpNd05sK0p3?=
 =?utf-8?B?djFrdnM4eHNzVDRheDJSYjZ0YlNBaFdSSFRvM3pSZ1c3UGhCd2NWdz09?=
Content-ID: <816569740B9AA743997D8F0C87C882FC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d1f5eb-5985-4f49-62e3-08da4ae43352
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 13:22:00.0226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2KmqyYPUXuzGWVcUnNzsofFWHQm/qCk4ohDeUrOGY37r6W5lTR5XjCOhIH7hYgGp0KFqiYK2dMrqcmb1IL+13A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4685
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_062205_053748_AE1A7797 
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
