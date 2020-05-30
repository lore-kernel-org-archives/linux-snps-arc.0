Return-Path: <SRS0=KuJb=7M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2A7C433DF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 May 2020 02:03:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D89602074D
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 May 2020 02:03:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZstteP/4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SF3Ir1IW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lBUwS++d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D89602074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rk88/VWVJYAeXfeuHIdwgqmvM5JqfqROz9JbhM2hNJA=; b=ZstteP/4R11aXZ
	RbsYVDK5kp4YmFulnKSmtmuWJLDpJ2LwCzaDfHmKl3oowQgJXzlKE8H7i6uaZeQIeJH91103xjRu9
	4tOe3g6le5F7qkYUWSu8NYxEXZV0dSDfcOKd7hFgFw1zIClCJKbdmP/OkP8xOpV7+AkT3j+Mw5pP9
	ABnnMgpzFzJRAYbcW+kSiFtwDdCEYwc4DmBerIG9KzeSwp7hs5zOCYBr3cgCP2RDhqIvwK/Oq+4fU
	FatR80pa3U9+pDoPkT1ijt0PoyjG9RfSwOWDam7KlSFEWDMZb7rVOOPNkj8aaNwWwdON8OJZ0vEyg
	bY+U9L+NFL4VG94k7Ksg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeqqH-00056Z-Va; Sat, 30 May 2020 02:03:21 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeqqD-00055u-Un
 for linux-snps-arc@lists.infradead.org; Sat, 30 May 2020 02:03:19 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BFE5AC042C;
 Sat, 30 May 2020 02:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590804195; bh=teVoovf9ieXa4Indf4vcNxi6hXiRtRPTVoh2Grsu1Ro=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=SF3Ir1IWo5vacJXWkh8oyVvQAo2jaQaduX3BnbguLIm+vE1ahTup1k5lbmMEN5wAu
 iD2YXcapHduhUmUFVgoCivrtjCIZ1LM53g301bXDl1LYRPlH9BZNOM24ojUr6vuz6m
 ep3GHQCKDrD7kD+Um6wJOT3gG+VntYpZwlgggPhOcgzbUmiSToJ59YGZ/xyabOkixK
 WXaj6UMboNOGQI/lqi2tIQQ/K9wGy1AumQE6JLYHK4aTKYWO9QJg6u+RFz1mwdJW5Y
 lBDoGaQvI7GG+7cHdqD425qkH4pFVbmt4DZSYyYNF3V8X2lm73Cp7p3LMf6cNCCxRW
 unf9Ig1gLfA9A==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 23C4FA008A;
 Sat, 30 May 2020 02:03:15 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 29 May 2020 19:02:54 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 29 May 2020 19:02:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLRHFIIOuQ5N4gXnQDdsnFbEtiNZAw4X9muUk+ckqJZQkjcbvM4VEwYkHDF5+v/4FP0ApUQEryO/1yZxtBHnvpCgw9BXyqylKDeNjCLwP26ydqkBo+iUpFEaChGx2Z3qcq5SXnxJp2isnUFVoJRVKNRz4zA2V5LmhV1ld6QT8JDGLKI0zicYvc5YaTd1u429mbz+HmaDlBgt8HlW/fxosPwrbgxgXzg/rql0w7Cx9vfOjemFVn+LDNDVXiULyOHa5hiNIuRNztBIinSTTgbC2mtkXM7z3zOJ15sEN5ayRYAvc/XFRmYpiaeEFkpEWG+VZWN9d8LhhFFX+YLXccO0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teVoovf9ieXa4Indf4vcNxi6hXiRtRPTVoh2Grsu1Ro=;
 b=evkD4Zt3uDc0QvXEy58Cra2emjl9lWLg/3tShAXKX4meB7tbSuz0zzGjK3YcxHrBRLYPddcByMNUCrgDPWcX49V6jqnnL4v0Cv1kajB+0B8xY9WKEtTH7rrTaduQBIof+JH7Nk+4UvCElSqv4E/XE+eE466gFmS4a+sSqaNymRZKUIsU3KPlJWpGz7sS6ruUnxT+Uh2bGclRpSTPbK6tEsOVqj7mSFFsBHiRtG1cjz/0Mahwbe+qj4KkV2ios1ZXme/8qMcooIPZyB6yIWQYJJO2WvO8JQv42U2qviTOF3smx+EVGN5epV+2UrziuqxUS6b6twbHC6tISyp8dW882w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teVoovf9ieXa4Indf4vcNxi6hXiRtRPTVoh2Grsu1Ro=;
 b=lBUwS++dON+lXt6AcPp2hpWZK3ZiCwOtpkEezQKZmfAXFn8qietgJp7b74kjTsFOFnKmxFHBGlp/TJgniXph60JpeHTw5/KNqVpmtEYn1Xeiy08r+t9q9O5rJ0HXXunEPnLIRW/0DolxvQZY4vCW970P1K5SlIFtrwgdmB5wftY=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3078.namprd12.prod.outlook.com (2603:10b6:a03:a8::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Sat, 30 May
 2020 02:02:51 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.018; Sat, 30 May 2020
 02:02:51 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v6 07/13] ARC: Linux Syscall Interface
Thread-Topic: [PATCH v6 07/13] ARC: Linux Syscall Interface
Thread-Index: AQHWNdk7jGc/VtI9YkWN6o0lqZFobKi/4SUA
Date: Sat, 30 May 2020 02:02:50 +0000
Message-ID: <5024a581-4018-14df-b75c-17aeaf360e46@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-8-vgupta@synopsys.com>
 <248259c7-8263-805d-56cd-9db397eb9c04@linaro.org>
In-Reply-To: <248259c7-8263-805d-56cd-9db397eb9c04@linaro.org>
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
x-ms-office365-filtering-correlation-id: 110db0b6-33e0-430a-d552-08d8043d8efa
x-ms-traffictypediagnostic: BYAPR12MB3078:
x-microsoft-antispam-prvs: <BYAPR12MB30781D9C10A2F514B377201EB68C0@BYAPR12MB3078.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 041963B986
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w2nXS2JmZojPFnFGtW91gH10ruUAacSSPRFheBmt/FllHLbzGGzZjq95e4nM0jUys9y11Dowzd1NhMs0Yx62swwT6TRVVzxTZ3OBARB2Vkt6+C4c2xeJ/5zmEhmA+lN7U9jfZ1i+yfSAOCjLx/rnKt8AeZX9VPjLZqJkLByeM97OCK3pk9/AfkSx8ITxG1oDS+WO6uBMBySF9VXORLcFor5/M76TLL+BC3DF5/c3g2dDrorXDhUmN2dEZoZcOEIU0ylSn/18vnxsp2db06/HuvrARkxG1E5wXb8C8YIWzB5NqrqzJLhtrY7q1i5xydsL3FhWmGcqr+3PCob3gIurhtE+AOX1HZ8HlQJ4cMqXU2NSg5RogpUp1Bsjlyc3NHaInJwMgQpo1+g8/S0tAtVwfHM9znKgDNPOHS50328jCmM53AXEZb/HRpz2q0vgZ5+cTnXUcgnsJIp3rccxTmp/WS+LthKV8HyYDlHt5W2U4uo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(136003)(366004)(396003)(39860400002)(71200400001)(6486002)(5660300002)(2616005)(66446008)(26005)(36756003)(4326008)(31686004)(2906002)(86362001)(6506007)(53546011)(6512007)(8936002)(8676002)(64756008)(76116006)(66556008)(66946007)(316002)(110136005)(66476007)(478600001)(83380400001)(186003)(31696002)(2004002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: PFXhhaYmIDM0VzkgKPZ+iex8MDpJpR/xAKyShCae2ffCF/kllPO9Af/uLMckr/WZeKLte1U/J/nSlBeuDopJRMjfbNHwY88Q/1vNvO39CVFabYplGb/vwqdEMrCF5w3J0IPofqwA7URlt96f/XdH7S06Npgps7pzp6saECiRutRS2nP49MgC6nryatJ0X2hGDFrFfuPNitvboxnBz2+bi2yRWMH2AdoL5m0hRCpx4NID5RhO4Dhje78QmEHstU4lClkOj/sRoCPOx1mnMn3Th71ysMsjR7uCfBXoR37UgvOMieFWwHTO4S7cJ/2fT5vNtpf5TTU8etISeVMIfuJJPoPBOBJ3Mqc1TX3MTimpoeBWsjmcgJYboyuEDacpz9PTVRXoNRQ2XjGunLVwfXHpKRU/k9LVUWDMzqdwY41XWT0QLfnbRq+I8PG+IX2xE6Iuf07JCTTq87ZQtvL8c8RV9CsAN6nVqF8qKKhCxXtQXGLKk2IowlyuDbTaEoSYPrzN
x-ms-exchange-transport-forked: True
Content-ID: <D92008A71DEC2943AC0AEAFF25B5F917@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 110db0b6-33e0-430a-d552-08d8043d8efa
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2020 02:02:50.9835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dxeSp1GOveEK55xRqr/2kwzkum0GkkYyHx11lCUf53DNu0hegavtPRVuI9ao7zvkSOPP+S0Jdg5fNkyB9xl9Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3078
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_190318_143443_E4D85349 
X-CRM114-Status: GOOD (  22.90  )
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

On 5/29/20 9:49 AM, Adhemerval Zanella via Libc-alpha wrote:
> 
> 
> On 22/04/2020 22:41, Vineet Gupta via Libc-alpha wrote:
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> 
> As prior patches we do not use DCO, but rather copyright assignment.
> 

>> diff --git a/sysdeps/unix/sysv/linux/arc/arch-syscall.h b/sysdeps/unix/sysv/linux/arc/arch-syscall.h
>> new file mode 100644
>> index 000000000000..2b017eb5bbaa
>> --- /dev/null
>> +++ b/sysdeps/unix/sysv/linux/arc/arch-syscall.h
>> @@ -0,0 +1,303 @@
>> +/* AUTOGENERATED by update-syscall-lists.py.  */
>> +#define __NR_accept 202
>> +#define __NR_accept4 242
>> +#define __NR_acct 89
>> +#define __NR_add_key 217

>> +#define __NR_vmsplice 75
>> +#define __NR_wait4 260
>> +#define __NR_waitid 95
>> +#define __NR_write 64
>> +#define __NR_writev 66
> 
> Ok, although I did not confered it was done with lastest Linux kernel 
> releases used by build-many-glibcs.py. You might double check it.

I did use 5.6 kernel at the time, will double check though. Thx.

>> diff --git a/sysdeps/unix/sysv/linux/arc/clone.S b/sysdeps/unix/sysv/linux/arc/clone.S

>> +
>> +/* int clone(int (*fn)(void *), void *child_stack,
>> +           int flags, void *arg, ...
>> +           < pid_t *ptid, struct user_desc *tls, pid_t *ctid > );
>> +
>> + NOTE: I'm assuming that the last 3 args are NOT var-args and in case all
>> +	3 are not relevant, caller will nevertheless pass those as NULL.
> 
> Maybe we should update our clone prototype, although this might incur 
> in a ABI break. The assumption here should be ok, since all other
> implementations do the same.
> 
>> +
>> + clone syscall in kernel (ABI: CONFIG_CLONE_BACKWARDS)
>> +
>> +  int sys_clone(unsigned long int clone_flags,
>> +	        unsigned long int newsp,
>> +		int __user *parent_tidptr,
>> +		void *tls,
>> +		int __user *child_tidptr).  */
>> +
>> +ENTRY (__clone)
>> +	cmp	r0, 0		; @fn can't be NULL
>> +	cmp.ne	r1, 0		; @child_stack can't be NULL
>> +	bz	.L__sys_err
>> +
>> +	; save some of the orig args
>> +	; r0 containg @fn will be clobbered AFTER syscall (with ret val)
>> +	; rest are clobbered BEFORE syscall due to different arg ordering
>> +	mov	r10, r0		; @fn
>> +	mov	r11, r3		; @args
>> +	mov	r12, r2		; @clone_flags
>> +	mov	r9,  r5		; @tls
>> +
>> +	; adjust libc args for syscall
>> +
>> +	mov 	r0, r2		; libc @flags is 1st syscall arg
>> +	mov	r2, r4		; libc @ptid
>> +	mov	r3, r5		; libc @tls
>> +	mov	r4, r6		; libc @ctid
>> +	mov	r8, __NR_clone
>> +	ARC_TRAP_INSN
>> +
>> +	cmp	r0, 0		; return code : 0 new process, !0 parent
>> +	blt	.L__sys_err2	; < 0 (signed) error
>> +	jnz	[blink]		; Parent returns
>> +
>> +	; ----- child starts here ---------
>> +
>> +	; Setup TP register (only recent kernels v4.19+ do that)
>> +	and.f	0, r12, CLONE_SETTLS
>> +	mov.nz	r25, r9
> 
> Do you still need to set it since the minimum supported kernel
> for ARC is 5.1 ?

Right we can drop this.


> It should be safe for internal glibc usage, since for both pthread
> and posix_spawn it blocks all signals including SIGCANCEL and SIGXID.
> However this is still small race window if this is called directly 
> with pthread cancellation or g*uid in multithread.
> 
>> +
>> +	; child jumps off to @fn with @arg as argument, and returns here
>> +	jl.d	[r10]
>> +	mov	r0, r11
>> +
>> +	; exit() with result from @fn (already in r0)
>> +	mov	r8, __NR_exit
>> +	ARC_TRAP_INSN
>> +	; In case it ever came back
>> +	flag	1
>> +
>> +.L__sys_err:
> 
> Can't you use L(...) macro as other architectures? 

OK will do.

> 
>> diff --git a/sysdeps/unix/sysv/linux/arc/mmap_internal.h b/sysdeps/unix/sysv/linux/arc/mmap_internal.h
>> new file mode 100644
>> index 000000000000..19aa078dd45e
>> --- /dev/null
>> +++ b/sysdeps/unix/sysv/linux/arc/mmap_internal.h
>> @@ -0,0 +1,27 @@
>> +/* mmap - map files or devices into memory.  Linux/ARC version.
>> +   Copyright (C) 2017-2020 Free Software Foundation, Inc.
>> +   This file is part of the GNU C Library.
>> +
>> +   The GNU C Library is free software; you can redistribute it and/or
>> +   modify it under the terms of the GNU Lesser General Public
>> +   License as published by the Free Software Foundation; either
>> +   version 2.1 of the License, or (at your option) any later version.
>> +
>> +   The GNU C Library is distributed in the hope that it will be useful,
>> +   but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> +   Lesser General Public License for more details.
>> +
>> +   You should have received a copy of the GNU Lesser General Public
>> +   License along with the GNU C Library; if not, see
>> +   <https://www.gnu.org/licenses/>.  */
>> +
>> +#ifndef MMAP_ARC_INTERNAL_H
>> +#define MMAP_ARC_INTERNAL_H
>> +
>> +/* 8K is default but determine the shift dynamically with getpagesize.  */
>> +#define MMAP2_PAGE_UNIT -1
>> +
>> +#include_next <mmap_internal.h>
>> +
>> +#endif
> 
> Ok.  I would be interesting if kernel could consolidate de mmap
> implementation to return EINVAL for invalid offsets. A lot of
> architectures have its own implementation to handle.



>> diff --git a/sysdeps/unix/sysv/linux/arc/pt-vfork.S b/sysdeps/unix/sysv/linux/arc/pt-vfork.S
>> new file mode 100644
>> index 000000000000..1cc893170070
>> --- /dev/null
>> +++ b/sysdeps/unix/sysv/linux/arc/pt-vfork.S
>> @@ -0,0 +1 @@
>> +/* Not needed.  */
> 
> This file is not required since "nptl: Remove vfork IFUNC-based
> forwarder from libpthread [BZ #20188]" (41d6f74e6cb6a9).

Removed.


>> diff --git a/sysdeps/unix/sysv/linux/arc/sigrestorer.S b/sysdeps/unix/sysv/linux/arc/sigrestorer.S

>> +
>> +#include <sys/syscall.h>
>> +#include <sysdep.h>
>> +#include <tcb-offsets.h>
>> +
>> +/* Note the NOP has to be outside body.  */
>> +	nop
> 
> Wy exactly do you need it here?

It has to do with how ARC gdb recognized sigrestorer. This acts a special marker
used in conjunction with the syscall id. This goes back to days when cfi pseudo
ops were not suppported in toolchain, but the gdb code lingered.

> 
>> +ENTRY (__default_rt_sa_restorer)
>> +	mov r8, __NR_rt_sigreturn
>> +	ARC_TRAP_INSN
>> +	j_s     [blink]
> 
> Ok.



>> diff --git a/sysdeps/unix/sysv/linux/arc/sysctl.mk b/sysdeps/unix/sysv/linux/arc/sysctl.mk
>> new file mode 100644
>> index 000000000000..05a4e2f8c99b
>> --- /dev/null
>> +++ b/sysdeps/unix/sysv/linux/arc/sysctl.mk
>> @@ -0,0 +1 @@
>> +# ARC doesn't support sysctl.
> 
> This file is not required since "Linux: Remove <sys/sysctl.h>
> and the sysctl function" (076f09afbac1a).

Removed.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
