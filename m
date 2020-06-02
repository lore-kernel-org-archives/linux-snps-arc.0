Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A88C433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 17:14:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6401206C3
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 17:14:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vAswf1OP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BXJKR1Bj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="F5G2qdv9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6401206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VwtzvbWbY62viZwRJ0Eop08qkzMN0ffs27x++cS1fYY=; b=vAswf1OPxQeset
	Gg4CKGVE7AiB0sYuQY3zn6CbopovkbXV8mzVpfiWQzGZ7j+TLv/lVQZxb4pnEeOvQzbbTPxbkcm1F
	bV/4CetaX8foI+4AyH4hjyfhsIPsWe0ZSPgIu/9DI/DlCJkn2289CIo7ZEqkLsEAzeDtFnmAAX0gP
	kVhwQXcHoZwBUD0QTNwL0biRHIwmLyPS/yqo6Ub2DY2rMhSm/auJ+mIlB1RdaLsSHPP3Cbi6IkX9V
	1XouK/jcjmbjZUvC2juMIxiVXsH6MQzbBLuS2AJInVPLYjs//lz0WuHd2WTVuni30WzbT5Ckio4dx
	fNvXBi5MOJcKmzQGfDhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgAUJ-0004Fn-0R; Tue, 02 Jun 2020 17:14:07 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgAUG-0004FK-Re
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 17:14:06 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 99D7D4013B;
 Tue,  2 Jun 2020 17:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591118044; bh=drPAx/ILz4cpYqqWIDaFAQ/+WXxMuSrSmMFKLAVhVFI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=BXJKR1BjhIPndLx5STRWLFzYzBOYbzE+cWG2sGPEAiYhw1kHd2QrK/X+nieuRR27l
 p56xrvninZJLyaOG+1bDhnI4uCsV4QqKhVs5jsp8ZMvOFfUxMenzcZzqLfsMtx2zqC
 ygjl7J/yMm/+guxtk9UvtMz7tp+3lpAuRZDiI8tWivDnxgZxDxXoYYRP1T0YPDm6/o
 u2CSzKDN7oBcu4J2srEl6krtJADyCDxErw0NUz0Q/HJur93/Sl4f2W5kFkja9Z4tDs
 mFJk73ZuE/1w/dL3dnkR52JC7b3SjnTjoSiNOUT9SqdwMf5iY25ulfp6hVGCLVkFjS
 zmSAdc3JfjG/g==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4D4A8A0067;
 Tue,  2 Jun 2020 17:14:04 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 2 Jun 2020 10:13:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Tue, 2 Jun 2020 10:13:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlGSlvqOlq5tazrZV7bQ4J92y3ZbM31/Vr6RzTtyPz4bWzqywzk46phaBgVJeP/SRGdnsVKa8/XRT1/qdnGh6LVUPJRm1D4PHG7cDUdw8f7CIvc0rezWI9ont+nE005xF5jyFCs/DS8HcpHYb3X5d4XlnwYj1/1YbH/bI/Jzv8ROqscu0bk2Cdxv9BU+1pIOb1ip+Z8+BHZjvQN085HNjAcxtPdGFKaGey61ZeU40YzzTshi6kta6jLXz8PUJ+ddQI/miehY/2ngGrOCHSdylcsTPUx/GSfyQT6AbcLeFSLTLRLieyGZPQwyY838G/dAk9dOY1EoiW2djQ0KtdaMnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drPAx/ILz4cpYqqWIDaFAQ/+WXxMuSrSmMFKLAVhVFI=;
 b=SuffNCXj+PVXc737P5j9CeUnlcjLz0DUcRZpN5aF0qECpw+t5IrnDQxIl+hGwDe8F/ViUrsTX/AkjEQQjVwAZFN1oSWkrbOHyiHhul46YPyY3G6XwQHswNb2+He/s2i9ISogidw4vGbhL2MGSmyFgvepQLLuJkKMWMCeCnDdyZwZymYMvurXV2aqWCsjBGT0E8rTGmcAOunrPqnha4mFf2wwsa/fbJp7vTcsKiV3c+oE4CJnCtQHhdQ2t54nfZM8CJD9wjgybu/qg5dx3EOImpO/Ih0iN25Om1VcgtIwwuK7PJq0wVc3z1jecTppSBMG505qqHLia+lKZcjDEsDqwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drPAx/ILz4cpYqqWIDaFAQ/+WXxMuSrSmMFKLAVhVFI=;
 b=F5G2qdv910S9bNuxPnBYWDa1rOT+sNicdTmTlmLogEHH5xnJseAbxRuvCasqAoFvCp/2A1e95jjI9rkK/M2JUlbRSQREvo2R7NhInyVhIFxTPHyHk6626l86VKoAp1J6XJtL5//YNXKx0sGGHBuDh84mnRxrwrIwq31x2KOEePo=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3062.namprd12.prod.outlook.com (2603:10b6:a03:aa::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Tue, 2 Jun
 2020 17:13:42 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 17:13:42 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Stefan Liebler <stli@linux.ibm.com>, "libc-alpha@sourceware.org"
 <libc-alpha@sourceware.org>
Subject: Re: [PATCH v2 2/4] iee754: provide gcc builtins based generic fma
 functions
Thread-Topic: [PATCH v2 2/4] iee754: provide gcc builtins based generic fma
 functions
Thread-Index: AQHWOHXS+13L3WR2r0O8WETr+wq9bg==
Date: Tue, 2 Jun 2020 17:13:42 +0000
Message-ID: <c9bc348f-0441-2f0c-7336-b541f7d1e6f9@synopsys.com>
References: <20200602003541.21005-1-vgupta@synopsys.com>
 <20200602003541.21005-3-vgupta@synopsys.com>
 <34fc6c13-65e6-dcbb-42b1-1ba9f56b4dfd@linux.ibm.com>
In-Reply-To: <34fc6c13-65e6-dcbb-42b1-1ba9f56b4dfd@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none; linux.ibm.com; dmarc=none action=none header.from=synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02fb1b82-1d1e-434d-9053-08d807184d1c
x-ms-traffictypediagnostic: BYAPR12MB3062:
x-microsoft-antispam-prvs: <BYAPR12MB3062EC73E59148DA9BAC2A38B68B0@BYAPR12MB3062.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:140;
x-forefront-prvs: 0422860ED4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +zppv9mlgjwBGB5V3326Ik3ZNX46hJhbS7Wfh5+uXT38NVTH0Ss61e+ldZd+0Wj8Pq1biXmYvH4FLH7WrmYMYdPC5Re8ghFK2pKxbIUhMC8CfmBxwclqanjAosLB+CTZkmFMkeT4gczdWDvXPTYTxXZy+W3qcXaJbD7SglswJ1tgj9gUgcVLSIN8CLyGE0le+iNevbyaFy8A5y+43ftFH6XU70bCwu5hANbw8emUkePOKYGnWKG2S2Inxg9VInz9c0Kd8w4wqDDth0CvQFC4NsQEf/bI/RmNuOg+ZpnHO9fUL0eRNAKIkbr2X0JdB7TO+FaBPvsyl476TmvHr7CVRd/9rY7zuwm14VJD+ktf4mdwDPWDFAMZelgiajK2vy3ApSsh/R8yLgS66ASwDF/MOw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(39860400002)(136003)(346002)(366004)(396003)(66556008)(66446008)(64756008)(478600001)(66476007)(6506007)(53546011)(6486002)(8676002)(186003)(71200400001)(83380400001)(31686004)(6512007)(8936002)(36756003)(4326008)(110136005)(5660300002)(86362001)(316002)(2906002)(66946007)(31696002)(2616005)(76116006)(41533002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 4cLB6EVoZ7GNlRubx7mHOcwTI6ro9VbBXJHcGUqKYM1e5tfxEdBHnA+6K+O7wQRLUSG0ZMPjdBqT0gOLw2CyQ7xQbDdhdhuhiP62KAf6MqN285Dm3eVkMyA3N51r6JvtTUFUCyiDIy4dyj+xk3aXgiFrsyWSULcUcSgvJ9oZDfUEvc4DjLiDgQk9omGR1rkjLzgW+9OIrHzmv944QdggKQlAl/6AQgFOvRSR5yxZ6kTnpTo2772wEg3GSJqM1dXE+jx66NNmtEh/gFfHJKkCNOHyGPLdXtGgI/aPn1ThYI81o9cjQvyVwYePWtDt8upeTt6dJ5JDRbkhOmWxvxB68qzmJW8mKVDYtJaAAJdtKPQLTmXyeCQEE1vjIQ8z1bNOJXNtWEe6QQDMao65+0+ulPNKO2QaAnOILaGCLNvuvr4XbxziFrwyXPx6y7eDfoDrPKQC+raHe3nVpb7cU0PvSjLuUfK6FIpiMhBFAc02q8hvOynmWLsj/2DUNBuGl0DV/xz9pLlgoFXfNbe725KnG3HLYskAfADmQPgUYdGs2WfTk9WDu7d4d14i06LGDTdE
x-ms-exchange-transport-forked: True
Content-ID: <0DE5948414F5914EBADBAE8D318E788A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fb1b82-1d1e-434d-9053-08d807184d1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2020 17:13:42.5023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0145ztZvjwQQRYkXartMouSPWEFYVG7O/H8ofSyomYh5o9uhhNiSHpEAZvxgKuu50Vl5Y3Uvc6EiXI7pAytBZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3062
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_101404_906865_4B4F6D64 
X-CRM114-Status: GOOD (  13.34  )
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

On 6/2/20 5:51 AM, Stefan Liebler via Libc-alpha wrote:
>  #endif /* math-use-builtins.h */
> Please also update the current architecture specific math-use-builtins.h
> file: sysdeps/s390/fpu/math-use-builtins.h
> Otherwise it will break build on s390x.

Done.

>> diff --git a/sysdeps/ieee754/dbl-64/s_fma.c b/sysdeps/ieee754/dbl-64/s_fma.c
>> index 876df6e78bdc..9dc5b132b9ee 100644
>> --- a/sysdeps/ieee754/dbl-64/s_fma.c
>> +++ b/sysdeps/ieee754/dbl-64/s_fma.c
>> @@ -25,6 +25,7 @@
>>  #include <fenv_private.h>
>>  #include <libm-alias-double.h>
>>  #include <tininess.h>
>> +#include <math-use-builtins.h>
>>
>>  /* This implementation uses rounding to odd to avoid problems with
>>     double rounding.  See a paper by Boldo and Melquiond:
>> @@ -33,6 +34,10 @@
>>  double
>>  __fma (double x, double y, double z)
>>  {
>> +#if USE_FMA_BUILTIN
>> +  return __builtin_fma (x, y, z);
>
> Architectures which have support for ldbl-128 will use the file
> sysdeps/ieee754/ldbl-128/s_fma.c instead of
> sysdeps/ieee754/dbl-64/s_fma.c. Should this file also be adjusted in
> order to use the builtin if USE_FMA_BUILTIN is set to one?

Right.

I used commit f82996f815 "Use GCC builtins for round functions if desired" as
starting point for my change. And seems it was not an ideal reference :-) as round
has far fewer instances than fma. Indeed fma is present in ldbl-128 and dbl-64 so
needs updating in both.

But just to be sure s390 is currently not using the newly introduced builtins so
I'll keep them as follows.

#define USE_SQRT_BUILTIN 0
#define USE_SQRTF_BUILTIN 0

#define USE_FMA_BUILTIN 0
#define USE_FMAF_BUILTIN 0
#define USE_FMAL_BUILTIN 0
#define USE_FMAF128_BUILTIN 0

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
