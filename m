Return-Path: <SRS0=GdQW=7L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28050C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 17:40:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E06AF2065F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 17:40:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RrXO4ufc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="a7XhDnq0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lScvyWkb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E06AF2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUqroDaXNlaAiGc/jfYxrMwN5qKfDCeXHH/bQE8EiO0=; b=RrXO4ufcZIxDK9
	myXjO2BIevVCsuiTnNiLp288VivqI57YK94dfq7W/mhyMIx+50R14FtuWz9Run2dBrD2oDl7yvOPm
	KG9TMcHeQBeEaZRRYgfdSSidnOVwNfobQaXVndt0klxMtjSZf52slujDuGVUeAZiG2HE47kJQIc2N
	wukuo4gM7hgBXoR/yWM+9UQgzJ4LmQnlU5beZjEDL5kdvnyf0UdB0RtW3nc8k/pYPgnWC2ZfiBpJD
	7SKgfme9bTt38Juftxa2CCpPtztcupnYivWakS6o+cTq1vzzTx399D0Mat/RSxe2t/hOLblFLhri5
	Wh3SljaX3eh+Qh4pgOeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeizz-00010E-NH; Fri, 29 May 2020 17:40:51 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeizw-0000z7-5y
 for linux-snps-arc@lists.infradead.org; Fri, 29 May 2020 17:40:49 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5D436C03B4;
 Fri, 29 May 2020 17:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590774046; bh=Bi77x/4AYl7N+EiCTkD8rxSHl1UpFixIpbQbFre/iHE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=a7XhDnq0fFqA8KP+9lUZQlhEKOrWRPmW1M/YdikS9s9G/xsK+No0yQ75+MiZYsiCl
 VFVm2mrhZlR/f3J/tDCfW7+d9BjLn43XPy0MFX10WVfsAh0ppxniTEdmRnROnjgyHZ
 kkdl1yGuUBibfK1IROqYJUXadWsNfvFzQZVC1rHA1pcclPxQeO5QKHDotRUKswgo8O
 mfZrOWOSp7CUbmVroEDEazuecuXczdO2ZtUKZxtBq2KnIDHBpZeaVlEO9q7Gm7bul2
 d1H/1SIBmhvUisyD55f/25qxRhJFEsOR8I0aEIwJfGlVGTjuVj8Zn0X6WMeHbEj7Vg
 X8EmPFACe4cxg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 094C3A006C;
 Fri, 29 May 2020 17:40:43 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 29 May 2020 10:39:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 29 May 2020 10:39:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddpQcTgIaRVx0WIS9I0RDfOuUfG5Ry4+vThrwHPWlnzluW4xGqmaoyRPze5JbDxbHxkwxJKL3qCl/A4beDrHI+vjgEayKLJSkCCZCQQa3oqhzI/OAqhO97wj4/3A5TYkMo3EMJOFEYgNHhJGUy1xBEEZmW2WHQLX/Tp6Lsm8qP1RCDWOSfY7n2ZFz/CkEQvI/3faab/U80tEobTpm1rZ/MjXx740TQeT4vfTQs73M4jd9bc3hPWdYzVUSDwlMaFjO54YGkjxULcFR+MbQ6NCzMsvY0S0jbSJYiOV4Fv1vbVcHLeD+xBBrS2v+PcNbltP9wRWibqfuvnd2qn83EWS5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bi77x/4AYl7N+EiCTkD8rxSHl1UpFixIpbQbFre/iHE=;
 b=l7LzpuXi8xm3AfnpU5B0qzk0ED+q/8O/M1texrZfLclYaM5PRZGW5kqz3hHnP7qexhCXozicjupAcbZAbqW/705EDh1S4cfg9j+ecKL/XtZcsXaWwg6CILgBo8uVaLEe4tmvFvED977Em8VLUv3GZn1Nij1tQsU6AaFBItjhr1+SqM5CTHlD5gbyhg59WS84lBLtAkfb27gALKSecwqLndnykwEXlUq/5gO4EDVySIxI+TESd75p1UD+m0DM83vpso58Vq8vMB0spBG/oC2MKoKS9pijHuxR6OvlrE2HdBZTHyOkwXdLuCFQExm/nZLh31/hrZ/LWg1kWNXFINy+SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bi77x/4AYl7N+EiCTkD8rxSHl1UpFixIpbQbFre/iHE=;
 b=lScvyWkbO3PUflvyOVVd2LisvIcAExq4uuOeNfUgsNOktosvhxuASHxVSuvZ1zFsk4uQ7kzs9g0LtxqdzWov/PukmfJxIlR1s9QH2g7mBzeI+ULNmDfiKht/bWgKw3zLpfLlBYpBIZz1ZbotKpuYlDP8uI/UVfrHI+JhjYIe5RM=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2613.namprd12.prod.outlook.com (2603:10b6:a03:69::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18; Fri, 29 May
 2020 17:39:31 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 17:39:31 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH] dl-runtime: reloc_{offset,index} now functions arch
 overide'able
Thread-Topic: [PATCH] dl-runtime: reloc_{offset,index} now functions arch
 overide'able
Thread-Index: AQHWNShqYa6am3fzK0qtRRD99OhU66i/B1qAgABOioA=
Date: Fri, 29 May 2020 17:39:30 +0000
Message-ID: <0f9ad824-2278-a55b-7203-96497f06c198@synopsys.com>
References: <20200528194345.9829-1-vgupta@synopsys.com>
 <4c346276-085a-6e2d-16a4-c2b88252a74d@linaro.org>
In-Reply-To: <4c346276-085a-6e2d-16a4-c2b88252a74d@linaro.org>
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
x-ms-office365-filtering-correlation-id: 58a1af61-722c-4542-a0a5-08d803f73e4f
x-ms-traffictypediagnostic: BYAPR12MB2613:
x-microsoft-antispam-prvs: <BYAPR12MB261371C49B095F49E039FC36B68F0@BYAPR12MB2613.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PnEt8pSyI0ZiTcn0XQfTEeE8rDc66JDN2mkxYtRy7Vc4/AhynXKtKebZNWisRfyFVXoMnuPGHCu9wU6+w3vgnLepddjhVlBhs3V5M1DKPuYT2H4Zs1PID+dlDWJDF/ezK7TNBF3u1X1/vdQpLx5Zo1hDXfSe+64AM7C6vR1SAxjw/VPFSw6MTFwCZh18on4BdunBU0iRYAAs3hA//LIy782YyiujcGTLQz50IfF6IXsqeMdyRyBNiRh6rji/aYBMIInZ8MbHhl+/pIEHoA8jWyzEcpxq3M3QCiiJApmLyzJVUzGBLwV6ekS1y0EFSWbldtXFEIWnemZ0rzmFZ++06oLYHAyeSRlrJJEvKs9yeKaj7r9kyMzlm6naN1xf4Y2r7KS+erYeTxXG4i1nB4vgEpNVBC9sWupnyOZAMrRxBrjXm9syopv6uL1doP6R82FB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(396003)(136003)(346002)(376002)(39860400002)(6486002)(66446008)(6506007)(53546011)(64756008)(66556008)(66476007)(2906002)(186003)(31686004)(478600001)(31696002)(8676002)(76116006)(110136005)(5660300002)(8936002)(86362001)(66946007)(2616005)(4326008)(36756003)(6512007)(316002)(71200400001)(151773002)(142933001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 1jGqd93+U56Q3UnceCx9+quFwcs3JXsof1sfSJBk937SonBnLqp7v05BJ18nui+anlUUEEOnIUgMJ2GhR5wQBbctHEP6bTGSGO2S7yq1Xey3+lD/SXsZY1blbZB2SUnMTVAE9OBNroLiLYuZIVVQBz2piPLaHUEu1q5hKh0My/ADhQisZMrsRT5SyupAcExWOyQEBJ5djnaY7xAyYWXAa4rauACNqDsHiffCBGgB54ZetdvZ3fnXPzWlhP6yG+lUmOIQXyP/p8AQi74nGxguj3aSOMvd8Os5wfz+ZfK7OUlTdfLefFG/mV5D1NuedQrUNv61RPF3Fjg3BKflf1n4oNL2E5d8G2j0HNcZlHE7EdDlU9swJqATH3Ch/vIJVPdsAHSqVWJeenwBFeZqIvLLso4F6X9tSwgTPPhyqk+q8RJj/rZexkGU2IZL0ZMafJzgJaPPTobBt+skwMu1wNAQoIIInK94/6vMG+EnjCoH8kcB1gqOIBkPgW6xZZpwmc2LQCFwwBQdDiOFAeIWqrZKbvtqHCzud6/eFoT5FwEK0OWTbzJSZmzFXnYT4x6GvCCl
x-ms-exchange-transport-forked: True
Content-ID: <4B94795D936C3B47A483A1C289122556@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a1af61-722c-4542-a0a5-08d803f73e4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 17:39:30.7937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HqIVcsDH1YgHc9goBd/eq0vJWQoXezPboiihLC43IeewftneX2OT519RPUyRLfesMUlRAGfbfxr6tSw5/vzg4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2613
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_104048_354019_865EF5EA 
X-CRM114-Status: GOOD (  13.86  )
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

On 5/29/20 5:58 AM, Adhemerval Zanella via Libc-alpha wrote:
> 
> 
> On 28/05/2020 16:43, Vineet Gupta wrote:
>> The existing macros are fragile and expect local variables with a
>> certain name. Fix this by defining them as functions with defaul
>> timplementation in a new header dl-runtime.h which arches can overrid
>> eif need be.
>>
>> This came up during ARC port review.
>>
>> This patch potentially only affects hppa/x86 ports,
>> build tested for both those configs and a few more.
>>
>> Suggested-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> 
> LGTM, thanks.
> 
> Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>

Sorry I didn't think through this before, but ARC port needs pltgot arg (runtime
address of plt0) in reloc_index not reloc_offset. I'll swap them and repost.

>>  /* This function is called through a special trampoline from the PLT the
>>     first time each PLT entry is called.  We must perform the relocation
>>     specified in the PLT of the given shared object, and return the resolved
>> @@ -68,8 +62,11 @@ _dl_fixup (
>>      = (const void *) D_PTR (l, l_info[DT_SYMTAB]);
>>    const char *strtab = (const void *) D_PTR (l, l_info[DT_STRTAB]);
>>  
>> +  const uintptr_t pltgot = (uintptr_t) D_PTR (l, l_info[DT_PLTGOT]);
>> +
>>    const PLTREL *const reloc
>> -    = (const void *) (D_PTR (l, l_info[DT_JMPREL]) + reloc_offset);
>> +    = (const void *) (D_PTR (l, l_info[DT_JMPREL])
>> +		      + reloc_offset (pltgot, reloc_arg));
>>    const ElfW(Sym) *sym = &symtab[ELFW(R_SYM) (reloc->r_info)];
>>    const ElfW(Sym) *refsym = sym;
>>    void *const rel_addr = (void *)(l->l_addr + reloc->r_offset);
> 
> Ok (it should be dead code eliminated by compiler if reloc_offset does not
> use the pltgot field, as for default implementation).

Yep.

> 
>> diff --git a/elf/dl-runtime.h b/elf/dl-runtime.h
>> new file mode 100644
>> index 000000000000..ed5db3ba51b7
>> --- /dev/null
>> +++ b/elf/dl-runtime.h
>> @@ -0,0 +1,30 @@
>> +/* Helpers for On-demand PLT fixup for shared objects, Generic version.
> 
> Maybe period here?

OK


>> diff --git a/sysdeps/hppa/dl-runtime.h b/sysdeps/hppa/dl-runtime.h
>> new file mode 100644
>> index 000000000000..cfde0ec991e3
>> --- /dev/null
>> +++ b/sysdeps/hppa/dl-runtime.h
>> @@ -0,0 +1,31 @@
>> +/* Helpers for On-demand PLT fixup for shared objects, HPAA version.
> 
> Maybe period instead of comma here?

OK.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
