Return-Path: <SRS0=m9uj=AP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAFEC433E0
	for <linux-snps-arc@archiver.kernel.org>; Sat,  4 Jul 2020 03:54:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A5E620737
	for <linux-snps-arc@archiver.kernel.org>; Sat,  4 Jul 2020 03:54:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WLNaGlaA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TMqtpa8v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RaHqj4/k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A5E620737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s2P6QgblaJAFj77Q/yOuO7Yhjh6d9JGVDlR0YnFNSlQ=; b=WLNaGlaAJ75eR4R6rBGhpFSeu
	npIPUsGIU72+4Cl1UO7sX0i1sh+bVGNhx/1BND2UmSH0ol9mZb4uSFVvm3UDlQz8ezbhAugDJ7Q0v
	QabADPw8P/VIoKRBqFdeM8vmHVYzfqzFevSs4W0OlHt1WE+KwmSHJhZwmdB/pRDbz2W9jGVxYSjtm
	1uevJlMSBK6oHQDyqCdv8UmEgGPJJcRqJCgtaASSkK4z4bIxp8NE5Tzf60hueLWFziab13HuJVAVc
	Oteb555KwzY1HIRdz4dev4DKw+bmk9MYry+QcS7wAxYWybqXQxZaxKK3gJv73rjy4F/OSReIBzz9q
	RF3Lctcxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrZFv-0000OS-0w; Sat, 04 Jul 2020 03:54:23 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrZFr-0000Nv-NL
 for linux-snps-arc@lists.infradead.org; Sat, 04 Jul 2020 03:54:21 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1F53CC06A4;
 Sat,  4 Jul 2020 03:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593834853; bh=xkPevEAWbi9JKC7cdvbKRg9L6kx9W3aG6w7IP102U0Y=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=TMqtpa8vCUEiYiMv1ygBtlWc5fvNIN/xrnWYTuteKqJ8ucFlVIBXzJLTg2n6C/6fc
 O88Dk6HAEAoWPBobBCtRlAqytrMwFQQDdrPj6d4BzcDw/yAbFhw3Pl9TGyBV9VhDuY
 0RtI11NTHbVDCp0ZIScT/13vTbk4JcAjCuycocHD+0gF+Gx5MUbxqpJHZkxW89ht7y
 nmydzq21V8NkisH52iWuctixwUztd3Qmqng4O9QHHrApiU7KUvwE7uIwyGgUsfccdt
 o6C4Xh2xBaliieShdes3KppvcMcm60O2yViH9yG1T+HHU5DChmBQQqJXKsLWh48p5y
 GXUhBsxVLuSwQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3F37FA006F;
 Sat,  4 Jul 2020 03:54:10 +0000 (UTC)
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2052.outbound.protection.outlook.com [104.47.46.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id A6D6A40256;
 Sat,  4 Jul 2020 03:54:09 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="RaHqj4/k";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNFeex45fR2wrQMKXxECToflImvSZVVCIZb4oyEt18q4OVQkhne0B6ViJ2sKfaFGnASPQFyaQE0uBKpEd3Yg8FC+Cq9qlZOdmkX4ZwR+0iLEZW0apikyiH3RL6FscNBHERMLVSG/TqLa3aSa3sS+n4g+WDOzwMN7bcIVf52NHZsErnR2Bo4TWl5AvVNoCr9e8nrnVlxz6hXUVgSrwMfMKERdnIZMqv22H5UdboY2by6QIg5sTfVgJUtwg+L9idVa0V0j8YohvXPWg5RNG4m2yanlL4UyaB77ALcfBkWnESmSd8TbWoozoxIsUHXWFJpNTKSLqx1dfYC3DsQAS7uDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkPevEAWbi9JKC7cdvbKRg9L6kx9W3aG6w7IP102U0Y=;
 b=Dcj/S/kMouYhhArQnKLj07yGySOv35axjvjgIysR0RsTdK58cs4WSyVwgnzHr9LL7nfS6Dtkgi+OHmW06EmKsaIV+lklfySSBmI3x7T+ycXlQ7rXir8vkUNAqvxgoovmn8sVYBNVsvOGGRO1r+01Ks+w8FgXYWwbD/5J5v65OXTW9cax/Tug6Oojp20w2CBJuvR/WjX9ReHWwB+Bq7pyATRaWmQqRq+19/v53zmtXXlp3WGRZFv0waMVLoFaqOousGtlU43Y0Mz9yjc9fIFrC8kVibU4t7Vj7TszazGFny8+XGnzI3b2sTbX75w9LCACgJTIyaVZh125ZhQNZY3jPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkPevEAWbi9JKC7cdvbKRg9L6kx9W3aG6w7IP102U0Y=;
 b=RaHqj4/k83fxjBazBX6ffhMl7Nu0MWLUrmX24F02+8NI9+utWc8zVU/H6PU5BKrGvJrBLrFvRTkBorkgklU68jXnTHTs8ERKyvv7VqY1QonZvSQgolnf8yr9HFIiMmGQYg14Yoohpl9EvqgaoERfL8dYumz6Yib5wtclVTYedZ8=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4210.namprd12.prod.outlook.com (2603:10b6:a03:203::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Sat, 4 Jul
 2020 03:54:06 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3153.029; Sat, 4 Jul 2020
 03:54:06 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v7.1 07/13] ARC: Linux Syscall Interface
Thread-Topic: [PATCH v7.1 07/13] ARC: Linux Syscall Interface
Thread-Index: AQHWUbbDaTLzMWGcD0Of3DrN+Hn5LQ==
Date: Sat, 4 Jul 2020 03:54:06 +0000
Message-ID: <64e18e52-9dc6-6d14-3e15-8c5ff1c0cdc2@synopsys.com>
References: <20200615201441.31820-8-vgupta@synopsys.com>
 <20200701000848.20492-1-vgupta@synopsys.com>
 <e9e2ae28-cd78-5924-c1fa-52b1499c245a@linaro.org>
In-Reply-To: <e9e2ae28-cd78-5924-c1fa-52b1499c245a@linaro.org>
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
x-ms-office365-filtering-correlation-id: 1ee797c3-a700-42a2-3cfa-08d81fcde61a
x-ms-traffictypediagnostic: BY5PR12MB4210:
x-microsoft-antispam-prvs: <BY5PR12MB4210B043369A389BDB8D8B1CB66B0@BY5PR12MB4210.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0454444834
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 66viwswz1lnwQNUnW30JSlDJtlpoFrZbcLMu5QI4IYT3En5Vof4o436ChGJZGVYPgJDJe0qfo23KZgop++DRN2hon+dGnHF20ASnkR2AaZUnpQUnUlNa0LfvcMqCDKMhLu/OjV0lkIXeE8rpEhqtiPPSb+Ch9FqrgPY2czhF+shxvid8U9pCdnisKxM0Y2gswey+rZKLpIEevumDHA/D2W+vAIr3CYCdI64iPAvGCvraiJ7/5HOSrHJas8ibRrd1agzMsSNFHx3/SmKDw1+tgVhSTlza4DgNlRbc9wktMqHjvnr4+yx3eNezlR7/CyxRWcsaj6adyHFgfXtajk4Or3kPlPQvEMM24P1aB1bb+2+tmnT5C4L+gtMjd00FIL5vpnqrl800y7mloHF9wIhhEKHMdxdIGG+/9mYepPkj5ElEiXCrPelP/KnsZSRIMC+5veK7ct6motxocEEosLXqew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(376002)(346002)(396003)(136003)(366004)(66946007)(76116006)(6512007)(6506007)(53546011)(83380400001)(186003)(2906002)(966005)(110136005)(4326008)(2616005)(478600001)(316002)(8676002)(8936002)(66556008)(31686004)(5660300002)(66476007)(64756008)(31696002)(66446008)(6486002)(86362001)(71200400001)(36756003)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: AXS7iPLJWSjz/vZvpvKVfpIwoUrGnpbWXcnRVhmLUAlroCY1glsKTlZ+xAaa39sTf4nwocCAVMBDXwnHjyBcYYgsFPP41ZqRYXLbBpXXklby9A1m0SNJgchbhKIWOKAxsFce0Pws2jYS9azBrnUnGUK9TmsX6IQf8eS/A2yv9XfPWkqFla+vmFJxt++FyQZERelsrmGuJMcypx9VMg5GKMFlqlP22E3AixXcROMauHLmYrPrVKw6QUxIdEfXw5o3hT1MhYc573WLpnK1jc716bkBZdd9PnEw7eLoxabg1nXbkBKh4qL3H2iDAUqnLe3QcrEeFpJb9pBC6KdCGp3hhVeQMLP1VmJpRMW1Og00oKHqlrxy4uFvV15Npwfc39HSQcXy7v17W+BhV2ykskBfBqKZ09VJO3ME3UxRTw4x0ubuhrud2sofwmSOykinz5km88+4n9bB+wZN/8KRu1OfmFBhv44zAw1H9CYP884iESi/nk1+AlcxhTwbb4ynnohNb0LPf9jJtPCrLstF0ISiJ7PggJR5jWtSWJKq1r8mIJl9LkmZffOXCnvDoRgMmScp
x-ms-exchange-transport-forked: True
Content-ID: <CE8E39ABCAFAD84995BF0E2013323193@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee797c3-a700-42a2-3cfa-08d81fcde61a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2020 03:54:06.0272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: inizIjauUpw5Eor/9C+15cXtJnntKMLYr0YS7Cti1cAaxHyvPUZBDSAd1olBS2SE2UyQqF8rB3pSdRZVjku1GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_235420_169880_70580ED6 
X-CRM114-Status: GOOD (  25.96  )
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

On 7/2/20 7:47 PM, Adhemerval Zanella via Libc-alpha wrote:
> 
> 
> On 30/06/2020 21:08, Vineet Gupta via Libc-alpha wrote:
>> ---
>>    Changes since v7:
>>      - used long int (iso int) in sysdep.h/syscall_error for handling registers
> 
> Patch looks ok, but I have question on the __NR_* undef/define. 
> 

>> diff --git a/sysdeps/unix/sysv/linux/arc/arch-syscall.h b/sysdeps/unix/sysv/linux/arc/arch-syscall.h
...
>> +#define __NR_write 64
>> +#define __NR_writev 66
> 
> Looks good. As side note I think an improvement would be to add
> an annotation on update-syscall-lists.py to specify which kernel
> version it used.

Very good idea indeed. I've asked myself the very question atleast once.


>> diff --git a/sysdeps/unix/sysv/linux/arc/clone.S b/sysdeps/unix/sysv/linux/arc/clone.S
..
>> +
>> +	; adjust libc args for syscall
> 
> Use the C comment style for constency with rest of the file.

Done.

>> diff --git a/sysdeps/unix/sysv/linux/arc/fixup-asm-unistd.h b/sysdeps/unix/sysv/linux/arc/fixup-asm-unistd.h

>> +
>> +/* Adjustments to ARC asm-generic syscall ABI (3.9 kernel) for 64-bit time_t
>> +   support.  */
>> +
>> +/* fstat64 and fstatat64 need to be replaced with statx.  */
>> +
>> +#undef __NR_fstat64
>> +#undef __NR_fstatat64

This is certainly needed as they are present in ARC arch-syscall.h but we need to
use statx.

>> +/* Replace all other 32-bit time syscalls with 64-bit variants.  */
>> +
>> +# undef __NR_clock_adjtime
>> +# undef __NR_clock_getres
>> +# undef __NR_futex
>> +# undef __NR_mq_timedreceive
>> +# undef __NR_mq_timedsend
>> +# undef __NR_ppoll
>> +# undef __NR_pselect6
>> +# undef __NR_recvmmsg
>> +# undef __NR_rt_sigtimedwait
>> +# undef __NR_sched_rr_get_interval
>> +# undef __NR_semtimedop
>> +# undef __NR_timerfd_settime
>> +# undef __NR_timerfd_gettime
>> +# undef __NR_utimensat
> 
> I am trying to understand why these are required since arc does not define 
> them in arch-syscall.h.

arch-syscall.h doesn't define them precisely due to these being here. When
update-syscalls is run, the 32-bit syscalls are generated for ARC (since kernel
ABI provides these because that was v3.9 circa 2013). Adding them
fixup-asm-unistd.h removes them (perhaps I need to add this in changelog to
clarify - atleast for myself).

> And the generic implementation should handle the time64 variant.  If they
> are not this is something we need to handle it.

At the time we we doing this, arch-syscall.h generation was not yet in place,
however I tried to undef in generic/sysdep.h for TIMESIZE==64. However I was asked
me to add this to ARC specific fixup-asm-unistd.h
https://sourceware.org/pipermail/libc-alpha/2020-March/112395.html
https://sourceware.org/pipermail/libc-alpha/2020-April/112909.html

>> diff --git a/sysdeps/unix/sysv/linux/arc/kernel_stat.h b/sysdeps/unix/sysv/linux/arc/kernel_stat.h
...
>> +#define STATFS_IS_STATFS64 0
> 
> Ok.

This specific one is actually dead code. I did post a patch to this effect and
followed up with supporting data that enabling it on 64-bit arches doesn't lead to
any changes in generated code.

https://sourceware.org/pipermail/libc-alpha/2020-February/111259.html
https://sourceware.org/pipermail/libc-alpha/2020-June/115217.html


>> diff --git a/sysdeps/unix/sysv/linux/arc/sysdep.h b/sysdeps/unix/sysv/linux/arc/sysdep.h

...

>> +/* 32-bit time syscalls are not available, but the redefines allow generic
>> +   wrappers to work.  */
>> +#define __NR_clock_adjtime	__NR_clock_adjtime64
>> +#define __NR_clock_getres	__NR_clock_getres_time64
>> +#define __NR_futex		__NR_futex_time64
>> +#define __NR_mq_timedreceive	__NR_mq_timedreceive_time64
>> +#define __NR_mq_timedsend	__NR_mq_timedsend_time64
>> +#define __NR_ppoll		__NR_ppoll_time64
>> +#define __NR_pselect6		__NR_pselect6_time64
>> +#define __NR_recvmmsg		__NR_recvmmsg_time64
>> +#define __NR_rt_sigtimedwait	__NR_rt_sigtimedwait_time64
>> +#define __NR_sched_rr_get_interval	__NR_sched_rr_get_interval_time64
>> +#define __NR_semtimedop		__NR_semtimedop_time64
>> +#define __NR_timerfd_gettime	__NR_timerfd_gettime64
>> +#define __NR_timerfd_settime	__NR_timerfd_settime64
>> +#define __NR_utimensat		__NR_utimensat_time64
> 
> As for the fixup-asm-unistd.h, the generic implementation should handle it
> without the requirement of the ABI to add such tricks.

fixup-asm-unistd.h is different, but this could be avoided. I know for sure that
ll code literally expects __NR_futex (atleast used to). But I can remove this and
see what comes out.

> 
> However it seems that we are still missing support for pselect 
> (__NR_pselect6_time64), recvmmsg (__NR_recvmmsg_time64), sigtimedwait 
> (__NR_rt_sigtimedwait_time64), and semtimeop (__NR_semtimedop_time64).
> 
> I think we can add the redefine hack only the aforementioned symbols for
> now and removed them once we implement the y2038 support on such symbols
> (since the expected ABI won't change for ARC, only for old ABIs with
> 32 time_t support).

Sorry /me horribly confused here.

>> +
>> +#undef SYS_ify
>> +#define SYS_ify(syscall_name)   __NR_##syscall_name
> 
> The code mixes __NR_* and SYS_ify macro. This macro is really superflous
> and I am preparing some patches to cleanup this up along with C asm
> macros to generate syscall.  So I would suggest to just use the __NR_*
> way and drop this definition.

I don't mind, but it seems that the wrapper was a simply way to avoid open-coding
the macro concatenation. e.g.

# define DO_CALL(syscall_name, args)                    \
-    mov    r8, SYS_ify (syscall_name)  ASM_LINE_SEP    \
+    mov    r8, __NR__##syscall_name  ASM_LINE_SEP    \
     ARC_TRAP_INSN
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
