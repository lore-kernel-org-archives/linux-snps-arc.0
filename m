Return-Path: <SRS0=blQs=5P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD5AC2D0F1
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Mar 2020 21:18:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CBE62078B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Mar 2020 21:18:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tlr7xeh2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="esdpNHNx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DeIuBGzE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CBE62078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QcljeMDrlSRRbmYVzh5pON6HxreSOBPCYVaKjXmJT8=; b=tlr7xeh2TrhVHX
	jljy/LmVBkwyYluessXnKGQsKWtNb1Ix5z0snVCQbPIjBJRRXtOrc4V6gUoC3AUuOEL6e7ZC9MDiz
	hfknngER10d14DicUyET+48Rq33oQCIHgBb6/xO39XMCfo4RXwHcmmVZQHPSo42g1Zng0eeZRA2Bg
	S79uPehP54YjFyCaMzS91nHUopWHVCCXCYh8hcSGg/c0+K6ManqGlMHRxbp3oI4Vq9KmA7P5HXJmz
	jtnMh0XpBVIHnG5uw6c+FmnLAkLTR8A0L6sLEINQ7v1qKsPwv1m712AP+8lEFaPkmI9yIeamZkOSX
	Qcrmi0cWWlKtGB8D8pPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ1nl-0004Pq-FN; Mon, 30 Mar 2020 21:18:33 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ1ni-0004P6-F2
 for linux-snps-arc@lists.infradead.org; Mon, 30 Mar 2020 21:18:32 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D601E43B47;
 Mon, 30 Mar 2020 21:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585603108; bh=w11nOFzhODGImKpvVLVlfICBlG0r3QFveGD4roxtLGk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=esdpNHNxaw/8j0EVAw1F5joINnzHDmoKk9NhSjjic/nMdxJMwUrMGo37spAJpCDPo
 NID29G9mF2sXlrnDntuBxVcHk0hawR4nIMz49V5sqSJJnxiLcx9wMx/dPjgrFh70h9
 yYVbeZP+OHe7ScbTeplgEJ0PTJakAuLe2wFOO2pqvsWnhBtsuOj/5l4XoYkZmUBt9X
 mmWngKc/pJTFP2aeHT8SMerPiicWdgQwD4C318ZydvHGGNsu49wLEYI9Q3J5ckMBDP
 OmIOMpQpzccqO7GDzl4TdIMPGhBorVKen2w4UgknNqQaCOMiwceWlA1gSorMLsQeoA
 l1Lu5EOERt5Pg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A9A33A008A;
 Mon, 30 Mar 2020 21:18:15 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 30 Mar 2020 14:17:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 30 Mar 2020 14:17:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScxVa1oJQWe9WfdH/Ma3kkpMbIEhQyV9U198bw1MQ+b2hZQqJD43h2Gwrt+70OzIzMP1cf5qtZgdiIsc/0JEic3mQY5yZhQmxpyKgtH0+3kYlWUlHXcSFnSBP+XcnM/lPZzTRh9M91NfnziSv2AJ9rdtkX6/1iFSEqG4kBS3CebXJrRgLeVKXOevnAU1Dk1PrVyzCXuV2WZRXwzaJo2QOlAjEHembOoFkGakzv9c7vOHzW6jLUfx9BXp0etzO81hozvznZ1HOkkkFEsyc22ph4LP4OJ15duGsL7PLJSYa4YTdj+sYLITkvFFbx0cf0N9Dacv6JnwIdgXTFAbsSrp7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w11nOFzhODGImKpvVLVlfICBlG0r3QFveGD4roxtLGk=;
 b=KWopbTB6kcjHcztB2j7oaPMkmuXRzYWQF+0lUVYUWM09ZIrU7nsUGIUjZ0Wae6ZE3Sz6XuwaBSZNWWVsTzI6SZ6t9phAtwUfh9kgVGEnaoLnv8/9TBUZwdZYWtdfsM6odvLvFxSxBq5ulviX1tHrHbUjRYTZCtZPFmXivyYwBT5zJFddtIyDwCrErWeBRAkudpBu6MbBXszOF8gf5wl6Z+IFbb6BIzI7cI9Hsad+AitI1Xu/htxPj3eSCYfYuUwNrgMvqJtketEBknEHbolmL6T7Ej/yfYrqQib84oLPnWnKt1emE1X8FQPVD8v9EYtGJzSpLYDwBLg0jVdzKaGrWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w11nOFzhODGImKpvVLVlfICBlG0r3QFveGD4roxtLGk=;
 b=DeIuBGzEn+OJwb9DzxQhbJ1guDXRLfclmEAyus920pHQHUzCKL/CXek/eZm3BAq6EDAOjiKt/FFVTaK9/L47BSc6MXM8P4BOCWXz4hDwLfKxWD+B1reQbmdqJylrLUL3kjZR99vILCEBMShajLuJNt3fn/2Ni+Y8d1PPsTdU+bA=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2662.namprd12.prod.outlook.com (2603:10b6:a03:61::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Mon, 30 Mar
 2020 21:17:33 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Mon, 30 Mar 2020
 21:17:33 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v5.6
Thread-Topic: Build regressions/improvements in v5.6
Thread-Index: AQHWBpcvcUuu+ZudzU+b+A9JmGkSJahhl0cwgAAMygA=
Date: Mon, 30 Mar 2020 21:17:33 +0000
Message-ID: <c8447243-98c6-d545-9766-e6b3f33f4d13@synopsys.com>
References: <20200330085854.19774-1-geert@linux-m68k.org>
 <CAHp75Vc1gW2FnRpTNm6uu4gY3bSmccSkCFkAKqYraLincK29yA@mail.gmail.com>
 <CAMuHMdXDBtOo_deXsmX=zA9_va0O5j8XydxoigmS35+Tj7xDDA@mail.gmail.com>
 <CAHp75VfsfBD7djyB=S8QtQPdKTkpU5gFzyRYr8FshavoWgT0CA@mail.gmail.com>
 <CY4PR1201MB01204FB968A6661FB8B295ACA1CB0@CY4PR1201MB0120.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR1201MB01204FB968A6661FB8B295ACA1CB0@CY4PR1201MB0120.namprd12.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 0b087d53-7b87-4157-abd8-08d7d4efc374
x-ms-traffictypediagnostic: BYAPR12MB2662:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB266296C507D145ADE8BB4223B6CB0@BYAPR12MB2662.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-forefront-prvs: 0358535363
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(376002)(346002)(136003)(39860400002)(396003)(66446008)(110136005)(186003)(54906003)(6512007)(66556008)(2906002)(66946007)(26005)(76116006)(316002)(478600001)(64756008)(966005)(66476007)(53546011)(81166006)(6506007)(4326008)(8936002)(31686004)(71200400001)(81156014)(8676002)(6486002)(31696002)(2616005)(5660300002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MefosHNoBFOZX4sTLVOzji5a24eQbpxAHzFEjocd1eNCtWmLjOm4lkSM+Azi18H/6dZ/6rstCaYs7sKt8xx8ZwRvPQsD/piDN15ZXZN72ahrX7axzn6zujwzMsPC8wnzJ6NGk7lni8Wk1PQ/wGjrv4WiRuEpWnRAujjzrbxUFdQfRUUmEm/9fjruT0Zwnq1DwVqL1nGNfH8V5mWhwB8azd3gKrapAJ5Xj7J38r8X/sa6iUi0VviHWwUrtcXPScFCFui6rzz4aQmir4vw5ckDHOJeH54JYbAqQ2z84olgZaYoFu152/ebPsdc4VLY86qFg9U4vNpTl2Uj7uqMq7RtMyUshuI7v1Wa7svzkfPab0sP/97mm6ZXtNf7KYrKOLCWHnvi8boQk6dg88LO+L+OlV54nsZACvXpFr/SOHoR3jpztoZp79FQ1sUszuPh6A/ssqkRoXtOmaItgfgogqO1YPGQILC4LDmg1Kkg0qlUrkroWcnPm3A5PfLtAujj/f2Agp5o2m+VnGuJoQ+MJN5lyA==
x-ms-exchange-antispam-messagedata: dn2o0802iOFx2X98jgqwAoDy8MSENvPZ6W7ZE+Iuovak7AS+BkFwrir8GiTGfwb6JQb3VdfGJjXm+P1lUZJkK6Cs6YQbRM+HoDrjzhiyYy84+jmFnZzhd9/8vNXYaHmroEQXoF6Lb4xTzP0+HeFSWA==
Content-ID: <37B9FEBB70A4894B89C41D78191D95AE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b087d53-7b87-4157-abd8-08d7d4efc374
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2020 21:17:33.6760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MZ13Z+ig2srQUDEu+Tlr2Y8y7a+nUMhr46OjP2xuzb2wuaA6kEDJ4Y6bTLYKWqOqqrkNMa2iXeufvuV5ltQtHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2662
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_141830_518316_1A0EE6E2 
X-CRM114-Status: GOOD (  16.86  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/30/20 1:40 PM, Alexey Brodkin wrote:
> Hi Andy, Geert,
> 
>> -----Original Message-----
>> From: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Sent: Monday, March 30, 2020 4:28 PM
>> To: Geert Uytterhoeven <geert@linux-m68k.org>; Alexey Brodkin <abrodkin@synopsys.com>
>> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
>> Subject: Re: Build regressions/improvements in v5.6
>>
>> On Mon, Mar 30, 2020 at 4:26 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>
>>> Hi Andy,
>>>
>>> On Mon, Mar 30, 2020 at 3:08 PM Andy Shevchenko
>>> <andy.shevchenko@gmail.com> wrote:
>>>> On Mon, Mar 30, 2020 at 12:00 PM Geert Uytterhoeven
>>>> <geert@linux-m68k.org> wrote:
>>>>> Below is the list of build error/warning regressions/improvements in
>>>>> v5.6[1] compared to v5.5[2].
>>>>
>>>>>   + /kisskb/src/include/linux/dev_printk.h: warning: format '%zu' expects argument of type
>> 'size_t', but argument 8 has type 'unsigned int' [-Wformat=]:  => 232:23
>>>>
>>>> This is interesting... I checked all dev_WARN_ONCE() and didn't find an issue.
>>>
>>> arcv2/axs103_smp_defconfig
>>>
>>> It's probably due to a broken configuration for the arc toolchain.
>>
>> Alexey, do have any insight?
> 
> I think I do have some but first I'd like to get it reproduced myself.
> I just built v5.6 with help of both GCC 8.3.1- & 9.3.1-based toolchains
> and didn't see a single warning. So I guess I was doing something wrong.
> 
> FWIW
> 
> 1. My GCC 8.3.1 toolchain was exactly this:
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2019.09-release/arc_gnu_2019.09_prebuilt_uclibc_le_archs_linux_install.tar.gz
> 
> 2. Linux kernel is vanilla v5.6.0
> 
> 3. Configured and built as simple as:
>    make axs103_smp_defconfig && make

It seems the build service is using a arc toolchain built in 2016 :-)

# < /opt/cross/kisskb/br-arcle-hs38-full-2016.08-613-ge98b4dd/bin/arc-linux-gcc

Call it Murphy's law, same year a little later I'd fixed the same issue in gcc [1]

[1] http://lists.infradead.org/pipermail/linux-snps-arc/2016-October/001661.html

@Guenter could you please consider updating the ARC tools. FWIW you can build
stuff off upstream gcc/binutils using build system of your choice.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
