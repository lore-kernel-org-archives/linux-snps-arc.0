Return-Path: <SRS0=DkXR=GI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62E6C433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Jan 2021 05:02:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5304A227C3
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Jan 2021 05:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5304A227C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:To:
	From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f54lkp2mP5G77nx34NyfpVQrPl1/7k6ZXg6+uTrQeDE=; b=YTRFgM8r78WQcD/xCcHBvH+kqs
	Ad77QMdrI28JLBznS+u2PbGJf9/3rbx34fEyt1+w7PzgN8AHlxxUhRl594uAKTXl3Eg3nNezCoy7V
	3nu1rqoEmaNbB9OeiufoKM5U3nw0EkiQXoel+ynbMITMnb1u8zfsVBS6+YRJe4TJjexHPC/djE/2+
	SCrFQakHDd76Lz9o0hcgcsoBAZpUwsmKswpZGjb0nWnJxGwqSwtf7dBZ7Oj8DvvjSqYmZczToQtjl
	Jf6QG3ZIS8R5aHzmjXJ1+8vI96INAE8KnRkme8aaJeEl9ul884tr4zxZNPP+pyejwJNEIyXCW5gnd
	RqKt+75w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kweTn-0000oP-Mx; Tue, 05 Jan 2021 05:01:59 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kweTk-0000js-Bp
 for linux-snps-arc@lists.infradead.org; Tue, 05 Jan 2021 05:01:57 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BB085C0099;
 Tue,  5 Jan 2021 05:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1609822913; bh=VY2Ir/l95n053dK2gs0RVVSFiAgd6WoZ01fen89dTKs=;
 h=From:To:CC:Subject:Date:From;
 b=Kf0xxUSEv1MYBylbT0lmMH+GwvphTpt8pr/EZj9E/KBD/oHC/vcuU4bz3TgGtIrYI
 7RU2mot92dsjSf95eS0fHFz8iZRBWcL9RPJEDwAPHIBdda4hGkurplHRpWN/TgERMJ
 5+AbkKwpeLycbjg0QrqbJlWt4Esp2uk+1gtk1Ke0SMy7VCNLxYMgMdyjXlnar1gxLU
 X4/mE4kZECqMWBuo5cfEuQkVVClZ/wNU6YezAewaBPr0cii+ZeSXDtdU67geLBBV0C
 WrUpmV23zO22lofw5B6yu5iFvH9Vh5UNsggjA3Y5+Y6qte8faXBdPVkMRj7gEbu63f
 gNUkvF5xbIRwA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 32B8EA0086;
 Tue,  5 Jan 2021 05:01:50 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0CE17800C1;
 Tue,  5 Jan 2021 05:01:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="KZ9gNFcs";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+oqM8nSYNZ3xACLX7GyR5Bz52MBuDUpDOSsxpfTHGzNq1MgzDyiUT7N/cFdBTO0+vlxKcFryeAhmYSbG36TNSf1dd3QsRb8ey07VzDh/5D7yT87gMRj/D1PZZRg/MyX6ZLPtOkNbM++GoGGAdcEn6UNDNx9j+ftKM2c6ocixmU4zS0JzK4vdC+2gCpTrs+LwGAwiC9cODQSfy+t7QazNEKfhBf4Lwh/jZND6QJfQYKrS83d5oHPauYVnnOT53QnOSd1SazQU4rQAlzDlscdM6xHvRPwXlV/HBEg6Mwhz+p8jNC6QNmXna1Vpn6CrP6khONIIhw2Az6+F24+/HZOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VY2Ir/l95n053dK2gs0RVVSFiAgd6WoZ01fen89dTKs=;
 b=SgrVGQEzqlPYzmDnH4ewlTi3dt7UIhdGPoQmFxd2nVXJzFyWwNmizT2RwNlQUNVbn4Bft+Go2XHX3uQSvyKoF3LjXTkdzQTShz2+qoepXShClWb7GjAyLvB/JFdbF4Yjlo+OGVwVNqRiGE5T4dG5s4m58urmCMwJxuwmWxOu38Q19DZOyRunt3qp7ypTIYmz/dUSzOaB0cTVxszKKTnyfD5/6QKd1ScE3YT4eWCF7OGEcueCUgE4erhK7RAr5WyGf1d8bIS60aJXkqsZIsLIBdmtveedkTCnfklF6HfnDGGs4flzigebOVnTrox3nb35ksAds3dK7G+l6jbFzmGjdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VY2Ir/l95n053dK2gs0RVVSFiAgd6WoZ01fen89dTKs=;
 b=KZ9gNFcsUi/iPBcO7THNYZzqHJAEHP+SyLGQ1VoJW1tKWn5M0jxVHTm0+4Mq7OsjIPdTVv0vkWA5L8d7dgptqST+NWPK78715Ih/GC/7G7reVMvimWr6d2UenDLE5QOH4OmHraeGTajccw4WuXuV+bXHk+a9OKCj4DKnfIs6ogo=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB3747.namprd12.prod.outlook.com (2603:10b6:a03:1ac::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 05:01:46 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c0e3:82e9:33d2:9981]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c0e3:82e9:33d2:9981%6]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 05:01:46 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] ARC updates for 5.11-rc3
Thread-Topic: [GIT PULL] ARC updates for 5.11-rc3
Thread-Index: AQHW4x/dHM0ejFsM6ECjA0VN0drGbQ==
Date: Tue, 5 Jan 2021 05:01:45 +0000
Message-ID: <59b97fef-41fe-f520-6e3a-2d96958cc744@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
authentication-results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7e132b5-6486-4dda-bc91-08d8b1370071
x-ms-traffictypediagnostic: BY5PR12MB3747:
x-microsoft-antispam-prvs: <BY5PR12MB3747EE1696937B006E236D20B6D10@BY5PR12MB3747.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9qlbFKHiK/opkCXrKcGJAOaUB1/TaNGXEGN5TaELzD2fCyJlSOeElraaBa1fYM2xvTX/7Ov+n7MR9mX/xwqnsLfwHyLimZXFmK2ABAj7kp7NrjjT/qY+pDdhok3zPrxL9fXcGrTiCnRbPy+QT7w14WtJJUImMrRV1ygC4w66jfYuU8lv2QQX7Y6bxpUyLXP7J+7VUkqRgwFzrdGHIlCD1vOMvtG0RkJjFm1bhcrOhdteXiJk/Zjo6dy7XPNLgkXXx3dLFaMlKQuF8Sgm5bN9PfONvk1AqsLE4z+1yJ9CvgrwNh+5dHvkyvHZG9mi2DWDqoFcPdxJKjrgJPE27Fp28jgpCKF3PN8hkd80i25j0SNyRT0/u8xTJXxnuR8jXhZe04HITvHO3mVlEQJfh6r6Re5ON06ib524iu/RzrrPLzQOohMCWpsAdl7dVbd7Ka9NYTAPfBAjZ5N/KqQ8enUC9tl/4jC+ZcDoIr1IX0zTHC8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(136003)(366004)(346002)(76116006)(66946007)(66476007)(66556008)(8676002)(478600001)(86362001)(66446008)(15650500001)(2906002)(8936002)(54906003)(6512007)(316002)(4001150100001)(64756008)(6486002)(6506007)(2616005)(36756003)(6916009)(83380400001)(5660300002)(186003)(31686004)(4326008)(26005)(31696002)(71200400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YVVraFE1WHZRM1pLUzkvV0YvYmFPTk5iNGVYWG9YSW9nTnluZWI1K3Fudkxh?=
 =?utf-8?B?VEZnLzByMmdFa3gxYm1scktmb3ZtSDdQM1Z6d2Q4QURyc0pJeTNETjNrenhG?=
 =?utf-8?B?SW9vTElKbFY1YTNwWXBsbDhKSWpwN01mTER6T28zRS93TVZrdUM3UTMxTVZw?=
 =?utf-8?B?SVZ3OVhlRVh2SWVuYlNPTnRKTE40NWtEWDdsY0E1ZFlEWXBiQVE5b05EUVpo?=
 =?utf-8?B?TWJta3RmdldyZWx3SkI1NElBRHFVMVlwSVM5OW4wbjVLbXJhRHVzTy82NmFx?=
 =?utf-8?B?Q2grWVN5TjM2bHppWW1yWktSR0hrcnZVcEZ6eEZRbkdyVjdoaEdqTXNTemNm?=
 =?utf-8?B?WWxYUnRpVEJGRm16UFgyeHBoMGJIditqYkQxdFNzaUZzak1mSmFpbzYxVXZo?=
 =?utf-8?B?OGlITjV6OC9jOGYxeGRuT1RxK1k2eG0xM3FMNnhGQUV4K1lBd242Sis1MVps?=
 =?utf-8?B?bThKejBxVElJSmRYbzA3eWJOWGRVWDR1cW4vR3cyUEhDUzBFbnkxNjlYSzdG?=
 =?utf-8?B?d2VReEt3c0JXZE5JcTQwbk9lQWdTVFlKOVc2aGJ5ZU1lb0p0enpjcnBVL2tk?=
 =?utf-8?B?elRIU0NJd0NiUlhteG5wNjNBc3ZoZnNmb1hMaEc0cHhLNHJTL2dOSk1sYndV?=
 =?utf-8?B?R2NNUVFnalJMRWd4ZzlpbnQ2WXMyaGpvZG5KbWtwb3RIRXhFQklIWmpaRm5I?=
 =?utf-8?B?SndxakZQVlByZG1tVUVCY2hGSW03RGVzenowaFdPZksrd283MnhmV21tb1hU?=
 =?utf-8?B?QmZwK0VIRlZya0c5ZDluQkVsWGFkY3V0K3ZJN1UzMHNEdExyQ2gwRHVkU1M0?=
 =?utf-8?B?NXZMa0hmSnZxbGk1RWQ3bktqbnY4RkNzMkd4OW0wcTc1NFVDS0o2ZUF5ckJE?=
 =?utf-8?B?SFdKUW9jdEEwMVNmUGYxRlZKVzE1UmpPbVN5NkZNdllhUzZneUZIbkxOcWRj?=
 =?utf-8?B?REF5UnlCbSthRGFQd1hEZFRWYUExd1FtR2pYai96cWtMRm9zMzVHdXhXYVBp?=
 =?utf-8?B?SG9NQTBLMlBiOFduMnRvcy80R0pCYWNia0dzT0R4cmFKS1p1NVBnejVMek5C?=
 =?utf-8?B?VHZwZFRvNGwrYmpTVmNMTkx3MTVsZWg5dTRVNjlIM2pSd1grdkVnbTl4azg1?=
 =?utf-8?B?KzRxL2dhbFo0WW1ONUt0dlo0K1NKWHFHTXJ6dHdWcm9WK0hyVUl6YXRZejBa?=
 =?utf-8?B?VWtyTldmNE1ZMEg5cmxXVlhqM2U0ZHVEdTYzWHZYYzFHb3NwVUE0UTJDVzJv?=
 =?utf-8?B?cS9kbSt3UnF5WUhLbENOYTlZRjY3RGRXQzI2clNYck9TTkZvRXhHemF1TXlv?=
 =?utf-8?Q?mpKYhCoDRKiig=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <8E4B8F99CF75E745AA52457DBC7704BD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e132b5-6486-4dda-bc91-08d8b1370071
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2021 05:01:46.0077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WXVnyFP8EIk/QchNgCEfk7/SfHXdXXz30GXvP0zBwtvMPhaLGk2FLKIpy6X+GOQbE2+6bNz7J9XcJZx/B1ZuyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3747
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_000156_902431_9E939D79 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Linus,

Happy New Year. Sorry for the delayed merge window material - holidays 
got in the way.

Things are quieter on upstreaming front as we are mostly focusing on 
ARCv3/ARC64 port.

Please pull.

Thx,
-Vineet
--------------->
The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:

   Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ 
tags/arc-5.11-rc3

for you to fetch changes up to 3a71e423133a4b1166ffafcb4a7cfa87ddecb910:

   ARC: build: use $(READELF) instead of hard-coded readelf (2020-12-01 
17:24:05 -0800)

----------------------------------------------------------------
ARC updates for 5.11-rc3

  - build system updates from Masahiro Yamada

----------------------------------------------------------------
Masahiro Yamada (6):
       ARC: build: remove non-existing bootpImage from KBUILD_IMAGE
       ARC: build: add uImage.lzma to the top-level target
       ARC: build: add boot_targets to PHONY
       ARC: build: move symlink creation to arch/arc/Makefile to avoid race
       ARC: build: remove unneeded extra-y
       ARC: build: use $(READELF) instead of hard-coded readelf

  arch/arc/Makefile      | 20 +++++++++++++-------
  arch/arc/boot/Makefile | 18 ++++--------------
  2 files changed, 17 insertions(+), 21 deletions(-)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
