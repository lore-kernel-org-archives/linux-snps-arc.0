Return-Path: <SRS0=BbR1=4O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5DAC4BA24
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 19:10:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95084222C4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 19:10:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FoQcjKuy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="C7xk3Dhl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="PW2ge7lG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95084222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKEXmWgHuZVA5qdVDlykRuRopuQTau24G6tu45f2gRY=; b=FoQcjKuydXbFWf
	8758FH/WVsrJsLfMmuR9oAiLlIgrnKtjfJdlRPi2tD8GFkgeA6jdhf08eI0SNak8fh/6g9tjQvFtH
	AuQTChQwSPJENSWeCAfGKsUpEURFj+psl9NFGnv7ivbWNaO/Au7PAGaNFbFyMTObFJEiayC0KtOst
	ILuKSs7Q0gYAsofAova29rcKyrex9Rq83RQ/m/uQT4Zx1oaFFZ09nOltUGFHBoTrGMUg7lz+7HPgu
	myObd+MLqrWVzEyx36KxfrmRANrtv1Nc+UjskAB6a8Q8HZNrk7X5HLfA2YJxi3tR7CfkAzvzLMgOL
	GghRVGysbk6pAJtzm6xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j724s-0007Kv-9n; Wed, 26 Feb 2020 19:10:38 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j724o-0007KU-LP
 for linux-snps-arc@lists.infradead.org; Wed, 26 Feb 2020 19:10:36 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 26852C0AC7;
 Wed, 26 Feb 2020 19:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582744232; bh=gqYDKKRD46cfP7iH2Ovf6lFSWDMRmymntWukbM7OaVI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=C7xk3DhlCZYUQzFhx2oiO40fqeI3td+6weDr+apWIZT0ZDZxmz2NvOCGH84rEfh1B
 B7BhdKCYTQKYhnpZkcLbtXd5TRxOnPS1WHBxtVBJ0QnNsIjKnsH4HbK2W4A0RqHnsG
 BBj/CV9Io69jCsJ86l7A1uqKQ043WjLJdS5OSWVPoUjD+E2MKhjTioh31aqfjnTfGc
 5PFWVyRNhhByfiYvJ84fmyXsps/7iArcKgXignCrfQHHkPpdBpM1O/ovlYWJsMvxdu
 s3880unAJ3Qvu0myxtYm0k+c7MMvdoxsTslVaLY9exK95C6dd+ugQI4H6TUBacb2N4
 m69cESAcs1UkA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A6861A0079;
 Wed, 26 Feb 2020 19:10:18 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 26 Feb 2020 11:10:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 26 Feb 2020 11:10:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cuwp5fuYgPF7mwUVbwcHWpPfF6MPAeT3NA1DsBjOOcXssrZyElvY9kChfg+/aVO7Rq9OyRVVPI6eyAOB3u0/x1p4tbP5Npt916TJ6dQCZZkDO39DcJxa0z6TvkrM4rOWu6T2QoCTPMIq5e/8sI2/RQ+ACPJo5iYNYg/TfJ/FzaPlGJXXk1beKVWo55tcGEpkGdr4kzD6AU4ms5DVBbLj9Jnnm/tl+1KcdVoOlKFFR8fv/SfCaOeJNpd7wtMjqK5LcJ50lYgx1lIDiCOrJmroSb90rwwoliA86jgU9b6jA7s3cAhgZQwq0OdzMkYm/RaDpdq/IXM2+XkKdqWnnaYSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqYDKKRD46cfP7iH2Ovf6lFSWDMRmymntWukbM7OaVI=;
 b=ljKWjoKBbpnGBt648q1c/2KM7mYFweQPKBQ96KZy+729kcBJtgYyaL29fC48wDT4m5nx5k6972Xd1y/VhqdpWBYNaXum4j8LdcDVmoECiWq9OZWBqv5mxEjUUMjRI3j28c+6Ah4dNeDgJnYb8O+FR4gjyc5LVjyVBDn3jVpaJGvljfq6FxFX/bNwRjCs+SlgIt1JFg6diTQv/s6lc3Zk0fHIRTQoXHUyHUfx2pgWzWUCL3WaI/HhQ5ttnLk61ZaGql4QHlMtZwWAOq1zwrYKhJ7iqmK6X9jaUJWlw/V+yDhcbMHdB/a/5k39cZSeskeT0koTdPmG4ITFKDJu0TQ+uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqYDKKRD46cfP7iH2Ovf6lFSWDMRmymntWukbM7OaVI=;
 b=PW2ge7lGkfdWmbJ7hKuMMDlbrj85QDWICO9g2NkXjheMSBiH66eZGap2VJgz283tlfe1boEEf+2BPhrx7+v6BwLG3h2WFBg4YNbIHDNAWMpY9SwMZN4oaGeWwiUr64FIKx6Of1a7qcmduBGK/ivt8ymjEYVyElpcbccx8mtP1Cw=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2614.namprd12.prod.outlook.com (2603:10b6:a03:6b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17; Wed, 26 Feb
 2020 19:10:17 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 19:10:16 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fweimer@redhat.com>, Andreas Schwab <schwab@suse.de>
Subject: ELF_INITFINI for ARC (was Re: [PATCH] Introduce <elf-initfini.h> and
 ELF_INITFINI for all architectures)
Thread-Topic: ELF_INITFINI for ARC (was Re: [PATCH] Introduce <elf-initfini.h>
 and ELF_INITFINI for all architectures)
Thread-Index: AQHV7NhheSYc9Glqj0C1TUWkO6c+Dw==
Date: Wed, 26 Feb 2020 19:10:16 +0000
Message-ID: <cc69bcb6-526a-469d-f78a-035208645ae9@synopsys.com>
References: <87zhfngjot.fsf@oldenburg2.str.redhat.com>
 <mvm36b51ahf.fsf@suse.de> <871rqpfc07.fsf@oldenburg2.str.redhat.com>
 <mvmmu9dyyi8.fsf@suse.de> <87r1ypdrhj.fsf@oldenburg2.str.redhat.com>
In-Reply-To: <87r1ypdrhj.fsf@oldenburg2.str.redhat.com>
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
x-ms-office365-filtering-correlation-id: f2bddc4e-6bab-4afc-643a-08d7baef83d9
x-ms-traffictypediagnostic: BYAPR12MB2614:
x-microsoft-antispam-prvs: <BYAPR12MB2614A1C97FE6FAF1D3380106B6EA0@BYAPR12MB2614.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0325F6C77B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(136003)(396003)(366004)(346002)(199004)(189003)(2616005)(53546011)(76116006)(36756003)(966005)(66946007)(66556008)(86362001)(31696002)(54906003)(64756008)(66476007)(186003)(316002)(2906002)(66446008)(5660300002)(81156014)(8936002)(6486002)(71200400001)(4326008)(6506007)(6512007)(26005)(110136005)(478600001)(31686004)(81166006)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2614;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nCuXFYFiqWAbevaHMjW70BtmG3TGzlDKmTYqlYI1zS1fY1S/rte1Cl7fa3ESUAUAz9dUcgG9mgS64DS6nNx7ata6QmYbHNSXAFzIt9Pt4mDIC9Nyw8pw2t24l3ADZ7Ik/PJcssYTvR6A2O4vNC4wC10sywK29vdZJCqZNnsEI2tHZep+pnVdXW90IYknf6tE/z3YaR/HoNmvwu3SUNBMzPxrAWOwS/KFwDphOs/8e40LpMpAcEghgjjhnWCjGVv+bdGCBWA1Od9qTlKpQEyMc1YmFnhsrnnQ24bx0gwfZP8trrQmXcukFguGvIhN3pV3mkdgV8QYSIbcrT1SwkMS9sSxq/ihWW0IZQ6ASPE8SrmF9RLJ60XR2RnVO8UkScCHTV/IwN1lhYzNwUvkAFdxasAV8nkmVS+uUsld7NvfQZ3zTiyX6OzbsiLBoyLJkR/e113b421CgUKkuInb6H64qCnO8XeQhynRLLY1xMwPIndHMdwz8W1L+mAwowCmmgBnyx0IkmasMDOwu/N5psBkrA==
x-ms-exchange-antispam-messagedata: GwM/Nw+d6FVo/mrngPwl55julyhfKTvycoKpnFhLCfhij0W+NDlMwdg8ZKHfCPxGdbjaWlxZs1mHAzZxZIFKegTM1+dR8QGSCZafKSFA+gxOLO5SuZavMl+8MF4IIvJl0L15gEPbxBrTFbwV+mMjNg==
x-ms-exchange-transport-forked: True
Content-ID: <01D8C53912F1A1469C828E99E2D90810@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f2bddc4e-6bab-4afc-643a-08d7baef83d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2020 19:10:16.7107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8J7wn0rXRdn06UZ4b7LByXR6Rc8BnAruOoqIuzYPnh1rdCXJaHDzeFekZsZr03b8a7JJUTNL+Jz/XeUS8u1qvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2614
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_111034_825278_11DF3CEB 
X-CRM114-Status: GOOD (  21.85  )
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Florian,

On 2/20/20 10:48 AM, Florian Weimer wrote:
> * Andreas Schwab:
> 
>> environ is empty.
> 
> That's because libc.so.6 still has DT_INIT, from which _environ and
> other variables are set up.  I assumed binutils would convert that into
> DT_INITARRAY because the architecture is not supposed to have DT_INIT.
> Without that, it's hard to declare that there is no DT_INIT, and the
> patch essentially breaks ABI (because DT_INIT processing is gone).
> 
> This should fix the breakage:
> 
> Subject: Use ELF constructor instead of _init in libc.so
> 
> On !ELF_INITFINI architectures, _init is no longer called by the dynamic
> linker.  We can use an ELF constructor instead because the constructor
> order does not matter.  (The other constructors are used to set up libio
> vtable bypasses and do not depend on this initialization routine.)
> 
> diff --git a/csu/init-first.c b/csu/init-first.c
> index 1cd8a75098..1fa1633657 100644
> --- a/csu/init-first.c
> +++ b/csu/init-first.c
> @@ -46,9 +46,8 @@ __libc_init_first (int argc, char **argv, char **envp)
>    /* For DSOs we do not need __libc_init_first but instead _init.  */
>  }
>  
> -void
> -attribute_hidden
> -_init (int argc, char **argv, char **envp)
> +static void __attribute__ ((constructor))
> +init (int argc, char **argv, char **envp)
>  {
>  #endif
>  

This (or lack thereof) turned out to be the nasty busbox sh crash (and kernel init
panic) on ARC based off rebased upstream (latest RV32 from Alistair) containing
the original patch f4349837d93b4df. I tried this fixup and it seems to work. The
DT_INIT entry goes away and init does run as part of init_array.

It seems that commit also removed init_array from sysdeps/{riscv,csky}/Implies -
so newer arches. I suppose I need to do that for ARC as well - but could you
please explain (or point to documentation) which explains how this the Implies
stuff works.

> But I'm no longer sure if RISC-V is actually an !ELF_INITFINI
> architecture.

And an arch is !ELF_INITFINI if it supports initarray ?
I did switch ARC gcc [1] / binutils [2]to initarray last year

[1] http://lists.infradead.org/pipermail/linux-snps-arc/2019-January/005318.html
[2] http://lists.infradead.org/pipermail/linux-snps-arc/2019-February/005388.html

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
