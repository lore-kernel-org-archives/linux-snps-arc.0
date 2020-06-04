Return-Path: <SRS0=KRsc=7R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBEEDC433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 18:27:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4FA0206A2
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 18:27:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nsiG78Ev";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IKr0BFbI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ant75qQa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4FA0206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHSgpz4HfeI4ErowAvKHkRb47/QLIuWyF2mILb+Sg4Q=; b=nsiG78EvAb/wCR
	SC7atHQZymI2cfk+lDk2VUGmU/26Xgefx5w05e+HNOHKEgfgX2WkkTjd+miWfPQkL73hs3OgvSjoM
	9jarCiTb459fvwfTyo5keajew1C6ePVWiN3n2/pIBBq9H93ySzLYZLJWIsBPVcFktTpz80d+HVuKE
	8Je9LUF486Y7xq+2LhA6gN1u1ZQTqWDtbSG9Q2XRxQpsAkd+drnpGYPIiyvB+0G0Gomp2T24UlSny
	U1QowxUD2h7u2RlKZRuFRUCpN1hhtDnjA7xoFQUG1iOpg0J2cl6IfThHgW9rRaZc21hGfURUJW6VC
	IU5twh1fbCmP4XSwwPGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jguab-00071j-FR; Thu, 04 Jun 2020 18:27:41 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jguaY-00071I-Uw
 for linux-snps-arc@lists.infradead.org; Thu, 04 Jun 2020 18:27:40 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 98884400DA;
 Thu,  4 Jun 2020 18:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591295256; bh=QNEPunEl+WDnQNwbHGib6+7CUT29mbNjGTFyn5YUx7o=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=IKr0BFbIQN+wjZvz4Bvi34YpOkL+N21q+cDKpbqBEdlGactSVWTiD809Y3BCqm5UE
 97l28fqZYStzQCqKyW+j1u7Rgvv3pm7X+gk8WMaHHAqnJhdp0CWxLprV3HcyaEQQ0n
 vT5NGSb81q5gtRwhEGRuwMgz1DpIdrFtbYMaAZIqNqLDlzg7a9fx56008BIYLxcrmj
 zom8rReVJdUbHvEB5tZ/UBJPpGuzK9E5TDKGNQFqYjYN+NmAWcisQy9ihrWD3TPNHt
 Du+t8bAIphIXCeOqGwO5yufylJ4NOb1aGIYCUxAwNmwO7ok17rhOEDbllcGmRBmAtO
 SHVzzwAb50WMQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4BB48A0071;
 Thu,  4 Jun 2020 18:27:36 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 4 Jun 2020 11:27:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 4 Jun 2020 11:27:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZ2+81Utw0mZePRrE7fPrmPWWMa4FPYuW0FP2ODxoDBwIBczH61gZhu3J0KKaTNOJS+uVrNr0gj2suv7epk2zXPsmCBXvVc0PF6Nxs+wYAif537cR73jvN6jkpBjpoPHem/QgZ9wCUhlBX0oz2jsUrF3LvuCuhV/HhU1cDUemMoOvM8PrW1rZ8VcamDOdeGdo6x0t8Aey4mzZb3wvyww3JHWxeY/LyYYx1PmpXokOf07B9ytzxn22t2w3E/cHWo8keP7W9/ligeq9BuIFzVO5qJKaixHmjA4fiCOT7C9b5Hd35IxIhOfNY9Ucz0+Q3f5bWxTzc16OOHCPLAYkU6BCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNEPunEl+WDnQNwbHGib6+7CUT29mbNjGTFyn5YUx7o=;
 b=C2vwcu805hA+tsYyJITTmT9fpzx6Z1PMTK3a6fx20xoEz+R8FCong7lwNPhsyO0hIIrOz2UHBBnIAb2igG069YJvihqKk3Ydjd4XtFudt6coRIWhNXvQ9zywCJ3gyj01cUyIUQ3W1Ko1sEc0hX7us9kej7lUsGI/SI4fC2L8GxlA+Pwk6295NKEgQ/OEiFKet3sQZHmmMmII/7SnSuGF+Mq/Sp8uOd8XsRLcCNTFa3DQoxbq6gJJDFnZld2Vw6xFCUMw7rc/VRVdt15Gt6GYjigVKF8HUwKBqIt/6CNB/+JQGqDc3j+CmlTu0TXyYf107lM6Cb8ZRHfGXgJudQxxZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNEPunEl+WDnQNwbHGib6+7CUT29mbNjGTFyn5YUx7o=;
 b=Ant75qQaynSPl9xP0q6PplWDKJR4vLRy58p+pKKOqSi3YV5ISI0NSEV422o0EoJ2IX7SnMUNpYC34xI2l4DOutqSjINABt8dNySSrTNugDM8usms4yODGdKytO7aY50o7TlHMFJzmFsg9KCbXowrxm3uH7nt+f3IQdIw2oHTNqM=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3464.namprd12.prod.outlook.com (2603:10b6:a03:d9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Thu, 4 Jun
 2020 18:27:34 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Thu, 4 Jun 2020
 18:27:34 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH v2 1/4] ARC: allow to override default mcpu compiler flag
Thread-Topic: [PATCH v2 1/4] ARC: allow to override default mcpu compiler flag
Thread-Index: AQHWOpc7/dFMmbTnfUuNOuuCbmnhSajIxnGA
Date: Thu, 4 Jun 2020 18:27:34 +0000
Message-ID: <50cb0c1f-a6df-1edb-af8c-7eb7c738493e@synopsys.com>
References: <20200604173927.23127-1-Eugeniy.Paltsev@synopsys.com>
 <20200604173927.23127-2-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20200604173927.23127-2-Eugeniy.Paltsev@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b82a415-9e25-4250-78b9-08d808b4f363
x-ms-traffictypediagnostic: BYAPR12MB3464:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB346411878951965D02B367ECB6890@BYAPR12MB3464.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GpYrjENn0u9W+qO81mvRT1miGFO4ltU4yJziXhTIA3n/AuqtRd+VeKr/dqXaYmqgKm5uNLxnhk/C2SP05qh3eY/66Yd57ww2lkTcux2j3PdxU73efV9XwQq+uLsiPvQvLFqWzjHSWfifRvXC198ZH6RIcUj5OmYmaeSGft2TJ3YTcs/UMFSE4YyiQ1ddeOpkad1xQ1t4FLBScIc6qBI6kw9csDu051j/RNVr9Fs5XuUGGVAg1nSB/ZLBQ69wu7cdBS3Wcq5XH8HIcozsPSUrstciUOANPRG8xDUdfOOKtANi4gXVO5a/NBqqDAN5NIFbJYCCXS9N1YGMagANadoTC9aBxei+HPCnh6vJvdQ84sUICxf31VmmFZJjjhPgPWQatf0AyFQBDjYPz6yoTymeDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(39860400002)(366004)(396003)(136003)(110136005)(54906003)(316002)(6512007)(6506007)(53546011)(83380400001)(6486002)(2616005)(86362001)(66556008)(478600001)(4326008)(71200400001)(31696002)(31686004)(36756003)(66446008)(8676002)(66476007)(186003)(2906002)(66946007)(64756008)(76116006)(5660300002)(8936002)(21314003)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: x8glcJX/YPIoYlT8wDPCkgcqbw7rsmAnSZ7nFOB5T9PIxjCabdqcrqdTZcL/KqXg6PWCG6SMUSqo+vZP1BzYdCxhLwmb6dWeHOdOglbqFsTV0qWBeWmQoN/F1WckriVJ04EOmN2uMhRIcYjWp5MtXfA4FZygjA4eG/c/fMGBC/turTGeSeH7+Dy4hbgZLgWNuVrYJv5PaqNurCuIOJGVQ5VwNwyNKUDtQx8pNVtWxfEY+5EjQyXns9b4tRMR9aZXJJGiBq/tw9Uts90Hjn0noXO2HbYyWcmYGe6Ws3XFXnRX3R1vEnUNN+j+5QQICmTa5T8SluI4at4A63gXOhkvxhs1DQCuEZWNKd8kKicqLF1Lst6LPyYOL9UUXfJWM69dMNcD2yJDYLcpnvH4yrmb0NtJIRNo1uwr1jXm79wQus3plkhfAJVySP694RQSK21yDCi0RyjW4B/USbA2LWLsaXIF6e66t37kMYF4MTbj2H3OFqhxW9J3O/vZm5Yoe7gtEWoigNnmbLSzPb0ccahxVfQADw/TpDMQmgja7Wqle+HrLKWUGIgMUZ4jAnJpHIQd
Content-ID: <0939EA13FBE4B545895064B6D0A8FD07@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b82a415-9e25-4250-78b9-08d808b4f363
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 18:27:34.1953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7BnBIqu+2oqrqNHZxZ8x3b3nqqFklo8Ojj+jQuqkpQwyUo11th7ncUuSu6b1DI6/6cKmsGAjx9h1Y9qgpzCKbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3464
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_112739_034024_E07E14E6 
X-CRM114-Status: GOOD (  18.48  )
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

On 6/4/20 10:39 AM, Eugeniy Paltsev wrote:
> Kernel builds set their own default -mcpu for a given ISA build.
> But that gets in the way of "custom" -mcpu flags from propagating
> into kernel build.
> 
> This will also be used in next patches for HSDK-4xD board support which
> uses a different -mcpu to effect dual issue scheduling.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>

Much better. Ack with nit below.

> ---
>  arch/arc/Kconfig  |  9 +++++++++
>  arch/arc/Makefile | 21 +++++++++++++++++++--
>  2 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index ff306246d0f8..7034c217708f 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -377,6 +377,15 @@ config ARC_HAS_SWAPE
>  	bool "Insn: SWAPE (endian-swap)"
>  	default y
>  
> +config ARC_TUNE_MCPU
> +	string "Override default -mcpu compiler flag"
> +	default ""
> +	help
> +	  Override default -mcpu=xxx compiler flag (which is set depending on
> +	  the ISA version) with the specified value.
> +	  NOTE: If specified flag isn't supported by current compiler the
> +	  ISA default value will be used as a fallback.
> +
>  if ISA_ARCV2
>  
>  config ARC_USE_UNALIGNED_MEM_ACCESS
> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index 20e9ab6cc521..2b66e8264174 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -10,8 +10,25 @@ CROSS_COMPILE := $(call cc-cross-prefix, arc-linux- arceb-linux-)
>  endif
>  
>  cflags-y	+= -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
> -cflags-$(CONFIG_ISA_ARCOMPACT)	+= -mA7
> -cflags-$(CONFIG_ISA_ARCV2)	+= -mcpu=hs38
> +
> +tune-mcpu-def-$(CONFIG_ISA_ARCOMPACT)	:= -mA7
> +tune-mcpu-def-$(CONFIG_ISA_ARCV2)	:= -mcpu=hs38
> +
> +ifeq ($(CONFIG_ARC_TUNE_MCPU),"")
> +cflags-y				+= $(tune-mcpu-def-y)
> +else
> +tune-mcpu				:= $(shell echo $(CONFIG_ARC_TUNE_MCPU))
> +tune-mcpu-ok 				:= $(call cc-option-yn, $(tune-mcpu))
> +ifeq ($(tune-mcpu-ok),y)
> +cflags-y				+= $(tune-mcpu)
> +else
> +# The flag provided by 'CONFIG_ARC_TUNE_MCPU' option isn't known by this compiler
> +# (probably the compiler is too old). Use ISA default mcpu flag instead as a safe option.

It is obvious what is done here and the comments can be skipped (no need to repost).

> +$(warning ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '$(tune-mcpu)' is unknown, fallback to '$(tune-mcpu-def-y)')
> +cflags-y				+= $(tune-mcpu-def-y)
> +endif
> +endif

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
