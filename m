Return-Path: <SRS0=LyzR=6C=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B58C2BA19
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Apr 2020 05:47:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63D2020732
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Apr 2020 05:47:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J6qw5tEc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="l91FfMc4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HtjwpIjg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63D2020732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=auU1NGVSkiPhyCX9PPfN9kMYcBq1PuGiuTNTfBmOuVw=; b=J6qw5tEcUw3YqN
	Ab7AhNyBlkKktGWtmcdkGeOslsleOG5HgLiCfFW2gOtFa6pu8T06GkKc1x9K2AShO4bdtF7KeJsfD
	CHjF8NxEJGjYGRWfZDvveMxxkEgQUSZdMVJN5UB5QproZrvnTHcmbpH0e/hwLfMSqUu0R3abeY/zA
	2jBYS9Xfh5gKVu1c8zihBS9NiR2czxHNJMplv17nCeLQBsyAb2FzgxUwmygvH+j7V57pl5LUUBlrH
	PSXAYI1lQHQoWp4aXTiGr7knW4WXxPqCNBnQVmvoVIQlbIUu5Wa+MFIlEnb80F2qokUjsCJ5P1MJT
	bMhlr/MV4oJzsR+H4RCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPgJm-0005EY-Ke; Sat, 18 Apr 2020 05:47:06 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPgJj-0005CE-D0
 for linux-snps-arc@lists.infradead.org; Sat, 18 Apr 2020 05:47:04 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5BE3440443;
 Sat, 18 Apr 2020 05:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587188816; bh=EFTliknQOzuTHrUNBbURbwEbkBXwRIPOW3tD/SZTsmg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=l91FfMc4EQhGVqyVZZKPX6lNLrwtDHkrSq1jMZ6SJf0BAKzbG5eieSec2tjYG/doH
 XFhTMwMlsLFYPMhF1P7Cpz5jOu5Lxt9qUlB/8eEZRlCvSSD3iryCTv5d2iWFzqDqr9
 N0KSNpHrgNR64dcIy3EYqWYLttDqaQRURa23HhnLMhEKkr6cT6RdPcmSYLr38YEPf2
 +psbmOTGzsDjHr8WoTXuX9dLC0y8btVaO5G/1+iHkCijS+AnnCZmKpjHzzh9zpydkJ
 l24J+T4KGHJCP7xpLwLeIGgC6XMBk2lERIWnpOHqoEmV71C+YZ5w8BV5PyOF2MuHcf
 GrYCUVfh4bQnw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C5327A0069;
 Sat, 18 Apr 2020 05:46:55 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 17 Apr 2020 22:46:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 17 Apr 2020 22:46:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5GVtzUrUCnL7D+u9Mge/10kDqwXjMKpLJnhcb3HmcddBUlBBOPg0pBRtV+Yj2H5uVXl/WFCca80eJ1KCBm04UhQ05cE6NuJbnrJEiOtjWQLjW3S7ktEltv2NZnpQHWY42G+kFn8u8IadXqnUwHUDkeZbfdmRBc4P6ZrRmnhLzFY1rMJ3v4SkMM4ZMG075BUSZjUv8CcPqOw/uDOSRGDi/xwRN4WyP8gIjaXMQzb6VWrzArvg0PaZVMO8Vq3fPnfYB7kpQE4Drzk+R6Nzhp2jIKtK9IiL4BLdUS7dRzsqqWyk+j+KicvbxUgaR63smlJfjWZbrggAPCjd8ldkEaL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFTliknQOzuTHrUNBbURbwEbkBXwRIPOW3tD/SZTsmg=;
 b=FASzAz3kD0fkXAWW2kSDfQOpWj685wXIVlstqPWEElHuXSRHmsvUSvIAoxvIn8REsdbJHz58pWnJi2zJX5+Hff89T6xhgpjdABBk6xR1IzDXNG+mMBmwrRY6nmoNWvSN402hobMf8FIng+Gcv7xvAJM9MuXqAAbhHfhoou9KG14nC5YgdE8tKCbBfdqAwSZJWdtRWAkPR5sdCQyO9sSALtrNjQYM8DRATN/qEdoWprADxyIX5oSx0g7Yu8/yhYpZaDL2EwYSqkM8ZY4EzcyH7MiOH0IgWngoYoNjtAP+VHPTI8/3xBG2VB2DXa5GaMzXkOCpHIbZJgdnROWaDFDplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFTliknQOzuTHrUNBbURbwEbkBXwRIPOW3tD/SZTsmg=;
 b=HtjwpIjg1sxAgp7dorM7VcZQ1g6VhXkzRdt1TWVp+lQ/bqRVu6YLKgI1ZILboGjO5DibBfYFbELagRXQiF1/zzNkNUyzbmd/WY1GHfVkih5QPPFTM56TDf6epcZR47S2i735HNb/MuyK7ut3Z6+tztayuLRdgylJFFLQsWtWgZk=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3286.namprd12.prod.outlook.com (2603:10b6:a03:139::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Sat, 18 Apr
 2020 05:46:35 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2921.027; Sat, 18 Apr 2020
 05:46:35 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v5 12/14] ARC: Build Infrastructure
Thread-Topic: [PATCH v5 12/14] ARC: Build Infrastructure
Thread-Index: AQHWDhqOYrAyoxDDV0K5twwAYpSaCqh9/rGAgAARHQCAAF1rgA==
Date: Sat, 18 Apr 2020 05:46:35 +0000
Message-ID: <21685c3a-203e-5a84-2672-ea707d101e2a@synopsys.com>
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-13-vgupta@synopsys.com>
 <alpine.DEB.2.21.2004172307560.1082@digraph.polyomino.org.uk>
 <74631387-33f2-79cd-b47c-cca704657426@synopsys.com>
In-Reply-To: <74631387-33f2-79cd-b47c-cca704657426@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:c8eb:6ba1:57d7:7e16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 825d24da-fc37-49a6-fbe8-08d7e35bdb3d
x-ms-traffictypediagnostic: BYAPR12MB3286:
x-microsoft-antispam-prvs: <BYAPR12MB3286791F1A1147A7B3880D6EB6D60@BYAPR12MB3286.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0377802854
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(136003)(346002)(376002)(39860400002)(366004)(396003)(36756003)(6506007)(5660300002)(53546011)(86362001)(2906002)(66446008)(76116006)(66476007)(64756008)(66946007)(31696002)(66556008)(478600001)(71200400001)(31686004)(8936002)(8676002)(6916009)(186003)(81156014)(6512007)(2616005)(4326008)(54906003)(316002)(6486002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jH7HjhLLIu5LI7UdSsTkOor6C4LK03iEC7WosZS0tXD/YrIVOuZTtB2CXv9sWn8gFbA1Md9tg0/nZpRA5NuXhAgjb9t8oMAu1ssE9QN7ysS1+4I5mP+XbYFlXNSwM2/oCu7EpBfGtz/AbTcHlcLANUiUYgt3rqoXJaE7V1VkXmdBWbjxhLenmw/IxmGdYMiGiMIHbMM8rcaQZoSkpXjXSgdW3W17FoHkYK2xHgh7hMEJVvzIGuaw8KmeFt28MtOSO7D+Min1dG1GRRcmaWgDJwtsye+B52RbF5dsVHRYRZvvgGK5DwPx7GykZy8uJeI58OMDEAzttNUX7ENGVY3EVFYo7lV5krRhd/N8447gj5bnZr/bjKB34NN0RUH01wrQV8uf3sN8D/uMPEWvpbZ4+BXiUL5eC437vVw41niu4qtR/3YwiabbD1N4zAO3AEQO
x-ms-exchange-antispam-messagedata: eX8Nb5EPScXi3/NZGZPC2cnmbTgCqxmWrzVR2u1RR1/GCuWbaJk41500Ym8s44WY6ve8ZeTp92N0PwZbaddzIiilV/kIGquQq9SE8w0kEfbWs3HAU6BBajL17u7Vz4u+Lnlyu5uYQsuj1Er6HYYknWvLQNFOxsG586BcXDuDCuowbBo7Dtpj56AqnjeaXqpPJ1iSw8p2hVmU6xDS20i0/g==
x-ms-exchange-transport-forked: True
Content-ID: <DB53A59C62AE194BAB44DD1FFF70E90D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 825d24da-fc37-49a6-fbe8-08d7e35bdb3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2020 05:46:35.4187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AYU9jgFKqts0Zy28LtYWVvG7TwIWFtmUTeMKjtaJNjt+uJ10vS2D1xaEuUBYT/CMs2vcNb6c1e3divf3Q8wFyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3286
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_224703_524383_02E208AF 
X-CRM114-Status: GOOD (  14.85  )
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

On 4/17/20 5:12 PM, Vineet Gupta via Libc-alpha wrote:
> On 4/17/20 4:10 PM, Joseph Myers wrote:
>> On Wed, 8 Apr 2020, Vineet Gupta via Libc-alpha wrote:
>>
>>> +  GLIBC_PRIVATE {
>>> +    # A copy of sigaction lives in libpthread, and needs these.
>>> +    __default_rt_sa_restorer;
>>> +  }
>>
>> Not a requirement for this port, given that this is GLIBC_PRIVATE so can 
>> always be changed later, but does sigaction actually need to live in 
>> libpthread?
> 
> From my old branches, I added this back in 2018 when working on some cancellation
> failures.
> 
>>  Or given the work that's been done on moving functions from 
>> libpthread to libc (and the corresponding dynamic linker work that mean 
>> it's now possible to move versioned symbols like that), could the copy of 
>> sigaction in libpthread be removed?
> 
> I don't think there's any ARC specific code which requires a restorer copy in
> libpthread. I can remove this and give the build a spin to see if anything breaks.

As of today, libpthread_pic.a includes sigaction.os hence the need for export as
well: removing it from Version file causes build errors.

But when sigaction.os dependency is removed, this won't be needed.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
