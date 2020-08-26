Return-Path: <SRS0=1o5z=CE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A854AC433E1
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Aug 2020 14:40:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E83A214F1
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Aug 2020 14:40:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mXP29/oK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ibVCUDFy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iieGOAga"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E83A214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3H1ni/Vh3U6t3nnXSPolTz0CsQqwbxoOqVteD5gspUM=; b=mXP29/oKPFEw2ESe7WXvu36cq
	Tj4WSm9Aj4i/ryHzX3+fmbnclj3us/neRhgPeBSLVvXvIhptNQQli93tUIkdyray26r9AwfLRmSKr
	n5wOJwzlZjCIFFP+Qt9aKjM6MZcRk0U1ScRQzaa4XuLJfJcmX+tV72YkXd4heVw/yUFohKQVDQlPh
	eeKmqHy6fmKyWoR/24DTAO6JQFF6mLDIqsKjEkGAaTjWMzZCwq8+U4QBXQC4MdDiJiILkbUc6wn9F
	uk7rouhr0zX6aCUEtaR1Djier1F6E7wdW0oqEQU3/L/HjCgNKLKRembzqmNUUBDGRkrE8UN50XL4f
	I4vUpRpug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAwaw-0007ED-MI; Wed, 26 Aug 2020 14:40:10 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwat-0007DL-K6
 for linux-snps-arc@lists.infradead.org; Wed, 26 Aug 2020 14:40:09 +0000
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C9C3FC0C1C;
 Wed, 26 Aug 2020 14:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1598452804; bh=zP10O0i8XrFhBDoePDbV6RJicDkE7MDTn6OXk200uGE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ibVCUDFytJtIrzRy4M3w5LumutV9Re0qVyTH3NdCTl/RCH8MYW8HhePqyMHYv6WqX
 QJh1+A9d+cYaqlA1jqmZlmSMI5RkMfu05FtRwVrV4SxflvvpCpMwyiSY/BmgIG2sQ1
 ljPCtO5kVKJOgDbd9wsgQIcqQw+ULMF9oJBlBlz3l4GXLUJXAnrxSmH4G2ROuztjEC
 tf7liOHQJo/M6VaeVU3WQhuzKDXDASsQoDirEpFtq3ur/aFLdKPX2ZsB2sjfVnWRqr
 5ApSPm4PhXnYiCde7o7XzKdzgHU3SZ9HlqgkRhqy1Fo9O91XgKKgM6/qh5U+w+nhOE
 pNPUaBYjhWTGA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8AB3CA0062;
 Wed, 26 Aug 2020 14:39:58 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6031240149;
 Wed, 26 Aug 2020 14:39:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="iieGOAga";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQWLf8foKpFI74rsgWAKm9NL/U/n2kQGnSJ+W+k8Q8uqCsyg5t7kaneyZulwNVIwW1Mj4Mg4Th8esV95sB43MVcwPMyOqaTEJyQkYP9R1JLF0DYUdK0JNa8ygx2064uMJKRl4Z2Gf5MP+V9pZ8hCf5dQ/p2WVd04fxTFxR1fci9UrpqwTHU3CwjfKoqbRGX+BjpCgMBe9fyS4jpDe1jnBNlYilTqg1DqFH61w9MFNUv2J2nHrNSdYq4coJ5vuh0Xv2A0ijVSk0ecemAN4UiW6VW6ffqlPrHgNhKuxZXBbP0C8iheIqrQWZJlh97vnr4mOACjw4mSllF7/6zbdnAXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP10O0i8XrFhBDoePDbV6RJicDkE7MDTn6OXk200uGE=;
 b=EuTfnJbRAgBtLBEnMiVso2RNGXcMS7vN++KlsnhKRhs3LjRcchpIPPdr5zhdTFJ7T05rgsCR9QWwwXfzDwKr8pVEsv9a9zeS0EtzTHNTCmcTLyYXN//3wKIGFzJwDQMazhtBmO+gAv6V8mFxB/e+i0zscA2boRsmyVPUqKdms/ZsLbtOQUDJ9VERCGIXdPs9fuLzRlm83J1uWcnPPJHNIISvaL0PviV4BOO42sVb9ZdcyfVA/H8pOu+w27zBgFqy0H8usG9ax83oztSapL7bwSjSROLGU9pApfLDGLoqJJtJJdey2ZjgCrENGVvX5dN1F8aMaK2+bK5n4xicjxP8AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP10O0i8XrFhBDoePDbV6RJicDkE7MDTn6OXk200uGE=;
 b=iieGOAgaW+zlhbefxpGuPxG4nNfYWTQBuYeTRyQpmCDMrInYJPO0Vq6+JGH5O8zCbxMnGcibw0g6EeTsx5McPfBetNHyjlJ91E3BiVdeHbClkj/RTznfxtsNr97nKCVDnamQkI6XDBK64PpKOGpfaJoxPxVXSlEIR0Zx1WzgsbY=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3159.namprd12.prod.outlook.com (2603:10b6:a03:134::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Wed, 26 Aug
 2020 14:39:53 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3305.032; Wed, 26 Aug 2020
 14:39:53 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "debian-cross@lists.debian.org" <debian-cross@lists.debian.org>
Subject: Re: ARC rebootstrap prereq (was Re: switching ARC to 64-bit time_t )
Thread-Topic: ARC rebootstrap prereq (was Re: switching ARC to 64-bit time_t )
Thread-Index: AQHWAwU1+G2qa2pZHUGmLInRr97YtKhaX+MAgPEHl4A=
Date: Wed, 26 Aug 2020 14:39:53 +0000
Message-ID: <775ecf3d-bc33-ff9c-347d-3b2f0db6c509@synopsys.com>
References: <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220162735.GA26634@alf.mars>
 <2c3d76a7-fa94-d16e-2803-a98a4761e427@gmail.com>
 <20200326055408.GA31088@alf.mars>
In-Reply-To: <20200326055408.GA31088@alf.mars>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: lists.debian.org; dkim=none (message not signed)
 header.d=none;lists.debian.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [107.3.145.37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f00d3754-fa5d-42a2-5788-08d849cde555
x-ms-traffictypediagnostic: BYAPR12MB3159:
x-microsoft-antispam-prvs: <BYAPR12MB31596AD386F77BB8DC61EA50B6540@BYAPR12MB3159.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /E7O0M1lPfnXEZAYz9ERrWFU7087cUiPix0lvMM4CQQ1q1okil5PKq1UWOUnV64hS6UuKGYuCJDTF8rmcWFccbWMQqVyULWYR2rmC2vink9HuPMjZDmWVotsiFxqmBmHTZrqBdtxWvDheq44XdfC+B5XUokXL/Y3XVt5I4y7YutjGPdUutUKnmOJgqV8E4lkyaHSCaDheOPTHTgQ//ebRtwnGMYAeeGrZeZA8lBxvsBZSsnKHCtNMop/+1Thwe5AJk3fs9H4Jpm5WxNufPhaVcRlaXrle4fEKInBcGAEGUYEFFfML+aShGYQkPrHoGmhFGdyVlzYzl2jRlHC/gZceXxwsyOj/3v5dnwABJG5dIKXucRVwNOF4erk88OFqqlW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(39860400002)(136003)(376002)(366004)(86362001)(4326008)(64756008)(76116006)(26005)(6916009)(66446008)(66946007)(5660300002)(6506007)(53546011)(6512007)(31686004)(54906003)(6486002)(478600001)(71200400001)(66476007)(66556008)(2906002)(8936002)(31696002)(316002)(2616005)(186003)(36756003)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: YPMGJO++pexPuTw5jqKEdU0S1tW7ARbQ9Ep3o526nGhBPX1Z3DWoFB69PqiT+pqKLVuIvNXbsFKHV+xG/yYh6elxjJRdt8BmXJ+tSv5F+KrAq+LspPADK9NQFwoBRlsUimT8GVA1lUT/j/CHu7KpFKOvcE/BGZ1ZD6wXa1WAaxwSQ22kqEUKtjx3VBtM94DxgTla88yQg/ked+Z9xgZUqOSOKOfEnxqyLDmpdLxGopicM5r67nApL4o9L6CKSpE6j5h1kV/vJIhDjWmdlG6CV2uXeo2qRFSpjg9vvDgdlP41O91WOhaJ01c1xlck/AJABNqmX3HgoNLzm39xMoaj7MW6VSBmRe0EGq4gA+FqfQi7TbNhs5HYtWwXpHLRqh2aqWEdgFwUVeWHr3QjKpyBIqf3YhJyj0+izUhv/cZDS1UX9VhFiqeDjJcXt8PuCvLzGXfZqgZtv2L95twrFCBRsynHnYyMN9YEUuTEK1F4DnQhO+Azvv7k6tvAeBIJFyoWqHgYSAdZQsLFRia2QutzaF+HZjXuS7/QhL+9kaZvY/Pt+iKIhhzSO5aowVhLxf9sdCvciYy6AjMH7U3zjQXT0d8sv1HZ8UQ40JHmmnClHptnVuiJwp0gH7NJf/uef+E36YNhwAqBY1opxYFP3EHohQ==
x-ms-exchange-transport-forked: True
Content-ID: <B6B1CF89DD8BA1428947FC33213D9D23@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00d3754-fa5d-42a2-5788-08d849cde555
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2020 14:39:53.7034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cMH8uTBkQWMg256AcFFn6fFDYupLFy1hTy2dkF9Zjnc4rxi7FGgvg1ZiYWhWiyVHXeXcCO9najbq4MEC1KlCzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_104008_117427_B406FBD7 
X-CRM114-Status: GOOD (  21.06  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Helmut Grohne <helmut@subdivi.de>, GNU C Library <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

On 3/25/20 10:54 PM, Helmut Grohne wrote:
> Hi Vineet,
>
> On Wed, Mar 25, 2020 at 05:25:58PM -0700, Vineet Gupta wrote:
>> ARC glibc is still in works, but assuming that will happen in near future what
>> other upstream prerequisites are needed. The obvious ones would be Linux kernel,
>> gcc, binutils: all 3 of which are supported for ARC. From a quick glance at debian
>> wiki pages, I presume *bootstrap is mostly done native, so needs qemu ? (full/user
>> emulation ? And does qemu need to be upstream too ?
> Given that I ran into the glibc issue, I can tell that at least
> rudimentary arc support support is already available in Debian unstable
> for binutils, linux and gcc. (Otherwise, I would not have come as far as
> glibc.) Once glibc is in place, work can proceed on the Debian side.
> guile, libatomic-ops, libffi, libgpg-error and nspr ususally need a
> little upstream support. dpkg, gmp, openssl, and perl usually need
> Debian-specific changes. I'd recommend looking into libatomic-ops and
> libffi early. The other packages are usually simple.
>
> The aim of rebootstrap is to create a package set for essential +
> build-essential using cross builds without using any qemu. Beyond that
> point, you'd switch to native building. Unless real hardware is
> available, you'd need qemu after the reboostrap phase. Whether you use
> full or user emulation is your choice, but I guess that you can speed up
> builds using user emulation, because it allows you to mix and match
> binaries. When you upstream your qemu is also your choice.
>
> Please get in touch with me once a suitable glibc is packaged for Debian
> unstable or experimental. Please use debian-cross@lists.debian.org or
> irc.oftc.net #debian-bootstrap at that point. Alternatively, package a
> glibc locally (like Arnd did).

Following up as ARC glibc port was merged upstream in 2.32. Can we now give
rebootstrap a spin for ARC Debian enablement.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
