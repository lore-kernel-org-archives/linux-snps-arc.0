Return-Path: <SRS0=ytJj=2G=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501CDC43603
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Dec 2019 17:45:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1B9020700
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Dec 2019 17:45:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rTeTOxfp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LCU2ubL7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="Na34sH3p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1B9020700
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDylu8R8oKtLgBuwcpUEGJLs+q4pjIWlgz36e6py+N0=; b=rTeTOxfpNT7lIo
	bFlTNrVeUi+T6f2KB3f+r3B8nYe6QjhOBpr9ft/zlBHmYCA91a8taZRc/Ff8cV8DSTorxhUeHgB/t
	Hp6FwHvwzxzaqIhB2UqGjURx8QNpGkOt6LEsUlLOBU/jYvZPVYT8yX5x4EaBZOLlFHiwBMdOCTPqU
	xilkF7Nug50R0RKye8Hq27V5rUtg4ALkT/WN3aVhOqIulq0UcOL75N4eI0aiVzozfM4ZN/hsKeE9I
	p+MRCR3tLS8ZzRDXihu4ckYt+nm9sQivWvzneKPi6GQiBIo7Rbn6s6lh5OmcLqCpBVkwpe329R8XE
	UI8y81Rufwf9OEhyWw4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iguR4-0003Ys-P4; Mon, 16 Dec 2019 17:45:34 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iguR1-0003XU-H2
 for linux-snps-arc@lists.infradead.org; Mon, 16 Dec 2019 17:45:32 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3E1A1C0082;
 Mon, 16 Dec 2019 17:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576518328; bh=JQFDsbBH1KLyGoki9IgZtEXi5LOU19lZa8bl4RBkW54=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=LCU2ubL7/kfWdOYfTTlbzM0ArniEcMtEMQ6GQEZrL5K0PhGc3KAbdL4+HT/1ODflm
 ka9LsEBgEHqxFUags4+nk7MyJ8Mm65VmPattHxMnJs6G92uNk4NxJ+5k+bDzwcABMk
 kYDECr+DsTfsUN8A0lU4hS75QyZKeGR4BKhYfj5bB/DVi60gABTU/OccvHDDE2LBmJ
 F+0L3y72a8DE561Xd8nbjup7rNg9VT1X062tN+3nfFwUuR/01BmJ8M1aFkq2C5bOwv
 yJBdofRE32b5rTKGcKxVprCowu0z7qwDXWxZsVAgWxm8/dky1+zKHOrz0aNu9MVFlA
 PyBzAdDs8qmRA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A6D0FA007D;
 Mon, 16 Dec 2019 17:45:24 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 16 Dec 2019 09:45:24 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 16 Dec 2019 09:45:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I77BGYNmYOYSKpdKxKjF37Xk7VwL4FVWXgbZgVNpgXmseYqFJ2xLFW+dhTuNfd251098UCnLzEVOfQjn9rvaYvC6pZC9wjrucbAVl/fxtByc+2zSvYPHAS9yQ67M/N2csCBLMM+dL6/McACVJnABQAMsLRy4ft/eUHNLs5Iup94KLTzqtQAMH+N1/boP8swFDo3Xr3vp3V5LCNuyXH7kf5aLyF6WF1V0V38jLrEBra9kwR4tAS93P8qqtReNC0xYs5Sz4gCEo8w/Kq7kGA7Jilqqp0UP7Akk5m5W6fsW9t2UINbW5q9BNx1j/ae6vUSo6aqwdSaw/rTG+9RDVCJdPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQFDsbBH1KLyGoki9IgZtEXi5LOU19lZa8bl4RBkW54=;
 b=i+lae2MxGhMarAEJ60Ef91VZO3U8uCwHpNmaxHCscK6/EjzUGNM8sKjFC/YXgBie7haf2sogyPLwveOYzQz66qqyCOcYCkUBY+nzrFrZgKplQC9CetcxqphhpQrXCAsm0kxgGH9PDm0snJcOSmJdGXm8xMU1JeITcqd/N1CxrImAk4ANjyHjbT4/GfewnBqxo4uC6kAAqdW9Bf0JCCoWMvYa/WDzNNc0kXEhYJevLSCcUxOgqqoC6a9I1Rig1KJn2ovq4YvfgcAswXEnF2AqwbHLyv8DtdkSwzZV/jA19xc7y7Fwfsd7u0f7HjqIthOJ+q9Q5dnYxhsxswwCiBZOVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQFDsbBH1KLyGoki9IgZtEXi5LOU19lZa8bl4RBkW54=;
 b=Na34sH3puwYHphUt3/m78FCqrdU97ULslEguybg5QBdRJTknjbKD9dyzDrc8pAII7m8/KUUhvn1J+uWguyq/l9Ey041ODKRFfAF2thja9jYDTVRmtEoqknbl2QGrIKyap32DSr/2jFgw0dz1HH56TwZLgh4T8Kj3QXvT6PyPIWw=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB2838.namprd12.prod.outlook.com (20.176.254.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.17; Mon, 16 Dec 2019 17:45:23 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 17:45:23 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fw@deneb.enyo.de>
Subject: Re: [uclibc-ng-devel] stdio fudging errno ?
Thread-Topic: [uclibc-ng-devel] stdio fudging errno ?
Thread-Index: AQHVsUeCwLJZNrfuJ060RxlMEGED2Ke5YfVkgAOsqIA=
Date: Mon, 16 Dec 2019 17:45:23 +0000
Message-ID: <ae915761-7251-a04d-019f-ca56d9ea1039@synopsys.com>
References: <77f8a379-f3dc-6d15-4d8a-20be0346e9f6@synopsys.com>
 <87k16zdz97.fsf@mid.deneb.enyo.de>
In-Reply-To: <87k16zdz97.fsf@mid.deneb.enyo.de>
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
x-ms-office365-filtering-correlation-id: ef3d40f6-9fef-430c-ebd1-08d7824fba2a
x-ms-traffictypediagnostic: BYAPR12MB2838:
x-microsoft-antispam-prvs: <BYAPR12MB28385985547DC730AD2877F9B6510@BYAPR12MB2838.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(376002)(346002)(39860400002)(366004)(189003)(199004)(478600001)(4326008)(31686004)(5660300002)(2616005)(31696002)(26005)(6506007)(53546011)(316002)(6916009)(66556008)(86362001)(66946007)(6486002)(54906003)(64756008)(76116006)(186003)(6512007)(71200400001)(8676002)(8936002)(66476007)(66446008)(2906002)(81166006)(81156014)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2838;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CSNproB5kRvWq08QD2Sf9oKUr42RZ0ZZg1Ou37p91ZFuxp9IAmX0OneuoVABNLQRe5K+k4eG4+apOf9j9QsNEyWuEGj45DnfdVncbgwo7yZYTtw8lZSTCwlabvCi/p92t3SN96uZqsXj1BY5FVcYfHHmpK8yj+I/GOchaY3/B0LVXwB81+hoKypBLw6RcM+BEFsp+Y3d027pXete/tUy3ostNBQfDfVdKstUVaWSp1r4KoGMMFNw4pS9P49zr0W9KcCthkOu32xFQK8XVdkpwDzGPrdAV7l/g6hHKroYyht6Itiu1e4TvhhRYOCgVxM8K5v9M2+uLq4SMnIFVKfILUxx1Iy6JkeV91F8JyZEmGLa6cxnGbr3cekAK48U/HVIj8R9uwqc8Vu2fb+TVrXc4rCGVxEIAzwjkLvXGQcW5Vzx0IJbrqvKCDUqpSwEx1O2
x-ms-exchange-transport-forked: True
Content-ID: <FC1DFD48F814B94EB3B5A0623DC02B33@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3d40f6-9fef-430c-ebd1-08d7824fba2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 17:45:23.3257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fWgNaxa5u2zh4rOM4A16OK3zf3YWx4/ndNzQMxjWs07a5TGR7ZC5Svr5FXWBkQNGIddOUOYeDS29+B6BGITEPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2838
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_094531_680789_B7646884 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: "devel@uclibc-ng.org" <devel@uclibc-ng.org>,
 "jan.vangorp_ext@softathome.com" <jan.vangorp_ext@softathome.com>,
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 12/14/19 1:37 AM, Florian Weimer wrote:
> * Vineet Gupta:
>
>> Here's a simple test case which shows the problem:
>>
>> 	#define _GNU_SOURCE
>> 	#include <stdio.h>
>> 	#include <stdlib.h>
>> 	#include <errno.h>
>>
>> 	void main(void)
>> 	{
>>         	const char *this_func = "finite";
>> 	        char *test_name;
>>
>>         	errno = 0;
>> 	        if (asprintf (&test_name, "%s (%s)", this_func, "my-str") == -1)
>> 			abort ();
>>
>> 	        printf("%d\n", errno);	// <-- prints 11
>> 	}
>>
>> The errno unconditionally being set to EAGAIN seems to have been
>> introduced in commit 568ceebf6adfc58c64a95133311268db6 ("Fix
>> infinite loop when fopencookie custom write returns 0 on error")
>> bakc in 2016.
> For functions specified by standards, successful calls can alter errno
> unless specified otherwise.  asprintf is not a standardized function,
> but it is reasonable to expect that a similar rule applies.

Right, but ...

1. Don't those standards specify the exact errno for specific scenarios and that
typically errno won't be changed to !0 if there was no error.
2. The EAGAIN being returned can be seen as "leaking" out of internal details of
the ensuing call stack.
3. This breaks the way uclibc test harness works. It clears the errno at the start
of a call sequence and in the end when notices the change it trips. It expects the
errno to be set (or not set) by the math routines and asprintf changing them trips
it. glibc test harness is no different - it would have failed in similar way had
similar errno fudging existed there !

At any rate the fix is simple to only change errno in case of a failure.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
