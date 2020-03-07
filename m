Return-Path: <SRS0=vrW9=4Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DE0C10DCE
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:24:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73661206E6
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:24:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ExQaHpl0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FkLs3UTX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="Jr4NpdCd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73661206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JY5up584lu1I/RoAO3hVcP2jSkEkIKu0/QKtUvDfzq4=; b=ExQaHpl0xtHXnC
	D65hVg+I3UkTm/tTlMjPlMweKjBxEiVoYQrxMc3yTInwyqbDP0LkN/n5R70mk+62zcI7G7OZqwpbk
	scXN1BtBNzHLW09otpXe6GYCNEdPiNz/cQD11JRBfnXuFkQjG6ohehUWJ6JtSJQAmwm2YnKzr5Pj0
	azsKPfc3MmS7KRUxcSN15V2mTzg9Vy7r1fm/l+uIkhuT2owtvdjq5r8C+AltXGoxdAL0S02P1XvKx
	4wsHg3RgbOF5+fTJTlixVKudV2AaG5F452c4zI/L6tPawhyPZXjfuu9nlAj7wAPwsVygLfsxhxxWr
	FlaXT5gU/Bqsgy3IkqUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jANGh-0000Bp-R6; Sat, 07 Mar 2020 00:24:39 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jANGe-0000BH-QT
 for linux-snps-arc@lists.infradead.org; Sat, 07 Mar 2020 00:24:38 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3B126C00C0;
 Sat,  7 Mar 2020 00:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583540676; bh=aNH1+7WnuMtKQphYFK4B6bRxM1mAY4TJL9WY+U6/YV0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=FkLs3UTXyEWgIRIB7cJY5ibk3TOOYwrVj912ut0n+vg/srdZrX7lOTV09zlg6QOXD
 e6vop1ekVkoxxXAYlNj81Xx5ipihKejbYK8bvdzNw4cfwOr9P+AkQazmojUC3/13U8
 gFdcHvd15OA4oSKzRRCa3hN+EXPvXnzHlR+HAHYZ+ictj/Jv49pmxRGnIy04j2q+qF
 GWj/d3vALVfvKv6G4vEW54B1r+eV86A9WQzOcViZvnTQQxFpjxCODP5Ee3r2MdiQVP
 cwgTavc1AsHQ4Lipx5+6QQlebslLAcRAv4Xmn783ENhgygUo6FFQ3XcvBrHq2yQ6/C
 OqOA5WaHGLF/Q==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id EC066A0069;
 Sat,  7 Mar 2020 00:24:34 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 6 Mar 2020 16:24:22 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 6 Mar 2020 16:24:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifUdbTktk3uQPdjAKn6ZEiaoKCZ2yqyJnAhLD0e0doE1Zu1meWtEa9k4bxXvNXINroK5gGjtPIRWqu+JJuSIemjA0H4dWe9w7SZOIKKnEXNcAmWN4r05fmw8tegBqLlSnaZ5tsH7rw5rce5rVcZJcxrc744xw5MDnWFc5unztgSaaTosphrNgP3+nZzw5kgyadBU6po9dmJHZz56XXG4zkyTlAjWw4qNP59Zz3YjSK0W/Kgxg+cPZdBhjOBZLBs6u4RIUuVz6WrhkVP7rBEI2+jDfXXgPD/E+pLgqLFMy7rz9p++sUN0DRkfZJ7ULGyoPvhnYundNly+9KtK7hYMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNH1+7WnuMtKQphYFK4B6bRxM1mAY4TJL9WY+U6/YV0=;
 b=OFxfGvtIN5betNzemnaz1cHeShjFMpHjxUMu1+plMfhfNz+WMcWF6aGjfgx92wBjtI463nZOxra4Z34vC3c3/Rk47wlfdH2+lGpvd0XvCUAMbgCdmX//fVWuCV2CEzPDTsfVjVhwqRMQMYqUrRN67XOp00KjlPNn1QDVKI5+cpJBUTJfc9vGj/G4sCpWRc52sgXEz5l5FYBYCSr7Nn9BmbPRleSYowaBhmst0+NkIFn4EW5XJLMMq6+r9z9vp8Jnoa1aFABPFiOYI7EcE2ySyv+HDu+Cr64UUVsulmpGKea2sY7u1xqqMhWFmbRJ/IoxcceaQB/eH8zD3936uKBDdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNH1+7WnuMtKQphYFK4B6bRxM1mAY4TJL9WY+U6/YV0=;
 b=Jr4NpdCdPhgF4Pfgeu6MDjKJyjl/PTVkxF5D9tSVvcnjOn2jQjc6nAkfcVAVq0lgEQfHlRxlgLFOB9VhQygpPE5a23Fy5uGctaDTjJSkcw5ckdy717x15OL/qEOaxk6DzLBGR/B8h/NbuQARyF0ziJcN1mxpFw/B5pRg8efEK3o=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3109.namprd12.prod.outlook.com (2603:10b6:a03:db::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.16; Sat, 7 Mar
 2020 00:24:20 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Sat, 7 Mar 2020
 00:24:20 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v3 14/17] ARC: Build Infrastructure
Thread-Topic: [PATCH v3 14/17] ARC: Build Infrastructure
Thread-Index: AQHV8+SKe9KpO2b/pEeCbqlvYAhCJqg8Q3iAgAACOQA=
Date: Sat, 7 Mar 2020 00:24:20 +0000
Message-ID: <7988b71a-5ba0-dcbb-887b-821f8aaf2eac@synopsys.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <20200306182419.13945-15-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003070015200.26274@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003070015200.26274@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: d8548877-c0c2-4fb0-380e-08d7c22de137
x-ms-traffictypediagnostic: BYAPR12MB3109:
x-microsoft-antispam-prvs: <BYAPR12MB3109A0756DEE9CDECB3E353FB6E00@BYAPR12MB3109.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 03355EE97E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(366004)(136003)(376002)(396003)(199004)(189003)(5660300002)(26005)(4744005)(6916009)(6512007)(81166006)(71200400001)(81156014)(53546011)(8676002)(64756008)(186003)(76116006)(316002)(66476007)(66946007)(2616005)(66556008)(31696002)(54906003)(66446008)(36756003)(86362001)(6506007)(6486002)(4326008)(31686004)(478600001)(2906002)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3109;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BWUHRk5s3WoCkcEDrJ2QIKxYItohy7hzRCW5cX1snoWkxyIS8glS3DqIn3L+D1/PQHLEq0Sj90lI8Q1UF5lgz+OSLwaWbsUoVWIvSVDYfSMgo03bdDFJIxmpBP+6i+xBq7QBiAYvXMa5qxoTKMYeI8K9TEpDMCafBdSNzdpA5oKVKvilGllHz7yjJH90x/Hjbw0PtjGj3k1Z3d+GD42XpZ/qowNWJ3Zdu1hoLKt0SjDhAQW+bY+pAOFZRdCN7PkuBSftXzCh5YX4XLkXYgLoAyQNh1F+1TD5GrglRIrlsABL6FUnign/ag7oe9KADv6BjYG4Q5pgI7RSWr03K8zrXwt8QaRK373nEBDUgHzUXVmvHkLP7SoqNzPy3gGDoBBuQg7h+s3aThUw1VjUrnCdBnWQmhLumNwcga56UCHKNhAgbpCTPqi1dAK2HoijjH3S
x-ms-exchange-antispam-messagedata: d8Se+LpUIM5V0zHcUAKREQwQgRf8fySfDtSJjadF4G5X6qMePTRCeDWLTbBLUXMKnWyphLwXpVFzJA6cwIkh4PUSgXqVmrtaJGK840gOG+LyfPyGudRRA+ysP5znzITQRcd3h6gLwgr3hvSfV4wO1A==
x-ms-exchange-transport-forked: True
Content-ID: <B505348A953E5D4BA27E906028854C36@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d8548877-c0c2-4fb0-380e-08d7c22de137
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2020 00:24:20.1965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8biGfHZBhvZ0I8kGADLIvKpwi/rP9BDVE3DLVWojFYyPWDnF1mi0xgrZIgjMtqPlVoyiaycifHVDTpG9JaFGfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3109
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_162436_924656_CA5336A0 
X-CRM114-Status: UNSURE (   9.25  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/6/20 4:16 PM, Joseph Myers wrote:
> On Fri, 6 Mar 2020, Vineet Gupta wrote:
>> +
>> +arch_minimum_kernel=3.9.0
>
> Surely you mean 5.1.0, at least until the glibc support for falling back 
> to 32-bit time syscalls from 64-bit time interfaces is completed?

Indeed patch 17/17 does that as that accumulates all changes for the 64-bit time
and offset interfaces.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
