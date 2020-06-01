Return-Path: <SRS0=EH8H=7O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C20EC433DF
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 21:44:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEC4B206E2
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 21:44:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qr+vUdK9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DwKNp4uh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CTBxybNx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEC4B206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpmzWsEYNWDnMMaSNS1LgV9qppXuuyly0nhYIrbPlcM=; b=Qr+vUdK9t70wHi
	zykUkJ7iZ8n1WUK+971QUvC9TFUQkyBnY81K88UbRXXwQ3DrRgz6j56DgeBOpY0y4rhbRTkt4IMYj
	B8wFx73L62NB4vzx/ziD+gtFYu5AhPkFob9BGs+cKKYnSKb/wSiCIKTN7Tsi0Nb3Ng0QtAfwIYL9T
	RY7/IzFgSLfSqGNyOUVqXh9RMl3LiBoQKUXbDtXhQZvxmsJC9KnvqaKYWu6z4nks0oFh8iJkDKAmB
	yMmRnPaZB1raf2BLVhUdnmdAGnna31naRWziifITz/7pqTn90sV1MdqkW7aKqJdV+MPzBquxge3Xw
	bKdkRVsVgMd/yJ8glrMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfsEl-00075l-2D; Mon, 01 Jun 2020 21:44:51 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfsEd-0006x9-Os
 for linux-snps-arc@lists.infradead.org; Mon, 01 Jun 2020 21:44:45 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C7C8C40171;
 Mon,  1 Jun 2020 21:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591047882; bh=LC9VA3cMo/kHDCnZHAZllA/At+5kUOvdFdpJtKYfG2Q=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=DwKNp4uheYJ9w0z4oNAnkhKm4Etyqco28PlXrisE4OU6dhu1vUWYg+SbbKT38p/i3
 T/SRyVbyk4MjmcqIl4+RjKScTc3kGCHuynROMXTnjjxkdJWkAFHfiYDNVYzVLeK1jt
 0F0G2/d22emuNlbZ9sYPXTOpCELLAHubm4Zu+myF1pqTpfebzQjcti8piS5svGoTpx
 Adf1yxBWUvjnHffU6tB4W4eGtrZ3D+BgIhtmAzTM4gl1ReCGxrEVDnX3DNKbbCWqYF
 xJICxadxml1eTGLMSKZSYTa0hNKr7upvKp1/aAksCjRWA0Jt92wqgWIjhrRXtUeprs
 j9HPPlnsODQPA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5BC34A0071;
 Mon,  1 Jun 2020 21:44:42 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 1 Jun 2020 14:44:42 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Mon, 1 Jun 2020 14:44:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PljvwPp7glWVYIPbG9PrxNyd0d+1/YajzC0jWgOz1FGAvtxmFw3niIExZEb9VS8gHuhTboXtGtHVt6Y5JZGBcJm0G8P54993Xgxc7Aop0k3LWhLs+NeFhKpfD8aWI2vRhus7c08DJTuubuIZqH5x0ANDpzz4Hkf0CLJv1c12zv3YzlKHYXc4PgZGQAKQjvq11A5YPgsRkq+7IO3LStbIq0PuyMy2hWmHCRk5bmhKGLhGFobrVUNqNDciC/8PGczbazxmYzH7bagAOjkaLoDlHFzZU/sC70uS8fEHci/BTptogP1DxcIeur9mMQJbeCQOG6O06UznEOS8Hi/FlP76oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LC9VA3cMo/kHDCnZHAZllA/At+5kUOvdFdpJtKYfG2Q=;
 b=ZIZP9Pv3MkyOLbVfP4k0Fk8YEGglTvyTGRBw4xSrxgx3A5ammTFjT3U6hfGWi25fqycaiwqnPZSKl3u3RbgqsPOTGXuMSeoTNGnNnVcSB0E60k7Fw2BC39KGba4bMWf7awVQu/V4X7KIHyYlgZmouvLLkQwZuNbe/NOXDNEQLaBiPsMmD2eh+uwTiM/8EDpaYWUjUzPeJKnT/60Vc0mT3MYk9dNvG1jq9wSNhPZWpIH4Z8/JurOAAEgUddDCs5jAvZ8c+tOrupaJXt0PEHmZHO5p3s03pV3uXrTZ5LlLoXOPU3QcA88Nmb1ZyZLVyno8eMnL67k/o4NDZVm5fe/4Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LC9VA3cMo/kHDCnZHAZllA/At+5kUOvdFdpJtKYfG2Q=;
 b=CTBxybNxKvVHGe0dD3+Ff7AqdTqgwAETrR4SwbiyW5lHbUCexjspY6VHoNUROsmjgiWQ9xTRgSeJJhULAsXehmZ+EaFB1tcsghWgLuYv4DeK7kny7JxDoonAUjVYbxvZlOtufppWnqsZKefdbRebiODM+Lx2KAfg58n1IZWS+68=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3623.namprd12.prod.outlook.com (2603:10b6:a03:a9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Mon, 1 Jun
 2020 21:44:40 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Mon, 1 Jun 2020
 21:44:40 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH 4/5] aarch/fpu: use generic sqrt, fma functions
Thread-Topic: [PATCH 4/5] aarch/fpu: use generic sqrt, fma functions
Thread-Index: AQHWNiY9mImKUQ4610qMSxcEjybRfKjD+cmAgABVnYA=
Date: Mon, 1 Jun 2020 21:44:39 +0000
Message-ID: <e6b5ba39-dfd4-abe3-5743-ae1bf1b8e9a9@synopsys.com>
References: <20200530020047.5490-1-vgupta@synopsys.com>
 <20200530020047.5490-5-vgupta@synopsys.com>
 <c20755dc-bd3c-2ef6-c0ce-665529a62243@linaro.org>
In-Reply-To: <c20755dc-bd3c-2ef6-c0ce-665529a62243@linaro.org>
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
x-ms-office365-filtering-correlation-id: cd44b117-96e1-47c0-2e29-08d80674fce8
x-ms-traffictypediagnostic: BYAPR12MB3623:
x-microsoft-antispam-prvs: <BYAPR12MB3623494926A2CEEED97C19A7B68A0@BYAPR12MB3623.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 0421BF7135
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nCmWxaoAgAfoO2qpS309uz6K3u8j4vJzmhCohh90jsVuy96MvLzr25AS7v2rKNTg2aRojL5ENuoAUqP9Ib3FBnjKZTdlxQUTiNhI2trTWysEpcE6pvF3AT3ty25GUbjTO5HNsdHji/kqgqLxE7y5pjpPP3N9GFbJw34UHs2otEbr1HlcgAgO/YYrRXp+wAvcU+QBN/WUyGipviFQRsjOtZaWmc7NvxkU/eQi2ixtO5AAN/WEik+x7NTxVuyzORytWzqTCasXMdtj62Nmcy0BG1k77ZzU2qkvsrBob6XWdOnSMbyYLZc08PZMCGa2YoSI8eQ+bxfgSUXVTMOP3UNciC9AjRHtKH2YqeQnAwVO9NSuTfcRyt3Oh8WkB915wGc3YsZKquzbANwZ/mTpV36v1FXYq6h7lYkLXeU/HaOmqwU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(346002)(39860400002)(396003)(376002)(366004)(110136005)(316002)(83380400001)(6512007)(2906002)(8936002)(478600001)(2616005)(186003)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(5660300002)(31686004)(53546011)(6506007)(86362001)(8676002)(36756003)(31696002)(4326008)(6486002)(71200400001)(41533002)(2004002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /2khhROwNiL0LvTABulM30+3F50n5HOFsEoC1BjMYAPJD2wWHPZ2FCGgqVfaXrIzWLf0JkK1eKSST2acRXjXs4HWT7ZNq/T7eEGFUCQNNl+Aqe9nxaJk90Cies4dFwiaRe3c28Bb1UYjZ3lv1WMWgAvpqKBd7Q0C2QdP8zmqSklxiqfJmetc5HTVwJotvX/xgsjSHy6kez0G9ML0UHRusLV6ocKox4pb+PtpO2qPzpjXYzi7OJuScj8HSyWRkd4Tu0Xg9PU1YceYVGr4BpnCKd4JzVR7IuF1bIHRRWUJkQO4rFCfLMW+4R1wFIGyD8SYOLIaArdUj1MfSPW8/yfdkv1P1lNHVyRVAvdkhWhL2WgdSV0B1MrhFtOuGIesPr6FiXKWElSpTsnbQtBIKhPBTeg3lYD55g6itCKNxzItbxjmS4sbOcTOgRBZCb/Lfc/Rgycy4oEQuv6/gvjAA4gzGHMalvp5yy3Vt85Y8RuL8EDiyxkQCdv8nZWrRlvckrJnQecVAewAhUJ6eJUoa0LrHUeNy0sSEVpE9re9i7ZUWvgzxKDobvPdE8unLFA9VnCP
x-ms-exchange-transport-forked: True
Content-ID: <7D9E43FA98445B4EB1746BA09E4EB6A1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cd44b117-96e1-47c0-2e29-08d80674fce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2020 21:44:39.9823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gkMQyExRfQNkjBsCT81YAXL7z4RHewdqxkSf9gx2fXzboVSmztkaWkN2jpzWxRsUlBI0KBX+k73f1UsFQlydiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3623
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_144443_896784_58FCF1A0 
X-CRM114-Status: GOOD (  18.35  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/1/20 9:38 AM, Adhemerval Zanella via Libc-alpha wrote:
> 
> 
> On 29/05/2020 23:00, Vineet Gupta wrote:
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> 
> LGTM, some comments below.
> 
>> -#include <math_private.h>
>> -#include <libm-alias-finite.h>
>> -
>> -double
>> -__ieee754_sqrt (double d)
>> -{
>> -  return __builtin_sqrt (d);
>> -}
>> -libm_alias_finite (__ieee754_sqrt, __sqrt)
> 
> Ok.

How is one to test aarch64 port with hard-float. build-many-glibc doesn't have a
hf variant and hacking one didn't do the right thing either.

>> diff --git a/sysdeps/aarch64/fpu/math-use-builtins.h b/sysdeps/aarch64/fpu/math-use-builtins.h
>> new file mode 100644
>> index 000000000000..52f0a0dad6dd
>> --- /dev/null
>> +++ b/sysdeps/aarch64/fpu/math-use-builtins.h
>> @@ -0,0 +1,70 @@
>> +/* Using math gcc builtins instead of generic implementation.  aarch64 version.
>> +   Copyright (C) 2019-2020 Free Software Foundation, Inc.
> 
> I think it should be just 2020 here.

Fixed.

>> +
>> +/* Define these macros to 1 to use __builtin_xyz instead of the
>> +   generic implementation.  */
>> +#define USE_NEARBYINT_BUILTIN 0
>> +#define USE_NEARBYINTF_BUILTIN 0
>> +#define USE_NEARBYINTL_BUILTIN 0
>> +#define USE_NEARBYINTF128_BUILTIN 0
> 
> Since we are adding this new file for aarch64, we could also enable it fo
> nearbyint{f} and remove sysdeps/aarch64/fpu/s_nearbyint{f}.c as well.

OK, but only

+#define USE_NEARBYINT_BUILTIN 1
+#define USE_NEARBYINTF_BUILTIN 1

The other 2 are not defined currently. If they are, then I prefer they be enabled
as a separate commit for bisectability.


>> +#define USE_RINT_BUILTIN 0
>> +#define USE_RINTF_BUILTIN 0
>> +#define USE_RINTL_BUILTIN 0
>> +#define USE_RINTF128_BUILTIN 0
> 
> Ditto.

OK and again only RINT and RINTF.
Also I don't understand one thing. Both the generic and aarch64 code have this

float
__rintf (float x)
...
libm_alias_float (__rint, rint)

The alias arg 1 __rint seems to lack suffix 'f' ?


>> +
>> +#define USE_FLOOR_BUILTIN 0
>> +#define USE_FLOORF_BUILTIN 0

Again FLOOR, FLOORF only

>> +#define USE_FLOORL_BUILTIN 0
>> +#define USE_FLOORF128_BUILTIN 0
> 
> Ditto.

Ditto


>> +
>> +#define USE_CEIL_BUILTIN 0
>> +#define USE_CEILF_BUILTIN 0
>> +#define USE_CEILL_BUILTIN 0
>> +#define USE_CEILF128_BUILTIN 0
> 
> Ditto.

Ditto

> 
>> +
>> +#define USE_TRUNC_BUILTIN 0
>> +#define USE_TRUNCF_BUILTIN 0
>> +#define USE_TRUNCL_BUILTIN 0
>> +#define USE_TRUNCF128_BUILTIN 0
> 
> Ditto.

Ditto

>> +
>> +#define USE_ROUND_BUILTIN 0
>> +#define USE_ROUNDF_BUILTIN 0
>> +#define USE_ROUNDL_BUILTIN 0
>> +#define USE_ROUNDF128_BUILTIN 0
> 
> Ditto.

Ditto

>> +
>> +#define USE_COPYSIGNL_BUILTIN 1
>> +#if __GNUC_PREREQ (7, 0)
>> +# define USE_COPYSIGNF128_BUILTIN 1
>> +#else
>> +# define USE_COPYSIGNF128_BUILTIN 0
>> +#endif
>> +
> 
> It should be described in commit message as well (although generated
> instruction are essentially the same).

Well this one is even more special as it was already using the same code, except
that the math-use-builtins.h was generic vs. aarch64 specific one.

Thx
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
