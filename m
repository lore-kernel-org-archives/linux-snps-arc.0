Return-Path: <SRS0=Wyqd=AS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E32C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 21:07:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1B3E206E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 21:07:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SGDUzqT5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Wymy3qPZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MyUl4l4z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1B3E206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CAfz7JWYSpJel6swRy8HbAWSTdhjSuLpS/6nO33lBeM=; b=SGDUzqT5mYxmHeMZ5uISAcR4U
	O+vuU4o9aya1RwQQIsSfl70uTKpnQdf3lhrQGFMxOO3kncdGcZp6DXDJJs/uQWolrzF9cn9ktKIh6
	QVm2jtYg35ymrF66t3zX3iTDl9ncvjPNY5Om3+lRClTpVrmLFZheaWhm65YsyU36VIVF1t1DowzYY
	UfRf8tXZ4e+OKfOmkDdwAd2z0Pk4jW+tG4FyiBX/5OYbxGbue/ldtz0iDnj1jWoA8uIFcxAESyYwF
	pfYBFUiWAxsIri7m4XmQaCbo1W8BK2UelxcqW6rOPUM9OPmnRqC6WxklrEyW48UAkC/cdt0BOaCTa
	6EkELHAQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsuoK-0006LV-4O; Tue, 07 Jul 2020 21:07:28 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsuoH-0006Kx-N4
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jul 2020 21:07:27 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D05FB406E0;
 Tue,  7 Jul 2020 21:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594156043; bh=3GJ2aoNZL0E8xk2p63lX53hfps18h4thm4jQEKiChAM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Wymy3qPZEvy6QGUDjtdA+sQC1AZtpIb7/YIVS1+Xn+W1I5PPRXWRx6iWDtihFyufV
 14WCYI9rIVs/TElA8yVmWnW5RZRWlbZ63jSv83zUP7VH2YhtJ2+AeRTFuNWB5XBgAO
 ZZb4qbeGnGXIMVC/dZKNsrwAYqzD5NiIFEeyNSZ5ycMc9nh8XWGcevqLHhlKlA0T4P
 51GT8CoSyaKfoEq7KRZnMob75rmRjlflL4jiL5tnpuDXErdzXDPjgw6QnH2OMSFMNf
 XsVvZc57kU1gx68y/hy6OoGSFiYN96Ibv/kC4aWwmYOONe2FSsS15eA9ZBi7He+Acs
 4kDmMXhAUJ+Pw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id BA93EA0251;
 Tue,  7 Jul 2020 21:07:22 +0000 (UTC)
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2056.outbound.protection.outlook.com [104.47.45.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5E74C80028;
 Tue,  7 Jul 2020 21:07:19 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="MyUl4l4z";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYfMXemMpXHSkrCHcjzTeklJzz1EdoCcjPJ9QNCoF+a88q+dADwuYTYR3HeXEfT/n7qEA0f86pi1UJ/btDZosN+If+V99VfulsCCwK2unEao3pfP2BXU6kUc3A7v4KDult8kur0LhfeXpSdshSqEz6sWlgGFbClmLdYbvzkDoIko6uzAsfB13pIy+75qIiL/xQHedzQU8Sp4PGAwKjr42g7HViKLFjiOBFHrx2ONzxmPKFY2I9y/vatSSgOCrPdlT2+rTbDrPNTZhAYaArGTTJrog/9MMIzNuQTOY2OfaAgmh8zyQ0WlrWrhrnocTw1N9ZbTxxBniADYzralhCRYFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GJ2aoNZL0E8xk2p63lX53hfps18h4thm4jQEKiChAM=;
 b=S0b/VKLW+V06iP6vtIi7Mx1A+Bq5D8xJPXE90rNhTaquDG0Nx4tH0HZ52h/YAn6ABmg2qiiqSZViJhhQfSj2PL2bqYfr8vFYhzRVGFPL7++u60CHNujuqwhoRGn71MqL4uYqyTKOIn5B+J2NuaZ7pHaO65UP9RJXxcriYDROWzGnRoCYof3W2DKJ7C88rHHpMKvC4I5zrHOA3YfXvULlKo9MvRrw12cAlrlZoaGnZ3UrEuJPbMXNRrTnCGe+1rDeBEm8/VFgViQ17+2YznsCg8Qh40yiHxiGejh8d1hIbPF+B2hEFH8IFJqk6DjtVd5pdSjMbm7nTzo676TrVqwuvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GJ2aoNZL0E8xk2p63lX53hfps18h4thm4jQEKiChAM=;
 b=MyUl4l4znEUYZVDBlTPCZR4nwWNDJKML333TzMhRCiLZ8pS6pPgGJwotc7f0H/e3KqvEugiXDaS7lEuHxDUGENVpkDR+Y0MLoxknbPalJVwiM9KsAtNHJqcqweJPLEQbsuWUqOCVcsPe+SF+mfy7rxiIKUh763YA+9sl4keQgl0=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3157.namprd12.prod.outlook.com (2603:10b6:a03:130::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Tue, 7 Jul
 2020 21:07:18 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 21:07:18 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v7.1 07/13] ARC: Linux Syscall Interface
Thread-Topic: [PATCH v7.1 07/13] ARC: Linux Syscall Interface
Thread-Index: AQHWUbbDaTLzMWGcD0Of3DrN+Hn5Laj6jSGAgADKUoCAAS1/gIAAHM8A
Date: Tue, 7 Jul 2020 21:07:18 +0000
Message-ID: <0e3bf658-10b4-0428-02f3-f2ae01c77ddf@synopsys.com>
References: <20200615201441.31820-8-vgupta@synopsys.com>
 <20200701000848.20492-1-vgupta@synopsys.com>
 <e9e2ae28-cd78-5924-c1fa-52b1499c245a@linaro.org>
 <64e18e52-9dc6-6d14-3e15-8c5ff1c0cdc2@synopsys.com>
 <a56d0e2a-cbc1-9a2b-b145-0d59318426d4@linaro.org>
 <5feda452-d571-2ffb-5cb4-a71dc7033503@synopsys.com>
 <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
In-Reply-To: <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
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
x-ms-office365-filtering-correlation-id: b81479c6-35e5-4737-8032-08d822b9bb9e
x-ms-traffictypediagnostic: BYAPR12MB3157:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3157C5FF6237D07D93229DC9B6660@BYAPR12MB3157.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q81YER7S599axh6roBv+YNJYQtnTsgUtGAh/sR86kNY760TTtSryrLiiJHeDvCZQW2bdiuzkdic6U61Nr3bgJmaNAMnZ6AbjY2b3Cm2PGVn/chY01jMp5KuRJlM91P6oqo/HmIA9y9abMo1W9mQuWu6C5wRAeEKxGVcBbS1G9vPiOZWRI4YwtWCirh3Ub4jkxDs6EkvHPrxF4Xgq73WEfC2qJ4xhoSsMUjNE8vq4EzUvOf+ceJZoXd51O01CBBhIZMnjRGBSHXROfTReYlKwdnlp0aZTB+8OGaOuLEdULMLCY+hl3hIwZ7keUwpCEd9nP5QMlveqWJCczrQHy+3NKNdprPXRiNVE0GSQ/4memtskDtzREHR8x19X9DsoOe2hYecEUR+y7lsAqhYLmBUO2YPemctoKbuKiuphqwdflSrZM7+vDI2STYAz0RJnpkhKf0IJFHTDMtXsWsm48Nzojsp14gnCKAr+x/NAxIGY5fQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(366004)(346002)(396003)(39850400004)(86362001)(4326008)(2616005)(316002)(6512007)(31686004)(8936002)(83380400001)(966005)(53546011)(6506007)(31696002)(5660300002)(8676002)(110136005)(478600001)(26005)(76116006)(71200400001)(186003)(2906002)(66446008)(66476007)(66946007)(66556008)(64756008)(36756003)(6486002)(21314003)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: vl70MCSotwNKhLeSuj6w5aCNgvTFAYHjnV1jhzLvVaahf+/eCm9A8r4Q2hcOODCh8s82+QrUnI1xFFlUcQ/fMhVaKAzZhnq+5D7jSJEP+ESLzUJHy1jOkpzZwOyk+81lkE4gH2d3VKgoDikYZBiWnP1P5eoSnBMEs6aviU95bGJjou6CnELiUKkEsHeaf/4aqA0UdgpdmihfmnTEhEhh+wvJFrPGA0l/u0p3VQp6okDUO+0K6Mf5FGwHduUrquZmVYQ+7dK6tAOeUzemE2uU0Y0BtT6je3QjPZj5PFGfp76OcNXgmvo3V6Bd+2IcSn3jMQlBV+jlssbFLWc3mZzeC8H2+gN/L71uD979YJLHk3Zf81zSv+oreHpphf0MRNhLhgd5uUkhvpLTYY6lt0tZrICNQBdSRKrgAKDvVVNWFgupK8Tkg6xhzZYmLK5xq09dzidHp8zUROkbzOT3+J8yWTo5inqFBVcwzis+R7+asKU=
Content-ID: <EB1B151625F4BF4D90509CC4615D3518@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b81479c6-35e5-4737-8032-08d822b9bb9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 21:07:18.3307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ThBx6MxJnzMyePr1PD44tgS8nkNgCfBatoqO3H/ggY0XC1str92XgpMtEQTsc93C6S4E2M6EGQPOzk6RIt3RRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_170726_116468_0E4C6BF6 
X-CRM114-Status: GOOD (  20.02  )
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

On 7/7/20 12:24 PM, Adhemerval Zanella via Libc-alpha wrote:
> 
> 
> On 06/07/2020 22:25, Vineet Gupta wrote:
>> On 7/6/20 6:20 AM, Adhemerval Zanella via Libc-alpha wrote:
>>>>>> diff --git a/sysdeps/unix/sysv/linux/arc/clone.S b/sysdeps/unix/sysv/linux/arc/clone.S
>>>>
>>>>>> diff --git a/sysdeps/unix/sysv/linux/arc/fixup-asm-unistd.h b/sysdeps/unix/sysv/linux/arc/fixup-asm-unistd.h
>>>>
>>>>>> +
>>>>>> +/* Adjustments to ARC asm-generic syscall ABI (3.9 kernel) for 64-bit time_t
>>>>>> +   support.  */
>>>>>> +
>>>>>> +/* fstat64 and fstatat64 need to be replaced with statx.  */
>>>>>> +
>>>>>> +#undef __NR_fstat64
>>>>>> +#undef __NR_fstatat64
>>>>
>>>> This is certainly needed as they are present in ARC arch-syscall.h but we need to
>>>> use statx.
>>>>
>>>>>> +/* Replace all other 32-bit time syscalls with 64-bit variants.  */
>>>>>> +
>>>>>> +# undef __NR_clock_adjtime
>>>>>> +# undef __NR_clock_getres
>>>>>> +# undef __NR_futex
>>>>>> +# undef __NR_mq_timedreceive
>>>>>> +# undef __NR_mq_timedsend
>>>>>> +# undef __NR_ppoll
>>>>>> +# undef __NR_pselect6
>>>>>> +# undef __NR_recvmmsg
>>>>>> +# undef __NR_rt_sigtimedwait
>>>>>> +# undef __NR_sched_rr_get_interval
>>>>>> +# undef __NR_semtimedop
>>>>>> +# undef __NR_timerfd_settime
>>>>>> +# undef __NR_timerfd_gettime
>>>>>> +# undef __NR_utimensat
>>>>>
>>>>> I am trying to understand why these are required since arc does not define 
>>>>> them in arch-syscall.h.
>>>>
>>>> arch-syscall.h doesn't define them precisely due to these being here. When
>>>> update-syscalls is run, the 32-bit syscalls are generated for ARC (since kernel
>>>> ABI provides these because that was v3.9 circa 2013). Adding them
>>>> fixup-asm-unistd.h removes them (perhaps I need to add this in changelog to
>>>> clarify - atleast for myself).
>>>>
>>>>> And the generic implementation should handle the time64 variant.  If they
>>>>> are not this is something we need to handle it.
>>>>
>>>> At the time we we doing this, arch-syscall.h generation was not yet in place,
>>>> however I tried to undef in generic/sysdep.h for TIMESIZE==64. However I was asked
>>>> me to add this to ARC specific fixup-asm-unistd.h
>>>> https://sourceware.org/pipermail/libc-alpha/2020-March/112395.html
>>>> https://sourceware.org/pipermail/libc-alpha/2020-April/112909.html
>>>
>>> My confusion here, I forgot that this header is only used glibcsyscalls.py
>>> to actually generate arch-syscall.h.
>>>
>>> You changes does look correct.
>>
>> Actually we can add a few more entries here which have 64-bit variants.
>>
>> +# undef __NR_clock_gettime
>> +# undef __NR_clock_nanosleep
>> +# undef __NR_clock_settime
>> +# undef __NR_timer_gettime
>> +# undef __NR_timer_settime
> 
> It should not intefere since ARC also defines __ASSUME_TIME64_SYSCALLS
> and the 32-bit fallback syscalls won't be used in this case.

In an ideal world yes, but as we see from hacks in sysdep.h, there's code which
build/works inadvertently. If nothing else, this documents that those syscalls are
not to be used.


> As a side note, now that arch-syscall.h is based on latest kernel version
> and all the 32-bit ABIs with old 32-bit time_t have upstream support for 
> 64-bit time_t we can simplify a bit some implementation by assuming 
> the 64-bit time_t is always defined and adding a fallback only for
> !define __ASSUME_TIME64_SYSCALLS.

OK.

>>>>>> diff --git a/sysdeps/unix/sysv/linux/arc/sysdep.h b/sysdeps/unix/sysv/linux/arc/sysdep.h
>>>>
>>>> ...
>>>>
>>>>>> +/* 32-bit time syscalls are not available, but the redefines allow generic
>>>>>> +   wrappers to work.  */
>>>>>> +#define __NR_clock_adjtime	__NR_clock_adjtime64
>>>>>> +#define __NR_clock_getres	__NR_clock_getres_time64
>>>>>> +#define __NR_futex		__NR_futex_time64
>>>>>> +#define __NR_mq_timedreceive	__NR_mq_timedreceive_time64
>>>>>> +#define __NR_mq_timedsend	__NR_mq_timedsend_time64
>>>>>> +#define __NR_ppoll		__NR_ppoll_time64
>>>>>> +#define __NR_pselect6		__NR_pselect6_time64
>>>>>> +#define __NR_recvmmsg		__NR_recvmmsg_time64
>>>>>> +#define __NR_rt_sigtimedwait	__NR_rt_sigtimedwait_time64
>>>>>> +#define __NR_sched_rr_get_interval	__NR_sched_rr_get_interval_time64
>>>>>> +#define __NR_semtimedop		__NR_semtimedop_time64
>>>>>> +#define __NR_timerfd_gettime	__NR_timerfd_gettime64
>>>>>> +#define __NR_timerfd_settime	__NR_timerfd_settime64
>>>>>> +#define __NR_utimensat		__NR_utimensat_time64
>>>>>
>>>>> As for the fixup-asm-unistd.h, the generic implementation should handle it
>>>>> without the requirement of the ABI to add such tricks.
>>>>
>>>> fixup-asm-unistd.h is different, but this could be avoided. I know for sure that
>>>> ll code literally expects __NR_futex (atleast used to). But I can remove this and
>>>> see what comes out.
>>>>
>>>>>
>>>>> However it seems that we are still missing support for pselect 
>>>>> (__NR_pselect6_time64), recvmmsg (__NR_recvmmsg_time64), sigtimedwait 
>>>>> (__NR_rt_sigtimedwait_time64), and semtimeop (__NR_semtimedop_time64).
>>>>>
>>>>> I think we can add the redefine hack only the aforementioned symbols for
>>>>> now and removed them once we implement the y2038 support on such symbols
>>>>> (since the expected ABI won't change for ARC, only for old ABIs with
>>>>> 32 time_t support).
>>>>
>>>> Sorry /me horribly confused here.
>>>
>>> Sorry for the confusion, I meant that some of these re-defines are superfluous 
>>> and I would like to have the minimum required re-define to enable the ARC 
>>> support, 
>>
>> Right. The generic code needs a bit more work to eliminate the redefines altogether.
>>
>> 1. Following is not needed
>>
>> -#define __NR_clock_adjtime     __NR_clock_adjtime64
>> -#define __NR_sched_rr_get_interval     __NR_sched_rr_get_interval_time64
>> -#define __NR_mq_timedreceive   __NR_mq_timedreceive_time64
>> -#define __NR_mq_timedsend      __NR_mq_timedsend_time64
>> -#define __NR_timerfd_gettime   __NR_timerfd_gettime64
>> -#define __NR_timerfd_settime   __NR_timerfd_settime64
> 
> Ok.
> 
>>
>> 2. The minimum list needed for ARC (with annotations as to which generic file
>> needs fixing).
>>
>> /* Fix sysdeps/unix/sysv/linux/clock_getcpuclockid.c.  */
>> #define __NR_clock_getres      __NR_clock_getres_time64
> 
> It should be simple since there is no need to provide an extra symbol
> for old ABIs, it would be to just use __NR_clock_getres_time64 if it
> is defined.
> 
>> /* Fix sysdeps/nptl/lowlevellock-futex.h.  */
>> #define __NR_futex             __NR_futex_time64
> 
> It seems Lukasz Majewski has sent a patchset to address it (I haven't
> checked the detail yet).
> 
>> /* Fix sysdeps/unix/sysv/linux/pause.c.  */
>> #define __NR_ppoll             __NR_ppoll_time64
> 
> This is another one similar to clock_getcpuclockid.
> 
>> /* Fix sysdeps/unix/sysv/linux/select.c.  */
>> #define __NR_pselect6          __NR_pselect6_time64
> 
> I have a patch for select [1], it a bit more complex because we need to 
> handle both the timeout and the microblaze lacking support of
> pselect6.
> 
>> /* Fix sysdeps/unix/sysv/linux/recvmmsg.c.  */
>> #define __NR_recvmmsg          __NR_recvmmsg_time64
> 
> I also have a patch for this [1], although it still does not have the
> ancillary data from struct msghdr which might return SCM_TIMESTAMP
> information (which returns struct timespec).  The recvmsg also has
> the same issue regarding ancillary data.
> 
>> /* Fix sysdeps/unix/sysv/linux/sigtimedwait.c.  */
>> #define __NR_rt_sigtimedwait   __NR_rt_sigtimedwait_time64
> 
> The patch for is more straighfoward [1].
> 
>> /* Fix sysdeps/unix/sysv/linux/semtimedop.c.  */
>> #define __NR_semtimedop                __NR_semtimedop_time64
> 
> The patch for is also straighfoward [1].
> 
> 
>> /* Hack sysdeps/unix/sysv/linux/generic/utimes.c (need linux/utimes.c).  */
>> #define __NR_utimensat         __NR_utimensat_time64
> 
> Lukasz Majewski also has a patchset for this, I will check this out.

Thanks for tacking this.

>>> so we can cleanup these later once we enable time64_t support on 
>>> old ABIs as well.
>>
>> IMO the cleanup applies to new ABIs too as generic code should handle those cases
>> w/o these workarounds. But that would delay things further for new ports so I
>> suggest we keep the workarounds and clean things up going fwd.
> 
> I agree, this can be worked in parallel.

Thx for being pragmatic. Given ABI freeze we will merge ARC with workarounds and
clean them up in 2.33 ?

>> BTW, if one were to actually go about fixing those, whats the best approach.
>> Consider the simplest case pause(). For !__NR_pause do we replicate the code for
>> ppoll/ppoll64 handling or simply just call ppoll(). Later has a function call
>> overhead) ? Or there is a paradigm to use __syscallxxx_helper() although that
>> still has a function call overhead.
>>
>> Actually the pause case is really simple as there are no args, so just redefine
>> __NR_xxx trick should suffice w/o going into all the explicit
>> interworking/conversion etc.
>>
>> __libc_pause (void)
>> {
>> #ifdef __NR_pause
>>   return SYSCALL_CANCEL (pause);
>> #else
>>
>>   return SYSCALL_CANCEL (ppoll, NULL, 0, NULL, NULL);
>> #endif
>>
> 
> Each implementation has it ows requirements so I can't really say if
> a helper function does make sense for all of them.  For pause
> specifically we can even simplify to since all architectures have
> either ppoll or ppoll_time64:
> 
>   int
>   __libc_pause (void)
>   {
>   #ifdef __NR_ppoll_time64
>     return SYSCALL_CANCEL (ppoll_time64, NULL, 0, NULL, NULL);
>   #else
>     return SYSCALL_CANCEL (ppoll, NULL, 0, NULL, NULL);
>   #endif
>   }

But how is this compatible with older kernels (and perhaps this is a general
question). I mean one/more ABIs minimum kernel would not have the ppoll or ppoll64
so how will new glibc work with such a kernel ? Is it not required to ?
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
