Return-Path: <SRS0=t4uf=4H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F55C34022
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 21:40:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 270AA24654
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 21:40:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JNyK/M2z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HYjk60Lq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="oFSgkeNB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 270AA24654
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmODFYPzascmHEGcat2nB+Rpk1Pnv868wSCq0HjERRs=; b=JNyK/M2zFL2Qz+
	0zN/pqkDYCK1bdXLP3I+9iFxeZ1p3jsT8acCDTLJpAy3iGjHsRm1lKraz82jdiO/YWAbEpiVrBsaW
	Ge/pDV2GQl0GW51VllhZtxBqAvuSpgNYeaQ7ft9LD7zezWQ9Yai4np1NYe0Z1ezhzddgn+laqomFK
	vozN9AXb65r8wft10q/cjvq5bSTlvZWpDxjfiVWSLuhakmmy+1FyOgxyeZLFGCMGB05/d6sQAEqM7
	5Ig4m3vAHFeiQ7dmgQBtb58Qvyj8BxAzqJWadTZHtr+NroV9PqCy/HQ/0gT1cKz+RZVlK7RoMye/F
	z3C0deBMN2v0/BJ7swjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4X5W-0007ZW-48; Wed, 19 Feb 2020 21:40:58 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4X5Q-0007Xo-Rl
 for linux-snps-arc@lists.infradead.org; Wed, 19 Feb 2020 21:40:57 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8736FC1024;
 Wed, 19 Feb 2020 21:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582148451; bh=lt/1XZ3wwu4hG/VVwHQgO9UUyyFHYFydWOkFHpUJd8s=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=HYjk60LqS9DHpqGq4NtdTog2/ZR2/x6rmN0MzO0X6ysfdxPmbieZj49z0Tn+vyXXJ
 6RifSff3Q9kIyE6IHoI1JmsiKVyGT1OM8o85Eh0v8oxlNJ0UFPLC1Xa8ENlCvrNwi+
 q8buUp2Huoj9xJfBK3WFA7eHUX1acaUgC8/7+cFEbM9kb9R8IMB7f5epn9hYVubHox
 Z1OKarzI5k+2b/xKSfRDeFFRfs+Pizlwczo8BGv7EVQDVFIojDSlSNWCLW5I1jx5ay
 oZesOqHmO1dZmyFvka0cTUVVAHRkQllVOSRDERFLIM5NOZ9utttmUBLSQoDxPFOA8d
 +QD+J7kHRQGFQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3D5C2A0153;
 Wed, 19 Feb 2020 21:40:51 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 19 Feb 2020 13:40:33 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 19 Feb 2020 13:40:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KyH+i5MrypfOiIx3RPKQW8lNKjU2RrJIqbXWnQfP0yyRzW5EvJVnMjd0pPM8Ty5HXmHMFXs9ucl6uxv/MXn4RytELCwI3M2wZrnHfFU4F1xLf5L/68yA67UXz6z6tzjIVgN2tsVi8yc3ufzbFLa1qCFXHLrrGch7/PAVrHB8h8ej1fLFj/513+SMi6dim2GA1GfomjrXqy/WUJu19t5qDVve8kG71cIdkspkptl9qj8qOaJA8hSV5Cx1boxWrJx6nGBH5Mc+gtkmEPD848FPmzFUfSXpR0aczYf3RiCtWeUReHEfF3UdNkBxIgXHz2caYwytTjdZSL0zgAqxOH49WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt/1XZ3wwu4hG/VVwHQgO9UUyyFHYFydWOkFHpUJd8s=;
 b=IVp4hZU77jZNi5m8eOevzXmue08znNNHg6l4loTHU0cP1lcBEghQbdB/1qdQciVX9Y0jNKjrOD2Sh/qNOd6a23hVDPJFoMBTlcQB0KcQx5Ffai6Av6RF4p32y8KStGoLWFsnSUSR+cUbDrgZifIxoBTGZ9iRxu4+OLbW3lhwUhI9n4J2OYFnAR0U11mc26AXa8JkYuDDTzMtVVM2E8cL+fQnq7NBqXnUm+lpraQJykOf84TlBgCqEY8n6sRrJlTk6VRoDwsDaA/64tVY6q46Bz1QhY4PgqY9PtKtxT2bLHHH53LYn+BmlHtqDB/eaRvwYZAvyR7kA0gmQgBUtRMtLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt/1XZ3wwu4hG/VVwHQgO9UUyyFHYFydWOkFHpUJd8s=;
 b=oFSgkeNBoIGuMpPj5ltWftmAUvuNxaTqjToDR6ik04XdKqzGR87TBhhqJ+xxSliv0PUvi/BcwoT1sFGXH7TA92MSijC1c72fOrvGMGqj2ILuCWk4o8V9L90iWlAwErem5JoHLANBYiq5K0pizlpCjIy4YlSmkno6QEUTxSvVC8U=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB2854.namprd12.prod.outlook.com (20.179.92.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.31; Wed, 19 Feb 2020 21:40:25 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24%7]) with mapi id 15.20.2729.033; Wed, 19 Feb 2020
 21:40:25 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH 08/15] nios2: Use Linux kABI for syscall return
Thread-Topic: [PATCH 08/15] nios2: Use Linux kABI for syscall return
Thread-Index: AQHV520xA6L4zHMr7k+UQPRfmajf7w==
Date: Wed, 19 Feb 2020 21:40:25 +0000
Message-ID: <10265c86-aba3-12f9-9208-4a4c6ad31d28@synopsys.com>
References: <20200210192038.23588-1-adhemerval.zanella@linaro.org>
 <20200210192038.23588-8-adhemerval.zanella@linaro.org>
In-Reply-To: <20200210192038.23588-8-adhemerval.zanella@linaro.org>
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
x-ms-office365-filtering-correlation-id: 1d0bc3a9-8f17-4c59-b70f-08d7b58454b1
x-ms-traffictypediagnostic: BYAPR12MB2854:
x-microsoft-antispam-prvs: <BYAPR12MB28544BAE449A26C1D40CCFADB6100@BYAPR12MB2854.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(376002)(346002)(396003)(136003)(199004)(189003)(31696002)(6512007)(316002)(6486002)(86362001)(2906002)(110136005)(81166006)(81156014)(186003)(66946007)(4326008)(31686004)(71200400001)(76116006)(36756003)(5660300002)(6506007)(66476007)(66556008)(8676002)(64756008)(2616005)(8936002)(53546011)(66446008)(26005)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2854;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qhCuSOe11qd+CKIUar+MCVjLvcxxC8BsHozjmSlI42aguaJsx8jMqEWcn8kiV/Sgum3e1htMtMQZ+JA25Ay6EbZsvxY/QlqRU1H5ABMawgO1BVYTc1seJloJ3V/bHqCDxqJwqfYagm+WQUXRRLe1NXmR6w4l0Jj+vYhnHmxR6fOGlkDkc2cD2Mt8EFpgSvYktmeGquU5i4w3XO7c/YbU7SOdGloKIkLiGvHGJvYojh+EGuBPjK2gZ1vAM/5I8gZxIJ4/ADnkEvl4i4ZACeoH87/0i7jWcXwiII501J7f1HONfSvxjB96Jff0aJd2Zy2Tq/sk4mrOJl+nmZdqgOsRrWF1SEVuepkTKqVY8qVK2CQLAR8QbsZ6SdH2Uh9t60NIvp6++pb/MUTzRGnmkuxxRYfIC1zPb10a2R1G3Ytn5e3FaDfPzfkzWErBEjay/CeI
x-ms-exchange-antispam-messagedata: qJdkrMfOpj8JFeu+VM7rkIdY89yxpEY9IAhNUKhdIKWbxGy+HFBV7/v3hOnltBNFQwqM70PvtxcZgYlXpumYvdS2QMel4DNkcEtnJpeHvAplHQ+MpO7c6pdROsG9TsXvQ5F2JPRA0Gg58hah/Efnrg==
x-ms-exchange-transport-forked: True
Content-ID: <FE179B4434211042952B7ABC318DEFB3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0bc3a9-8f17-4c59-b70f-08d7b58454b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 21:40:25.6028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9dNo+dAn7nH+5gt51U2KL6MU1qOr4NaYpNvDjlqyK+5cDmmUCjWieQUcKpwqAE4Bcw318+7j7C1I/grg/HnInQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2854
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_134053_025501_52B41DBA 
X-CRM114-Status: GOOD (  17.04  )
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

On 2/10/20 11:20 AM, Adhemerval Zanella wrote:
> It changes the nios INTERNAL_SYSCALL_RAW macro to return a negative
> value instead of 'r2' register value on 'err' macro argument.
> 
> The macro INTERNAL_SYSCALL_DECL is no longer required, and the
> INTERNAL_SYSCALL_ERROR_P follows the other Linux kABIS.
> 
> Checked with a build against nios2-linux-gnu.
> ---
>  sysdeps/unix/sysv/linux/nios2/sysdep.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/sysdeps/unix/sysv/linux/nios2/sysdep.h b/sysdeps/unix/sysv/linux/nios2/sysdep.h
> index b02730bd23..eab888df32 100644
> --- a/sysdeps/unix/sysv/linux/nios2/sysdep.h
> +++ b/sysdeps/unix/sysv/linux/nios2/sysdep.h
> @@ -157,13 +157,14 @@
>       (int) result_var; })
>  
>  #undef INTERNAL_SYSCALL_DECL
> -#define INTERNAL_SYSCALL_DECL(err) unsigned int err __attribute__((unused))
> +#define INTERNAL_SYSCALL_DECL(err) do { } while (0)
>  
>  #undef INTERNAL_SYSCALL_ERROR_P
> -#define INTERNAL_SYSCALL_ERROR_P(val, err) ((void) (val), (unsigned int) (err))
> +#define INTERNAL_SYSCALL_ERROR_P(val, err) \
> +  ((unsigned long) (val) >= (unsigned long) -4095)
>  
>  #undef INTERNAL_SYSCALL_ERRNO
> -#define INTERNAL_SYSCALL_ERRNO(val, err)   ((void) (err), val)
> +#define INTERNAL_SYSCALL_ERRNO(val, err)     (-(val))
>  
>  #undef INTERNAL_SYSCALL_RAW
>  #define INTERNAL_SYSCALL_RAW(name, err, nr, args...)            \
> @@ -180,8 +181,7 @@
>                       : "+r" (_r2), "=r" (_err)                  \
>                       : ASM_ARGS_##nr				\
>                       : __SYSCALL_CLOBBERS);                     \
> -       _sys_result = _r2;                                       \
> -       err = _err;                                              \
> +       _sys_result = _err != 0 ? -_r2 : -_r2;                   \

Is there a typo here ? both cases seem to be -ve

>       }                                                          \
>       (int) _sys_result; })
>  
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
