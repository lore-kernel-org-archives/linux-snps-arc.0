Return-Path: <SRS0=FD3D=6L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD36C82A41
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Apr 2020 22:13:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED21120661
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Apr 2020 22:13:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oX0EQ4Fu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IKAw8qt5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="c4sL2Ti/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED21120661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzmzvUmEp2ehq+/QpuxZcMoT37qGTjOkB56SZC9URF8=; b=oX0EQ4Fuwu4RHG
	y6pTx+2KlykTZLKKLGA9z6XaJk7bWY57iG9XSCnH2qawd4OnfQk9YKdjHAk2c+lI3+jGAT3GCwais
	NDRpDBjLuWlXMjviFfyamLUpO+Ffoy4R298KsRCGwn+4C0nlr0IWafLWTYgqfMlFd2cShipIyqz5Z
	lVJfrhLcqMYsI0Pvpy3ergtsEExOVqQNZmwpo6EZU7U+vER7W98jkp9+FVaPYd0yiZtVJ3xXFKjR2
	mkNnp5aGNau6//xar0J9CLW39sNL3UhCrbs7yy1XoWV6SU5uJdZcEbf5Tj7sCEUNIxEiH9xcfvQgn
	6Bq77iRzRqs98xwrEyrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTC0W-00009P-26; Mon, 27 Apr 2020 22:13:44 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTC0T-00008F-Os
 for linux-snps-arc@lists.infradead.org; Mon, 27 Apr 2020 22:13:43 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 383D5C0350;
 Mon, 27 Apr 2020 22:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1588025618; bh=feMbBUwyOuKo/R2D8Xa/AWD3IFNuUVkGmEhxoO9dNeA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=IKAw8qt5YNo2F6hmewgjZ5gJVfMexA7EtdJsU5z9bw7nhNUiuiosoEIyi+LAOidn6
 eoODAHI4D4eEsM5X+irD5gGC13crGdn5GwRkcgOlNNcpFQNfPEs3VNKAcXB4P+wxc+
 aQNJKmM7TH88q+uoXpGN0QbnQ6SPr6RANZPpytv3Z+FJY8vwHEP7jx+vAESqBJ9qhn
 Ib/cNqaOp6NOXYZ1Q8KRnEKwc0w3W7gUZBHjtIX8thR5iHr8Zsg98Y6sTxXsIJJtbx
 23eSHx8ssOUflfe63OegEHmmbx20VY5/B8xdl8InTXMlqJyIJl1FTLaDBNsiT3YdO0
 hY4z1ekjKNpPA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5AD58A0067;
 Mon, 27 Apr 2020 22:13:33 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 27 Apr 2020 15:13:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Mon, 27 Apr 2020 15:13:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPfUM5CBPxDXtVStWAAGxLEWlQzlCivpZnaUIYUC2mJwHpbuHzTSP7K5y5L6Dss7fGVUC/Yvl29i4idCWOao0b0dObRXqyO++QqnfWUuP9A2O7CUSMyqtlUm7opUETX6cvq0/wV2SvPa+bXxiZ74XFgRl9+leQ96FsI+2qTx/o3ex3hXfq58YMhwvzYKW/+OPOAtdUnFqE9niisYLqyKIrijVace55/g1W6uTQ62FqAy5ybanfqnEqLbMmtW5Sh0klJyv4P8Do4xLq8fv9XIbIbXzSGrCPdJrwYkXUtg8kYWAc/pvI5qbXdMy7lp+zM1DKBK83itPXJMdLiiIGLUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feMbBUwyOuKo/R2D8Xa/AWD3IFNuUVkGmEhxoO9dNeA=;
 b=a6OUY0FaxgTO4vhN+uepitOlvycrKsLXvir3bRyDXt8ce5gBQVhvnwQUxr1eCJA20qKKzv9uoRvbi4OylFSNrEcJK+fPZiINd9o8scl0XleUwUyLN8O7OB8vJ2J3g1GQ/f713oI3tvSiTI+0ReFzJYp7x8U8OSJ88W+kuS8LI3BrdnSH/GB6NNgRxPfUdoZdJsMdZL21eGWv16KAxbVb6pbwaNmgG6NEEcYH+lMEFHwjzrmtXMeNnqOU2TbB4nlvCi9O1qG5zhAY4COwnr0hThtFL+HtyC6hh4p9jwqpm2w/44GZW5XZVeoC9S4w+U5z5aO9g2Df5eL2Q4Np4ehTIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feMbBUwyOuKo/R2D8Xa/AWD3IFNuUVkGmEhxoO9dNeA=;
 b=c4sL2Ti/Hrrec21JIK/aoCf98Ys1ms3zlKwbpQY/ifjwIHDOHKBRFzhSzV6qPum3ksuyCWly3nM9iRzQ4QYptajLT/oyOiv4dAPyR/Him5egCwNM3R/554kpmtAd+VR9bZIsKXu59yaA/hBqc/yy+3DxKUUm5Psav0xYTN/pcwA=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3640.namprd12.prod.outlook.com (2603:10b6:a03:aa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Mon, 27 Apr
 2020 22:13:32 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2937.023; Mon, 27 Apr 2020
 22:13:32 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH] semaphore: consolidate arch headers into a generic one
Thread-Topic: [PATCH] semaphore: consolidate arch headers into a generic one
Thread-Index: AQHWHN86ZIIk/t9jLEuG1kf02EfpF6iNiGyA
Date: Mon, 27 Apr 2020 22:13:32 +0000
Message-ID: <51c925b3-0f4f-7d5d-f170-6f0b0ae3906f@synopsys.com>
References: <03f4a9b3-b1ca-90fa-0b6a-609a3135267d@linaro.org>
 <20200427215938.14136-1-vgupta@synopsys.com>
In-Reply-To: <20200427215938.14136-1-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [24.7.46.224]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8131075f-de32-4ae5-9bcf-08d7eaf838fa
x-ms-traffictypediagnostic: BYAPR12MB3640:
x-microsoft-antispam-prvs: <BYAPR12MB3640E732160E075CCC49FBD6B6AF0@BYAPR12MB3640.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0386B406AA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(366004)(376002)(346002)(136003)(396003)(66556008)(66446008)(64756008)(66476007)(8936002)(6486002)(6506007)(6916009)(76116006)(53546011)(186003)(66946007)(31686004)(26005)(81156014)(8676002)(31696002)(2616005)(2906002)(4326008)(86362001)(316002)(6512007)(36756003)(478600001)(71200400001)(5660300002)(41533002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3L+ICcNeeiVuWkCOvEqNAIVIdjGGVmpoEnkfQ1uQJ1DOpsDz1naAslbTG5XY9PfUVVGr3CwwUal54c6wdgi4LazYPpug2vbQtjVHi7zxPhXgLdBRRKvqakVn67Ct1gswYm4SyZVQQMuWtbeDnBFWPF6PwsT+bHhbpn1b+hwicw54yQo/0711PPMCO/z9RjFW34/zsmCd5YTSoiogAeBTmfsRIU8yu77rAZW8pIuLKJgGRfmZ+u8d/GEVGKYl96M/8TrR0EgoqTZaPO9vS4aKwn1+mafjWSuQgyafsjLZbe9XuFXFGqatYr9yjPdGUwtXXB20jz/yrTfRpgJ0/0dnaGGzs8/5VLdkQ1QN7keTz9SwORFQUUv9XN8eNzr7TX7eRCHSYpLf9lxg1bCQYMXDx3iRgYsGB+IXadx8McEAbwHCSw8yMLNPqYYultKAxGzQz5htuXlCqMGCUGop+IieXwu2bXRA+ftrhiJZDLTLnyI=
x-ms-exchange-antispam-messagedata: FcqoAI04DZU3ZgeoIPXXaePTZIT/RlERbwK2SVwNJKKtNSWu1b5Y+ElCm79sFH9ma1VMnaagNnGdS+T02xUodiAEs/YDKRBG4iPZWkXMGMZ3UYDCDMou2lRE3vNVHlruSyb64hF6wNHkEiuZidh3nVLv2tuUkHO1g9Yr4KGrP1K1u6I/DeckQRw/M/tvroZgoe/NMukIS1p5bRX4c0ZaBQEzu0bqQ1Hykuv0+d9B4DR/qu2O1CKZTsrJrLa3DNEVeeRCfZ82cHur7p1O/DjoPfMnVUNtqBgSktm1LgnVygP3WC1y90H48lqKzXA1wiVGkW7Pg+ELdgC+KXE6hOAMFpyOx7cpkJtZJKLCtRbAEn0OSueqCsGvEQ99mkR3dz/j5Mr54gtsKpWgB9kjve9QZs5s3M5HXlR4dA1LvFDJltUv5wPPJxEK0SQrlZO8dUdjjrpYW7EL/jyj5+COqZr6Cu+uX3R653t/2K7qIWtpb4AMhcgKltacb2vW3tFRdfHEsmFEva0oe5yDROfQaC0FCcm45Cm8H6V99KkEOQRUCILSF6z7gnFT3q5wzPJ+C788muge5jhOSLEBvK/YTJJ0UzrnKqUyUYh1y+NX4oQgWs2R8YTobkrwcti+ZMZbryiBn/Dg5yLKV2WbjZzSf7QaodjGCCrYItbH5mtMBrTDvcFMhQHl99Zn7F9UjbRK/dQiRuImtW4XnuJmTSVPDobHJWPu/apXTp8W3j/52XXHtYe0CU1O613YS1cIjBbYp69nVuDSDIA7FhjUvToWFdW+ldn5ApBEU8aPD9O0FMMmVhY=
x-ms-exchange-transport-forked: True
Content-ID: <4931B53751EC8248B71417C414998893@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8131075f-de32-4ae5-9bcf-08d7eaf838fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2020 22:13:32.4002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SAzgvrBUmtaSYGPHsPP9LlzC2dMs8u2TzxM1yyk2p/CbzmXUpCGYTFp/8XI5V0Q9qZC6vYWUQwh3FIacJadozw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3640
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_151341_952621_6461E235 
X-CRM114-Status: GOOD (  11.96  )
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

On 4/27/20 2:59 PM, Vineet Gupta via Libc-alpha wrote:
> This consolidates the copy-pasted arch specific semaphore header into
> single version (based on s390) which suffices 32-bit and and 64-bit
> arch/ABI based on the canonical WORDSIZE.
> 
> For now I've left out arches which use alternate defines to choose for
> 32 vs 64-bit builds (aarch64, mips) which in theory can also use the same
> header.
> 
> Passes build-many for
>   aarch64-linux-gnu arm-linux-gnueabi arm-linux-gnueabihf
>   riscv64-linux-gnu-rv64imac-lp64 riscv64-linux-gnu-rv64imafdc-lp64
>   x86_64-linux-gnu microblaze-linux-gnu nios2-linux-gnu
> 
> Suggested-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> ---
>  sysdeps/arm/nptl/bits/semaphore.h             | 34 ----------------
>  sysdeps/csky/nptl/bits/semaphore.h            | 35 ----------------
>  sysdeps/hppa/nptl/bits/semaphore.h            | 31 --------------
>  sysdeps/ia64/nptl/bits/semaphore.h            | 35 ----------------
>  sysdeps/microblaze/nptl/bits/semaphore.h      | 32 ---------------
>  sysdeps/nios2/nptl/bits/semaphore.h           | 32 ---------------
>  sysdeps/riscv/nptl/bits/semaphore.h           | 33 ---------------
>  sysdeps/sh/nptl/bits/semaphore.h              | 35 ----------------
>  sysdeps/sparc/nptl/bits/semaphore.h           | 40 -------------------
>  .../unix/sysv/linux/alpha/bits/semaphore.h    | 33 ---------------
>  .../nptl => unix/sysv/linux}/bits/semaphore.h |  0
>  .../unix/sysv/linux/powerpc/bits/semaphore.h  | 40 -------------------
>  sysdeps/x86/bits/semaphore.h                  | 40 -------------------
>  13 files changed, 420 deletions(-)
>  delete mode 100644 sysdeps/arm/nptl/bits/semaphore.h
>  delete mode 100644 sysdeps/csky/nptl/bits/semaphore.h
>  delete mode 100644 sysdeps/hppa/nptl/bits/semaphore.h
>  delete mode 100644 sysdeps/ia64/nptl/bits/semaphore.h
>  delete mode 100644 sysdeps/microblaze/nptl/bits/semaphore.h
>  delete mode 100644 sysdeps/nios2/nptl/bits/semaphore.h
>  delete mode 100644 sysdeps/riscv/nptl/bits/semaphore.h
>  delete mode 100644 sysdeps/sh/nptl/bits/semaphore.h
>  delete mode 100644 sysdeps/sparc/nptl/bits/semaphore.h
>  delete mode 100644 sysdeps/unix/sysv/linux/alpha/bits/semaphore.h
>  rename sysdeps/{s390/nptl => unix/sysv/linux}/bits/semaphore.h (100%)
>  delete mode 100644 sysdeps/unix/sysv/linux/powerpc/bits/semaphore.h
>  delete mode 100644 sysdeps/x86/bits/semaphore.h

I just noticed that this also needs an entry in sysdep_headers in
sysdeps/unix/sysv/linux/Makefile

but the build still works for such arches ?
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
