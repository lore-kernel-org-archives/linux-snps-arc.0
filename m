Return-Path: <SRS0=8xpS=CO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D055C433E2
	for <linux-snps-arc@archiver.kernel.org>; Sat,  5 Sep 2020 01:09:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81D2E20578
	for <linux-snps-arc@archiver.kernel.org>; Sat,  5 Sep 2020 01:09:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FF9KFUY1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VGsWHbYl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XMP0j6Y/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81D2E20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:To:
	From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vm5m+gZu1DMiMFVug5KIYAyLRklSclmx1ta+1d8Enjw=; b=FF9KFUY18/rVQ6FeJwDoUhrLUJ
	tCHmG5bMbsxaXRcvtGetfbRhqQAYO9jydwL91NP4Mh7ukm0lv42VmJx+fTq1baHZNLYBOP40sSZ3X
	jY/TAujOEijxFf/6yYQkwp3ErTe5T2jsR5trcwdF2XsAvzQihW+GLXJJ4MphOXgxHIAcFTu2RiG25
	Cdo77xFv1Ysuzdyv+IiLwnGrjjxrPT5K3hDmUW/kLBnAR2QWjCzh5PPQ53VaGJymAxYfWnc02mGre
	lAHaTDr6mXtLt2+GwmKI2AKPznjHAe0nKIp3PpE/dQzLL4cDjVJ4hoWAx+fDVtCk8Ieq+eK7X6bd/
	ko+SzMtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEMhd-0004nf-H8; Sat, 05 Sep 2020 01:09:13 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEMhZ-0004mk-V5
 for linux-snps-arc@lists.infradead.org; Sat, 05 Sep 2020 01:09:11 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 25ADC407CE;
 Sat,  5 Sep 2020 01:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1599268146; bh=tAhiQLjKbj7leVrjYmKWpjwcsxMlPjE+ajKcF4f4qyo=;
 h=From:To:CC:Subject:Date:From;
 b=VGsWHbYl/tFUvaVa953ycQiUAPf1n67jNPtxZOx4jsYZX6+zI5OO7KXKe2NT6FWpl
 J0JT5dJFh0PmpKblqLaq8ziikzVsLym1fovP0tUvfnCRY1Zk2jjluglwBimo6+6FgS
 MXO4VU8+WvosYz0TXS991FXFs6aSmMdZQb4AFHoBU6A2zHnFY6OYWbCtDz5+0Anf6T
 wH7zRKSbj+3x1bQT631yySHbDq8uQ604uCBjHKEdXsb67/Xn3VdwWbzfAiKqBjbRt7
 wZqXyeGmBRbPJ5rTGxQLFR8Yw/xVWga10bJ1vHrc5W6e50vtQpbr2O0vi/LZ37Yzaz
 DHUWGo/6nvuRQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A40ACA006E;
 Sat,  5 Sep 2020 01:09:03 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id E9E3A80F76;
 Sat,  5 Sep 2020 01:09:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="XMP0j6Y/";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1+gBWRWLECi6gpFf733ZW27pxL1y3ZaSXJq5HRxD6gaIY74SzZM1+bIs+GRFqUBe1fFNl2ePDuO5OvaLcQyTz7J7280AjQbBOTVFnrVTeeQj3++zCBm4AVZWllxAQS1XFpvtaOhj+cg/NwXJaWG4co7vScctQPpmhpLZXYxYenLeSlBbZt7nM1QOXNNzquQqz6Is6YnJLAMx/Gl+P775gYQyyV+1ku2EJGszLCQ6c7A1YxnDWSU9E4ZfLKzxzdH6GQgQwwYhuMTaFfSzQFMTDgWYiM+QiMr279MYvDd61aDMbDshqtOksvu5dP/DwqUCM7dUgnVJDpbp4n/Tr9Y6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAhiQLjKbj7leVrjYmKWpjwcsxMlPjE+ajKcF4f4qyo=;
 b=U8QEGm0M9xkkfJhtFAkHe/tFUguHHfEOP1EIo97ushFV9HKpGcUom/KJqZuFtqdK/F2NbR587ayX5yMAY1D5/4AGHSm+WZGmCvO+yBqRJS644v49jXZ95vcsB/k7B3wGg+TBTgq7IV1OZ18aOxia3txK5an0sg73yc8tg88KwI3MCzXWpFbynBsk+jFu7ZwEYstr0HIu2aLOkgAXF7WbxL2OzPw4dO3qq3wOvfYmg5C+6kmApyLCkOWEyYxtfJRW6zd6p7Ed+dHmOH/KZMA3Bu4m6RD6KdeVNxloKsbXvoKWqPOtheht6MNa0zfX9yxgM7Os9Lo1kUZSQscET3Sdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAhiQLjKbj7leVrjYmKWpjwcsxMlPjE+ajKcF4f4qyo=;
 b=XMP0j6Y/21poenub5jbqlM/M2H65DarzJ6s21d4t7Lp2NUrx19oL4YsDfA5D8LzO/FgXBLpEiMiQrm+3GxenofTS2hXPbj+z4DATB7F4uh8PL9+Hp/4avbD6wivhQtpNjGphkFy6mP21ipUWMgTw0U1f7z9kMYUodq/kRr/dhIA=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4178.namprd12.prod.outlook.com (2603:10b6:a03:20e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Sat, 5 Sep
 2020 01:08:56 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e%5]) with mapi id 15.20.3348.016; Sat, 5 Sep 2020
 01:08:56 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] ARC updates for 5.9-rc4
Thread-Topic: [GIT PULL] ARC updates for 5.9-rc4
Thread-Index: AQHWgyEgQk4ef6lCzUO46l9cpBqINA==
Date: Sat, 5 Sep 2020 01:08:56 +0000
Message-ID: <0724a4d3-7f69-040e-2a76-67ceefe9e745@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [107.3.145.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c710f20a-70f3-44ab-5609-08d85138437f
x-ms-traffictypediagnostic: BY5PR12MB4178:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB41786768A5B785E7AF5DEEAAB62A0@BY5PR12MB4178.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZnzHIpF+vmiXC5SjVkq+/j3cx2jMhBZCsfyCN86LpJagSkEC1TjaZ8dKgtb1XCDIT6AH0mVx5fGf+iKKrGKpC7lc8dDa1oVQaJxobDutYDX3mBWbkhZlb7IQ0DZ/S3hqFVVCYVRuYLgbwuO765Swx4fOVJw1KlpDP6Ea4BP45EaIXkheEuzQWe7tHM6OEvbXxOkKUEGvyB4A3IsxVCAoFlkjD4pYjhZo0N+cnL8XAqOLFzlJmPHTQa9J0iswB0b1zKyey7BgkyPvHBdXHTs2OeAP9Vi9mNn1XNu+8yasaohVcRAK8ApVrUyfAP8/3GqJvD9CHJbrb0Mu5Cfp3nMMbMWjmUQFz7eF0wRYvfXTelNKFdAMCh3dioOBX0jdqEHk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(376002)(346002)(366004)(39860400002)(71200400001)(4326008)(8676002)(66476007)(66946007)(66446008)(66556008)(64756008)(83380400001)(76116006)(6506007)(26005)(86362001)(107886003)(31696002)(15650500001)(5660300002)(8936002)(6486002)(54906003)(2906002)(36756003)(31686004)(316002)(186003)(6916009)(6512007)(2616005)(478600001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: OieM4mMO5K3wAQqmwquJEXYlo4WQHIKRs4yxXxGxQIxoXPbTgX9iNQuO1JiMOWUDCwNa+2L2Kff5n/MrDokfnXBYE3nTPpMzEDnudq0bIXhW+W7hDOu62YD4Q8TVjYdJspjIwpSsbclG9RIPFhFEwppq9udET5PEtvQ00jMEZp4EqmA7qRTP1NtziJR/99IwcpB3yN5JYt0MMd5Aa809S71Tbs2oMv57ad9EyBqcTRAa25NXLTP4vbMM3cndRASPk1NAfXL6y3Z/N/oxW1xfQql/kto6h8E77+fu0cuG/g+fOstNLjF5z2UmB4bCNLNoOtmS8E2zVINojvIPuwkXInRmodm6wCAR7makV9FbmsngW3PtpXQbScOaevkZW28YzUtwQJt+fQgPOFD0w+2NH0vKtOjUCMMCmV/SETJre1tPOh25Dxh4GHdYN2WK0pLW55BvhXW/OwVdFxUwn+ito/ic5MpwvyZ2Xi4ICCTiCzZlTTGh7KlZFDgqAYqJ9/hx6d6/JGELcX0SEZdf175D5ooCeZq/HlMkrnIzM7EhqfweYt7ccxHOOwAT0JGBgf6U5hHCOXRneBmpdx03CqPdwJ0KSRKRhQbDsFIdFxQcZtd0kgj/WCpVqw8DTR/8jLxLjc6hbXzrIWQaKMwDXhfzAA==
Content-ID: <E08F6F5C938D4146B369465926922C93@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c710f20a-70f3-44ab-5609-08d85138437f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2020 01:08:56.4222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5P92lZjEqjit3JJwNDc/Tucf3Jps2IY+J8qyANdiHx61l02EuY32Dug0j4iEiPzH39ajtPTFKiLYJljXM+McAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_210910_297942_9C968DA6 
X-CRM114-Status: GOOD (  12.67  )
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
Cc: Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Linus,

Please pull.

Thx,
-Vineet
------------------->
The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.9-rc4

for you to fetch changes up to 26907eb605fbc3ba9dbf888f21d9d8d04471271d:

  ARC: [plat-hsdk]: Switch ethernet phy-mode to rgmii-id (2020-09-01 11:59:04 -0700)

----------------------------------------------------------------
ARC fixes for 5.9-rc4

 - HSDK-4xd Dev system: perf driver updates for sampling interrupt

 - HSDK* Dev System : Ethernet broken	[Evgeniy Didin]

 - HIGHMEM broken (2 memory banks)	[Mike Rapoport]

 - show_regs() rewrite once and for all

 - Other minor fixes

----------------------------------------------------------------
Evgeniy Didin (1):
      ARC: [plat-hsdk]: Switch ethernet phy-mode to rgmii-id

Mike Rapoport (1):
      arc: fix memory initialization for systems with two memory banks

Randy Dunlap (1):
      ARC: pgalloc.h: delete a duplicated word + other fixes

Vineet Gupta (4):
      ARC: perf: don't bail setup if pct irq missing in device-tree
      ARC: HSDK: wireup perf irq
      ARC: show_regs: fix r12 printing and simplify
      irqchip/eznps: Fix build error for !ARC700 builds

 arch/arc/boot/dts/hsdk.dts              |  6 ++-
 arch/arc/include/asm/pgalloc.h          |  4 +-
 arch/arc/kernel/perf_event.c            | 14 ++----
 arch/arc/kernel/troubleshoot.c          | 77 +++++++++++++--------------------
 arch/arc/mm/init.c                      | 27 +++++++-----
 arch/arc/plat-eznps/include/plat/ctop.h |  1 -
 include/soc/nps/common.h                |  6 +++
 7 files changed, 62 insertions(+), 73 deletions(-)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
