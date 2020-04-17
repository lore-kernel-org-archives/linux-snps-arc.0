Return-Path: <SRS0=p2sK=6B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8D3C2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:41:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 849CF2083E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:41:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="suEU7KJE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Su/6zfym";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UOaV765E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 849CF2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIquT2JLoARXDHB7XeXxwxpvuQA0xTtzSFIkBb3SKLI=; b=suEU7KJEeanu9T
	za0xImviimXYdk4E1kBvWFoqhoUE7pqjexyoTxxn7x/+VquDegxRFVWI/bXQfzGABHihasP/fUt0O
	xoWjCGcOMEeWquZMbh/7vBAgLGwXlHZwFhSaJmCQnb3bkcsilmEkhs4xxq/lKARrkLKwCG8VNxCvc
	vF6EA8sTfynzDB18A85XSAxFrVXni+T8W65IRrzkW2YjrEqtbMaq+5F8HRXzKRIEuWvvW/PftsrSD
	kVibJ4YsAaPrEYaceqsahVelNmV7BU6Sh2SH3t96PAWoGV5sjyCK9lQSFejHObrAYVR/AZUmtYqBR
	9dp36LYGJAD017ykIeVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPabe-0005yD-0j; Fri, 17 Apr 2020 23:41:10 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPabb-0005wi-3s
 for linux-snps-arc@lists.infradead.org; Fri, 17 Apr 2020 23:41:08 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 900C9403B9;
 Fri, 17 Apr 2020 23:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587166863; bh=E+zt4IFgeBfx2y4IR38IeFUmPLhIdutXCdGotSqOz/I=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Su/6zfymQHcAo++rYpR9wbSGSiNHEHInFN8JLNarZQisgzgduf20Zm3v0YM3MoY9C
 03t15hTaTvqGeNDjJ9ex1Rignim0sQrejC6rkXYcYr+K9m0DrqZfQELlmFuz3uL3BJ
 08Pu1b3XUMy8zJvu3x7/rd0S8YgTlhWl9Z3nNjCUYuwfG01h+HnBXyEBSNlh6+H9io
 5gpvJiCgUc2Uqc0wLT06xZXxjuk/qudmZ8Mb3wQU+zwdPUg7oOCcxM3SGuC1WUtrQF
 oKrxrP7syDbgaihWwvHg4G4o+pczS5M4bw6Yy/ieNTGk9xN3e0Z6X/6C+e9M+4aPbc
 A7jCWq2vmnmrA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4AF4DA0067;
 Fri, 17 Apr 2020 23:40:58 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 17 Apr 2020 16:40:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 17 Apr 2020 16:40:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZPsjTDi7b3I8TY9JBJ31VlMw+vuoRHcWU6GIoPeUSdDqd/xbB87gHSQIPTmuKA3qdMdoCkx2N0C89B9X+7MOja4J/VZIO/i9vI/WvOZwa81uuYfrT0zRXMIhJ/sHhJZfGnTutl4kawfLzkE2rusUSuu5mMsExhiSDpIwi7cuROeLw1E47qt2Iac3T6gzqLJ6FYUlE4IMkka77gLSObtAoiuBeoB0zzRHtHgHmqJBmpsVCC/uHRO/lAimPms0TsfS4tYXLAGcaXH753v/TC87YeMGnjffU6n4J3/9MfHwuPS9oAVcO02dG4d+bNt/lj9/NqXL7uh9sgcJEO5DId5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+zt4IFgeBfx2y4IR38IeFUmPLhIdutXCdGotSqOz/I=;
 b=hkCyGBZqdMfYQFVWIH6/SkDeptbN6xa9KsbOQA5+6MYEkI1V17O9JsIGaI7ypr1JEZNM98euA/dZJGU/ST+d1TuZ0+A41thvbMcjjW61JyQU8FA8YLzeUvKdpggJaD3NO8kBmGonRdbZPc+NVWejzukq83n6hGEPr5MVNQc9z9WeyfDs+YOIglddkxWZ4RnQVDzq6/2Y/IRylBtyLKNRtb67HHyZlhK6/BH+WjUysrymU6wKza7H/YftHKotz/mf8Wdu1nhUnjgNE0B5zgev8bEtnzKzUK6DNk9Cmj95LHsL4nzKyzoUVV0KqU81J5cuz81u+UqCTsIzPFx+uSU8kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+zt4IFgeBfx2y4IR38IeFUmPLhIdutXCdGotSqOz/I=;
 b=UOaV765EUH4dIrayllTAYUrjz02TeHibWK9YfDITtOEnypv6/bz+r5FWp98ItjIAyBmi8/3PI3+RBGodMkN958vcquWviYXWxMP4IbhG+urp7KM1pomHvmsGVw92iRvzlZm2afFIPOf+bThiOpAL4QHx4aMl91BDy/S1EiwQfSY=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2648.namprd12.prod.outlook.com (2603:10b6:a03:69::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.25; Fri, 17 Apr
 2020 23:40:51 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 23:40:51 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v5 02/14] ARC: startup and dynamic linking code
Thread-Topic: [PATCH v5 02/14] ARC: startup and dynamic linking code
Thread-Index: AQHWDhqNw6YZgWdUg0Ojaoi7Xx9wRqh99rMAgAAQWAA=
Date: Fri, 17 Apr 2020 23:40:51 +0000
Message-ID: <42e7e1da-f791-71c8-3ef9-baa8ea0f6e83@synopsys.com>
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-3-vgupta@synopsys.com>
 <alpine.DEB.2.21.2004172239120.1082@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2004172239120.1082@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: 0dcf0206-54a4-4c1b-d482-08d7e328c3b9
x-ms-traffictypediagnostic: BYAPR12MB2648:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB264875C0CB14F886ED53DEF0B6D90@BYAPR12MB2648.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(136003)(366004)(346002)(396003)(39860400002)(8936002)(66556008)(76116006)(316002)(54906003)(6512007)(66946007)(6506007)(66476007)(64756008)(66446008)(81156014)(478600001)(4326008)(6486002)(110136005)(186003)(2616005)(2906002)(4744005)(31696002)(5660300002)(31686004)(71200400001)(8676002)(53546011)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /LramNYcK3FV5rd4DM2gzmGOzvfjrEwRGdNN0q9I4teKUoKc5hOaLej/V9FaoW2c6nrgNFFBtlujYzzTnuRPadDzzixYU2c3dUq830oEskqdodFmxLV7sCGiQ6KqFLuiT8ct+oTnvnXP44IecdkOOudQgq442lV8wM04g5Zjn2+KriVXmCdIIBNlZAe4LGtgMeY/2HzkRoKxeS2lApMK2st6nEYK0eOBPZU17Uk58U0woq5gbtx1CuTBdbIm9fNygBjl4D1Ts+abNVZBAeeL7pUEKWQvWilQdUbw47fxKz6ES/LxW9r8ukMXbs7z+RpyksIxXzlxhVxEg4xeVEsimggtpzANBBqoPvScur3TKAZ3AyXuBQRzAh75rBDQj9B8u+YnMXF8BCJYD0IYjyNf0dVT1zOPMUOxzOy+7mFHBwL8guUa8I7S7AGhKMSufJwF
x-ms-exchange-antispam-messagedata: fa53wLi/nhCPdcgItpdPB45rH80Xu058uBQDaOe9uBxpFaK4TrKnfXL74MYBaFCfSi6re4GoKTGerowcg5jykHpcfJRVf9U0yOlqZwACfrLB0pSKBV9/D9ipkS/sXeXEFSJEO1U9LicunHAnnfpxPu0/hNs6H9W4VdrMiH8BXBbO/6Mw11wmYSNQkcTpETQlp23WU5SPY5phhqkRAz1nYg==
Content-ID: <879E822DF133204A9E047616FE7B860E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dcf0206-54a4-4c1b-d482-08d7e328c3b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 23:40:51.6967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F8IZuElwUbwdQKqu7FL4vhizzG174xnJXredAgMzdQ6kI9oEse5DjWJC7PvIGVrJrApFCsQs/JQvf2KUvoJJTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2648
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_164107_171711_BD6A4872 
X-CRM114-Status: GOOD (  11.33  )
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

On 4/17/20 3:42 PM, Joseph Myers wrote:
> On Wed, 8 Apr 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> +/* What this code does:
>> +    -ldso starts execution here when kernel returns from execve()
>> +    -calls into generic ldso entry point _dl_start( )
> 
> Avoid use of parentheses to indicate that a name is a function.

Fixed.

> 
>> +auto inline void
>> +__attribute__ ((always_inline))
>> +elf_machine_rela_relative (ElfW(Addr) l_addr, const ElfW(Rela) *reloc,
>> +			   void *const reloc_addr_arg)
>> +{
>> +  ElfW(Addr) *const reloc_addr = reloc_addr_arg;
>> +  *reloc_addr += l_addr; // + reloc->r_addend;
> 
> This comment seems unhelpful.  If you want to comment on the addend not 
> being added, write a comment that says *why* it's not being added, not 
> just a commented-out addition.

That's just leftover code from initial bringup, removed now.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
