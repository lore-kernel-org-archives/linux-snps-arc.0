Return-Path: <SRS0=Wyqd=AS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7550DC433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 06:19:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D04020739
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 06:19:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o4iOBAip";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hxB2BjMi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="D/Y6oxCT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D04020739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:To:
	From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZsSaE80QTI1N5i75cj7yQl54X2m94ZT1loNHVLS8ERs=; b=o4iOBAip27+6zBEKxE5yr+pIV+
	/51tpFlyF7CVV3XjV/4dLOCUAV5UimPhAyp9L483uEL08NAYWDKkonmxfTT6ODPAlrxquQGCsC2yM
	UZNuKOczOSzd29jIm8MSQ1sM7y92gbFV+7hclkQtttGfoXtG/90/R6F3mHMdmAGRZ5EJrxEnNDoac
	Kovre/AfTeLdD+RTgxQlAT9z6jv/R3J09PkxgPsazzcrnCs+MuaL0WCALbHRTa+KpxItYT0FGeL2C
	xW2HYXfmH2DgGr92UEA1ouwjD59XY3/LkbazzCiT3uulv0aNADpDS2BP1hvNFOQNx94E43j6QgjqV
	AH45rZiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsgwl-0001T4-Kw; Tue, 07 Jul 2020 06:19:15 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsgwj-0001Rz-6T
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jul 2020 06:19:14 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5498BC06E7;
 Tue,  7 Jul 2020 06:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594102745; bh=ZebGz6GftpERu/PvkwKEw0X/h4wvM+LAMepUQzJz4E8=;
 h=From:To:CC:Subject:Date:From;
 b=hxB2BjMiiRTIZTdHcni0lmwP/XhP14KqmBt56C1uk03SN8C91TDu710E71bkh016s
 a1+3cIzcIFnk+SvcaJJQQ0A02Z+HngrbGljru/a+lkMWkx68l1ko1DUIj+Z+xhO0mX
 Ab9yLziVByF50nJVbBSJSrtKYdPCTc96kDFyqalpxNoAFFv41BeLEw9M7WzL53VyF5
 Xm4Ack62Sa5H6yHAjCuyacf4M0Huk18s49TU8tV/iEnXvaZDocCYbdPa0uLN1CPnoj
 3Xsw6fuwlRu9WMglISNNQ270YU006Bk/xiK6NFYtiu1GoFs9mqpHRSrkVhy6uDr/C5
 NVwN4MmyI3HBQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id EF0BBA0096;
 Tue,  7 Jul 2020 06:19:02 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id ADDC281113;
 Tue,  7 Jul 2020 06:19:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="D/Y6oxCT";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELqKZy37Oo1zUxggGoIbiB7xi/aSGcQrpH03PlRLy219c1bh+hun73+9sdPwhK5mS503IGd9iE4zKAycGdCFXBvz0cn0fI06FaSrGD/6pW8paSW8SN3V3ocbjOlnoM7nIyPSLJ2pm26v0rm4GtBYvjSwkbJ+ZbCIBmlcnGUE5WAtzDfzgFxz5gJnNZj9DBHgbgUyfWl1kRJ8clvTFL4ELgegsHngO/YhlY37Rct9FWibf+MublRSgOFw7ft1mdXH4NZ5N+Jc72xpsm9CKu93IToxvcUb1xYHg4ta6NN58xWxRwHLs+tbODftM/gUQIAf/S+f5j6HdNCacEXkL88TMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZebGz6GftpERu/PvkwKEw0X/h4wvM+LAMepUQzJz4E8=;
 b=Ec+5ZKek+hTGKTg9Wy+xxH5tPiQcE6LVd8yGtxqhsy7Y3W7PI/lF2oGg4q2Unlwoce6b8iOmnFCiBrv8j+r8y0O59yMJI4Ce6VAbK0RlLgd/9youwz/uGXgWTCDG6HNpc1PVwjozjGD8+sKwqzIW9VsNboc+vI7O4ZAtlGTQ4cV4o2DyFgfrL7T0DXw8D7esuKeubJ8HaGD5Xkz0ezx6oR9TeG00EGtsY2MOGE7POGFkatG+SHtys4sZjgMFN73CrlTTG244muzRzYXRDYIlxQmTeudzSe0cYPvpgSnG5Lqor0Jy/OHrx5O+DqblP6ckArnOX4zhtq8MGY1t4cbujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZebGz6GftpERu/PvkwKEw0X/h4wvM+LAMepUQzJz4E8=;
 b=D/Y6oxCTHcIYeOeuhUoHGqjDJ6yKybrHOA8Tpo1voY18Di8JnUPk0AINfWPDmKmcBH8VfAE/FzxfRaNkHKEPzTb2hBjR6xX7TCcdYA1uTh2AwlJR8Osp7p9z4aOBS76HVXxgF3tUYXvfFLHmFpj/LVw7uWMoFZpFdTQtl0+PHw0=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2711.namprd12.prod.outlook.com (2603:10b6:a03:63::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.29; Tue, 7 Jul
 2020 06:18:57 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 06:18:57 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] ARC updates for 5.8-rc5
Thread-Topic: [GIT PULL] ARC updates for 5.8-rc5
Thread-Index: AQHWVCZ/k4RVpwcvkEWm69xGWcjetQ==
Date: Tue, 7 Jul 2020 06:18:57 +0000
Message-ID: <41052a3e-c51d-a0d8-06ea-af1e30fb097a@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32234454-a250-4c9f-97a0-08d8223da1ec
x-ms-traffictypediagnostic: BYAPR12MB2711:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB27112E3D1B10BF17EFC73276B6660@BYAPR12MB2711.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:422;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ccBsa58fh+nS3Epg7Ylk3WwrtuULQv7UzFUIE6rgGFomYhxb4SWDwz0hN/c3bnbNsj13L047W/IGY04O3+03mrd5T1aHtdu0gufKLutcs8sszvwUZomgKGK95KU1vBMAIL6NR/OjyUZ5iISVumu46efZMsAe9pxRxlM+0Im6jZ/03cteH3DNuQVXnaPd9GZ9s4mfEoRqNRD50/qp5ZbUufGVCMxpkTg00RUTgk5o1T61LHcCcrRC1k75l4mqwaVAcQiwupJVVdUV+LoRJ9eOk5cqu0mr1GgbgDL9Au1ZqoRVWISKRJ42K3bc6gdNYGLy2eEPVru0jVDRFFNbOZBmy8q7JPUwDnm0r0OTzZ9fjzY7fQtPtI0X4/Ck2gjELmJY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(346002)(136003)(366004)(396003)(376002)(4326008)(6512007)(83380400001)(54906003)(107886003)(31696002)(8936002)(2616005)(2906002)(316002)(6486002)(86362001)(8676002)(5660300002)(15650500001)(186003)(478600001)(76116006)(66446008)(6506007)(6916009)(71200400001)(66946007)(36756003)(64756008)(66476007)(66556008)(31686004)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Ses8fXS2Gak5sPSrK4Bpf4gM0u9vXDs8BkyUMQLdnH74d0xCzSLrywgdwhRfOR3Gn62cwd4NdPbOIKn3KNGSc00iDUBZPivA6IIMMVLD2fDqlyIZ1LvGNvm6HDc8yXQd1KaVm7nw7huuZ9unrzvcHQ3YFnvpTmJYEKPcmmqQ/hptqWMJVn6J8B9QrifoMshMFMVpzIV1EhV1XrhkHeMoR4OLvKp3vVYJFBs63OcaqIXQpGaSWUixqdBbTFo7YH9YptjO/HDgA11K9JoGuP1T+MZ+rZvho2p2zolJMlJ8VISBjW1esPv7oufVug9x/KCyw8gpIlvrma3E3aTSujh3C593EUbJZUV/KYjEilL43sIKGg8NSBbejM+8wVNcosZx7bt9AHuhpNh+bx0OYSKxScidOKbVa5d3/mLDKxhFiiodisuUc0dEi1HaU5vTtzzMHd3k9p/2D1buwcHLJ7MuyHp1jTSpQkfg7sx81ikdcQQDoNjo89SadqdaEGKerHtp2NArOXyv6X6a7YItptkCpXB8FsOeGiV/kpCP52q2UsXhkk4HJ0Twjie915XX0Z2S
Content-ID: <0F9C4726F4119E40BFB0FF61879CAFB2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32234454-a250-4c9f-97a0-08d8223da1ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 06:18:57.6632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6dkFkiQlZklRgMAoMwGBbCRRzH3iUrfnqvRmJtZIlDZlv/al1uhPjc64+f4Jv3ZsuGhfiRMdqZbuXmMAMrdlDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_021913_399272_454A385F 
X-CRM114-Status: GOOD (  11.92  )
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
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Linus,

Please pull ARC fixes/ for 5.8-rc5.

Thx,
-Vineet

---------------->
The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.8-rc5

for you to fetch changes up to 10011f7d95dea311c0f2a3ea6725b5a2e97015a8:

  ARCv2: support loop buffer (LPB) disabling (2020-06-18 13:07:24 -0700)

----------------------------------------------------------------
ARC updates for 5.8-rc5

 - User build systems to pass -mcpu

 - Fix potential EFA clobber in syscall handler

 - Fix ARCompact 2 levels of interrupts build

 - Detect newer HS CPU releases

 - miscll other fixes

----------------------------------------------------------------
Eugeniy Paltsev (2):
      ARC: build: allow users to specify -mcpu
      ARCv2: support loop buffer (LPB) disabling

Vineet Gupta (5):
      ARC: entry: fix potential EFA clobber when TIF_SYSCALL_TRACE
      ARC: [arcompact] fix bitrot with 2 levels of interrupt
      ARC: elf: use right ELF_ARCH
      ARCv2: boot log: detect newer/upconing HS3x/HS4x releases
      ARC: build: remove deprecated toggle for arc700 builds

 arch/arc/Kconfig                        | 15 +++++++++++++++
 arch/arc/Makefile                       | 21 +++++++++++++++++++--
 arch/arc/include/asm/elf.h              |  2 +-
 arch/arc/include/asm/irqflags-compact.h |  5 ++++-
 arch/arc/kernel/entry.S                 | 16 +++++-----------
 arch/arc/kernel/head.S                  |  8 ++++++++
 arch/arc/kernel/setup.c                 | 19 +++++++------------
 7 files changed, 59 insertions(+), 27 deletions(-)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
