Return-Path: <SRS0=CnrP=BO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9B8C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  4 Aug 2020 06:13:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30A302076E
	for <linux-snps-arc@archiver.kernel.org>; Tue,  4 Aug 2020 06:13:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iDrPYc2g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="E60P2FAY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="uVAg2TNI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30A302076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rv2iFkLlLz2EZ8JysZD4U6VRvJ/8ygQ7XYTfCFyL07I=; b=iDrPYc2gSxZ/3buqnjicdhNsY
	81OGR7ms8YdlDfSkZBhhfbX1cVq9FRlhoAuC7c1ob8z7PRI2PNzE+RhjUEYW1AgFw7fmS/hlJEeP9
	kBjH2ImAqTpTBXXcYTQ3HqU7NSo5XU0Ib27o9vgsauaEvcH4QS+0fpE8exXXxT2858lsW14cWY+3r
	0XglJvi1RHhnepBuhlwX3IlO3wfXCe9DHFyXI8PX0smbEoGDOd05h1lTsnYu/bQvS2ygOwGul0QMy
	Ocxl5B+xIuMcC8Zyj785zlzLiE6QYeDkjfRjpktqJ/DNYbxn+r8POEvIFhW8HxTyhnM/yPP7zTYBs
	namED575A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2qCV-0007Ud-CF; Tue, 04 Aug 2020 06:13:27 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2qCS-0007U3-A3
 for linux-snps-arc@lists.infradead.org; Tue, 04 Aug 2020 06:13:25 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A645140181;
 Tue,  4 Aug 2020 06:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1596521601; bh=p1Q/hfsFeoNvwiFgjU05xwcaaMgXT4pFPRFUQMCfy2c=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=E60P2FAYBrIVEhhjygywfbvMglNHjN4OnRj1Z9xbHve+qt2Svj6pBX+9pYfKD4Ejf
 9XZp4SqE7eTR0sKyHG/ft9ISLz1wmoG2xsJ9F/kj8J9QQX8qXbpA++AxOJPj7tLFeI
 Z+Jgj9JBewtnenVCTiaLZQeEhsfkswDu06vz7lRGv29evdr3ISkYZWrc9w2EZ8aOc2
 6cpw6vFT+boW77S9Ezg1qWQa//dV5TLVlqlIHidJP/MB3SJh/CyQ745YV98HEZKRtb
 xJ+pOmtM35hcSJ9RCkFcPtPVxb8cNKPacjnS/vcxk3ta5PxpVIX7Cb5bnl9T+q7Tcz
 Cztut/53R91nQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 553E3A0067;
 Tue,  4 Aug 2020 06:13:17 +0000 (UTC)
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2051.outbound.protection.outlook.com [104.47.37.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7BE534014D;
 Tue,  4 Aug 2020 06:13:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="uVAg2TNI";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aapP51Bxt0mQSlI1CDMJW005e2LXwb4gW18w3APhOWgui7phA86njR6FAq4oTbRWqg1qNyPypB+0o3J/rTYMWn7CPhAx/pxProkXctkH70I3FmYn/lu2eSEVaPGksmYkmWBgsbef092HSSpRTKLxMcs5z2gMnVa0XMnJ30f6GL+nm4mpJUHTvnPEBl3i6cTybhJm/rrMKXCQFdG70Ad2YO+121Lna22Y0FGmb6/YKPmTshPH/5wcKQ0fwRlbkbnn6UuHfHQIGx6xcEGNb7N8VFr7YgBIPZZ+/Qdb8r5nWW+V+cLfZgjBNsP9ZhcMYBPPgQjXNEIZ8F1VHQz0828FYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1Q/hfsFeoNvwiFgjU05xwcaaMgXT4pFPRFUQMCfy2c=;
 b=mS/DjrWTN7Rae//cCmBsPHV2nAQ28IF/sS1RGbPDQEltcZWCI+EWl2K26AoQ65xY8vu5GluPEKlma1dr75hOYJ6wVE0TuILyA4bQYgxHKSmU7sFZp93jcofs5mTFpP90vJCMzgDf84/pc3GAdGrJKoBlod5F/dJuKI19GfXbdXl1mLQDYjdJarvhVvkbVWghlmafxHqHiHiEjc1NttGhDDixaf/7BuXGvu8TZJAwc2XfHEBo7rKnAsIQxDYDcChcVdsdvI3xIMmLDSG41UU0GOZXQucFLDy22kCfFbA6cK89CiTEQg1O/exgEeVvRbJQ/mGM3m2MUUylRtHLlVl8Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1Q/hfsFeoNvwiFgjU05xwcaaMgXT4pFPRFUQMCfy2c=;
 b=uVAg2TNIRim2iNBHh/GnuOBWNfWg2OojJsVQx2ScAqVmxdK2gb6N3LNzzvYCn2i0L0qLWIPicCz6wxLmmeB9BI9Vs8fktTbaSSpdbd/0Zd+8nRKea/DjM5CaZ/fLdbNgHoApbJQnaX4Q63vdV27UIrpcVvVSOYeT03CniCV2TXI=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4178.namprd12.prod.outlook.com (2603:10b6:a03:20e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Tue, 4 Aug
 2020 06:13:13 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 06:13:13 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Waldemar Brodkorb <mail@waldemar-brodkorb.de>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: uClibc-ng broken on hsdk
Thread-Topic: uClibc-ng broken on hsdk
Thread-Index: AQHWagKWncElxxMOGkSmwL3JqVUj9qkneKQA
Date: Tue, 4 Aug 2020 06:13:13 +0000
Message-ID: <edf70a7d-b624-0db4-0604-6762e754fd95@synopsys.com>
References: <20200804015714.2dshdlc3wlal3a5s@waldemar-brodkorb.de>
In-Reply-To: <20200804015714.2dshdlc3wlal3a5s@waldemar-brodkorb.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: waldemar-brodkorb.de; dkim=none (message not signed)
 header.d=none;waldemar-brodkorb.de; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75a38565-f5bb-4f76-4fdf-08d8383d7865
x-ms-traffictypediagnostic: BY5PR12MB4178:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB41781B4BB073249EF105C718B64A0@BY5PR12MB4178.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:281;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vrneuEIvq/HPHxBpQ/wWjHRZhZ8WnNqsmXwD+8eZJi19mFYwG+k8FbkCmkIb12n+/bOFizeqKsn0jyaKIJTLjIK4EJiMQVgYnWhapFaw7auUZ7LTD7qne8TsfKEqfjh6cJDU1PFmAWoJ8oZTVDMKxT7su0ogqBVcBnVh6dSLiRuSwNInTmgNxEI1jgrxQEvuURNuRLr9r3Yg3joX4bQ9Ahqvh6tPsUeYNUKeIVxcaI36uaPmMn5zUa3j+enDDc8M9AA8gnbw0K0qYJNjdvQAc98HE1G/XUROw0cHF7CuOxboB4O1KmN6FzdyYyEtYLO8VbFkyEzhRlZRavYTP6SqbPNZKYwua4JqphcARgVgdZYJVjRFgl22pAiSS7GmGySR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(39860400002)(136003)(346002)(366004)(396003)(316002)(36756003)(8676002)(2616005)(6636002)(54906003)(110136005)(4326008)(66946007)(5660300002)(6486002)(31686004)(186003)(6512007)(6506007)(53546011)(478600001)(8936002)(76116006)(71200400001)(2906002)(86362001)(3480700007)(64756008)(31696002)(66556008)(66446008)(66476007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: rCyzcr6qGuPPQ2aYwLMgm469Bdx6uUBpt5BGecyBqZDKX6OfCa0ozzXi+j7uFS01H1HrKeT0oHhpFn64tzOFZyfwUSzRRMt3Gv2sl153eLd4LHxNce7bGDLHxcRPIa5axZV8C/29Z8CWcYXVM2Anuehpsufec0FdnYKTIGqHFkSWFfOBokkEl2MurMgHhdSu86qwl0KyXweXk9FCCXbzJGdyEBhMnBcHwE14y+NNFslWkz7aXS/dlQBbt8flgVwu4/3ZDCclBkhKysOxebujpGsHqSKvD7uPzRXceK8zl0WyRmgLPPcopi/5yrxjkt+jVW1Qi6fBHZv4GSn65kmqL/4eLvBY9XBsZwjJYcoO7JxSPIlORBEIanztgkBKwYnQRumczeJURCCdsmX2CFkhJdxqCePtFA644IBWoVUZ+Ro/YyTPbFKXSluems2S1j+AvwNDOVaelO/j3hpsw2aCs4CT8YiqSvyKNWLGLT6Qz9KCG44VjMqiKbUkFTnow78FAckQcsPESvsM9U3rwk4sKV14Gvo9n9+LpGxdRWEm1agEiwLhVddGuHLhZg2O7QaFZDt+aM4RzEXYAVcrIGjiiriWclW+LssstPc4Hxdp/Q6Kul/U+omjBPhPf3Mhlp6o5cHwtS3eCMAtmOBqoDb/e00/SXFUFa0//GH0eXBR/POgRDrbp7DJXC6Vec7gK7R+VhND8TgmD6/pkQo8CtB0aw==
Content-ID: <725D998775165442B5EDB72B6B1D84E6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a38565-f5bb-4f76-4fdf-08d8383d7865
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2020 06:13:13.5172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I/a594M/L1aIWmksIoZliANOPXvafgWkfduWiR8pRfIf6y+a29uWxxP7E4gfxeCwLgXn6SrLKg+C96DBTvPaUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_021324_764236_957B6CA0 
X-CRM114-Status: GOOD (  17.89  )
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
Cc: "devel@uclibc-ng.org" <devel@uclibc-ng.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 8/3/20 6:57 PM, Waldemar Brodkorb wrote:
> Hi Alexey, Hi Vineet,
>
> is uClibc-ng 1.0.34 broken on Linux kernel 4.19.136?
> I am using gcc 9.3.0 and binutils 2.35.
>
> I get following stacktrace:
>
> [    9.667903] Starting Linux (built with OpenADK).
> [    9.673796] Freeing unused kernel memory: 592K
> [    9.678323] This architecture does not have kernel memory
> protection.
> [    9.684992] Run /sbin/init as init process
> [    9.693619] potentially unexpected fatal signal 11.
> [    9.698600] Path: /bin/busybox
> [    9.701967] CPU: 2 PID: 1 Comm: init Not tainted 4.19.136-1 #2
> [    9.707882] 
> [    9.707882] [ECR   ]: 0x00050200 => Invalid Write @ 0x00000000 by
> insn @ 0x2000181a
> [    9.717373] [EFA   ]: 0x00000000
> [    9.717373] [BLINK ]: 0x20001792
> [    9.717373] [ERET  ]: 0x2000181a
> [    9.727392]     @off 0x181a in [/lib/ld-uClibc-1.0.34.so]
> [    9.727392]     VMA: 0x20000000 to 0x20008000
> [    9.737355] [STAT32]: 0x80081082 : IE U     
> [    9.741969] BTA: 0x20001792   SP: 0x5f8bdb9c  FP: 0x5f8bdd2c
> [    9.747648] LPS: 0x00000010  LPE: 0x00000080 LPC: 0x00000000
> [    9.753784] r00: 0x20005b64  r01: 0x00000025 r02: 0xffffffff 
> [    9.753784] r03: 0x00000022  r04: 0x00000000 r05: 0x00000000 
> [    9.753784] r06: 0x00000000  r07: 0x00000000 r08: 0x000000de 
> [    9.753784] r09: 0x0000000c  r10: 0x00000001 r11: 0x00000000 
> [    9.753784] r12: 0x20001792  r13: 0x00000000 r14: 0x20005b64 
> [    9.753784] r15: 0x2000a070  r16: 0x5f8bddf8 r17: 0x5f8bdf2c 
> [    9.753784] r18: 0x2000a070  r19: 0x00000000 r20: 0x5f8bddf8 
> [    9.753784] r21: 0x00000000  r22: 0x00000000 r23: 0x00000000 
> [    9.753784] r24: 0x5f8bdc18  r25: 0x00000000 
> [    9.753784] 
> [    9.753784] 
> [    9.807098] Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b
> [    9.807098] 
>
> With kernel 5.4.53 it just hangs on this line here:
> [    2.579235] NET: Registered protocol family 1
>
> I am using initramfs with piggyback loaded from mmc card.

Can you please upload the initramfs: cpio/tar somewhere ?

>
> best regards
>  Waldemar

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
