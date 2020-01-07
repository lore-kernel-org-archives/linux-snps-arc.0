Return-Path: <SRS0=s6v2=24=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2EEC33C9E
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jan 2020 01:03:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E7C22072E
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jan 2020 01:03:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hfP0zYz1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MoWNf6xH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="hxmpGODz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E7C22072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hzfFy6zBc8Ll2s2pdlEn7A5tb0sXDVy0I1sN+dIZNpk=; b=hfP0zYz1JqmLJZ
	Yl20CMutc3rk2wn4pmFzareBcVSegvjXhOuetLWwQS0D7VYdcggVbs2X2MnFUCMxv9joF1GKu8isg
	+v1FmgbcDU6d+UV6+4BO786ituy6gjooHIV4RF1l05kzl3tHgq8SZq7STVwn1g1RnLPrS3ANEnWyZ
	Jyt/lwE0kqzaonIKQupijYvTaBIiWRtA2J0MJ/nW7KV8jje3YUMFoqjSBTgOJiNrw86ir/prLTJkv
	SvsH7Yj8uTT1jshO1AIIePIRQi9Bb98QkBYA9wSvcrVPpAR9b9K4mLBxTSUFM297LWbf+BLChwpP8
	RKHYQXnfGmmdhfwk6B9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iodHD-0006kn-Nx; Tue, 07 Jan 2020 01:03:19 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iodH9-0006kQ-Uk
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jan 2020 01:03:17 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9E938C04FD;
 Tue,  7 Jan 2020 01:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1578358995; bh=tOXFYtCehtHbtLNum2aM13+ZUQIsKILrvqqeeJ8dbfo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=MoWNf6xH+fvPWWtgl9ZQmUja7DsB2m9daHKAk4LHkVH1lSSBmADgsNfQfduQlAqnj
 EpQfDmTHpirOe5VDshKaPKqOAOD8I+OrKdpJg/WZck+W50xGvmBlGB8x4nMwBTBJtI
 osoZRZkA1fIZ7GtiApmYj0eNi/RwUKLBR+hPF0aNHGKluQVOgudmjWadu2xbcUGQs+
 3IUmK3P7T8EYaMlxWGMe1T5peDLHMZwNUTOCObBonE3x9IwcvBt9QrjkUDB1Wj4ZOc
 Ey4guBscd8XH5LmLiKFQG/1IvhlTqFjYKileZLO3+2tdLuzuHl3xHMNQ6vhGvxBCrH
 u8taNKFo6IHIw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 363FBA006C;
 Tue,  7 Jan 2020 01:03:13 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 6 Jan 2020 17:03:12 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 6 Jan 2020 17:03:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbGeuhVq6c3SWPar4/k1A/+Fq1G7uJFXMvgDS9gCgyBe2dzSI+o7t5RgNwIskmDYJ0TCbDBZnTuYi+RRD1pb+LmeevA13fj1YW4OsJS0gKdqNPJPU5Q53RFe+lSiq9veTZdIjx0BS6utpkFenMWUZX45502FKIwalVioFut2kpMAeSs8dhN1l56wm9zaW7qrF1hoeP4Wvv0fRuKe+4OdkFa0YgQoR7LC4IwLAo1BQoA5rRD4BhdFEZYaML0/fV50TAlEjGBvzYzbafHvehExOG1RIfJP8pjEF9wTSSgEf3WfwHIde9FjMMDSeIuWWlMonkRNRCn9erQIOGWG2rkaCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOXFYtCehtHbtLNum2aM13+ZUQIsKILrvqqeeJ8dbfo=;
 b=N7VKypn3BKC9nCgQ+BVwY5Z997ZzpJZOnTm85PWQvQsYopa6hnl7Uzgirs1gAs9iqJ7Zbbwk55Ky7QwWVeHWN5Fb+Q9r9RrqDwQJDndke/QOgzTUxPcjF2rl1jhIL5jxhy4s/lRvZX8r2Ws/9Lif4EzDbdIuwzGXV72T1vdiCteExlVBXimEwBv8h/p7IFW9sF6TVeLiaYedRM1nzkkG04BlT+rGLRwlMhn06k9RQa32zfBf77mt2BqykaL7IJL6Vg7nSBJNYjqUI6mzakwdGwLnhV8EczwDRXYAtut9dchlBynpaFice5jfyuWh1z5OEoEqrTnYoO8dNPJBUMg00g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOXFYtCehtHbtLNum2aM13+ZUQIsKILrvqqeeJ8dbfo=;
 b=hxmpGODzJAImZQWdMs3brD3kVAEXAftKkn+seHKOeRwJ5t4UvMea+XN9kIwFePB63Fln3CaeYGurWJEtOc7l/86Cb6E96EZE72HyFTC3VkRb69fUL6aRH4GxE0esri/ObuP4AmzW8POZ0CCk6qlfQ/f7UXrNmEZroo3qecn0imk=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3334.namprd12.prod.outlook.com (20.178.55.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11; Tue, 7 Jan 2020 01:03:11 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2602.016; Tue, 7 Jan 2020
 01:03:11 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH 3/5] ARC: handle DSP presence in HW
Thread-Topic: [PATCH 3/5] ARC: handle DSP presence in HW
Thread-Index: AQHVvOAPR1zSenMpqUm+DVM4mBlrGafecrQA
Date: Tue, 7 Jan 2020 01:03:10 +0000
Message-ID: <6b80df9d-d0f2-d1e1-8e4b-b65531b938d9@synopsys.com>
References: <20191227180347.3579-1-Eugeniy.Paltsev@synopsys.com>
 <20191227180347.3579-4-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20191227180347.3579-4-Eugeniy.Paltsev@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 34e44f43-8516-4028-c8ba-08d7930d5d9a
x-ms-traffictypediagnostic: BYAPR12MB3334:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3334D9B1AFA9822A6FBE4D74B63F0@BYAPR12MB3334.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(136003)(376002)(39860400002)(199004)(189003)(71200400001)(54906003)(8936002)(5660300002)(6486002)(107886003)(110136005)(316002)(31686004)(6512007)(2906002)(66946007)(66556008)(64756008)(66446008)(66476007)(86362001)(2616005)(31696002)(6506007)(53546011)(26005)(36756003)(81166006)(186003)(81156014)(8676002)(4326008)(478600001)(76116006)(309714004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3334;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0W2PhPnKUALjrT2KyIZgGb+dlxhJA5a9noLmomglHtbdbD2izfm5kidZvKQtZ4FWjpRbZVKWzPj4UcQ7dFX8OwuLschifR0/U1V74M8GGLSQXNY4cqbWXqr3zduKEwoAz9yBOYNVO3iMTatxTI/i4JgJdHKf8YB/9zVRURPEuU2H5HTAoaIdb91BepMfDf9KhqYuoYW9Kt+a8gaWXCxNzt0xrrxn15KBRToKt3pdBdGyeIDd5woQdIAn5aaK1a5Ds884jZLXfiPBjHoVn108tuagxUe5mDh9+By1BZ87tSz2i15ORE8NeLCMw3mrErV2yVSjEMRyTaCmycxes4ObSJD71C4yvqfv13LiFasSUJ751UuonozMSqquompITMbTMuusMvnZ3f3lO4sNHN89dgaz/B0neWcaybMO6Ukzc7Tqn2lWMkQdWN19U7ypY0pA4vGFJ4tDkqOGfTg4gxAM0Z+V7cO8bIsm8OaWRPXcDVGTw7atMJxxJXCR4SYOSSRVdhkn3VrOFtkFtdVDleZ4J75/xkaFe3ktcZTXX+Y+R49Gq76ynxwHz3sqtgKCAsTC
Content-ID: <2F010D41A31FA149810EEB146F8ADCE1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e44f43-8516-4028-c8ba-08d7930d5d9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 01:03:10.8688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V+8uJWjAl+plA+W7VfgD5Ldb0SO11Gd3FNigMXAMMNpsMuvz0PzTHz/uVAW6EoR6DpK7EWB7qL0mWVFCMtIcwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3334
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200106_170316_210827_3982815C 
X-CRM114-Status: GOOD (  24.21  )
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
Cc: Alexey  Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 12/27/19 10:03 AM, Eugeniy Paltsev wrote:
> In case of DSP extension presence in HW some instructions
> (related to integer multiply, multiply-accumulate, and divide
> operation) executes on this DSP execution unit. So their
> execution will depend on dsp configuration register (DSP_CTRL)
>
> As we want these instructions to execute the same way regardless
> of DSP presence we need to set DSP_CTRL properly. However this
> register can be modified bu any usersace app therefore any
> usersace may break kernel execution.
>
> Fix that by configure DSP_CTRL in CPU early code and in IRQs
> entries.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  arch/arc/Kconfig                   | 25 ++++++++++++++++-
>  arch/arc/include/asm/arcregs.h     | 12 ++++++++
>  arch/arc/include/asm/dsp-impl.h    | 45 ++++++++++++++++++++++++++++++
>  arch/arc/include/asm/entry-arcv2.h |  3 ++
>  arch/arc/kernel/head.S             |  4 +++
>  arch/arc/kernel/setup.c            |  4 +++
>  6 files changed, 92 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arc/include/asm/dsp-impl.h
>
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index 8383155c8c82..b9cd7ce3f878 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -404,13 +404,36 @@ config ARC_HAS_DIV_REM
>  	default y
>  
>  config ARC_HAS_ACCL_REGS
> -	bool "Reg Pair ACCL:ACCH (FPU and/or MPY > 6)"
> +	bool "Reg Pair ACCL:ACCH (FPU and/or MPY > 6 and/or DSP)"
>  	default y
>  	help
>  	  Depending on the configuration, CPU can contain accumulator reg-pair
>  	  (also referred to as r58:r59). These can also be used by gcc as GPR so
>  	  kernel needs to save/restore per process
>  
> +choice
> +	prompt "DSP support"
> +	default ARC_NO_DSP
> +	help
> +	  Depending on the configuration, CPU can contain DSP registers
> +	  (ACC0_GLO, ACC0_GHI, DSP_BFLY0, DSP_CTRL, DSP_FFT_CTRL).
> +	  Bellow is options describing how to handle these registers in
> +	  interrupt entry / exit and in context switch.
> +
> +config ARC_NO_DSP

Can this be called ARC_DSP_NONE for better intuitive regex searches !

> +	bool "No DSP extension presence in HW"
> +	help
> +	  No DSP extension presence in HW
> +
> +config ARC_DSP_KERNEL
> +	bool "DSP extension in HW, no support for userspace"
> +	select ARC_HAS_ACCL_REGS
> +	help
> +	  DSP extension presence in HW, no support for DSP-enabled userspace
> +	  applications. We don't save / restore DSP registers and only do
> +	  some minimal preparations so userspace won't be able to break kernel
> +endchoice
> +
>  config ARC_IRQ_NO_AUTOSAVE
>  	bool "Disable hardware autosave regfile on interrupts"
>  	default n
> diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
> index 5134f0baf33c..0004b1e9b325 100644
> --- a/arch/arc/include/asm/arcregs.h
> +++ b/arch/arc/include/asm/arcregs.h
> @@ -116,6 +116,18 @@
>  #define ARC_AUX_DPFP_2H         0x304
>  #define ARC_AUX_DPFP_STAT       0x305
>  
> +/*
> + * DSP-related registers
> + */
> +#define ARC_AUX_DSP_BUILD	0x7A
> +#define ARC_AUX_ACC0_LO		0x580
> +#define ARC_AUX_ACC0_GLO	0x581
> +#define ARC_AUX_ACC0_HI		0x582
> +#define ARC_AUX_ACC0_GHI	0x583
> +#define ARC_AUX_DSP_BFLY0	0x598
> +#define ARC_AUX_DSP_CTRL	0x59F
> +#define ARC_AUX_DSP_FFT_CTRL	0x59E
> +
>  #ifndef __ASSEMBLY__
>  
>  #include <soc/arc/aux.h>
> diff --git a/arch/arc/include/asm/dsp-impl.h b/arch/arc/include/asm/dsp-impl.h
> new file mode 100644
> index 000000000000..788093cbe689
> --- /dev/null
> +++ b/arch/arc/include/asm/dsp-impl.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2020 Synopsys, Inc. (www.synopsys.com)
> + *
> + * Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> + */
> +#ifndef __ASM_ARC_DSP_IMPL_H
> +#define __ASM_ARC_DSP_IMPL_H
> +
> +#define DSP_CTRL_DISABLED_ALL		0
> +
> +#ifdef __ASSEMBLY__
> +
> +/* clobbers r5 register */
> +.macro DSP_EARLY_INIT
> +	lr	r5, [ARC_AUX_DSP_BUILD]
> +	bmsk	r5, r5, 7
> +	breq    r5, 0, 1f
> +	mov	r5, DSP_CTRL_DISABLED_ALL
> +	sr	r5, [ARC_AUX_DSP_CTRL]
> +1:
> +.endm
> +
> +/* clobbers r58, r59 registers pair */
> +.macro DSP_SAVE_REGFILE_IRQ
> +#if defined(CONFIG_ARC_DSP_KERNEL)
> +	/* Drop any changes to DSP_CTRL made by userspace so userspace won't be
> +	 * able to break kernel */
> +	mov	r58, DSP_CTRL_DISABLED_ALL
> +	sr	r58, [ARC_AUX_DSP_CTRL]

In low level entry code, we typically use r10/r11 for scratch purposes, can u use
r10 here for consistency !

> +#endif /* ARC_DSP_KERNEL */
> +.endm
> +
> +#else /* __ASEMBLY__ */
> +
> +static inline bool dsp_exist(void)
> +{
> +	struct bcr_generic bcr;
> +
> +	READ_BCR(ARC_AUX_DSP_BUILD, bcr);
> +	return !!bcr.ver;

open code these use once / one liners in the call site itself.

> +}
> +
> +#endif /* __ASEMBLY__ */
> +#endif /* __ASM_ARC_DSP_IMPL_H */
> diff --git a/arch/arc/include/asm/entry-arcv2.h b/arch/arc/include/asm/entry-arcv2.h
> index 0b8b63d0bec1..e3f8bd3e2eba 100644
> --- a/arch/arc/include/asm/entry-arcv2.h
> +++ b/arch/arc/include/asm/entry-arcv2.h
> @@ -4,6 +4,7 @@
>  #define __ASM_ARC_ENTRY_ARCV2_H
>  
>  #include <asm/asm-offsets.h>
> +#include <asm/dsp-impl.h>
>  #include <asm/irqflags-arcv2.h>
>  #include <asm/thread_info.h>	/* For THREAD_SIZE */
>  
> @@ -165,6 +166,8 @@
>  	ST2	r58, r59, PT_r58
>  #endif
>  
> +	/* clobbers r58, r59 registers pair, so must be after r58, r59 save */
> +	DSP_SAVE_REGFILE_IRQ
>  .endm
>  
>  /*------------------------------------------------------------------------*/
> diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
> index 6f41265f6250..6eb23f1545ee 100644
> --- a/arch/arc/kernel/head.S
> +++ b/arch/arc/kernel/head.S
> @@ -14,6 +14,7 @@
>  #include <asm/entry.h>
>  #include <asm/arcregs.h>
>  #include <asm/cache.h>
> +#include <asm/dsp-impl.h>
>  #include <asm/irqflags.h>
>  
>  .macro CPU_EARLY_SETUP
> @@ -59,6 +60,9 @@
>  #endif
>  	kflag	r5
>  #endif
> +	; Config DSP_CTRL properly, so kernel may use integer multiply,
> +	; multiply-accumulate, and divide operations



> +	DSP_EARLY_INIT
>  .endm
>  
>  	.section .init.text, "ax",@progbits
> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> index edb55b6ee278..b3995dd673d9 100644
> --- a/arch/arc/kernel/setup.c
> +++ b/arch/arc/kernel/setup.c
> @@ -26,6 +26,7 @@
>  #include <asm/unwind.h>
>  #include <asm/mach_desc.h>
>  #include <asm/smp.h>
> +#include <asm/dsp-impl.h>
>  
>  #define FIX_PTR(x)  __asm__ __volatile__(";" : "+r"(x))
>  
> @@ -444,6 +445,9 @@ static void arc_chk_core_config(void)
>  		/* Accumulator Low:High pair (r58:59) present if DSP MPY or FPU */
>  		present = cpu->extn_mpy.dsp | cpu->extn.fpu_sp | cpu->extn.fpu_dp;
>  		CHK_OPT_STRICT(CONFIG_ARC_HAS_ACCL_REGS, present);
> +
> +		present = dsp_exist();

Open code as suggested above.

> +		CHK_OPT_STRICT(CONFIG_ARC_DSP_KERNEL, present);
>  	}
>  }
>  

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
