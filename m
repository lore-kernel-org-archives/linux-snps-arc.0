Return-Path: <SRS0=/nRw=AM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3497FC433DF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 06:09:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0F912070C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 06:09:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BJ7Dhu4L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="L9zceK6X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="p70vhlgd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0F912070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5JqisBNSDNzX5tZEmoka0e6b/Me+Z1TiFbpJ9hqQ48k=; b=BJ7Dhu4LnffYjGmlhtbZDdokc
	Q7MwqZ7XvSVE4z8aJSBmo2Os8KNHlsq4lxdTuCNo5203Oq96G8na8RxjPAB4vR8ID8MOoMEARjhnm
	LoejAf+dxRer6/27yLcIw4EsgcHOMO3zNwZ/Yetm++4NMsGu88nHYVJrol1kDQQDFX/y/WQKfLJ+3
	FbaFAxenWA9jdb42rd9wQHbpqu3weiw+hZejLMm/8sh2QR29/U6BZCtPbYpF0hFyOvG28oQ5pSnkN
	+ahtEZRyXW93WudwdZfTMC+M+Uc/weD6S7528cnYHCdlumSjYj62nCfTvVheOnwiSRK8hKlPMUXuD
	KVDJJ9OxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqVvj-0002CQ-5Q; Wed, 01 Jul 2020 06:09:11 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqVvg-0002BL-E6
 for linux-snps-arc@lists.infradead.org; Wed, 01 Jul 2020 06:09:09 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3227840269;
 Wed,  1 Jul 2020 06:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593583746; bh=ZbY8qB/3yzkBkuV++6sIJQ7DuYfEH5qTHWPwJf6nk5Y=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=L9zceK6XSmAznyzKZy2QhBp4Bmuv7KoiENu1mfAPTxgUkqphIS1UrE3B5WN3wzqXa
 GR8D5qThy97wD/FnA4T97WlDjabfBsGbtLQp+sNXNJm45hZ5XYA0pCNZ0ssL2Xlpo4
 ND58NxIbEwDj8pXhonlLBo337wwT/AKyVQut+6UzZU2vJ2dVStGae7NZBPouJ1i0PR
 7Vu1Oj70Pi1srRySFAD11qa+FdZ03o08Tvtv4LFjRaDiQKkJI2nKoKP1S/TSn5QgzY
 +HJWTwaQexZd3OogqMX+wvIWxZ/R+YYvibd2rJl7/Uq0h6mBoQowRXsciQyl9U45xq
 5VP+85CZkyjng==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 823B4A0069;
 Wed,  1 Jul 2020 06:09:05 +0000 (UTC)
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2058.outbound.protection.outlook.com [104.47.45.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id B3D67801C0;
 Wed,  1 Jul 2020 06:09:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="p70vhlgd";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W40a0+01MP1CRUSCILITUkAT/6StqjO2zoQlfzUqsJf57/anZxmv41+CZbvQrucP9PAOjWHY7QWtq4PGrv4nEwOZsxEiLL0Y3a1BKOlKVIxzsu/H80o6orXxdfTZJTqGgvScS8y7t0zDq3vmskxUnImuLR8UxZA3fBpom+aJauCK5lP2a0Td08dFeZ5+GXqh/akPOrjyEyiufZbLXjBex7hg5s8+JRuFx+1h0wRPOIrulJT89en9z3RXIQRPwp3ShPFf1NEDbD17d9ONB/5MhqZMNCqge48XS73+TPzSxTTGeQrA7jfWTMqbbM/vlDgpLhg91NQIP8LT+9qvlZALoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbY8qB/3yzkBkuV++6sIJQ7DuYfEH5qTHWPwJf6nk5Y=;
 b=Y+TCDec1xiUbrFuMOVvu6KbTX2kOjUeYAMXgztsdBO/wgAnN2jQ8137lg9YIb7wXzUGLBpHxh4AQDvKLAeK3HYxjPZS6KzKFqCfM7yO1R8lqJSS4Jzgu7me7GTbgP65oUNu9MNnWsAJhQxcqautLTq6krn4vwr+kbgY8Wh4j4eol9ahKoIBGSom80BjpEYRaipC8vI3MnQ/JYbNISLwUvPmGoJwf2/Z74KJgEhO5s+sIbpDzZbfocBYqQN0Q3ghUgXFg4X8C0k4r80mw/arseR3HGpqjFLIEnm31RbZjMh0PCeWdKjgDJWsaGiDo/t/KiAR6Gt9Pe7uhmmd1B7sv1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbY8qB/3yzkBkuV++6sIJQ7DuYfEH5qTHWPwJf6nk5Y=;
 b=p70vhlgda0I9SL1MP9FT0iw0QBKFbHCSQ5fGMQ7OYPl5U62wlAiArkgDjPpEI2dbTV4f2TvIBj/l/yxim/b0byh4Spj2LFk4MheYw7/65bGZ0cnrGAGTHU8UaQSnT1Kha70zzkeMTkIvAG2NOQI42MaAdEpiP5hPeL6+eAslZ/A=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4019.namprd12.prod.outlook.com (2603:10b6:a03:1a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Wed, 1 Jul
 2020 06:09:02 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3153.020; Wed, 1 Jul 2020
 06:09:02 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Repost: linux-snps-arc list msgs truncated ?
Thread-Topic: Repost: linux-snps-arc list msgs truncated ?
Thread-Index: AQHWSpJhT6pzq/OUlke9bgg2llBFCajo/EQAgAlK0YA=
Date: Wed, 1 Jul 2020 06:09:02 +0000
Message-ID: <1ba0d43f-eee5-ddd8-6dfe-1ea80a851ffd@synopsys.com>
References: <ab3ccdd1-37c3-ffaa-542d-e1e0019009ed@synopsys.com>
 <0eb5353d88a35bd89cb9e15224a4d648511395a5.camel@infradead.org>
In-Reply-To: <0eb5353d88a35bd89cb9e15224a4d648511395a5.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org; dmarc=none action=none header.from=synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a813ea9e-4857-4536-fec3-08d81d8540a0
x-ms-traffictypediagnostic: BY5PR12MB4019:
x-microsoft-antispam-prvs: <BY5PR12MB4019E7E68DBDCF30C3E499B0B66C0@BY5PR12MB4019.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /8Nxx53aC252qAK2x0HWkJAxz/G8Jml/skA+2C6IU7eQfYtQAt5cRYsvyHORvrkrhAvHOAnYXb+CCqDJrsq5TGx09ma99o0texlTz8fHO+KjU9vhnvvlqWJoMCKhG+sTqrZrJvvgEsF/R41jRRyPV32RgLhJBbz/R7bhKOo2ggoC7XXrYej5gyDIqNKfgSU8r+OTARyAUIa+AXLyrFYAHOn17XXm1zZL7bM/IEKSPk6d2/kaAKRvlNNdUX5pgb++/VOUn4S5XCmjPN0we9EidPGvRHHwOpwUqEhsnGdQHYXeE93Nng77+xH2IgsWkwDavNK/zDA/TawRz173itwDwfpVmXjS4ASYuz/pO9DRxt0LMsgHhCGFQx3ALLVTfztgh+NROYufP1kkyxUSBXtzttWnFgzcFdIAvdqW0idAO8Z4GM3Q0W6J61KjfwyVmAcI/r072W8kkndkY7lZ3RE7Iw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(39860400002)(136003)(366004)(346002)(376002)(316002)(8936002)(5660300002)(478600001)(966005)(6512007)(4326008)(83380400001)(36756003)(71200400001)(76116006)(31696002)(66946007)(6916009)(66476007)(64756008)(66446008)(6486002)(2616005)(2906002)(186003)(6506007)(8676002)(86362001)(31686004)(53546011)(66556008)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: XrTRF9f+RJUlLa7GQWvkIjnfnOrn/3lVloqHAIbUX1m9SuyZpnBtq1ub7iGA3s0m9LuH6pJYC0Ew5Mx2qenB/d5a20lSiBS2W/2KhjRc2TiyUozSnQw7+RPOBM8pxqHh2Wi9ZjQuU0D2cUj4XeBFllD1Jfnmwiq0DFil7FiNlX95al9+aQ5Zz938wnMbg1AYztbDiSHRRfydzyu1hI34Dk1mLyVYBUia7Bk+6bcPWu32rajBOhZCp+mbQbAZvxlmgjpFtyWXLiosGB2iweMrrYnGKZAWyRkFSL5xdY1/qhUjCivkODbIGTfiKufwzO3SImyxieoouNFZxmVhOHH9uSfkA1HqpBJw01hOrPTTgbqypSulZFoKEgozaCvcoay6tLQyshat2u1dmbIYJbwraL9KGpR43tSY/1gLDEpHSc7fjJErY4k9MiJJPFptL81nHSD48vsVEcP4HxudC6hE7YGx565GCDQgeia7DO5qccxq1h+22vVWkxWXixC9oiMn8y9VcSFr35P0q5XzWUmaU3YdBSQ71BNl+THuZ/1pyCUyKRg9OnII9Sw2rh4CiSWT
x-ms-exchange-transport-forked: True
Content-ID: <DE829CFDE5903040996501495DB2F8CE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a813ea9e-4857-4536-fec3-08d81d8540a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 06:09:02.3794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YBSE/H5cDxuum9By8hNvo5r9pGfe0jMnVr6cOYeNpIsAaArhKs+ayPfQLsYRG1PQFq1j6Za9OZUegBWIgDfDGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_020908_873606_6300AB65 
X-CRM114-Status: GOOD (  17.86  )
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

Hi David,

On 6/25/20 1:14 AM, David Woodhouse wrote:
> On Thu, 2020-06-25 at 01:46 +0000, Vineet Gupta wrote:
>> Hi,
>>
>> I'm the moderator for linux-snps-arc.
>> Is there some database corruption or some such. The msgs for linux-snap-arc seem
>> to have been truncated. Please see the main page below where entries for June-2018
>> thru May 2020 are gone. This must be a recent breakage as things used to work up
>> until recently.
>>
>> http://lists.infradead.org/pipermail/linux-snps-arc/
> Yes, apologies for that. The machine hosting lists.infradead.org
> suffered a total disk failure last weekend and a new machine has been
> drafted into service, unfortunately using the latest backup from May
> 2018.
>
> So anyone who has subscribed or unsubscribed since then will need to do
> so again, and the list archives are missing.
>
> If you can provide the missing messages in mbox form then we can
> reinstate them.

Thx for your reply and confirming the issue and handling it already.
I created a mbox from my local archives, what would be the best way to provide it
to you, email as attachment here, dropbox ?

P.S. My emails to mailman@lists.infradead.org keep bouncing, although I've
subscribed. Is there some snafu due to my email alias (vgupta/vineet.gupta1)

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
