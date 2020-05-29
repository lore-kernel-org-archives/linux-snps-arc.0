Return-Path: <SRS0=GdQW=7L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CAEC433E1
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 22:29:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA28520897
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 22:29:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BWgJDxrC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FWDHrC0m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZMlvP2/I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA28520897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79C6J/Gi/dxD80GIqZD6sH09u1pJoOvbm1D2X4g6KMA=; b=BWgJDxrCRL8zq2
	vzzdpIPFagVgSBFp4hmQY8uRr7HKgJqGAwg0QSpOp/+dwPxCXkmYoXnRYnh/72CAfcPa8XD55dMVV
	gzbTyswctUj4QRklA31jxz3ZBY7if9TmHiakbYMrN0Pl4JQ0b0WpNvv3LDaKI93m0Qrjbb2DVGKA/
	+Ns8kHY3AZZD0Gape5wWa2fhGGXcpTOngZvRHqAWVC+HCZYLgzlFZS/RlTCeY7kf8N31NZN/Hsf7K
	GM3bZ8O4lbx3eMyLuYs3AH6I6tKlGaaZM67ABAS5Wkx+ZLuOUrP3/jCtrIpXxXDvGUa6ZrQVFqT/W
	HP23FxzA3cH0QB2tkhIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jenVf-0001rk-N6; Fri, 29 May 2020 22:29:51 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jenVc-0001rA-AL
 for linux-snps-arc@lists.infradead.org; Fri, 29 May 2020 22:29:50 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 07B31C042C;
 Fri, 29 May 2020 22:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590791387; bh=NCITI2UMHloou4lk2n+SSk1mg2rjIET5x9zMfcL0Wuc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=FWDHrC0mS82mSY4vxtXGm+dwBzxqVU8I3lC4Oh+U4ZDP3KJuyxGEvmah7TARLS+cA
 RPmubHQadaQfwGjM7tbyxD6ykVBJ3YKRrNOJaWRuN6MKMich0hIWdnmcTWi0+OROV9
 sP+QzV5fDBakk2Tv29un5dCjNwUtnV+0zcSSBatU4FQpPPEkjqYDiSnlciTFfXFCS9
 OSto5IMn1gw0bYc2my54+zyJWuhszegDT3euDiVYXVwjbCXyYNS8334/yghv6YW08h
 O/Fnb/wbzHEvJ2El8m95PX2+ZCD+U4DmAWThWwArsYrO6FhfaeC7AEapUaMK5qcJT1
 /VFoH7Mq6KNcQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9B01BA0069;
 Fri, 29 May 2020 22:29:46 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 29 May 2020 15:28:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 29 May 2020 15:28:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oL25DiJ8J763sJpYSOOFaxXozS1bqc9EwkK00ic7CBCGUVjwk8i31zsl9azVQ5bHG+wSprxU1FI1c3Q4r/KOP5c1lfLKppYqdB6jlY+4L9k3WnxlWG+3brgKacoKohoPZ4H25gZ3s3sY/432Rvzwz5i60KaAgEQGQyPsKT0IjwRgsNxPM7qk0MXBAs9g7b/L8uwwfYvwN00DZtqMA3mwKdDmixoOTLlo++CeAv8jWlwp46drGpHSy9WQQgmL7g7lRrJ1g3R+qONO037IjwnqKJeUqi71LP2T5hbnt3nKroKc4AoSgzE/hRH3A+r7sPS5R8Q5Muf0gNvt9t9UDW+qZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCITI2UMHloou4lk2n+SSk1mg2rjIET5x9zMfcL0Wuc=;
 b=msLFrD8BCYTVJkv8lmobAY0RPRi366TQEYlexlbMNYpLpKsD6Osr4wlo2J0iFciGlL+NiJsNdvr+Z3C/iqJROTIA+7yhvajPc+ocAcVF1WiEOx48eXxdqlx3LOg1GQ3soki1H+lyJqYQd7Gql1dK7ZSVpi5IbcLQV4hHfI1tclN6WSbAKx+7L2cQABnX6GOv/phfqr6pNd1qEJKZF7Udavnz4VK/44yYRqmeiOMxlr/IQuUE3jKNVPTrtkaF0nJIcQ9bPMOKzukC/HauQKlM6y7mSgwtT5zyF3FIv0ByE4qRIc4Qx/r5gRTLknbgscPQLU7A0gp7Wh7zCgCKeLCDsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCITI2UMHloou4lk2n+SSk1mg2rjIET5x9zMfcL0Wuc=;
 b=ZMlvP2/IvjFRDfDnm/poO6+BUuItBXXQrX3S647EGOFuUA88aHZ7XHo9/vvHlr66FWJOU14h3mIIN2NUAuIkfVPyArTIBpYJvTsqxgCdzEcIemm8nAu5XoEwWmOikfZXcu0MBOPW+aHrDYofbwbgj/YtP7qL7RcPTTPBHorc4Ic=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3543.namprd12.prod.outlook.com (2603:10b6:a03:130::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 22:28:35 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 22:28:35 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v6 06/13] ARC: hardware floating point support
Thread-Topic: [PATCH v6 06/13] ARC: hardware floating point support
Thread-Index: AQHWNcNXJXMgGASM2kSQaj0x3NFlH6i/pXMA
Date: Fri, 29 May 2020 22:28:35 +0000
Message-ID: <91c2aba8-bff5-5ddc-7a95-c93c90883150@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-7-vgupta@synopsys.com>
 <de8975a0-bb03-8cec-be97-56f8c4e2a2f3@linaro.org>
In-Reply-To: <de8975a0-bb03-8cec-be97-56f8c4e2a2f3@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb545a27-c237-466e-720d-08d8041fa099
x-ms-traffictypediagnostic: BYAPR12MB3543:
x-microsoft-antispam-prvs: <BYAPR12MB35434A306B963F6B40F5FA1EB68F0@BYAPR12MB3543.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JGfp7GZMDmOE2FfhLteP4soqjbLt7cjyt0Wg5UkqayrX1nWyjtJ8vAs+7jVEOrA9ngNY5QX5NIHNwmejFCZ9FZ7c/BycTSmca4f8YLVUG2ctf0PveaFJHY2MIXtumTe5TALVyalXGlS579fTzJCJpY3yRc7qgrXv1JdNUTNglgyddDTYzS/VGG3pi8JMeWXeKtJTm84D8is+h3XLnIoP8uUEbcwE33cOziusYuBN0wrYb+29lSNFxEwhnqUPY3jvaDThx9XlzwsojCqe2d/BMI0WHo2Q6/77yzWLB9R4ZAtZ5xllr1wTWoYggqSYhrWDO6vlA7l21rRraA3lAgjJBlpC0OV+fDxhfXG9fkwTfABH2ii3zHOAq3x3hrN61sZUH1eWvidmiffJ9LGbi8koRO8vy45/lT7GwA61xWSv8VrUFhuQ6ehhkblBvFjbQwY7weOFCHw9t3yz594EI7XAI5eyuJfJ+zBacwg3F62C+EU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(136003)(39860400002)(396003)(366004)(66446008)(478600001)(64756008)(66556008)(66476007)(66946007)(6486002)(8936002)(8676002)(83380400001)(31686004)(6506007)(53546011)(5660300002)(71200400001)(2616005)(316002)(26005)(110136005)(86362001)(76116006)(6512007)(4326008)(31696002)(186003)(2906002)(36756003)(2004002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 8WrqOPvWj6y22p42vE0Dy99ShhnCTy+/UDM+tPyN82B1FtKRNhdGRTULseeieEk1yNmi4PTZwZRHnd+jL3tRz24D4JcAt5tDtYY39RB7FVAKgfWWwx4D8fAmgykwYZ24/X239WeCNuMSzFnmz0KKEPXZ8VliaZfMoLO95Pz5OCfpry/h1WB7VlcOpmTDTUmV5547MTIdlY6bhH0s7dqAmi6KAP/UPVxNWht9vMzGSkgZMPYrdEeX2RXd2q49GkKM6NqXS9wZfo/o4wuAAmChSuH/ivbc1pcGEPJLykFVMiEPODyC7FFPl7yWacKOsojsMNjW4+IlXOdMQPV2TTmr3bBf7qQdA1d/wzRxHDFPb9bCrgz+1PvBT+2d61LFXSlC3axeujL6UHvCiw2fGqr95lWRKs6bXsOBC895/CjxIaCMDVzVl4LrIMHQwB6OzVqgo4dYfN6ZrPTkpggqx9s4E/5NXGxHvLNIL5qhW3cvO6I=
x-ms-exchange-transport-forked: True
Content-ID: <63AE3D418615204EB136AF5845F1AACA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fb545a27-c237-466e-720d-08d8041fa099
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 22:28:35.6084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shLnoeKmYGo+8cHiDzFvcJivl7he5QhYYbAZmBziCccQpmiVOfpB28Yjk8UvxpdUhL1pTqDjDSNbXIJH4WNKNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3543
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_152948_494253_0919AF98 
X-CRM114-Status: GOOD (  17.12  )
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

On 5/29/20 7:12 AM, Adhemerval Zanella wrote:
> 
> 
> On 22/04/2020 22:41, Vineet Gupta via Libc-alpha wrote:
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

>> diff --git a/sysdeps/arc/fpu/e_sqrt.c b/sysdeps/arc/fpu/e_sqrt.c
>> +
>> +#include <math_private.h>
>> +#include <libm-alias-finite.h>
>> +
>> +double
>> +__ieee754_sqrt (double d)
>> +{
>> +  return __builtin_sqrt (d);
>> +}
>> +libm_alias_finite (__ieee754_sqrt, __sqrt)
> 
> I think it is better to extend to math-use-builtins.h for cover 
> e_sqrt{f} so we can also adapt to other architecutes.

Good idea.

Side question: what do s_ / e_ prefixes mean?
The suffix is clear s_roundf (float), s_round (double), s_roundl (128).

>> diff --git a/sysdeps/arc/fpu/e_sqrtf.c b/sysdeps/arc/fpu/e_sqrtf.c
>> new file mode 100644
>> index 000000000000..13008a4f45d6
>> --- /dev/null
>> +++ b/sysdeps/arc/fpu/e_sqrtf.c

>> +#include <math_private.h>
>> +#include <libm-alias-finite.h>
>> +
>> +float
>> +__ieee754_sqrtf (float s)
>> +{
>> +  return __builtin_sqrtf (s);
>> +}
>> +libm_alias_finite (__ieee754_sqrtf, __sqrtf)
> 
> Same as before.

OK.

>> diff --git a/sysdeps/arc/fpu/s_fma.c b/sysdeps/arc/fpu/s_fma.c

>> +
>> +#include <math.h>
>> +#include <libm-alias-double.h>
>> +
>> +double
>> +__fma (double x, double y, double z)
>> +{
>> +  return __builtin_fma (x, y, z);
>> +}
>> +
>> +libm_alias_double (__fma, fma)
> 
> Same as for sqrt{f}.

OK.


>> diff --git a/sysdeps/arc/fpu/s_fmaf.c b/sysdeps/arc/fpu/s_fmaf.c
>> new file mode 100644
>> index 000000000000..544f32e27aec
>> --- /dev/null
>> +++ b/sysdeps/arc/fpu/s_fmaf.c
>> @@ -0,0 +1,28 @@
>> +/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
>> +
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
>> +   License along with the GNU C Library; if not, see
>> +   <https://www.gnu.org/licenses/>.  */
>> +
>> +#include <math.h>
>> +#include <libm-alias-float.h>
>> +
>> +float
>> +__fmaf (float x, float y, float z)
>> +{
>> +  return __builtin_fmaf (x, y, z);
>> +}
>> +
>> +libm_alias_float (__fma, fma)
>> diff --git a/sysdeps/arc/fpu_control.h b/sysdeps/arc/fpu_control.h
>> new file mode 100644
>> index 000000000000..121656ff7d8c
>> --- /dev/null
>> +++ b/sysdeps/arc/fpu_control.h
>> @@ -0,0 +1,106 @@
>> +/* FPU control word bits.  ARC version.
>> +   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
>> +#ifndef _FPU_CONTROL_H
>> +#define _FPU_CONTROL_H
>> +
>> +/* ARC FPU control register bits.
>> +
>> +  [  0] -> IVE: Enable invalid operation exception.
>> +           if 0, soft exception: status register IV flag set.
>> +           if 1, hardware exception trap (not supported in Linux yet).
>> +  [  1] -> DZE: Enable division by zero exception.
>> +           if 0, soft exception: status register IV flag set.
>> +           if 1, hardware exception: (not supported in Linux yet).
>> +  [9:8] -> RM: Rounding Mode:
>> +           00 - Rounding toward zero.
>> +           01 - Rounding to nearest (default).
>> +           10 - Rounding (up) toward plus infinity.
>> +           11 - Rounding (down)toward minus infinity.
>> +
>> +   ARC FPU status register bits.
>> +
>> +   [ 0]  -> IV: flag invalid operation.
>> +   [ 1]  -> DZ: flag division by zero.
>> +   [ 2]  -> OV: flag Overflow operation.
>> +   [ 3]  -> UV: flag Underflow operation.
>> +   [ 4]  -> IX: flag Inexact operation.
>> +   [31]  -> FWE: Flag Write Enable.
>> +            If 1, above flags writable explicitly (clearing),
>> +            else IoW and only writable indirectly via bits [12:7].  */
>> +
>> +#include <features.h>
>> +
>> +#if !defined(__ARC_FPU_SP__) &&  !defined(__ARC_FPU_DP__)
>> +
>> +# define _FPU_RESERVED 0xffffffff
>> +# define _FPU_DEFAULT  0x00000000
>> +typedef unsigned int fpu_control_t;
>> +# define _FPU_GETCW(cw) (cw) = 0
>> +# define _FPU_SETCW(cw) (void) (cw)
>> +# define _FPU_GETS(cw) (cw) = 0
>> +# define _FPU_SETS(cw) (void) (cw)
>> +extern fpu_control_t __fpu_control;
>> +
>> +#else
>> +
>> +#define _FPU_RESERVED		0
>> +
>> +/* The fdlibm code requires strict IEEE double precision arithmetic,
>> +   and no interrupts for exceptions, rounding to nearest.
>> +   So only RM set to b'01.  */
>> +# define _FPU_DEFAULT		0x00000100
>> +
>> +/* Actually default needs to have FWE bit as 1 but that is already
>> +   ingrained into _FPU_SETS macro below.  */
>> +#define  _FPU_FPSR_DEFAULT	0x00000000
>> +
>> +#define __FPU_RND_SHIFT		8
>> +#define __FPU_RND_MASK		0x3
>> +
>> +/* Type of the control word.  */
>> +typedef unsigned int fpu_control_t;
>> +
>> +/* Macros for accessing the hardware control word.  */
>> +#  define _FPU_GETCW(cw) __asm__ volatile ("lr %0, [0x300]" : "=r" (cw))
>> +#  define _FPU_SETCW(cw) __asm__ volatile ("sr %0, [0x300]" : : "r" (cw))
>> +
>> +/*  Macros for accessing the hardware status word.
>> +    FWE bit is special as it controls if actual status bits could be wrritten
>> +    explicitly (other than FPU instructions). We handle it here to keep the
>> +    callers agnostic of it:
>> +      - clear it out when reporting status bits
>> +      - always set it when changing status bits.  */
>> +#  define _FPU_GETS(cw)				\
>> +    __asm__ volatile ("lr   %0, [0x301]	\r\n" 	\
>> +                      "bclr %0, %0, 31	\r\n" 	\
>> +                      : "=r" (cw))
>> +
>> +#  define _FPU_SETS(cw)				\
>> +    do {					\
>> +      unsigned int __tmp = 0x80000000 | (cw);	\
>> +      __asm__ volatile ("sr  %0, [0x301] \r\n" 	\
>> +                        : : "r" (__tmp));	\
>> +    } while (0)
>> +
> 
> Although this code follow other architectures, I think it woudl be better
> to move forward a macro that emulates function calls and use proper
> static inline function instead for _FPU_* (as for get-rounding-mode.h).

OK. do you have a preference for names, existing upper case names OK ?
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
