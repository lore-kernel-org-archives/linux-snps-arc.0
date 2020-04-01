Return-Path: <SRS0=CVFw=5R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4BBC43331
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Apr 2020 00:45:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F748208E0
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Apr 2020 00:45:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J+hsobtP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QEJDOo8/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AkveyNF8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F748208E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bu8vy7dm3gio3XZrp2Bc5oao2JSM9Qz7nzx9sT+EaLE=; b=J+hsobtPqjlOIJ
	bUHu8417BNuXzsBTNIWIutghK5kUOtMhejg0R+RdiyJfRnyVfAB8mnI1zlkD9DkSrt+5wpbzTox9l
	ZCmlI0X4vqYATWxJXndo1ERQWCLoiTg37BIOfP0MhhvNxxglP0JGI/aG8qAvvHmJL0PEa1GF6gFUP
	PaqhF2/UtlU8aF2jvS2wdoq1PYumfmfq+2Hz1UAwVvrXUxjiEjlr9kuRfE/c2GzJgFGUK2SRGD8BB
	vTAhXPbibZ6qr4xUxethS/1meYHhtZPj2ewSeclPxEbHGj6Fa6k7EAhO4qw61U3PzjDSluAmIHuhg
	aIs7IHN85l7rlW8DrFoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJRVH-00064r-Rn; Wed, 01 Apr 2020 00:45:11 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJRVD-0004gq-Sv
 for linux-snps-arc@lists.infradead.org; Wed, 01 Apr 2020 00:45:10 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6180E4056F;
 Wed,  1 Apr 2020 00:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585701905; bh=62jScEl1LNk3GsqLJdb1i4cEFfhosDU1r34t07+MewY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=QEJDOo8/V1CGYwgaGqv3v70VAK3AOkNXAnd4DZIcSL6jsLuzpjLwmDWQw9OGeHiuC
 V3EGP4Tb9FM6ggjsnz78241Urp4rIrkt6ikzoAv8hQaXC4mLiVPy1hSdbjkvPfIX9a
 VTGv3APGM7pCmztFM4DPrYzzqIEzDmNi7SEAds7A4BkaTISvtLGaSg5thtFk6Bkpkz
 /AVNL/MywjOmSNND1wzgDGsfS9AdLWZ3PrtvIDzjIWSLUn17rtbcZbLSfvsF0TWKXO
 7CzjLTEwKV3JlTWkh2ZeN/AwgTYTIMgvT9gz+nki2H/KfAOsXUbb++qZN25U9ZKorg
 SNSkEjAZBfAmg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 014B0A0070;
 Wed,  1 Apr 2020 00:45:04 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 31 Mar 2020 17:44:20 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 31 Mar 2020 17:44:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQjRNE8IHaom7jX7fvY3usWzaiB2uuKXkU3IVZZe/BhouH5t0imU2/d/2snIT3aDBSCFpoGKGOC6FUAx7kpS2tcU0lJUa3LMYJTg+NKQQaHtqhkGgdQLa+tG0OOPThh3Hx4zM5U0VI2qf+lFfICGsQ1re907uWBFAhSaVWHs1j/Md/iGg6jA7OwHzD+ecauvZ5pY0xDCeBVMScg6wDf/lPtERYBgB2ji9XE7SPPU8ZLDte6VR/j/UqL7qsNA9rYlEyUNgxojJKxralFKl2rxIQGj5CT79GE7SWJqsuA5UpB+0rSjmeexJfW5BNMva31+639AeevVQ87GzNyqyJ33xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62jScEl1LNk3GsqLJdb1i4cEFfhosDU1r34t07+MewY=;
 b=Kpz6fpAZdpaUt+MHB7C2iZO1vNZKIpcR3WpVvjOhD7oyMli0F56DfO9a9uylR6FUJHEGLOAeU0CmeEo9ohJJb5Em6ZkmHJlRh7mDTk48AsSiSGGPEiQfysYyxGdwo3ZTK0spv9/2RwayvDJz4hC78scOn+gnyAbDooJIcc/QstCQdJDZcYtxmrDG0sTULY0U++ismNzXX++J8u+H/SMe+j/y/D5Bx8ZLctrgAPzRVfU2NppeBeeXA+drL6jTBipcJ1X6nHWoRtOImeHkUlbfW1PQa5VtCRwBSH9d3pIlMuTZyZrqW0N5Ux/J8z+RYtINg4CQrNz8mowmCM1yfvslrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62jScEl1LNk3GsqLJdb1i4cEFfhosDU1r34t07+MewY=;
 b=AkveyNF8s0jGQ15/KHa+5KJp7VkmjUaMx3Dci6GBpzNbSdhtOrLwcwYuXHFWs0hxOV2s+wyWaCixc+DHH8uw1v3DPv+scwj/9vEM2I/7cb846+p/GhtHV9lR8XbmcX0DUL9d7vIrcUPt4lICCoRVU+94ab7IA7sGzuFA2eE+teA=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3638.namprd12.prod.outlook.com (2603:10b6:a03:dc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Wed, 1 Apr
 2020 00:44:15 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 00:44:15 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: __syscall_error (was Re: [PATCH v4 13/15] ARC: Build Infrastructure)
Thread-Topic: __syscall_error (was Re: [PATCH v4 13/15] ARC: Build
 Infrastructure)
Thread-Index: AQHWB76r442emsqWgUWhjf9688nTzQ==
Date: Wed, 1 Apr 2020 00:44:15 +0000
Message-ID: <3b5edadd-b29d-f138-c440-ed6d38da6a67@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-14-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003272238480.5132@digraph.polyomino.org.uk>
 <86b7b480-da30-3eb4-3e1d-1d8785604770@synopsys.com>
 <57eeeac6-75d2-05c9-f1fe-bb642329ca77@synopsys.com>
 <alpine.DEB.2.21.2003312246280.30236@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003312246280.30236@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [24.7.46.224]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be5d4710-a41b-4172-4fe8-08d7d5d5cda7
x-ms-traffictypediagnostic: BYAPR12MB3638:
x-microsoft-antispam-prvs: <BYAPR12MB3638621E30578F1DC656CB4EB6C90@BYAPR12MB3638.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(366004)(136003)(376002)(346002)(396003)(31686004)(36756003)(64756008)(186003)(6916009)(66556008)(66946007)(66446008)(2906002)(66476007)(76116006)(26005)(2616005)(6512007)(316002)(478600001)(8936002)(81156014)(5660300002)(71200400001)(31696002)(8676002)(6506007)(54906003)(86362001)(81166006)(4326008)(53546011)(6486002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hPZcAkOzFuPMQ6SVgSzImLOH/t2rT7gxeBaHX8skGm9i6Te9lz32YpljKq9PteY4JLGt8+AWXdM9TGJiXrnYe/BLJvO2pCVe/Q0lCiTruyY85nc1giX7/hydx+a4Q8HKjy6w694zWSnZ9u44ZQx3HBvfQxOIdZsIKAfWi3aRSFee7uizYL4rKVGZIuObCPsxaDL3LP9LFj0ayzJgi+yBYDN1dHKZ9lbT6W+5WBdsJI6LNUBziFgbjprflC7J7nC7Kj4oJCGBF85+o9PHntyRB/jVw9QW2PEbQ+7s8Jb20u3GycUvV5bWIuUweS6Z1QGrzXo76q1hdEOEUxIH3W0Xa6gZCTEDsipG2J4t7okYK6/o+D1ZTmr1eh4VQX6zSTJFyPhrrFBSpxLvmU/opij6sC0ACwdzt1NyICvglPDZZu+E1kB5rNxUHlGvpOciX6sM
x-ms-exchange-antispam-messagedata: 8ed/eGuxYAAv4rS/S9uLzjFzvz2FVaqcQDpWCpFAzBsn9+HdKPPAmreAtjmxmNAkak0XrR5STdrKFmxlmMFv1NETIDWRA3I5JDScqunaTvpLDWoCItmvIMJRCeEXzjCSRMw6Te3AG2m+nmjT5W742g==
x-ms-exchange-transport-forked: True
Content-ID: <51D3B4A3BD86CE4899A771A27FA5AB06@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: be5d4710-a41b-4172-4fe8-08d7d5d5cda7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 00:44:15.0319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pYWSeKwAQXWNYEPFwKO+6kMHCr5ajESCTnE8X5BFUKhIPTHJx6Vc7vWCNWqudsTiRtWBkt2xrc6l6Ym3swORUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3638
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_174508_019864_4EB54D78 
X-CRM114-Status: GOOD (  16.82  )
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

On 3/31/20 3:48 PM, Joseph Myers wrote:
> On Tue, 31 Mar 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> On 3/27/20 11:42 PM, Vineet Gupta via Libc-alpha wrote:
>>>>> +++ b/sysdeps/arc/Versions
>>>>> @@ -0,0 +1,6 @@
>>>>> +libc {
>>>>> +  GLIBC_2.32 {
>>>>> +    __syscall_error;
>>>>
>>>> Why does __syscall_error need a public symbol version?  If it's used by a 
>>>> library other than libc, that means it needs to be exported at some symbol 
>>>> version - but it only needs a public version (as opposed to GLIBC_PRIVATE) 
>>>> if it might be used by user programs linked with glibc (if it's used in 
>>>> crt*.o, lib*_nonshared.a, or inline functions in installed headers, for 
>>>> example - or in libgcc.a, libstdc++.a, etc. (GCC static libraries)).
>>>
>>> We'll historically I've preferred an out-of-line errno setter in the syscall
>>> wrappers and those are used in libpthread et all as well but not expected to be
>>> used by user programs. See my sysdeps.h
>>
>> Ok so this will not be called directly from user programs, but indeed 
>> could end up in non shared libs and/or inline functions in headers, so I 
>> suppose this is fine ?
> 
> What inline function or object in lib*_nonshared.a / crt*.o / GCC static 
> library has a reference to this symbol?
> 
> If there's an inline function referring to this in an installed header, we 
> can consider whether that inline function *should* be referring to it.  
> Similarly if there's a reference in crt*.o / lib*_nonshared.a / GCC static 
> libraries, we can consider if that reference *should* be there or if the 
> function in question should actually be calling some function from libc.so 
> that does the syscall there.

The assembler macros in syscall template for generating wrappers use
__syscall_error (sysdeps/unix/sysv/linux/arc/sysdep.h).

If public Version is removed, I get errors like below:

| arc-glibc-linux-gnu-gcc   -shared -static-libgcc -Wl,-O1  -Wl,-z,defs -Wl,
| -dynamic-linker=/lib/ld-linux-arc.so.2  -Wl,--version-script=/SCRATCH/vgupta
| /gnu/build/glibcs/arc-linux-gnu/glibc/librt.map -Wl,-soname=librt.so.1
|
| ...
| a - mq_setattr.o
| a - librt-cancellation.o
| /SCRATCH/vgupta/gnu/install/compilers/arc-linux-gnu/lib/gcc/arc-glibc-linux-
| gnu/10.0.1/../../../../arc-glibc-linux-gnu/bin/ld: /SCRATCH/vgupta/gnu/build
| /glibcs/arc-linux-gnu/glibc/rt/librt_pic.a(mq_setattr.os): in function
| `mq_setattr':
| /SCRATCH/vgupta/gnu/src/glibc/rt/../sysdeps/unix/syscall-template.S:80:
| undefined reference to `__syscall_error'

And this change goes back to initial port (in 2016) where openssh/libcrypt.so was
failing to link somewhat similarly.

Looking as RISCV code, they opencode __syscall_error for !IS_IN (libc) which I was
hoping to avoid.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
