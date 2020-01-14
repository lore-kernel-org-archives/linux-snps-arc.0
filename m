Return-Path: <SRS0=v1Oz=3D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE683C33CB3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 21:53:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADDB424670
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 21:53:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JE8RhqtQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lMA88E+V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="lrNBsYf5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADDB424670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1Pny5R5ZAPdQffgVzKVot2mq2X4jizEQa21f1MsMh0=; b=JE8RhqtQzQ90+h
	KydhCA0dPd9b+7+YVVGCQpyl3BDf1m3Zqo9MF7UUo1qseVezGe6A16b0xPqUK5/flA/Rh/ogiI17z
	QB4fASdvkYmJvc6k1YuDdcrJGvOzwdWlcCipFSZz1zzX9w4wqHAj3vQfjHJYgoYRQsdsl9FTYjl6F
	9/K2rUcPaCCvhbHUthVeQfxWVU02Ov8QpWlCDXa4V/7n1q3gicolV1WLtb8Eyp0GZRvdyy8oaImY4
	9btXtkggjr42Phoz1P3P0K5CpfulBXxd5etLH224nSVjhMHLDW9FZKaKjKmCJVrLZtSnPOiwuH9lO
	HeqztUBYUm8ORqmSAGMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irU83-0000pW-Nn; Tue, 14 Jan 2020 21:53:39 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irU81-0000p8-Dq
 for linux-snps-arc@lists.infradead.org; Tue, 14 Jan 2020 21:53:38 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6B6E0C00B0;
 Tue, 14 Jan 2020 21:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579038816; bh=4XwYZ9v8Fz4KKfWDla2VaslFXw2C7n3oP7kX6lohgBg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=lMA88E+VPiWb6zXbx7nHAhX4qcPXTLzgfa4DuiMFWpij/YJz8+eo59WQL01S6NyN0
 ww/SoBXVXJ4PViuxjqksUK1qjtYSYHFfquYCDM8sLXec6SvuT9mRbEJxUTvfOymSbT
 yPeuKNgFK9TZc27xXNYYVpD60jHewcTpM+PWDoWkF4euJe0sO4pl+3n5yrbaszbNqA
 xyFiWcGLTthDSr6OiKMrEGOJrmfeURDyuCcPUoIe3GWh+0lqLJxXDbWP1PK52O98Hy
 Piv1g56wF+yOdl5NZXOMy8cZHe8bKm+B+k4tFaryr85WUbUadc0ZlsF7BuLbauSwWj
 rL+WIxeMz62Rg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D6EE0A0069;
 Tue, 14 Jan 2020 21:53:18 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 14 Jan 2020 13:52:48 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 14 Jan 2020 13:52:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5Dem2ZO1zKEewYdDjC+BIEmZuGdzIVVtyChHIeA92rYIlFOv6Csenmsi4OkIaUnF9uNwfwlagcfM6ukJua7MpaGZa12mkn2BrJENEkFl7R7A0Y6/O9NFdCT/vD+vPB+3vvOx8DSdb8pAkLIPmP8/phr5XcP2/Fj3jL48J2i4z2YdsSQPS65UInEDXq6rh7IiPN0gNpf8bJZ4jcyekUOjzxLsL74lK0T3v16by5MX+dQgNhmDuFU/IqBhaWBpqSIjGP7lLJh94XYscEeEqWaU8SEEzxQLxrQL6Q6tuzcMh1p7b2cwm35VrF+Kp5bf7b4w3+N0/fUTuQUoqNooEVRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XwYZ9v8Fz4KKfWDla2VaslFXw2C7n3oP7kX6lohgBg=;
 b=cOzc5FbslDsdvaI9FFlJfkJ1/F7p4sDee+6LAb9mG1bmAVKIVqQdVaaBmWg+UOdop/nIEJk7Z/zPVd9OnhLHYlcWIixtVh2b4CfW4UmO1upmnOkPrT7yGVc5ooyi9qUm/+69P3rnVmW9PcTnxAGBSbndbrkgliWnlbqlMuIcA+wG2FVXgy6NjkEqItH59r2WyGtQ4UKU0EknF1bEP/cnV4fvKPWV7K5Us1lQGqsuaL0KIy3sHiMycGj+a0kFunaqh8jeYHoiSesE/20OE29prQbX2xzFPGl19cLIuJ0/aQA3HHDg2mKyHDIiKiLKXkcPKUPsTYU50lTbfdPNoAHmLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XwYZ9v8Fz4KKfWDla2VaslFXw2C7n3oP7kX6lohgBg=;
 b=lrNBsYf5ebP2TWCcUxTG33lV3zpclsvOJwfia0Mpc8AKbcKS5bQaBZ/JfNCjDx3qAHBigWpVEZJtCSrzq5Iwp4sVSifOpPpNJ+RJN6X2yEbgGg+aW66/AL7JG1w9ZGsArx0sGXha/JAxvkOk1IzaVP9EFI4yihhD6mV01HWO2uY=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB2885.namprd12.prod.outlook.com (20.179.94.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Tue, 14 Jan 2020 21:52:47 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 21:52:47 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC 2/4] lib/strncpy_from_user: Remove redundant user space
 pointer range check
Thread-Topic: [RFC 2/4] lib/strncpy_from_user: Remove redundant user space
 pointer range check
Thread-Index: AQHVyxaGa9XIQ1INcUi806p/qvo5ZafqqyuAgAAIj4A=
Date: Tue, 14 Jan 2020 21:52:47 +0000
Message-ID: <72451406-6575-c16e-057e-30dc68ed9d2f@synopsys.com>
References: <20200114200846.29434-1-vgupta@synopsys.com>
 <20200114200846.29434-3-vgupta@synopsys.com>
 <CAHk-=wgoc5DaF6=WxsAcft_Lp4XUYTiRhhCJGcmM5PwEDXY6Gw@mail.gmail.com>
In-Reply-To: <CAHk-=wgoc5DaF6=WxsAcft_Lp4XUYTiRhhCJGcmM5PwEDXY6Gw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b11e8490-2dc1-4bf5-f829-08d7993c17c8
x-ms-traffictypediagnostic: BYAPR12MB2885:
x-microsoft-antispam-prvs: <BYAPR12MB2885157227740C85961D9050B6340@BYAPR12MB2885.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(366004)(39860400002)(346002)(376002)(199004)(189003)(8936002)(478600001)(6506007)(316002)(26005)(31696002)(86362001)(186003)(31686004)(54906003)(53546011)(36756003)(8676002)(6512007)(81156014)(2616005)(6486002)(81166006)(71200400001)(7416002)(66476007)(5660300002)(66556008)(6916009)(66946007)(64756008)(66446008)(76116006)(2906002)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2885;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RPzyAm8f6pgWKWRFiwiEftvXEcretL+o/xzWuvm9+Mh5ZObtVs4G3qWw91aBFktL3YxHoS0CBTvuRycsebnLx5RVbYi3SEqWqcclHh9Aybzvz5x40Bgr4JDd01yFNbUpI9Zp6E2aFvwAlR/DCtWqC9cpB9DxZRB7uoxSCtkSfmo5qWcPq93j7+xatggJqfx88TB12DzGS/N9w4zcrj1sjvSd466EtL12xZj/DDN2Saz+ZiACOKW7eeq07pBg/5xfaJBxg/q+upV/7UR6ycq9R6VWAjVIi7WxxZBahDAZ7JTaDhqP5/g0tjw/33TZbFGSjwvEAtpc40slm2m5ay0GLwRCm59Rlv8lZyIzw7/9ixGNb7UTuRuS9d3G+GJoOnx3HhrKW8J3QGmw9lghIW/BhXOyqT7vXKLyvKPsbXPoxOl5UKJEwt0h7lAgYKe+TXuV
x-ms-exchange-transport-forked: True
Content-ID: <E98DDBD8F53B0845B4739E9AE1F79431@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b11e8490-2dc1-4bf5-f829-08d7993c17c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 21:52:47.1549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p3DVTejsPJCOMnMQDtdLhYAevMHspqT3+nMmwwvXYgwGyWIxxdj034U2AIyxM13w2f/8y3DwEzKtWHLpOj1haw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2885
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_135337_578846_2DB61084 
X-CRM114-Status: GOOD (  26.01  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Andrey Konovalov <andreyknvl@google.com>, Aleksa Sarai <cyphar@cyphar.com>,
 Ingo Molnar <mingo@kernel.org>, Khalid Aziz <khalid.aziz@oracle.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/14/20 1:22 PM, Linus Torvalds wrote:
> On Tue, Jan 14, 2020 at 12:09 PM Vineet Gupta
> <Vineet.Gupta1@synopsys.com> wrote:
>>
>> This came up when switching ARC to word-at-a-time interface and using
>> generic/optimized strncpy_from_user
>>
>> It seems the existing code checks for user buffer/string range multiple
>> times and one of tem cn be avoided.
> 
> NO!
> 
> DO NOT DO THIS.
> 
> This is seriously buggy.
> 
>>  long strncpy_from_user(char *dst, const char __user *src, long count)
>>  {
>> -       unsigned long max_addr, src_addr;
>> -
>>         if (unlikely(count <= 0))
>>                 return 0;
>>
>> -       max_addr = user_addr_max();
>> -       src_addr = (unsigned long)untagged_addr(src);
>> -       if (likely(src_addr < max_addr)) {
>> -               unsigned long max = max_addr - src_addr;
>> +       kasan_check_write(dst, count);
>> +       check_object_size(dst, count, false);
>> +       if (user_access_begin(src, count)) {
> 
> You can't do that "user_access_begin(src, count)", because "count" is
> the maximum _possible_ length, but it is *NOT* necessarily the actual
> length of the string we really get from user space!
> 
> Think of this situation:
> 
>  - user has a 5-byte string at the end of the address space
> 
>  - kernel does a
> 
>      n = strncpy_from_user(uaddr, page, PAGE_SIZE)
> 
> now your "user_access_begin(src, count)" will _fail_, because "uaddr"
> is close to the end of the user address space, and there's not room
> for PAGE_SIZE bytes any more.

Oops indeed that was the case I didn't comprehend. In my initial tests with
debugger, every single hit on strncpy_from_user() had user addresses well into the
address space such that @max was ridiculously large (0xFFFF_FFFF - ptr) compared
to @count.

> But "count" isn't actually how many bytes we will access from user
> space, it's only the maximum limit on the *target*. IOW, it's about a
> kernel buffer size, not about the user access size.

Right I understood all that, but missed the case when user buffer is towards end
of address space and access_ok() will erroneously flag it.

> Because we'll only access that 5-byte string, which fits just fine in
> the user space, and doing that "user_access_begin(src, count)" gives
> the wrong answer.
> 
> The fact is, copying a string from user space is *very* different from
> copying a fixed number of bytes, and that whole dance with
> 
>         max_addr = user_addr_max();
> 
> is absolutely required and necessary.
> 
> You completely broke string copying.

I'm sorry and I wasn't sure to begin with hence the disclaimer in 0/4

> It is very possible that string copying was horribly broken on ARC
> before too - almost nobody ever gets this right, but the generic
> routine does.

No it is not. It is just dog slow since it does byte copy and uses the Zero delay
loops which I'm trying to get rid of. That's when I recalled the word-at-a-time
API which I'd meaning to go back to for last 7 years :-)

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
