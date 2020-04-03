Return-Path: <SRS0=TLQJ=5T=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09329C43331
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Apr 2020 21:57:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD7AA2076E
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Apr 2020 21:57:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iNSE0i78";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Wrbb1xnI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nslz07Cj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD7AA2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GJkKoXGzarDqUJGJ2YSmz1p591WBzKWgSScePWgcUmY=; b=iNSE0i78WDIGDa
	gkSsYOnmy7zFrc2K4mbAuYiyaab7102UjymWAm9l7I8Kiy6BkrM/76WdwN7+jBRBQwRcQuJaBQibs
	fyYKeK583RjkTcuScYzVnaQ+Mr3oOms+jsvC/SgncvGNRq3fzqTC9SiiiH4opcAvfQ6Up9r/s45gx
	ePUCsmnvFGsX/GQoslYH6qj+Moj88lvWNmP1xE14JPbqbMZ0vJhzb3uVu/CUKBTXVNGOdBdzXnM/r
	0itnA1dAqWCA9hqJxHtqikqoQC4Cy1WjL23IEuQkypgohcToKKV8vlJPdD+aeGwf0iXJyW2vN0Zyz
	D+Ivi51Mcyx/AAcTkVZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKUJs-0003tH-Bp; Fri, 03 Apr 2020 21:57:44 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKUJo-0003sL-Og
 for linux-snps-arc@lists.infradead.org; Fri, 03 Apr 2020 21:57:42 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 90C3640181;
 Fri,  3 Apr 2020 21:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585951058; bh=mZz5DMhdyWeVDDxbA3heHO79uySoR8Tx5QWQ87SyKXQ=;
 h=From:To:CC:Subject:Date:From;
 b=Wrbb1xnI7MzQJQdWG5L0PCRHHtIUVMOiirrdNch3HB5xex0yx6qGRYTkK6uYFToQ0
 R/0+m3aQHI2WCFVEEAczNF9PA0cF36tO9xNbUj/i6k0lHtNdwlem5nGqe2RPFUStG6
 T6boiwLDg5VtQQu4jRR7qEpVDmt+bOHnGTZ6/tAmV/r3B0hL6iEsTb5zdVMWhPHAxG
 dOZO+XiM0n4O5Jb4jh6wlId6BsUMvFD1zN82oOkkOi4/F5Drb8laayjg9GlDoGNNKi
 ESay4uVZZzvzLG1V4XHB2FS9i7M8B+zPP1+PCwXx2M/vuxIWEQd7WmFYvRCOt93q2f
 oxeeU4CUomeow==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B2F39A007F;
 Fri,  3 Apr 2020 21:57:35 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 3 Apr 2020 14:57:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 3 Apr 2020 14:57:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJAzdsDu4CiHgByYir3hnIq6U9Jn3OT2h4bNOuvaGuvVyHO2awgOpQjyvbM7yB2ySr+cnw6vTNffrIj6wn4GVu0fD+ZNqkqOXHVbbk2Ef2r1AWbyqGEQADrM7sVtXM5+lTbuKlQdEVFZy0WOoogxrZOSBqWqkwV5LMof/Zih/ffgXJEL9WhH200Bq9feyvA1kVgPDKyx/ZhE7wSkfcMpT0mEXxHWB3OyAL6rK0DLu+VleOpq5CWCMuBHdmCVlJROn+Tq8KDBFceZYfcv0yBwpcqAkYcryjNXwTAVuybLrQLfNi/yX0JpIMd0ukbY8Sfz/vvvDt+2iLD7JNmLSeonyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZz5DMhdyWeVDDxbA3heHO79uySoR8Tx5QWQ87SyKXQ=;
 b=kd+r4qv80JlYtMdCLcdlkbRHS+MiuhEZbwnwlEQ07RgueayIzWC+uzh8N04Z/6Xgn+19ikryoElpxEK57VWQEEKLOjBoXpk4fpGkT2WNBG0COLq7KB5IaR/beGYU4ZqE+gdmxDMRsiUhxW8Y1jcfhvfve2GmlejRTiakqEl6fsNLH+RD60wo02DtGCfWcUn72VRCuA8tUdHNDJ4j6JqVVbZQHXbK35NtXs47s4k0hmPJmSkn+4k+Ev6RUqgch1LY4hh+EWUudQG4pFf0SuQvZrDAxdyre2+UlASL6nyGoCOrhATI185kcb9/uvzjDn4uAFmmYw8a+CCHyAnLYBOrxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZz5DMhdyWeVDDxbA3heHO79uySoR8Tx5QWQ87SyKXQ=;
 b=nslz07CjFcct1qwC/I1VZ1hjO/m00gO3V+jjN2FNU/EQ0/y6Wq8qUIY2hmzZI+737VUv7LVGdLG9QKDQ0sCFxrtKcFhEgRhMhlO3SMGklA7A77/6kvHUOzCMphb+oltsbcBHK+bEZm04NyxVLbpi6iv38sgUXtU/czJU4ZpcFtg=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3576.namprd12.prod.outlook.com (2603:10b6:a03:d8::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Fri, 3 Apr
 2020 21:57:33 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Fri, 3 Apr 2020
 21:57:33 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] ARC updates for 5.7-rc1
Thread-Topic: [GIT PULL] ARC updates for 5.7-rc1
Thread-Index: AQHWCgLgHkpNzQFO/U+zax1BcaOPDQ==
Date: Fri, 3 Apr 2020 21:57:33 +0000
Message-ID: <5b7afdcd-48dc-dc90-d7c0-53559a3ca3b8@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 2203a204-afa8-4862-922d-08d7d81a0366
x-ms-traffictypediagnostic: BYAPR12MB3576:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB35766C9F4F6C3EFC7F52C96BB6C70@BYAPR12MB3576.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:568;
x-forefront-prvs: 0362BF9FDB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(396003)(346002)(366004)(39860400002)(136003)(31686004)(478600001)(107886003)(2906002)(186003)(4326008)(6512007)(6916009)(26005)(31696002)(15650500001)(81156014)(76116006)(66946007)(2616005)(86362001)(66476007)(36756003)(6486002)(8936002)(66556008)(8676002)(64756008)(6506007)(5660300002)(71200400001)(66446008)(81166006)(316002)(54906003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GztRLQ0mqlvqbLdIR78KlaKXiM87IOa6f3vpDFclZJKmRFDsxVjJ7use35kuMzWDoRGn0BxUxpIK4iTi0StpeU0wB2yPsibvAkmN4GccLQUur0jtMyC+dw9ZheTX8R+FAp4rVxlcpcLt6XbTUxs4iMxuHCWXUFdKxKgQAlXefYme+ejJvV/EFC/uL1a8t0Bq43/b400wi/MLOFdAnbeaSA/lc+r/mJ7u48ASXw332aydUSZGhDWDQlNR6LJnxQ7NqIOXVMj/XJLE4v+wrBpjAp55C/mvuv0tdaZ7R1kSQ1VvcmRBsyaRxhbGBWEnfOgAal1Cz1DJQ6px6M05NQl3CXC1nswCbNsl8eKm0cJREpaF/rzh/lWLZhxYVNgcbYA41e9FCPjEn2zDkgHU5WtCgzFk6AiRX0kBGX/bZN1JG6DitiJtp6ZmfQPz8Mkn8VVH
x-ms-exchange-antispam-messagedata: vKEz9XjD9ZIpbWifBPmmEIeQ/hD8rK2JaNmsz5mSVxrI1X0VfTAIxzCl614lUdio2BFRRPkOpKrVq3EzmaNkigmABjFLpkmsnNUzUIMvBIICEVutyl/NsCuYlHgy2QWOQWfg6RPGhtX/w/3L9DmlbQ==
Content-ID: <86A6FDD40B623648BE264499F9BF3F9A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2203a204-afa8-4862-922d-08d7d81a0366
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2020 21:57:33.2678 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: de57jJfrExG4ppybhKo450p7DWVDPIth18IdijN4QBz6wMimHecltXzxLF84d51O9CdvOF5hNBUBnyh9uvaX6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3576
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_145740_871687_4848372C 
X-CRM114-Status: GOOD (  13.97  )
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

Please pull.

Thx,
-Vineet
------------------>
The following changes since commit fb33c6510d5595144d585aa194d377cf74d31911:

  Linux 5.6-rc6 (2020-03-15 15:01:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.7-rc1

for you to fetch changes up to f09d3174f002ee2cf15623d5a0f68f7393536ce7:

  ARC: allow userspace DSP applications to use AGU extensions (2020-03-16 10:30:49
-0700)

----------------------------------------------------------------
ARC updates for 5.7-rc1

 - Support for DSP enabled userspace (save/restore regs)

 - Miscll other platform fixes

----------------------------------------------------------------
Eugeniy Paltsev (5):
      ARC: [plat-axs10x]: PGU: remove unused encoder-slave property
      ARC: add helpers to sanitize config options
      ARC: handle DSP presence in HW
      ARC: add support for DSP-enabled userspace applications
      ARC: allow userspace DSP applications to use AGU extensions

 arch/arc/Kconfig                   |  50 ++++++++++++-
 arch/arc/boot/dts/axs10x_mb.dtsi   |   1 -
 arch/arc/include/asm/arcregs.h     |  26 +++++++
 arch/arc/include/asm/asserts.h     |  34 +++++++++
 arch/arc/include/asm/dsp-impl.h    | 150 +++++++++++++++++++++++++++++++++++++
 arch/arc/include/asm/dsp.h         |  29 +++++++
 arch/arc/include/asm/entry-arcv2.h |   6 ++
 arch/arc/include/asm/processor.h   |   4 +
 arch/arc/include/asm/ptrace.h      |   3 +
 arch/arc/include/asm/switch_to.h   |   2 +
 arch/arc/kernel/asm-offsets.c      |   4 +
 arch/arc/kernel/head.S             |   4 +
 arch/arc/kernel/setup.c            |  34 +++++----
 13 files changed, 332 insertions(+), 15 deletions(-)
 create mode 100644 arch/arc/include/asm/asserts.h
 create mode 100644 arch/arc/include/asm/dsp-impl.h
 create mode 100644 arch/arc/include/asm/dsp.h
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
