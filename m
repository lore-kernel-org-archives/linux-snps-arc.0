Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80E8C433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 16:55:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88048206E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 16:55:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="afGEnwez";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="h5ATehy4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GkKWPcQt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88048206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kk1d0OpfKzJZBUz8l7VPnPdHqZEKylfHoD/8jWHYP30=; b=afGEnwezyF3mA/
	rPiJrnSPtj3o5M7QuP66y+HhoURunDjDQK2E/9Xq8fLrjZg253N7TH5Xf+aE+CdaTMHeo9SgFMjrG
	fIpfc8afpLXvLDppoGVAjq9vnLFnetONqF/3kkMoJlUM6TVYc9DbvwE7gU4/Vs4mgRt8EGRtyj/nO
	b8J0CHHAMnWovQSASTqDbawLx+amvHFiQY6CVrmAXnSc/g1I8DtLeOA7ylauYUTgDrrceJWnSE6Kb
	ACBwyb7pXKMa0D2PNblpAZzFnIPw8xgYfSyWTg1/sKV3W/bwoiA1ZUpvtP0f2fZTdSCceUKBkVNui
	HQ1C3ZyAjrBXS6vFrGiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgABq-0000Wo-Fm; Tue, 02 Jun 2020 16:55:02 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgABo-0000Rl-8V
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 16:55:01 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 95FF0407D7;
 Tue,  2 Jun 2020 16:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591116898; bh=NxzTvFCCJG6vmQoyqvtisH91u08VHWwKEuZX5cxyr+0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=h5ATehy4bONqx++4ZXvdrv76Q3O7QjMGMOwR2GXdOczjLPmGEhTf8UrXDcEdX1iv/
 CpG0OsIwJGaMt4MQ1JjfGpQuYobOkkEk6h2g5jqyNMKEr7WwIB/fRMjSkHB5EGpT8H
 Rr57l00ke22qn5gf+tHKQdpWftJNlpJkz4HtiXtw8x0Q/BOUJmp/AWWxsMB8uq83XD
 sLaad973+URsxymze835Y4NBBw1B2WAZBEG2Wzsa3MuoT9Ol24LSErKyOk6IGJTI5g
 qgd6yAAdRPGEuiIY0uIvuBGCDT+IPXxcnwTbSrTP8x2KYM4YK5mBr6HFlgjisk8fey
 9K02O+taMnymQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3DF4EA0071;
 Tue,  2 Jun 2020 16:54:52 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 2 Jun 2020 09:54:44 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Tue, 2 Jun 2020 09:54:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hagPzDxdap+oNP+me0MworiBXVtNeRPKsMMZUVsFdusB1Jn69iq1TXwti/5shqs+lSl1GtmzmvZKqZ/RAk7WEGxKKOOto8RlgWu0FvpLZM7UUXDxpnVE9+3mR2/CV9AgKYE8ltCv2OIJq6OvzbfvfbPCYO/Zhn6MmOC3wdf+Lx2hZaGjY895kTCYFlnKYerOmZ7Av5hoMfd/sV5lFwHUaPYhyjdyK+cOuEM8YAD4x9l90B21nS+Pd9sC5i5LKPr9qMx2I2r3H/tksijAInGCFsX6bX1Ha0STxeTNTZLdYyTchXI66uXlWGfuzBRf+8pPSyV1L1iBGzqGVURMx4P1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxzTvFCCJG6vmQoyqvtisH91u08VHWwKEuZX5cxyr+0=;
 b=nBh+hKorJ/+Rr6aUgcVT6OmMIKZtiE8SptzuU0UpCU/TZt23mMy894xZSbvvIbdFXS0lCIvV0vyRX8gErzyY6sXD0EJZxi7J6M71DT1ph8ZZIXQSAo03X/pJd2dvQGU3e9Mns1xDoNUW890sQWVN0/ptmYLQMzMtcxhl+IsQm8KeVoGDjlCy/aB0w8xovie7gbdMLl2FYGRDazEeUPJlkWI1rpSnoXv2q+gLX4ICJxyzLxvI8BIeozDQ/vBTwdzIfophm28f1+EkHqpe6WUYX7Yc0RFXbSToebPGsxbdHKVBU1RZeMB3M09PH+aKVK4cYR48NXOk+BTbX/gh/aqRJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxzTvFCCJG6vmQoyqvtisH91u08VHWwKEuZX5cxyr+0=;
 b=GkKWPcQtAIiLfldccXeAYjyrRZccSY4Ku+A9T501q13Zmv+ptnqG6ymV8O1itYR/1c2YgolT+C0qrSdCAUbH6i+pdYnRAIIhNUdTdRHGD6gg+aqaS5UkyTh5zCOZGbcJXqnju3hnR2KBqXxmFeazVdjCB0ZEE0lwXJW3dt0WFwA=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3287.namprd12.prod.outlook.com (2603:10b6:a03:131::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.22; Tue, 2 Jun
 2020 16:54:41 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 16:54:41 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Stefan Liebler <stli@linux.ibm.com>, "libc-alpha@sourceware.org"
 <libc-alpha@sourceware.org>
Subject: Re: [PATCH v2 1/4] iee754: provide gcc builtins based generic sqrt
 functions
Thread-Topic: [PATCH v2 1/4] iee754: provide gcc builtins based generic sqrt
 functions
Thread-Index: AQHWOHXTSnO/kBhQs0yiT3YiXSsqyg==
Date: Tue, 2 Jun 2020 16:54:41 +0000
Message-ID: <1708818e-97d9-8653-be06-1898e236c74e@synopsys.com>
References: <20200602003541.21005-1-vgupta@synopsys.com>
 <20200602003541.21005-2-vgupta@synopsys.com>
 <5d912d39-f017-31fa-990b-e1c1b735e1ff@linux.ibm.com>
In-Reply-To: <5d912d39-f017-31fa-990b-e1c1b735e1ff@linux.ibm.com>
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
x-ms-office365-filtering-correlation-id: ef8f70d9-a5a9-4b5f-1441-08d80715a4d1
x-ms-traffictypediagnostic: BYAPR12MB3287:
x-microsoft-antispam-prvs: <BYAPR12MB3287E46A6B86A3A6FA1F96F6B68B0@BYAPR12MB3287.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 0422860ED4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WHuAaP27qkUc3Eet/nH6hCdJpQZsKXpp0sbcTi1B6C0BfZ0OlzbBoC8VJSL2gNDoXdQxWkEIe/nJfOG5NuiXN5MFKmFDbIIOcLAKUf9LdqXgXS0XCD430aVGmbO2Fq0Owv7z1SUKm6XsboSjjtnwHYEnChuRaEWDFWYfg0KlRFhdPaFmDGqV7vzSNxNP+13wDBfq1EWTt6hGTxXp80GwsBp++AZqBpAhWW9osgD66wl1tXxtohhkmMEqmOSovadrOBKDLAZFPlmh8xjBLqxqWMuIpBMbEwcgdtvNjr5JKORzwiSyNcvKiIS7Gllu/hJceicnDQiTjr7DuRdPoQ9evHucZKy98Gy9el5pCAR2h8CxcyfYZJHH+VtvzFXBW/8Fz+ztlhOCg74ofR5az4VePg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(366004)(346002)(376002)(136003)(396003)(2616005)(478600001)(6486002)(31686004)(110136005)(86362001)(83380400001)(8676002)(76116006)(53546011)(6506007)(5660300002)(66556008)(2906002)(71200400001)(66446008)(64756008)(66476007)(4326008)(186003)(36756003)(4744005)(66946007)(316002)(8936002)(31696002)(6512007)(41533002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ljseTUfyh2JOWGLFe+ZVrwfINHpL7VMrKbAzHf7AuT/Nj69SUc3rLwnSmNUY0fQ6plUCQZKJwji0k/xSEVeF/LipIvqTlVlAq+QBHqoS2I18rPLCQF3AWaH4VYMo1j3G0RVl9o6PmXqVToRF+T6Bel6dj7ixfbbSLESnVmV8kSeStTsHl3G2aQW/VjI9972Mkdlr+4GP/0FzAt3Vp8MMxbYhI1hEL+zUsCdcDx3WQmIlHFf3R4F1Eo5aKAvwqvl5ZJApkB/firgaqaOKylMc3mJ1DChSkrA35cffWvPP5EBOYAj/ZjigqA2Q5Qn13tZ4iSJKnGmUk1ETqMeTN7LmLSIOB1KVWda+9FuyfeA7bjQJ0N/SqZdBfbjknQauXJ2WDQXeUujj55iIBdPpQLPwWodV5S3gZLb9xQWY/eGs3OvyCtQIom5ME7D4jCE3yWq63Fc6VUaKsv5GkAT9KES/TEz8ZIJdolZ3GCgP93kpd2Ei6pTWdcHby8zFrcg98REFlgXFBpXIhA7wX5qbF1fMulKBRjmKKqBVlu0EgMAvrtQ8JfHQ9g4dkBBEAUjy4lmt
x-ms-exchange-transport-forked: True
Content-ID: <DDDAEE49138C1A48838CD884ADF80139@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8f70d9-a5a9-4b5f-1441-08d80715a4d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2020 16:54:41.1529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AYJRiQirNp58eXriFmdMgNziIq9Q+iI1wdLeM/acR55J5eM+vVQA5DpBMQs9ZgokI+c5vVp+JBQqt2jwHHJ17w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3287
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_095500_366025_232202D4 
X-CRM114-Status: GOOD (  12.61  )
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
> On 6/2/20 2:35 AM, Vineet Gupta via Libc-alpha wrote:
>> Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
>> ---
>>  sysdeps/generic/math-use-builtins.h |  3 +++
>>  sysdeps/ieee754/dbl-64/e_sqrt.c     |  6 ++++++
>>  sysdeps/ieee754/flt-32/e_sqrtf.c    | 16 ++++++++++------
>>  3 files changed, 19 insertions(+), 6 deletions(-)
>>
>> diff --git a/sysdeps/generic/math-use-builtins.h b/sysdeps/generic/math-use-builtins.h
>> index 8a39ef58bc95..fc724c824a17 100644
>> --- a/sysdeps/generic/math-use-builtins.h
>> +++ b/sysdeps/generic/math-use-builtins.h
>> @@ -60,4 +60,7 @@
>>  # define USE_COPYSIGNF128_BUILTIN 0
>>  #endif
>>
>> +#define USE_SQRT_BUILTIN 0
>> +#define USE_SQRTF_BUILTIN 0
>> +
>>  #endif /* math-use-builtins.h */
> Please also update the current architecture specific math-use-builtins.h
> file: sysdeps/s390/fpu/math-use-builtins.h

Fixed. I should have added s390 to my list of arches to test.

Thx for taking a look.

-Vineet


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
