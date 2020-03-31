Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FA2C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 20:03:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC6B20658
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 20:03:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OdKCgnh2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MA2kGYyq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OxZxIeZE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BC6B20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zOxvra7ZBzANjBrk0yKSJY6Dmmbn3qv4mXlQVEZ7IQ=; b=OdKCgnh2CUCUoy
	2+j3EfIJyS/Zprv+0oYUF6AzlOmyMHxVCfmnostPBUJ5cpDzR+qyTWnv0haKx3UTkjN9TEdGNUdNS
	g3YObe12pY3njFY5Ym4C3OZcqSLvQj6uOJgMfVdMylrgmh4hxBzUXgEgEbIdXiGcmbVodt1t1n1hk
	fVMDRtKVca1OBJteBB/Q8v75itf8WKca7nT/FicBdYqPDy833HREEPs8ypfSNTgAP0rSLehKCkN13
	Qg7YWIT39yKVb1VLDeb/t6xajD+wZpFQprETXtsCBoaixpXQB/qzKlBTLU8P4uLPQXkh24iTQCAW4
	tC2l52lsC0iRMfQQGIpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJN6W-0005NH-JB; Tue, 31 Mar 2020 20:03:20 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJN6T-0005Mm-Q0
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 20:03:19 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6E35843B4F;
 Tue, 31 Mar 2020 20:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585684997; bh=MhO9spL7kKspIDhWMfySJmmi5vfS0oKwKB0PJm3byxQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=MA2kGYyq1Wy7z1cgc4K0MVrmAfk8sJOCOxryUnq28F0EZgiYwS3oiIbbCgg9KLTyO
 iucafhRKuuIt7LuhMjg+WwBkUY0q7LsnVgeEqWtm9krQ4apMNR50cUMaGQ49cg0V7a
 UP0gLpTqvIHby6HrUdg1rApVVa3/+rYhPgi08Insg9Ghjrt6N1RCcrm4Fj6WQUkdVj
 rB90cNhrCO621IQHyIW3UWZDYm8RaVgMn+MLGpppcverwV29uVaa81RuLhRnC5jnli
 pgov8kPCoWODxuOzw1nCH8hspvLImcjTqX5gl3YrlwRcZ1HqIoOVN0b2JbSdAHxgMA
 USIfHF+C4MfAw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 03556A007F;
 Tue, 31 Mar 2020 20:03:14 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 31 Mar 2020 13:03:00 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 31 Mar 2020 13:03:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aT2GkYK8jEcOFk179a5Wa2Jz/QgySN8ogHpkq8B2MwMapa2Y9WuCXSD8VyEiQGHnRv85tfpsLXt6KbmxsPnd6ambH/EZZPXHT7aIvRCzTmd5m+EZnSJyJKX6yAdTLq1X1T7V4aRn+9z27mmM/r7UP2jnTgjjeOT91uffriXjCpTRLXIAYyh4PUtHb4Vr5Lbe6H4auuVotZGLk6FyScLk6p37QV9sNYSaLNi5GPOOyat7DfUhvpW6FlzOMHDMRD0CvD3fQjaC0DnK36jL+uYvnON/TvwYSaL5MvH3fMyni3BEfhPLErmguunA+QJd8nZR8L4T8yhIsrDF46UabNPRcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhO9spL7kKspIDhWMfySJmmi5vfS0oKwKB0PJm3byxQ=;
 b=gAy8bw2ZygISzRNxscOVvBg4Jez0oAL0VrDsi5wOm0NZFqtUvu4ac7hS/YfNakveSpmUdeDcuCAdn38neeQzpKEKMfLxTsPj9X9v4UCwZIgdyN2LBQP5IqtejkrO27jtfiLY62ujQAVS4+NM11J0tz2yq/VI4+aLvYRCtC/USSefsa7HermNd4CG6mEMpKcUQ84aRo5ax8yBO2eTzTjiyk8nGmJlu5gfaD3OVNrhFYEP1CkSKxdbNO/hkpb6zIxZ4DGKIl5KLIE2D8TdHYZi/17kKTNq/srur17EOHRTCoi/3LMwyMwtT+55b0Ows9/wtuda7IYutYvMSl1tgSo/pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhO9spL7kKspIDhWMfySJmmi5vfS0oKwKB0PJm3byxQ=;
 b=OxZxIeZE2gx3fL89pt5Y2sFFjYJkgoqFkHpQO9r+vTc8OBJMt4OA9ignAuf8R7H4zjl9Jy9JyyrViYPTelVjqAepz8wI9kfpMQdDb4oJU4OMEnWYIQaeir2K1O+h9vTCtWSF4/+TjpSIMHI9unc+O03HJzMfeoChp3g6YrOejUs=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2614.namprd12.prod.outlook.com (2603:10b6:a03:6b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 20:02:58 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 20:02:58 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fw@deneb.enyo.de>
Subject: Re: [PATCH] provide y2038 safe socket constants
Thread-Topic: [PATCH] provide y2038 safe socket constants
Thread-Index: AQHWBYDbfeMGxKt7Gk2A7SsJcwT4aKhjG/ymgAAHwIA=
Date: Tue, 31 Mar 2020 20:02:58 +0000
Message-ID: <dc454c9b-d947-5fcc-6a27-1e6da8faecb5@synopsys.com>
References: <20200329041612.4071-1-vgupta@synopsys.com>
 <87r1x8qpx6.fsf@mid.deneb.enyo.de>
In-Reply-To: <87r1x8qpx6.fsf@mid.deneb.enyo.de>
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
x-ms-office365-filtering-correlation-id: 6b0965d5-14cf-442a-1e06-08d7d5ae8244
x-ms-traffictypediagnostic: BYAPR12MB2614:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2614BBC903108C5DB8742A71B6C80@BYAPR12MB2614.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(136003)(396003)(366004)(376002)(346002)(54906003)(36756003)(4744005)(71200400001)(6512007)(2906002)(81156014)(6486002)(8936002)(6506007)(4326008)(8676002)(53546011)(81166006)(2616005)(86362001)(6916009)(478600001)(5660300002)(316002)(66946007)(31686004)(66446008)(64756008)(186003)(76116006)(66476007)(66556008)(31696002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0m+Aw9Ltv5dYZmGwin5Mul6bVAps0BJvdhmu7zzdvI8cJ4NeyyLFhQT/NIFadhk//8S1w1xWaTvEi5Qs+RotJ5825yGoW5i0gGA9xP5SqRYeEL0nrQ5nwGjddHgphz9upNrbBWVw0J1VEG+QCjLuPD2oTtMt515COjRLKyyWrirtlqXu+Z4faF4D22X0NrYJ3+ivVOktci6PEuhRyJjJtJMsEFnz2e4hk4fOZyyo+eLe+GyAAIcV0Og7VwTFph/h8laPp4tPjiUrQcACzBdZI740JQiTIg5MNI2dlnqtRv6B3z2bZ1NSY8lHNg4h7xrzfxDGCSzx0gVuLYhIfRNmqJ7/WxBAHB4zWFnKr6x7DE+ZWraTZQrkn91irzEjwprzOJ9bsqErzvVg9PvKhBE3RCY1RB9IZzUrEysE6XRG9SzenhPQehJfze4B6L/+USMF
x-ms-exchange-antispam-messagedata: IPmLRtVQmyWorssDz1yK1aNTo78ZNl+VQ0iZRpVvX1LPR/sm8E7RczAjmISeogDZeZ1ZzrYJCf5Nxq6mKR+IA5oZrAQbs3vZQdg6bTX7Dg7QfkATjfH+UpJtvCf8i4mJHHHnR4k+tRAzPUeMjR2yfBboUtw2DSed1DiwPhWYCkrqUfvcLuJ+qlkK7qFJ1UqqKwVlH4h+yVBhpDtgoOSiiw==
Content-ID: <949FA0C0E9AF24418ABB1B34DA196BBA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0965d5-14cf-442a-1e06-08d7d5ae8244
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 20:02:58.0753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lArJ1YOYNGReLrSjbHcnvCdsqQBUyq1THBzqLxD2Sl37xC4dQDxRFWTi5h9mbBXDkTV6salGDBMiNqXHsDFdfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2614
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_130317_853635_6C575F24 
X-CRM114-Status: GOOD (  11.21  )
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
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/31/20 12:34 PM, Florian Weimer wrote:
> What about the parallel changes to the sysdeps overrides? I would> expect changes for hppa, mips, powerpc.  (Not sure about the alpha
> situation.)

This patch fixes the existing/future asm-generic ABI enabled arches and the ones
you refer to are not. So IMHO that would be a separate patch if at all.

But if they do need fixing, I'm all up for it - except that I'm not sure if their
ABI is changing too. Which brings us (me) to a fundamental question, how are those
arches going to be made y2038 safe (me goes and reads the big wiki page)

Thx,
-Vineet


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
