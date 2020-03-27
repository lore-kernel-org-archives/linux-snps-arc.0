Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB68C43331
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 01:52:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 063D52082D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 01:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gyfLsyWX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hWIQ6iA5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QDmpzpXF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 063D52082D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6PZQsCwi2nzl5K4cdGgPnDZ9mzJJz/AyjybA+rG1UQ=; b=gyfLsyWX978LX+
	1hsQhXNk2VqaIk5i5jVIxiLK6uOHgNFkd9uJoDbvxswa+Ck8EsGXqsOo29RkhhweU3jHjfZ7B62gA
	qg/0dg134hDWYP59WHw3fF2ztmnf00WgLx5koGCAik31Tp05bLk9WuL/XTU5GGJB5aWUp8vn21oK0
	/ln4T4FGRStP0Nc9ueXUoXcTvlN/GTscbCySCll5OC4Lok8j9FLjP7prvhgX8xt40Fn/19aPsmnEv
	OIWHRENUQV5PdgKVMTpoM9fZGPxeWxFyjvgfgTLd0BxJGSRBXjcZp5ny8qH+Pj2NUpXNwX1QeflQB
	bICf51eD0LqYNApQXOpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHeAJ-0000j1-5b; Fri, 27 Mar 2020 01:52:07 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHeAG-0000iN-Dw
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 01:52:05 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DC7574068F;
 Fri, 27 Mar 2020 01:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585273920; bh=y+asCImc6ljWpeG0PZJMpYLx/qpvqJPNHOT06dqKA/A=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=hWIQ6iA54r3ITwX6VWpJQMmknUtVardgf5lSDsBsetoVQZ7GhtcvVMAqQ/ccSPz7u
 co6/fM2UupE+uiEUpGoRCtZNT32OJk0tBLCp5MzxvNAvfmZNDFHViwzoIyTbka5RiT
 +qFzmHQJ6rlHsUAlJChMeUTzO5q6SFjycUBNv+S+qzO0j4HzsvCQsR1YHb31HyE3bB
 Um+DMZar4IJh2qEw+jSB5w0DvV6LeUSuK5WyfWWmebmG9ojBTJlF/lU43KVb41Bh53
 CyS6Xm4k/MyBsYb54mS41gz0rWe9EPWwyZgdvj5Z7ObiXpyCTdJKSKoYlLvEAad6zL
 +c2knLtF3wdkw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 84595A0072;
 Fri, 27 Mar 2020 01:51:59 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 26 Mar 2020 18:50:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 26 Mar 2020 18:50:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g86ttnMm6R0Zbm6Rt1/nf1+6VykP3v4iQt8mRqHF0SrWN0UNySnJyoWw6j0KPKg9kb99FziZSMKm7pLznp5fJV2L/QqDKekdRIuEd8TN6HxrCtTzDV5oeTNmFIene4DOX4MlZkLmB7HKSwQvnroRUj23SPG8TnB0t2T3cfOruouMauRKP12PD44NgG7zzpx+OFtVxir2gaGKh7XrfbqbsnXZOy/vAVHuR85LNJC6f9qgNAro5T9sZG56P6aiwLFAYw6KHI9LREVx7CKgL421AhxTUVWyxS9UgbkGmRJo6PiJEjzjVjpsWmMxmlozLOC5w3aGSWfOMNqUt6dPxR1gzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+asCImc6ljWpeG0PZJMpYLx/qpvqJPNHOT06dqKA/A=;
 b=SzuXYy8W96jeQO5aoXAEjbzUEFWkTKiakYbAjYa1PNigu64C9veqOrhd7dHMkjfDyKAWjGrA21qUbBJEEWbb6YS5eeUlJiNm84pxp9tm4AoxMFlltpvTLNTl+o0/7uCSGrGUbBeUs3Q25iWbo8DlgQqLQrAbLG3ReFT7FEBw+CXR48SEs/qTbGqBYqmbIpg6NT7+jDYsNJmfl2SwcG3U1TvcNrgsdRqufy2YCi1ftOdvC5SblhCrb+9ntbex0+M0MBEeCE0uGE0cIJ8uJVm9rHx1gzNGuh+xjbF0Ia9I/BCMLQz4eUB+TGrdwtWtZR/h3XMor4PVfJmnAWaFAfZgsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+asCImc6ljWpeG0PZJMpYLx/qpvqJPNHOT06dqKA/A=;
 b=QDmpzpXFONZ92RsRedXplRVawIOEtuc5HhwEFWFqLqJXTj2pAxsGb1LosgzoCtVx3l1uJQFXi4h/adqMTv8L+JglmcFbD/Pw/P4ETf3j6bEpSSA1caoZcVEFkH0O0znlRL2rfAc50/xdyKgXwhe7USjMbJef6/9uY4zCWR9fbfE=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2648.namprd12.prod.outlook.com (2603:10b6:a03:69::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19; Fri, 27 Mar
 2020 01:50:47 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 01:50:47 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v4 07/15] ARC: hardware floating point support
Thread-Topic: [PATCH v4 07/15] ARC: hardware floating point support
Thread-Index: AQHWA8V3/HU3G+1WgkmSNEo6yildgqhbrLgA
Date: Fri, 27 Mar 2020 01:50:47 +0000
Message-ID: <7462f741-d7d8-57f2-0fe9-c21b4b2829eb@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-8-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003262311330.24611@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003262311330.24611@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: f1f18c8f-e5ed-4539-d871-08d7d1f14506
x-ms-traffictypediagnostic: BYAPR12MB2648:
x-microsoft-antispam-prvs: <BYAPR12MB2648C6C6DE8EF819D6F707A2B6CC0@BYAPR12MB2648.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(366004)(39860400002)(396003)(376002)(81166006)(2616005)(8676002)(8936002)(81156014)(4326008)(54906003)(186003)(5660300002)(316002)(6506007)(53546011)(26005)(71200400001)(66556008)(66476007)(31686004)(36756003)(86362001)(66446008)(2906002)(6512007)(66946007)(64756008)(478600001)(31696002)(76116006)(6916009)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2648;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tB+rsiGsCzFJoRcO4JCam/IXEy0vjTDGymMi2CPrzljAFLg7mM4KltdH3rOUKRpJKMr5XvaLttWBuczzYplnmY1pweS4oRsiK/bwKf26CayUVhSrn2UR/B46rp4fqdOGXxxMHIxB/citW8Nmdi0YthGXwmpOFVt/iORmDhiP2B7J5uY/Nvtd2eWgwj10kOvHRk6/eg4TKj8EIpY08yLj16zao5wKfnRi1ydFmWH2Yy2N4yK5fZGPavdjeKLxcKBopIh206IZjwH5TLLAdnAr1rFpqZV+tJnWeP2I8RO0ddWO5AY0sJsxWPz3QFDh+x96F3SnLlrhSv4Hfxhp5YZeJLNDo7MK+1m343c/gwzBE0VfsxyK0cW0zQQp7AYyo+IdUfaFqYX7GxSfPCQb7w+I4HL32LVhdVTBsgdtaS+Y8WR/jN+b0VNqQ5WRxVtNBK1d
x-ms-exchange-antispam-messagedata: dE3ldcWpq/+ncCPaPBsuoCyKdTx0UA5KMgDc0nl2+zdF554D7dEwMZShM3N0ZVJUq/r//pcqhbIQ/mcG0tZlU7/v8rnIwoUKPnz9PA5/KpP0Rk0vwuFVFNBFMLrapfAuaT99sp3JtOoE5eRsufVT3w==
x-ms-exchange-transport-forked: True
Content-ID: <8B0B4CD48555A345A346D5D29803A7ED@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f18c8f-e5ed-4539-d871-08d7d1f14506
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 01:50:47.1254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yvn2UsciJO9XY+zM5p+t4e9MXNMRyqNqos2J7hNdggWfQL+ztLlhAsKVloiNqF+9BG7wBRpJKFdhcWFkGabPEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2648
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_185204_554103_CAA673F1 
X-CRM114-Status: GOOD (  21.15  )
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

On 3/26/20 4:22 PM, Joseph Myers wrote:
> On Thu, 12 Mar 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> +int
>> +fegetmode (femode_t *modep)
>> +{
>> +  unsigned int fpcr;
>> +
>> +  _FPU_GETCW (fpcr);
>> +  *modep = fpcr >> __FPU_RND_SHIFT;
> 
> The bits to enable exception traps look like dynamic control mode bits to 
> me.  In general fegetmode should only need to mask off bits on 
> architectures where the same register has both control and status bits, 
> not on architectures where those are separate registers and fegetmode / 
> fesetmode can work with the whole control register.

Yeah, looking back into my old dev branch, that is how I did it initially, but
then switched to current implementation to "make get/set mode functions
inter-operate with get/set round" - although there was no inter-calling between
the two. We can go back to that implementation as it seems slightly better in
generated code, but I'm curious if it is wrong too....

>> +int
>> +__fesetround (int round)
>> +{
>> +  unsigned int fpcr;
>> +
>> +  _FPU_GETCW (fpcr);
>> +
>> +  if (__glibc_unlikely (((fpcr >> __FPU_RND_SHIFT) & FE_DOWNWARD) != round))
>> +    {
>> +      fpcr = (fpcr & ~(FE_DOWNWARD << __FPU_RND_SHIFT)) | (round << __FPU_RND_SHIFT);
>> +      _FPU_SETCW (fpcr);
>> +    }
> 
> I don't think the use of __glibc_unlikely is appropriate here.  It's not 
> at all clear to me that the normal fesetround case is setting the rounding 
> mode to the value it already has, as the use of __glibc_unlikely would 
> suggest.

Ok removed.


>> +int
>> +__feupdateenv (const fenv_t *envp)
>> +{
>> +  unsigned int fpcr;
>> +  unsigned int fpsr;
>> +
>> +  _FPU_GETCW (fpcr);
>> +  _FPU_GETS (fpsr);
>> +
>> +  /* rounding mode set to what is in env.  */
>> +  fpcr = envp->__fpcr;
>> +
>> +  /* currently raised exceptions are OR'ed with env.  */
>> +  fpsr |= envp->__fpsr;
> 
> This looks like it wouldn't work for FE_DFL_ENV, which is a valid argument 
> to feupdateenv.

Is following pseudo-code correct for semantics ?

fesetenv(env)

   if FE_DFL_ENV
      fpcr = _FPU_DEFAULT;
      fpsr = _FPU_FPSR_DEFAULT;
   else
      fpcr = envp->__fpcr;
      fpsr = envp->__fpsr;

feupdateenv(env)

   if FE_DFL_ENV
      fpcr = _FPU_DEFAULT;
      fpsr = _FPU_FPSR_DEFAULT;
   else
      fpcr = envp->__fpcr;
      fpsr |= envp->__fpsr;   <-- this is different


>  It looks like we're missing test coverage for feupdateenv 
> (FE_DFL_ENV) (we have coverage for feupdateenv (FE_NOMASK_ENV) and 
> fesetenv (FE_DFL_ENV)).
> 
>> +static inline int
>> +get_rounding_mode (void)
>> +{
>> +#if defined(__ARC_FPU_SP__) ||  defined(__ARC_FPU_DP__)
>> +  unsigned int fpcr;
>> +  _FPU_GETCW (fpcr);
>> +
>> +  return fpcr >> __FPU_RND_SHIFT;
> 
> Both here and in fegetround you're not doing anything to mask off high 
> bits of the control register.  That seems unsafe to me, should future 
> processors add new control bits in the high bits that might sometimes be 
> nonzero.

Yeah we can certainly add masking for future proofing.

In some places I have following:

  if (((fpcr >> __FPU_RND_SHIFT) & FE_DOWNWARD) != round)

So FE_DOWNWARD (0x3) is used as mask, is that OK or would you rather see

  #define __FPU_RND_MASK 0x3
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
