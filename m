Return-Path: <SRS0=xDVn=CC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B6CC433E1
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Aug 2020 20:29:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E99832078D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Aug 2020 20:29:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="umhM5m3f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Gji/2sXd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RcYXn/cO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E99832078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nqPVw/7XmaKCzHNVtNpvqhReRn+FFb+HFWVoGYKFzWY=; b=umhM5m3fYe1LrVxwUoBMNBO6J
	3pR0w0cNuGFcbbeNxQla3fpIifW6dikmVQeVGeVM36aWokfKPsqIuNx9/h5ohsPzqGbePvgpQw0TQ
	YnyBz8oNlIARiTzlfqgapDKipLdUAW6UYWd6295AZxeG3gczeFXomeWhqMrBVD+vzUOt4HyTtxBGJ
	jeSI2bq4wM3XtgV98+N+ciXGNQjMdULzHxLdipMQQ3fjEv33gMrMA2ppPT4OsS7NMjRIE/OFar6fh
	WKRMzPjafGJvCtkce/zAaqR8h6hP0FRP8BGkGpq7Pkj83e/MzkbllT+xEkrNYZ45cUQ3TvZysFX4m
	f4xZFao0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAJ5i-0002cq-Uy; Mon, 24 Aug 2020 20:29:19 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAJ5g-0002bn-L7
 for linux-snps-arc@lists.infradead.org; Mon, 24 Aug 2020 20:29:18 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A92CFC0756;
 Mon, 24 Aug 2020 20:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1598300955; bh=To07YKcUXHab8aY13AlnkjKIieCp1HThyQDj/RKP4yw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Gji/2sXdfaBwK2qM1RfNTTdq0v00yzXkAmKb48qY7OtweW/TLtLCfNZ2hGHT8XyFP
 pzWDbYaZIFU0R4pXh/1ou4asZdKw0J2HYmy6heZp8v5uD32R3QxMxIGw8mOQWxj7iO
 acaTpsM1C0oX5qn9IxULL6RI5wqi1rvpn11N8Cz9/khjJ4Ttfd86G0RdQpn4U+rZTT
 4BgNcakiJY5p2m/F5YMfIweUZULxupLbG0EDWQ61KaIGq7cTzrRxTqTFAi8oqKqVNY
 KjvAjVyGMz1a3Pyq7G6Ufqh9UqrPB4qCvgtiY8/MdUmwnCcxR/h1+KENPh7HKsPKrd
 Sz6u9TpeikRTQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E3D99A0060;
 Mon, 24 Aug 2020 20:29:10 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 493744013B;
 Mon, 24 Aug 2020 20:29:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="RcYXn/cO";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dn7n/cp2+zv0hOU2fcCrH4NSdYgzKVLbHARSqcFvBhqNQtcdjCzR/qXiAdJCXAyUTqUPoQGxAqFV+95sv/nJLylCvbewIbblNzgdgll8N6lLJAq1iSwOLzb9svxfJrsIujn1SLrqZt2mnCyPyJQCxNibqxfUryiDKBQGh6RqV+rfA2DlcbkM1iYQWGbrQwK0+K8DjJlMyd5T06+OIa8ul/dhKceqmdChfb4x0h1aoGTK+ZIXRuC4gHoqqeRGtFDPPio20G4mMUPeK3DEyxOldCARajkUjBwAydGv1Vls4EUOWbGDU7Oo67pbNj7g0xEB1IXS6WnjqgSOlIm6ApBflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=To07YKcUXHab8aY13AlnkjKIieCp1HThyQDj/RKP4yw=;
 b=Y6p8hIhviyKYPM/gXo0kPBm9Dq6N+Cd75ldB/sk7H/5zFLBfwn3jMotja6HkzfP+s+IZ0y3E7oK2qY6HKxd1QryBYJFdNN2UM5Eg2pgFzPgyO1EyRsDIbwIPI0VM6c5RpJCgdajJ8X2/9cHPYSBkbwtzs04okerJT3JXC4nLCmN39YDfW4vvf8jlmdYbaanjcTUtp63DtyaYacISwdE9mpfmU6YNF7OoVc8KJhT1nPWcQTu55T9dzzFgpJcF3gPlmxmqsmsolxASLJwsVQA3hAZ+yuwvn6pH+FTQ8q+fN5NAM/uwmY33Y1ahYBMtgS0V/WCrQlOfHJAnQYApJJkhvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=To07YKcUXHab8aY13AlnkjKIieCp1HThyQDj/RKP4yw=;
 b=RcYXn/cONU0YVcTf733ktUkAEjiAOtP8k5JXXm3+uTrlY2x1B6591O0kWjhb0xQOVT84frPnZqiRjZNnMDLNS1zMh0TxaSeeeVak5dIH/u18cH6sYAbT9Q48Q8P/Hyz+AWE375YPYJyMex64qqt8GgkWiyJsZ+1nl7rIhYX8Rzo=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3014.namprd12.prod.outlook.com (2603:10b6:a03:d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 20:29:05 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 20:29:05 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: {standard input}:5973: Error: operand out of range (512 is not
 between -512 and 511)
Thread-Topic: {standard input}:5973: Error: operand out of range (512 is not
 between -512 and 511)
Thread-Index: AQHWef0l0UaEhGbt3ESFttATwdb/VqlHksAAgAAUs4CAAA7kgA==
Date: Mon, 24 Aug 2020 20:29:04 +0000
Message-ID: <da83ec71-b2de-d85d-18da-fb1799486b1f@synopsys.com>
References: <202008241018.RkyIlLKd%lkp@intel.com>
 <20200824095831.5lpkmkafelnvlpi2@linutronix.de>
 <28384fea-4a07-c57d-04b0-f44f1c70adc2@synopsys.com>
 <20200824193525.utkbrhgvwpi2i37m@linutronix.de>
In-Reply-To: <20200824193525.utkbrhgvwpi2i37m@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linutronix.de; dkim=none (message not signed)
 header.d=none; linutronix.de; dmarc=none action=none header.from=synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:2f8b:62c8:4c97:a7a2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d18b5543-dd84-4855-25c6-08d8486c5881
x-ms-traffictypediagnostic: BYAPR12MB3014:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3014B7571C491F0F78916C1DB6560@BYAPR12MB3014.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7rL0jqK8BTBq90kwgzJIRmHAR5R6cssEmiR0TiaoaqarhLS1ayokN3+52RZ0J1VDyh8kd8FmruKloA7RdCnxO3mBD4HM3zEy3lg01p4JvY7JmsdUL67vgpTAZck12EyAcUA39zXfLjzMXT4oRuBi8m8Ks+Yl3VsVl+23q/BthI4+B+4v8XkbTob4H3kQdx9zt335r+3KbwVTWaz3G6P6loEDY1tCCK84VRYn4PKkgFX07aSsueE396o0UfOIeTesPJPnmX6ngImr4yfV/3txyfhhy2W13BcgIOvf9FREn2FV1nGrU9D8YOSRPywQIuKH4qSYnJPQFFkS7aEVNpBy+aZwqiQ3c7Ju/KV0oRz1R4wWzyXAhIwTRhMR2yc4Sp6Cr3rQ/mQPLvc4j/r8sl+uMTi0JcZGCUZes6nHDP/CP8dTIQxmWxUP47fQ4k5uCUGFQpdvl9YMGLEKNkfvmZ7FUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(136003)(376002)(366004)(346002)(6512007)(186003)(6486002)(53546011)(2906002)(6916009)(4326008)(107886003)(8936002)(8676002)(6506007)(2616005)(966005)(71200400001)(316002)(5660300002)(83380400001)(66946007)(31686004)(66446008)(31696002)(66556008)(86362001)(36756003)(64756008)(76116006)(478600001)(54906003)(66476007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: BrTeKtBvMGDNqxPW2c3MKp1GJY7BQl+d2hihYng18bsmBIduINNNBCp8WgwNeTdLrXMM3F3Z5WiaTbCaYVsTwXmXHbbeimJV2zKSSIMMz7aAdo3ZHSQtmrpRLFD3WpjvuAv0LhHaDUp3FNqR87hFEZQGaoJ0TDJrHn59/5mYjOlFnk7uOvR3lgZjkV7i1+wYE2RsJALYIVrvTv/LopsCSB0w6La/lvGes6AADHJFP1IxjruRfbmHvEoku+xAES0/Qbkvs7RF2Q4vJwF/U641Cl1M7Ev4x0gKCc0bGF7eP8W1rgMtX5IKV10VKAsl1dAFCV4nMxM+lghiCFvzYuwloyFdoiZEP0B22qnG5bq1ji31RF2bp/LKwI+WV6kioYU5ASBAxBZqkgUpNF3NNFuqUFycZKLiFBYWBAptQoJWaVKn+Ruevy1ToETkd6GoLtt/x4k1kI9Wnb6jXlQgzk9KebbHzXt2styZLK7vT6AOytbCbusjwg+i/y4AFKZPkBle2fjhaJxAjS3OfvQrzLgVQ8VuSVLrBFid0UKRR4rqZkp5rtS3WJRucj5UqWegZbcEFmAfkKQYtHB2FIo2JVo2NyZwBQj6wa6JdJy6LgrTIBkAzodLz1SfDbYAx5PSWmMhb8IhJbjdVRNXa+9PZillHZRX6J9M5VSb4Vh8x4njHbcVDWlbOdgUokMepf2vm6Nf3ioZO8DpgSf4sfi9VMh+sg==
Content-ID: <5B66017D1B67D94A8959CB83B9465C61@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18b5543-dd84-4855-25c6-08d8486c5881
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 20:29:04.9283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pz0/DOExkaaD8GObp2AKmVK0eKIhs9pFVMay6yD8qxwHfrq7964m5RcqObGCdPzSSdGrAyFLi0Ndnxafowwk+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_162917_203483_F92664E2 
X-CRM114-Status: GOOD (  29.18  )
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ofer Levi <oferle@mellanox.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Sebastian,

On 8/24/20 12:35 PM, Sebastian Andrzej Siewior wrote:
> On 2020-08-24 18:21:21 [+0000], Vineet Gupta wrote:
>>>>>> {standard input}:5973: Error: operand out of range (512 is not between -512 and 511)
>>>>
>>
>> The error above was fixed back in April:
>> 799587d5731db9dc ("ARC: [plat-eznps]: Restrict to CONFIG_ISA_ARCOMPACT")
> 
> This commit is
> |git describe --contains 799587d5731db9dc
> |v5.7-rc7~32^2~2
> 
> and CI said:
> |head:   d012a7190fc1fd72ed48911e77ca97ba4521bccd
> ^^ v5.9-rc2
> |commit: de8f5e4f2dc1f032b46afda0a78cab5456974f89 lockdep: Introduce wait-type checks
> ^^ v5.7-rc1
> 
> so my assumption was that it tested rc2 and bisected it down to that
> commit. Otherwise I don't see the point in testing such an old commit on
> a recent -rc2 and complaining about things not related to one another.

/me confused and a bit out of context here. I didn't see the original CI report
but anyways, we know the code issue... read below

> 
>>> I have here gcc 10 and the output is:
>>
>> I suppose this is mainline gcc 10 ? Although it doesn't seem like compiler version
>> related.
> 
> Sorry for that. It is
> |$ ~/cross-gcc/gcc-10.1.0-nolibc/arc-linux/bin/arc-linux-gcc -v
> |Using built-in specs.
> |COLLECT_GCC=/home/bigeasy/cross-gcc/gcc-10.1.0-nolibc/arc-linux/bin/arc-linux-gcc
> |COLLECT_LTO_WRAPPER=/home/bigeasy/cross-gcc/gcc-10.1.0-nolibc/arc-linux/bin/../libexec/gcc/arc-linux/10.1.0/lto-wrapper
> |Target: arc-linux
> |Configured with: /home/arnd/git/gcc/configure --target=arc-linux --enable-targets=all --prefix=/home/arnd/cross/x86_64/gcc-10.1.0-nolibc/arc-linux --enable-languages=c --without-headers --disable-bootstrap --disable-nls --disable-threads --disable-shared --disable-libmudflap --disable-libssp --disable-libgomp --disable-decimal-float --disable-libquadmath --disable-libatomic --disable-libcc1 --disable-libmpx --enable-checking=release
> |Thread model: single
> |Supported LTO compression algorithms: zlib
> |gcc version 10.1.0 (GCC) 
> 
> This is the one built by Arnd and hosted at
> 	https://www.kernel.org/pub/tools/crosstool/
> 
> Is it suitable for testing?

Yeah, as I said this is not specific to compiler version, just the combination of
build options which trigger it.

....

>>> so I removed CONFIG_EZNPS_GIC. And then I ended with:
>>> |  LD      vmlinux.o
>>> |arc-linux-ld: gcc-10.1.0-nolibc/arc-linux/bin/../lib/gcc/arc-linux/10.1.0/arc700/libgcc.a(_muldi3.o): compiled for a little endian system and target is big endian
>>> |arc-linux-ld: failed to merge target specific data of file gcc-10.1.0-nolibc/arc-linux/bin/../lib/gcc/arc-linux/10.1.0/arc700/libgcc.a(_muldi3.o)
>>
>> This is unrelated since original .config with CONFIG_ARC_PLAT_EZNPS would have
>> selected Big endina build, but you need a BE toolchain to get that working (since
>> libgcc emulation code still comes from toolchain).
> 
> Is a switch missing while building the gcc, another gcc target needed or
> is this something that is not part of upstream gcc?

You need a ARC gcc toolchain configured for big endian builds (actually the
compiler driver can handle both, but support libs such as libgcc need to be BE/LE
built either through multilib or cleanest is to have a ARC gcc configured for
big-endian. Everything is upstream.


>>> Please update CI and ARC.
>>
>> Nothing to update in CI. I'll send the ARC patch as a follow up.
> 
> but it shouldn't complain about a commit merged in v5.7-rc1 because it
> caused an error which was then fixed in v5.7-rc7 while using HEAD
> v5.9-rc2?

Yeah this indeed is weird, the only explanation I can think of is the rand config
triggered the issue now.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
