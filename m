Return-Path: <SRS0=CVFw=5R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFB1C43331
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Apr 2020 21:38:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D578920719
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Apr 2020 21:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BPgu42/U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="csqP51st";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="do3NGXKt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D578920719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HuXtRXgnc8Gmg664mMF//7ORJfVC6oVJOTm2oQFmq4I=; b=BPgu42/UWnaZmV
	zhmrNd4HliW6CGcnA9/7cXY+jSuS35uZMFhe8/gM6Rzl0eI6U7VfVhPI5+kbOrPF28Qvol5fUCflS
	2dv2nlx0IShK6/ogS/y2zGf6gXLWniWXgkbUeFByKXVNXHepBOirtG2USu1Yuuvf2xExVVfvI32Hm
	DYtSzTBBx5pPaFFW94hanBwQjCRzo9X+HQGruGGQv6AKrj7yIejuCBLD0Kc/WcZ+JgId7SXFQPdJG
	E6B4hD7vi3Iiuh26IbqGO/vq8yFkCtLSgYd/Yn2OJQFgWS+27nPYtQgJZALHj+znYzqlqzkAtZvML
	G8cSVelkAFH+AFjRoT0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJl4V-0004aj-I9; Wed, 01 Apr 2020 21:38:51 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJl4T-0004a6-61
 for linux-snps-arc@lists.infradead.org; Wed, 01 Apr 2020 21:38:50 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4BFB6C0FFD;
 Wed,  1 Apr 2020 21:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585777125; bh=NQz/5pyT25UMvs8TCYCexs7QTbdTCtd8likmV+Nul3U=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=csqP51stB3s2MlG6HWyBM2a/N+sgNCEkQICwq0s6Igeq4IbLBeRx5vDjAg6w6jynk
 6/7/a7sU84JLIl148HJ0mdEKOe+vnZLaN11msClIRpVzFnvO1r+dlbqk6bGXG4xdnt
 TnF2kPai+hNHV69aphwuBfyMYUzwXYLGwIVmPK5C2PSpotYQ0p66gf0HRkSKGk1T8o
 /RvhFnxDyeNTbsKpjcSO+SvBPFIrI7rt/SH6aUEumr9m04HJVQRS0FKftfBpa/faij
 gFbsxHQpF19qgv8pCQSD0yeE5NQrIiDs3WVdNUCFjFR9cabyInyQVrS+WhdtS9tzYV
 UL6enVm3HqEZw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C73ABA006C;
 Wed,  1 Apr 2020 21:38:37 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 1 Apr 2020 14:38:37 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 1 Apr 2020 14:38:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARaT06HL0ybZkM3Sna53rO07imwd5q7ieK+hlkvVzGvmUi7FdnHBq5HyVG9GJqGhiBQRIjmjiCgyE8kvNWLQ+vEXCflYISq75zQTq+tI9dx6qV/beKJgzlPC5Yc4wbjUHQoNz2+T5JA2UkMp2nsCfgYRb0dDJxszqb+0wWHZFAJSSnCvX71YOoXCJWGa4ngyDTU2X/F0006LKiLZ7XChtvX0DuOpA/zhMpvMycdR/G4gX1Zlfg5Sf2lavws9r5n3XNaTTQWN4DObRVEhxQUkUCwLDTHuZToVI6w9hO2kYEk1GLAI3YnomMmlDiNK0TcGwUjGgH4+RO1sDbYR1Tgupw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQz/5pyT25UMvs8TCYCexs7QTbdTCtd8likmV+Nul3U=;
 b=iAq2IBLStyWi9bPcPfvUUJPYiOLmNCe6pDx3d1hl82ow4upzbe/AGi4FRyFpTP0weAJ41inb0fejfN3TOlElRJvvHEUnHUHuQOLyWDQJhvP76SgGUYpmqK5ywMA5NmTEWU7yheOjw85qcjogteWoeggX2UYtczGzWpbHL8JK2oG6Dg8mYwVoCqpZzigcVpmDfiNSB0ffB+EDxNy/IyWIo6JOfl4xEMKyMw6NvnEnQESWZzMb2W4cO91a1DDtC/ws+uNRV9WV1Ntyo/aOUWPFTrredE/JjSs373fvGJjnf+eW9lubADKR9KtKLfP9kszJmox9aK8sqp4ZdiA8rgZrfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQz/5pyT25UMvs8TCYCexs7QTbdTCtd8likmV+Nul3U=;
 b=do3NGXKtoHdODV1ox+n4PVecyPsbjAqzH6znAflVZKnWzarwbs/W7Sm6084ekSUJHTlVbbgDdCte+c9zMbR9MT63xshYW2Tq2l1IlzoQEyQ+g9qnBEv+EYYd05kwsdAZfafvtbCST64A2+N+BKnGtVrgnHZ142Zx5fWrWNseoJc=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2632.namprd12.prod.outlook.com (2603:10b6:a03:6c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Wed, 1 Apr
 2020 21:38:35 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 21:38:35 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: __syscall_error (was Re: [PATCH v4 13/15] ARC: Build
 Infrastructure)
Thread-Topic: __syscall_error (was Re: [PATCH v4 13/15] ARC: Build
 Infrastructure)
Thread-Index: AQHWB76r442emsqWgUWhjf9688nTzahj52GWgADk6wA=
Date: Wed, 1 Apr 2020 21:38:35 +0000
Message-ID: <d96bf3d3-5cf0-e68e-c1f3-3ceb5286fb9d@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-14-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003272238480.5132@digraph.polyomino.org.uk>
 <86b7b480-da30-3eb4-3e1d-1d8785604770@synopsys.com>
 <57eeeac6-75d2-05c9-f1fe-bb642329ca77@synopsys.com>
 <alpine.DEB.2.21.2003312246280.30236@digraph.polyomino.org.uk>
 <3b5edadd-b29d-f138-c440-ed6d38da6a67@synopsys.com>
 <874ku3zlg3.fsf@igel.home>
In-Reply-To: <874ku3zlg3.fsf@igel.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:2878:237:6628:fcbe]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09147ada-011e-449b-2c6a-08d7d6850832
x-ms-traffictypediagnostic: BYAPR12MB2632:
x-microsoft-antispam-prvs: <BYAPR12MB2632AD69AE33396B5943BD1DB6C90@BYAPR12MB2632.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(376002)(39860400002)(396003)(136003)(346002)(6916009)(186003)(64756008)(8676002)(66946007)(66446008)(8936002)(86362001)(2616005)(31686004)(81166006)(6486002)(66556008)(5660300002)(66476007)(31696002)(4744005)(71200400001)(6506007)(81156014)(36756003)(6512007)(478600001)(4326008)(316002)(53546011)(76116006)(2906002)(54906003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: An5jFbQSYzhK/dPSvGgPfAdbI1hRbmDlysiuG2gd8wDdGIrIHABOzZjLMp33mT7Az+xjUdya5oC0I4X3sXqkYpzAMiJFCAQu9psSHDfu0K83xUIwElvE/c9eME0WbkhtQw7cVGrP6QA1cFJMrF2C13GVnedL/cheOhkOc7gnTwTFFlAJbjh9SibRVCNMTGgr9FVe9mRGk1ILrTB1y1qOhdijls4MEptheKdHELn/2dFKRlUpNndl8Zh/3DiOdvoyNFwQohKpMFmGQHk/X/Ikly2D57+j1rWVmDIlkngHo+YjfVfvE4gk9tJmAGIV4/tF4hFzWiR1sjvNQr7sL6Me6LwX65ecAMaJQ3ivGY0TS3YOGqIAGp3vyGtd5aMfSDVf/2u+Hf2Ci8BScJcS1AGgMwsXOXXspIVIuE6FbZXIdl3hAP7peDKOlY37Uxu/K6Sb
x-ms-exchange-antispam-messagedata: 9unyPkcsYK+kj1hP6DTFqv/B4w/2P9Ogaidf17m6clgP98BNhfBNvpv8275v9mze09c0Pozsy2Xvl0a1YM+kX8upzy8p2rKeqjxDu3MjbzMZ7L3G9NBhfEe/IXGhNoKkpcKOK1EPBbNeU9b+nOANnL2hmRF3qfyij/SkDwYvw47FD4fEWfOsDH5c+8yPN0dvZs4oRIhJjsE6Bpgn8QitBQ==
x-ms-exchange-transport-forked: True
Content-ID: <E1D55C105877AF4CBE0DBFFA8CAA2B84@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 09147ada-011e-449b-2c6a-08d7d6850832
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 21:38:35.1525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SfVzJ8bEwUTTUI2wVtwaC/SgnvJ4en49uc0JUaxfQ9MqzSRTOH96W942NCyA8thQ/VpjBdzw5k+bL28dFwVSlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2632
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_143849_349928_CBE918D4 
X-CRM114-Status: GOOD (  11.18  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha @ sourceware . org" <libc-alpha@sourceware.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 4/1/20 12:58 AM, Andreas Schwab wrote:
> On Apr 01 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> Looking as RISCV code, they opencode __syscall_error for !IS_IN (libc) which I was
>> hoping to avoid.
> 
> But that is the right way to do it.  The syscall error handler must be
> local to the library, it cannot afford to go through the PLT to call a
> function in a different library here.

Still, It needs to fetch (and runtime prepare) the GOT entry anyways.

The real point however is having the call avoids having to know/write asm code
with the errno codegen ABI for TLS model etc

Well its no big deal either way, not these days anyways (Given the ARC embedded
background, I've histrionically been more sensitive to code size, but that
boundary seems to be getting hazy/moot-point anyways...)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
