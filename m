Return-Path: <SRS0=zEZc=E7=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85358C5519F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 Nov 2020 04:40:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DACD2208B8
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 Nov 2020 04:40:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X+qivu96";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jAQW4PTY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DiTvku4f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DACD2208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V+s6ZhsgOAXwM45YSTasBTcRkiMsOi5zy1UU1lEzGyo=; b=X+qivu96uPx2y9foONvAMkOiy
	OIkRdJh3ybu/8cbLQ/e24QgyAEUC/XIIF1DSEOJakD7h41jmiXO3yxIpBNUSB1/RUfmEOSOUHywNb
	JGDx1zU8jt312eDAeaiZM5TH+5z1kLNt0cNimjg0PLjJhnbveG7aKMNH2u9UEVOfwcNlgEErWNIEV
	EPaAHl6A/77ABCh+ZSK3farNqAoJqOOKwInf0Aa2dTq4wiYCTqF0wAScsMuJHor38XkXLDJSYdzE1
	DweHhOvxZBeQgtalKEfuaEcrtfgAny8ApD/yDF38HJPmrm7zRcHD+kKIHNIdJBj0cjsDxkG8yTH+X
	hltALjMEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khmbX-0003mf-PY; Wed, 25 Nov 2020 04:40:31 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khmbV-0003mA-QV
 for linux-snps-arc@lists.infradead.org; Wed, 25 Nov 2020 04:40:31 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CC4ACC00AF;
 Wed, 25 Nov 2020 04:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1606279225; bh=R/q6NwsNF21KOIgAEjdMfQsnTxKZKuDJxC5Rv2H8MYU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=jAQW4PTYUb/breStGULS89zPR8JZpwzSOSBH8tKhyzMgz/xcoyraXG9lRTRmXWJ3d
 mHBNb5af0XvzBl04nIlTAzdgvnkduiSc0044n4oVUXwh+O1eO3uqnHAaUrdoaHxGUo
 6XmIir06rN4Lx8Fm1/uls3vNkgt1cOfYNAozquk6yruZ3Piz/5Yk4p79f5AIrj7Mrj
 hKHd9e+gJY56+Ydbl9Fdnx2MLC6FMDXxpUANJpVAB+IKxgXzk0y/hkTdA9OZlCgpjw
 WlnQy0pkZ0Cu7jrJfpBHo6IbB5lSkxwBlDUMbhLuVdaoggYJdNZnwhtzTz0rVksZJC
 BjyQK4x3u6/WA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 16321A0067;
 Wed, 25 Nov 2020 04:40:22 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id B673A400BA;
 Wed, 25 Nov 2020 04:40:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="DiTvku4f";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFbLwfGPs6TQ9ZQvbcXyL9tGDq4vyEWu3fhPR0nFUZqlY0TbP4InGYzETB8GAQ8vXJV7p4mfefBADH7BIrQdfFi8Wv9BkcyoJr8WkbZA6VGjYdbKrs7u30uYDzYO+6c46o36Rqh6oT++dqBxRLh9o4OdV3mI1+OtUgt6s695qIbuiOauO6f7sPA9j9cGxeDkRKOySztLLaSQFL60C11S4W5cs3c3KdymgwFCdqVCavqmJ6qRpRtwrrkQATo2SdDkbAFrH6uj7OcZ+eGpCymq+KDBnMTJnCdJQOjnd62cyETsHQTNhHnGux54oz/rzjz67GkNQZq1EHnoPsKwMwDdFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/q6NwsNF21KOIgAEjdMfQsnTxKZKuDJxC5Rv2H8MYU=;
 b=PjtD49LMM6vBdXLKAYG6ij6iYPYIar6R9CWZ/dLrl6AEWUyYEl+UnUOwNe6Evarpgf4h2C4C3XXgtngG/DgVLb1qP36YntalheMB/ggk/R6Z+8cdmaC3bs0fZrO+/fjnpedf2uLJu+TggEJmIc2llcSKvd9IceJBAGkj2UkkouIJic6HpncJfmXV4MvTnpauBPxNcLgjCTUw/xUV8tHKZqs/C4VyeQbK04Z7Fba8XbEzwW2dBR1Rtjk2sHNTI1a5CYwYBCotdpnaCZeRqITa5d5/q5no9sQO9PzY274YiOVCq/KXBK+GeQsqWfR1CpJnZq0S4lzb8AHHjH7q3lqEqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/q6NwsNF21KOIgAEjdMfQsnTxKZKuDJxC5Rv2H8MYU=;
 b=DiTvku4fWANEvhZbjdZJVj6QjKhfx+aree8bX0AmAJTvg1ah5upVQmW1f7dlaDwUvsRUvZAPHUun+YjH1vGkdTo7Pmo5OUODl2wW65zpZ+81OubuYj5/WMeWIDiqJgt+8VG4YR1Vq6G06fot8D9DQFhe0SzZFyZ/NJn47qfw8Hc=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2806.namprd12.prod.outlook.com (2603:10b6:a03:70::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 25 Nov
 2020 04:40:17 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31%6]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 04:40:17 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH 0/6] ARC: build: fix various issues in arc boot Makefile
Thread-Topic: [PATCH 0/6] ARC: build: fix various issues in arc boot Makefile
Thread-Index: AQHWwD3VoBtjEs2mMEGciuOe7EANTqnYSagA
Date: Wed, 25 Nov 2020 04:40:17 +0000
Message-ID: <01998029-6222-a2d1-9147-1a0dbc7b7e4b@synopsys.com>
References: <20201121193657.51441-1-masahiroy@kernel.org>
In-Reply-To: <20201121193657.51441-1-masahiroy@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1f104c9-8792-4eb0-4948-08d890fc3576
x-ms-traffictypediagnostic: BYAPR12MB2806:
x-microsoft-antispam-prvs: <BYAPR12MB2806C14AB6FF71A8193B0D16B6FA0@BYAPR12MB2806.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7Fw3vV0DCiCD8CDlCHsGPYyz9tLyEco0XZN3nIRKu2kwVoS9vJRz30IGU1d1lLegjYct22TmD6BGzIOhb0mJjtnpirdQ0CHFu4Jc7nVV6pZxJixWnnnSg3+jg7SjqCLxzwM9kbuTqKsP0Sduiff+TZ+VgGUgcxzJpVWG3peVSTRY7xqRrtBdd9znlJDxRvafgD4BnhSqsIEWo53B+rY1UBIirQfVrrpjhvo+IZojaW5uky9gyPEXuXryIA3Y3VQcXD1SJblDmrzXxko707Gv+9A3vHia+Kg7m/eIxcmC1yUhlb5Rboa+gdzzpb05aQf7GCuZXBWxOAubF7kVnkaIJSLuDkOoyG10c6lgWZo0tAgXcyqBeq5Lpu4ckZBMbSew
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39850400004)(376002)(366004)(4744005)(186003)(36756003)(8676002)(110136005)(4326008)(6512007)(6506007)(478600001)(83380400001)(31696002)(5660300002)(53546011)(26005)(2616005)(66476007)(8936002)(71200400001)(2906002)(86362001)(316002)(66556008)(6486002)(64756008)(31686004)(76116006)(66946007)(66446008)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 0Q/hFN3JbMfQK//8zPvgNMeAWt8+jWatokQIKQ16O8EVRykxVP2/UEX1R5oMGm+bf8BSrcEYWJztPVnu4gojF71izl2pklsCL7c5cS9gHheVSZQO5jKDnYjphT50Chzix7bmkND2IFINJnDAVVOetqvjaNN/aIuWjS5npMA/Z29EIycdz0VN2SbUJag5FdLYH5viQehg32toL79LSXYTwNAJ00pyZQn7VUJxowkgE/OfOXunqCl/F2S3Lyvo0wjpSOG/V5h4A7/vJj6UX7WAbrHjszzZKlyqulhoePkMZO1Hh6ZljBrqzQYUuNh94M50wdw5jhQPranQ+HeFZNYQX1qtxFCFeQOQN32i0Xmvat0CtTzf8cJT2jVPEPEodwJIjardXGxC5gkMezlWDQSRIBsnpGqTPU42HN/RCwp2WR95be0oy3AUiGpKgfdfQ4v914QccgPEnB5dIrXWhxSky9quTyhSTjjsfTxF+hVbr7g/ZbDYFUzz1r+CIUMC2njWRE3As3jE60+SMElmh7UENC536btDKoKzi3aSrbBZFOh/XT8mAS4FTguCLGbEmJQY/yygambqjbCzZrYfqmbXBZQ52zbr/Yp3b7GPochv5UK8PFy73maLnFbxd4PcyVmjbVN1/LNmaR/gf1Go94FTyJ0x9vBxqH39Bj3FZPldTztg1sEoRKuDHOlrugjmYfpoS0EpGbePYacpN/jdbH2qHDOU7JWZKH1wfjI01LjHRbnKac7y60FuiHpHdXzuLgr6Zh4a0TJAqjJqsaRM0Oqk10vFvbGynFc8JE8MI1lLle4fgTyxKLElDhEEA8V/Q7XD98FTeMsm+V9UqEinrcwATUTwHmYAA/tXXiRKb7CDxuXmwmZPiO+dsZ4RI9oUbhaXcP9VG+T0KdF8QgozLOW0CQ==
x-ms-exchange-transport-forked: True
Content-ID: <FA0A3BACB6DC4D4C87D706C6E7C57A6F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f104c9-8792-4eb0-4948-08d890fc3576
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 04:40:17.4838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M3sd6lqPCJ4Lw5eWPGHER/xEqoecQHuOzSncMOaKsI2y2YnJvr+9fYoidD9FRpl6xWJV+F6uHQ98jxVYQwzqEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2806
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_234030_370217_4AD6C43D 
X-CRM114-Status: GOOD (  14.99  )
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Masahiro San,

On 11/21/20 11:36 AM, Masahiro Yamada wrote:
>
>
> Masahiro Yamada (6):
>    ARC: build: remove non-existing bootpImage from KBUILD_IMAGE
>    ARC: build: add uImage.lzma to the top-level target
>    ARC: build: add boot_targets to PHONY
>    ARC: build: move symlink creation to arch/arc/Makefile to avoid race
>    ARC: build: remove unneeded extra-y
>    ARC: build: use $(READELF) instead of hard-coded readelf
>
>   arch/arc/Makefile      | 20 +++++++++++++-------
>   arch/arc/boot/Makefile | 18 ++++--------------
>   2 files changed, 17 insertions(+), 21 deletions(-)

This LGTM. Do you want me to pick up these via ARC tree ?

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
