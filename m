Return-Path: <SRS0=RjUh=7Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1E1C433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 17:06:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA5F020738
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 17:06:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xq+VHYax";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="exOWkkqF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MyC7v11n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA5F020738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9TF0udC1GYF/ujqykHndWxnVXIB7UUb+F9tm3edqvws=; b=Xq+VHYaxljXU7D
	5IA5xDCO3/d4hGrHjbiNnoeBbH0YmHmvTHZjxJon+/+oeF7TzFfcslrb6NSxEu/PtQY2/WcW3W/BZ
	gUjb6Q9xNSiwVMv+1U6v7gi4P9TOTvB7xViZASZWT0xehQcsTD5ShErBs0C9L5XDlCu5Tb76rG2Kq
	0e4emGlqezOE84bMOZtwyAL9RvkTGOtN0AcxYtevIPZ51aE9MCPUjNceLQGQaSHdjOno5HGLOk7Eh
	0SwHo8jFqy+Vy7gp36F9FIPT6Ac5oqcVZ77CU7vE9gAtTB5QOa8Jmh7gcm4K6rmEumavkFah5gGWN
	rZgA7cz12EoRhux/oMjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgWqg-0006my-Ki; Wed, 03 Jun 2020 17:06:42 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgWqb-0006jK-JM
 for linux-snps-arc@lists.infradead.org; Wed, 03 Jun 2020 17:06:40 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A996FC00E2;
 Wed,  3 Jun 2020 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591203996; bh=kzBGQDne1+xzjs4hfn3QX9g/3wcHCWoGo7dU8FfrZZE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=exOWkkqFfsSkXvdiaT940YBpwDVCKu5I1l5z5LbrXvLCPDlHqj3Zg7yni+td3rTV9
 DD6FhUhjasLrfHzNo75A8hJwf8pdSeRDgznojiLalcPqXw6ZEo1acqXUwHI8tjaA+R
 +k5yOFFWXHUOGdKSr5K4whqKs1FbO49qL3mcv3asDtgbRlcKeS6GYMQEcWF0/ehWr1
 IDR6ieaOXdq5aqEhQy0XR1XN3n6PrEWR+bH5pZYNh4jsUWclUDHF/0+ZnhaH8EEIEW
 zeKoEN/Ju0bb3Xrgcd0eSb10FxjSE99eVds8shMZ2qyimSTjMGhfMATSAoAQiHav4V
 h1ZswykyRRc3g==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 82F10A008D;
 Wed,  3 Jun 2020 17:06:32 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 3 Jun 2020 10:06:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 3 Jun 2020 10:06:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iloKD7EbKlvKiJOg4/sTK7BCtJO6U8ST2H9DQLGAYBFJFbQ+QDPu/BG6RE6sbZeUYHXLqA4lgI73i2bYFMT1TSKJ6GobmBrsmhTaBHSkyiiawbpRMani3iIhBKXE6opxp/5NMR/muwtnk49DY4dAiw01wikeXbSLJ5uhyo1MXQp1kBSjjKOPO3KqjnDOLsNZeTZeJ6/wKy9XiP9ApGFqx3cOiQph6QATyGaazs4KGdnJ9XONeG+gj4GIwI0uaEJDTximkFAUUPMIvQecORnIm7qdvx7vYoyR+bFmXcFk5UVKcXspl/sMkOzKzSY0EPOhjgCL9o+7jmF3WgJeC784mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzBGQDne1+xzjs4hfn3QX9g/3wcHCWoGo7dU8FfrZZE=;
 b=Dcrto75SV96ZUCl/Tv4G1GIgDA7s18UozXi84w6TcQ48YxxtAnvttPxnjM8aN6PGAkyO770rm+ThuwwBHL/lOjfzFEFUgxysJqfCtR9TTepPfTynj2rN4BkKKo3CoHnRQApWJ041lXn/w+lggrJeFjbVfCH4fF//mK+m3CdqBtTQwc4wnlZescCqdCOdxc7INP5+sQyO9TZo/5Sy9yGjzMt+MIan+UEKYxuRVPj/NnBWEOTDVchVKHZM6UyHjKWJV1bmtO86AVk29Ia2QYceYEBqCZ128jhE19AeuSGpcjj5ATHMDjJ+VzCYKTvbG80ndAiAyLn/zokblyTebqlGWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzBGQDne1+xzjs4hfn3QX9g/3wcHCWoGo7dU8FfrZZE=;
 b=MyC7v11n85iRN+EdPDWdYknAJlBcPzKer32ePxpjo3w3jm2PwXzXrI7+P+fsxTBAkznlGfS6fCf2B6ij/8DeYe0VFSa7dKlKH2JmZrpG++jAeyvixDUopGc8Y4jIeegVHvj+wrv4i2/yza2NIvcZeNRqAiv+p+XVZS/QJ7ExKzs=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3320.namprd12.prod.outlook.com (2603:10b6:a03:d7::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.22; Wed, 3 Jun
 2020 17:06:21 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Wed, 3 Jun 2020
 17:06:21 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH v3 1/4] iee754: provide gcc builtins based generic sqrt
 functions
Thread-Topic: [PATCH v3 1/4] iee754: provide gcc builtins based generic sqrt
 functions
Thread-Index: AQHWOSVbOQ3w57p2IUqzWWlLaBgVg6jGlWc6gACK6AA=
Date: Wed, 3 Jun 2020 17:06:21 +0000
Message-ID: <2729cfdf-1f8a-e2d1-e36e-b833a7c15d0b@synopsys.com>
References: <20200602213220.6201-1-vgupta@synopsys.com>
 <20200602213220.6201-2-vgupta@synopsys.com> <87k10o4jvb.fsf@igel.home>
In-Reply-To: <87k10o4jvb.fsf@igel.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:2f8b:62c8:4c97:a7a2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a58a37a4-f592-4ad8-af56-08d807e070af
x-ms-traffictypediagnostic: BYAPR12MB3320:
x-microsoft-antispam-prvs: <BYAPR12MB33204FAC57A5D4C7F562FAB9B6880@BYAPR12MB3320.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:525;
x-forefront-prvs: 04238CD941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: loXUcOOCY+OxjiCYu+Y4rV90p6NtG9hdVx8H3SK7awtXX2a4JDSI6hqtNE+A2vJwfbURVs+wfHmeDybqTSbRQHK6kUDyXIZo6gQabwALOgmPNJ3BltJJZoyaAZTTsiE1gP1kk3aP9LO8ctYghmEtkrUueBIWqXWMwzeXQWYKGvnnHYSpfITb9s7rWEN1xoO/9dng+cvdU8kpWThq/sjXMn41s+02dUk+uLxBpCghLQSiqSPkqeW4iaI2zzYUdTOKqWlEgJ/yAPPRlTtPAWi6fgbU2uy0T/jTNE4/cg4vrw6LS+e2X0F1LmJqvzzlZl+bdBFwI3hnEGnu0c/U4E12ayuOKxj6H1rikeeiHpeHiP0PJ9bD/FfdsM8/rENGlDXMpX6UhA6IyD51raNVcRgNgA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(366004)(39860400002)(376002)(346002)(136003)(2906002)(316002)(8936002)(71200400001)(8676002)(6506007)(6486002)(53546011)(558084003)(6916009)(478600001)(66476007)(5660300002)(64756008)(4326008)(66946007)(54906003)(36756003)(76116006)(31696002)(86362001)(2616005)(6512007)(66556008)(186003)(31686004)(66446008)(41533002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: rHusy8J//NII14YWdCzDq1Nfqs3whbzSjA+Any63iH8jQEmzHf3Jle2sHe/jSe/qlzpYb43kTw7O79vH3zPbkMG5n8LoFZyvSRakiUd0jwuUiWaJFPP/3FyMs4r1TuWr7+v3oSZ1LS9gwPjhoCFrfZCQZS33kPDcfi8kOYTbp/CHAKEstPFP8Jb+7tlXuJairJdHcoSOh+BLRc9VG3kbVjpsM1zN6d8VCPHROCRHaEzUCwiZYhRZ4BTTeVzH+uA/nEJciLzXZclmLlY4993PmB85PKb/gYBtCUtaBp5vp8cAoJJ01UjyR6Fjtb2xijVTpERP1hoXxdEYwta0Ozt0xw+VtjtjHGb+R76R48r5cBNPVxBY6txgFsz6rgMn8Of+iKuVRaDlSU8+ksN2UVSIfmZu0JkRopV/reKMF5dsQ95P93vtWqDO/3ZYfajHZKoSCv0gNHiT3UOzE3v4/LlKLhxHGgBBmjX8/H39VVW/zSU9syq08cHva1Sz2N+SR9IED5XtgfpZhcEV+VGsFnUMQtuWUIKzZyvPl3xjTtjVovtNM9Vdw0oxgne6hPGQgDWO
x-ms-exchange-transport-forked: True
Content-ID: <CFFF775A70456C4982437D9F43EF5A48@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a58a37a4-f592-4ad8-af56-08d807e070af
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 17:06:21.5836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zK74A70l8qjnT/jnKm6PhEhr1/Gn3qttIbLdwh6o6P9qy306vgySzZCmeSYk/XvI8lxuSRJCi1HLmxgYYZ5kCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3320
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_100637_791912_842CF8C9 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
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
 "libc-alpha @ sourceware . org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/3/20 1:46 AM, Andreas Schwab wrote:
> s/iee754/ieee754/

Fixed. Thx
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
