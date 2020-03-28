Return-Path: <SRS0=RUT9=5N=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054A6C43331
	for <linux-snps-arc@archiver.kernel.org>; Sat, 28 Mar 2020 06:44:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6B9220714
	for <linux-snps-arc@archiver.kernel.org>; Sat, 28 Mar 2020 06:44:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WLW0S8FC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OMUY0vgd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wQT1pLx+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6B9220714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2ZxBKOCBzg98ZQr9/F+qmBaD2NK1kSR3FuRPMgWaRw=; b=WLW0S8FCb4tmPl
	l2iGXsX55INtfZ0t4i7Oa3e6E4YVDSzcNpvhG2khpj+EmXKj6v9RGrHyVEZm6VsvMr1XdoyiSybBV
	yk4H11w3ThxuCsna2tERopiQq7G07omhvhAF0DHNmR5GsEa8RU9Xz3z8BTmyQl0dM0KhXa6b9y/By
	SavbqghfYPsSs+67vyqjST+G6lB8b0h36/KRcMEjWoKmkP/jOltx+4/KEmQ5RufK93LKD/ILk+fyj
	6KQWEnVrs5WMpsD1+J+YV1kcHz2KZ8UE3BlzaQcnGRNRWQbvxS6sRH9sXb7bgavpslV7+B8Zr01hb
	m2rU+Vjq+QKy11Sm4Ecg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jI5CO-00055V-Jn; Sat, 28 Mar 2020 06:44:04 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jI5CL-00054T-H3
 for linux-snps-arc@lists.infradead.org; Sat, 28 Mar 2020 06:44:02 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3190AC04C3;
 Sat, 28 Mar 2020 06:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585377836; bh=Lr9wcd5uDu/vlAg7y7iKUk0/jWAE92RgLkRg13oGcFg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=OMUY0vgd5TZsg9ltnKfmg1qm328GBv3PyVWytN7idkT6ZdLK/QwNo7c+V1a2QHOus
 a8HCTMWx6AmLpRe+nVfH3D87edRqdBiRzvzeNDzEhpsPZy2wrq7H3HPYgt635/MQOo
 p+fkghEhfYM6m3GwlLldj7sg3R7NFToJfcvIlDicHtHeqPmdk40sHogvOs+QeCtZbS
 5wgQqawotRkT7dd+EkHAU532NEot0bEQae2Uon4G0qQzbHr4IhAGpY1cKzH+q66J5z
 mwg57hQPwXNFD6gHxBPlL7OPqYP2PoULXxSvYJycuW2+mCYYkf9OyFwY5g/Fj/HaLR
 oxSOD/dfhjYtQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C8881A00AE;
 Sat, 28 Mar 2020 06:43:55 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 27 Mar 2020 23:42:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 27 Mar 2020 23:42:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKpiQgyLBEPehDPtqxMuhfpM7Z4sRYFzQXVFFv45d8KIR+gnD4KzaPE4FztFtInSPKO0HH3ScvOQr7KOaaklaRAjaKu6r48OFpMdgCVUvVPTmnETzpyuGhTf8csv4q7pZmailbT1IvsFLBTF392gHv5H3nhTjSoq6BWEJqXzPCei2DSg90tw4Ygywb4z787EWCmcy7QOB4uiD1X8b2rrcsuo8/uoR5wOYoGlrgNZIq5e3TEW1IAxKfV8nM5kw4DMOo/d53+lFJDoy+sMxyxQoC5W34f6YCGMpal/wR+a+UYjKsTwvKoyAixTQwVzMYNgT4/mJ7DyJyPObHyT6jxRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lr9wcd5uDu/vlAg7y7iKUk0/jWAE92RgLkRg13oGcFg=;
 b=j5yQvLIkxzhS6g5X4ZHcUQVFsZqvI+sCybBAjQz0uHddrTc66cYdS3HMgWAMScZFovTua5tlgTBUI/NTruS+h/NYe5sb5t9pdDqx1sOlmH6rXcckcCfscY7AHKRl5iBUjqUKnJ+mrsY/3SsVF/Cnk3ooAXXcl/vsC+n5mTullrIJdfiJ26q5MCF42RMeuG8DPHJUchqNDFImelLqU6Fq7mfxY7YYdnDMyFT6Ahe2uPY6KdeXfgpQgRkpeL6ecNc8Em6yOw4WRkl/Vtf4dsPxgzVlCqvelZ9KnhIflahQnuQmBz/Wtc/Li37eU3jyICcHUlWLAZEFkMyyvzGioDz1LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lr9wcd5uDu/vlAg7y7iKUk0/jWAE92RgLkRg13oGcFg=;
 b=wQT1pLx+/CEjUtw7kTq4aWBoW5KC58rJMIJ1J8fYIF2Gifu8GnahhTSkEQhphXMXOwXy/ECTAs/KUMtcpv5mfbgYG+GMfm3de870u6xAFie/3IjCeKfFDHzPlyfP9RM3JNEW4BPUNyGYS4yxQrtInEeCCj7Y+BY0u4nAlZA0i9Q=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2902.namprd12.prod.outlook.com (2603:10b6:a03:12f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Sat, 28 Mar
 2020 06:42:55 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Sat, 28 Mar 2020
 06:42:55 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v4 13/15] ARC: Build Infrastructure
Thread-Topic: [PATCH v4 13/15] ARC: Build Infrastructure
Thread-Index: AQHWBIm8F++2Uf3ML0i/ZM1l3z8zH6hdjyEA
Date: Sat, 28 Mar 2020 06:42:55 +0000
Message-ID: <86b7b480-da30-3eb4-3e1d-1d8785604770@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-14-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003272238480.5132@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003272238480.5132@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: 8ece33a6-2ca4-458b-c5ac-08d7d2e33f01
x-ms-traffictypediagnostic: BYAPR12MB2902:
x-microsoft-antispam-prvs: <BYAPR12MB290235A0C46CDEE5D7C5E2A4B6CD0@BYAPR12MB2902.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03569407CC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(396003)(366004)(376002)(136003)(346002)(31686004)(2616005)(6486002)(6916009)(76116006)(81166006)(8936002)(81156014)(186003)(53546011)(36756003)(54906003)(26005)(6506007)(8676002)(31696002)(71200400001)(4326008)(6512007)(2906002)(64756008)(66476007)(66556008)(66946007)(316002)(5660300002)(86362001)(478600001)(66446008);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b2L3fVGIgwp3sZBeSK+UoHWr6B2S4ksP0KusHryZ8zx45jWwnCP6OO2e6+XqTZHP2t8d5MFDYIGjx7nqzTFaz+l86TCgRvyEF3R4WiZy5+YVi668DDJh2xGKljb4RCBzv++ta7X6aCGTqf7QAYf+pbSnXKFLRnr7vocNeLNuS3mKb2/RLSew9TsPS1OFEZ/9rtUNSdSZdKbb6Z3nOcbE/Z7Jd4QjiZYAJXlLAy813KrpgiByihBEGnP/ZoIKfjG//eQ0Tjx8UsdUrSdjbpSZ7HhvHnDQpdXczs65S2fvPmJsOQRgLi3DzDVYEBInrzto/LgEFOFFdVmu7WBMWZ491GfH8mXHrggiLmaeU+pecxOLXXAmdqVuiDkAsW6c5/UjCzyV7wVwOkTgLGWYOiab0H+SKHr8OpR6pIwQ7KF9xDlqtqGTpkbXIfS6BZLRvxGU
x-ms-exchange-antispam-messagedata: AXigpcalgjK5g4LDEFFvsiX/hPWTzrlZ0YJMzgkf7DMjLeZwpuAiOIK36l/YbnltDxn0H5KbZSuQoM1dQBMR3SNYc8wa6etQ7o/FQOw+93BqYxn/UcEaNb328LLTgwWyYbsBM0sA8w/AloOFdXwH2Q==
x-ms-exchange-transport-forked: True
Content-ID: <8D5D8C05E0977244B057D4D16259547D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ece33a6-2ca4-458b-c5ac-08d7d2e33f01
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2020 06:42:55.1425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SVC0/rptQmueesXY/FGluMWMUlVzxeiDyMvY13GBdnRrFLsXMiXRz+eUgo1Y9drDQNhOngGi1vQIJtAiQQrbww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2902
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_234401_665441_28DE707C 
X-CRM114-Status: GOOD (  14.49  )
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

On 3/27/20 3:47 PM, Joseph Myers wrote:
> On Thu, 12 Mar 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> +ifeq ($(subdir),debug)
>> +CFLAGS-backtrace.c += -funwind-tables
>> +endif
> 
> debug/Makefile already has
> 
> CFLAGS-backtrace.c += -fno-omit-frame-pointer -funwind-tables
> 
> so you shouldn't need this.

Ok removed now.


>> +++ b/sysdeps/arc/Versions
>> @@ -0,0 +1,6 @@
>> +libc {
>> +  GLIBC_2.32 {
>> +    __syscall_error;
> 
> Why does __syscall_error need a public symbol version?  If it's used by a 
> library other than libc, that means it needs to be exported at some symbol 
> version - but it only needs a public version (as opposed to GLIBC_PRIVATE) 
> if it might be used by user programs linked with glibc (if it's used in 
> crt*.o, lib*_nonshared.a, or inline functions in installed headers, for 
> example - or in libgcc.a, libstdc++.a, etc. (GCC static libraries)).

We'll historically I've preferred an out-of-line errno setter in the syscall
wrappers and those are used in libpthread et all as well but not expected to be
used by user programs. See my sysdeps.h

> 
>> +  gccfloat=`$CC $CFLAGS $CPPFLAGS -E -dM -xc /dev/null | grep __ARC_FPU_| wc -l`
>> +  if test "$gccfloat" != "0"; then
>> +    echo "glibc being configured for double precision floating point"
> 
> preconfigure fragments should not print this sort of debugging message 
> with "echo".  If you feel such a message is important, use preconfigure.ac 
> and print it with AC_MSG_NOTICE.

Not really needed now, so removed.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
