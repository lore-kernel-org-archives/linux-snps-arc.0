Return-Path: <SRS0=5IfC=AN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37308C433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Jul 2020 17:46:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B7320702
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Jul 2020 17:46:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mrdsgukc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RSz8Xt1A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ViYMmS8b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6B7320702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tM58inITWkq9rJAu3KzyvsPsuoQ65NUTBXyb6VfzY5A=; b=mrdsgukc98PdSiyWfr1gxn6Bd
	uzfODv5L5SgHVqpGmzJeAoLVpN3IN825lKElrH04lWbG1BNkIqKyEjON7lcPvMJKYaDwIzR9GB6Jl
	hVZjT4Vo6uvEiIjX8JFqBRQZMsU1g34YSpKYQ6ejtNek6K/nnvQTwLOaYhlqy3CkNK32yk961kcuk
	vMf5k8XkDxIc9X9/53F1l3jd6omRVmrvahOiwq7as+x7vSaxCBuptAmMWAvJiiBnPA+wp4+mrQfXe
	e9hlblQZTkrnp7jyRZXqYojHJwMKaQ5iJw3OSKte1MvSSdFN0JHCXetBgnr+m5SB8M4cNNEVxdnT0
	DOStx7OHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr3He-0003Lk-Bb; Thu, 02 Jul 2020 17:46:02 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr3Hb-0003KX-JL
 for linux-snps-arc@lists.infradead.org; Thu, 02 Jul 2020 17:46:00 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CA219C0447;
 Thu,  2 Jul 2020 17:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593711957; bh=eS1nOO9ymO4meNEQT9gRUfsrjTyi6v+D7BDToQB8mhE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=RSz8Xt1Az6PRZBMgCNNKPawwMjdwFVO55crXQZVlkmaW03T2xUWyC5LdhviCGcAvs
 fO9DMMDAbROAMRmFMpk/Rzb6yfGXrv8zCvAzZnHoDmru0wVtqZbrcyO66DE+gwbSH7
 uNU/kNiYionplLYAlYa0vtD6uWpwWye9RWuElT3ASCAO/Eg4e2Jc5qnljC9ICjDAf8
 By0XqP8SnUcyPLgIjZTdI0NkQfV5U9mW55EdJdAUZ/ypSfWj636n/Eeeore5cLr6Fe
 RT8ReEMYn8AQUzOJUNSGEawUelt5yhSyiipsXIsiLlAHPQKbbeS9CCmZIE0E+8PJ0x
 cUMLYe2p4rUrg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 024A2A0255;
 Thu,  2 Jul 2020 17:45:53 +0000 (UTC)
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2059.outbound.protection.outlook.com [104.47.38.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 89AD980028;
 Thu,  2 Jul 2020 17:45:50 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ViYMmS8b";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2YP8DgM+2gPJDSwUXuLUOCySq5GEem7xc3nKp1nMVDz2F3qqL8fPKJVbE2ZH7I7UQcbFEYx7YNAFFqedsbpY4SjMhBgGDusyF+WofkwBYOqFRkDhZ6YHFXhKUz6WVLSot4qxt2sbNDcd6+T+EulP2Dsc8JDj3iPcUhGAE8xH46UU3stpi/Mh73glA4s4dpPALgF9z/MzykhUOsXGPSeV72o5NvGUA1TPQKfSe/rV/+MFPP9hCAnxS4HzHTakr4HNZGl8ZyWbcIDorAQhkf41uV8i2P6/d/9+J2hClkxu2DuU18cCtl993+xZBBcMDnXEVCub047zf0gascY6qx7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eS1nOO9ymO4meNEQT9gRUfsrjTyi6v+D7BDToQB8mhE=;
 b=DsfK3bEjGIQTt4vuhOiSNVJN2ygxNUF4Sigxf5dUiw0j+Tyer7+F+nv20QSq1QS3FZ2AGfvem+I4Vn8kWiNA+XO/0YtkAJVByqRVGLDFyxwm5Qcl+sCo+lGOsztfo/BljAugdMA2KQLQXD6lPxqder0/5eDmn8Kl2xr8VdewwT5L+Q6V5rKoFWDZZgVlzSHmBt4AtkS6SxULA+r6pydUbUFx2FgvPrVIOJP5Kxbg86svVUrrwPRpAYC0SfOL+FekwuMotXr88+f5++spTZGAbhc0s5qpBp0rjb62YNcTmKuOmjp6BPAOH1aVtgViAfpTlS61khw9CLMqRvKhd6t5dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eS1nOO9ymO4meNEQT9gRUfsrjTyi6v+D7BDToQB8mhE=;
 b=ViYMmS8bisrpR8KwiXck7ppBJ7/Ravj5axiKal5AxNtFLNcQ6KM2JVEdUzNBpHI4PImIab4mznIaAH8KYlekwgaWEpVdGmN/IfFYZSjO5tq7/O965slxb3eHNt3E7zJxMrnrmkAM6aP1zTqzwPDN9ZvR0FqHRiDNpM8MgX/omcA=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2854.namprd12.prod.outlook.com (2603:10b6:a03:135::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Thu, 2 Jul
 2020 17:45:47 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3153.027; Thu, 2 Jul 2020
 17:45:48 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: ARC math test regressions (was Re: [PATCH v7 00/13] glibc port to
 ARC processors)
Thread-Topic: ARC math test regressions (was Re: [PATCH v7 00/13] glibc port
 to ARC processors)
Thread-Index: AQHWUAwnJO6kctxg1ECtSGYXjTKDiKj0ez6AgAAV5YA=
Date: Thu, 2 Jul 2020 17:45:47 +0000
Message-ID: <972989fe-916b-4012-530a-8aeeac758aa7@synopsys.com>
References: <20200615201441.31820-1-vgupta@synopsys.com>
 <c5edd9af-9dc6-d572-4779-6897e43c0a31@synopsys.com>
 <a3afd7ef-87d9-f033-fea3-f4854b9188ef@synopsys.com>
 <9c1ae166-4e37-e8ab-d6c6-cdbda5b15d83@linaro.org>
 <e88bc836-ff16-d32b-cc06-fa473c4c6744@synopsys.com>
 <4a04f8dc-c888-1411-0add-8603822d5ee4@synopsys.com>
 <alpine.DEB.2.21.2007021618480.21468@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2007021618480.21468@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: codesourcery.com; dkim=none (message not signed)
 header.d=none;codesourcery.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9984a4e-a522-4834-e5f6-08d81eafc115
x-ms-traffictypediagnostic: BYAPR12MB2854:
x-microsoft-antispam-prvs: <BYAPR12MB285443DE5CEE7F7775B68007B66D0@BYAPR12MB2854.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fqs7CxLsU6zrVQ6RAjj88AXPIS2r8x3sQXlhAdjkXl3/++JyNwQSEZAEczU0O2LY5s2wi4nPDT1v01z4ZqScrJkbmwYLLFJdAlk3V0yDLgyhxLaKVDQbd6galpl0a7MUj3i66AafZaN4LZGuOIPNG5feWzJUcTs5Mp8HUTRFL3c/qgSVQ9oQJ5rACCvUDXzj3ypQk55N/je9OGQsmyX4dzRwFb1w/tJQ4AqHi0vrogngXEw8/lajnWxFPrvkLVPkzmua0fLXepcaXUsEn7+izlvn4uGzVPPCP+aSpYM/0a5gGIuPYGAI8yldK/oSGfT1qGah+Y4st+8ZUGT6Ggk19Wo3+hfQ1q1aDRJQMttGFVODbvW+x9ES+TPhl6/51KB+IGs7+JiaDueCMWSb10eyE+YowdluKJfe+3PmMJ1FyA2GfbdLAGqEGtDpJ+9A0fnTO0tNI8O49u+IuLvtgSmWaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(366004)(376002)(396003)(136003)(39860400002)(31696002)(71200400001)(31686004)(4326008)(2616005)(316002)(6486002)(54906003)(83380400001)(86362001)(8676002)(6506007)(6512007)(5660300002)(53546011)(66446008)(36756003)(186003)(6916009)(64756008)(66556008)(2906002)(66476007)(478600001)(66946007)(966005)(76116006)(8936002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 7Ql2+EADjtnY0qJdFnRAaAb0p28wAAR2A8omHJHYqtEEWq7sM+e2hYrCwNeUkJfMXBTQyaPzlaZxyw1XaO/AAtjahPcB858nprqPoNsr9chzGzHSMCFLghGuxo4tglIArnSqW7jnC7cXT/v5hPses1mOtqBxJoLW6/LbGCHxOFI/57QkvKMBU27Uveyd1hVeQ03HcrjcLa7pu7J6LxxdPT5/NqUZ+qndCGKSKwvfbErjJhvw1hqArQ+fY9O3KoxhbDw8urkzSwKKrA5QzTypNE6DcUgnOVZr7Ki54D95/EdsAs6MRXS124ifvlgBER8CN6VodfM99BfW0uMF2z4pQEpWsOpUR4VyjdQgOFrFX1s06T+Jq3rTcqlp02cJijjZ2TpsGNpK5v3DuIB79O5gf0EAw1dnUm6aGZMsluliezdJe3DPMw00hu30Ec1EJln9q29xcKVfya+1d3EmtroWatU/Bcs1tc2sUwIvdOXTCmxpfbraNokF3ziTKkcMAkAQxnujf0e7azJmi8PjB3XjweduNvc+avTDxjBtnORp5ZeBjIs/rXzYO/hFFJ9zVTXC
x-ms-exchange-transport-forked: True
Content-ID: <037399E2C8921743AB55C34458AFDB04@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9984a4e-a522-4834-e5f6-08d81eafc115
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 17:45:47.9013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tRfIcZ9yedTeRu75bozkSo+izlSaAdH4te1MbkAZJGwx+bJLSW+b8y/0qop0xqaBWmVApV1u1MoVHfoLFwuTew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2854
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_134600_054046_D2168517 
X-CRM114-Status: GOOD (  13.78  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 7/2/20 9:27 AM, Joseph Myers wrote:
> On Thu, 2 Jul 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> Now acos can come from 2 places depending on LIBM_SVID_COMPAT
>>  - math/w_acos_template.c	<-- sets errno only
> 
> This wrapper, unlike the compat one, always calls __ieee754_acos 
> (appropriately suffixed), relying on it to raise appropriate exceptions.  
> The implementation in sysdeps/ieee754/dbl-64/e_asin.c raises the exception 
> by doing an Inf / Inf computation.
> 
>     u.i[HIGH_HALF]=0x7ff00000;
>     v.i[HIGH_HALF]=0x7ff00000;
>     u.i[LOW_HALF]=0;
>     v.i[LOW_HALF]=0;
>     return u.x/v.x;
> 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=95115

Aha. I almost forgot that this was upstream gcc-10 for ARC too (and problem
doesn't happen with gcc-9). So my glibc updates didn't trigger this, phew !

> The right place to fix this is in GCC, to stop it constant-folding Inf / 
> Inf when flag_trapping_math.  That should be a straightforward fix.
> 
> It would also be reasonable to change the above code to just "return 0.0 / 
> 0.0;", as a simpler, more idiomatic way of returning a NaN with "invalid" 
> raised.  (Any code constructing infinities / NaNs via bit patterns likely 
> predates built-in functions that can be used to represent such values 
> directly.  Though the GCC bug means a literal replacement with "return 
> __builtin_inf () / __builtin_inf ();" wouldn't fix the present problem.)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
