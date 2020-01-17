Return-Path: <SRS0=W4z3=3G=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3E5C33C9E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Jan 2020 19:35:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DC622072B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Jan 2020 19:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZPqmMehO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PmL52fva";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="WZTvhxHt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DC622072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qWiVI8VSZMha00UBxOm1o2ZBBkQLzQUsfDw8D5/2Vs=; b=ZPqmMehOW2CjPh
	Hd8xGvea5vL2FCgu+xfRsi7tjBN7CX4tr83JSdPv+swAamPhSc4pR0xE5AUj0/0k4R8WxL6j6T2Bw
	dhk29DGeQJDc5OlVXNJYqkrI6maFtjtdEEtyn+6abHiQb/2kzgp80fgKj3Vx7oEc/llXN6U6AZBup
	sohH64lc8HkFRGA5YUDBNtml9QuUPhRgHvLwBtzua+MxgdpWPrF4iMJCgjF7oPl7upc70ZTsv5s2C
	3s2aejrmIcpGkqvOSVsWyP9Yat0Wr7ao64EOpIIvXK7A7etsOxFUAMAZIi4pgpJauJzLiJmhiplZm
	nIuV9crgBi9JX1vSPeJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isXOq-0006lT-GY; Fri, 17 Jan 2020 19:35:20 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isXOm-0006kk-Fj
 for linux-snps-arc@lists.infradead.org; Fri, 17 Jan 2020 19:35:18 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 98D8940179;
 Fri, 17 Jan 2020 19:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579289715; bh=JzlijdDaNtW8uIC1kf6NXa8coFBN5mPK8DEhVi6hL+g=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=PmL52fvaswr8nJ6J6h3kUZ94REoHHtKRSNeBX4HA+L2sKZeI/vobsjFk1rfaRG55z
 aEeAfKnQlS8fGGUTHikgZwv1374VrEremURzBLni96u50FbOXtr5IEGXL3DSwWdHcC
 QkfuhT2Cri9k0XUyuSZgLwrWF4Fue30PpBtmsGSuTcTH6UdT/BhgTQ+GBfwIJMgcnF
 H7BgRUyQsewMuHIIeaZEnhq+VR4Lg29ccLzJCW2obC0+o6fEW8wmA5p0MutnpJtyOm
 eglbgpj82md9ctjZp9UpGHNV4cCFy54pnBXcVDGk+AnjW2tmDvmLh6Y+bxWmWmlpjW
 k0/OnMZfUVEcw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id AFB5BA0069;
 Fri, 17 Jan 2020 19:35:08 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 17 Jan 2020 11:34:57 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 17 Jan 2020 11:34:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDW6Q1AOfOcrF4Ty4gOC+szhVQlTTWqDjWg4zwrHioxk1igG3R6lBvQHwjybvEzEdJXm38glW9egAMzJOLRQiVxQI2o+aB4ps5+KEcvU+IcluLBiGIy2Zc9ahHKfnkO5COGw3Yzy9ERRithgN/5FzF76p6JV11yblt2aIlm02P5VYM+qAWmzKI5Lmq34joBKMUOkdTgnzBvLFhmeeN7OKUiIgbljZ43A6bFVnNfODr26PBtpwrMpLB+7dMkbbcP6macknBGznwHY0z4FDP9iAkz45C+1gAf3/1ZxY2LPwfpiF25GaxQ1S4X85+SHaUiyoE3B14n7qyjEOUSgU8gyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzlijdDaNtW8uIC1kf6NXa8coFBN5mPK8DEhVi6hL+g=;
 b=oSNqKalbEB7QNd682NdDA5jRLnpfr7GZ6MsxCOOeOIjCvijjS4UlMxmgYCSrrUBIzzxUOuq6x/O4sqSpVXFij856nZIqh7RD32lMW/RJxtiOpiW7wUv49VQU/BwtOTjSjVRuR/oPUSq54Z8t465v967ozlkNGBGTtHSFXmfV89Bn8E0hBN30n7meHIoAWqu5NmxHzpsJtJ4OzvAE2850HbriITPiSiLdXXUxWMJtS7CME0CdxmjslbxNlciT39Gay5du9pB4VdSR/galkuDVKevW5Yepm31J9niLTy+eaLcPFso7J5p49qTOqepLfxMep9Z1hShq8tVk6p9NveEL/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzlijdDaNtW8uIC1kf6NXa8coFBN5mPK8DEhVi6hL+g=;
 b=WZTvhxHtD1O2ur30QbTss4ABNW/qojLdI3TP7Ib3UYidAOfQJ6pYAv/byiWqvPT+KzVDgGPAgXvP0H4YKInb4yUT7p7ei3mcxaMeAH1EyUuV7T88zdeE01zq24gYFqQtHKFght4JkXplmC4mI0RQLe+NUsTabeNquo5vg9bW6k4=
Received: from BN8PR12MB3588.namprd12.prod.outlook.com (20.178.210.77) by
 BN8PR12MB3604.namprd12.prod.outlook.com (20.178.211.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Fri, 17 Jan 2020 19:34:54 +0000
Received: from BN8PR12MB3588.namprd12.prod.outlook.com
 ([fe80::edf0:f1f8:991f:673b]) by BN8PR12MB3588.namprd12.prod.outlook.com
 ([fe80::edf0:f1f8:991f:673b%5]) with mapi id 15.20.2644.021; Fri, 17 Jan 2020
 19:34:54 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: ARCv2 Public PRM (was Re: [PATCH v2 00/15] glibc port to ARC
 processors)
Thread-Topic: ARCv2 Public PRM (was Re: [PATCH v2 00/15] glibc port to ARC
 processors)
Thread-Index: AQHVzW0xcm0d0tcmaEmrZQM6snb/ZA==
Date: Fri, 17 Jan 2020 19:34:54 +0000
Message-ID: <c3e18811-b5ed-2194-ba55-6c5f87f46721@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1901300220520.24454@digraph.polyomino.org.uk>
 <980d8411-e4b9-24c0-3340-c112d6d6c349@synopsys.com>
In-Reply-To: <980d8411-e4b9-24c0-3340-c112d6d6c349@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab87bc3e-692e-4166-b099-08d79b84545d
x-ms-traffictypediagnostic: BN8PR12MB3604:
x-microsoft-antispam-prvs: <BN8PR12MB3604F99DFCEDF1CF3B593642B6310@BN8PR12MB3604.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(376002)(39860400002)(366004)(396003)(189003)(199004)(478600001)(6486002)(966005)(54906003)(31696002)(316002)(6916009)(71200400001)(86362001)(2906002)(76116006)(81156014)(81166006)(6512007)(31686004)(16799955002)(66446008)(64756008)(66556008)(186003)(66946007)(8676002)(36756003)(66476007)(4326008)(2616005)(8936002)(6506007)(26005)(5660300002)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR12MB3604;
 H:BN8PR12MB3588.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kbTZb11dIR0xpPp67gSXs8Hx3qI5XReDS59TSUsWU4ocK698xwraKw6N5BGG5pd0q4q7D0EnLWp3ZWvIODE3680ufgsIlK3/PXpEmlYOxPGgTuGs5VWbNRIwDVkTVvuw7lr3fDULIjrhy9jDtjCTZvLp7IH0NHhhC8qwSrOHchivvXfCLLjljBk0eBJlqNTgflv/KRK/FgXlndoTmVmXAXLE7ou2C/+oNO1TM7QH1nUYSYkYl2aO76Wl5o2Vt6zm9I2qo4LRYsLpkJINxmnrDo+u0BcFYOh0vT2ZIrNkl4mzZyO68XHXikAwMYnRMEF3b2Hnov8ojXxzc2uDj19WK0aW5pEfArdw/9XK/AA5oj54YU0ZT7hwKdmNHiMIoPfboev20iKJLzZKteFSSfeqJMYRtatEcxWzOQFV1KhJZgALs1qu7gDOlBmxJPq7kfOEQCnJ73Mk4alpMZRb98/EDDllpcFcaCjaA7+30zCJc5PmvBiWiDPexD0V6cCMffMRHSJh0aUFOgoXjk0z/lqaPQ==
x-ms-exchange-transport-forked: True
Content-ID: <4A137B4ACCCB18499150F95ADFA4F586@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ab87bc3e-692e-4166-b099-08d79b84545d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 19:34:54.3502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nHQ8+PBsOeLEw4I+rcAZl37WSx3avzUgj4GpfzYCAoZr///WzMkqWqkaxWBcirSz6LvI41jl/NunaS15tTqyRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3604
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_113517_524246_89FAF3D8 
X-CRM114-Status: GOOD (  16.58  )
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

Hi Joseph,

On 1/30/19 10:15 AM, Vineet Gupta wrote:
> On 1/29/19 6:29 PM, Joseph Myers wrote:
>> In the absence of clear consensus regarding consideration of new ports to 
>> undocumented architectures (which would need to result in consensus on 
>> suitable rules on the subject to go in 
>> <https://sourceware.org/glibc/wiki/NewPorts>), and in the absence of 
>> suitable public architecture and ABI documentation, I don't intend to 
>> attempt review of this or subsequent versions of the port submission.
>
> That would be really unfortunate. Your prior reviews of RFC and v1 have been
> immensely helpful, it would be a shame to not continue to get this privilege goinf
> fwd.
> 
> Having said that, wheels were already set in motion after your initial request in
> December. The ARCv2 ABI spec was opened up quickly (and mea culpa for not
> referencing it v2 submission). It is now publicly accessibly at [1]
> 
> The public version of PRM is being worked on, but it will take time to come to
> fruition. I hope you appreciate these things take time, considering where we came
> from - and it seems you found a workaround anyways ;-)

The public PRM is now available and I would like you to try and access it so that
any bureaucracy is out of the way before I re-post ARC port for 2.32 !

Do note you still need to register to download but that is no different than say ARM.

The landing page is
https://www.synopsys.com/dw/ipdir.php?ds=arc-hs44-hs46-hs48

And there in the link to actual doc is
https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-HS.pdf

Let me know how it goes.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
