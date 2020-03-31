Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B41C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 20:29:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E93EB20757
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 20:29:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qd0c7oJz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lVuMDg4+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dYG6Umnn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E93EB20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yEMoPwSkW3ebJ576cuWe1kK2t8zsPxDj/Djs0MhiIoY=; b=qd0c7oJzrdzebA
	A/nMI0lfv9505AO4RP/ivRM+m7QIJONIvFZqRnKdDCC2r1e2ZY0Yo9blRPq5JMIilcD4v20DmhHbv
	j8CyxvpngAyHr3hBBDs6Z/szlY8d6VIyJ+Rgf+L0qsosSbeBHlbEug487s8eiVVQ33AlXXx8bpvPZ
	zgnpL6WGDU229F/bEPFhp/yydm9ZP7sPFXMHVCBhPNV9LXWj0Ua7Xvv5AX5M3n6YT46+vNeYj+xNs
	ihDkhruImEE28zMRM14jrClja8Owf6UAiMpxgN8d1zHZyivBCnpUOrvTRsJ/zBUUhlkk8tOs2Ni9P
	+DAfecS94a8MubgLt66w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJNVv-0003ZB-Vn; Tue, 31 Mar 2020 20:29:35 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJNVt-0003Yn-AH
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 20:29:34 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D12BD43B65;
 Tue, 31 Mar 2020 20:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585686571; bh=k1tiOUff9O604M4pBQ1T2KTlkghiqCfqKcm0H61Qqqc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=lVuMDg4+pdeZln9V0IcsCpFWvqblDFvwwKLrR3ydSa8aW8XdkdsTfHWIiGtNR6Gzg
 9aXf79UI1DQLK16rpQoTCBVS/lE5YEA9B9QbTdJ8Li57gcLzdgAKnsO+BXYiIO2X/8
 C3fZMcqJn5uoiGGiOdfL8iWmoVBgO7cEIBPgggPA2SPxOMnEO0yzlsWpkU6EyGoVMK
 Sm2tYTqq0h4tTWMM0+uCTQHvAst5gBs9wuHoPqJDfVYl5ZOB6emDA45ePC6XPTUmBG
 Zvt81HKkhbTb7J5nIrzdRCIx1bBsOSeUGqCa0UppD2Dj13xJ82OfDVRq6nZQHvZafZ
 BmD/laLnCmPwA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 067CBA006E;
 Tue, 31 Mar 2020 20:29:26 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 31 Mar 2020 13:28:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 31 Mar 2020 13:28:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGcX5r3r3zbTJdeR4gy6Bi5TOE3y1wC7p/GPWTAxFRa+vuaqFNaRXkfXoIwKvqGaR7JuH6GVJV8uyRw6Y/AgAenQI3Mj6ko7X4ZvQAry+T2CevINzNqxkO3oKj6itwKILoS43aXgRIuSVo0UnVT0Klb+Xega6pCy1UKvRV0ZjRvdN0P5BV1osa/g2zsUPa9eBTf+OvOAnOy8ZG1KZEnSVxkbdayXQdm4XVzigWL/1kDTpZ5na9Qe7NPcoo30IHSzmkx3VwtpbRmz0sTa0MMN2wf8p8cvzrwJk0uhY0lrTtmPP3EiUsXTzOO27UNh3espraG+aQLEneo4FBk6IYNFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1tiOUff9O604M4pBQ1T2KTlkghiqCfqKcm0H61Qqqc=;
 b=PRtRS0nJm523ncenAKcRnhrGWwnFu/uH9Uc2oWaCiIfGVx5FpQJ54PaoIo/BDrjh2e43NPQANaZ4b9s87TICxbwy1mWRSfU8erqVgC09dL9NseKk84UXbym0p0A3mKaL86KyW8OkDQTWa2opVaFTicEwj6im8VUKx6fIKhkx740PLNHPZOUE25PFSTADrXzDZiEcWXiFzWH5C9BCFftD0A/3Bh57i1Ct0azhJAzOT03MYHxUb8F22CECIVF2DHjQ71WOo7/ignT1o9jGhDyx7+JCmbO4JDVa2Or0hFrlr04iGXKCadB1U8K3/w/Pw7a/DJwY/jgSp3WjPQe3m0etcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1tiOUff9O604M4pBQ1T2KTlkghiqCfqKcm0H61Qqqc=;
 b=dYG6UmnnV5ZI6uNao2aNLzHt6OoienzKNNLYJ27h/o9akmwYC/mzIuOUYETRA2tEU5MW9H/UPa3mQ0zQtj95PiEcolQM9aQF9lKvO5Vb8gOWxLUM537P+kRLasGcEb/aDsCh2W9PDyROW81r+p16mAjkKxTCFY/tj4+ubvhxW6U=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 20:28:43 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 20:28:43 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fw@deneb.enyo.de>
Subject: Re: [PATCH] provide y2038 safe socket constants
Thread-Topic: [PATCH] provide y2038 safe socket constants
Thread-Index: AQHWBYDbfeMGxKt7Gk2A7SsJcwT4aKhjG/ymgAAHwICAAASdHIAAApUA
Date: Tue, 31 Mar 2020 20:28:42 +0000
Message-ID: <376a84af-5065-76f8-5a67-6dd5378287e9@synopsys.com>
References: <20200329041612.4071-1-vgupta@synopsys.com>
 <87r1x8qpx6.fsf@mid.deneb.enyo.de>
 <dc454c9b-d947-5fcc-6a27-1e6da8faecb5@synopsys.com>
 <874ku4qnvs.fsf@mid.deneb.enyo.de>
In-Reply-To: <874ku4qnvs.fsf@mid.deneb.enyo.de>
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
x-ms-office365-filtering-correlation-id: 0ab8b262-4c35-44d6-1f83-08d7d5b21b0b
x-ms-traffictypediagnostic: BYAPR12MB3589:
x-microsoft-antispam-prvs: <BYAPR12MB3589A1C4CEBA571827A3FA53B6C80@BYAPR12MB3589.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(346002)(376002)(396003)(366004)(136003)(5660300002)(31686004)(66446008)(6512007)(66476007)(53546011)(4326008)(186003)(66556008)(66946007)(64756008)(76116006)(6506007)(36756003)(478600001)(4744005)(81166006)(6916009)(31696002)(2616005)(86362001)(8676002)(81156014)(71200400001)(2906002)(8936002)(316002)(6486002)(54906003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AzwGJ16avWBusTWFWmhijPdOsn5lLUuoxq1GvDHOLXQPBIx4vhDZJSSQ4q1rn1QqoT8uoea0GIXllPF0YRTJggD/CbpNEbNv7BAmuKtEFRpqhGnfNaqmCs8F87HKTZACKJsT2KSIykiP4j9jlEmuGjPWziQclbpt9tWbmcBVWlRldmk2fY9ppsDWpXuJTGsquIQkvo9Ghh2oTbBiw6YlIhRM8h7TTAdu7w2kXYVFdObXlmWT7jdARQzhYUZHyzb9TtKiELOmZXHxTNbiAjSI1OgLBjCcs2Ofm65J23639zF0mTPvPuV4hampXT2oBFV1nxnvaC+5bOIuJdhYDqDj9xZfuRDNEoW0QrznNO06DDqErcB5A6Ho8FrC7tsDoLI05VPBAZRXxlhtMNX7nUBVlA7Scu3Iiy5T2xCcH5pRj+wKN+SLiGH8B74ntdAkoQDd
x-ms-exchange-antispam-messagedata: YEG+lAMtjG+iI5x3ciObqIuz6xHV8V4i4ip1WRLW+uKTHJfyVZTF7hLo5sR2eyQdt39wbu9Q4M/CWTOrl2/ZfzRYBJ9FDSJpSZvzdLEby5ruph6PRc1XlvFQWp6MmL7YPnb345LlvLUBTo1txlt6PtxV+5w5Mpy9LFN0n0440mOq1b2Xxs3RU6mb7RvrlgqIIXugSJxdkY6GWXqyIKgbJA==
x-ms-exchange-transport-forked: True
Content-ID: <C86CE1AD5AFC5F499FA3CA035785139C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab8b262-4c35-44d6-1f83-08d7d5b21b0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 20:28:42.8744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sGHqHXmTvcQEOd5ZlUc+LQr2+8k/8OIsyDSFgvVScN4XJrCc/wvyoDGoYKd9VRdQhW8ehyZG0yfpMt4eKBhKSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3589
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_132933_428812_F801CAB6 
X-CRM114-Status: GOOD (  14.43  )
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
Cc: Stepan Golosunov <stepan@golosunov.pp.ru>,
 "libc-alpha @ sourceware . org" <libc-alpha@sourceware.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

+CC libc-alpha which got lost in the thread.

On 3/31/20 1:18 PM, Florian Weimer wrote:
> * Vineet Gupta:
> 
>> On 3/31/20 12:34 PM, Florian Weimer wrote:
>>> What about the parallel changes to the sysdeps overrides? I would> expect changes for hppa, mips, powerpc.  (Not sure about the alpha
>>> situation.)
>>
>> This patch fixes the existing/future asm-generic ABI enabled arches
>> and the ones you refer to are not. So IMHO that would be a separate
>> patch if at all.
> 
> Ahh, I think the commit message could make this clearer (although it
> it's somewhat implied). 

Sure I can make it more explicit.

> The commit message also lacks a period at the
> end.

Will fix for v2.

> But is the conditional correct for x32?  It has to be keep using the
> old macro definitions.

I was not sure as some of the other patches in area don't seem to do that. Hence I
CC'ed Stephan who had earlier commented on x32.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
