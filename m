Return-Path: <SRS0=QMqO=KM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90481C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 21:53:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B894C61108
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 21:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B894C61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=16K9rsJhFjk86Tdyfk94XnyF3epsG18j3AFtF3Kf+lM=; b=CuxBuqyUVpILlhTiaLEfWuNnN
	wN1+2TL7f7//08RgIYKElP3mlAC7fNHhloy/gfQA3dQZZ4nx+Rk8wXRpCX4N7ArQTdr2CpWVed18Z
	aH2ObS3OJyZMfGz4xnG6RA7j49GHALcTkqQfvWl/TCqjyNAsh1uDHGjo1KDu37I+kuDkQJxFsIP+j
	vpOakpV9fYGBypA9VrmUtfPSRMyZ1keVyt1higxAIZYuG6wDghjfwmHoYlLnTSryE75MWBIErw1vD
	u5SVd2KYSaA6gcog/Lr5k/vVPvrUNIHE55CxsJKg8QJeLY0jmFuS6a3QLcfiK5zNED+4wMVpXz6U2
	+HyfKhj0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lilBJ-00GFsd-4T; Mon, 17 May 2021 21:53:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lilAt-00GFqG-B0
 for linux-snps-arc@desiato.infradead.org; Mon, 17 May 2021 21:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Description;
 bh=AvVqeXMFCVRvkx1cXQGuBzQZTw/jHGkN1psZ05ce4S4=; b=gbaVNIct4a90SEk19I7sz/0opu
 ml7cK3n1zfII427h01+wm5kiC84sd7P3DJoDcriWaAGLhuC0KUM1TyfejXS1lImLal/Ihr42Zsoye
 lrGtMrYruRXYk+9qwIQGHFYj1m/xmC1kgkNtegoPWvtSqAXKOuDLGr1FYPYjBBc03F4duXeSyiGHq
 aqAWYu0WVGv1D8ct2q2I8qf/gC4p12PGhlrispxMh9kRmDgniiEsbz70tbu3qSRizI529JjAHNvkF
 xo4d5tSKHx6MMBse79J+VitKUpTx22OO2u/uACag4tfROG6L6YA3cRHgtYY5zRSwe7l4uAUH7369h
 Te0ywnJA==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lilAq-00EAiP-9B
 for linux-snps-arc@lists.infradead.org; Mon, 17 May 2021 21:53:17 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5917F40150;
 Mon, 17 May 2021 21:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1621288393; bh=AvVqeXMFCVRvkx1cXQGuBzQZTw/jHGkN1psZ05ce4S4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=OAlFcFFy1hmqnHBq+ijsF+rDjoeddAH+CzzvJzVi3GwyDUAnri68qxk9HmpJH1hnS
 4mnj0vqq0tBYxTYeQ2fIi0byNjBeVxo513uxyUefjOdVtk8VZ156CQYh7FoyNZ74D/
 XpCQyPtrWtdO4AieCj+p4m6DY5OckXj2UOVDLJDrbcj5Uy2UUj3aCFO7+KsmzfeyMd
 Fl2Ialcf+zDZDL2PPJq+VeL3fsg9ntaJlRcxnViszG8YyuezD0BhJQJvbMYUbzoy3U
 GQL/qtMo130FwO6/EwwneW/0pUX9t0eaFs1qKmXhQbVtPV/a80rNejjbYXAv78ZVMw
 D81T33/hl4wLA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0F073A0071;
 Mon, 17 May 2021 21:53:10 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2170.outbound.protection.outlook.com [104.47.73.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4C9E9800C4;
 Mon, 17 May 2021 21:53:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="jrM1kifD";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCAbbrlVg+yTvKmEg65vK0qduin3GEyPZ67FqCI4Ahi+OvtZsQEREYOi/wc1DO9x8p1eOXZ3GujUN9J11NIIujM2EK0MHTYrwd63onARAb+jt3Myz52RI0v4kecosJCukTQCO/6Onavi3Mz1U4o5eP/dwfXmk3NOSX1sqDwJ4MYvmgBeGkv4sY0th3sL0ceBl0rYn3d+iwD+1q9oKspc6dWY+7FF5x76IOgphJmu3sPlVP0FGbjCQ5c42r6Bfajl7DfxvlpUaQXug379DMhdUoO/ulsF8Mf2pHxhlGby44xSr3PxzL9XVE/IDaYl/vli+Sp2lydBbaAFA/QbuOGdWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvVqeXMFCVRvkx1cXQGuBzQZTw/jHGkN1psZ05ce4S4=;
 b=ehRVpSlKP7LIFVJz8XtlcnT9xybxRyMoM4G0SxV8VZ3unOaKsKduokvyHeCv8JpUgC9vCwKPje8oNyhtEACnQ+zE3DgJ+r58PN146S8rszLxcfMJSntqT4HAtGovBM9TtcoXjD6piSlK87epxbQpsLfgLZA215QLcTnMMMkb7tYRaoJKrsJBn5ehOW9uIxh2M6TFM2THfZUKKCS+rk9yQceTHs2miiG9ZVqpmF7pyHeXb/H8Jj3VjmQlvX19bpmZ0hXFCQqu0MPA5+E31+JGNCHIn4vgGXOLrwDC/JhFJ7WHbm0WACDiwDHrUXyGBCxlEufQKtt6VqZNOZxaU2oftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvVqeXMFCVRvkx1cXQGuBzQZTw/jHGkN1psZ05ce4S4=;
 b=jrM1kifD+5qkInAHtc5ksu7IpRvVJf5ZoT7v/ot+UIGpB9xWl38MYaqWhZP14XJ0x8iXUN7ECAeS28uNpMCqD//PbcDSYyAI39AkEGTixudpXv6IdBwZ+PktFmBUV9wynUqne9+JDaNSeg7Z0H06TgG/39gx12ZSTClijdVj9mA=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3207.namprd12.prod.outlook.com (2603:10b6:a03:135::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 21:53:06 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 21:53:06 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
CC: "buildroot@busybox.net" <buildroot@busybox.net>,
 Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [Buildroot] [PATCH v3 2/4] lmbench: memsize: increase delay for
 slow FPGAs
Thread-Topic: [Buildroot] [PATCH v3 2/4] lmbench: memsize: increase delay for
 slow FPGAs
Thread-Index: AQHXRcZu2ZuRhNCaq0WcojAKp+Bo26roJW0AgAAdDYA=
Date: Mon, 17 May 2021 21:53:06 +0000
Message-ID: <0c486431-d2fb-d7e7-0c35-9d419b31b48a@synopsys.com>
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-4-vgupta@synopsys.com> <20210517200906.GE2506@scaer>
In-Reply-To: <20210517200906.GE2506@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: free.fr; dkim=none (message not signed)
 header.d=none;free.fr; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7807294-02c6-49d9-369a-08d9197e2731
x-ms-traffictypediagnostic: BYAPR12MB3207:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB32077A12AAFB359A645AB5EDB62D9@BYAPR12MB3207.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3FOUbyj2yHN9E5GgWBjGy9trWcp6kkzI/2VRgry/MtX5ELrRmOAd8EGqsq7bsAtleNiofGRI0tg+a007+IM5t3qH3HLzlB5n5sydBLeYR43qGDamQEoPYc1DpAhAlwTL4RdrZQmylcz6d6H5f+7+6ud2vgzHNQJbQf58ikEQ9s6CveHuAJU8dgphfnfwKcj4bUcJ9poJ//1Yuta81hV9APQen9HiPJy4d3/n8DC0an+dMb8ArwBz8Koyoa0RvB2VKopYeXLEAt5/Vlq5o4aa2tN40N//hG4Mcfphh8uFRiBLZeBJSlDsYQtCSae1yzOrDgU5wMSTbCNmWyJy7u+oKKbg1he/0La8iX1ewlpmuqPAUdl/o3HZcAO/A3elehBFyXdSRw5KTy9W+xeh2QpbjTM7JCRZiy106PdHFkuSngC0OWTYL53rwc56MnLjzRydEPM8PJjC47QBv4/NjNQToUTixbsBA7v7VqNT8Qh3DLrcL/o0TML713G8ZNIgE3/yKzQrg2KyixMLuUn42E/DgoLEeD47prCBiX/ggnIW2IyklZIHlVyoobtNCBsfdK8Vbt7+aeHoE0DEz3/LjFvCDj8D3vohOQd1HuxFb7oGlB+DkU/TIfIZuK7r7EF8jxiqqmu9wFwwxWDh8V+bca9XdMb0w9gGyFzEnWmWmCSw862qIOAZxYRB6S3YFuk3BqgW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(346002)(39860400002)(376002)(396003)(66446008)(6916009)(2906002)(66556008)(66476007)(76116006)(64756008)(66946007)(54906003)(5660300002)(2616005)(6512007)(53546011)(36756003)(186003)(4326008)(6506007)(316002)(478600001)(6486002)(107886003)(31696002)(83380400001)(8936002)(31686004)(86362001)(4744005)(26005)(71200400001)(38100700002)(8676002)(122000001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ei8zcHRYL01HYUhzVkhZaXBTbkxsdFkzeEdCQ1FEQ0hidnZSY2xwOUdLSjUy?=
 =?utf-8?B?RWFuekFvSWRTWURZQ3dxZXNIV1V4RG43NERQakVMWm5PcjFvMGViaUQ4Uzl1?=
 =?utf-8?B?TnYyU2liZlRmSHdWaEUrYWpHQWdLaTR0RHJBOFp3dGo4SDZDQ29sdVVlWGFD?=
 =?utf-8?B?ek9qRFhkRWVlZ2dIdXo3UDRyM01HL09mU292QWdxTUlrR250ZzJFQTZ3Njdz?=
 =?utf-8?B?UHBtSTFCblErOGh6eUhrZUhoM2hoWmFXS29Kdlk4RVJYWGt3VG5FNWorM2M1?=
 =?utf-8?B?NjJCbmhWWWIzbkxnSmVOVzEybUVPL1ptelBqRExaSCtONmZmdW4rSWVib3Q5?=
 =?utf-8?B?dDdnU0pBSms5Q2FJNXQ4dEtOK1ppcjJmNTF0ZDVyUndmVmxHS3M3QktxMmRV?=
 =?utf-8?B?WXE0dkN3a1pHMVpEUnFkNUphZzBwbytjSk9pYkF6ekFCL3EvZ3c4M0lIclcz?=
 =?utf-8?B?WTJ4WGs3VnhOWnJBb25CUkcwa1ZQSXNoZGNGVXJpZkpMdGFpSjFIc3FvcW9s?=
 =?utf-8?B?QlV1cFVyVW9XZVBUM1FHL0VIa01NNHZodVQ0UC9JMDExa05BV2VmYzV6Y1hJ?=
 =?utf-8?B?d2RFRmtmUUdiYm9nS3htTXJIOHVyU0RMOUhyZVJzVW56ci9rdCtqMHBMcms2?=
 =?utf-8?B?eDZnODZkKzFLWitpV2RUdkZoc0djc3ZOVU14cEFRanhQeDkxZW1JT2RveE5J?=
 =?utf-8?B?TEM0YThxS2hwZ2JaaFU2UjlVV21EZkRsTDM4TStUU3IvRFJSWk5NWDZvWXl6?=
 =?utf-8?B?VEVSRktsQTg0Qk5EdnhKVUU5eTJ5SG5hV0VrN21Xd3FYRzR2N1hWamNHQ2U0?=
 =?utf-8?B?VnZWTmE0M2U3T05nL3l3RnU2ektlZEw3M1hJTWROKzV2czhKOTl1ZkxGUzhk?=
 =?utf-8?B?Z0czVEZKZHcyOUhvOERmbGdVWHRRRVo0TFpMMnVxNGMydUU1a1FVaEtsQlBQ?=
 =?utf-8?B?c3JicStVcUtpQ2hyWlZrMThQUXJHY1Iwdlp2MXkvV0ZoWFNtbDRaWFFBTnJD?=
 =?utf-8?B?dXRuWmZqSkdNTlZQa2hQNVRkU1ZBNlFObURTTEFrQVZwN0JJL1lXV09JQ24w?=
 =?utf-8?B?QmQ3YnEyZkpQWjBpVkNwcERtMVBtTktUM3RGQUc5ekNFWk9BM3BFR3Q0ZUh2?=
 =?utf-8?B?VHR6STdtSGRNWHRTK0hKYjVhWkJzSTJtTGo5eFNvTzhUSWgydnQwaHdQVjAr?=
 =?utf-8?B?d3AyVTlaWTd5azZZSmU4TXMrRnNxekgycHV5d0kxaUFlUXFnZFN1R3JCQ2xQ?=
 =?utf-8?B?M1pPYWNEQzd1UjI5eHJOelczdjVIQko3NGVYbDZUekpqSGRBaVJicXJTclQ2?=
 =?utf-8?B?Y3RUSGhTWitzOTdyRllFOTI5YkhheW8wTFI0Nk1sN2pXNllQSlR2Q3ZUS0lJ?=
 =?utf-8?B?Q3V5bVpselM4c1IvWVduY3RVa01TVXJxYjducmVCazRFYXNoOUhyOUs2YjRD?=
 =?utf-8?B?ek5vSjEyVERoUk0rTElXd1FzdW9iY3pUUlNiUGpaOE9WUGxrZzUzWm9EeVlq?=
 =?utf-8?B?UFdoZ0M0MGpNdE80dXR4ZUhiU1Vab1VVWTNrVUxZbGZDOGVEWmc2Wm43Q1d4?=
 =?utf-8?B?aE5iQWp0TEZsY0tjejh1RXZtR1dqd2pxc0Nqb25maXpxbG82NEJCZitKUXpD?=
 =?utf-8?B?L29GMTBta0hHNkFvNkpLbGxoNHI4UVJ0a2lqRkNLZXpCcFh5ZC9qWUZPdkVZ?=
 =?utf-8?B?WEtuOFFkQklRNkI5eTlmNmUwblNYdjNuTXhWdHJHNWh6S045SFVqSDlOQjlq?=
 =?utf-8?Q?lD1yVJPUGdql1+Fbbc=3D?=
Content-ID: <0794710295EED544A537C4AC2D2E5B5F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7807294-02c6-49d9-369a-08d9197e2731
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2021 21:53:06.1777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CzJzYX+63I1bYL5ZPb+K9UFG3DUD7pcFqfBsHXdcnBM+JRsTBp8n8e5aFLJ5HFKvlTh1cGmmlpyu41stFcyMpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_145316_409530_C62B3334 
X-CRM114-Status: GOOD (  16.45  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGkgWWFubiwNCg0KT24gNS8xNy8yMSAxOjA5IFBNLCBZYW5uIEUuIE1PUklOIHdyb3RlOg0KPg0K
Pj4gT0sNCj4+IC0tLQ0KPiBUaGlzIHRyaXBsZS1kYXNoIGxpbmUgaXMgdGhlIHVzdWFsIGdpdCBt
YXJrZXIgdG8gZW5kIHRoZSBhY3R1YWwgY29tbWl0DQo+IGxvZywgc28gZXZlcnl0aGluZyBiZWxv
dyB3YXMgZHJvcHBlZCB3aGVuIGFwcGx5aW5nIHRoZSBwYXRjaCB3aXRoIGdpdC1hbS4NCj4gSSd2
ZSBmaXhlZCB0aGF0LCBhbmQgYXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4NCg0KWWVwIEknbSBh
d2FyZSBvZiB0aGF0IGFuZCBzb3JyeSAtIHRoZXJlJ3Mgbm8gZWFzeSB3YXkgdG8gInVuZGVybGlu
ZSIgDQpzdHVmZiBpbiBhIHBhdGNoIDotKQ0KDQo+IEhvd2V2ZXIsIEkgd29uZGVyIGhvdyByZWxl
dmFudCBsbWJlbmNoIGlzIG5vd2FkYXlzLiBJbmRlZWQsIHRoZXJlIGhhcw0KPiBiZWVuIHplcm8g
YWN0aXZpdHkgb24gbG1iZW5jaCBzb3VyY2UgY29kZSBzaW5jZSBKdW5lIDIwMDksIGFsbW9zdCAx
Mg0KPiB5ZWFycyBhZ28gbm93Li4uDQoNCkRlcGVuZHMgb24gd2hvIHlvdSBhc2suIEkgdGhpbmsg
aXQgaXMgc3RpbGwgcmVsZXZhbnQgZm9yIGVtYmVkZGVkIA0KcGxhdGZvcm1zLsKgIEVzcGVjaWFs
bHkgd2hlbiBkb2luZyBuZXcgQ1BVIGFuZC9vciBJU0EgYnJpbmd1cCAtIGZvcm1lciB3ZSANCnRl
bmQgdG8gZG8gcmVndWxhcmx5IGF0IFN5bm9wc3lzIGl0IGdpdmVzIHlvdSBhIGdyZWF0ICJzbmFw
c2hvdCIgb2YgDQpwZXJmb3JtYW5jZSBvZiAyIHN5c3RlbXM6IG9sZCBhbmQgbmV3LiBBbmQgdGhp
cyBpcyB0cnVlIHN0YXJ0aW5nIGZyb20gDQpmb3JrL3NoZWxsIGxhdGVuY3kgdG8gbWVtb3J5IGxh
dGVuY3kgYW5kIGJhbmR3aWR0aCB0ZXN0cyB3aGljaCBhcmUgc3RpbGwgDQpwcmV0dHkgc21hcnQg
Zm9yIHNvbWV0aGluZyB3cml0dGVuIHNvIGxvbmcgYWdvLg0KDQpUaHggZm9yIG1lcmdpbmcgdGhl
IHBhdGNoZXMuDQoNCi1WaW5lZXQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zbnBzLWFyYwo=
