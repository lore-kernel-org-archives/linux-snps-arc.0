Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AAAC0044D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 18:01:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B2F20691
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 18:01:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WCXIR+c6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="O+4HDszN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="LqCzS3mg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50B2F20691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aOu4z23S/56XvzZxMYvjTwv3a45sHXNiUrqFTPHWylU=; b=WCXIR+c6JQ45ur
	x128ZYhUBE1jq/KRlmgLdHeZzZwoc0vXrICzz/4HHnhcY1Bvh6uNWc26T8LDdLnYXt6EsLeho7P4I
	Tv1W2sJy5I7SXmeBaH0De57JqMb/Ssm6/2QSmG8x/sTDPeqa3HFWuK8k7KiV1gqZpUM4h4yBRqVCC
	wj9fh2YoKBSXS4Z/qjBGOo1oavAo8w7EuPsl3C8bVB1/6jIVSxoXDzwOM1ipMltkmp3XA7rsMC84z
	pLcWLCJGcNzvxZ8HsB4v0aU9kJF+/iuHvGEYU1075VdjsBqAQ2duVz3pnyv+dwfyEhvdQ1g/71+TL
	NMChKQISiAc5hOz8RYVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC5fC-000142-2a; Wed, 11 Mar 2020 18:01:02 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC5dj-00072N-77
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 17:59:40 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2D39743B7B;
 Wed, 11 Mar 2020 17:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583949570; bh=ASwAPdP4MwWM2RX1+f1rVlw47Z4Ii7mgfPVJ0M3Iyb0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=O+4HDszN3cn8DTwnQ4eZTFP5UDr2DX6SjKiEHgPmo8UsnuTY7/+qahvIFoHOyb9hf
 dSkmNvP8d20LkSB15/EiQUtL8YKSpUcCjlheBqT7FbtKW7yFRQz5QrrgHkOzkHuu3R
 Kz6If37zAiNFGBX7fpFWxhnOJigAotZtVGuxCfEB9o+LynqZbn51bS2niB+RejSzSk
 PAeZf3BecqIAbeneOWm0WcjUt73u+m0QzpAfL7LqfU1+QZz/12OHYW381lAP9dZR36
 faefOagsI5LLa1tA2dsfZZ7Z8Mn2Jn8ZixSaXc1jPZK9LtWxDlrZzQh8t1jmiRWTQM
 CFzb5fI75DBtA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 064EAA006A;
 Wed, 11 Mar 2020 17:59:28 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 11 Mar 2020 10:59:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 11 Mar 2020 10:59:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wog5lSOAoJWuzBmB+aSpc1ejfo93xutRtsWyYPDf8zCDCqrUpr36pPyRhDF5HkWG0x+tXsvh+kMH6LE43m7ZF6hMJpLpv0PkVmGXqa2PaETZLejdWB6SnE0W8B8sUc9W5Ag+lLSNn5dY1RumaVhyhfNdINsunYMGe5B47uumZPwieNhP6IrLwqrO9D/rYb9xnGAGouO0NOHMsGLmmsFljMZnkKlvCY3hub7d3pE1lba8xfLDzjpxIL2UBUi/Zk/UMcmDv4neldbRa5812q/nUchSohCrw+GnBilOvUtOP0yCXX/rd2k7TJHtL2cMFqe7lfKcng1DjoN7TvT1HmDgsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASwAPdP4MwWM2RX1+f1rVlw47Z4Ii7mgfPVJ0M3Iyb0=;
 b=JhwC1QZ0hzCdg2BHZVqnWvRi4pPqSqjN211zgGk79TrzbwiyhewrMcQazWPtAwZfjCpcgXoyeDJR/qgPi+2cmHWWzlwH3fX4kD6/DMeEW7f7aqH1efI+sksTn+tkfuIrAdSdJ8HyUBfS4RwHjuSQ5e3HTTn9nuRLanPigoiobM6ykimcb6ickwy1YVaTQIQQeg25utcWLR//txRtdmw4JPEdw2UTzCKi95bcyUnMUwqcPhC53PD5dYMOrE7L8aWEaB+1zFlcZwPkXbTs7rW8XQwlqT8tsh0r/D0+Hu0Xbu+wPINTSpNfBHH8CCVOAyjmdvQGzwW/yGSZyWowmqqIyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASwAPdP4MwWM2RX1+f1rVlw47Z4Ii7mgfPVJ0M3Iyb0=;
 b=LqCzS3mguVnUTz8qx9NK/xW2lwF56JR8qhf8esi5vNA1UyGTSBNTHLzl3CblHfZZroYJ/FhRpIYSKDByqAO0woSge5OGt8siZUjUBpCcoKna13O5YloeyiqGN0DOgNl+6Xe8U0ZMMVpFUPE8vi0aBqeNSNQxrh8sLAXgLNbaE2g=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2789.namprd12.prod.outlook.com (2603:10b6:a03:72::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Wed, 11 Mar
 2020 17:59:18 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 17:59:18 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: asm-generic based msgctl (was Re: [PATCH v3 3/3] sysv: linux: Pass
 64-bit version of semctl syscall)
Thread-Topic: asm-generic based msgctl (was Re: [PATCH v3 3/3] sysv: linux:
 Pass 64-bit version of semctl syscall)
Thread-Index: AQHV987II0mVcRQF4E6N/gJgK6jQgA==
Date: Wed, 11 Mar 2020 17:59:17 +0000
Message-ID: <60ea078f-9da2-df0b-6f78-752d83e562b3@synopsys.com>
References: <20200305012605.26870-1-alistair.francis@wdc.com>
 <20200305012605.26870-4-alistair.francis@wdc.com>
 <69e30ee6-30a4-81d6-141e-1a42f15a5c8e@synopsys.com>
In-Reply-To: <69e30ee6-30a4-81d6-141e-1a42f15a5c8e@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 0eb87615-44d5-47d1-f79e-08d7c5e5eb35
x-ms-traffictypediagnostic: BYAPR12MB2789:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2789EBA8FAA196F77F5851A5B6FC0@BYAPR12MB2789.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(396003)(346002)(39860400002)(376002)(199004)(6486002)(2906002)(8936002)(31696002)(6506007)(64756008)(5660300002)(76116006)(66446008)(66946007)(66556008)(53546011)(2616005)(66476007)(36756003)(6512007)(54906003)(86362001)(478600001)(4326008)(71200400001)(110136005)(8676002)(81156014)(186003)(31686004)(81166006)(26005)(316002)(41533002)(40753002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2789;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qGpsAwX9jl0PeJ2dxeuVhFWCHoGfr0Fp4J+LLFUZ9qjPL+nCT8AulJjTQJwSlX4qiPzAsaGJw1aOKwmjTN/FdFH+mqQpRYzThp78QMAv9Hd1Rmz4bP3xyAvz3N7AgPTKdHXbj0S3KQy0ySlrqbdAeAq4yKIy/jF1Yw1CIB3qlybQZF9/WV9GQEC1PsmxfiE15TXoOHBS1B/OzfGBOjXw8BEn7b3JO5c0N1WaBD4GCYRpg3WbGw6HRLHuhwZm7VNGzUeTH3pKHfccZ6/xl/I+N5lqS8jWUNmddf5XC/30bT/gbzLZbO0lXny6jm6pOJEp3TrCC1TDW1w2h2Pd5J5G5e6VFs6LARdKNyOqozzgNvube3aZA+u8KWqHAgQ8CYsJUFqZti6Q3pjw37YV36VOiLUv8uZFW8Mocl5r++cZTpdZmJzY70KR9j/lT5o+BaGxpMlgj3zTcmXTMt9pfc2b1dEKGFK/3b0q8dqf3eRyY823tfOV5q+3lazyKBP8G8jur2L7Z3X3+1mfnIlC4Q3S+w==
x-ms-exchange-antispam-messagedata: hgxpzRP/Jtyx1uajAHSnNObAAMhIlzZ300k0YWMaDuhmUwgnjHF1qaaFtnHsHEFf426nWhaDS96WvWuo/YJQfPwIlFT+Lt4tlKW+4Wt6PLT9G0yGp8xBSjumxDVHc+N3JBW5AdqQI/N7TQ+0OKCvzw==
Content-ID: <02E5FCE2F2C0A3419290DF1197C25771@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb87615-44d5-47d1-f79e-08d7c5e5eb35
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 17:59:17.9370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tAyazaV+4p7rkRD6pgoSxhevt1PTi9Sv9AkgEq4QmRUaq+qyBaPJCwQ63oiGtwa9432LWrolXHTTTLIb/yvaLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2789
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_105931_311705_FEAA0912 
X-CRM114-Status: GOOD (  18.68  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/10/20 5:29 PM, Vineet Gupta via Libc-alpha wrote:
> Hi Alistair,
> 
> On 3/4/20 5:26 PM, Alistair Francis wrote:
>> The semctl_syscall() function passes a union semun to the kernel. The
>> union includes struct semid_ds as a member. On 32-bit architectures the
>> Linux kernel provides a *_high version of the 32-bit sem_otime and
>> sem_ctime values. These can be combined to get a 64-bit version of the
>> time.
>>
>> This patch adjusts the struct semid_ds to support the *_high versions
>> of sem_otime and sem_ctime. For 32-bit systems with a 64-bit time_t
>> this can be used to get a 64-bit time from the two 32-bit values.
>>
>> We protect this new code via the __IPC_TIME64 marco, which is only true
>> for 32-bit architectures with a 64-bit time_t.

[snip...]

>>
>> diff --git a/bits/ipc.h b/bits/ipc.h
>> index e2981fd5c3..9ac8485193 100644
>> --- a/bits/ipc.h
>> +++ b/bits/ipc.h
>> @@ -29,7 +29,11 @@
>>  /* Control commands for `msgctl', `semctl', and `shmctl'.  */
>>  #define IPC_RMID	0		/* remove identifier */
>>  #define IPC_SET		1		/* set `ipc_perm' options */
>> -#define IPC_STAT	2		/* get `ipc_perm' options */
>> +#if __TIMESIZE == 64 && __WORDSIZE == 32
>> +# define IPC_STAT 0x102     /* Get `ipc_perm' options.  */
>> +#else
>> +# define IPC_STAT 2   /* Get `ipc_perm' options.  */
>> +#endif
> 
> Why is this needed. Linux kernel seems to be returning EINVAL for this cmd-id and
> following fail for ARC.
> 
> FAIL: sysvipc/test-sysvmsg
> FAIL: sysvipc/test-sysvsem
> FAIL: sysvipc/test-sysvshm
> 
> Shouldn't this use the default __IPC_64 value which is 0 not 0x100.
> 

>> diff --git a/sysdeps/unix/sysv/linux/semctl.c b/sysdeps/unix/sysv/linux/semctl.c
>> index 0c3eb0932f..3ac6d01b84 100644
>> --- a/sysdeps/unix/sysv/linux/semctl.c
>> +++ b/sysdeps/unix/sysv/linux/semctl.c
>> @@ -23,11 +23,16 @@
>>  #include <shlib-compat.h>
>>  #include <errno.h>
>>  
>> +#define __IPC_TIME64 (IPC_STAT & __IPC_64)

So __IPC_TIME64 can only happen if we have 0x102 based cmd ? But doesn't
asm-generic ABI preclude the 0x100 ?

>> +
>>  /* Define a `union semun' suitable for Linux here.  */
>>  union semun
>>  {
>>    int val;			/* value for SETVAL */
>>    struct semid_ds *buf;		/* buffer for IPC_STAT & IPC_SET */
>> +#if __WORDSIZE == 32
>> +  struct __semid_ds32 *buf32;   /* 32-bit buffer for IPC_STAT & IPC_SET */
>> +#endif
>>    unsigned short int *array;	/* array for GETALL & SETALL */
>>    struct seminfo *__buf;	/* buffer for IPC_INFO */
>>  };
>> @@ -43,13 +48,25 @@ union semun
>>  static int
>>  semctl_syscall (int semid, int semnum, int cmd, union semun arg)
>>  {
>> +  int ret;
>>  #ifdef __ASSUME_DIRECT_SYSVIPC_SYSCALLS
>> -  return INLINE_SYSCALL_CALL (semctl, semid, semnum, cmd | __IPC_64,
>> -			      arg.array);
>> +  ret = INLINE_SYSCALL_CALL (semctl, semid, semnum, cmd | __IPC_64,
>> +                             arg.array);
>>  #else
>> -  return INLINE_SYSCALL_CALL (ipc, IPCOP_semctl, semid, semnum, cmd | __IPC_64,
>> -			      SEMCTL_ARG_ADDRESS (arg));
>> +  ret = INLINE_SYSCALL_CALL (ipc, IPCOP_semctl, semid, semnum, cmd | __IPC_64,
>> +                             SEMCTL_ARG_ADDRESS (arg));
>> +#endif
>> +
>> +#if __IPC_TIME64
>> +  if (ret == 0 && (cmd & __IPC_TIME64))
>> +    {
>> +      arg.buf->sem_ctime = arg.buf32->sem_ctime |
>> +                               ((time_t) arg.buf32->sem_ctime_high << 32);
>> +      arg.buf->sem_otime = arg.buf32->sem_otime |
>> +                               ((time_t) arg.buf32->sem_otime_high << 32);
>> +    }
>>  #endif
>> +  return ret;
>>  }
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
