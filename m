Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7528DC2D0E5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 18:54:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 123532071B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 18:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tWqaDj+6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="i8i4rR5J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PcrZyhT+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 123532071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWm+gtxb6szmndLnvFKbFwKM/pTFNRF2MHkgkueKeJI=; b=tWqaDj+6O3tYxy
	S3yIw2kxVb3d/rSe0Jy1XmAeHdxVuOlskm6Grpy1dQdcGbrywiVdjNfD8aGxb2f+CJRPj6b+x+TqA
	j2kVFRpXaNb2GWM8HHJZL0aj4NGF2yKgAgHwDLyQdtqN6w6QGWB/l4jR3naIe7mVKNTbpQEsibgMi
	oHucHAQfuwhGIVw7kahCqycCz1Mlz/tZJ7D/o3T7whHMtGl5B3zlmt3PgaLwck7toeLCa2+Dzhsj8
	GMblFq12U3PG36kCtJdcAOLi3sMKgD9qyDD4fn5SjVo+LdSMP3ZmNeoIcK26Rl9N82sFF4L1gZ52b
	d+tRBosTZPadLB7s2NrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHu7W-00065K-9J; Fri, 27 Mar 2020 18:54:18 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHu7T-00064i-Et
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 18:54:16 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A9ECCC0FA8;
 Fri, 27 Mar 2020 18:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585335254; bh=z9i7ihgLim63NPIKmaB6WJT/PlKHyiWsht49X96sKSI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=i8i4rR5Jo7/DFYryDxK5aXiH75UjXTZow3eeACIDajH8A/dta7fp2bkd9DzVAPw26
 LP/3D+El22i4WfNV1Axjis1HW+fKtByxXVzagpIKeCrJZ8kDIUUN8qncUVZEsqLTs2
 /s0PRcPueZnDFKD+aSyT1/nSbDO+mBn10Nwj7nKU8piaXDTRQVT+s/iUhCuJbJJdJI
 WHu+5TDB7hdqCp/FzHPzzKyXqmspszSV0z5k39NpPCEJ0tZmrSLkxuBlIB22mMKnpk
 uV6G6AK2zvfUVxCw56KsEta6h25OijhoU+b0em5TldZFp3hx13n8HQThCbTr5GbHYf
 JWxDbX7OTyuiQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0A71CA006F;
 Fri, 27 Mar 2020 18:54:02 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 27 Mar 2020 11:53:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 27 Mar 2020 11:53:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnpCUGg4c5AbMOX5X5Wax5Ep+a6psrq9Jvql4j4jLH8ltUwxpPUvUBf+ntDTi+4DS9iAWoXV1KbHSP6L7WVsAkI4L3tyU2ayV8lGwwEJbDMJYZqMQKQ00rAyGWWXFgDdv1di+1aE6gPFT+4ujDFQiPktP3UQI8prx6Ckp0g3UkIX2x/y5fIc23Sg5tMcmYw5PwsaYpBiooK+vzzbSxZtf7Rr0Rs+srygrvkSfSqDEvEE06svsmIWRJ6qHli29V0EUbwPQMJvJm842mWDtvz2LaVM5V/e2F6TnZErTwSFsQx5LzY2hc3RzhnZNEAHKVwrrVO/x1JBMQO9cg/9Lv3YFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9i7ihgLim63NPIKmaB6WJT/PlKHyiWsht49X96sKSI=;
 b=k0oLGSyVMeo/XuMgRovAQlQ2Gxxrwl/3SGmN+16sc9topzKNSnMe155PNr9lBRSpuG2UOVPOxhMiV/hcAiFqa7UfxlEGyDbJdGLT43lPwS8KLCQmx1dbSTkjX6eVg2SK2Ecq3JRU/Gnoa39K3FKei065tNUgSEOnPsX5TJnVT0aulFmXqHorwGKXKTFQuZyfbq2zEhYtTEoMozFsXsBufToN9Kyi3j5ozTBHjfGh9sR592GMDTVH8BeWgcs+KvrQ8h2qa13COQuPCgytq6eL8hE8DBvIxA1YoQHi9Rql1EW9N3Y+voEGqSv/NalOs8NGNf42k9HDxjmIPyyP32xZow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9i7ihgLim63NPIKmaB6WJT/PlKHyiWsht49X96sKSI=;
 b=PcrZyhT+vAM8Ujx15PcnSf4++tJxqWQAGAEwV6pgpkGIs+bqDfVh+kK0mhDkyabsuXy3K9BGnYE46yRtvyxIDS0emSzxaRH1fOpJLny7TqrXrRzCmLoStkZ/Q6uI5peATqwr17eKbBqbF6Z0CVL6LoJhVZzDnBpTrlHJlcitFVA=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3528.namprd12.prod.outlook.com (2603:10b6:a03:138::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Fri, 27 Mar
 2020 18:53:54 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 18:53:54 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v4 07/15] ARC: hardware floating point support
Thread-Topic: [PATCH v4 07/15] ARC: hardware floating point support
Thread-Index: AQHWA8V3/HU3G+1WgkmSNEo6yildgqhbrLgAgAEZM4CAAASogA==
Date: Fri, 27 Mar 2020 18:53:53 +0000
Message-ID: <5c91cf0b-7521-c110-6e84-233b18a6f924@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-8-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003262311330.24611@digraph.polyomino.org.uk>
 <7462f741-d7d8-57f2-0fe9-c21b4b2829eb@synopsys.com>
 <alpine.DEB.2.21.2003271834390.5132@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003271834390.5132@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: b8738771-6faa-439f-d572-08d7d2803279
x-ms-traffictypediagnostic: BYAPR12MB3528:
x-microsoft-antispam-prvs: <BYAPR12MB352863065CF7AABE43355AA8B6CC0@BYAPR12MB3528.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(136003)(39860400002)(376002)(346002)(71200400001)(4744005)(2616005)(186003)(26005)(6512007)(31696002)(5660300002)(66476007)(66556008)(76116006)(64756008)(316002)(31686004)(4326008)(66446008)(86362001)(66946007)(6916009)(478600001)(81166006)(2906002)(81156014)(8676002)(54906003)(6486002)(8936002)(36756003)(6506007)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3528;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jORjMPhMcZCMvY4RRy1sVQfF6AdLn1aJbPPqcNw4NyPc6vi7VbPzBoQkFVktf1VGBILXgCh1GLAVMFaFd8uw+l3dhUHdO8LKWA20colz8gRY56vxlIvLpubwDDj2raLYt0x23oWDdQxmW/N8youxDNBsblxaOA6AwLcLqgPGDtqO4Z3S46uBY0VbTUQP11buLXi/ZrKXajTdk8SltgwPsQFC1R4s8fg4Rnydc/GbS6ZPMxIoyvE3EiBxfVvbo7ju8AjuANdFzqkXxFc6Xbjq8ZOhfSsDATQAY+f3F8MF9u5gZCdjUazEBEUr86GdINEshY2mAlQ+Fu8ag/w920K1UiLtv4R17xA+vIg7UsEwW0Nqf0qzD8MED21UNNuhWFNqrtGi0Y/1pzqdp0latKZ/GO2co6C1VTq8qjO893s4aATZQylYEdlVz86Ik0C+TnRI
x-ms-exchange-antispam-messagedata: p3nPeWHWvsi7f4b0DcI5ACLdWdYLv1nj8GUxt0PMVBGcfEBNSI0MEB3XW18VljFUdqjirqNq7SR5m+F99ml+zC5Aqd2YkSjZOPFMgF7K77SbZ3FubVKwhWBETXUXHIjnfCuUu13wyiQ99uM1wMEroA==
x-ms-exchange-transport-forked: True
Content-ID: <FCB382DC89D04243ABF6C627FB2A31D2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b8738771-6faa-439f-d572-08d7d2803279
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 18:53:53.9537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T+cig70FYQQk8i4ZwZT3pzlHeea9rSs9+liOLlZ9qhxPLzhVNuCeXqU0UGBr0d8ZdtFguTxxa5USLTxOEwk30g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3528
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_115415_637367_3C441E01 
X-CRM114-Status: GOOD (  10.52  )
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

On 3/27/20 11:37 AM, Joseph Myers wrote:

> feupdateenv has to preserve the previously raised exceptions even in the 
> FE_DFL_ENV case.  It's equivalent to
> 
> exc = fetestexcept (FE_ALL_EXCEPT);
> fesetenv (envp);
> feraiseexcept (exc);

Ok.


>> In some places I have following:
>>
>>   if (((fpcr >> __FPU_RND_SHIFT) & FE_DOWNWARD) != round)
>>
>> So FE_DOWNWARD (0x3) is used as mask, is that OK or would you rather see
>>
>>   #define __FPU_RND_MASK 0x3
> 
> I think it's cleanest to have a separate define for the mask.

OK.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
