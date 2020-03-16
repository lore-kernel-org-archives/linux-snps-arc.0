Return-Path: <SRS0=C9XM=5B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F47C0044D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Mar 2020 11:22:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 456FB20719
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Mar 2020 11:22:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="msPQj9H/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Bf57S5nw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Zdjk1ImK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 456FB20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vuai3cCz3EyZL6ZaUnMHRbkrSy7yLyOT7iU8CQDzlwQ=; b=msPQj9H/TcYl/u
	+9eeyVsg4IfOF6BU9hA7Vry/2eWiiacD4XTwDb3FNXHQe9DF9vyyeTQbCSnPVi3kGf8w04aRDI+uf
	Dq4vYzdpuYofJcez3mydRudVrlqEhIrniLYWoVeLZelMRz0MiT8ExU7eQ8VsZ2ViMXZIGA9QlqQfN
	iarN0TAvyPy3uqlFCLv0gPA0zGIZ5plVeZz+d5fOsC2qK89NMjblubrYSxqBbj7LWs7WzQTQqccau
	Kt7Sf0ArjA0E3LvugcUnnWOuNUHXdXmigDhEkTwt5hobnmJSfqhGu6iIVLAYX/+W/VxYKpOpiRqJk
	sJTOJnjMzaTAaGsp11HQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDnpB-00041L-91; Mon, 16 Mar 2020 11:22:25 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDnp8-0003tL-Ak
 for linux-snps-arc@lists.infradead.org; Mon, 16 Mar 2020 11:22:23 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 60E3443B14;
 Mon, 16 Mar 2020 11:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1584357737; bh=zwcEPQwkn65vGGEclhkCAuf+7QFOR9xXIkQzp3NYels=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Bf57S5nw9oNK5QZOLill+mVuIylXHFZuQ+nGLDfrUivdjz/hwsXyj7z9drCU0eqWw
 bpyJVxi/8Dv4hHTHsghzMvJKaRh/LzODI/X7xmtty6pck2HWlLQXdznHntDCRNHdNI
 IJF/w7+db0SRLFDsACKUQyKxyi4QEtUsZ7YqlEEHHwCkCrimNFhmlmb40wlGPiysa8
 3tivAUm8sg8n6TWecx5vAYU9IimV2hs0x6qa5ar2AVYGEz3H/lPmedo1XC0TdpkbiZ
 cFOl38uc9qNwk+uVCweqzbkMqmjai2IX13+EZ6KTGBj/bKmyWwqcqAPh0vBvw8VXyD
 FL9xM29RzGe0w==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id EFA42A007A;
 Mon, 16 Mar 2020 11:22:06 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 16 Mar 2020 04:22:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 16 Mar 2020 04:22:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lhq+b3a8WoozFO+L0+JwTI7kfF3UaWN/LuPT8rbXWnZfH++m53IFgazA6chw0bGQkQPDC1ihC2duyNCivJNlXqeYTodT6iUG6heq3A2ujN5gzuIdk6JE+4Z41RewQPGK/FUzhsrRdWtDoDGUG3Z6gANbunyy9TpAeeXBjE8+HbNyl21sGYucgjbB9Cm2JXfnezrtQ2zpc/p+a9r37CSXdPcS5yMfUekWsjn5PiaVBFN5Gr9zJuh3mBurbN9nDfGbUmA/t9+Lo5jZDQjyRCuSrvfv5fxGsWn3EMae1fYWz1Z4v5QmpZQz460rcix3kF5MPNXL7Lxh13dOvKYyzSvo7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzoKHLtvndrVAH2je4Q3GcFBAa18kZGtGFU4z/Vqz1Y=;
 b=JWbA/eU+plC/mNGP6wIKW9jYa+kxsvFTekS4xiX/OrbNSrZJ2o6iwnC6lNlI3Av+wJFSqZjAlkz7cr99XWXIrRcRov5yoWxSA42Pi+Bs63aObBfEKLDxhaWRjgBw39E0qkBiK5sCTvHn7mYcqj56NgyCVpBLbo4/UYtjK8MdrbkHGwJKY9hTsVHuNLUI6466ejIUAMLXuLjjFTwBeZqBu9nFKubIAKfQop8j2m9xRYd6ecBFRLHUMS0KLBVjhNHzyj0TzHyYeNcwG6iYBR7C6ut3JbhEW6yo3Chq2DhTWHmbQEUwHeXrIbGbIqa305C2N6d9Is1ijuP+6VE6Msw/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzoKHLtvndrVAH2je4Q3GcFBAa18kZGtGFU4z/Vqz1Y=;
 b=Zdjk1ImKTk5+giuuJC1aZXEqVCoQc0um0YGmKUXEYMEGlrqAGmaM7D1sl/KHdR9EvKWVK12YLwVgT3hG80jeuxItlMDppVEl6dlza8MmzzIK/1+nx67pDcfsi/OLVwC6v4MJaldVwzdMzonaGZ5crVKstXf7SGVzAchqaOGFVXU=
Received: from BY5PR12MB4034.namprd12.prod.outlook.com (2603:10b6:a03:205::9)
 by BY5PR12MB3763.namprd12.prod.outlook.com (2603:10b6:a03:1a8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14; Mon, 16 Mar
 2020 11:22:03 +0000
Received: from BY5PR12MB4034.namprd12.prod.outlook.com
 ([fe80::3531:93d8:93db:207a]) by BY5PR12MB4034.namprd12.prod.outlook.com
 ([fe80::3531:93d8:93db:207a%5]) with mapi id 15.20.2814.021; Mon, 16 Mar 2020
 11:22:03 +0000
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] initramfs: restore default compression behaviour
Thread-Topic: [PATCH] initramfs: restore default compression behaviour
Thread-Index: AQHV948GpjzRGPXRkkaV3g1nK8etBKhD06gAgAdDK4g=
Date: Mon, 16 Mar 2020 11:22:03 +0000
Message-ID: <BY5PR12MB4034829B9DC8EC77C5164439DEF90@BY5PR12MB4034.namprd12.prod.outlook.com>
References: <20200311102217.25170-1-Eugeniy.Paltsev@synopsys.com>,
 <CAK7LNARSNBOMK9+s9pmVsVtnzr2qqFxHNr+GhJd_BnbgNW4SSQ@mail.gmail.com>
In-Reply-To: <CAK7LNARSNBOMK9+s9pmVsVtnzr2qqFxHNr+GhJd_BnbgNW4SSQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=paltsev@synopsys.com; 
x-originating-ip: [84.204.78.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ad9ce92-b82a-4315-2352-08d7c99c409e
x-ms-traffictypediagnostic: BY5PR12MB3763:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB3763E626E99F9C2C61507833DEF90@BY5PR12MB3763.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03449D5DD1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(376002)(136003)(346002)(366004)(199004)(66476007)(64756008)(66446008)(66556008)(9686003)(55016002)(71200400001)(26005)(66946007)(186003)(316002)(6916009)(52536014)(33656002)(2906002)(54906003)(5660300002)(76116006)(91956017)(478600001)(4326008)(8936002)(81156014)(107886003)(7696005)(86362001)(6506007)(81166006)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR12MB3763;
 H:BY5PR12MB4034.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6ECtIJURypmmvOA91LpKOzKLZkhzHIPrC/lxZxc0hqm4B8wX6TyThWvkWcgzm7e1NoJw5GtiNbUM3vEgPR0nXA1CYmyjjvixf5EIKwjEqBWBCEZl1T7QeHp6DACxMZaOMQrvyIJhvtx+YMJKpBAzhroG2N5f1dtrzGPRKiyvktRKlEkSs7wxMHN6cFPTvnohaefmy+ObqgcMt6MN63Zn201aRgYRFEus5WlIRaxVBdYtzhDz4MANnV+MNeYL9Q3YoMk63cBGI0TLWFWx93l5tVyxKAa6CrBjfO6ukH4T+pSiAnqG47fs9Qqp1Ydw5aObbcWPDDClvVOOOO6nBt9z7LX2eA8dMLBpXvCmRXeA0NZLpgHoMO06tH6o9SyWXt7lwMo0hr2BqgCyN9mUGaE808wTBzXojgmqwcUlztHfxXF1F7+R59uqiNeaIPpTYrWj
x-ms-exchange-antispam-messagedata: bNCyqHWa78at3y0NpEpDnbMrIG02iYn7jnOTfrROFe6FtqYUZH1pK77G6xnvvTV0Im7y9kB87L/ny/Ftq0ubjWrouDHxLMni1nHv/zB9TvpiTk4toh98cNmxXVqGVD9b9kbGkKofwxkAySu1jrtRPg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad9ce92-b82a-4315-2352-08d7c99c409e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2020 11:22:03.0519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Xd6+EZ8PuQjj/bcXqgmXNmuKqSOYa9Ov5l9og94avanqGmce3H20+LNC0DbmtwdmaTDum5UFUlanr0iYFUi5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3763
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_042222_423707_797D5263 
X-CRM114-Status: GOOD (  14.54  )
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
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Masahiro,

>From: Masahiro Yamada <masahiroy@kernel.org>
>Sent: Wednesday, March 11, 2020 23:12
>To: Eugeniy Paltsev
>Cc: Linux Kernel Mailing List; arcml; Vineet Gupta; Alexey Brodkin
>Subject: Re: [PATCH] initramfs: restore default compression behaviour
>
>Hi Eugeniy.
>
>On Wed, Mar 11, 2020 at 7:22 PM Eugeniy Paltsev
><Eugeniy.Paltsev@synopsys.com> wrote:
>>
>> Even though INITRAMFS_SOURCE kconfig option isn't set in most of
>> defconfigs it is used (set) extensively by various build systems.
>> Commit f26661e12765 ("initramfs: make initramfs compression choice
>> non-optional") has changed default compression mode. Previously we
>> compress initramfs using available compression algorithm. Now
>> we don't use any compression at all by default.
>> It significantly increases the image size in case of build system
>> chooses embedded initramfs. Initially I faced with this issue while
>> using buildroot.
>>
>> As of today it's not possible to set preferred compression mode
>> in target defconfig as this option depends on INITRAMFS_SOURCE
>> being set.
>> Modification of build systems doesn't look like good option in this
>> case as it requires to check against kernel version when setting
>> compression mode. The reason for this is that kconfig options
>> describing compression mode was renamed (in same patch series)
>
>Which commit?
>
>I do not remember the renaming of kconfig options
>with this regard.

Ok, I've checked it again - looks like I was confused a bit by
"CONFIG_INITRAMFS_COMPRESSION" option
as in v5.5 kernel I have in ".config":
CONFIG_INITRAMFS_COMPRESSION=".gz"

And for v5.6-rc1 I have in ".config":
CONFIG_INITRAMFS_COMPRESSION_GZIP=y

But they are different options actually...

>
>> so
>> we are not able to simply enable one option for old and new kernels.
>>
>> Given that I propose to use GZIP as default here instead of NO
>> compression. It should be used only when available but given that
>> gzip is enabled by default it looks like good enough choice.
>
>
>Another solution would be to move
>INITRAMFS_COMPRESSION_NONE to the end of the choice menu.
>
>The default of the choice menu is the first visible entry.
>
>GZIP if RD_GZIP is defined, BZIP2 if RD_BZIP2 is defined ...

Thanks for advice. It looks like an excellent option here, I'll send a patch.

>
>> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
>> ---
>>  usr/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/usr/Kconfig b/usr/Kconfig
>> index bdf5bbd40727..690ef9020819 100644
>> --- a/usr/Kconfig
>> +++ b/usr/Kconfig
>> @@ -102,6 +102,7 @@ config RD_LZ4
>>
>>  choice
>>         prompt "Built-in initramfs compression mode"
>> +       default INITRAMFS_COMPRESSION_GZIP if RD_GZIP
>>         depends on INITRAMFS_SOURCE != ""
>>         help
>>           This option allows you to decide by which algorithm the builtin
>> --
>> 2.21.1
>>
>--
>Best Regards
>Masahiro Yamada
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
