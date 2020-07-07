Return-Path: <SRS0=Wyqd=AS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E273C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 01:25:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC00F206E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 01:25:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qR31SeKB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SiPk38v/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vPPfLtlR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC00F206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j6CiO3Cvd0vxUUva4qWPEWiWmBsLZYLyDubSe0dSdNE=; b=qR31SeKB5SWeV2AuX9Vf4L03L
	hOnx67TChcrdF51+A8dVqdjj4dDBSNS4eYN1gZjexD1nxqfQyQ6JjECGAYSzEm+E0+9Odcp2xOA+o
	KkM1u0fHVA7olvqeB4F0DcV3A3KVcWeFEyzS+opXuryUYCu/iptRWKB/EkfPdG8xCOyMsIBXa6mry
	VBwIP1q0ZBP5auzqYfcc3WmrrrUm8zsWRHnvr3zBW0Scu8D0Zv6Ui24eeikqL1fOFoid1qD+iovWC
	07esUyS1y08s25kBvnPKnRMQ4gglciZyVi9Y5bhUF52CM2DeCa305VCZQDabUMU+cv5ZqkYhKQqsP
	mENGVuKlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jscMH-00065s-V1; Tue, 07 Jul 2020 01:25:18 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jscME-00065H-8Q
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jul 2020 01:25:16 +0000
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9BD5E4013F;
 Tue,  7 Jul 2020 01:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594085110; bh=U8gslhcdiCTc5zqlPfb2FKfIt7w2ejIQMmPCYefTbkQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=SiPk38v/S6iw/IRdiCwGPijCn6pO0I4GtuEBvkjNsWuw/YJDYdF0hRYEYlEz5PKnC
 n2wuhmg+VlHRxueVnbHnOOZReeoDQCyDEUuUf6K1g04W5r/X3jmGMQSspHJYSJprZG
 yOZ+DShLLdUCRefhF9Tc7/HUNmoeWMak3KIogfEeM+tAuqVlJMPP1FHTaOjfBaWQAJ
 AzGmi+4Lh17cgqMEIs892IlWx3OB4ZN53su2RDP6pTGZrEU4TalT2eIJ9Ga4VYcbKH
 CZ7bdL+7uWLKRSTefXKmKgfdTjYxzBgS+4ocTFoB7qZ9eOni1rYRi7TVR33maUlBNa
 Vl/Y/8e/fGRKQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 27925A0081;
 Tue,  7 Jul 2020 01:25:09 +0000 (UTC)
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2056.outbound.protection.outlook.com [104.47.44.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id EDDF181113;
 Tue,  7 Jul 2020 01:25:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="vPPfLtlR";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LODocQLpP2z0JezG/ceqjvQ3d2eJbcoJqBQbAsnlCbg0WEzcQ3ce5jdsMH0Kr5hIcGlpMN0ZsuBw2puJG6/ks7J+pdt33Op4x6ucwWhjZUqhfLYhuu2K1AJOrd4nQFu1pcNN5yrE7efqzSUPl1s6X7/PZd4rAHD/O2yefeNBpS64aT4QWJsHXRu0EfuPSb+wOFDgKXnP33GyteAWRnmuJiGlRI1/DRfsFcE18HSfsXsM9LJiVYKYfwTrQDloHlFUgmnc4mG7WSQ9W+WcyHajJ4UUkyA9tTn8LU0LZnDv/zraWdlG8mRQ/oPyzTbzZ9hqsUFeRQGGApmM13TbxHU09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8gslhcdiCTc5zqlPfb2FKfIt7w2ejIQMmPCYefTbkQ=;
 b=bNuSzE6Jix1oHZ03EsALmTE342x2Xj9JBF4zoKJk1GnV/MJBsjOPTNVW+7q9SDiHgfCbZ+EvxDuKwenC+db/jxBpD9bdFAvW+tPDqmVWamyZreMbjXL861cqmjVOUnfxAkRH2UiYKDCRN+NKCfGtxhoAHNVtK+iMyysmIgkGjIN6uJy9rtc9YYRQGrjkR/+6wR6Etweo74AtRhLCBRx2AyPhXbl8VmEBxNvXmHChaQ9KHDeOLb1QjgcGajtFbYscxk60JQpwX0ytxpLi7ZxSlpCPt60427Sd9rim9axbQ6PNgEc69srNiAwTKPRFp1klRJYt+v5Iz0NBPKIORobBhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8gslhcdiCTc5zqlPfb2FKfIt7w2ejIQMmPCYefTbkQ=;
 b=vPPfLtlRi2ztXuRCIBO7Gmc+hsdZjSK+o2H3b++F/W0j+2EXWgS6qUqULACT5bgcGgo5eOKwUdpoGqoIPPH3XJS58daV1Ep9/R+OPJhrXao1xXASH2fGRYiHehtxa8o4MTh4g6BdS1SiSXNrCpn9TXkjmRqIhXo9hNeeB3mmub4=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2661.namprd12.prod.outlook.com (2603:10b6:a03:67::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.29; Tue, 7 Jul
 2020 01:25:04 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 01:25:03 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v7.1 07/13] ARC: Linux Syscall Interface
Thread-Topic: [PATCH v7.1 07/13] ARC: Linux Syscall Interface
Thread-Index: AQHWUbbDaTLzMWGcD0Of3DrN+Hn5Laj6jSGAgADKUoA=
Date: Tue, 7 Jul 2020 01:25:03 +0000
Message-ID: <5feda452-d571-2ffb-5cb4-a71dc7033503@synopsys.com>
References: <20200615201441.31820-8-vgupta@synopsys.com>
 <20200701000848.20492-1-vgupta@synopsys.com>
 <e9e2ae28-cd78-5924-c1fa-52b1499c245a@linaro.org>
 <64e18e52-9dc6-6d14-3e15-8c5ff1c0cdc2@synopsys.com>
 <a56d0e2a-cbc1-9a2b-b145-0d59318426d4@linaro.org>
In-Reply-To: <a56d0e2a-cbc1-9a2b-b145-0d59318426d4@linaro.org>
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
x-ms-office365-filtering-correlation-id: 611e8194-b8ac-4dfb-a8e5-08d822149359
x-ms-traffictypediagnostic: BYAPR12MB2661:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB26614EBF5FED09BE485F02F9B6660@BYAPR12MB2661.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cBBMgfTL0G5gI1OCpVJfAnvWlhn7/CT2yzre7kIg6S/Fg2vmjhvo6t00XCRIP9rM+tuos+Y+gehYf8X91Rd0ukUar4VLXqW8eFSoTSTp6xJIQErs7jDCbIX/JKWRxIqeZLB0gpQ06CaUQpTp/fOFVeVJGhGcDEuT5ZRkIH1OEHU64w0pNRRJtuIMwz2w5mZcyqI8231B9BZi2M46Rc+i2sIqX+5KOzMnOZfZjOEI6oEPljMLZKmZMaapZkAH5Ebgy5LJ2NoDXCTDaP4Y3YbHG/u1rvYsDR/ddo02ng2XV5pfQkb/Spvgoso83PMZ+d8HHiVXQWq0j7i7doAGEfSBH53A7710TB39ipYDVkJR4gBV0U3euvpHLMtBs/lPY/dAr1I+4PPe/GQ6RtX0XXFlvAPbWy+KIc4LFpzFkIINFozMBKJmFaiWZKyUzZZRiyFr4qA09ILTE7p4AtxYBn75ws0dGiWXgiyT7xl1S2YS7LA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(366004)(136003)(39860400002)(346002)(396003)(186003)(5660300002)(71200400001)(83380400001)(53546011)(4326008)(6486002)(8936002)(36756003)(6506007)(6512007)(8676002)(31686004)(478600001)(2616005)(76116006)(31696002)(66556008)(66446008)(64756008)(66946007)(2906002)(86362001)(66476007)(966005)(110136005)(316002)(21314003)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: U3Ph/Yso6vFowPN5IoQt8818iM2f/DM1cZvdgwoPp9Sv7CoqsDqO2fjAKz/1jV4dQa3jR64kGzZvzfhsmmi5ddC7SJnkvqCg4gPTmh3S4GPXoZZ3FUzDiM59KIDzjmmy2/PrMMxfWV8P+m662Srb/feilp1QJMo/xoTdCQMZy5FxCi2zJ8BYhDuXnzt+HHO35fs8GzgIYioG4bbFvkn3UFIPLbdln8LzYODlrohs/yyu6M7zWya+xRNJYi3NMCUxgx/xIO5U2nnpjaOpls/zO3/Gg5Pxb21t/iX/joNCddUurmMBhY5fyF1Bpa3Nn0kqtsjr+8bk6QXhdVUwKEbv/1YrY4u1FsF/kczn7gFvBt7Wo8h54pItZX9sRtPvOAP/sXy/KmQ0j4L08KJ20L5QSGzSeI+XMr1tC4sVK4yECLjt8fh2xaU83qZNtZqSjzqFUW+EZfFqRcHjkgpVlFFMGUoJDrLoAvdolAsOjEEzEGXn0QOmNCJZkUT9rk9I0OXgrBLNB5yrssXJnpREl24WhkreLZXZ+5iZ4PMfDmzCvZ87GqgdYQLzjOniAV1K4SL/
Content-ID: <58CEFA9BD1596A4F8742EF263181C0B8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 611e8194-b8ac-4dfb-a8e5-08d822149359
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 01:25:03.8442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ek49P7vzNqw0QBOLReIfYlQ75fp3EuQItuJU1sSzCKvjDqOlep2zTpCeztpujbbAv63AAok9mA+M3vCJ6F0Okw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2661
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_212514_704816_D3ED3397 
X-CRM114-Status: GOOD (  19.79  )
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

On 7/6/20 6:20 AM, Adhemerval Zanella via Libc-alpha wrote:
>>>> diff --git a/sysdeps/unix/sysv/linux/arc/clone.S b/sysdeps/unix/sysv/linux/arc/clone.S
>>
>>>> diff --git a/sysdeps/unix/sysv/linux/arc/fixup-asm-unistd.h b/sysdeps/unix/sysv/linux/arc/fixup-asm-unistd.h
>>
>>>> +
>>>> +/* Adjustments to ARC asm-generic syscall ABI (3.9 kernel) for 64-bit time_t
>>>> +   support.  */
>>>> +
>>>> +/* fstat64 and fstatat64 need to be replaced with statx.  */
>>>> +
>>>> +#undef __NR_fstat64
>>>> +#undef __NR_fstatat64
>>
>> This is certainly needed as they are present in ARC arch-syscall.h but we need to
>> use statx.
>>
>>>> +/* Replace all other 32-bit time syscalls with 64-bit variants.  */
>>>> +
>>>> +# undef __NR_clock_adjtime
>>>> +# undef __NR_clock_getres
>>>> +# undef __NR_futex
>>>> +# undef __NR_mq_timedreceive
>>>> +# undef __NR_mq_timedsend
>>>> +# undef __NR_ppoll
>>>> +# undef __NR_pselect6
>>>> +# undef __NR_recvmmsg
>>>> +# undef __NR_rt_sigtimedwait
>>>> +# undef __NR_sched_rr_get_interval
>>>> +# undef __NR_semtimedop
>>>> +# undef __NR_timerfd_settime
>>>> +# undef __NR_timerfd_gettime
>>>> +# undef __NR_utimensat
>>>
>>> I am trying to understand why these are required since arc does not define 
>>> them in arch-syscall.h.
>>
>> arch-syscall.h doesn't define them precisely due to these being here. When
>> update-syscalls is run, the 32-bit syscalls are generated for ARC (since kernel
>> ABI provides these because that was v3.9 circa 2013). Adding them
>> fixup-asm-unistd.h removes them (perhaps I need to add this in changelog to
>> clarify - atleast for myself).
>>
>>> And the generic implementation should handle the time64 variant.  If they
>>> are not this is something we need to handle it.
>>
>> At the time we we doing this, arch-syscall.h generation was not yet in place,
>> however I tried to undef in generic/sysdep.h for TIMESIZE==64. However I was asked
>> me to add this to ARC specific fixup-asm-unistd.h
>> https://sourceware.org/pipermail/libc-alpha/2020-March/112395.html
>> https://sourceware.org/pipermail/libc-alpha/2020-April/112909.html
> 
> My confusion here, I forgot that this header is only used glibcsyscalls.py
> to actually generate arch-syscall.h.
> 
> You changes does look correct.

Actually we can add a few more entries here which have 64-bit variants.

+# undef __NR_clock_gettime
+# undef __NR_clock_nanosleep
+# undef __NR_clock_settime
+# undef __NR_timer_gettime
+# undef __NR_timer_settime


>>>> diff --git a/sysdeps/unix/sysv/linux/arc/kernel_stat.h b/sysdeps/unix/sysv/linux/arc/kernel_stat.h

>> This specific one is actually dead code. I did post a patch to this effect and
>> followed up with supporting data that enabling it on 64-bit arches doesn't lead to
>> any changes in generated code.
>>
>> https://sourceware.org/pipermail/libc-alpha/2020-February/111259.html
>> https://sourceware.org/pipermail/libc-alpha/2020-June/115217.html
>>
> 
> Ack.

Thx. I'll repost this after things settle at bit.

>>>> diff --git a/sysdeps/unix/sysv/linux/arc/sysdep.h b/sysdeps/unix/sysv/linux/arc/sysdep.h
>>
>> ...
>>
>>>> +/* 32-bit time syscalls are not available, but the redefines allow generic
>>>> +   wrappers to work.  */
>>>> +#define __NR_clock_adjtime	__NR_clock_adjtime64
>>>> +#define __NR_clock_getres	__NR_clock_getres_time64
>>>> +#define __NR_futex		__NR_futex_time64
>>>> +#define __NR_mq_timedreceive	__NR_mq_timedreceive_time64
>>>> +#define __NR_mq_timedsend	__NR_mq_timedsend_time64
>>>> +#define __NR_ppoll		__NR_ppoll_time64
>>>> +#define __NR_pselect6		__NR_pselect6_time64
>>>> +#define __NR_recvmmsg		__NR_recvmmsg_time64
>>>> +#define __NR_rt_sigtimedwait	__NR_rt_sigtimedwait_time64
>>>> +#define __NR_sched_rr_get_interval	__NR_sched_rr_get_interval_time64
>>>> +#define __NR_semtimedop		__NR_semtimedop_time64
>>>> +#define __NR_timerfd_gettime	__NR_timerfd_gettime64
>>>> +#define __NR_timerfd_settime	__NR_timerfd_settime64
>>>> +#define __NR_utimensat		__NR_utimensat_time64
>>>
>>> As for the fixup-asm-unistd.h, the generic implementation should handle it
>>> without the requirement of the ABI to add such tricks.
>>
>> fixup-asm-unistd.h is different, but this could be avoided. I know for sure that
>> ll code literally expects __NR_futex (atleast used to). But I can remove this and
>> see what comes out.
>>
>>>
>>> However it seems that we are still missing support for pselect 
>>> (__NR_pselect6_time64), recvmmsg (__NR_recvmmsg_time64), sigtimedwait 
>>> (__NR_rt_sigtimedwait_time64), and semtimeop (__NR_semtimedop_time64).
>>>
>>> I think we can add the redefine hack only the aforementioned symbols for
>>> now and removed them once we implement the y2038 support on such symbols
>>> (since the expected ABI won't change for ARC, only for old ABIs with
>>> 32 time_t support).
>>
>> Sorry /me horribly confused here.
> 
> Sorry for the confusion, I meant that some of these re-defines are superfluous 
> and I would like to have the minimum required re-define to enable the ARC 
> support, 

Right. The generic code needs a bit more work to eliminate the redefines altogether.

1. Following is not needed

-#define __NR_clock_adjtime     __NR_clock_adjtime64
-#define __NR_sched_rr_get_interval     __NR_sched_rr_get_interval_time64
-#define __NR_mq_timedreceive   __NR_mq_timedreceive_time64
-#define __NR_mq_timedsend      __NR_mq_timedsend_time64
-#define __NR_timerfd_gettime   __NR_timerfd_gettime64
-#define __NR_timerfd_settime   __NR_timerfd_settime64

2. The minimum list needed for ARC (with annotations as to which generic file
needs fixing).

/* Fix sysdeps/unix/sysv/linux/clock_getcpuclockid.c.  */
#define __NR_clock_getres      __NR_clock_getres_time64
/* Fix sysdeps/nptl/lowlevellock-futex.h.  */
#define __NR_futex             __NR_futex_time64
/* Fix sysdeps/unix/sysv/linux/pause.c.  */
#define __NR_ppoll             __NR_ppoll_time64
/* Fix sysdeps/unix/sysv/linux/select.c.  */
#define __NR_pselect6          __NR_pselect6_time64
/* Fix sysdeps/unix/sysv/linux/recvmmsg.c.  */
#define __NR_recvmmsg          __NR_recvmmsg_time64
/* Fix sysdeps/unix/sysv/linux/sigtimedwait.c.  */
#define __NR_rt_sigtimedwait   __NR_rt_sigtimedwait_time64
/* Fix sysdeps/unix/sysv/linux/semtimedop.c.  */
#define __NR_semtimedop                __NR_semtimedop_time64
/* Hack sysdeps/unix/sysv/linux/generic/utimes.c (need linux/utimes.c).  */
#define __NR_utimensat         __NR_utimensat_time64


> so we can cleanup these later once we enable time64_t support on 
> old ABIs as well.

IMO the cleanup applies to new ABIs too as generic code should handle those cases
w/o these workarounds. But that would delay things further for new ports so I
suggest we keep the workarounds and clean things up going fwd.

BTW, if one were to actually go about fixing those, whats the best approach.
Consider the simplest case pause(). For !__NR_pause do we replicate the code for
ppoll/ppoll64 handling or simply just call ppoll(). Later has a function call
overhead) ? Or there is a paradigm to use __syscallxxx_helper() although that
still has a function call overhead.

Actually the pause case is really simple as there are no args, so just redefine
__NR_xxx trick should suffice w/o going into all the explicit
interworking/conversion etc.

__libc_pause (void)
{
#ifdef __NR_pause
  return SYSCALL_CANCEL (pause);
#else

  return SYSCALL_CANCEL (ppoll, NULL, 0, NULL, NULL);
#endif


>>>> +#undef SYS_ify
>>>> +#define SYS_ify(syscall_name)   __NR_##syscall_name
>>>
>>> The code mixes __NR_* and SYS_ify macro. This macro is really superflous
>>> and I am preparing some patches to cleanup this up along with C asm
>>> macros to generate syscall.  So I would suggest to just use the __NR_*
>>> way and drop this definition.
>>
>> I don't mind, but it seems that the wrapper was a simply way to avoid open-coding
>> the macro concatenation. e.g.
>>
>> # define DO_CALL(syscall_name, args)                    \
>> -    mov    r8, SYS_ify (syscall_name)  ASM_LINE_SEP    \
>> +    mov    r8, __NR__##syscall_name  ASM_LINE_SEP    \
>>      ARC_TRAP_INSN
>>
> 
> My understand was in fact parametrized way to define syscall numbers when
> glibc added support to future multiple Unix implementation (which never
> actually happened).  I don't have a strong opinion here in fact, any is
> fine in the end.

I open-coded the 2 calls to SYS_ify() in ARC code and deleted SYS_ify()...

... and 2 hrs later, after mysterious build failures, find that SYS_ify() needs to
be retained (even if not used in ARC port) it is expected/used by generic
make-syscalls.h :-(
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
