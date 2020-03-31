Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A66C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 21:02:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1A4620787
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 21:02:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MixT9IPi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="K95wKzgU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VDIuEX+e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1A4620787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qu1A/aGDF/DHY7OmSuKckhA2QVzgq1FbnsUVI9TFKrU=; b=MixT9IPiVcQqsa
	BCJUOrtpJUJKmpExObqpDPOjPuQ0H/U3wNhmQY46+NrIOcFWk/rJl/C8SWYMjufV09NTshSJbI6qA
	78heGpIskaJ45kbVSb/DUJSHFvwQDpCej2d5iZSYUuvwhAkMmBfXMIcpyuiRDhAt/+6laPVMj60bT
	lnNzH2IIa4UxIHf0WNaGsyvoIsRr3SWCpXosP6hzOeJA2Z3in5w64Yq7vgU42TKCYI+YTFaTgyWhH
	d96yaKxYo+BjSlz6em25D9cybbuqLLdisIT5dl1JR/uYTFw4gGd78tYT9ehvgj3YrDiAp6Mu8YwEZ
	CRyfde1SMp8waw22v3LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJO1I-0007Qi-Og; Tue, 31 Mar 2020 21:02:00 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJO1G-0007Pg-Er
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 21:01:59 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5612643B4E;
 Tue, 31 Mar 2020 21:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585688518; bh=umzThBt79mhHAjlP1fqSu3jLkUp36yvRFitmA0GzJI4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=K95wKzgUb27Unn2i3eNUPgNqwEB8OQ7e1vY0pEEkc98x5E3+XT70Zxia2QOIMv13M
 uNqGcSm4mE/Spn6KyydP8EwP9oYxSLbXcph96y9eNYzrU1CkY4lfhqa2zcT3SXKWMD
 n9V3K4xq7h5QYEkzlDzQDo1DYVndF6GDqfQPDXZcLamiVvfgy2Q2QRpZ8o0Uf4+/Nv
 q3exmoeBsGXPLSYtfPrMu01Tz/tmZqq5tPYS43nq39/VnM+4XjWMWEhkLhm+9WGZhC
 it9RMCjtEQIO5B6hCCD2TFAmxKmBkXthkOtEXz9dW+cxHB2zwi2Pg1DOhJWKIBJVMl
 oPtcZ4irL6Xzw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2DDD6A0079;
 Tue, 31 Mar 2020 21:01:55 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 31 Mar 2020 14:00:24 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 31 Mar 2020 14:00:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lB9LOv9YdfIKcGugClPWUr1VSeh9fvlZXd4mEBEbiw/cloWCnK/XjenOHVf26YHw0F5ZS+lg0JGpwcCZ0pTx5c2dcYTqgkHKB4ObJPi55sMS/0CL/kPBs+nVjF2lSUpL43oDwqi/7oYPmvnh0pjEqtMl7TueEuBdkdwhN4xmHDuHwpopqElFtu7W/pE+GOF9BPDz067+15LrF1cM1K9VxDg/AFV41p2Mm0DJY/v3y9tfXpzzVtyRBjdW1y2TCMQiMN9KpYCEnuDew7COdRx4vq+IimwelmHa9XNehqp648NF/CbaheVZz91wH5zWAqQ5v6l9YPEgv3ARtkx/PGucxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umzThBt79mhHAjlP1fqSu3jLkUp36yvRFitmA0GzJI4=;
 b=Fc9cCI6c9iitsbF2MCkPggVgDQOXPeMf28E9GKDHcO1jSiUFLUgttoiQiAr3oT6NgOLu91sOvTAlJypdOurraSogNi5d6eHvsxhT+EviZvE226kTHKGSvHsYAooWExkU/3h6BcVdYIriKZ+WL36Qbgo7RiWBqybn050nlXIUrsd9XLgazVAyrvOsuh705apYtzHYrU95jY5YX+dbkMQq59hahHFNVlUI95forZNFc+8q/UKk20n/vHCEjuRSDIcJU89hCyH9PkbpwBbn4cyPLLFnSBK0fzrbeN5kNVqXbGDpGYrqFryzAt2zXG/SaiwSrnKitvv+dPYtBeiwjc7nWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umzThBt79mhHAjlP1fqSu3jLkUp36yvRFitmA0GzJI4=;
 b=VDIuEX+eFlEEX+bAWiYFnImJ+YgJI8peodCGu233xk5N+iIPRtu/JoCcI/vVZ9jq6zRuNMn+zZj+6cocQxQEUW9Bas5vPmtaYdP+oLRnSPdj84jch7QSwXf3peGsp2fIk1oHox/SDwc/qNNLHXyLJy773lcxZtIAMiDnoS99bYk=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2629.namprd12.prod.outlook.com (2603:10b6:a03:69::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 21:00:22 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 21:00:22 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>, Florian Weimer <fw@deneb.enyo.de>
Subject: Re: [PATCH] provide y2038 safe socket constants
Thread-Topic: [PATCH] provide y2038 safe socket constants
Thread-Index: AQHWBYDbfeMGxKt7Gk2A7SsJcwT4aKhjG/ymgAATmgCAAAQvgA==
Date: Tue, 31 Mar 2020 21:00:22 +0000
Message-ID: <10f0a47d-189d-14f2-f665-5b5532be629b@synopsys.com>
References: <20200329041612.4071-1-vgupta@synopsys.com>
 <87r1x8qpx6.fsf@mid.deneb.enyo.de>
 <alpine.DEB.2.21.2003312038320.30236@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003312038320.30236@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: ced61b2b-17d5-4e6d-1a92-08d7d5b68709
x-ms-traffictypediagnostic: BYAPR12MB2629:
x-microsoft-antispam-prvs: <BYAPR12MB26299A9485D871E10FF652ADB6C80@BYAPR12MB2629.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(346002)(136003)(376002)(39860400002)(366004)(31696002)(110136005)(54906003)(71200400001)(81156014)(6506007)(81166006)(2906002)(316002)(6486002)(8936002)(53546011)(4326008)(36756003)(4744005)(66476007)(5660300002)(186003)(6512007)(66946007)(8676002)(64756008)(478600001)(86362001)(2616005)(66556008)(31686004)(76116006)(66446008);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zQQL6ze6YTv8iHIOOasUEEL/9rO6951UlTbyweYUZ3PH5qGIoO27Q00bbSSRTMN9KJ3TM4oCI2tQeM9UM4t3MxGM1qRllqEX/IgaD5/gp9g2mxNQ0VtBcrMTdtdSe+QXYYRrzIlLaet5ETJJbb6WiqQR1d4yQtNmpZDYzaqkfS7YZap++1ykJSIezFu0wWPRDYh0wnTl7ejw/AsfYMRv0AsL8TIbEq6ZDofr8gu3ArKkNdEmPZhZqe/spg2yGkKw3KbPSiUhRFM4UVo6UosBXLFl9QMZMbI0c+WQaFUVNHxUEfjdfBnAmhFosDnOI7guK7Ins+R+2097tnTvacy8zm82gMgMVNoWc0k1MRhbEhHVJ+jf+YK1SALfkFsRDtfyRpdfQIfKIXQlyTp7rT8UhrIEMkhX6iLG6nnoIK3Xm3d+jxSedJWU3JV2KJYbEYhu
x-ms-exchange-antispam-messagedata: mx4P5Bf0l2tXWUT97aPKpCc0CGnaInGvugPQRc4b3U6QLRj0zWjdvzc+u8iKTqV+ghdDbEk7cw9LcT2bg9SpYmpdSfy7vmaSgY2bSe8upnbJEu4BFAKAOBdjkArK398VTWTz6uReEizDQL/DZiTgP2iS2GGGDCUAhXvXaWgWD3oR7/3ayjNhysjFq2JNoZE0qE/nUBMYunAsy7BthGrSdw==
x-ms-exchange-transport-forked: True
Content-ID: <028163F4B748324B8CEE2C845387CBF9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ced61b2b-17d5-4e6d-1a92-08d7d5b68709
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 21:00:22.0920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YUsLaTxG0UtS1nDPh29WDEIf+5LiK2dJGs6PeGO1BfMC4vviL84GfausFucRPPQKBZEHYr3ujj4m6rzRifHETg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2629
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_140158_510738_B654C9CA 
X-CRM114-Status: GOOD (  11.34  )
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
 Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/31/20 1:45 PM, Joseph Myers wrote:
> I'm concerned the present patch is wrong for x32, however; that has 
> __TIMESIZE == 64 && __WORDSIZE == 32 but should use the old values; the 
> patch should be using __SYSCALL_WORDSIZE when available in place of 
> __WORDSIZE.

Something like below ?

-#if __TIMESIZE == 64 && __WORDSIZE == 32

+#if TIMESIZE == 64 && (__WORDSIZE == 32 \
     && (!defined __SYSCALL_WORDSIZE || __SYSCALL_WORDSIZE == 32))

Also is it ok to littler the code (multiple times, this patch and else where) with
this or should we define a new __32BIT_ARCH_NOT_X32 or some such ?
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
