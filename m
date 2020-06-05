Return-Path: <SRS0=Gpdw=7S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD0BC433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Jun 2020 20:47:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80390206FA
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Jun 2020 20:47:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vEQI5C+J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mF3klbIW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="frg9E9KH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80390206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82gGSKNkUiHTTM+HdmjjcSDvDshDfm1a94Q6V9AoMuc=; b=vEQI5C+J1YbKBz
	FctZQscrzauyEl5ufVlF2hZ8jfj1LxCTT/J4FYb5zZOl1mTPB4Dr+Wg6IMFQpXesdAFC9CjlgXCr0
	qzcINzUYaqGvYblYBT2pj9YYsYLTMT91iFapUGejtiP8qq4eQJOFPJWhUTYjYtZ/ZzkDfe1DVlLFa
	AiIfq3okfy6g7+kns0Rdn6SBTDB3qRq/rFcnmLyT+s/qufOFLWu3ik3Dh6/Z+Vze63zQQTDFgWNoy
	yvXCx9beUsD4qXHpnl/Oaxr6bR/DfW17cM8JIL0S5G/i4xBGafEqbz7MmH+Bt5DflyRo8GCklHuNA
	NXf7cwsyUjkkR6UyxTGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhJFa-0004fA-Ir; Fri, 05 Jun 2020 20:47:38 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhJFY-0004eN-JA
 for linux-snps-arc@lists.infradead.org; Fri, 05 Jun 2020 20:47:37 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 295384006B;
 Fri,  5 Jun 2020 20:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591390055; bh=z9ptdQfBaeU6WQ1RE2fqN7ybJfiqewkzRy8CDspVUhM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=mF3klbIWA1vNseA0AsS3Bzd2Lg0I7kNPbl8kqTxGVvPJ2CejhyvK2ufGBLsAH5XLB
 YSVsRIAuGKNgJvHTqHSi7cNOVnSfTjtLOQXfHNGsC2tihqkQskUIKQ7ozldyacR4DU
 V1sdC8P1LwrSf0N3hBHwZof0qMrmbIYV/zoFrZYyPN4TZMNZKS9yFwV7Dmg82zlIFv
 7IJs+qhhdoF18cefgGwvKg8cFCF0Dzxk091UXCfP1tzqAc6tswJcxPq7PWxx7qIZXy
 7FuTspAwfdTvv53Vt1HmtqVZBOwrJPzndlSHvcRpwjnia9W9xq6pO/gaYujacHSIvd
 5DHQtpf8WJOrA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 10DD8A0067;
 Fri,  5 Jun 2020 20:47:35 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 5 Jun 2020 13:47:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 5 Jun 2020 13:47:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6dGOPljpElpqNVNAD6Kjb6SOMWIOFNSaGxT7V4W69/LzScBCUZ9Tc85wSoXQOXiuWzi5vKPNX63hHCiQ1Dpm1Y2HmOVT37GJZUz8pYnrKoj41zq6P8j9L5A5eIWivKiliQNiLrTKwbDtmLjffJeeotpxMS5U4r5+j4RLAFo9vyJrRGWhez1dCf8/yHbORWjPsVMZPedm+azTNWRcT+8qOLCxeCxVp4dE9dThA8UwSL8ugbNVl732m01gWgMYlrgCP5gUaMiExURouutPzYUsqjSorV7uCOjk5z/nLeWiHahyTm/ZWMNiTgIWuM2N4NhxEMwCVGkKJgtzEtpns+Ocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9ptdQfBaeU6WQ1RE2fqN7ybJfiqewkzRy8CDspVUhM=;
 b=XSOKV6Z8YaqSwQRfZ47mGrlBLuCBMUCgL89xNjF1kShXfyQaczMzXS7iHpwmAhnQdax0JrEpZl42Rj4RY2ACdI2Ek/ExgBLkk4A66EvTcXX6jaxrnyvwKScoZKScv/OoWFs097aEm1/7j4kMxTNZTeu3Vi7oYHot0GC0lP9OALMOLDKZo2IfUEwz3tgw6Y91SYwS8L2V5gebs7jwLvjWZmYlL3xvLIiQGOC2sSETPoeu0lVZGHskkn3tJcISCrLUJW+6YeeNXbn+6q16U8PUxAMzFGDX4UK5Icj4AKWyDHlebmQJriPlm/d129gi/NZorXE6lQ7LXnFNCKP7ACZAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9ptdQfBaeU6WQ1RE2fqN7ybJfiqewkzRy8CDspVUhM=;
 b=frg9E9KHRLBYzfy0defcUztMf0SZp3PX6j56DXXbdCIqiENNPsKz50hclCBl2X1xFBjCMNNvHOjGmr55vyfpZvlqBBRKGBOwbUVYmURJRNQmArN03MX8Qa1VRb7uGQQjDLb2gfUgSwpAX6tC26zYOzC/0Ie0cDmQmlcPFNjv1g0=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2982.namprd12.prod.outlook.com (2603:10b6:a03:a8::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 20:47:33 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 20:47:33 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v2 1/2] dl-runtime: reloc_{offset,index} now functions
 arch overide'able
Thread-Topic: [PATCH v2 1/2] dl-runtime: reloc_{offset,index} now functions
 arch overide'able
Thread-Index: AQHWOGKkEqp5JH0t2kOZ3CyI6yT7E6jKe4CAgAAIyoA=
Date: Fri, 5 Jun 2020 20:47:32 +0000
Message-ID: <0bddc8b7-0497-813c-a4bc-11dcea49ba79@synopsys.com>
References: <20200601221823.17861-1-vgupta@synopsys.com>
 <20200601221823.17861-2-vgupta@synopsys.com>
 <34af7ce6-e0a2-1391-3be3-a4df7fc10ecd@linaro.org>
In-Reply-To: <34af7ce6-e0a2-1391-3be3-a4df7fc10ecd@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48857edd-6fce-4633-a877-08d80991abd2
x-ms-traffictypediagnostic: BYAPR12MB2982:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2982E91C56797B3FC1A7F256B6860@BYAPR12MB2982.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0425A67DEF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RKmt49t2QNAr6nTVaReSZeNmmkwo+CIFbgmeahPzgUNynrolI4uavn9d/amK4TL2WJ1ir4kRYqlHYifveXtklrgXBoHlO86Gonjk/QrWqO5qUonuolEzemHtDfBf0ubFpYR08feVfB6/p5bnf7FH17k+gVZihyyKn4s33bEo4iaONpWFJHCbu8/BKaX9UzX7AVYFmFv4ugJCCq1a4gEehtlEeJonZeEGFjpe9jTjszYCixv4DXopSfAigO8o+JiT0r2VgDMUaNmpp2b6VTIn1pRbwd1AjjARwi4RudS2oFHd7YHx2UlMQ7QEE9vbi8x2zglFr8pMEuy2RNlF0A0aEs4hY03QyImvQL5BDRZdq/WNmTlfhF7cI/I5nOKZvlUEO24INcxWtdyHW71zBxmRjHQ19b96jYT0b02VjmT6+xployDw6qlyzcHG4dqEqT3x
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(39860400002)(136003)(366004)(396003)(53546011)(2906002)(86362001)(4326008)(31696002)(6486002)(66446008)(66556008)(66476007)(6512007)(64756008)(8676002)(66946007)(31686004)(4744005)(110136005)(2616005)(478600001)(5660300002)(6506007)(186003)(8936002)(26005)(71200400001)(36756003)(316002)(76116006)(151773002)(142933001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: +uELx9MJ8UCh63YMhmIF5E//G0E7JF59MhDzXJezUiTnH3hNJOxiIa658uXNd8vKmm7EyQDj1vo3c/85yeHFrMrDJlTzY6PCrPC8OXXOSe2kGTWlpcsFE77cFkIdAYSxPw8eUMyfVNgxZmHBQwM3YKBKxoek4Fz3zRa7906U7SsJbAWnBep/hJkMNv5B/7Kem7AwyjSB50nWuJ0Hhi0cc8aM1sJl0lLcqV11grAWlT8g36dYTWT96yo9N0UlcNvKBv80hpvtK1y7Dhi+phBfz7kT9iRaiz1sslATGkhbznLAlEToBxrpuql069BA8NnRAcbQD17fcGgLxk/Px/EKMezn/fqVpaPAls5svonaDP8EBB5Ci4L2aH3rQA0um/doLMRDwYLHxBS+3/REKhf5GRXcbE7kZkPAHdEPolK+jBNJdv9IADnHIUAcPYmyHKaXGTvwvRJtpulhFYlPnezcpgBdbuFlcXQKAPZJfDq3RKU=
Content-ID: <53CD8DA2DF06F24F85F4C4476C5FB96C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 48857edd-6fce-4633-a877-08d80991abd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2020 20:47:33.0013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nyTJNIjJCfFUer83zm2bku6e+zVnp+e/sOTLGNO5laXmZGl0JdjRXX2sLyKMJwAyVIVYpt1bHaX9KD1WKXQLIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2982
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_134736_643287_34794D88 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/5/20 1:16 PM, Adhemerval Zanella via Libc-alpha wrote:
> 
> On 01/06/2020 19:18, Vineet Gupta wrote:
>> The existing macros are fragile and expect local variables with a
>> certain name. Fix this by defining them as functions with default
>> implementation in a new header dl-runtime.h which arches can override
>> if need be.
>>
>> This came up during ARC port review, hence the need for argument pltgot
>> in reloc_index() which is not needed by existing ports.
>>
>> This patch potentially only affects hppa/x86 ports,
>> build tested for both those configs and a few more.
>>
>> Suggested-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> LGTM, thanks.  There are just style nits in the one-line comment
> for new files.
> 
> Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> 

Pushed with the fixes. Thx.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
