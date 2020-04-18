Return-Path: <SRS0=LyzR=6C=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF0BC2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Apr 2020 00:12:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B7B32223C
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Apr 2020 00:12:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tq/5bBjH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Xh7ughY8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YnlRlzXi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B7B32223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ucI18W+rc4e9ctVFAbWiwFo5vYSSl+7H1b6YUynIsEI=; b=Tq/5bBjHIji2zJ
	7BgPRTgh2HOgg54DqCSXzGb+wy8qe/09FII6X8OAnYL03kYqeL9cUiielkIDlbqZTDPL0zNkxL0SE
	wqGHv2l+QfFKItoP/SCJEtD9CYL2NQaqu01Tnqr0nrTkDYVJxKmjsxuW3N67OT8MKL2/kbYDtAAXt
	OX9dP3rkzlXkH1w18N70NPrkS5EAZ66ADPsDsw1E/OFEFf8Ei3ex27sN7YRJ6HmdUQn+rhERy7e7p
	RfNiAB6tZQ/bPYCCbaMO7XG8O9XD6feqtiZ9lz9HeFtCE7wt2FoX6TUfXnA4rs/uQ5Fgrd1gAtqUx
	4F/ty7fa7wJLOV30j6nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPb5o-0008Ag-L6; Sat, 18 Apr 2020 00:12:20 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPb5l-00089t-Lb
 for linux-snps-arc@lists.infradead.org; Sat, 18 Apr 2020 00:12:19 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0646DC033B;
 Sat, 18 Apr 2020 00:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587168736; bh=UD5w0a4cjwFDkD5RYRdOXzToyEeRBsxXlf6tsE+PaOc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Xh7ughY8iwit8hk8gpOA7i86fTYkwwvAwXeLhCXXYnuMenaaYUf6MwGZWcN2xjDA+
 eH2ZUk674fx6M9qg7EV9cnpZFAIEwJSveSlwDnfdavDSWvQ9MmRYAfsMnAtIc9pkKZ
 h3nFxuc7xgt0QSuArvCJ3ohDIpSshxQRLZQcy/RIkWAJfpc0sZVe+Q41RA+xZuzU/p
 XLjcwDORnQjCxVN4JyyWerdDeRwhnvFbJRbvXTJQygJXHEtT78tiia9KWhsBShGlU/
 qafSTfrlR5BM+gnQT4grft5ZlOjXJUg5G2KZWUWPmlSTFDOzpSCbXOBEKXvrk8l+yJ
 sPQhSnjB5Dm7A==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 67D85A0082;
 Sat, 18 Apr 2020 00:12:15 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 17 Apr 2020 17:12:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 17 Apr 2020 17:12:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUl82LAUvTlqY46z6MJjOStIC73EewXD14GAY9znyIdIQH4TqEoLRufWubUwXqMTc/BUhF0dZOHSnA5kjXQKZ+Fb/W+Iwt95PRA6F0QMoO+XwYe2TDTukURYWVlb4wMwRZHa7Nq+jMvMCi5c/JZ8akG32lNqwQWaEpN087tATGpbxDsulhwT2/O1Nq2U++5SBPLLC4MrlBUORuUbp6zSglxooG8PcNKpEY5MyTGVz3oy5REewI6OtDp6UIhEtiAH8Bdp2g35WcGDdTUydfOXwtRGeCoO98RfbRUh4PXTJDUFjyGysADumHOi+d3bNvRAddj1YNPMXRQQ+pkQMSee4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UD5w0a4cjwFDkD5RYRdOXzToyEeRBsxXlf6tsE+PaOc=;
 b=ktkJbm0kxmjnuYSl6Z1Botwd0lTVj4tKsuQvTcYKjBL9mtZeRLwT0nyrl1zpZto5biVHb95leGb6/5q4TpoGOJvYwv7eomTZUZ2A5lxAHP0t7R+aaQvj2GTFVPwHc4Jx91iAi9eKf2kKvMEQyFC6RJJBZ4S/ytweOvCYddy5OU8QFwZqQCXtIX6i4lhnuMxe6jeLd60wIQW6xSxri4Gli/mz2DoN015mLJSYURA6FzFFWRgkMEkeBb7KvWwjk39kHwgbZa8ZQqhJltrOs4bfdS4Or8YC3cchk2mG2CL/oYcCekURjvp5krpRwr0x1Pa7iBVLd9aHRIFdIGWY+BFNqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UD5w0a4cjwFDkD5RYRdOXzToyEeRBsxXlf6tsE+PaOc=;
 b=YnlRlzXiXpBrAB1yyozGX9ZzcbiAyfC4/oLXCQO3aAh39F+lN223QbkdbJwhEawr3RFFYkEGMbTSf2xS4Ttmu5BK8Hv6hFuSXmYii9bCOjNeJAmiHCxE1VT7g1jUh5nBVbeRWCdZ35SsEb6irB9mewgXyQN57oKyDewvwwDbytQ=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2981.namprd12.prod.outlook.com (2603:10b6:a03:de::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Sat, 18 Apr
 2020 00:12:13 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2921.027; Sat, 18 Apr 2020
 00:12:13 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v5 12/14] ARC: Build Infrastructure
Thread-Topic: [PATCH v5 12/14] ARC: Build Infrastructure
Thread-Index: AQHWDhqOYrAyoxDDV0K5twwAYpSaCqh9/rGAgAARHQA=
Date: Sat, 18 Apr 2020 00:12:12 +0000
Message-ID: <74631387-33f2-79cd-b47c-cca704657426@synopsys.com>
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-13-vgupta@synopsys.com>
 <alpine.DEB.2.21.2004172307560.1082@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2004172307560.1082@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: 17a0f1e7-6a86-4712-64d0-08d7e32d251c
x-ms-traffictypediagnostic: BYAPR12MB2981:
x-microsoft-antispam-prvs: <BYAPR12MB2981877D90DA82305324C940B6D60@BYAPR12MB2981.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0377802854
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(376002)(136003)(366004)(396003)(39860400002)(316002)(66476007)(64756008)(66446008)(5660300002)(54906003)(186003)(2616005)(31686004)(8676002)(4744005)(66556008)(6486002)(81156014)(53546011)(6512007)(6506007)(4326008)(76116006)(66946007)(8936002)(478600001)(86362001)(2906002)(6916009)(36756003)(31696002)(71200400001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2vJkO7JgKsRENCBs7toxm8iPWUu+7NtXOs11S/O/DYdqZAvw5IbxfNTy8M1fDmb+jQOgLWJQZAqrDHqSYSFBKyhgPbQ9tkljoO1/rYKbEwLgcLDBI1y28bfJcDWMCi8bj5moIVz4+iNkXAc6gYgqGvt9qRXG9xIbShOHtTlv7lWuJuDpbBXIt6TV73RMSjOxwwr3cOFDyeWPYwNGwLaFv3isDZ16Lcymw7nHyb6ALhDPL+DA/4KnWL2fNpxv+stYU3W4SxfihoTeV6u+v3uS+NNt3gEwVBP/BkhpfyhtTjXoXpWCmCp3SmJyOfRNVFJKfjdZL12YrGCnY5KBIusyt32Rjc9WavEUbAdrKnsxnNj4akOj8vnqAFT7AVTB8yuzCjPQqVD1iU35vDg+kGeL2cQY8F5qXZUlyAuyeeoiXigoPRKJ2haJ14wuRKc11Uo+
x-ms-exchange-antispam-messagedata: EIGMpErQ/IOvnevhqj5GhuD6T5csTkxIh5TJDnXr/olsFREmDwAayX93A405RL5TW/nn1B6hHzscqIjdLJ3zh4tsVP6oAkuPiL7ek+o6TSMs25s0zCKxImQ0UfO+kSZeSGzkW8lwhY23jaqn0C92C/ZPuuE/Umdk1zntKcS2QJWPXIIQjiDjUpzGXeh5P9pqtv4o2qDknxlNkSWPUwomHg==
x-ms-exchange-transport-forked: True
Content-ID: <B9D3C9D5466B3D4BB6535D666710AA1C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a0f1e7-6a86-4712-64d0-08d7e32d251c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2020 00:12:12.9667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6QxFW35VpuK0fTjjyoxANHVFcLNxblTNO4FslRwM98QGpWJfjXus1ZIENzZW9Tw2+Mm7P4HenaG3DzJ8xg84FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2981
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_171217_776550_1D35BF98 
X-CRM114-Status: GOOD (  14.24  )
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

On 4/17/20 4:10 PM, Joseph Myers wrote:
> On Wed, 8 Apr 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> +  GLIBC_PRIVATE {
>> +    # A copy of sigaction lives in libpthread, and needs these.
>> +    __default_rt_sa_restorer;
>> +  }
> 
> Not a requirement for this port, given that this is GLIBC_PRIVATE so can 
> always be changed later, but does sigaction actually need to live in 
> libpthread?

From my old branches, I added this back in 2018 when working on some cancellation
failures.

>  Or given the work that's been done on moving functions from 
> libpthread to libc (and the corresponding dynamic linker work that mean 
> it's now possible to move versioned symbols like that), could the copy of 
> sigaction in libpthread be removed?

I don't think there's any ARC specific code which requires a restorer copy in
libpthread. I can remove this and give the build a spin to see if anything breaks.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
