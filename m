Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C470C43334
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Jun 2022 08:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+mfmQ/0Ncg0+eLKouty06CIcD0Vxs4grzFF1ARZ4Jw=; b=i7K+szv/dgqKOI
	nxY7CXAxQXM6fUTDz44ehL/9fGHeXPTzovDHFAM4LlTbCuHacOp5KFEPFycdLyLVN4kqleD2YvFlf
	61KsuFl9y0KEf6tIdFutNZIe8hvFXPfOMDXA2lO6FbKJQckt+al0baM1FznEeKkJkqZF+1eEuGbO2
	oveNuFAX/3RS2Jhp8d3j5kTDkpBSR7Fqad0mP5Yeuyv810VJIHw8JyiqS4puwkX0SVX/biJXtBibT
	nwbyftuODDcSUpUad9SPG3eMhVRZSPRtX1Pi1BnWVGWZzNVqIqw4OS+ARHOMvWu4wD52dOvTmwEtf
	puOxLQ+a2EVipmT7oJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3vx5-009KIq-Qa; Wed, 22 Jun 2022 08:43:07 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3vx3-009KG3-2N
	for linux-snps-arc@lists.infradead.org; Wed, 22 Jun 2022 08:43:06 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AA62B4671B;
	Wed, 22 Jun 2022 08:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1655887380; bh=nLPWychPYakiU4J3CSBFhqKKqFNGddVBjHbgzj+dnas=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=OTbXssesooeeCIFKx/Zr3FYuP2eLd+NzaYNFZHVXyqOAkG2fL15qpt/e/N1MLnObd
	 /oCy4o9QcZPOfnhe8kibVofwxokClTixxhIg5vkfv1YcYhetj0zAuygIdZW825WnQ7
	 SVbSccblnU50K4pXXn/62lMQ5HTVs6ApAlZHksDf0ha6zNa+fxtnWOxJ/bTv0tVdB3
	 cPkNk9QRuoEITL3WC58DAzB5aRTO16ntt7SALdpEw9ZL8uovHZEwXhGl+wBjsKnN0x
	 6ahDNLXGvWGLt/IaFdlxB0HtrgxzF6ApXtAr7r3y4Gfzu/gpCjIv0dDPDiLg+q84K/
	 0HZHLN6suWzwg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 486CBA0077;
	Wed, 22 Jun 2022 08:42:57 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3DCAF4008B;
	Wed, 22 Jun 2022 08:42:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="a2KneZUN";
	dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTFgJkLwwhj2v7goc9S49OK7K1EKydLhsnhChMTibMd1IuIB3aHk+ORxplChLjqtlEZSNBQNJqKjGl8VBM0QFVEvmubWQQ+3oHB3nDayjt+OhuSPAz+KT8IoeBAJsYrXegxAqHklzV7eM+47LAbjym23Xy+mCrOU8zsAkOjAP+GDWLqH7Cnnd9GOZ+AscWx7lm9Bv1W6Wz2ncqbFF41HSUnWnRiwAN4f2Fgrnpt4SgciTNb9XqEVKQOdWuASLjcstCFMGneSq2fG5A8Hn/mJqyPUNNQkpDGoAxJNCcTWdx+A/DYeiSQF2WRuoV6swg2HvqEQZt4zw/M2nzDKqAcS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLPWychPYakiU4J3CSBFhqKKqFNGddVBjHbgzj+dnas=;
 b=MmACHeCrDzHjDNjRo3qTf27/jaXzz3mXRQcS0RIPb335TZU2mu2OHgv45rOlNsUMGAshHB7mfWBWaRx+TZcwb9V4Reh3X5FtjIBNwBGZoUHolsf3ZSa93yJsLXt2xd/oOnJ3PwPLL+9yJ7qyGc+5XXt2UjRwMxHE0uXhe8XAlfTttYczkcMwDPQrrITD3fNx1g29EoeK1255ToPPNVz4jo1qi3BPHR7FbtD5k7rrA3qrj2PXAoVcf3KkBi67mhPHcI+2V99WkuAaVJ6lf2x+TE6QVQTqdc3+eUVV5DhHgVzAdKvbo4PlUWCxbBJgGSkbTkO+/zaSB4xdfzSb/7emzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLPWychPYakiU4J3CSBFhqKKqFNGddVBjHbgzj+dnas=;
 b=a2KneZUNRdgbEDH1AuhvwpSsiWqpE9LxFgC5UMB7AX9ZXL1sjEL09UWjWlRs2weohCzccvAlBJ8uE1BZE7sRzbSqlxceSgg6yIBNVTa4C3eB8mVoewChQTu6SxMGhPNrkoPdhKKSc65bL+Y2J+cOnPAFWAFWY8CQQ/8jwqgf5m4=
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by DM6PR12MB3979.namprd12.prod.outlook.com (2603:10b6:5:1cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 22 Jun
 2022 08:42:52 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::8531:7f90:c11f:2fb4]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::8531:7f90:c11f:2fb4%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 08:42:51 +0000
X-SNPS-Relay: synopsys.com
From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Jilin Yuan <yuanjilin@cdjrlc.com>
CC: "vgupta@kernel.org" <vgupta@kernel.org>, "Julia.Lawall@inria.fr"
	<Julia.Lawall@inria.fr>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARC:mm:Fix syntax errors in comments
Thread-Topic: [PATCH] ARC:mm:Fix syntax errors in comments
Thread-Index: AQHYhg7kChJoJXHknkW9YJewO4LLpa1bGGmAgAADmgA=
Date: Wed, 22 Jun 2022 08:42:51 +0000
Message-ID: <4cef89c9-3b27-11e8-2971-66b93b847ede@synopsys.com>
References: <20220622080423.41570-1-yuanjilin@cdjrlc.com>
 <YrLTCXLrr3HB39lv@debian.me>
In-Reply-To: <YrLTCXLrr3HB39lv@debian.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff75043b-b2f5-45a5-352e-08da542b3179
x-ms-traffictypediagnostic: DM6PR12MB3979:EE_
x-microsoft-antispam-prvs:  <DM6PR12MB3979D5E4F79FBD052C81EDABA6B29@DM6PR12MB3979.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  B9oIcr8ME5k54FK+MB/RHkiNrAed5h/tp/B6UWQpSbpVD/2dkUU6N67P2PhnZo9csPklzlJJ5wa5rlZvc0O+RXvqq7UeXfca6Ja3bW2JYVBz5FAO4pyWUWl7FstYoajrsEU5O3LTwcfmKmCUaqOFoc40C2g+t6erpT0DnTpX1merI/vBl69tDUt0KLplPDVp3SXlAtapTigeaNnIwemm04RYZKTVjXBdawt9mLvaAQ+q/KXOSLfKRhHhE82gR8Bv6LP8lNky5my40abA6aEfgU1oMOPop6G3UtBrT+F74NW9/E5ADjAWNIV4yivW0r0qVeqf9FP5CERQWgjO5/u52DFEoz3G263fG8GorT19mss2vQ0+gCjevGq34HXN2XGhgI0lW4PxfC4AgV98fpqJt4yiAA54tuLsgWyQWbdnV45FW3ZGk8XUADMqsERbelvAaJaar9bqFRrCkcc5ePMFK9rwl8/QVwpuyXC93zqUtj1agS/G+tv5njWaj1yZ8rpvgdjY79lFcsp05svI/oZXiPWqQ4mE+ajIUBRVyS3X7+gq4F4KXKdAwpiu+ytZVQt1P3b2eN8Sndlm5cud+NjdW+amTiKquuzDBCAl3/MlNcRgjCPRanPUiAES3Az9qfdYwbZPSXKLjHBsKSCxKCgz1eONJL7DOEkR/EuwwagdAQvcDJdAYrttisMxvj5YJLjZ+luGcOpp5PfQ+I04QGMSXxp+iM4uM95PiZ4yftqvQ5tIGoB6v0w20IquEaWlK6mWt7kvQOCLDqGQxAEQa0zy5OH3i+KnXrLx+ruauue9jFY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2782.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(396003)(366004)(136003)(346002)(91956017)(36756003)(66946007)(31696002)(66556008)(8676002)(558084003)(4326008)(38070700005)(2906002)(66446008)(316002)(6486002)(64756008)(110136005)(71200400001)(478600001)(8936002)(186003)(66476007)(31686004)(41300700001)(6512007)(76116006)(38100700002)(5660300002)(6506007)(54906003)(86362001)(2616005)(26005)(122000001)(53546011)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bEZaN3ExNnRLbEFBbWhiKzNkV0RkVjR4ZEhUb0ErR2dMS3B6OXNNSzhJU0Ji?=
 =?utf-8?B?MGU0RG5NNjNMd21zMG42RW15S3Z4V0NXczl6cVRDL1NjTVU4cTVocCt0eUtW?=
 =?utf-8?B?YkgvMWF1cDZ6YnJFYUEvQnFtaGVKVDBPSU1MR0FDK3BkcTN4a09VUFlPb1ov?=
 =?utf-8?B?ZWU4L2tDZHNHZWFueDJTbGZlcXBrQUFNWTdxckE3OURPb3dEdDcraHZYRkl3?=
 =?utf-8?B?bG5laXdwV1Z2ZWF4MmQ4K3V6SVZ6NUp6TzYxNEFSRVB6d0paNVRZQTJEL2Zy?=
 =?utf-8?B?ZUIrVHJSUnlmTnFaUlUwL24rbzFDbmlkRFFwMitkNVp3OXdsZFQ5OWFlN1lv?=
 =?utf-8?B?amszZUxXazRxSEl1MFkzV1BCdlVhb0JUemhSMncza2RUQm5OK1doQVMvV0xN?=
 =?utf-8?B?ZjFxUUI2SWx2VnV0bmhiM21md2VhL3dncllEUExIVXo4MkU4OHpvSnVXb2JL?=
 =?utf-8?B?V2UwMlRuclZMOUl5TUlLY0VnU0VRU1FQVm1ZdENKMnZyOTNtQTZNeFNNVTRY?=
 =?utf-8?B?U2lyaHdnRENpcE1pR3Zub0lkcytRcTZmMWQzNlEwdzBBQ2ROamsxU083L2FT?=
 =?utf-8?B?bXV5MGRVeC84VG1scDVjNHBneHdSZTB3d09TOS9JOEYxU1Nld1JoSHdsWGox?=
 =?utf-8?B?RGFzWThRMDE5TlA4WGdScGxxUjNEQmZBMmFrNmRjaS9JUDUyaWFqOEJ6RVgz?=
 =?utf-8?B?ZWZRNFM5bFBsNW1GYXNOdW94Tlk5U1pvakdnd3h5WHVWQ3JQQVlpekd6ZU1U?=
 =?utf-8?B?RDdwSW9rT1B3dHEyVklhV3U1VEZrdFlSdGJYbHU3RHFxR0ZOL2dOR1kzR2Jn?=
 =?utf-8?B?VDVlaURTb3RPMWtuSERiYWNBMmFSMGNNTS9RbTI1WWF3SDhCeXZ6RlBjeTRN?=
 =?utf-8?B?b2wwZmNrVWdtdkFlaXNDMTlBSzNPSmlsQ2hrVUdaalAyVUZVU2sza0lQc3J3?=
 =?utf-8?B?SzZMWjNXZDAwUFYrbG9BZG8vU2YyMVVSUXU2ZmZjN09xMSs4eXZBZUhzcUdM?=
 =?utf-8?B?ZUpNdlBWNUhDdlc0bE82RGZMb3Jmd0pzQlBQeEloM1BvazRsYmhFc2Rqc21k?=
 =?utf-8?B?SVJ4QjJuWnd3ZFQ5VkhOYkxUZ3pkWFRvdE92K1dKZURJWCt3aWc5MmpCaHh6?=
 =?utf-8?B?VjFIbXNRR0Y1SnBXVTROTWdFdEM3NmNDcDdWZ1Izb3VsVXRzcStUR3h2NDA1?=
 =?utf-8?B?UXB0cTN4SWhNQWlJbkxLM2lSMTYrU0UrR0oyckhhN0dSSFV1czhtelgxSnVG?=
 =?utf-8?B?SkEvL1l2T0FPYzlYMXVlOGxWNFJ4UGMwNmdDQUdvY0FlME1sQlpMQ1ltRjU4?=
 =?utf-8?B?cXI3ZWRjTVI0cE1tM1JPVFV4eWJEdjlWUlFqRUxWVm9OYm81OGZmc1RUSFQx?=
 =?utf-8?B?bndIdGVKRHo2V2pKOVFodFdjcWQzczBONktaNnJWS2Ftb0R1R0ZsTkpSeFJw?=
 =?utf-8?B?L1QvUzdyempLZzdFZEg5TE5zem9PaGQ1L3FpTDVMOEFHRi9FZVI3c1g5R3Va?=
 =?utf-8?B?NDBMUGhvNDlBSFc3WUJxVGZuL3JhT0xHR0JGdkJIUDczQ0JXNjFjV3orZVFr?=
 =?utf-8?B?NVMxWmhCelJIWW9lN3ZFbk5mWG1EazBkY0wwZms2NHhYVGtJejNOeE4ybFdF?=
 =?utf-8?B?ODQvcmx5RU1YUVZpaEw5WEdnYjdIcjlmdFpycUhoR2lHTnRRRlkvM2UzK3BW?=
 =?utf-8?B?eXBEWUtpdUYyVXBxQzBmVGZLcHJ5UlFBVFpsbkhMMTN6S1Q5L3V5cGVza29j?=
 =?utf-8?B?NXVpczVVTnVLVUtpRHhVcGgzTlorc0JqQ0YzZlB2V1lsa3BUYVh5b2FMajRX?=
 =?utf-8?B?R0crMTgxbzN1VXVVRUxPbTNVeWp6aUJOUEZCSWUyenpPWGpiVzROay8vczhw?=
 =?utf-8?B?d1I5K2tJRHpjUURQSGcyWnZFYzJQclVMalNxbzNhbTd5STkvUzRNdVJuZVl0?=
 =?utf-8?B?cS9Pc2oybVJzNGgzdzMyZnFsT3F4UTljQmlUcnFneFNBczNyTUVWWGluN3gr?=
 =?utf-8?B?ZmdxYWx6VWJ3cXpSUlM3Y01tUlgyb2VxR0xmV2phOUw4emtzSE9FOTdnWHd4?=
 =?utf-8?B?a0ZJOENxTHpLYzB6Tk9vOW1lRDJjb0kxODBtTFNub1pJelM2aThkUTJ5RFcy?=
 =?utf-8?B?cG9US2VwOGtGdHhGSjZrS2g0V2pzdjBORURYVTFzL2JWcTNWSkpkSjFwSEha?=
 =?utf-8?B?NzZHZTlqYzRoNlZnNHBOcmJoVTdZKzQ0TU13cXFhT2JLV2NBanhIeXVqOWpF?=
 =?utf-8?B?OUtlQ3k5QktDOXNHeHFpTXBwNVNpUmhOZkcraXArRm1mZW1FWHFqUnJZKzVS?=
 =?utf-8?B?U2pHVzdVdXRqcW9OeXN2aUt4MlU2dHUxKzhJU0tOcE16RUkxTjRyUT09?=
Content-ID: <7DA5118B0E47B14A895BB829A27C9A54@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff75043b-b2f5-45a5-352e-08da542b3179
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 08:42:51.6075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YE4DNvoMY/eYlgOA6DR9CHheSgkYn391u66317Us6cDJZhkHNRkK707iGLc6zpNxyCLir1wYr8N2lwXtWFThDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3979
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_014305_322905_4DCD9272 
X-CRM114-Status: UNSURE (   9.67  )
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

On 6/22/22 10:30, Bagas Sanjaya wrote:

> I think that this kind of cleanup patches (typofixes) are best done
> as part of **actual** work on the code in question (for example
> refactoring or fixing build errors).

Amen!

-- 
Shahab
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
