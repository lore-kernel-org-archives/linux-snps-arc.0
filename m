Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E93C11D20
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 21:04:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45C46208E4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 21:04:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/5eDi3P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="l+9PKDeA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="AGI+j8E+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45C46208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/aC0wSTfpSSz3Auq2Iu5lu61wd1R4/GI5URvW3Ucoc=; b=R/5eDi3PbuqaEO
	wPu5UoOIFAHhzwxVWvqJmuqaXW8fi6Di5+1HGJj8/v3Xu2hfma6pmlX9Eqk1g46oCWuBTS22r1SY7
	e3d3O1JJJn6eYCI70UbjhRq3A14PK7llN9BVXmm2mkHNZVtDPO7yXn/vHrgTnfxj17bT+5LFnszkP
	SmzXAUfKxAtkAUUgwioB3ZmmpBXsGt9HthJoXeLGaoZwxYFN0D4xACAQ/jgb9LeK6uiZ2/u/VY5Mr
	nJCygvAUvxUI+IOt50aSjpXKxMnWpUixY3MyC+JOH8mxgWbDBMWZoDFYZNHqzyP5a/pofgzpkVM9W
	t4GHqRobKV/CIrSmz3/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4sze-0007tr-AN; Thu, 20 Feb 2020 21:04:22 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4szb-0007tJ-0o
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 21:04:20 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 68D71C000E;
 Thu, 20 Feb 2020 21:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582232657; bh=xiAtSEdG6zLyCGawuWjaxwes25teP+JlPyrV5Cy9iqE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=l+9PKDeAOYP5YVIfpiQLDYDYrsgko7ZOXs5uWLbDzBofMV1pinkCImz1Kp/rn402M
 5SRnDDuYug5Xt8N8+tYR/E5qGW50HANPI2fhaqaGhfovWPWaFlQiHq+1hUIruhhIO8
 DAWL3l7s8CW/M+ST0ZD9niiPRLXhWNDAtDvBpSwN4mKAqGtgbsMaLYmjcWWUlE8y0i
 AkMBMtkTg43Uyv7gOhyTm6tjOykFzaYak1kU9UPe9QLGo3au+Z/okEBrcaF+9nNw07
 ULoVTVvnCQiRjJsgPurt/ZrFT+03sZZtcRG7K9JiyrIeqvlHSLfxzNCjUuoTTs7u1v
 LVhEJEJm9PiVg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2197CA00AE;
 Thu, 20 Feb 2020 21:04:12 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 20 Feb 2020 13:04:12 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 20 Feb 2020 13:04:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QF4etsWMQRXQwB/mNthlH+yxEnRdfr8qd5HUcIaxxBvsZCLYbNpxgtICJPsV/P6lGgzg+eeiI2/ZaW5jIekXmzPlx4qz79h2biTPtZiOpy6UfZGOhhyDX4XS6Ze8UTxkGreT1MwgzBqEqz2Hnh7VgVTT4s6cU5bjSCFI8mEGOiCzxcOiQSiU2KXV/l6/zd+osdn1cbbK/AGYEEjthw+v4gNUdL+JiSarFi269q1AKLRChnpYD3D61TBmYUS95A7uGqmGbKbdkm4GkvNRSWT9JoWPDAQSbnL/SlZ/qx+17rlIxN33AjeJEPQhcNwMRwgEXUDDmXYtKi336gchY+xjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiAtSEdG6zLyCGawuWjaxwes25teP+JlPyrV5Cy9iqE=;
 b=Ry+6bFaW0HSvQ0DVgpVPK/ieI3YrwZ+tUm6UldnDyD6eE9DxAZWbtHVxcmXpaUuanxv+XoHsiBE8+IGnj1CHpi1sbVayt3fYtaLbp3FUtnWeobNOJE4r79JXFb2ZmEf05qUWktmQ+NCLbu5BB4C31ycL926lXhvQJuiBvOEdp+WPkfwHvFeaTOC5LzLsnwDC7+mc+hD8cAYabNHw8VNY1ksDp2GTQuXnsBN75tMJiRfry7APUXpunUp3x2dGM778FUoA73pAS+AqFgJPpln7soC9ROoAlYEAwOvomav1iRiQrmnYV30Z4idQbxvLHC4jAipaMM5QpqVGaho+qhbmTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiAtSEdG6zLyCGawuWjaxwes25teP+JlPyrV5Cy9iqE=;
 b=AGI+j8E+f4w1iXYJwgAYJrPTPmP9pNcPFgUW3LdAZNrbCCoLVjw0UAcbkV1CNxoHsdz4Ud0RqhbGX4JsvZhlKCWkKUji1ofj9ZNABnuG/rwobfdLsp5P0MEdvyT0tPe8ZGqDfIlhuo8Q4OM3q+TFrYIXVtxuzn+t+0lp4zsd3zs=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB2888.namprd12.prod.outlook.com (20.179.93.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.34; Thu, 20 Feb 2020 21:04:10 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24%7]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 21:04:09 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH 08/15] nios2: Use Linux kABI for syscall return
Thread-Topic: [PATCH 08/15] nios2: Use Linux kABI for syscall return
Thread-Index: AQHV520xA6L4zHMr7k+UQPRfmajf76gkEJkAgAB8PoCAAAbjAA==
Date: Thu, 20 Feb 2020 21:04:09 +0000
Message-ID: <f6bf5752-24c2-858f-7918-3e25c40d1e43@synopsys.com>
References: <20200210192038.23588-1-adhemerval.zanella@linaro.org>
 <20200210192038.23588-8-adhemerval.zanella@linaro.org>
 <10265c86-aba3-12f9-9208-4a4c6ad31d28@synopsys.com>
 <4d32b8a1-e294-d2b7-f150-2c55281614ed@linaro.org>
 <8f88415f-18cc-17ef-91ca-b0dc101558d9@synopsys.com>
In-Reply-To: <8f88415f-18cc-17ef-91ca-b0dc101558d9@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a6d0d6c-5559-4693-3a92-08d7b6486e23
x-ms-traffictypediagnostic: BYAPR12MB2888:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB288823B91329795114AEE1D2B6130@BYAPR12MB2888.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(376002)(346002)(39860400002)(366004)(189003)(199004)(86362001)(31696002)(558084003)(5660300002)(478600001)(31686004)(66476007)(66556008)(66446008)(66946007)(76116006)(2906002)(64756008)(26005)(186003)(110136005)(316002)(6506007)(71200400001)(6512007)(53546011)(2616005)(8936002)(81166006)(36756003)(4326008)(6486002)(8676002)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2888;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ot0hSEzhxPj5gedvzOrwDOtSmmf77qhVFXFGQjUbTLWesDVwa8bmeR3xCrSxrKlglcR5qg87NI2ZW/7+RveBJh/opaW6cRL+3R0yNlBZeUn3f6VQEpJ+6rtxrsLc10m4uXGLNQgZb3KNkXBn28a5Ib1OnZF54LvWJjYaRj104gPWfNwXkgD/JA+qxZxbHkW4L53Nrc1K+isnqNFEABWFpTNH+iOdpZIMWVLxKb83WFlj6eU7rtZ4hYcCwmCiD3W4sBTlx2NYlNYXfQF6fJ5cxbJaNOlmnJli7vmWB3pzZLvpKny2D7OGuNq3SE+iAT1SJwGb9rSlwENYcHXeBuy5JGMVxZzVmj4r8xMOjXbBMRCu5QNsf1U/7EMYZOhD/VWj2owXSs0BzAdrpJRGbSqnwZ8LlFBhTkoHrXRbol9oKcGcT8XsMCo+yWbFWmwAsdAv
x-ms-exchange-antispam-messagedata: M3OIPmN/A9XPTE9qxXVBMweAnKAQPUwWD9y0hXofCpMeE7+zffzsD75kDAXbqZE3B3qLKLvq3arEpiIy6BH3yi4eVRiKEb/3Cy+IELs1fnXbk5n/VClsnEoyozZrw2ftf8oXI1l6H9IgdqkSZXQ5yA==
Content-ID: <2E1FAAEA57AA6243A84AACB0A95E5E90@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6d0d6c-5559-4693-3a92-08d7b6486e23
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 21:04:09.6418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tOzs+h9dJeiAGivB6vJECwQdZQ1dRWX4ETpNuJI1UYGfQKMYxNlRheU/wbdoPmH0SlEBBJ/zvRsm9+mr25HIYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2888
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_130419_130737_14A6188A 
X-CRM114-Status: UNSURE (   9.24  )
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

On 2/20/20 12:39 PM, Vineet Gupta wrote:
> Am I not following this correctly ?

Oh never mind, they use 2 seperate regs to convey syscall result and error, so
your code is right.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
