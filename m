Return-Path: <SRS0=t4uf=4H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A280DC34031
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 00:57:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 658242173E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 00:57:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PYaoqi1B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KeNoDJuV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="P+UJgUTx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 658242173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNZGJ7zjHLWwkjWaN7MYrR+P6xGrdqIeiWL3VBfrpeE=; b=PYaoqi1B0IPrIi
	dzlFuqzSIa1RRoDV3Q3q02TBcIl/t5aHZ/3GnVRG3Bmf9DldpQ8SpEBEzQvuYls14rUu+oygAXYeb
	hdtdDa5fR2nI3B++TDMOgiy9LvZAb5/QPQZID2WWyZ/A2/yrvYbeolCSBJieUO7TDPcgtexWwT0cA
	PM7WC2DJkpbIkPSq+jcg6Gx+pr29cUsBIWK0xFxXrXyxWKetoHWT/nutnOyeEb5b217e8OBxQIHKG
	YdDOPPmEgjEdCCWJAZgK7uxvgWHNp2xAfYcmS6TzWnWclZEhfkwhe/QbY2cWyNJjtveGGGmqoUG1a
	Hy0oSJEGkEFNuakFEJRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Dfl-00037S-Cb; Wed, 19 Feb 2020 00:57:05 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Dfh-00036u-TI
 for linux-snps-arc@lists.infradead.org; Wed, 19 Feb 2020 00:57:03 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7065FC0098;
 Wed, 19 Feb 2020 00:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582073820; bh=SgQCtN93Pc2Sv3+huP7YhQZvjcHNKNFuWkUeK3EdAVM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=KeNoDJuVZsBRoyrRswi+stjSVxs1dj43jbCN+OJUEl9Mw94AfssExvAeWCYE89KXV
 e3lQkpDZoyfEySghjNRlDW1ewb61Xg1mA4B78yyt+0uDgBt+achLPwp5wvZ40jMcnV
 4aHeN7gR3N7ZbK3LTSl7d1JYPeNUbYk1jMeHE98DIPZgFwN45rgeThUZVCtEocGTvA
 en65OxXyoavmMnsMotjI2UrwRy4cjpZ+QsO+Exyh2Jh7oWfMr44xUhK+3GQ+YGOc++
 L66NJZ6K6RLCtxJWtgkygoz9KqKZLpgVRWmQvUTWZm9M0icEZkx/9iHtqjTKnk+rDT
 EdttZNN7VTscQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 229A2A0083;
 Wed, 19 Feb 2020 00:56:59 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 18 Feb 2020 16:56:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 18 Feb 2020 16:56:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJw+PDeBl+YcQy+C/HFfHH3wwvoypE9DqKHbM4J8uQgKvuORpFrtyDhciyeRkJ+1Qd7qYcQcK4LynIS59ieSmr4YiTJCBp9rmSjajdV6/uaXRv36bnRkG6in/DmneZI2irWrDhdMYP0+lVnNTQXP03grXwPlfvWgKAL58hAr6ZS5AAtlByula4MLqlZxIq4ccjlhRWs7+SEZay/Olcf1l+SopBaedW8ax1/zKyup87lxA8nER7Zsl1nGYHdseaN2we6LzT1bXbg3JxcNfjUU21P4FXvHLYKAgTMsAIPtshOCEmL61tZ9wtfo9mn3bBrE6bWDMN4uQzmlYzIn/FxHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgQCtN93Pc2Sv3+huP7YhQZvjcHNKNFuWkUeK3EdAVM=;
 b=D5vzKupUCd0NTMBWd4bWd0/yEiiMKP2+BEDm+eL6kN5vcLmP6+ULNSRypaRXPdOo/Z9tU5+R1aEe/QMOy6IIIPXpe2lwTCfh9+yHiAcNYgoe/zBKGQ4xBf34vM2/HrtAHNv8KIy/AyORaTbH6y3Jax90zPeYagYfDBYXEyu1eDThzuU6sxNTq/fuAE2x5Ah3I/708/sqjULdbf/zAdRP+0K7YRBAERx8lD+Jq5+m0XieH2t7nt4w2stDCWLEvDHcZcTUSUNinMq6PL6OQ5Ln5FF3GW5RC6kZ2Pj+VYwYHMseNacN7Llyryl+s1G7PbPIMohDVPtbLBCalkErnt2DeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgQCtN93Pc2Sv3+huP7YhQZvjcHNKNFuWkUeK3EdAVM=;
 b=P+UJgUTxo8u20k5RGBuBMq7m4yHP/AxQWW0olrDo3l+Kbu74DJ59GcVjLli2pReLvhhwH74+psS4ms7Gpt8OUq+VqITHxZz7vJZCXklNyqzj1J61KKMyqWeoOK68sCLs2v0e8jmJp7VVUgF6tPJgSqMyJCCnZRUfKw5AJRJLswY=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3253.namprd12.prod.outlook.com (20.179.91.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Wed, 19 Feb 2020 00:56:56 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24%7]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 00:56:56 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Alistair Francis <alistair.francis@wdc.com>, "libc-alpha@sourceware.org"
 <libc-alpha@sourceware.org>
Subject: Re: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
Thread-Topic: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
Thread-Index: AQHV5r98yBwAtZ909UCZTNuzjj/4mA==
Date: Wed, 19 Feb 2020 00:56:56 +0000
Message-ID: <67f2298c-30ab-1508-4a10-6ee285df7ad1@synopsys.com>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
In-Reply-To: <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b892c15-5b96-45a2-d1ee-08d7b4d69e19
x-ms-traffictypediagnostic: BYAPR12MB3253:
x-microsoft-antispam-prvs: <BYAPR12MB3253DEE2990D0C3E7E8242BCB6100@BYAPR12MB3253.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(366004)(376002)(346002)(136003)(199004)(189003)(8676002)(71200400001)(6486002)(81156014)(76116006)(66476007)(66946007)(110136005)(186003)(2616005)(54906003)(81166006)(66446008)(4744005)(31696002)(66556008)(64756008)(316002)(5660300002)(53546011)(6506007)(2906002)(31686004)(26005)(36756003)(6512007)(4326008)(86362001)(8936002)(478600001)(7416002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3253;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0aO53Oy7wNx+ctzAHTQhR2nmRYvuunUtpVYvAV3Oef2jq3EqSx3p38fv7l9wZg+G2QZuXwNDzZCz2GTGR4uuwrEL9jdKjhdJs4cb+p/fdDmFWgZsqQ5Sw83joG04TVKd3klpcb6ZTVtxXDQL7ZjYGmSmhU2OoGbxH9y1v3uCgZE8/PsuWx4SI0zaZqLvetxH3lYYeMHivElDckgAVVCd3q+P65/t3dSdLamqAvPdwvRFJuVU/E5IlsTX9VHjvJhBga6vjC9GVD/tgMJxCzsl7BX6nonb05nTk9Oh5Yb/1ylrSQ5UVu/UJ5N2mP+dy89f22+mOA1Osa+jWCTNk1xp9XOqAqQfGq/pKKkbIIGemKF991IOpv3zZEHj/J+cQLvMWT8iv+Id9hDFdeNGjM6opCtkYrK9ZpdbUIKT0oKKoUrh+xTbu7RuhogQk82/HHWE
x-ms-exchange-antispam-messagedata: TCbwNLTOgaRW7iQiBG59P4TbFEplamLFkPdXFyFbaoheOg2SKe1/hgVgaA9tWR05NClaG+C8X8oMdDRsicog6tblJn56YjTxmwb2//RTQVfAWYN2N9n486OfcbC5GKKGekN79NI73wS7SJ2KD//tOA==
x-ms-exchange-transport-forked: True
Content-ID: <A976401EDFDF4D4DB9C25E478991B3B5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b892c15-5b96-45a2-d1ee-08d7b4d69e19
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 00:56:56.3618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dZPKpKvbXK2uy3kyc+NBWRmkKV8RsZ/7VJUcTl+tjJeIXI9j6zkFu4sqYXcnT2EiFkCOzxuJnl1Tjk+kw/EYkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3253
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_165702_015641_7012080A 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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
Cc: "fweimer@redhat.com" <fweimer@redhat.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "palmerdabbelt@google.com" <palmerdabbelt@google.com>,
 "zongbox@gmail.com" <zongbox@gmail.com>,
 "adhemerval.zanella@linaro.org" <adhemerval.zanella@linaro.org>,
 "macro@wdc.com" <macro@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "joseph@codesourcery.com" <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Alistair,

On 1/12/20 2:33 AM, Alistair Francis wrote:
> diff --git a/sysdeps/unix/sysv/linux/riscv/kernel_stat.h b/sysdeps/unix/sysv/linux/riscv/kernel_stat.h

[snip]...

> +#define STAT_IS_KERNEL_STAT 1

Isn't this irrelevant: seems to be only used for legacy __NR_stat/__NR_stat64
syscalls based__xstat()/__xstat64().

> +
> +#define XSTAT_IS_XSTAT64 1
> +#define STATFS_IS_STATFS64 0
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
