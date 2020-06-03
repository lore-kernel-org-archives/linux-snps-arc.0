Return-Path: <SRS0=RjUh=7Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839FCC433DF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 00:20:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1976A20674
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 00:20:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GRVSPPRX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="V3P8DGTH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WyFoQI1X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1976A20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MS9KCirqxSq18e4yF+fZLDhUoZWt9n3B5Aei++vKEnA=; b=GRVSPPRXAqrfPC
	G+uk0+mruSnyXl9LvMJgnnl1EW6iwZiHgB32qgVNFU8d1329P45PvX2Hmvl3Z9JWDSh99sqlZXW5P
	BHyz2Y615hTY1F+kZjy+bCTCafYu69NxCByaE7FQgg+59H62npcZsyIxvDl2r35j1Z9p4l87FWeTg
	4yz0PEiF/7l00Ry/bZ0N2CL+nq34AkPckwHf+c92Ct6vZ9jTcNGjepW+hWlvla0yZK7HJh9vEaN0W
	5MXCzhnuVI3yidg+AI40rcLTrtSZB8fbSMlhSS0yJ9dIa4jUxT7pgDRkPKL2BcTUz8BAohp/oh9DJ
	y4IyliqBux/QDJUsrahw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgH8h-0004xU-32; Wed, 03 Jun 2020 00:20:15 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgH8e-0004x2-Bi
 for linux-snps-arc@lists.infradead.org; Wed, 03 Jun 2020 00:20:13 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2B8954017E;
 Wed,  3 Jun 2020 00:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591143610; bh=NibNMxWEdRc2b9wMrZuPRb2pg4frT57LohBKFAavQSY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=V3P8DGTHgfQM/Xh7gLn7Y/zDwtWQbjcSVPC/MTm8jYQVQSJso++7Yky2wLrDskyre
 gsnwNLQVPW/qwzvh+tBfzKyh1DS6eq2qsKn9PxtmGGJfOBHDle/Ju3fSdu3XMWfGo/
 LM6BncOuYfvysUto5MAeX6UperBJ522v9oul1N5LNknvOTxbRut9l7ZUk6LtyyatvQ
 wnbSWO03ohLRyiFyl8MqYiFeI08o3w+eDpZsMc2akVT3tfscKAwR9ON5M54pXIEkap
 V+DdS4oawl+AlZHqmszYae2qQU500Kc85r0iKj/Bsk5DL0n5IJIgUX7P/etbMlB8+F
 dSNJXBKFafmHA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 00295A0071;
 Wed,  3 Jun 2020 00:20:09 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 2 Jun 2020 17:20:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Tue, 2 Jun 2020 17:20:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxaVSz6VeRnRjCKCJw1eL65DSBybwV3zHtT8p/3ThAtlOh3ZNGb4CMqA+bB6y1plQSb7ITrWL5qBRrFOo/9d9JfOPNubcaZ1vVuG3vysamOnjmKxe6bP08dVO2gLVz48BI7JBkEQV7YoAbW5EsX3fansGtrgycwShPoySu88IwW9j/yVxnzY46kqHBJ874ihHyETTzP+BzC7o9uLf55zb2tKHZdmM6IU00VP98IKPW0vWUDy2r+zTV8V/wfvjFevuNieF+lScnWjfBtKlypU8MDNtmmkTzvManmTBLKhvmYnO/Y0swZHSdBl3FT6G4eIrJNGGfkGYFV0OP2qmchkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NibNMxWEdRc2b9wMrZuPRb2pg4frT57LohBKFAavQSY=;
 b=VB0jOX3U+L8sp3E50kWTlv6ly4LbxmkEs61wcIJfK/84Bfz3teIyfMRKKLR0+TUPevpmuaBJZ+bqNEGZ/ta0oWf3DiHEHkKPmir8Bvvwm/p/6nKEuKWIeVfd76F1nXoIDWDG/xz/bz9HnzyYCuVveygpz8OGhlJO5nVPKpk7mP5/sySjuMQAs/L5JEh4Ipso1aVfk+5v6Y+LAgJTZ5HdiipMM8LNnUTwsuYGZnOzetDx9Q78tKr/cVDF+cOzJ+rzOPNSZ/ztepQWnoo9Md7MeXe4PATP0saTQgwPUcaDiVuJXzN9jXal/VHbgPQOT7LX28TVLA1nycJC7hQ4GZBm3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NibNMxWEdRc2b9wMrZuPRb2pg4frT57LohBKFAavQSY=;
 b=WyFoQI1X89K4WsVZqXjAWhfdUGcaJViJkAvK13Bh28BW/hMBFibG8pGQpkvAmq623W+HY8IsAvEEhPse9vePXGv93fkz32r0CXyGmmDCiBUw8teFY0vvIc1OFq9EHE1T5rfaZZy38HuKKUz5lVaQnvkJ0PVmYRrim2xDSjED5io=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2855.namprd12.prod.outlook.com (2603:10b6:a03:12c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Wed, 3 Jun
 2020 00:20:08 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Wed, 3 Jun 2020
 00:20:08 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v2 2/4] iee754: provide gcc builtins based generic fma
 functions
Thread-Topic: [PATCH v2 2/4] iee754: provide gcc builtins based generic fma
 functions
Thread-Index: AQHWOHXS+13L3WR2r0O8WETr+wq9bg==
Date: Wed, 3 Jun 2020 00:20:08 +0000
Message-ID: <318317e5-0d47-c79e-478f-12760528dadb@synopsys.com>
References: <20200602003541.21005-1-vgupta@synopsys.com>
 <20200602003541.21005-3-vgupta@synopsys.com>
 <34fc6c13-65e6-dcbb-42b1-1ba9f56b4dfd@linux.ibm.com>
 <c9bc348f-0441-2f0c-7336-b541f7d1e6f9@synopsys.com>
 <d6813e17-3847-7fd2-45e8-23576b62061d@linaro.org>
In-Reply-To: <d6813e17-3847-7fd2-45e8-23576b62061d@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d69905a-4f3b-4891-4c11-08d80753df37
x-ms-traffictypediagnostic: BYAPR12MB2855:
x-microsoft-antispam-prvs: <BYAPR12MB28552FC7E18C7E4C27734D30B6880@BYAPR12MB2855.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 04238CD941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gOlFi+X8Tg2NzCvlXC3FJg65PvCO8n3EXwAxQxOy4Azn3sXM/RWTpdK3I3XPg57u67lW79gWMRt80dcqvzoNTObizb/VC5ILoSUB5w6Y8DRjtg6d4ZCq1W4xQu2WSFvgmCC4D8UxL/3xZ4P7fw3emQ4g8R41c052bvuMxjmvB95uJUSM9W4cfh0koX7vNaFz19KlKNwjgyErp6D8eM9Kn32rr+69v97vwLrU3szaupqHUS5z2I/n7ETOggkMN5M8mbLXV26OjHKHx7Oruo8Re6bYP9qbSIvkCmhaDY2gKrUme3XmnEKup75Dy+hwQD3vDqYTRvWu6PRMbAhofNfnnjcj6vzA3q9xb3UwUVfNi9r+7sW3ZVgvIGCzxzn1QFOPRSthIV/CxZk7/6zkT3hilw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(396003)(366004)(39850400004)(136003)(346002)(6506007)(2906002)(71200400001)(53546011)(86362001)(8676002)(316002)(186003)(2616005)(31696002)(478600001)(110136005)(8936002)(6486002)(6512007)(31686004)(4326008)(4744005)(36756003)(64756008)(66476007)(66556008)(66946007)(66446008)(5660300002)(76116006)(41533002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: pNK74+Urr9JVoL9F5I9McZ7M/QXrxTBxqna7ZUfYA6dLftdBXSDAeEDS+ny6iAXmfgz74a0bJWTBkgt1yl4hMPbBlpI+bmT3q0AaRI8KfH26bL+ZbOb/Tc+yj5F/VXGZ21Evbwh3hbJeBKMRn8A3JaZfZ/mdtQ6VZUlckFvSNzPeDQOziSmWM4WdqixZCCyKqPEYNWBocZvx490BvA60z3dsBZjv2OhOyZOS2DB7mXl42peQq8ZYzM8cesuVhOufmzOvpnDm750/nTvv2/EPogAVyEMCIXgMWJ0WWW1AA8rUIup0IlZPpPyYraWj5RhmMnJYS5/sbsiy7W/iTz39jf0px5lOcV619BbPOPm+KDcNil1hlPyH5gGEUC93JDdvaOG4EOs1/sLyfLDMAAXV4MZ3BYGvcWnOyKmtdg+PbQk2Nu3ksyuFE8lgSiMfZhVYa0Mi04GENxj8+LMAuZ0FmlgHU7rWXTj8+BKczZwtZuBF+yTNjMzNaDk+UVa8m0y7gyn6JSB552ARCM/hPejYVax7BpeW5Wv2FUV4NsYd6E0Ig6kyhKTEUwqJntliuUgN
x-ms-exchange-transport-forked: True
Content-ID: <52D8AB29BBC35649B4905B4C1B9A78CA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d69905a-4f3b-4891-4c11-08d80753df37
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 00:20:08.0378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JLc5EQFjwqsgLQt67nlkgWBH3Xah5/mPIopkVtRvTvnltUSY/1NJbps3e2t/zxfIsRHSQl3+WJKS/7sMNrlDww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2855
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_172012_476454_5D1C91DB 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/2/20 10:27 AM, Adhemerval Zanella via Libc-alpha wrote:
>> I used commit f82996f815 "Use GCC builtins for round functions if desired" as
>> starting point for my change. And seems it was not an ideal reference :-) as round
>> has far fewer instances than fma. Indeed fma is present in ldbl-128 and dbl-64 so
>> needs updating in both.
> I think after this set is upstream I will refactor to make each symbol and its
> variant (i.g sqrt, sqrtf, etc.) to be define on its own file.  The default
> math-use-builtins will then include each file:
> 
>   /* math-use-builtins.h  */
>   #inclde <math-use-builtins-sqrt.h>
>   [...]
> 
> With default USE_* begin 0. This would allow to add new builtin usage without 
> require to sync with every architecture (and without breaking its build as well).

OK !


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
