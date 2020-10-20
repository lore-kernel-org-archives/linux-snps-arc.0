Return-Path: <SRS0=Bb/B=D3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006A7C433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Oct 2020 01:57:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E3D422260
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Oct 2020 01:57:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1TaDyDV+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="D6UFbeU+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MBkYguBl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E3D422260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:To:
	From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wkRoCDKRWqoRMo+w00MMc7uu28EcQ5HObGKPAXN3qRc=; b=1TaDyDV+OXysHMFhrI/VI3a9j+
	ugX0+url/vshZom++TKRwuaCL+AK+hZ98UtNE9TirMY1L5EZvMtme/LT/MI2LWyTGpxkrslB7v/vz
	zIYPh5fbL4oPdxDUraKclL1gplM6khijvFlk+QLaGknXrikdCI2XMAKuVNeQb7Vw/uZ3rwNzuvarm
	EZOtTD/1I7L9CCFAQrw7Of07HOvneup+ysfPFvAaBtolO+qX7AKPmvFmb0fYtx8WWrXUkMhEfQX54
	XxThU5QY2sN/yuHk2+gShQ7CnnkqYQ9PNZWDRgByXNGuwbfXBCA//Dzr2PhRTfObTYJjCMpvA9e09
	SVtenJDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUgu8-00010G-4l; Tue, 20 Oct 2020 01:57:36 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUgu4-0000z8-JV
 for linux-snps-arc@lists.infradead.org; Tue, 20 Oct 2020 01:57:34 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0F5BBC0090;
 Tue, 20 Oct 2020 01:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1603159049; bh=iU/PKHvFdzyGz0EhGBTR5K7eKPXhzNFCvm/aGhdKZ60=;
 h=From:To:CC:Subject:Date:From;
 b=D6UFbeU+FLAEJp0JoNu82fxQxuTTQXMZgjI4QZ+9OWs5AevsQev45hcnZSBc4jPvQ
 ZEeHj10fZV0/60PMr0z1zqyb5htJ6CYjR68JizCO7L+omd3+gpPW10j/EBw/5NgNU6
 i0PqiJtviLGlEq3P1dOJUSAFddt6nRweehSO7ERWtTZIT5HXw/KlJoyLeTCLRXPYAG
 gOOXo5GDGnwH89MfpNTCVy3eoUS/vXrFv0jTZrFV+yrDmePXkt9DhO0BBuCDTSea70
 s7CeSoFQtZX+01sTtqYQC12xF7fTfUrinqY/G/9xAcyBB/Fo+FyJyNSQ/y84nuoi3O
 hXI0235APzeaw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5BEECA0082;
 Tue, 20 Oct 2020 01:57:26 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id AF1EB8027A;
 Tue, 20 Oct 2020 01:57:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="MBkYguBl";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHTTY255UHXpnjOUVZTV0CtnaGad/vQpsqz44Pb95aOFbh/4M5vBeQEGsYURFWgEUXuMa0DLUHP8eHN/hVJ4GmXSc9+c03faFH02+eY+oC9vF1+LjHUFgLs0W8ZirVZ3cQKnVdFndDKENiXWOBVOjLSHTv++dft+TKHNhKkJ7DfK4YFxxZOi5N9T8698pE2MoKZBA8NehGrHiVm6f3Byo/oyT22McaMv/YGV2Oa7+YZt9iEA1lML3BBBjxZVRKLLwOrUBGKSiohazhzeNWBxDFqweSUMrBqu1Ns9hjK/sXxP65QSK3CqInOC93/SxRGAf++QE5UvZBaTK7zBylq5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iU/PKHvFdzyGz0EhGBTR5K7eKPXhzNFCvm/aGhdKZ60=;
 b=nlgR+97PRZ+ZuXlLB0mnvXP+WwQOngfZ5ti1gAXZUJJKlwLkFfj42/3CO/exwgH6sR50iWnenn47gsvSF4Ke0S7OdRwipygboQwamJry/0FFgh+4uiYdptCjUhXYfz1X6bFeDs5dCJ0cGkD8E9e5AMuqJSwUfmWWAUa18FPzRExziZT1frz73S5/KSw1Qb/K7bHOIUssve6sSytGbeHmSYpqlw1iP6jnwj46rz3wUXZkTj5LMhXOYzCLRVefx7boyczRhTV6YMSzLlqkoMj9xAPg5CXkp0gh7ms9/Ywdmv/9D1xRrqsmcmxyNkdQtj0Z14D+gtUAyXr1sSwDwjrykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iU/PKHvFdzyGz0EhGBTR5K7eKPXhzNFCvm/aGhdKZ60=;
 b=MBkYguBlSJRyJR8YEoA3ze+RmtrU2yB61l8UhOuubRltePjEx9k14y4FFISS6+9KypdWXS4mv30mXih8M5KRRXaQf/Xu9YBsQ93mmDcE2P1EKWDxfN07YfIPxUSGvMQWpgb1jCb8xn+M9LFXk0SbQhnqILuTN7DGnr3sVK47y34=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3350.namprd12.prod.outlook.com (2603:10b6:a03:ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Tue, 20 Oct
 2020 01:57:22 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31%6]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 01:57:22 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] ARC changes for 5.10-rc1
Thread-Topic: [GIT PULL] ARC changes for 5.10-rc1
Thread-Index: AQHWpoRZixk2WDqDYEeW5nFZeTt7TA==
Date: Tue, 20 Oct 2020 01:57:21 +0000
Message-ID: <bbd3efb4-39d2-1d2f-b4c5-0f68dd6f481f@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32db04ac-b990-4478-e8c6-08d8749b7bf4
x-ms-traffictypediagnostic: BYAPR12MB3350:
x-microsoft-antispam-prvs: <BYAPR12MB3350BA6961CA2322AE11FD78B61F0@BYAPR12MB3350.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pWkCpTdnGSocVjtpV/MfOd/A1O9WW4EGj/t+W3Yf96NvrVFC+eyofHAjHAebNm7TdWTXeBonlKw9QkI4juHKkLz74RVcjTF+kFb7AZyjZbZVcTtNew8z3sInibO97c39kGRirrOXcjqQDRBiLt1boXuAu1PazumJqqCqR4ii4VNlaEmYjaHsMgdM/i7cRpeBiUjRV45U1XvXUFzeLiWtSin6NLdSIXrnRtf4vXpSXfTec8sa2K+f2odfkRUyzLeFm/sX6ztXQBCPs0/QfaBno644ddtjeN3x/IjDroLhk6IKk/qGKzpWGjz79tNSj6OTQRmbfaVgZuVZAySGKBDhZE0WExDD4xdnINYC6MRK1h1lry3UhU+xtG7fvBnbXFLo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(54906003)(316002)(2906002)(2616005)(36756003)(4326008)(66556008)(6916009)(66946007)(64756008)(31696002)(66476007)(76116006)(66446008)(8936002)(6486002)(8676002)(86362001)(7416002)(26005)(6506007)(186003)(71200400001)(83380400001)(5660300002)(31686004)(6512007)(478600001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: KsupqFw0Ti1X/k86mQs6D6XwacKa/tyBW4TuwPdIbVPlhRncXvN+yV6BxCjQAQ1XwWML/hyQsy2xhgK0+SXDEm3iwfWFYTYzm+sMIOICK5TFQ5INAY07MZeQZOSr6S5HqGPnP4YV4wBSgoDpXmXLPLa86FRwDzV88N8xQ1U/MvxOSfvsawon7+dpIorAModEezTiPHFpGam+8UGMbx0gRq068dtBVrfUiKkBGvO6SieZj7IYu1b3GvhxwTulSHVKRX+1SWbBAHXasnQSIsJt42hdaCd1GG3F8Y8MxppDd1MhcadjG8G/RcIdUB4EsWWsyzw1+VOQEccSV09EDmxjX/+f+m47bLUGlSJ9kxpKmKmO2Wd7+SaDfLbwqqrtWLXTHYvVwDaXjjQ7xY839QzAdUx6y7vxi0gerqz4uwaRCoofyIPhsrsWVI2V8HVuwoW0Y+s5YqWEvVk5c3o7nmaU+zK2XCbavor9Schx6+HL8C/3/jxCilDjXruPlCwPDUEHU326QV/T/XkGzN31P4ssxF9V6MjUMJ1N4v2SKWAjqHmana87MMf3tlMmrKRUnQWRXPv/xqmUfjY1SzurDN8OnwmrFKzlWpjaHHXRV1UxTH8LkvL0EgKqKVwaOu9TxMfiHvn0iJp5CQJTOyt7Bo4y7g==
x-ms-exchange-transport-forked: True
Content-ID: <627C7372E621EE4DA4DE4E60B4A00D22@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32db04ac-b990-4478-e8c6-08d8749b7bf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2020 01:57:21.9007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GNqos6a1L4qhpcsbV2Sohu37LhFwTPaZubg+mgiNe/XSuRp3KDXMIS/G1DpBy8BCH71jxEdciVLbb4cY474+iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_215733_114653_EBAC560D 
X-CRM114-Status: GOOD (  16.70  )
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
Cc: "Ofer Levi\(SW\)" <oferle@nvidia.com>, Noam Camus <noamikong@gmail.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Gilad Ben-Yossef <gilad@benyossef.com>, Zhen Lei <thunder.leizhen@huawei.com>,
 arcml <linux-snps-arc@lists.infradead.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Linus,

The bulk of ARC pull request is removal of EZChip NPS platform which was suffering
from constant bitrot. In recent years EZChip has gone though multiple successive
acquisitions and I guess things and people move on. I would like to take this
opportunity to recognize and thank all those good folks (Gilad, Noam, Ofer...) for
contributing major bits to ARC port (SMP, Big Endian)

Please pull.

Thx,
-Vineet
----------------->
The following changes since commit 549738f15da0e5a00275977623be199fbbf7df50:

  Linux 5.9-rc8 (2020-10-04 16:04:34 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.10-rc1

for you to fetch changes up to 6364d1b41cc382db3b03cf33c57b6007ee8f09cf:

  arc: include/asm: fix typos of "themselves" (2020-10-05 21:02:29 -0700)

----------------------------------------------------------------
ARC changes for 5.10

 - Drop support for EZChip NPS platform

 - miscll other fixes

----------------------------------------------------------------
Mike Rapoport (1):
      ARC: SMP: fix typo and use "come up" instead of "comeup"

Necip Fazil Yildiran (1):
      arc: plat-hsdk: fix kconfig dependency warning when !RESET_CONTROLLER

Randy Dunlap (1):
      arc: include/asm: fix typos of "themselves"

Vineet Gupta (1):
      ARC: [plat-eznps]: Drop support for EZChip NPS platform

Zhen Lei (1):
      ARC: [dts] fix the errors detected by dtbs_check

 MAINTAINERS                             |   7 --
 arch/arc/Kconfig                        |   2 -
 arch/arc/Makefile                       |   5 -
 arch/arc/boot/dts/axc001.dtsi           |   2 +-
 arch/arc/boot/dts/axc003.dtsi           |   2 +-
 arch/arc/boot/dts/axc003_idu.dtsi       |   2 +-
 arch/arc/boot/dts/eznps.dts             |  84 -------------
 arch/arc/boot/dts/vdk_axc003.dtsi       |   2 +-
 arch/arc/boot/dts/vdk_axc003_idu.dtsi   |   2 +-
 arch/arc/configs/nps_defconfig          |  80 ------------
 arch/arc/include/asm/atomic.h           | 108 +----------------
 arch/arc/include/asm/barrier.h          |   9 +-
 arch/arc/include/asm/bitops.h           |  58 +--------
 arch/arc/include/asm/cmpxchg.h          |  72 +----------
 arch/arc/include/asm/entry-compact.h    |  27 -----
 arch/arc/include/asm/processor.h        |  37 ------
 arch/arc/include/asm/ptrace.h           |   5 -
 arch/arc/include/asm/setup.h            |   4 -
 arch/arc/include/asm/spinlock.h         |   6 -
 arch/arc/include/asm/switch_to.h        |   9 --
 arch/arc/kernel/ctx_sw.c                |  13 --
 arch/arc/kernel/devtree.c               |   2 -
 arch/arc/kernel/process.c               |  15 ---
 arch/arc/kernel/smp.c                   |   2 +-
 arch/arc/mm/tlbex.S                     |   7 --
 arch/arc/plat-eznps/Kconfig             |  58 ---------
 arch/arc/plat-eznps/Makefile            |   8 --
 arch/arc/plat-eznps/ctop.c              |  21 ----
 arch/arc/plat-eznps/entry.S             |  60 ---------
 arch/arc/plat-eznps/include/plat/ctop.h | 208 --------------------------------
 arch/arc/plat-eznps/include/plat/mtm.h  |  49 --------
 arch/arc/plat-eznps/include/plat/smp.h  |  15 ---
 arch/arc/plat-eznps/mtm.c               | 166 -------------------------
 arch/arc/plat-eznps/platform.c          |  91 --------------
 arch/arc/plat-eznps/smp.c               | 138 ---------------------
 arch/arc/plat-hsdk/Kconfig              |   1 +
 36 files changed, 15 insertions(+), 1362 deletions(-)
 delete mode 100644 arch/arc/boot/dts/eznps.dts
 delete mode 100644 arch/arc/configs/nps_defconfig
 delete mode 100644 arch/arc/plat-eznps/Kconfig
 delete mode 100644 arch/arc/plat-eznps/Makefile
 delete mode 100644 arch/arc/plat-eznps/ctop.c
 delete mode 100644 arch/arc/plat-eznps/entry.S
 delete mode 100644 arch/arc/plat-eznps/include/plat/ctop.h
 delete mode 100644 arch/arc/plat-eznps/include/plat/mtm.h
 delete mode 100644 arch/arc/plat-eznps/include/plat/smp.h
 delete mode 100644 arch/arc/plat-eznps/mtm.c
 delete mode 100644 arch/arc/plat-eznps/platform.c
 delete mode 100644 arch/arc/plat-eznps/smp.c
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
