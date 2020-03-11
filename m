Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D22C10DCE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 00:29:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1C02222C3
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 00:29:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZqW3ThEd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IaEMi10B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="apNk+o8H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1C02222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpW+tslhoM2hJpFPfmxcWPgYDrxGckUAVznq3jB+7Ec=; b=ZqW3ThEdlxDfj7
	cR7KIh/cEouLohFi9XgEo4UjMr2+ylWFqSBUtb8KJjCDaOXa5SVTA5ZwK7DSB2cHegBGsE/RmdBjd
	XcF3+59zl3cwzlUQLDZkg1L7aoYE9FRZFlJ96UJE6qDWlX83wwP+Msrc7LK7UusHLkt+hUQ4hLxVa
	/ghIM/YQ9WcA777m/dcmKiY7hf895v3XfYvcMwK9MuUFmATA1k3EK8BWBFFNGM2W7eGJb4YrbZD7E
	h4jUPLf+ZdOTP2UEZRH6Vtan+kH74FRCK3tVXWS8rg0eqG6+rjhG7O4jyEUlpuUFkMCGIFNMARr/S
	4tr3cHClbFgV8Ptnq8dA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBpFj-00035f-KD; Wed, 11 Mar 2020 00:29:39 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBpFg-000359-RD
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 00:29:39 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 792DBC0F3B;
 Wed, 11 Mar 2020 00:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583886574; bh=wfm3yTSX7SCUx2vdN0DPvnidCdhZBsdp5Fb/ZTYBRsQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=IaEMi10BCglDTSbkeD8tZDirtqVMV5vxOSxwZEEhhTw46k3TljonaX0nYe5QoTwyG
 aCjBCyoOX7mI/COmREt0W0AVefgKTToKcAgRCkEidNW4HpXWCR6RcK/7trh3QB62aW
 3q69CGVNAAx1FonaVIHiquSGs4fM6+nacF+uNRjb+LU1YTEXb5Klg8+xYePR3C75BL
 m4OxFqMyDUpnhex+CFgBaMR6SUa33W7juvFDav3fhGob0T5kwbqUyXxrmJwRDz6SrC
 JzMT2LQ8a/uvnd6DKdORSa9JCygd/EcYlRfOtF96ToVclAQDpDQYQlguNbTRu1eUFb
 5MyiDPimaXfvw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 09397A0083;
 Wed, 11 Mar 2020 00:29:34 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 10 Mar 2020 17:29:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 10 Mar 2020 17:29:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVAP7Ja39nV6lQDpyWFHNre3EAIvccIFWfx9T6QdFX1pCNIeHPw+bRiEUKpy/74kNuyQhta32fj6LCygqWJoJNILZi66hyroSkVDtvjxsfaACQHK2PC03dWMP983UMz1dzEO2v/UisXLGjrATpx5WI/a91OiGQC0hq7GCT+LYrumz8GVNtABqFmP/2zzhQSXJq/Xh1cR0ZkiuAzl0u26ErsnZ6rsi5Pjw7Jsy+FJZTvhO2XnsnDBLL0X7kF6iMQV7ag++/U+O643eST3LWMLFLFwALwCSXqgJnQEy15QVQZspY/1SA/s0ZhOMveHB9PM0OWLU93g7UDX9MkopZGqDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfm3yTSX7SCUx2vdN0DPvnidCdhZBsdp5Fb/ZTYBRsQ=;
 b=BYfqncMP6nnl0k0PF0MwFKBjwOP7Yc/xc5j9xZGodmAhfbgZ61y+tfxs0wY2uVv7T8IVA50ZGxWZ1OZIQYWE0MpRo+6GqClcZsgNjC924JpNRkHP+qgKoW6FkN0JDE9HhNO5JFonmhtfgumxpzL3MIKqVKLU0yHCBYC9hwgJ5Kia67Q/vMEV6VfDrFPeKEQ4kOdcOX9WYcLZaul3kBAGbGRCYeoLq6tf3Ap31rnNkTq0+mhYzJqpqjBWy6lxaXF3RAOlCuk2XegMZCkGbgY6S/A+YI+fCfFN/BM56kxbgun0iH0LWmfZwNMg4Ke48BPi3w1cWGLdwRzVfgQ0ERb5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfm3yTSX7SCUx2vdN0DPvnidCdhZBsdp5Fb/ZTYBRsQ=;
 b=apNk+o8Hb6N6C/D0xTSJcPxdT+c2IuIbMn8eUGw6fmwZbMhKd3IOVUTa7BdVpozzSKCKhx+zPIQXpUZ8TL4MMkA2ALZxscxrJuoUThixq7Y233QKvF5Dxd0Kbq9Ipa/pHYiDz7uSIKt6DgRSO/wpEr5bDWlD/WlVM6enumlqzAs=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3032.namprd12.prod.outlook.com (2603:10b6:a03:dd::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Wed, 11 Mar
 2020 00:29:02 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 00:29:02 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Alistair Francis <alistair.francis@wdc.com>, "libc-alpha@sourceware.org"
 <libc-alpha@sourceware.org>
Subject: Re: [PATCH v3 3/3] sysv: linux: Pass 64-bit version of semctl syscall
Thread-Topic: [PATCH v3 3/3] sysv: linux: Pass 64-bit version of semctl syscall
Thread-Index: AQHV9zwQ8n+kgHWvdEyKdL46eFRF8Q==
Date: Wed, 11 Mar 2020 00:29:02 +0000
Message-ID: <69e30ee6-30a4-81d6-141e-1a42f15a5c8e@synopsys.com>
References: <20200305012605.26870-1-alistair.francis@wdc.com>
 <20200305012605.26870-4-alistair.francis@wdc.com>
In-Reply-To: <20200305012605.26870-4-alistair.francis@wdc.com>
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
x-ms-office365-filtering-correlation-id: cb7d2d79-af1a-4cef-31a1-08d7c5533315
x-ms-traffictypediagnostic: BYAPR12MB3032:
x-microsoft-antispam-prvs: <BYAPR12MB3032D2BD2F16AB9BE2E3B5CDB6FC0@BYAPR12MB3032.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(39850400004)(366004)(396003)(346002)(199004)(189003)(2616005)(31696002)(71200400001)(6512007)(66946007)(2906002)(86362001)(4326008)(186003)(6486002)(5660300002)(30864003)(36756003)(478600001)(81166006)(31686004)(81156014)(8936002)(76116006)(316002)(26005)(110136005)(66476007)(8676002)(53546011)(6506007)(66556008)(66446008)(64756008)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3032;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kIC0q7+wKBU+1JPwifGj7z7cKwaOSsfP2MHoQ2Amva7nPda107VkGT5jUpYz5Z/6NxFG8Eowigm5TuNRnDtmadohQkqzIpVc0uwahpBeHP+B5nN8NdKABNBmmWNyqRb6GoPs0VcAf8+YCtwkwxuYZXHr2FPwwUpoQ7VUG4n9EL7wEsLOqZqRUZVa1dK0wyL8S4FSZWEZcmmIpMkXyuh2pyHe5IhORQVkCfb6EpzWqcZ8OovLPuTAacdac9guoKChL9Eky9Q26WY0l3D9q8u20d0p2CBWnwVV89IUZpHCQ4QLogKiSRbGpPphPrvo9p87Ra0dg87zKxiG3lSWrpFqwBy78/8nvXeSpdtiY94BsIfgHZtn/mG2rK8UN944U4+koSZDZcTEzOScupmXLsf92CpA95s2KS1uzy/Ptd4TjRiNr9AAb7cpr87BaEPCjyM6
x-ms-exchange-antispam-messagedata: EWna7FADTbUFpoPYaky+KvSfraJgdB/nuOHyiM4wYwt0itVGAEaMCzI/MMuDtckpD2AmHOteHieATHHXaWO+WU9Chb7n+UMTxaVjioaLgjkGafIP4a1AZFAeaWHeYct+QdRdXxi9/S0xf8n+J40ZMQ==
x-ms-exchange-transport-forked: True
Content-ID: <19521AA8D667784CB6B6292AF2DA7C4E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7d2d79-af1a-4cef-31a1-08d7c5533315
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 00:29:02.4499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vwkgqn1iZXuWIrVGtL6PLWd+XiIAThdZkFCCfKuoN9tqexpcIK1Na9uU9rAyhhI83MU1DrOx7OZbHiCeLFqZnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3032
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_172937_013911_C2393493 
X-CRM114-Status: GOOD (  21.40  )
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
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Alistair,

On 3/4/20 5:26 PM, Alistair Francis wrote:
> The semctl_syscall() function passes a union semun to the kernel. The
> union includes struct semid_ds as a member. On 32-bit architectures the
> Linux kernel provides a *_high version of the 32-bit sem_otime and
> sem_ctime values. These can be combined to get a 64-bit version of the
> time.
> 
> This patch adjusts the struct semid_ds to support the *_high versions
> of sem_otime and sem_ctime. For 32-bit systems with a 64-bit time_t
> this can be used to get a 64-bit time from the two 32-bit values.
> 
> We protect this new code via the __IPC_TIME64 marco, which is only true
> for 32-bit architectures with a 64-bit time_t.
> ---
>  bits/ipc.h                                    |  6 ++++-
>  sysdeps/gnu/bits/ipc.h                        |  6 ++++-
>  sysdeps/unix/sysv/linux/bits/ipc.h            |  6 ++++-
>  sysdeps/unix/sysv/linux/bits/semid_ds_t.h     | 15 +++++++++++
>  .../unix/sysv/linux/hppa/bits/semid_ds_t.h    | 15 +++++++++++
>  .../unix/sysv/linux/mips/bits/semid_ds_t.h    | 13 ++++++++++
>  .../unix/sysv/linux/powerpc/bits/semid_ds_t.h | 15 +++++++++++
>  sysdeps/unix/sysv/linux/semctl.c              | 25 ++++++++++++++++---
>  .../unix/sysv/linux/sparc/bits/semid_ds_t.h   | 15 +++++++++++
>  sysdeps/unix/sysv/linux/x86/bits/semid_ds_t.h | 15 +++++++++++
>  10 files changed, 124 insertions(+), 7 deletions(-)
> 
> diff --git a/bits/ipc.h b/bits/ipc.h
> index e2981fd5c3..9ac8485193 100644
> --- a/bits/ipc.h
> +++ b/bits/ipc.h
> @@ -29,7 +29,11 @@
>  /* Control commands for `msgctl', `semctl', and `shmctl'.  */
>  #define IPC_RMID	0		/* remove identifier */
>  #define IPC_SET		1		/* set `ipc_perm' options */
> -#define IPC_STAT	2		/* get `ipc_perm' options */
> +#if __TIMESIZE == 64 && __WORDSIZE == 32
> +# define IPC_STAT 0x102     /* Get `ipc_perm' options.  */
> +#else
> +# define IPC_STAT 2   /* Get `ipc_perm' options.  */
> +#endif

Why is this needed. Linux kernel seems to be returning EINVAL for this cmd-id and
following fail for ARC.

FAIL: sysvipc/test-sysvmsg
FAIL: sysvipc/test-sysvsem
FAIL: sysvipc/test-sysvshm

Shouldn't this use the default __IPC_64 value which is 0 not 0x100.

>  
>  /* Special key values.  */
>  #define IPC_PRIVATE	((key_t) 0)	/* private key */
> diff --git a/sysdeps/gnu/bits/ipc.h b/sysdeps/gnu/bits/ipc.h
> index 47df305e1c..328c11a0d7 100644
> --- a/sysdeps/gnu/bits/ipc.h
> +++ b/sysdeps/gnu/bits/ipc.h
> @@ -29,7 +29,11 @@
>  /* Control commands for `msgctl', `semctl', and `shmctl'.  */
>  #define IPC_RMID	0		/* Remove identifier.  */
>  #define IPC_SET		1		/* Set `ipc_perm' options.  */
> -#define IPC_STAT	2		/* Get `ipc_perm' options.  */
> +#if __TIMESIZE == 64 && __WORDSIZE == 32
> +# define IPC_STAT 0x102     /* Get `ipc_perm' options.  */
> +#else
> +# define IPC_STAT 2   /* Get `ipc_perm' options.  */
> +#endif
>  #ifdef __USE_GNU
>  # define IPC_INFO	3		/* See ipcs.  */
>  #endif
> diff --git a/sysdeps/unix/sysv/linux/bits/ipc.h b/sysdeps/unix/sysv/linux/bits/ipc.h
> index 085dd628ac..44449de62f 100644
> --- a/sysdeps/unix/sysv/linux/bits/ipc.h
> +++ b/sysdeps/unix/sysv/linux/bits/ipc.h
> @@ -29,7 +29,11 @@
>  /* Control commands for `msgctl', `semctl', and `shmctl'.  */
>  #define IPC_RMID	0		/* Remove identifier.  */
>  #define IPC_SET		1		/* Set `ipc_perm' options.  */
> -#define IPC_STAT	2		/* Get `ipc_perm' options.  */
> +#if __TIMESIZE == 64 && __WORDSIZE == 32
> +# define IPC_STAT 0x102     /* Get `ipc_perm' options.  */
> +#else
> +# define IPC_STAT	2		/* Get `ipc_perm' options.  */
> +#endif
>  #ifdef __USE_GNU
>  # define IPC_INFO	3		/* See ipcs.  */
>  #endif
> diff --git a/sysdeps/unix/sysv/linux/bits/semid_ds_t.h b/sysdeps/unix/sysv/linux/bits/semid_ds_t.h
> index d9d902ed0d..b135301356 100644
> --- a/sysdeps/unix/sysv/linux/bits/semid_ds_t.h
> +++ b/sysdeps/unix/sysv/linux/bits/semid_ds_t.h
> @@ -20,6 +20,21 @@
>  # error "Never include <bits/semid_ds_t.h> directly; use <sys/sem.h> instead."
>  #endif
>  
> +#if __WORDSIZE == 32
> +/* This is the "new" y2038 types defined after the 5.1 kernel. It allows
> + * the kernel to use {o,c}time{_high} values to support a 64-bit time_t.  */
> +struct __semid_ds32 {
> +  struct ipc_perm sem_perm;              /* operation permission struct */
> +  __syscall_ulong_t   sem_otime;         /* last semop() time */
> +  __syscall_ulong_t   sem_otime_high;    /* last semop() time high */
> +  __syscall_ulong_t   sem_ctime;         /* last time changed by semctl() */
> +  __syscall_ulong_t   sem_ctime_high;    /* last time changed by semctl() high */
> +  __syscall_ulong_t   sem_nsems;         /* number of semaphores in set */
> +  __syscall_ulong_t   __glibc_reserved3;
> +  __syscall_ulong_t   __glibc_reserved4;
> +};
> +#endif
> +
>  /* Data structure describing a set of semaphores.  */
>  #if __TIMESIZE == 32
>  struct semid_ds
> diff --git a/sysdeps/unix/sysv/linux/hppa/bits/semid_ds_t.h b/sysdeps/unix/sysv/linux/hppa/bits/semid_ds_t.h
> index 39c0e53f38..3613c5ec94 100644
> --- a/sysdeps/unix/sysv/linux/hppa/bits/semid_ds_t.h
> +++ b/sysdeps/unix/sysv/linux/hppa/bits/semid_ds_t.h
> @@ -20,6 +20,21 @@
>  # error "Never include <bits/semid_ds_t.h> directly; use <sys/sem.h> instead."
>  #endif
>  
> +#if __WORDSIZE == 32
> +/* This is the "new" y2038 types defined after the 5.1 kernel. It allows
> + * the kernel to use {o,c}time{_high} values to support a 64-bit time_t.  */
> +struct __semid_ds32 {
> +  struct ipc_perm sem_perm;              /* operation permission struct */
> +  __syscall_ulong_t   sem_otime_high;    /* last semop() time high */
> +  __syscall_ulong_t   sem_otime;         /* last semop() time */
> +  __syscall_ulong_t   sem_ctime_high;    /* last time changed by semctl() high */
> +  __syscall_ulong_t   sem_ctime;         /* last time changed by semctl() */
> +  __syscall_ulong_t   sem_nsems;         /* number of semaphores in set */
> +  __syscall_ulong_t   __glibc_reserved3;
> +  __syscall_ulong_t   __glibc_reserved4;
> +};
> +#endif
> +
>  /* Data structure describing a set of semaphores.  */
>  #if __TIMESIZE == 32
>  struct semid_ds
> diff --git a/sysdeps/unix/sysv/linux/mips/bits/semid_ds_t.h b/sysdeps/unix/sysv/linux/mips/bits/semid_ds_t.h
> index 1ab16492dd..e26906a67f 100644
> --- a/sysdeps/unix/sysv/linux/mips/bits/semid_ds_t.h
> +++ b/sysdeps/unix/sysv/linux/mips/bits/semid_ds_t.h
> @@ -20,6 +20,19 @@
>  # error "Never include <bits/semid_ds_t.h> directly; use <sys/sem.h> instead."
>  #endif
>  
> +#if __WORDSIZE == 32
> +/* This is the "new" y2038 types defined after the 5.1 kernel. It allows
> + * the kernel to use {o,c}time{_high} values to support a 64-bit time_t.  */
> +struct __semid_ds32 {
> +  struct ipc_perm sem_perm;              /* operation permission struct */
> +  __syscall_ulong_t   sem_otime;          /* last semop time */
> +  __syscall_ulong_t   sem_ctime;          /* last change time */
> +  __syscall_ulong_t   sem_nsems;         /* number of semaphores in set */
> +  __syscall_ulong_t   sem_otime_high;
> +  __syscall_ulong_t   sem_ctime_high;
> +};
> +#endif
> +
>  /* Data structure describing a set of semaphores.  */
>  struct semid_ds
>  {
> diff --git a/sysdeps/unix/sysv/linux/powerpc/bits/semid_ds_t.h b/sysdeps/unix/sysv/linux/powerpc/bits/semid_ds_t.h
> index 79b4cba939..ec2ff552eb 100644
> --- a/sysdeps/unix/sysv/linux/powerpc/bits/semid_ds_t.h
> +++ b/sysdeps/unix/sysv/linux/powerpc/bits/semid_ds_t.h
> @@ -20,6 +20,21 @@
>  # error "Never include <bits/semid_ds_t.h> directly; use <sys/sem.h> instead."
>  #endif
>  
> +#if __WORDSIZE == 32
> +/* This is the "new" y2038 types defined after the 5.1 kernel. It allows
> + * the kernel to use {o,c}time{_high} values to support a 64-bit time_t.  */
> +struct __semid_ds32 {
> +  struct ipc_perm sem_perm;              /* operation permission struct */
> +  __syscall_ulong_t   sem_otime_high;    /* last semop() time high */
> +  __syscall_ulong_t   sem_otime;         /* last semop() time */
> +  __syscall_ulong_t   sem_ctime_high;    /* last time changed by semctl() high */
> +  __syscall_ulong_t   sem_ctime;         /* last time changed by semctl() */
> +  __syscall_ulong_t   sem_nsems;         /* number of semaphores in set */
> +  __syscall_ulong_t   __glibc_reserved3;
> +  __syscall_ulong_t   __glibc_reserved4;
> +};
> +#endif
> +
>  /* Data structure describing a set of semaphores.  */
>  #if __TIMESIZE == 32
>  struct semid_ds
> diff --git a/sysdeps/unix/sysv/linux/semctl.c b/sysdeps/unix/sysv/linux/semctl.c
> index 0c3eb0932f..3ac6d01b84 100644
> --- a/sysdeps/unix/sysv/linux/semctl.c
> +++ b/sysdeps/unix/sysv/linux/semctl.c
> @@ -23,11 +23,16 @@
>  #include <shlib-compat.h>
>  #include <errno.h>
>  
> +#define __IPC_TIME64 (IPC_STAT & __IPC_64)
> +
>  /* Define a `union semun' suitable for Linux here.  */
>  union semun
>  {
>    int val;			/* value for SETVAL */
>    struct semid_ds *buf;		/* buffer for IPC_STAT & IPC_SET */
> +#if __WORDSIZE == 32
> +  struct __semid_ds32 *buf32;   /* 32-bit buffer for IPC_STAT & IPC_SET */
> +#endif
>    unsigned short int *array;	/* array for GETALL & SETALL */
>    struct seminfo *__buf;	/* buffer for IPC_INFO */
>  };
> @@ -43,13 +48,25 @@ union semun
>  static int
>  semctl_syscall (int semid, int semnum, int cmd, union semun arg)
>  {
> +  int ret;
>  #ifdef __ASSUME_DIRECT_SYSVIPC_SYSCALLS
> -  return INLINE_SYSCALL_CALL (semctl, semid, semnum, cmd | __IPC_64,
> -			      arg.array);
> +  ret = INLINE_SYSCALL_CALL (semctl, semid, semnum, cmd | __IPC_64,
> +                             arg.array);
>  #else
> -  return INLINE_SYSCALL_CALL (ipc, IPCOP_semctl, semid, semnum, cmd | __IPC_64,
> -			      SEMCTL_ARG_ADDRESS (arg));
> +  ret = INLINE_SYSCALL_CALL (ipc, IPCOP_semctl, semid, semnum, cmd | __IPC_64,
> +                             SEMCTL_ARG_ADDRESS (arg));
> +#endif
> +
> +#if __IPC_TIME64
> +  if (ret == 0 && (cmd & __IPC_TIME64))
> +    {
> +      arg.buf->sem_ctime = arg.buf32->sem_ctime |
> +                               ((time_t) arg.buf32->sem_ctime_high << 32);
> +      arg.buf->sem_otime = arg.buf32->sem_otime |
> +                               ((time_t) arg.buf32->sem_otime_high << 32);
> +    }
>  #endif
> +  return ret;
>  }
>  
>  int
> diff --git a/sysdeps/unix/sysv/linux/sparc/bits/semid_ds_t.h b/sysdeps/unix/sysv/linux/sparc/bits/semid_ds_t.h
> index f8de676e79..b08fb8a79e 100644
> --- a/sysdeps/unix/sysv/linux/sparc/bits/semid_ds_t.h
> +++ b/sysdeps/unix/sysv/linux/sparc/bits/semid_ds_t.h
> @@ -20,6 +20,21 @@
>  # error "Never include <bits/semid_ds_t.h> directly; use <sys/sem.h> instead."
>  #endif
>  
> +#if __WORDSIZE == 32
> +/* This is the "new" y2038 types defined after the 5.1 kernel. It allows
> + * the kernel to use {o,c}time{_high} values to support a 64-bit time_t.  */
> +struct __semid_ds32 {
> +  struct ipc_perm sem_perm;              /* operation permission struct */
> +  __syscall_ulong_t   sem_otime_high;    /* last semop() time high */
> +  __syscall_ulong_t   sem_otime;         /* last semop() time */
> +  __syscall_ulong_t   sem_ctime_high;    /* last time changed by semctl() high */
> +  __syscall_ulong_t   sem_ctime;         /* last time changed by semctl() */
> +  __syscall_ulong_t   sem_nsems;         /* number of semaphores in set */
> +  __syscall_ulong_t   __glibc_reserved3;
> +  __syscall_ulong_t   __glibc_reserved4;
> +};
> +#endif
> +
>  /* Data structure describing a set of semaphores.  */
>  #if __TIMESIZE == 32
>  struct semid_ds
> diff --git a/sysdeps/unix/sysv/linux/x86/bits/semid_ds_t.h b/sysdeps/unix/sysv/linux/x86/bits/semid_ds_t.h
> index 42694069d5..c7b9adce88 100644
> --- a/sysdeps/unix/sysv/linux/x86/bits/semid_ds_t.h
> +++ b/sysdeps/unix/sysv/linux/x86/bits/semid_ds_t.h
> @@ -20,6 +20,21 @@
>  # error "Never include <bits/semid_ds_t.h> directly; use <sys/sem.h> instead."
>  #endif
>  
> +#if __WORDSIZE == 32
> +/* This is the "new" y2038 types defined after the 5.1 kernel. It allows
> + * the kernel to use {o,c}time{_high} values to support a 64-bit time_t.  */
> +struct __semid_ds32 {
> +  struct ipc_perm sem_perm;              /* operation permission struct */
> +  __syscall_ulong_t   sem_otime;         /* last semop() time */
> +  __syscall_ulong_t   sem_otime_high;    /* last semop() time high */
> +  __syscall_ulong_t   sem_ctime;         /* last time changed by semctl() */
> +  __syscall_ulong_t   sem_ctime_high;    /* last time changed by semctl() high */
> +  __syscall_ulong_t   sem_nsems;         /* number of semaphores in set */
> +  __syscall_ulong_t   __glibc_reserved3;
> +  __syscall_ulong_t   __glibc_reserved4;
> +};
> +#endif
> +
>  /* Data structure describing a set of semaphores.  */
>  struct semid_ds
>  {
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
