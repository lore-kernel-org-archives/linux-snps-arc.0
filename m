Return-Path: <SRS0=xP+w=Z2=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5759C43603
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Dec 2019 23:03:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A34BB20675
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Dec 2019 23:03:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DEhT6dKK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MGNdtvmM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="p6XmDtnh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A34BB20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZOkDjUETu1DvtdM87r7Gcu1JbtoGQpvWwvmZfU5aVqo=; b=DEhT6dKKg0wxal
	IFu8WrXulcdgAkoK4cf4aLK1RFghi/5p/GO2zWCIJsGHqR/R0X8C1jTF9Z/KnWUzfP635S+OZLRr+
	RGHJ7BlGzPMd3GFT69hkqMfVZcUnMG+Gm8gTdbCD1/F5ERT0OVjcRQAFEqhbcdbsopap6YgijnM6r
	G5+qez0WrvO6XmGdydmj9j/H11GWLf6x2IG1huqjoMHb/qadAXDB9AI+U/886acAh1vbTPiY1RGdJ
	o2oN/aI3eeTGMnc8wHy0eypLcrwKNZGkyu5GeZZeo36CHEn+Hkv7T1vtAprx8QgxX53hfnO76oOUo
	yRbUWYI2P+ifuWEAW51Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icdg6-0007WP-B2; Wed, 04 Dec 2019 23:03:26 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icdg2-0007Vx-12
 for linux-snps-arc@lists.infradead.org; Wed, 04 Dec 2019 23:03:24 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7988C423C7;
 Wed,  4 Dec 2019 23:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1575500598; bh=gjB9GsxFRVJZirPkLDHAUbnKMJdL/UFyRU3krxscO7o=;
 h=From:To:CC:Subject:Date:From;
 b=MGNdtvmMLipZ2zBCUnQUhYJuFOQia1NbCrzD1FOuq+Xo1xynpHB8XYEgkr0HkpdrF
 m0bbiq4nEwCYJ1s9BwrsNDJZrU47b72CrU6w936s18Jf46JzqIfyymRubrHZhH4yRM
 pkU6iwtj/Uw3sAC2RrS6zdFeiJJ+Dz/9P1u1t0xKC0M8ngZ7ECPXPXu6QVzphC1pHv
 Ol7RD9DnoJRIHo9+C5FzBvbMTnSezFpjEq3zBAp8mb0pr/yHUJOg8Xf2haUqEXLIYA
 Ox0M8I5q1qaLpIM5rhV7qXyjIe7wJJehxbCsF2+ishwMihA10QLJNVtTO4Kz4hCHyH
 5C6Jqul13wL+Q==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B0225A007F;
 Wed,  4 Dec 2019 23:03:12 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 4 Dec 2019 15:03:07 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 4 Dec 2019 15:03:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TArFdgPoXHokS4hRfxI1ey793E9++KQzZh+1ny8kDt4FDSzy9WunJt043PO8dpAsEwFIrNBtyjFoKSKx/BPI49J8hcXnDievYgppPp5zi6VrlXCxq0tirIV5VLe0n8KBD7g3sOKFkD9PJAOpreU9RAWsOh/jwFiRxM7EwHCWorie7dbnZ6N6YfcdghnWgy6Vuc2nF8Lqb0Y+eEoI5iEyFIOVomEqi+VY2buXYcdVK53ALG7XR7oDYZIbDJjgLMYSM0jfzIJ5J7Gm/49ZplkS/NnCuZ9+GSeNLcJUV910MPNwBfByv8weBl9v0wPvjUm0cu9SQWZl0LRKiA278rSfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjB9GsxFRVJZirPkLDHAUbnKMJdL/UFyRU3krxscO7o=;
 b=U9O7nnZyQnxkDgPT4toNsmRXPa7fpdn8lK4tO3nblp+V9EIwxRNPfJL75kTt2s5U9dNRciWGOp2i5hd3Phg8FtX+6TqhYPO1tP/P/GU3gqxoMFqrAAYJtek9PrP/HYS7cC6DHVlK1JtVOFPPyn6rNbtGCvopwSj2ET0vwSYh0zIyBEbgY7+1i6GEHPkDMnfLB4cEsuQKXGD2BvvzUe+xeFZE1k2gOdQ/K4sWENu6JB2f9wu/9eCILztlYcv/tmDdybJdQAjjFuNJLBT6RRHNd8cDaBM++tLZcU7alwblSXROEfoYPAEg0ERrfHYEK4Rw0b5hps5dwYZqEFnUySyVQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjB9GsxFRVJZirPkLDHAUbnKMJdL/UFyRU3krxscO7o=;
 b=p6XmDtnhlgaGiLASD5+mEbczCcUVL/lo5QZOS5Q7A3QdNUPXFwOwAi09ebkcBFjvJFRlGza2BqBOI1/3iBzs8N/oyaXhOJdB6hCQ1e2PI+OjnVAqFjQfCnZCTLGBKvnKJG7C91YyHKwLh4vLo2DAmNSKUPqGMyGnKn/j3kwHlsE=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB2949.namprd12.prod.outlook.com (20.179.91.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 23:03:04 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::19d8:78d:d881:c8ef]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::19d8:78d:d881:c8ef%5]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 23:03:04 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] ARC updates for 5.5-rc1
Thread-Topic: [GIT PULL] ARC updates for 5.5-rc1
Thread-Index: AQHVqvb7rRZuACRLekuxh1BZ5emWWw==
Date: Wed, 4 Dec 2019 23:03:03 +0000
Message-ID: <79e777e1-9b20-6db2-9f0f-2e9f943336b9@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 035f0cc7-c48f-4fce-623e-08d7790e1e5d
x-ms-traffictypediagnostic: BYAPR12MB2949:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB29494EB36251D6ADBC6A8FEFB65D0@BYAPR12MB2949.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0241D5F98C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(189003)(199004)(54906003)(6506007)(6916009)(498600001)(66946007)(3846002)(14444005)(26005)(107886003)(6486002)(6116002)(186003)(81156014)(36756003)(15650500001)(7736002)(305945005)(5660300002)(102836004)(99286004)(25786009)(81166006)(65956001)(14454004)(66556008)(71190400001)(58126008)(71200400001)(4326008)(86362001)(6436002)(6512007)(8936002)(31686004)(2616005)(64756008)(4001150100001)(2906002)(66476007)(66446008)(76116006)(31696002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2949;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vE6wAuTI5fNFADkuOpK1vyWaCtf6aUVeV3ZZg/ejo4vB+c8Jt8rrnt1q6m3yUhPdyZOSAr55SSfiEh+bXmbos6lTb6O/uAFhkS5By11kLcpeFY7OWxw1kcYdvo+Y+XPyOHgrJrj0ukRZ229eK0wEO9dNwjC65LjqsAaDUQpo7uu8vk5+mfTht7fWrnjlBEZkFoSFiZ8nH1Z+yL8TEJtdLzKDWhVNENWR+0LYfzwvDlm3ueOww3rizSR68j81/ODBygZYvWlj2luZEbfcx6YipvVbCOJFqs66SZw9DO1NW1yRZWPyZzEleQtq6gSHCsfSMiKUeGObyavk+/6euwxvzg5MuCjxbgkU31g4YpZyQ9bqa6jygOh2TtLKx3S7SKTu8qB8Fk64b7gUhT4CzZzw7ly5ys+UTKs1fhTcAvRHxF8Y1nxFj0XLFYgZgF2Oo69f
Content-ID: <E475F5D536613945AFCCEFCA16D4DEB0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 035f0cc7-c48f-4fce-623e-08d7790e1e5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2019 23:03:03.9575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZZfXJfVlRXqffXY2VtMi7362OuNzTFZRWkOdec7mDLk1E9GIoXSZxEkkSPM2/PCa+sPeg0P0Eg4/BzfOQSU8Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2949
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_150322_221880_A4F346A4 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Linus,

Please pull ARC updates for 5.5-rc1 cycles.

Thx,
-Vineet

---------------------------->
The following changes since commit 7d194c2100ad2a6dded545887d02754948ca5241:

  Linux 5.4-rc4 (2019-10-20 15:56:22 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.5-rc1

for you to fetch changes up to 9fbea0b7e842890a76acffce9be9e430b9e11194:

  ARC: add kmemleak support (2019-11-20 09:13:42 -0800)

----------------------------------------------------------------
ARC updates for 5.5-rc1

 - Jump Label support for ARC

 - kmemleak enabled

 - arc mm backend TLB Miss / flush optimizations

 - nSIM platform switching to dwuart (vs. arcuart) and ensuing defconfig
   updates and cleanups

 - axs platform pll / video-mode updates

----------------------------------------------------------------
Eugeniy Paltsev (12):
      ARC: regenerate nSIM and HAPS defconfigs
      ARC: HAPS: cleanup defconfigs from unused IO-related options
      ARC: HAPS: use same UART configuration everywhere
      ARC: HAPS: add HIGHMEM memory zone to DTS
      ARC: HAPS: cleanup defconfigs from unused ETH drivers
      ARC: merge HAPS-HS with nSIM-HS configs
      ARC: nSIM_700: switch to DW UART usage
      ARC: nSIM_700: remove unused network options
      ARC: ARCv2: jump label: implement jump label patching
      ARC: [plat-axs10x]: use pgu pll instead of fixed clock
      ARC: [plat-axs10x]: remove hardcoded video mode from bootargs
      ARC: add kmemleak support

Vineet Gupta (6):
      ARCv2: mm: TLB Miss optim: SMP builds can cache pgd pointer in mmu scratch reg
      ARCv2: mm: TLB Miss optim: Use double world load/stores LDD/STD
      ARC: mm: TLB Miss optim: avoid re-reading ECR
      ARC: mm: tlb flush optim: Make TLBWriteNI fallback to TLBWrite if not available
      ARC: mm: tlb flush optim: elide repeated uTLB invalidate in loop
      ARC: mm: tlb flush optim: elide redundant uTLB invalidates for MMUv3

 arch/arc/Kconfig                       |   9 ++
 arch/arc/Makefile                      |   2 +-
 arch/arc/boot/dts/axc001.dtsi          |   6 ++
 arch/arc/boot/dts/axs101.dts           |   2 +-
 arch/arc/boot/dts/axs103_idu.dts       |   2 +-
 arch/arc/boot/dts/axs10x_mb.dtsi       |  11 ++-
 arch/arc/boot/dts/haps_hs.dts          |  15 +--
 arch/arc/boot/dts/haps_hs_idu.dts      |   1 -
 arch/arc/boot/dts/nsim_700.dts         |  36 +++----
 arch/arc/boot/dts/nsim_hs.dts          |  67 -------------
 arch/arc/boot/dts/nsim_hs_idu.dts      |  65 -------------
 arch/arc/configs/haps_hs_defconfig     |  30 ++----
 arch/arc/configs/haps_hs_smp_defconfig |  32 ++-----
 arch/arc/configs/nsim_700_defconfig    |  19 ++--
 arch/arc/configs/nsim_hs_defconfig     |  60 ------------
 arch/arc/configs/nsim_hs_smp_defconfig |  58 -----------
 arch/arc/include/asm/cache.h           |   2 +
 arch/arc/include/asm/entry-compact.h   |   4 +-
 arch/arc/include/asm/jump_label.h      |  72 ++++++++++++++
 arch/arc/include/asm/mmu.h             |   6 ++
 arch/arc/include/asm/mmu_context.h     |   2 +-
 arch/arc/include/asm/pgtable.h         |   2 +-
 arch/arc/kernel/Makefile               |   1 +
 arch/arc/kernel/jump_label.c           | 170 +++++++++++++++++++++++++++++++++
 arch/arc/mm/tlb.c                      |  81 ++++++----------
 arch/arc/mm/tlbex.S                    |  18 ++--
 arch/arc/plat-sim/platform.c           |   1 -
 27 files changed, 363 insertions(+), 411 deletions(-)
 delete mode 100644 arch/arc/boot/dts/nsim_hs.dts
 delete mode 100644 arch/arc/boot/dts/nsim_hs_idu.dts
 delete mode 100644 arch/arc/configs/nsim_hs_defconfig
 delete mode 100644 arch/arc/configs/nsim_hs_smp_defconfig
 create mode 100644 arch/arc/include/asm/jump_label.h
 create mode 100644 arch/arc/kernel/jump_label.c
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
