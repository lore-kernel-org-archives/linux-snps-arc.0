Return-Path: <SRS0=vrW9=4Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C4EC10DCE
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:12:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B709206D7
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:12:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hHPjMicT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="J41KuqeB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="n0p5D++x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B709206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+rByYAa478XOg5an9sVqFw2j3WCuCVBBSzVzxM+w1w=; b=hHPjMicTFbaH6g
	v+kFXhNnEn8V4ASlC//lW1DTB9JgQseWAbRW5hyEqvhkFWv+DFKw7ZINopCVVv8JzVipNkZ2l3pjX
	fue8AeSE7QyQRKTR7l7rl3RxSCQllW77vEWA9pprC7LXIHl5blDAF4MX3aivPyPL2OYWmEwuBLH6F
	5FHtear5hnolylgreOt75ex91joNzf4/OjoKG4wcwa/j4H94SxeoTg0521gcDQiaOmz6eKXptFLdM
	9YJn3EQM4kK8JWJRoC+zL8OS9OetU2JbchLgilHlznErSxhqWyPQmlqKyQcLHxA1fojPef1pTh8bP
	weuFEpaFCvGpCLO9g1pQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAN5M-0004YK-Lc; Sat, 07 Mar 2020 00:12:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAN5J-0004XX-RS
 for linux-snps-arc@lists.infradead.org; Sat, 07 Mar 2020 00:12:55 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C121240363;
 Sat,  7 Mar 2020 00:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583539972; bh=K4DjTge5fKCxSjOxFd3X4QASyztdWM8e67ep58p2s4s=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=J41KuqeBS/4v3uPQ/lq3GNQbgkbfF+32ysGOYcQALRjg+oiWWqsunbSFpllKFVhSu
 IOLY+R4S6fpV4GGuXWaRE/fyxNF2upVSVTEdX+RzxZfXKb9sULJMnl0ru+0Cd2Ey8b
 JcWD+bHa7oRwbKTEOypHDZJK7b12Egv/p4QDZWEL7XLoy6B2bFBwcmXW+5TnVmTlIh
 zRYw92HIdVTA7aMr13cq4RY1zw4RotsJN/vEozoHYlVkY95gRUNLlEtXDqTRzqCPJ1
 HBZiAaY7XcEBzVbLMIfmrIU4z91Bsm9y6wPmJWZoeCGCyJuQv+1VmQZbK7fv6v7wu8
 u1KCSpI1SfWOQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7B46EA0069;
 Sat,  7 Mar 2020 00:12:52 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 6 Mar 2020 16:12:36 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 6 Mar 2020 16:12:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1JbrxIJx/iVniy+3G7usCPmIMbMggnp0J3r53523MIS7bMaaA/7Onju+tSc06FK655LK7UZ1aUdzaTRQL+3jrHXF4t9bQtMRO15GZNzybJ4tEGbTmR5mmjT6Ae67kLMUj84CNyRpcHfc0WLSk+L0T1UBob4ONsxHaoDZH/PKc7YWB9CfDnNqCi3NPJsw6YNMIZZmYh2vAK6mFAdpxtMjqWmiEO6pj81yqaWBIycHk7ErjU3oNMhAKZqcf2ikuWQ73K7MWDibGYPBSow1rmTOLJ2TM4YNapM4ARIm1jKuuQGacaZTWLRkOMbHLHhscfS2TTAO4dpB+TDRZJgmu/CCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4DjTge5fKCxSjOxFd3X4QASyztdWM8e67ep58p2s4s=;
 b=aykENi3XS6OQUcLTIdJgygtTjaO9iuS1MPD2rcTGU9/wBhvj7kuvAb2MMw46P3eL9cO+X40bbJsHfjjfZAK3WQAoZLa5d0Zb7f6UE1G7/2KF0VCPskkpIYaMmufYf42V4zcV3rWT7YOf0z6o/41Cr4V6HpAVETKJUWK5uXj/hWi2OQP5GsA2VlQnabtR6dkNYDhCzYC9nzUM9gW6hkCCLEQiUpzPzrVwN1pNNA1ZIO1uVlftnXVa/1+0ReezUg5dixue5lrrPLp6hVLIeqq/E3RfIp+Z/Xtuo1Yt9Wu8OzQzcqtwIrACDXMEs3FcJ3LGszkzDy3bF7hQ/3twlGIfsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4DjTge5fKCxSjOxFd3X4QASyztdWM8e67ep58p2s4s=;
 b=n0p5D++xNXmtGTbOJrSzJH4M8uhGg+OBJpE7CJCnywHtIyrEKZiyHC9PoYiZymO9KpN2/uv4+nHxq2uwFydTY1dFbtRRK2V5SUtmkPIeLHsIC/o96j/CwFBPdhBLTqm+Chi8A7q2fx15S+YP2Beu8h/hup8xo0OjR0p4q1jH1RM=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3029.namprd12.prod.outlook.com (2603:10b6:a03:ab::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Sat, 7 Mar
 2020 00:12:35 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Sat, 7 Mar 2020
 00:12:35 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH v2 2/4] ARC: handle DSP presence in HW
Thread-Topic: [PATCH v2 2/4] ARC: handle DSP presence in HW
Thread-Index: AQHV8yku7EOtW/wWqUKB6P65LyNDjag8Q9+A
Date: Sat, 7 Mar 2020 00:12:35 +0000
Message-ID: <2d11b6d9-a37a-8cc3-1feb-a9dbc345de12@synopsys.com>
References: <20200305200252.14278-1-Eugeniy.Paltsev@synopsys.com>
 <20200305200252.14278-3-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20200305200252.14278-3-Eugeniy.Paltsev@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 5892b2d6-efc4-494d-20f5-08d7c22c3d0c
x-ms-traffictypediagnostic: BYAPR12MB3029:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB30294B12F6E5782F4F7BAAE8B6E00@BYAPR12MB3029.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 03355EE97E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(346002)(366004)(136003)(396003)(199004)(189003)(6506007)(53546011)(86362001)(8936002)(81166006)(81156014)(8676002)(66556008)(66946007)(66476007)(31696002)(76116006)(2616005)(64756008)(66446008)(26005)(186003)(6486002)(5660300002)(6512007)(4326008)(2906002)(31686004)(54906003)(478600001)(36756003)(316002)(71200400001)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3029;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oMXLEFkedWIOjclkss9PqMOghuCtVKsnOsy+9p2d5XDkEAeJ1Oaga6OQ9d0ZIbN+MgG1nlLoMC+B6h0jPgttLdyhpSvFx/i5yxG/mKEy9AzbrJioxDbxzvRblLnWTd3G4XyXWZuoZkRXku7dwqRyKmGlQ1+VxreJWkrCUAgqS63Op4KTuy7Ukv4irtxbbQo7+1pey8fgSt6dI+uJUW7FV2wUXDR1r2it95uZJ53SVPn+CIoS3qT/m7cbPAaRlBxm9AiwQspeUh2tv33QxthcYfw2UmVDB0WchUr6xwkf4rrpAG2G9VpXiIc/lGdmcbEVHUFHdMEKoks2moD1Y1YSv9TAI2MDxdeu/UE98pCzF9d1fVf3tN1LcwAVNB/F8ZmN7pQSYyN0woato50PKLzyfS1n20FVnEU2EgbnRIbE1RBNekoSiuNDy6LLpEGLOF9x
x-ms-exchange-antispam-messagedata: 41P5w+HE/q7Wd8HSlqTThGeLu8SARcrv4pvs8J6uGehAsr58ZRIKmsbbHCSyl+GQH7bzPuk6L76oWnZBLD3J6Lh1qtuMxNWOH5BGld+2d23ca99q/D0lLlFQIT46Tz90s4Axdc7tF9j0/LpwUDitYg==
Content-ID: <A9A7859ED4C2534C882847321EC6AE35@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5892b2d6-efc4-494d-20f5-08d7c22c3d0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2020 00:12:35.3030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XhX7cCGaTYO8C1NOa+eFNdDiGCen2SzLfCtaDAEqt0+l2W4TuUAa2hRzL8ahufw29f5htDFJeCgqQH2fnU2wzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3029
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_161253_957079_420F61A0 
X-CRM114-Status: GOOD (  18.15  )
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/5/20 12:02 PM, Eugeniy Paltsev wrote:
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

How about below ....

"When DSP extensions are present, some of the regular integer instructions such as
DIV, MACD etc are executed in the DSP unit with semantics alterable by flags in
DSP_CTRL aux register. This register is writable by userspace and thus can
potentially affect corresponding instructions in kernel code, intentionally or
otherwise. So safegaurd kernel by effectively disabling DSP_CTRL upon bootup and
every entry to kernel.

Do note that for this config we simply zero out the DSP_CTRL reg assuming
userspace doesn't really care about DSP. The next patch caters to the DSP aware
userspace which this actually saved/restored upon kernel entry."



> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  arch/arc/Kconfig                   | 29 +++++++++++++++-
>  arch/arc/include/asm/arcregs.h     | 12 +++++++
>  arch/arc/include/asm/dsp-impl.h    | 54 ++++++++++++++++++++++++++++++
>  arch/arc/include/asm/entry-arcv2.h |  3 ++
>  arch/arc/kernel/head.S             |  4 +++
>  arch/arc/kernel/setup.c            |  3 ++
>  6 files changed, 104 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arc/include/asm/dsp-impl.h
> 
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index 7124ab82dfa3..55432a8fc20d 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -401,13 +401,40 @@ config ARC_HAS_DIV_REM
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
> +config ARC_DSP_HANDLED
> +	def_bool n
> +
> +choice
> +	prompt "DSP support"
> +	default ARC_DSP_NONE
> +	help
> +	  Depending on the configuration, CPU can contain DSP registers
> +	  (ACC0_GLO, ACC0_GHI, DSP_BFLY0, DSP_CTRL, DSP_FFT_CTRL).
> +	  Bellow is options describing how to handle these registers in

typo: Below

Looks good otherwise. No need to respin just for this.

Reviewed-by: Vineet Gupta <vgupta@synopsys.com>
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
