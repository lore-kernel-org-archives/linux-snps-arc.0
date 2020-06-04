Return-Path: <SRS0=KRsc=7R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C559C433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 15:25:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D4552063A
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 15:25:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JZLmwDRn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KmyUYWTa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Xcqt80NC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D4552063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ex2VF6lHf2VGqE01PAmhbt1LkOWvypxMokkt3Vbipow=; b=JZLmwDRnaGAS4c
	D3w7Wlfz7YpRUFeQTK1WcbeMS+/pOUg22fr3K2Xc6juWLdPeqSIVRK4A6PxAXyne7qXGSgrLjPLwh
	zHaVpwV9/siKUDQQ3+5HMcxJg/AmDhPs57afd7cfHhhpUQdAb8sYuheIxRPuOd1RXJfRi2Msmvyls
	tP/pa4rzPrICzs+fiehs0yRpezO+YaGEoqMvQG0jyx2nFi+XcMlmwrq2V35xV/RuTM21kXe4dCV8e
	aKPegmklEA0Vh/Le4pAV4ulIOZKsCK+wludiRZNp+ZNsrDaK5uZvuyNNjPHvC22Fri53trzBVXdZ0
	nLoKg1wMDAe3wIiWxSQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgrk9-0004sM-7c; Thu, 04 Jun 2020 15:25:21 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgrk5-0004rX-VS
 for linux-snps-arc@lists.infradead.org; Thu, 04 Jun 2020 15:25:19 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CBD75C0442;
 Thu,  4 Jun 2020 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591284316; bh=Krv6iQk7b9QqkOC0+4maqeDd5fbSCZgj0XGlW27R524=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=KmyUYWTa0iAG6LTyJd6ivcOu/xlaFhKmdI9ly9VeX+lbIdt1lG3s+hfzsm4f+isxC
 ijTd42yBPa2HzHx/PEyF3pz9PveevxHicuZsGv86QzwLVoTuRr6ztWjWfjiqWSxZ+O
 mnZqK5OHcI9lKMPVQzIimvdM4YCh2kKpZJeUQDoYYUsS8jMCidXEVMJtrphuK4L4N8
 oxBpkIeJhcYeVWy7j8BVWvwBjxjHWKjN0J74r3iofwaEbYBCID293P28XC2ujN4pIu
 qzlGcdv1ynEBpXu67zw/Yc0rKzi7o1+z+UJf1za+EUcyQSItYi0QYo1+ZoUxVZShKn
 LsZrlrPpAEUIg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id CF93FA0071;
 Thu,  4 Jun 2020 15:25:09 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 4 Jun 2020 08:25:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 4 Jun 2020 08:25:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWa1RkH6K4yjy85FX/Olkox4TwnECEoR2o2wu+0KOJIDpQABWzRaktuG3enMjpfFDBeXG+6HV0kKc7wBig1bEEX3fsnr6dOG6+N7sR1zFk8LeQZN9uS5Ra4dfWC5SnFdioFMVUaz749pLhZme+iyp5dW0KYSioe/U+ayyHiD5nIIDh3pFg+2g394QUdSxhCl2LAUltUipV5aHfoWPQ2v8pW7fhzuSeIQO/nbsxMMriKglA45KEojjEZG9RdL8eAh5Iz1S1ODwHmuXbeTBAFYfprFtZZZFZnvVILyVpBpmf7MWM1pii3yHZRLcDnTWqc4/C7CJJFaQGIAjoYED+/lpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Krv6iQk7b9QqkOC0+4maqeDd5fbSCZgj0XGlW27R524=;
 b=jOmhAb/NKFJJRw045aZSAcM4lEv8STa/fzs+gj8fxnVu78NOIwJ/zJ+UMn3/1gg1LJxIZdoLEx8hznMYD27CWfYTZ3NNUWkWXqlT4XPtlkKinA46DTfCuPVdfWun1uAFLjItpeyKSR430nKnp7RruqCd7qL8Oyhkrh8T41/8RTVvZOkZidKKtuqsoQV+6nyhf3QKsVkhZI7OwDH1FnF9DnEkIbJaua6VaZUdQ+JolrS1E1M+ZBGyqKJtbL7CjzhtzdtYAlwX350/vvkcL3eLMOV8dvH8KYNSC+/bBvzveft/z1y08XZdH83Wta7KnwamQOvr+xG79PwiYB1DY528xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Krv6iQk7b9QqkOC0+4maqeDd5fbSCZgj0XGlW27R524=;
 b=Xcqt80NCIxjYx/hx4cy0SY31Q4QMWLM4LoLJYljxfybgneV2UoJ3hUCAJ47NMWgk2Hi5MfNsZ2KzNXwQOj48ErQ7XiQixTcOF95sFC038lFphIlSa3+2wLBB2q2PkNbHgv5bIKM12LfSJ8cnfrHVB+BqtQW2/e8ux9bfKLMHUkw=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3239.namprd12.prod.outlook.com (2603:10b6:a03:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 4 Jun
 2020 15:25:04 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Thu, 4 Jun 2020
 15:25:04 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v6 11/13] ARC: Build Infrastructure
Thread-Topic: [PATCH v6 11/13] ARC: Build Infrastructure
Thread-Index: AQHWOeLPJyHsygQNxEG0Cla1E8Xp4KjIlN2A
Date: Thu, 4 Jun 2020 15:25:04 +0000
Message-ID: <d64e6491-c5de-4c43-4e8e-d56ca77e662c@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-12-vgupta@synopsys.com>
 <fe061156-0870-086d-72b7-a006ec8421c7@linaro.org>
In-Reply-To: <fe061156-0870-086d-72b7-a006ec8421c7@linaro.org>
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
x-ms-office365-filtering-correlation-id: 49d26310-4b0d-4f51-dfd0-08d8089b74c0
x-ms-traffictypediagnostic: BYAPR12MB3239:
x-microsoft-antispam-prvs: <BYAPR12MB32395ACC031CD99FAEF91B18B6890@BYAPR12MB3239.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pzdy5My2oQ1k4WRnLA/1RoNNtq6wacjbYltB8dYM/H8XQGJDnBkLzETFmRKhL8YqGdiOk1Q8t/J+cyCJZBfkYlRsCZ3hPpgehZQe4Zhf/X/Eq4nmaaBe/jE3zUOX2ehvB7iF3JPB/PyDOcp5+dY+/ZYbGNIGuQ6TU56HRnNQO96YZuzG0F4MX6KjCcAoPheO7Zvcs7eHsLrjtJ1aUPVwy0lmJ0e+rMcocgv51IyGln1Ymm3RZQhlt/f+bwu8Wj5dIjNzzT9IkEBEJQuAYxShsvD4eJnliEg+oaAJuY4VgPyU5FE1cVZJSNKyVlz8d/q4aCuDr6n66riyRB+1c6Le/HJSfVDKpMD0kT+0ng+yr/vO5arrnL7tfb7Jz4SF+pcd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(39860400002)(396003)(346002)(136003)(366004)(186003)(36756003)(4326008)(478600001)(31686004)(31696002)(86362001)(5660300002)(8676002)(66476007)(66556008)(8936002)(83380400001)(2616005)(2906002)(6486002)(110136005)(53546011)(71200400001)(64756008)(316002)(6512007)(66946007)(66446008)(6506007)(76116006)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: l2tRqRE6UMQVvyTO4fBGxjdDGCpKr5ef+1dAZeNeSwBzNgn7u0vGeucoUQBlgtCcOZfinOV9kEaLZJN15IZE3KU0l7gr1B8ZlpFgHvpSu4PpqG/5g1j0bpgbUw4OLagLitEkdr2eBu1TXMFdPA9RVRmMeym7KjNFb11o5yqolt3WtCl4Fhr2XqoiWMjs4kmWiBuVqtqrnePAc57UrhGBFBhyjenCQwlrtZi66IF8mLE6GlzfH0L96PXP8rJCpZ5P8q20qjT7o5kDGkPjrfQTH3j+RJYALv6IYRF8qFyE2ac2BxYfaWZ9oDloSmcHg4NnqkhzNlCOfu5C0kUznrurd99yQgiRyXoAX4zN7YQGa24IiIsAX7ot6cOD0kHnpWs3FcktDbI6lB6J6KrMYtag7JXK8UO8pR8oiJld6GXjqAkhflt3YslMq1NuEPNR+swsnI5uLmfB91+yimmVINOWHhmqzNll2xOEHaJvvayIxb1ZAbUy8/ui1lX273wNm0UrbXz7+rjx/xak3O9VT5KAxCqiMyozYldUXfrtTu5AuoSF3NeqVLtuY8Sf2o211scv
x-ms-exchange-transport-forked: True
Content-ID: <B7813159EE44494DBD5AFCEFC224F1E1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d26310-4b0d-4f51-dfd0-08d8089b74c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 15:25:04.2706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBPKDitG0URxnRwZ0007+S9pZ6orQqIh2piP47gVwpD5qhuaVdJkiOW/SqaRVVwEm9gp7IX/ddjzjq06B+sZyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3239
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_082518_137387_C18BFA6F 
X-CRM114-Status: GOOD (  19.96  )
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

On 6/3/20 12:58 PM, Adhemerval Zanella via Libc-alpha wrote:
> 
>>
>> diff --git a/config.h.in b/config.h.in
>> index dea43df438f6..08962dfed075 100644
>> --- a/config.h.in
>> +++ b/config.h.in
>> @@ -109,6 +109,9 @@
>>  /* AArch64 big endian ABI */
>>  #undef HAVE_AARCH64_BE
>>  
>> +/* ARC big endian ABI */
>> +#undef HAVE_ARC_BE
>> +
> 
> Why do you need this define exactly? It is not used anywhere in the code
> and for C code if is more straightforwar to use endian.h.

It is used in build system as part of "formal" BE ABI support as pointed to in v4
series review. This specific thing helps choose the right dynamic linker name for
BE case.

$ git grep HAVE_ARC_BE
config.h.in:113:#undef HAVE_ARC_BE
sysdeps/arc/configure:175:  $as_echo "#define HAVE_ARC_BE 1" >>confdefs.h
sysdeps/arc/configure.ac:22:  AC_DEFINE(HAVE_ARC_BE)
sysdeps/unix/sysv/linux/arc/shlib-versions:3:%ifdef HAVE_ARC_BE

I looked at other ports and they seem to follow similar patters: csky for CSKYABI,
riscv for RISCV_ABI_XLEN etc.

But I can rework if there's a simpler/better way.

>> +++ b/sysdeps/arc/Versions
>> @@ -0,0 +1,8 @@
>> +libc {
>> +  GLIBC_2.32 {
>> +    __mcount;
>> +  }
> 
> Hum, does ARC require a different symbol name than the one provided
> by gmon/Versions?

ARC gcc generates __mcount and _mcount with different ABIs and we use the newer
__mcount.

>> +AC_DEFINE(PI_STATIC_AND_HIDDEN)
>> +libc_cv_have_sdata_section=no
> 
> The libc_cv_have_sdata_section is done by configure.ac, why do you need
> to explicit set it here?

We inhibit small data explicitly which by default kicks in.

>> +if test $libc_cv_arc_be = yes; then
>> +  # For shlib-versions.
>> +  AC_DEFINE(HAVE_ARC_BE)
>> +  LIBC_CONFIG_VAR([default-abi], [ilp32_be])
>> +else
>> +  LIBC_CONFIG_VAR([default-abi], [ilp32])
>> +fi
> 
> The ilp32 naming is usually set for ILP32 architectures that uses 
> 64-bit registers type on 32 bit VMA (for instance mips64n32, x32,
> or aarch64_ilp32).  I don't think this is the case for ARC, so I think
> this naming might be confusing.
>> +abi-variants := ilp32 ilp32_be

arcle arcbe ?

>> +
>> +ifeq (,$(filter $(default-abi),$(abi-variants)))
>> +$(error Unknown ABI $(default-abi), must be one of $(abi-variants))
>> +endif
>> +
>> +abi-ilp32-condition	:= !defined __BIG_ENDIAN__
>> +abi-ilp32_be-condition	:= defined __BIG_ENDIAN__
> 
> Ok with the 'ilp32' naming module described above.


>> diff --git a/sysdeps/unix/sysv/linux/arc/Versions b/sysdeps/unix/sysv/linux/arc/Versions
>> new file mode 100644
>> index 000000000000..292f1974b02a
>> --- /dev/null
>> +++ b/sysdeps/unix/sysv/linux/arc/Versions
>> @@ -0,0 +1,16 @@
>> +ld {
>> +  GLIBC_PRIVATE {
>> +    # used for loading by static libraries
>> +    _dl_var_init;
>> +  }
>> +}
>> +libc {
>> +  GLIBC_2.32 {
>> +    _flush_cache;
>> +    cacheflush;
>> +  }
>> +  GLIBC_PRIVATE {
>> +    # A copy of sigaction lives in libpthread, and needs these.
>> +    __default_rt_sa_restorer;
>> +  }
>> +}
> 
> Afaik all other ABIs that requires the sa_restores uses a local symbol in
> libpthread. I don't have a strong preference here.

Do you mean add following to sysdeps/unix/sysv/linux/arc/Makefile

ifeq ($(subdir),nptl)
libpthread-routines += sigrestorer
libpthread-shared-only-routines += sigrestorer
endif

And that is to optimize the reference to restorer as a direct PC relative access
vs a got reference ?

It seems even in libc, this is currently not optimal. It seems we need
libc_hidden_* on restorer.

0002b020 <__GI___libc_sigaction>:
 2b020: std.aw	r14r15,[sp,-8]
 2b024: push_s	r13
 2b026: sub_s	sp,sp,0x28
...
 2b02e: mov_s	r3,r1
 2b030: ld r13,[pcl,0xd4e9c] <__default_rt_sa_restorer@@GLIBC_PRIVATE+0xd4558>



>> diff --git a/sysdeps/unix/sysv/linux/arc/shlib-versions b/sysdeps/unix/sysv/linux/arc/shlib-versions
>> new file mode 100644
>> index 000000000000..343c0a04500e
>> --- /dev/null
>> +++ b/sysdeps/unix/sysv/linux/arc/shlib-versions
>> @@ -0,0 +1,7 @@
>> +DEFAULT                 GLIBC_2.32
>> +
>> +%ifdef HAVE_ARC_BE

This is where the BE define is used.

>> +ld=ld-linux-arceb.so.2
>> +%else
>> +ld=ld-linux-arc.so.2
>> +%endif

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
