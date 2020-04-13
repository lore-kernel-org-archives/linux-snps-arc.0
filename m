Return-Path: <SRS0=aZIh=55=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00C0C2BBC7
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Apr 2020 05:38:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 715C520735
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Apr 2020 05:38:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f+hmQvoJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QO8xeFp2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HfUs9+Ar"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 715C520735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLFxejxOPPm3cAJ0qLbWPbTIKESbSu2e16+p0ojxqIc=; b=f+hmQvoJ70gPdJ
	yYS2wxh1dYy7nCGmoSgXcOXtRrLxfInshqN2wSvNUiDm2dInsCEtwcGwXnBi3ddQCI4pdH2wzEIAD
	mxx25hKohhQIVdzgiE4XTFQLJG+4yiGxhadCw26OLD3frHOWziwjazc66oYOkPljdGDh9U63iwUwG
	JnvSuVZw2cEFNTtsI/+eVoHxQaaIoV8nW8E6tjHt11vmEg7oj8Dyy826JssnKZQE24ryN2I7zhOXZ
	zJqOFaUOlK7p5kl3WfhVLYi6Z8SYtb+1E+aOdXrAmZbO//E5XHQpERPr+ApNFKuDnOpnBtQma2tdj
	PrTqUq+kaP0LjMdJIUJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNrnn-0008MH-SJ; Mon, 13 Apr 2020 05:38:35 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNrnl-0008LU-Dq
 for linux-snps-arc@lists.infradead.org; Mon, 13 Apr 2020 05:38:34 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9CE484049F;
 Mon, 13 Apr 2020 05:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586756312; bh=ZzS7RFtzhOZpX2BQvkpBsuOz0l7kqOSY7HY3NmCsF4E=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=QO8xeFp2bY/U2Og/Qj4muocx2joOHeQdknQqWnIxsg/qTA5pzB5GDhuts6RRJDkLs
 MQ4Gz0IZ8sBAw+SnkRoKZvjjri3do0r7l9ZUxnv7YlNOVrpHGUnjXmBrcQ3CyMoGDt
 x7fyPJpeaf9+8zo0slmaqg8tB9NszLqCLCMd57auKFrk7PHe3rci7bDvJuotO83Kb+
 yr5UY6r2pO6G4P+Kqo6guvG33ay5gpBE94nUaZjYv3du8A3Kfkf2yU+0fw1JiiWqGv
 5dOzqLSi5Ln5s72oLv+DXZ6KztdYSs58cYYqG9LWv+RdkOGSQggUTeavr17k/J5n2G
 IvVXSr0YwMFBA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3B743A0083;
 Mon, 13 Apr 2020 05:38:29 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sun, 12 Apr 2020 22:38:29 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Sun, 12 Apr 2020 22:38:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMjg1KzSyCTqKUNzpswuHAx8V1Drvp9zFLf3QsZZwgaImU5cUdXwGji46v4fYNg19y1CP7kIn8GQDIJyY3lTHiMKCp2RcBf4oOgIu3mi4MPdMy9ojx0d54c2t0Gu6WoZ2qzhc1/G6TTgjAwDaGPktiwAcW/gHMaU0Mf+upD5s+fRmJoiLPZI9wfM15K2QhDZlwb0ci6GKSiO7rItv9Da5BqNSbkyh3sA2DtxZAnqIPIh+uwSAtwt8CW2iyS2q3Kt6tc3flk/g0TXHwyJ4f9YK+cP2NRFuX3mDUUP2HNEuwmHzIC2EzX0haFxk9SgpMy+6iLhHFS4b8vibVZolLxVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzS7RFtzhOZpX2BQvkpBsuOz0l7kqOSY7HY3NmCsF4E=;
 b=NMVkk41jxPuxOHdG0I7gNHNa0q2G+e+vY4Zf7L8qf2lxVOqm3Qik2ydY0ZeNvCOKX6FGWNpEIuYFlUN6phzYzsmLRwaXVWuMDEZPjOTsQJLonnkP5SErHDjSSOCBHCJe+CNuaqdp3/W4JplWjdpg/GpIudqO65Yd0pKAwpr4ad/2MIvUwllYCHkD9eoudIeutvxRXT3o8lvMWS11enj8bl6aEGh0yaQclvE1MzeZ85MzOsCirXKUo3YhXlcsQ77b0vUL4PnhSYy3zFGIzHa1nw5gdfQiDqYmILbQiRF0UWmqsKN41hPwa8WXgoqssYEm3yrFcxUzwpJHIdVTXm5xfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzS7RFtzhOZpX2BQvkpBsuOz0l7kqOSY7HY3NmCsF4E=;
 b=HfUs9+Ar2HA67Nr+f9KXWo+QW/gPHQbOnXbu240nydt+TBZpAuQlBvawOJBy3qU+0rj3pJCrnWfArs2nlNDX68DpARnxNdgvZ/CNGLk/1bSdQjFaT1q0fl9ZD78on5DaqeUwb+0wohJVCbIQT6pV4G5zR4veNwjWgXPxIxkGxzo=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2679.namprd12.prod.outlook.com (2603:10b6:a03:72::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Mon, 13 Apr
 2020 05:38:27 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2900.028; Mon, 13 Apr 2020
 05:38:27 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] arc: remove #ifndef CONFIG_AS_CFI_SIGNAL_FRAME
Thread-Topic: [PATCH] arc: remove #ifndef CONFIG_AS_CFI_SIGNAL_FRAME
Thread-Index: AQHWETg8A9KmvmMv+kKl8KEcrCtHTah2iREA
Date: Mon, 13 Apr 2020 05:38:27 +0000
Message-ID: <eff00d87-3659-e036-3e24-3f8c9414fda9@synopsys.com>
References: <20200413020538.31322-1-masahiroy@kernel.org>
In-Reply-To: <20200413020538.31322-1-masahiroy@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:7c06:2fd:ae14:dd9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1abb9a52-2477-429a-63a3-08d7df6ce411
x-ms-traffictypediagnostic: BYAPR12MB2679:
x-microsoft-antispam-prvs: <BYAPR12MB267965B67B2472948F2B367FB6DD0@BYAPR12MB2679.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(376002)(346002)(136003)(366004)(39850400004)(31686004)(31696002)(186003)(81156014)(8936002)(5660300002)(71200400001)(2616005)(6486002)(4326008)(8676002)(86362001)(76116006)(36756003)(54906003)(6512007)(316002)(6506007)(53546011)(478600001)(110136005)(66446008)(64756008)(66556008)(66476007)(2906002)(66946007)(7416002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SH2jGV/XY9lmSku9dgqAtZF4wFCuSuo1LOHBONy0ivrNE442yYpx+0eiFS4QY6AexYZpSrDN1ziiZoWcQ1GF2IxKDkpbHOE8BeFx+BZpKYQZdSaCJAGVMtBPWveSsU2qTE9aD4huvWhz04BwsLOfNIfCo58d5760nBBcbPS1/cFI8Z+yOWHbpzzvw/1sX+zHb3dun2wDNF9WnJ5nkfmBi5+K+jbpZECCQnn0+TYYkhWCDN7hT1l1dDjypMBH6ABLkCvvxFaakMJpdV2AgytLReqF4xD14OchvksWIiu0o9EPFZPfaLXyFVWsG0lOY1/5ED+HykgQQOzwMIO6diZkijmPlrvTPFF0+1M0Ppt8sqxCktpvHkfhIqUJFArEXKq1N6HTZjMZAeskBqQdCHz/iJekDtnyGK3QV4GgToUvhLJ0TXWdkb8b70W8uN4E7uzC
x-ms-exchange-antispam-messagedata: PEsi+/uiLilx8P9OLdEDoCOMp6CVmk5D8iCkGXpfYXSpqp1gxd4o8Cyq5dK5G+7/qPJDAYUOTPqfkZgdUoaE7H8op2ugP+NxWwjS/iCV/y+kL1G/n9Mh9NpxBArkzcq50MD+0JJL7K9cAIwaQOMoW4doUfKSBrUcABq72t+bmeDcYXfusR8hnkK9scIxAb3PhKP0XEXYjVCn700qSnjQdA==
x-ms-exchange-transport-forked: True
Content-ID: <0F9EAFF4130DD5448C68E6B00FBC789D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abb9a52-2477-429a-63a3-08d7df6ce411
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 05:38:27.0292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xqXcky+4bgdEU/iKjEvAAWGeMpreVzvtFtBPZLnMooTanPfNcFGNNkET8fKHmgFNcP3WIhiWiZYaZbWVGVlvIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2679
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200412_223833_476165_9F75D3BF 
X-CRM114-Status: GOOD (  16.60  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 4/12/20 7:05 PM, Masahiro Yamada wrote:
> CONFIG_AS_CFI_SIGNAL_FRAME is never defined for ARC.
> 
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>

Where, how ?

> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/arc/kernel/unwind.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
> index 27ea64b1fa33..f87758a6851b 100644
> --- a/arch/arc/kernel/unwind.c
> +++ b/arch/arc/kernel/unwind.c
> @@ -1178,11 +1178,9 @@ int arc_unwind(struct unwind_frame_info *frame)
>  #endif
>  
>  	/* update frame */
> -#ifndef CONFIG_AS_CFI_SIGNAL_FRAME
>  	if (frame->call_frame
>  	    && !UNW_DEFAULT_RA(state.regs[retAddrReg], state.dataAlign))
>  		frame->call_frame = 0;
> -#endif
>  	cfa = FRAME_REG(state.cfa.reg, unsigned long) + state.cfa.offs;
>  	startLoc = min_t(unsigned long, UNW_SP(frame), cfa);
>  	endLoc = max_t(unsigned long, UNW_SP(frame), cfa);

Actually there's more scope for cleanup here. The while signal frame stuff is not
relevant here at all as this is only kernel stack frames. So all of
frame->call_frame stuff is bogus at best.

I once had an branch with ~15 patches to clean this all up. Let me go find it.

Curious though about the CC list, is this patch part of a bigger series or some
such. So many people from all over suddenly interested in ARC ;-)

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
