Return-Path: <SRS0=zsFq=7J=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62905C433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 May 2020 22:16:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBD23206F1
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 May 2020 22:16:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="onw8DwyY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dVUNGdMm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="k64J59re"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBD23206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q17c7IvtduRVumgOm/NvBsfxRoOIJ7d2XATeQh86buE=; b=onw8DwyYKIVQIj
	QxkihfuqGDsLyM5+0w+O6JBF9oRQTz6Cku9I1FfaG4dJH8EdbD5RElykzIyJ0+eo+ZZalMgLwpVQ4
	9h7MhnqvUhMlStExYIk8MM1kUVaUqfHw/07rfcsK3ydRF+VeWPIAo/1NWp3PLelzzRoCmkHCdeUbL
	sE2M7kK6MIjRxC2JkS4blb7aa22HgUdHuKviE6KHJTWitMmbCzifiULWs/5qbUhJxrNTMuxPwwAf8
	JQZBnwjDOHaKHZSeW8FDjF+/U/MteHTCZkS+mLdIQULInijmhbIjafBgqzJQDJrBOaKgYtRWlc3y1
	y4Km7KLbnYGguaGNlwJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1je4L7-0007bM-I1; Wed, 27 May 2020 22:15:57 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1je4L3-0007ao-VG
 for linux-snps-arc@lists.infradead.org; Wed, 27 May 2020 22:15:56 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C089EC00A5;
 Wed, 27 May 2020 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590617752; bh=xEbHQjk2lASZnIG5Jatr+LzhtifdGkzxMVYIdIvYdq0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=dVUNGdMmShu458qr+NX7EHO5ya/fYKOPlsLhli+6wGhSRn36ARn6zcfvDwxw9V5HW
 lCTPhcvN0PX2S0pUsTTYm+Y9D++uMxLZuabeMpmldG2IQAcHA5BU230PehQE4oRrH1
 6XgzDSDKdA4bsMzSz/FQn51nTmKodgYy0BAOT8EqApLRiy9rFnSfOilQN0P+49begn
 CqfJGZlPmFz5CwAwI4IbcpHhR1xtBca7sAqdSErRJean2/lrA14egcBSj/twZ0wlEK
 2eX/I8YO9c5XnPu41LonhsxErsvW3K11oSnKIWO1Kf8+SzsgCA0vyeK8ZD1FJU5jsS
 ehnAjq5iUv7rA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E4CAAA0083;
 Wed, 27 May 2020 22:15:49 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 May 2020 15:15:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 27 May 2020 15:15:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WC8HJeOuJpCQ/BweJsJ8l5SewFcLd34FpVgxnudK9b1e8t1wo/gn2AKjinaNQxh0WO7vWfYOVvmjPF7FH6vbQAE5rjh4Ymsdkoq6wHRz0tpseWRXpxzfApaKEr7+xmJ9Jv2oH189hlD1LQJlk6AUCCUmQvlBPNIUIoLPBs0Nbpon2iy3dXy4bhdI3YYIBv8tQRM95PG3KAgkk9eZLk8Fe5kkgg1yoTgQIV3NLM3894YLrg8GA5HjqFRjx6/JCL2lLrWCiM04lTfyNucli/fZHkIJu5eItU5JE3SAMWt6CWVa7guxaQsms2Qo8rk0vtLygFi50GSqQgrxX6WJd6n3kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEbHQjk2lASZnIG5Jatr+LzhtifdGkzxMVYIdIvYdq0=;
 b=j6YdOBWpXFLT/vy7pQlNSow7wkyfws8uJGr40GYcml53M7JfspG74PtEMGw702ksV6ZXLl+8kDcVwm55w84a/cO9PylhujydFYnasyMA3SUReSOZPFQt13R3ZXC3fXYMerP6tslN/t9GaAsBixa4Q7PSrnqFv8Y+iFaK5LU+oQb1CcArYf9yCHvV6iRZLz2MSl360l6dGj+ONBnO6HPvXY4Hj1lEoD4OjDu6ERN87V6UJoKTp34EXiU30NOx2NFnrA25hbBpXUmRNGILfKZCi9GLek18y2F3EI9ihJgO1OGZJRFDs68ai39f+uDVLcOHFJhLwUkFWQzFrGo+ktSa3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEbHQjk2lASZnIG5Jatr+LzhtifdGkzxMVYIdIvYdq0=;
 b=k64J59reb+JOFQ3Zc3a31yXShmxv1AZZdMDcAePY0f7geNsPMv9JjQmpzjuMvippAPhgc90pUsTEsYCSU38M8HLwC+wK28y7vXGz4xchLejifZVIPYi880v432ORLDtyPIHiU4JApFC2OnhhZs/DL4UFnt7IRP9TGYodbVvtC08=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2645.namprd12.prod.outlook.com (2603:10b6:a03:61::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Wed, 27 May
 2020 22:15:29 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3021.030; Wed, 27 May 2020
 22:15:29 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v6 01/13] ARC: ABI Implementation
Thread-Topic: [PATCH v6 01/13] ARC: ABI Implementation
Thread-Index: AQHWNHRUZB/yK5sq0U6kMk4LJ9e8tw==
Date: Wed, 27 May 2020 22:15:29 +0000
Message-ID: <f36112c7-b7d6-243a-73eb-74d5b3772135@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-2-vgupta@synopsys.com>
 <88508d10-2d29-026a-bb54-ad607154ab87@linaro.org>
In-Reply-To: <88508d10-2d29-026a-bb54-ad607154ab87@linaro.org>
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
x-ms-office365-filtering-correlation-id: 16d561c6-7d10-42bd-65d8-08d8028b774f
x-ms-traffictypediagnostic: BYAPR12MB2645:
x-microsoft-antispam-prvs: <BYAPR12MB2645F6FD22336DBAA4A4BF01B6B10@BYAPR12MB2645.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fLjNIG3BExSFodleNzb9L90QeaEv+0k1ZlDrRnxVhEb0BXKIQqfRdOUNSZlgZHcYdj8XGVT8AJ6kdrk4GJxXN7dIMyGNYgt3uy/UOKXonN6+Pdceh5VPcN2zsoRo9Lffnj9sba/7ZHbBvWdynJP5CnlS+4qaPSMK2qbO249PFnt+Hh50mDflO+zfj9S0I8tvtIQXdHpd8B/ZaKR4FQgX447eXvLsPDOm5XiUyoxHxLCRq27jZjdghGPtGbwqXwtc1HHTw2ialtlf9kEtEdGsKH/FWg38eEmly36aLmyQYnTVovtk2BBLcoAhIiBEboWWq0/BKClHrBIUAOlGM183xy2f2So9gkjxNpUfMFhxV/nS8JmnfnIHuKypJ1+1NbNPp35GLpnF8aj1NqYsXjBkwfb1hwMVIpNNd21EpIQPRcZT8O1THGd4mCCNhwBfzFfSBJWkyC4aR/s/3PaTzqu6yHEKBSjArJh8Q5qtt5PUx5xu523kFPoaZB7bYygvAJvg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(366004)(39860400002)(346002)(396003)(136003)(66556008)(66446008)(76116006)(186003)(53546011)(8676002)(8936002)(6512007)(86362001)(66946007)(478600001)(31686004)(5660300002)(6506007)(83380400001)(316002)(64756008)(31696002)(4326008)(6486002)(66476007)(30864003)(36756003)(2906002)(110136005)(2616005)(71200400001)(21314003)(2004002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Y5o/Cg5L9Xmhd/2K6LpenirOwnejeC6ZjZcJC1cSnQW484fx/Ap2z+EZFXmMX0dKirbgC/ABPKWPmHoDu5C556U5O9sHvlpM02DUKX+Q/QxL8xg5uVUSeJwrb7RHZlsSiTQx2ferOozKxmtOa9HZuDra/JOZ9jPODFhFcDv2+Xqr7fDAR4I91zQUZCsfJr0TT0wczcKSp508T3cgOMP78mPISkB4Gzs84AM2sf7fCigOqIS3/QMt0oJ2EOgA77Eu7sfkmC7/8+Xyy13u3l1Y/FJXqSqklCOSA82B6SqmGwN4oGLf3oJt/701s1R1Kv/KelNWO4ezj1NwZ2Ln53KBCW2uXXHkdh9AuWgAvUYLu5lBQ+DBG7mKTfOz1ydNVvkPnBxM56H+4t1YnYUacCO59DOdzyA74zOujDQJSkW8IuzMcvH2edh/iYkGDUuBL0TLtrISHws5oWmSN4nneTh2NV36QXJu/VMjB9UTL6im/tvd74ny36gwSex75pO2Qy8OpwLJSZdu2dEt5rJQg5kCok9ybLLPDSDlPm9AG3CbxoGgZDGq718mJkz/Jix4KdWr
x-ms-exchange-transport-forked: True
Content-ID: <5375AC73294956479F11A6566DA52CB6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d561c6-7d10-42bd-65d8-08d8028b774f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 22:15:29.6468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 87xNlVVmpRvwRjsswVmJnCyzoHd93sqFWqUJEEI+Cv6yXBfbTI4p9j7ENF4qzpht/KKzRxefwabAm2NgRd6Hlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2645
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_151554_140860_E93ED298 
X-CRM114-Status: GOOD (  25.55  )
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

On 5/27/20 11:26 AM, Adhemerval Zanella via Libc-alpha wrote:
> 
> 
> On 22/04/2020 22:41, Vineet Gupta via Libc-alpha wrote:
>> This code deals with the ARC ABI.
>>
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> 
> We do not use DCO, but rather copyright assignment.

Right, removed that now.

> Looks ok in general, with some comments below.

Thx for taking a look.

>> +;@ r1 = value that setjmp( ) will return due to this longjmp
> 
> Since all .S files are processed by gcc assembly implementation usually
> use C style comment (/* ... */). Same applies to other assembly
> implementations.

OK, I can update throughout, although I like the small assembler comments which
are on the same line.


>> diff --git a/sysdeps/arc/dl-runtime.c b/sysdeps/arc/dl-runtime.c
>> new file mode 100644
>> index 000000000000..b28da38329f1
>> --- /dev/null
>> +++ b/sysdeps/arc/dl-runtime.c
>> @@ -0,0 +1,33 @@
>> +/* dl-runtime helpers for ARC.
>> +   Copyright (C) 2017-2020 Free Software Foundation, Inc.
>> +   This file is part of the GNU C Library.
>> +
>> +   The GNU C Library is free software; you can redistribute it and/or
>> +   modify it under the terms of the GNU Lesser General Public License as
>> +   published by the Free Software Foundation; either version 2.1 of the
>> +   License, or (at your option) any later version.
>> +
>> +   The GNU C Library is distributed in the hope that it will be useful,
>> +   but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> +   Lesser General Public License for more details.
>> +
>> +   You should have received a copy of the GNU Lesser General Public
>> +   License along with the GNU C Library.  If not, see
>> +   <https://www.gnu.org/licenses/>.  */
>> +
>> +/* PLT jump into resolver passes PC of PLTn, while _dl_fixup expects the
>> +   address of corresponding .rela.plt entry.  */
>> +
>> +#define reloc_index						\
>> +({								\
>> +  unsigned long int plt0 = D_PTR (l, l_info[DT_PLTGOT]);	\
>> +  unsigned long int pltn = reloc_arg;				\
>> +  /* Exclude PLT0 and PLT1.  */					\
>> +  unsigned long int idx = ((pltn - plt0) / 16) - 2;		\
>> +  idx;								\
>> +})
>> +
>> +#define reloc_offset reloc_index * sizeof (PLTREL)
>> +
>> +#include <elf/dl-runtime.c>
> 
> Ok, although this kid of macro are really error-prone: it relies on
> not specified arguments (l, reloc_arg) and its variable definition might
> clash.
> 
> I wonder if it would be better to refactor both reloc_index and
> reloc_offset to inline function that might be overriden by the
> architecture where required. Something like:
> 
> diff --git a/elf/dl-runtime.c b/elf/dl-runtime.c
> index cf5f1d3e82..62f9057937 100644
> --- a/elf/dl-runtime.c
> +++ b/elf/dl-runtime.c
> @@ -27,6 +27,7 @@
>  #include "dynamic-link.h"
>  #include <tls.h>
>  #include <dl-irel.h>
> +#include <dl-runtime.h>
>  
>  
>  #if (!ELF_MACHINE_NO_RELA && !defined ELF_MACHINE_PLT_REL) \
> @@ -42,13 +43,6 @@
>  # define ARCH_FIXUP_ATTRIBUTE
>  #endif
>  
> -#ifndef reloc_offset
> -# define reloc_offset reloc_arg
> -# define reloc_index  reloc_arg / sizeof (PLTREL)
> -#endif
> -
> -
> -
>  /* This function is called through a special trampoline from the PLT the
>     first time each PLT entry is called.  We must perform the relocation
>     specified in the PLT of the given shared object, and return the resolved
> @@ -68,8 +62,11 @@ _dl_fixup (
>      = (const void *) D_PTR (l, l_info[DT_SYMTAB]);
>    const char *strtab = (const void *) D_PTR (l, l_info[DT_STRTAB]);
>  
> +  const uintptr_t pltgot = (uintptr_t) D_PTR (l, l_info[DT_PLTGOT]);
> +
>    const PLTREL *const reloc
> -    = (const void *) (D_PTR (l, l_info[DT_JMPREL]) + reloc_offset);
> +    = (const void *) (D_PTR (l, l_info[DT_JMPREL])
> +		      + reloc_offset (pltgot, reloc_arg));
>    const ElfW(Sym) *sym = &symtab[ELFW(R_SYM) (reloc->r_info)];
>    const ElfW(Sym) *refsym = sym;
>    void *const rel_addr = (void *)(l->l_addr + reloc->r_offset);
> @@ -182,7 +179,8 @@ _dl_profile_fixup (
>  
>    /* This is the address in the array where we store the result of previous
>       relocations.  */
> -  struct reloc_result *reloc_result = &l->l_reloc_result[reloc_index];
> +  struct reloc_result *reloc_result
> +    = &l->l_reloc_result[reloc_index (reloc_arg, sizeof (PLTREL))];
>  
>   /* CONCURRENCY NOTES:
>  
> @@ -219,8 +217,11 @@ _dl_profile_fixup (
>  	= (const void *) D_PTR (l, l_info[DT_SYMTAB]);
>        const char *strtab = (const char *) D_PTR (l, l_info[DT_STRTAB]);
>  
> +      const uintptr_t pltgot = (uintptr_t) D_PTR (l, l_info[DT_PLTGOT]);
> +
>        const PLTREL *const reloc
> -	= (const void *) (D_PTR (l, l_info[DT_JMPREL]) + reloc_offset);
> +	= (const void *) (D_PTR (l, l_info[DT_JMPREL])
> +			  + reloc_offset (pltgot, reloc_arg));
>        const ElfW(Sym) *refsym = &symtab[ELFW(R_SYM) (reloc->r_info)];
>        const ElfW(Sym) *defsym = refsym;
>        lookup_t result;
> @@ -489,7 +490,8 @@ _dl_call_pltexit (struct link_map *l, ElfW(Word) reloc_arg,
>       relocations.  */
>    // XXX Maybe the bound information must be stored on the stack since
>    // XXX with bind_not a new value could have been stored in the meantime.
> -  struct reloc_result *reloc_result = &l->l_reloc_result[reloc_index];
> +  struct reloc_result *reloc_result =
> +    &l->l_reloc_result[reloc_index (reloc_arg, sizeof (PLTREL))];
>    ElfW(Sym) *defsym = ((ElfW(Sym) *) D_PTR (reloc_result->bound,
>  					    l_info[DT_SYMTAB])
>  		       + reloc_result->boundndx);
> diff --git a/elf/dl-runtime.h b/elf/dl-runtime.h
> new file mode 100644
> index 0000000000..901249f912
> --- /dev/null
> +++ b/elf/dl-runtime.h
> @@ -0,0 +1,11 @@
> +static inline uintptr_t
> +reloc_offset (uintptr_t plt0, uintptr_t pltn)
> +{
> +  return pltn;
> +}
> +
> +static inline uintptr_t
> +reloc_index (uintptr_t pltn, size_t size)
> +{
> +  return pltn / size;
> +}
> diff --git a/sysdeps/hppa/dl-runtime.c b/sysdeps/hppa/dl-runtime.c
> index 885a3f1837..2d061b150f 100644
> --- a/sysdeps/hppa/dl-runtime.c
> +++ b/sysdeps/hppa/dl-runtime.c
> @@ -17,10 +17,6 @@
>     Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
>     02111-1307 USA.  */
>  
> -/* Clear PA_GP_RELOC bit in relocation offset.  */
> -#define reloc_offset (reloc_arg & ~PA_GP_RELOC)
> -#define reloc_index  (reloc_arg & ~PA_GP_RELOC) / sizeof (PLTREL)
> -
>  #include <elf/dl-runtime.c>
>  
>  /* The caller has encountered a partially relocated function descriptor.
> diff --git a/sysdeps/hppa/dl-runtime.h b/sysdeps/hppa/dl-runtime.h
> new file mode 100644
> index 0000000000..dc12fd1071
> --- /dev/null
> +++ b/sysdeps/hppa/dl-runtime.h
> @@ -0,0 +1,12 @@
> +/* Clear PA_GP_RELOC bit in relocation offset.  */
> +static inline uintptr_t
> +reloc_offset (uintptr_t plt0, uintptr_t pltn)
> +{
> +  return pltn & ~PA_GP_RELOC;
> +}
> +
> +static inline uintptr_t
> +reloc_index (uintptr_t pltn, size_t size)
> +{
> +  return (pltn & ~PA_GP_RELOC )/ size;
> +}
> diff --git a/sysdeps/x86_64/dl-runtime.c b/sysdeps/x86_64/dl-runtime.h
> similarity index 60%
> rename from sysdeps/x86_64/dl-runtime.c
> rename to sysdeps/x86_64/dl-runtime.h
> index b625d1e882..494ff47b70 100644
> --- a/sysdeps/x86_64/dl-runtime.c
> +++ b/sysdeps/x86_64/dl-runtime.h
> @@ -3,7 +3,14 @@
>     also use the index.  Therefore it is wasteful to compute the offset
>     in the trampoline just to reverse the operation immediately
>     afterwards.  */
> -#define reloc_offset reloc_arg * sizeof (PLTREL)
> -#define reloc_index  reloc_arg
> +static inline uintptr_t
> +reloc_offset (uintptr_t plt0, uintptr_t pltn)
> +{
> +  return pltn * sizeof (ElfW(Rela));
> +}
>  
> -#include <elf/dl-runtime.c>
> +static inline uintptr_t
> +reloc_index (uintptr_t pltn, size_t size)
> +{
> +  return pltn;
> +}

Indeed looks much sane now. Do you want me to break out this code as a separate
patch, ahead of the series ?

>> +
>> +.macro RESTORE_CALLER_SAVED_BUT_R0
>> +	ld.ab	blink,[sp, 4]
>> +	cfi_adjust_cfa_offset (-4)
>> +	cfi_restore (blink)
>> +	ld.ab	r9, [sp, 4]
>> +	ld.ab	r8, [sp, 4]
>> +	ld.ab	r7, [sp, 4]
>> +	ld.ab	r6, [sp, 4]
>> +	ld.ab	r5, [sp, 4]
>> +	ld.ab	r4, [sp, 4]
>> +	pop_s   r3
>> +	pop_s   r2
>> +	pop_s   r1
>> +	cfi_adjust_cfa_offset (-36)
>> +.endm
>> +
>> +/* Upon entry, PLTn, which led us here, sets up the following regs
>> +	r11 = Module info (tpnt pointer as expected by resolver)
>> +	r12 = PC of the PLTn itself - needed by resolver to find
>> +	      corresponding .rela.plt entry.  */
>> +
>> +ENTRY (_dl_runtime_resolve)
>> +	; args to func being resolved, which resolver might clobber
>> +	SAVE_CALLER_SAVED
>> +
>> +	mov_s 	r1, r12
>> +	bl.d  	_dl_fixup
>> +	mov   	r0, r11
>> +
>> +	RESTORE_CALLER_SAVED_BUT_R0
>> +	j_s.d   [r0]    /* r0 has resolved function addr.  */
>> +	pop_s   r0      /* restore first arg to resolved call.  */
>> +	cfi_adjust_cfa_offset (-4)
>> +	cfi_restore (r0)
>> +END (_dl_runtime_resolve)
> 
> Ok, although I am not seeing why exactly you need asm macros here.

Yes this is just a relic of code from the past, I can opencode it.

>> diff --git a/sysdeps/arc/gccframe.h b/sysdeps/arc/gccframe.h
>> new file mode 100644
>> index 000000000000..5d547fd40a6c
>> --- /dev/null
>> +++ b/sysdeps/arc/gccframe.h
>> @@ -0,0 +1,21 @@
>> +/* Definition of object in frame unwind info.  ARC version.
>> +   Copyright (C) 2017-2020 Free Software Foundation, Inc.
>> +   This file is part of the GNU C Library.
>> +
>> +   The GNU C Library is free software; you can redistribute it and/or
>> +   modify it under the terms of the GNU Lesser General Public
>> +   License as published by the Free Software Foundation; either
>> +   version 2.1 of the License, or (at your option) any later version.
>> +
>> +   The GNU C Library is distributed in the hope that it will be useful,
>> +   but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> +   Lesser General Public License for more details.
>> +
>> +   You should have received a copy of the GNU Lesser General Public
>> +   License along with the GNU C Library.  If not, see
>> +   <https://www.gnu.org/licenses/>.  */
>> +
>> +#define FIRST_PSEUDO_REGISTER 40
>> +
>> +#include <sysdeps/generic/gccframe.h>
> 
> Ok.
> 
>> diff --git a/sysdeps/arc/jmpbuf-offsets.h b/sysdeps/arc/jmpbuf-offsets.h
>> new file mode 100644

>> +
>> +/* Callee Regs.  */
>> +#define JB_R13 0
>> +#define JB_R14 1
>> +#define JB_R15 2
>> +#define JB_R16 3
>> +#define JB_R17 4
>> +#define JB_R18 5
>> +#define JB_R19 6
>> +#define JB_R20 7
>> +#define JB_R21 8
>> +#define JB_R22 9
>> +#define JB_R23 10
>> +#define JB_R24 11
>> +#define JB_R25 12

I'll probably drop these as these are not used anyways. Also will help declutter
on the next architecture where the ABI for callee regs is changed from r13-25 to
r14-r26.

>> +
>> +/* Frame Pointer, Stack Pointer, Branch-n-link.  */
>> +#define JB_FP  13
>> +#define JB_SP  14
>> +#define JB_BLINK  15
>> +
>> +/* We save space for some extra state to accommodate future changes
>> +   This is number of words.  */
>> +#define JB_NUM	32
>> +
>> +/* Helper for generic ____longjmp_chk.  */
>> +#define JB_FRAME_ADDRESS(buf) ((void *) (unsigned long int) (buf[JB_SP]))
> 
> Ok.
> 

>> diff --git a/sysdeps/arc/memusage.h b/sysdeps/arc/memusage.h

>> +
>> +#define GETSP() ({ register uintptr_t stack_ptr asm ("sp"); stack_ptr; })
>> +
>> +#define uatomic32_t unsigned int
> 
> Not sure if this is really required now that we are moving to C11 atomic
> model withing glibc itself. Maybe we could just use uint32_t on
> malloc/memusage.c and rely on atomic macros instead.

But that would be much bigger change, and orthogonal to the port. So perhaps we
add it for now and then do the bigger/sweeping change.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
