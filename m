Return-Path: <SRS0=uFJY=5Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518F9C2BA2B
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Apr 2020 23:38:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15CB820730
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Apr 2020 23:38:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nAvhboCx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dgolvquD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rqd3vOHD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15CB820730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+TuirFqDNyua29Y0hTXCe1vTwNdJ4ejyRu+tma6crOM=; b=nAvhboCxfJyg4U
	m8q4D3BhsCEVR2EZZVvAUiZhqkVR5gmnmyYLoVa7I8pAja33a3s0KvChKeTsq06Tgx9Fkoo7+8Ucv
	FW1xxyv2vE9lYSL+VliZsPspDQmk0qraKQCW/XtPiyXTeuRdjmCHl8AZaK0qgemgqHzGUoA61NRvN
	CE4qiIAfTNru8vXc6JTX+3vj6gdIvjSqHoQ91UZF3QzLVTwNZ1BE4mCSEy+WoSVJL6tD2Jw+zppGM
	e1aQRvvLt5X6GNqySYAaIBED1wRAyaMs3rHz0TEpfbwgVBAjV097kcR5+jdr1AbZQs/oTKwrlbXo7
	lshJdsx45qLogtzi4FFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMKHW-0000Zr-U1; Wed, 08 Apr 2020 23:38:54 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMKGq-0008HQ-Et
 for linux-snps-arc@lists.infradead.org; Wed, 08 Apr 2020 23:38:15 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0AB43406C6;
 Wed,  8 Apr 2020 23:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586389088; bh=0qEAa7ZGWjOv2Os6bh0ZiMmIA1XBFAjpMyoAnyBjE4Q=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=dgolvquDch1stZ8Ap5BmssIYQAYSIWF8dxWZ+CJbb8svNyA2ItbUU5fLsTJ/f4us6
 ua5JPN83uznxnyHBQvEKepZPdLQk3xH1cRsS6JsbnsimC4YglQG0t13pI6GYpldk+2
 gYBVqpf54FsEL/Pu2JIKBrUTq5hNAz5UMAM/tZPpTZGc4a8pZZsn+chk6n09z+qrmc
 L+a8xCD08NPJnJ5IrpmVgl+1VMENalRvM/0L3pDxJgQCeE6qcE56YSLpGJrgpq1BSh
 /5DP8GrRsOhF90LeuaMDDk8YdOBDY1VVrUvDHyPJxZnh+jeNAp2Lhp4l/qXbMCJTlf
 OFGy1YmZJtCvA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 49C20A0094;
 Wed,  8 Apr 2020 23:37:57 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 8 Apr 2020 16:37:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 8 Apr 2020 16:37:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irfRbKsFdMpek+i/wIRMBHW8VzTFFOJ+ZZWha8Qci3zuhJzADrVC1qDxbR4J1Hl9FHZL3v8MDHtTcVKeVwwMN72RG9LJlqkYJFCleXTs1Ns8Q5AeeFHmuj8l04tayHKAC3M9iBkkBIBAY2Z1y/pDFs1oWHYyfRyB3vE70vDEYjvejg0B9NvfBa5loV0ECx2AE74p4S67PWz95ARupoz9eXjAxr/J70gTsccn5Zre2eUCYwIrC4/M23hUBrvYt9O4S0J4eBX3FkOiVX8Gyrqq3TL/7HuAOoZ3gk98ih03z52zxBS5jE02NSnjfnG4cBzCU+Q7+3qFdwJ8dCB+a5oVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qEAa7ZGWjOv2Os6bh0ZiMmIA1XBFAjpMyoAnyBjE4Q=;
 b=Iin3EXZZlbwIJhgXbFSru5j0bxi/NxDjP6HnRCnbGmdY0DRf5sIXoAVw9Z4NfqrMbTRvLx7bK51wLLowBXUWVwJ4HjeJemLzXDIydx+c53bHf2Xxlh1eZsm78nytTODcZhUlVEdy8GePaspMp+m/cF0Bhg/cEVJp8eTpYhdSLo/XNhH1XOzVmfujfCM76Eb6XSLo2aWCTXJlas4pVanhu0RQ6wDNvCrd00juPLJh3Ga0VwDbEZabgvKYiv+TnJqi2DaSN4kE2i098l+SYAa1iiVc5b9+/t98VfgOszHsSsd0cARdLy/aMA9PZm20lbCqc2G2j029Gqej0QYk4hhioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qEAa7ZGWjOv2Os6bh0ZiMmIA1XBFAjpMyoAnyBjE4Q=;
 b=rqd3vOHDkTFpjv6iJm7gPBTvZGW3BjevEEBWtFlYt91yNT31QM99Oq2edS4O/Ny5IpbpgiZFkqEnR8XlpOQ5DzPNVJoRX8BC1cbXsIiIVsvAUVFgukcYNhNS+u0bmlNdnp1spWFuCTvy0F65+2Rj1LVGSm3dinNrronjKtnv4rw=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3157.namprd12.prod.outlook.com (2603:10b6:a03:130::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Wed, 8 Apr
 2020 23:37:16 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2900.015; Wed, 8 Apr 2020
 23:37:16 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Claudiu Zissulescu Ianculescu <claziss@gmail.com>
Subject: Re: [PATCH] [ARC] Allow more ABIs in GLIBC_DYNAMIC_LINKER
Thread-Topic: [PATCH] [ARC] Allow more ABIs in GLIBC_DYNAMIC_LINKER
Thread-Index: AQHWBV3Xyr4b4o2+F0mAj752BCtP1ahifWKAgA11JoA=
Date: Wed, 8 Apr 2020 23:37:16 +0000
Message-ID: <7f81729a-6912-dc79-848b-4cdfa821d93b@synopsys.com>
References: <20200329000503.27897-1-vgupta@synopsys.com>
 <CAL0iMy0f0tt6UtBRyT1hn=FsvF5tBYVKmcxHq57rDbc9YEtO0A@mail.gmail.com>
In-Reply-To: <CAL0iMy0f0tt6UtBRyT1hn=FsvF5tBYVKmcxHq57rDbc9YEtO0A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:783f:3b56:3769:a5e4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39634a61-2450-4a5f-d43a-08d7dc15c597
x-ms-traffictypediagnostic: BYAPR12MB3157:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB315720AFE6958AA30C2AA4A8B6C00@BYAPR12MB3157.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0367A50BB1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(136003)(346002)(396003)(39850400004)(376002)(64756008)(6486002)(66556008)(4326008)(966005)(31696002)(53546011)(66446008)(66946007)(31686004)(71200400001)(6506007)(8936002)(478600001)(6916009)(81156014)(2906002)(54906003)(76116006)(316002)(66476007)(86362001)(186003)(107886003)(36756003)(8676002)(5660300002)(6512007)(81166007)(2616005);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1E13zVNcSLqW5potpgae546peC7/0JP6A+ME6tNAV7iv5BtYuX4pJml7Sw3hz/3ZNi2R/MD+scz71BYJgKZvM/cj24FcL6hHBPcxbiab4rWFZduLi5gm22OrAB89NiTXIf4MuaqdzTySz9XSff6ssABXiSRGMA+oCS++BOPam1Qo4FTrcQ1KBBUtvLxSehg2N9UxvYf12rEjnrBkG0+jPutyQeccsfLsuACXOLnutqm5AdpZL3dw1LFaNX2bLE7Kj3aU1eGR4ETxNF5/hQtazWA2Z7pTBr/yBVPYijjbeBXwoLf5lB1mKppg0GGBwJuv88oSEaoVy3VNdSWY+M92o8LHF+OELeiwOuLIwokwnKHiJ4p9IdhUimRH01Cpxryo+4q2x5qTamC/XKl2GJrt01tu1/pu/vIiJ5bZEb23rZZKbhluWc0B4ns0D/ouPe6Bhk6kSTSc8aCVJS/YABOAIZ7ZJW4LkEAUXI53dXpUVpEw1krkz05sibPbBIrtCdZ+7h1D5MhseAzjdzOHwU6iGQ==
x-ms-exchange-antispam-messagedata: fphUL7Nyf62Uad/I3ECHRH2GchS0dTVovcRgYbOEJ7/kgrFoPmV/ljYOzUWk+sf1UdQeh0GsZtKD9Z6JovRKFoAqMwZYbFsxIF5wa3kDkYatitwwKktN4c/d6oq8cITEtdadT1OltO8qPN0j4mLnX1V3+8H8+T6m+8JgEAKaX2HPA+ahTvKr0VfFtl7v/+vfOnyIgX8+Zt61Wlk4J13Jjg==
Content-ID: <2BD175F34C1AE44E9ED5434E6F0BC786@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 39634a61-2450-4a5f-d43a-08d7dc15c597
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2020 23:37:16.2351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ny1p03FhQyQMuI4En9lgjftqbKdehbkf14ezge0UmnY4dOZlsjT1Q7lseLHXGzLjCzJU+kExp4KXW80fsatgEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3157
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_163812_645747_370DD4B8 
X-CRM114-Status: GOOD (  14.66  )
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
 "gcc-patches@gcc.gnu.org" <gcc-patches@gcc.gnu.org>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Claudiu,

For glibc needs can this be backported to gcc-9 please !

Thx,
-Vineet

On 3/31/20 3:06 AM, Claudiu Zissulescu Ianculescu wrote:
> Pushed.
>
> Thank you,
> Claudiu
>
> On Sun, Mar 29, 2020 at 2:05 AM Vineet Gupta via Gcc-patches
> <gcc-patches@gcc.gnu.org> wrote:
>> Enable big-endian suffixed dynamic linker per glibc multi-abi support.
>>
>> And to avoid a future churn and version pairingi hassles, also allow
>> arc700 although glibc for ARC currently doesn't support it.
>>
>> gcc/
>> xxxx-xx-xx  Vineet Gupta <vgupta@synopsys.com>
>> +
>> +       * config/arc/linux.h: GLIBC_DYNAMIC_LINKER support BE/arc700
>>
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
>> ---
>>  gcc/ChangeLog          | 4 ++++
>>  gcc/config/arc/linux.h | 2 +-
>>  2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/gcc/ChangeLog b/gcc/ChangeLog
>> index 86ad683a6cb0..c26a748fd51b 100644
>> --- a/gcc/ChangeLog
>> +++ b/gcc/ChangeLog
>> @@ -1,3 +1,7 @@
>> +2020-03-28  Vineet Gupta <vgupta@synopsys.com>
>> +
>> +       * config/arc/linux.h: GLIBC_DYNAMIC_LINKER support BE/arc700
>> +
>>  2020-03-28  Jakub Jelinek  <jakub@redhat.com>
>>
>>         PR c/93573
>> diff --git a/gcc/config/arc/linux.h b/gcc/config/arc/linux.h
>> index 0b99da3fcdaf..1bbeccee7115 100644
>> --- a/gcc/config/arc/linux.h
>> +++ b/gcc/config/arc/linux.h
>> @@ -29,7 +29,7 @@ along with GCC; see the file COPYING3.  If not see
>>      }                                          \
>>    while (0)
>>
>> -#define GLIBC_DYNAMIC_LINKER   "/lib/ld-linux-arc.so.2"
>> +#define GLIBC_DYNAMIC_LINKER   "/lib/ld-linux-arc%{mbig-endian:eb}%{mcpu=arc700:700}.so.2"
>>  #define UCLIBC_DYNAMIC_LINKER  "/lib/ld-uClibc.so.0"
>>
>>  /* Note that the default is to link against dynamic libraries, if they are
>> --
>> 2.20.1
>>
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_mailman_listinfo_linux-2Dsnps-2Darc&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=7FgpX6o3vAhwMrMhLh-4ZJey5kjdNUwOL2CWsFwR4T8&m=MrObyH2ki95_7m_xHpnWX-k9eIMOsxMuSa48qhxYOCY&s=3ggbGwaiJuSFnFECy0ItuwBBMDAcriwCdSc3GA0UFig&e= 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
