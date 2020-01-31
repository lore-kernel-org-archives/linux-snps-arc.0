Return-Path: <SRS0=7v8Z=3U=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57537C35240
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Jan 2020 17:43:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D51C214D8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Jan 2020 17:43:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aCDFMKhD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KcK1n5J2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="RAXuaJBh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D51C214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dJ+Yeyp8xTCQrxd4VOuLLTYQ1g4t2j4R7t3I5rXc8RY=; b=aCDFMKhDLMuzqo
	rKxs0cj1jXzDltG1p8NWGm2RYufxVYGeDxykvWPSvjlJn2xViFCYj9Zdu2icg7j+lx+XG1OtSpAUc
	PlCVeZjIITVGoa3kbH0u2+V+oeyWoG8W0+Q/HZvmPozfwvyYxFHVBmcYBWPHo1Z+FzX3WvgpDsDe6
	r0Yp/GxqaIny4zQkrDh/bpVs0OSUTa3512pDRjknz6P3CjOdIwBIZiwOCOoGv3X/HPql6kkwhObbL
	aGYp3tbcZiitHLjkjqZkYMAiV0jiLSRaOISW6GJv+lFBSSs9M01smWhEuu5oZUBUK8riHCrS5oWtG
	rZUnXfDAFM0EvvBZcUQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixaKX-0006by-GW; Fri, 31 Jan 2020 17:43:45 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixaKU-0006bC-6J
 for linux-snps-arc@lists.infradead.org; Fri, 31 Jan 2020 17:43:43 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 690CD4016F;
 Fri, 31 Jan 2020 17:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1580492620; bh=gwnCkC6UIKg7aKPXXkhbjsWhGg2vQS0uZmtou7pJMyw=;
 h=From:To:CC:Subject:Date:From;
 b=KcK1n5J28aw0ld1THu85CbpZbOlDHVjDhzoMAwvkNZUgx+TicVbaHLftZG3ZQLtxa
 3QiYl09zI+F05whDJrsrgvQxyT1l6YRM6b1JSGIJr3KZh/ahnbrQwsBu1j6nUGpIQ3
 Eo3YCjTzTm8YKuTlrkWeJ87CpLZwje0QGgeOS1jJnToXnBHUtvx6MlZr3KmKvUsP1s
 UxgAocTkejWwrtWnjsrvFxS8pYfJYdRGWyfknwF2GztGtNK+IvsKhcyRMnPg+2xol1
 e73NHbTHAwdDTqKUu3UNlJ93yA6z2zsNWj6APcw0U3wsWiUPw/gl4EJ2F8a8XCLY/7
 n24UA5gSA2mqA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 96CF6A006A;
 Fri, 31 Jan 2020 17:43:36 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 31 Jan 2020 09:43:36 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 31 Jan 2020 09:43:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOBKK7yDgnMPU0hJEMw9FGB/pLo12n6uhoa7Ws8ddnCtL4NyJZiN8E62UXoslLajIPRigJDeJzXuBgepvmJDsScLBfb2SZ7vRIKRhWuUDsgTUakw1EHXhlC2IWuhcn+MhYNMzXe0BG3Mv9XwPCYoAu2VmG7ILOd6eU+XNtqM7aQift8uJlm2Q28163+dyneJWfaQTkEMLafEgoYflB7RVIxsP65Qxl/+zZQ8qG105YFY1pmYT3PigBU1/0VRYxWgiyxEEoyHewJOgWc0nbpEfgMDpr9AjVGZxhhjoV1yXK21oClwqrIxjbdu0mvyGespv8BVwWq6D5I23GjNvIzpHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwnCkC6UIKg7aKPXXkhbjsWhGg2vQS0uZmtou7pJMyw=;
 b=gsV/AG5ASjNUzTwVRz7DqMEG3tO+aXn8nnlcaji+x7NnvWq+nxYQWgaO7DCULyqSfGteT2MltgWLHeufy3xw6S6WslxlFDpTs42h7j2ZJUEuZYad4odu54B4aJlC4ywqvms2+BbvQd/FkejZvX4Uu6IC6CYpfR/3lKfT8QXffsSkCVUU7Ak82nXuvhzGaBYpCiDv8yr1AfZvuAN9TnGaYBcLi3PjdVqmgKOAMiDx0rScLys2dWQP/4WWocnNpLwbTAnO0kp5Kcqb/avNNn9X3H0g5/ln+iJujwxDkWf9eqY39WNCE0GYOnGU/sc2GOtoxxHHNIbz9Goa3jDwwOcMWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwnCkC6UIKg7aKPXXkhbjsWhGg2vQS0uZmtou7pJMyw=;
 b=RAXuaJBhD1vpn8+XTphl+u18tqgbwetPhdrmXTKcNTkUYEmOnzNAH7ROqQTbKaVW6m7B2EN85SOr1BV+b9+cGsjwFWu/3uj9a5Bwrt/fcWuDnQvOukcNnYRXBRJci3/iENbBK6bSXa4pqR/IDi0WPacRUDAALjb+oRsgRscgQzg=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3351.namprd12.prod.outlook.com (20.178.55.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27; Fri, 31 Jan 2020 17:43:34 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2686.028; Fri, 31 Jan 2020
 17:43:34 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] ARC updates for 5.6-rc1
Thread-Topic: [GIT PULL] ARC updates for 5.6-rc1
Thread-Index: AQHV2F319r1qssk6Q0CWl4GVb7FS5g==
Date: Fri, 31 Jan 2020 17:43:34 +0000
Message-ID: <d709d1dc-69e8-3fcd-f790-8699ca6a4e04@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 7bfd5c71-89e5-4205-8f1b-08d7a6751836
x-ms-traffictypediagnostic: BYAPR12MB3351:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3351A709790D1E6B1AB09C92B6070@BYAPR12MB3351.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-forefront-prvs: 029976C540
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(396003)(136003)(376002)(39860400002)(199004)(189003)(2616005)(6512007)(36756003)(2906002)(66446008)(64756008)(8936002)(66556008)(6916009)(15650500001)(8676002)(54906003)(66946007)(478600001)(316002)(6486002)(31696002)(76116006)(5660300002)(6506007)(71200400001)(4326008)(86362001)(81156014)(66476007)(81166006)(107886003)(26005)(31686004)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3351;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WcsTtrvL+9vHqCYMw68DNbBWFQ7+gA/9foNlmKHugzRTZ0N3c0rQhg+6QsEMkNdvyNC3qL/J4E1mhdeePSCaAPXOykuwxSqjSZGdC444JV/8cT8+ZgN0mDPgG6HfAxW9qFzzfjEUS2SCUdvK7geaV1HeQpRuAmOHqnrfRFasgy66f0OIzzRZsnkubVfjlFoGvxjVtCQsvfbeq1Vvveyw+R+LOBbH0o1a3yTzvKmEVL014PfhnQyQDQfY9LmJW1Stwl3I2/wam1gsJuU8JfLQJKR5vINYFiTDBaupI2cstvnw4Eg2QO79a8avHmDbvCHhxVRtTsh9eq2x9HRFtaBu/ajC+NQKEzJcWBeBFOEMnBlLRVGDo+r0IrPLx9Af/MFbLVVU/5BdDY+slCH/fjBgy7znCHPQC25kz2YAfGMfAOz4b/wpx5R6oSW5fDThuliy
x-ms-exchange-antispam-messagedata: 3mw2ipqt6LKmlP1Tx85YBnm/v+yyufDAq9OpjVE9BaVL62UV5pG5Bjji3nzqg8zGg4td5KV66jkV1v/8WSXroH1b4ORd6XrJ1QGs+oXaN3LXIo/GZpfEQqdjxz70hkr6rmfR1VTcxmJ6DW8w6NJ64A==
Content-ID: <E84A4BD252191E4FB80819C52C3C051D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfd5c71-89e5-4205-8f1b-08d7a6751836
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2020 17:43:34.3358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YXGWbrLIewExNQd97cS2zu+3Dzg0w8nRfAaCXzt665a51dFd/pf/qQqphGtQ+WpdQ8IbWaL3j9dKxJGzYWltYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3351
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200131_094342_387571_697CFBC1 
X-CRM114-Status: GOOD (  13.70  )
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Linus,

Please pull ARC updates for 5.6-rc1

Thx,
-Vineet
------------------------>
The following changes since commit b3a987b0264d3ddbb24293ebff10eddfc472f653:

  Linux 5.5-rc6 (2020-01-12 16:55:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.6-rc1

for you to fetch changes up to f45ba2bd6da0dc8000aa7ea7a3858fb51608f766:

  ARCv2: fpu: preserve userspace fpu state (2020-01-17 16:53:44 -0800)

----------------------------------------------------------------
ARC updates for 5.6-rc1

 - Wiring up clone3 syscall

 - ARCv2 FPU state save/restore across context switch

 - AXS10x platform and miscll fixes

----------------------------------------------------------------
Jose Abreu (1):
      ARC: [plat-axs10x]: Add missing multicast filter number to GMAC node

Vineet Gupta (4):
      ARC: update feature support for jump-labels
      ARC: wireup clone3 syscall
      ARC: fpu: declutter code, move bits out into fpu.h
      ARCv2: fpu: preserve userspace fpu state

 .../features/core/jump-labels/arch-support.txt     |  2 +-
 arch/arc/Kconfig                                   | 16 +++----
 arch/arc/boot/dts/axs10x_mb.dtsi                   |  1 +
 arch/arc/include/asm/arcregs.h                     |  2 +
 arch/arc/include/asm/fpu.h                         | 55 ++++++++++++++++++++++
 arch/arc/include/asm/processor.h                   | 10 +---
 arch/arc/include/asm/switch_to.h                   | 17 +------
 arch/arc/include/asm/syscalls.h                    |  1 +
 arch/arc/include/uapi/asm/unistd.h                 |  1 +
 arch/arc/kernel/Makefile                           |  2 +
 arch/arc/kernel/entry.S                            | 12 +++++
 arch/arc/kernel/fpu.c                              | 29 +++++++++++-
 arch/arc/kernel/process.c                          | 13 +++--
 arch/arc/kernel/sys.c                              |  1 +
 14 files changed, 121 insertions(+), 41 deletions(-)
 create mode 100644 arch/arc/include/asm/fpu.h
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
