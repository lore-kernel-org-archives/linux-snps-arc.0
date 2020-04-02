Return-Path: <SRS0=zcuS=5S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD18C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Apr 2020 00:00:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E7552077D
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Apr 2020 00:00:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WK46RLZz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="C32OQ+R1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XgAzP+RC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E7552077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EK31OGvI5k/3krJJvYR3Yk69C/41eq/bfM8WlHruim8=; b=WK46RLZzSbJrz+
	DiulFeWjOOUph3Le7lUWBHj7wNX6UOSH+7Tis88YKtcQT6qQDBPgwfdyVEr7nyWIRRapCND/gqM44
	nbo1UCvhrQg8YLxuF6EP/77E/e1eL/73lJ2Wh1WZc5PdBxUePCJzwGdr+nGOhSsSBz1+U3QM5Dw/r
	lolcQpa98tbwTPW6nY5OJJRwzFSIuViCGECla7SCtiBXPkWQc7Mo3aHyMkdHLGwpypKUnfqatbCUB
	F5fXbB1nl+eUnx+Cjh2MuxHjJlRaQ4aWuy8hVhA7gwPlcN+cbpwDLcfdKFUcjE+Paik09401EpmLq
	yolNA+fu4oPiEPl2NTHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJnHp-0002yn-Ar; Thu, 02 Apr 2020 00:00:45 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJnHm-0002yP-TR
 for linux-snps-arc@lists.infradead.org; Thu, 02 Apr 2020 00:00:44 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9EC3A43BA5;
 Thu,  2 Apr 2020 00:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585785642; bh=wfwTioXGLQnADCWMa6BTjDOsEYx7esOvtLM0oLJXe5w=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=C32OQ+R1dmmAWlkWKvGjN5xw0QDpQqdgPemPgZxAz8b5awyblXpJ9MbjjbT+HyjLb
 qWPjhQyl/cpZ+eTkVyo+poZFuQqG3vQwO2HObfxvNUUKZgmacZbciht5U2iqHXQJpt
 EeHJgA+ztTRVj14f9wiNwpNCEBCNcOM4OwibNHEEVueYPEN7UNFhAVdq1LTSVbc8Lg
 m+o4Q1v0Vk4Ud22sv+UHiKiaKOTqU6WpUwrlDOPYMdvSR/qca5Ao+ma/G/EUKqdDQk
 HoMhljnFz9FYYTfCmOaH+OrIMreCN8PBqjhT1J1Ze1OXhBSpNhx9r2Eg1fOE+n3ij6
 37Vs0fK4MUjFw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 1C108A0079;
 Thu,  2 Apr 2020 00:00:37 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 1 Apr 2020 17:00:37 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 1 Apr 2020 17:00:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mp+FIx5HvVf7JY3+YVsPtw7aMdmK0MRj29o/8mLhxgGqJLj6fXhVgVLBorXWB0aSKfm0wi40Yxeq8t6qjxzBoxDmIWMU3Da3tIaSkAKbboqLjglT80uuF/4N6qDubI3unnUiK6faFCB3rjTdWE3RU3LISSjtT1nmdXLjpF3McuIYAx7XQzyd3jfiyA5DrCXvllzNQFf9WBWPXZvZcjxfdHT5SpkARwaqhEzEoskl1Qf38QWgUTrE02r/3hpHN++CHx/aKDmOm5fXK4HcAFcR4Orfb0HiM7W+vrDOXhhaiw2IprAzSExVHxKf/1RR68m+MEFZeGd9WCoEcLFp0yR87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfwTioXGLQnADCWMa6BTjDOsEYx7esOvtLM0oLJXe5w=;
 b=OtB9MPt1Q51gewFmP4cuQo0oFYUWmAY+2ssl16bC++t7pYBFt9u4FH/RousiiLXK5G4IyztzPbuSrh77IzpM92j1OHqSCWWdQgo10e34CszJlbmbCbVLYG97kWhSzsFRy/mpgrtw1Zg98UKIN22hZOCZnneOntMXoc1fmy/tRvhOE7XM9KNwXWq5bEVExdkANr2Jk2lzLM9SIWWuHi1ryhkwJPKB1tl+OXACGFCZhUcyBKxo+OtxV+ygwzCxuxJE+iYNRLUlCKtejA++G+1RO7kVREs9+ZH4h/9Brht6XCpJ9a/Td16tCAI0KG0u2yM3TMgCkHyEuh6A41KK8VZZdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfwTioXGLQnADCWMa6BTjDOsEYx7esOvtLM0oLJXe5w=;
 b=XgAzP+RCDLKx+FOYu/Bqii3Qh7OSqJWqX+l693t7gVn4yKDb/ONxl0fuykAHozFaqcshK5XqdZsiAp6BJ/z+6HsOtrvEiPUPy5Lji/0UHwpg84pMsI8Ak032AFwW2u38Bp6nqS3f5LGODnhjHqBRARNrzakw/frgTY0FuvizrpA=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3093.namprd12.prod.outlook.com (2603:10b6:a03:dc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Thu, 2 Apr
 2020 00:00:36 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Thu, 2 Apr 2020
 00:00:36 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: __syscall_error (was Re: [PATCH v4 13/15] ARC: Build
 Infrastructure)
Thread-Topic: __syscall_error (was Re: [PATCH v4 13/15] ARC: Build
 Infrastructure)
Thread-Index: AQHWB76r442emsqWgUWhjf9688nTzahkgDgAgABzwoA=
Date: Thu, 2 Apr 2020 00:00:35 +0000
Message-ID: <11b18f6b-7187-425d-cc96-4b20dd9feded@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-14-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003272238480.5132@digraph.polyomino.org.uk>
 <86b7b480-da30-3eb4-3e1d-1d8785604770@synopsys.com>
 <57eeeac6-75d2-05c9-f1fe-bb642329ca77@synopsys.com>
 <alpine.DEB.2.21.2003312246280.30236@digraph.polyomino.org.uk>
 <3b5edadd-b29d-f138-c440-ed6d38da6a67@synopsys.com>
 <alpine.DEB.2.21.2004011703160.3007@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2004011703160.3007@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:2878:237:6628:fcbe]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17c3534e-e19a-42f3-14fb-08d7d698deff
x-ms-traffictypediagnostic: BYAPR12MB3093:
x-microsoft-antispam-prvs: <BYAPR12MB3093B44EB4975FDDAC366EF1B6C60@BYAPR12MB3093.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(396003)(136003)(39860400002)(346002)(376002)(186003)(66446008)(66476007)(76116006)(66556008)(6916009)(31696002)(53546011)(71200400001)(66946007)(64756008)(6506007)(86362001)(5660300002)(4326008)(316002)(31686004)(54906003)(6486002)(478600001)(2906002)(2616005)(36756003)(81156014)(6512007)(8936002)(81166006)(8676002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XpVNdsBNEqph7p07gPNFk0PTVoMdHWfMzw/60ECxb78cVdPA/8RYhJlZrsTmHkBLLHqBcXjhdKvG9SkUgUtKw/BJZMkzp2Ys3N+4bVQHcQErLp6vQhscMTjW41bvi/fWIASiABiUSFwp6xunjCcPXSyfJ7d0Vk81WlnTusl2H2VS8PgbjD4LYvwSK/HZJz+sloYmLzO6Ui7cBM+Zyf89oMs2q24AzlPp4yD2BkRWBbacOh73JVq0ITmUhByP5Pxzlour/n64YiIqu3uEF/gCTx1laB+a8AU7tMS30soFzH1lnLdsOJLh5h5PjmbbAHiKnHwMi3dsjmynK1CABoGeHAKREDTOcQ/1bfatVVtLJr5weImBvBXTur6FXfGIEv6bcxUlRZ77CYqmd8h4c37TgZfO0i3hBraOgYSJIf+BA7mxZ48++/WQjkXT1coaaqz8
x-ms-exchange-antispam-messagedata: eRbVWqiFNGIONiFRf+EWDC+QHpFOzlnRKg5btvqZPR+iwn9HIYjwQULwqErBnOg/p581vYknGmg9S/r4ycIAwuUZHmNyRFHoDx6FbewVtXIOm815qW7G07qbHXfEwWewTePOf+wv8wkwzamRv9GW+HQfghZsvhqidbHuoPtvo16LztjyHrBEvcXItol4SyNTaueP1uvv6jhX3jVDFwTawg==
x-ms-exchange-transport-forked: True
Content-ID: <980BF2AB3018C24197A5BA293BE1BCD4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c3534e-e19a-42f3-14fb-08d7d698deff
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 00:00:35.9497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JWOSa07jsTwkCdNGyut5XYfl9fUvczlMTvZoYHwYR2wsPWYk783qtJ3QBCNaJlkyZX+TwaGkvCe+WxkvHuVZ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3093
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_170043_046354_6E7C3437 
X-CRM114-Status: GOOD (  12.41  )
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

On 4/1/20 10:06 AM, Joseph Myers wrote:
> 
>> If public Version is removed, I get errors like below:
> 
> What if you move it to GLIBC_PRIVATE?  My concern isn't that it's exported 
> from the shared library, it's that it's exported at a public version.
> 
> A public version is only needed if there are references in code that might 
> be statically linked into user binaries that use shared libc.  Which means 
> the symbol being used in some .o or .a file that gets linked into user 
> binaries in that case (crt*.o, lib*_nonshared.a).  You can examine the 
> symbols used by such objects after building and installing glibc.

Moving it to GLIBC_PRIVATE seems to work too.

*Before*

arc-linux-readelf -a lib/libc-2.31.9000.so | grep syscall_error
  1671: 0001b4b4    18 FUNC    GLOBAL DEFAULT   11 __syscall_error@@GLIBC_2.32
  4686: 0001b4b4    18 FUNC    LOCAL  DEFAULT   11 __GI___syscall_error
  6286: 0001b4b4    18 FUNC    GLOBAL DEFAULT   11 __syscall_error

arc-linux-readelf -a lib/librt-2.31.9000.so | grep syscall_error
00008054  00001f37 R_ARC_JMP_SLOT    00000000   __syscall_error@GLIBC_2.32 + 0
    31: 00000000     0 FUNC    GLOBAL DEFAULT  UND __syscall_error@GLIBC_2.32 (3)
   198: 00000000     0 FUNC    GLOBAL DEFAULT  UND __syscall_error@@GLIBC_2.


*Now*

arc-linux-readelf -a lib/libc-2.31.9000.so | grep syscall_error
  1671: 0001b4b4    18 FUNC    GLOBAL DEFAULT   11 __syscall_error@@GLIBC_PRIVATE
  4686: 0001b4b4    18 FUNC    LOCAL  DEFAULT   11 __GI___syscall_error
  6286: 0001b4b4    18 FUNC    GLOBAL DEFAULT   11 __syscall_error

arc-linux-readelf -a lib/librt-2.31.9000.so | grep syscall_error
00008068  00002437 R_ARC_JMP_SLOT    00000000   __syscall_error@GLIBC_PRIVATE + 0
  36: 00000000     0 FUNC    GLOBAL DEFAULT  UND __syscall_error@GLIBC_PRIVATE (4)
 206: 00000000     0 FUNC    GLOBAL DEFAULT  UND __syscall_error@@GLIBC_PR

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
