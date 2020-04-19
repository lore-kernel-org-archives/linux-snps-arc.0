Return-Path: <SRS0=N0cS=6D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5B0C38A30
	for <linux-snps-arc@archiver.kernel.org>; Sun, 19 Apr 2020 20:35:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21D432145D
	for <linux-snps-arc@archiver.kernel.org>; Sun, 19 Apr 2020 20:35:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aUYiPnnK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="b1yKdCS4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZzB77iu9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21D432145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PBl5IsDX9og/8qH0iDvzq2aOXmuR1XXdd4RMrseyUw=; b=aUYiPnnKWSXeLQ
	ofceE/xG97PXrzbRmftXRCM1jHUY2T12BCNYqxu9+8PfKR+dT4n3iJVfuOkwpCd9nLwd061vFP/X1
	apTMb9WwIFU75VkDJAU+vMzzGIiUg1BpZtwlnIakaBXEq8bYKE5CSGUTAEdpyfRHH0Fba7Gog7iin
	Yq3Sbw3EkPuVv5t3pFcu+91unZv2tRi8Enf+mC63J+kXAqmVRtTpKSDnFwwFcYXcsp09TnbHqUKmJ
	93CS8l0wf3i7qDD5tsTXsLnxu/imVr1ntruPwHBwF0YkdKG7u8bz0+gSRuTnz6KTIFpWXp0pSHYCW
	rFNhvET5aY2lwg1UsUOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQGfN-0003nB-Ix; Sun, 19 Apr 2020 20:35:49 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQGfK-0003m4-BV
 for linux-snps-arc@lists.infradead.org; Sun, 19 Apr 2020 20:35:47 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5A5DE40122;
 Sun, 19 Apr 2020 20:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587328544; bh=ZDQ6g4jYEV1gyYNfeCCs4XItps99YlIAvaM/TSMh0po=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=b1yKdCS4kC1YvvrIA020qH3ZINiJRnvoL5yk/bImO/H2Ue046l7c0MGcQ6aQi/Wsn
 RD1iq5YjiS021ATAUI2JST+7me+yUEULaqmnCo+x2kMvIGIWdJwuayr1SuQw4S6TJL
 KDrIoo8aIwLTjuR5+UCOPtL02f5JYm0Qx690epiWVZPILYHZpBqyE+Bc7PBKNI2hU9
 3FigyC82IwXX5Z9/pYLhxEO2ziyvtNlih/aphEyVY6Np2sLkJzniEOpQ2Hdyo/U9Jq
 UdMuA0iKtQ57UbV97lK41fMwvKHoiajP1ae9345Spr0qq9YihgWSXU9nQVKEdsx0mW
 Conne+Xc0BUlg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 99FABA0069;
 Sun, 19 Apr 2020 20:35:33 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sun, 19 Apr 2020 13:35:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Sun, 19 Apr 2020 13:35:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SurPqnXEc2BrAlPakCcqDrWH972LALVMq2yP5cd6hFhXrCClL83594uBIuROf+krfpDELqRYTqBRrDPfUrDJ6bDg4DK5+45daShRdPhGtKmwmCgHEJtRH1ZkHkHT7W72kCrDFu6OKMHKf9XOVNQNGp05SPKrh+bcYZuezgq2ajUhd8I/s2ZZow4lTcA8qd1a923qwREajdILUlcerQ7Sa9g2iPFi6XyxpvJl8g3Ll1wngqwDCgz+kKVh3nHcs5QV3Opeol9NtxVd5JRTNm13OmwLUoiqDtNgjb5xpH5RywXBwdWrdJRHE7TlUFQ74zKazzqguh2vl0VwbOHMdBnkQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDQ6g4jYEV1gyYNfeCCs4XItps99YlIAvaM/TSMh0po=;
 b=MfSCZ9IwxiE9sdVb0Poolzt1Bwl709X5+eL7jjTvI/ynDU/BUNuslEU5ChtPAHcW/RfzUBw7RZ8YupjDSvPZfD1/8y2pAr5NeuIAd69jGTLi/bgWQDcc6Y3LZlemjt/P2QKmXPG8xHjWmX7DzlEnynUOqw96rZMbQO+jrfBwSZVnInuApOXTeNmaE+DeiFd+e1CfpXJOnP5xlchdsqJxYGOk4nLRU3ZVX08EmAkftd8/upCcqTE3KWmuxYbZc1MSWbkYZ/dvLK8+LW89DH0MOCgdGQQq7Tr88SyJI1MU0igKzDBNJWF9iZ+qclWSDghlU29YhtdAG2HnyJo9gHX53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDQ6g4jYEV1gyYNfeCCs4XItps99YlIAvaM/TSMh0po=;
 b=ZzB77iu93KOiTdftY3deHdsJeupznZIAq9OSnCauhJw4BZ00HAOZ/H2Y/3X+WGjGrFGV7oNCGpyEZf4nmYK1k8PRV9qrLXx7pG82JrpfdxrzupZbXqCByLBbNEvlhB8QLIG822sN1LBPppa42hwpvfRTPKWnto9pRpMIEWxb5XY=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2696.namprd12.prod.outlook.com (2603:10b6:a03:68::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Sun, 19 Apr
 2020 20:35:30 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2921.027; Sun, 19 Apr 2020
 20:35:30 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v2] provide y2038 safe socket constants for
 default/asm-generic ABI
Thread-Topic: [PATCH v2] provide y2038 safe socket constants for
 default/asm-generic ABI
Thread-Index: AQHWFQ66YTbfA7IijUqRmITzYdB8aKiA6gOA
Date: Sun, 19 Apr 2020 20:35:30 +0000
Message-ID: <35702f6d-ed12-8157-1fab-fd59d460f78b@synopsys.com>
References: <alpine.DEB.2.21.2003312122350.30236@digraph.polyomino.org.uk>
 <20200331213208.22543-1-vgupta@synopsys.com>
 <alpine.DEB.2.21.2004172320030.1082@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2004172320030.1082@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:1c65:a265:857b:ea1f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2b22779-7c9a-432f-0d20-08d7e4a133d5
x-ms-traffictypediagnostic: BYAPR12MB2696:
x-microsoft-antispam-prvs: <BYAPR12MB26962059630923D3CA8587D8B6D70@BYAPR12MB2696.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0378F1E47A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(39850400004)(396003)(376002)(366004)(136003)(6916009)(6506007)(4326008)(53546011)(8676002)(8936002)(76116006)(81156014)(66476007)(66946007)(64756008)(66556008)(66446008)(558084003)(31696002)(36756003)(186003)(54906003)(6512007)(71200400001)(316002)(478600001)(2906002)(2616005)(31686004)(6486002)(86362001)(5660300002)(41533002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KRF1Fhwqr9mKOwc8HK23GGQ2ipkGzNVOa6kmnuAhkhC+tM7AGfNOaP4GHu/l4ndnhecPlOa/gClnOGj7R/i8BqfUvTdWRH4G7a7HDLS5fzRmHvZICtXoUu7ulJI+pBh1itkV99061Pe4OZo2jsaiz1AnnEwx2kXnZrFX+QB12vLb/jpPt58nvY7KHbFWXN4BrI3CLMtuwZpLZppFlUKtPpRoHanpgIwT2OiUFa/HYzlFcaE1pRmoVpyIKceLdX7HzI9kkuRxlED9Nx3Oap+eBoxVwfCbF4MoRPiyievG4fg0kS48iHWrzbMFHDJdqDUQWZkstiZ3vQtT6KyAGmHl1CwjkbD1K+Ns43wuRHzMpyKqHoANLUEfzSsTQt8rf7N6IBGGv5uNyGUCEqk+tSxjzJTgh35ANTiDRkYUkEI6kunAg8KV14c00d13x169p4KIK9FVbDBxcMlpwl5Xzk0cM59ZddoX64/AQ4L0NNNLHmZETCiHGXcotRWURneKxlh+
x-ms-exchange-antispam-messagedata: zSz+2+nR0MwQ0t32mfozGJSCOPZ8Er1B/f3rlPWNJstBRA2KZpiHFa/Q5zbdmaqcw7dBXkny9daWdVCpZTsZs0YrhVavH/vBWfDS0Ejbta1/CszIavPWfEHeNagN9IIgNlwj30wkAjxRd83/1B/VOQMXTLeumOOpsmkYpR68zVAbkbKCwE93EF2/EYaktjkxUSdBoLQUkiHx/52VNfb5yA==
x-ms-exchange-transport-forked: True
Content-ID: <62AF505D396C2D49AF90ED111D9236B2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b22779-7c9a-432f-0d20-08d7e4a133d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2020 20:35:30.4663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H0i2MM7sGF6RbsEYxBkDNoDp9rwAaqsnpgxOjFUiwo8Dyl576icpRQbaVjlte/ggudObx/WtpuSuwFFyjRmsNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2696
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200419_133546_472640_B193638F 
X-CRM114-Status: UNSURE (   8.94  )
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
Cc: Stepan Golosunov <stepan@golosunov.pp.ru>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 4/17/20 4:20 PM, Joseph Myers wrote:
> This patch is OK.
> 

pushed !

Thx,
-vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
