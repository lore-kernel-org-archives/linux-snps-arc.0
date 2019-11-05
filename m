Return-Path: <SRS0=vqj4=Y5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D54C010A3
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Nov 2019 10:20:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE8EA217F5
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Nov 2019 10:20:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q78QkCn6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hGHKm5SQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="BOLchPGl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE8EA217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9icV0nYrqRktEuUv57ffdPy3H2uqXd6YaC5nD+udasA=; b=Q78QkCn6YQrlux
	/0js1TqYHYYHQ0YbDusUm4aVZ27ZxfHJmQf3YzbUkeWuwYu+gZp7hz1ijU+xJF6iz1h210lDWwkJK
	D2V3RQB82Qbfz5xRUKQsXiYz6dqWdS4K2h8DO7xgwm7u6L2SWxuLFFiTpksWb3YQa3LFQj0AQuliX
	ksRlceqiRboxj3MQ4DqANfBLz7AU5HsjiZxv4ta2gsWxCKRI2ba5cQUJxN41yNPw4tPFOwZv5pZ40
	drY3pHqUn3RMOfcLqMOugCurpYy7u8VGzAHUHpyn2MeHqm2mBzVyLtJfWJKk0Kw2RHpw727j5Y5Fy
	HxY4psSR880pVwUSFkQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRvwT-00075a-Pd; Tue, 05 Nov 2019 10:20:05 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRvwQ-0006Xp-EY
 for linux-snps-arc@lists.infradead.org; Tue, 05 Nov 2019 10:20:04 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7696FC039B;
 Tue,  5 Nov 2019 10:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1572949196; bh=lurKW5PQ6NOUiQk5vR6KzFrBmxixvKt2AgTBbGIpMBg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=hGHKm5SQCTa/DuviZdxwUHybRjO0z78JBp1Rrw9VQY6WToHDvz17/9WRMUcGp/DKq
 0gpT4s90kHMmW1FTB6d/1G7EDDf1oAf6nq0NbDm225CWuhKUEmKoAmw4NDhkxAPoYN
 YShND7KJ9YhN7w2OL/TP8O2F+kDCvkycbnRAdkL7gEfuKz2DYDaKS2mDPyBUjEu8mf
 y1Z2EJJpDVzXqlro4UpTVmRPh0ClppmmxLlnCz3L52bOOaof3OeSw9Pw10yI1MzfkG
 4ElRYHpexqJv0uuz6E6DKxH57mvrgdBeoNDuiPtm3u6xj8f0SIA9CdI693L1ZKDg6B
 +g4tfU1vb/f/g==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id F0D11A006B;
 Tue,  5 Nov 2019 10:19:45 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 5 Nov 2019 02:19:43 -0800
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 5 Nov 2019 02:19:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7oucCMlzi4vqHs7wEI6AlP+j+eZtaFl7xO/0aE6iV4LmMKz+F7rmBA7sOtoYW1fNNSggVphfN2K7y3IePU1RFH7S4t5AIN96LINNrldsv/LpTDUNIhWgeEK3KoIeRjRImKNeS4Q0lA/dcEQW7+QuWfRZ6ZQ0+Ea7wKokKR7FeK36QwIghCbwqkzpiSVnKafclcy1RcP8VW9Me36emHAJt0O6HGyj2iVcMV2oNeBk7r6PtHgCjD+EYsJNkdJjshoMjDMsMHspK5+gwiHZ/+0cnm/70w89fGk9qidjy4LLp1rLkC/9IbazFT0Q9s7j01PYx3OMTB81JkJtM7cze5ytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BORNmPW4SwqijOeyERmmvIdK4wSjo6hrMJoMxaj8DZs=;
 b=Dl/8l3JMT++UEVuTQrBC8R9Ef+14RAUfVpxbjW2zVQq8l1HxVdYldf4pJOl8CCBIl4MVwJBZeK1+7hE6fBcLoLLrkF2lLAsVoaBTngFFQ7owVuqAT65SZYHc9iiOcaTzA68eUiaa7wkRvh1QoGoBH/Aiai+tBFjk2vfRZYLPSBxQ8uq4HWu2CgMMkLg2A2yO0gBlYQJ9ewZeaIesPzYoZiOA9+z5Z9cPOaiHXI61A0v9Tw+yRpD5EJx32WYNN7Z/Vpm2Qb/J9wZlXynjFLpT2ftzZH4yitfnyVvJ7BfKxv4MC5rcbTjttWAjNeSMhelOWrH0kT5lLAXz88ToAriFqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BORNmPW4SwqijOeyERmmvIdK4wSjo6hrMJoMxaj8DZs=;
 b=BOLchPGlIhH3nJnJ2ajX29yIHYVqBdVPYhy7UeMvqJsE9VIlTjDjMHAfmuh2h+6RkwvLvPXe17UZe8FADA9NOiLZE2PonCbIuW6WOeOVkXIDIJ5kpfyrnJqxS97c2FKgky93dVYhMqEbAeIDCOza9GNqveLdj1xJwGlsP27EnQw=
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB0181.namprd12.prod.outlook.com (10.172.79.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Tue, 5 Nov 2019 10:19:42 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::1487:2d87:9871:3e4]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::1487:2d87:9871:3e4%11]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 10:19:42 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: RE: [PATCH] toolchain,glibc: Allow ARC big endian glibc builds
Thread-Topic: [PATCH] toolchain,glibc: Allow ARC big endian glibc builds
Thread-Index: AQHVkOckYu/PLZrFbkqJpwuoGRU+wqd8Yt/g
Date: Tue, 5 Nov 2019 10:19:41 +0000
Message-ID: <CY4PR1201MB0120ABDDCAB8033A0268CDC1A17E0@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20191101190337.13411-1-vgupta@synopsys.com>
In-Reply-To: <20191101190337.13411-1-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
x-originating-ip: [188.243.7.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9bb827c-8db9-4c22-22f0-08d761d9ac36
x-ms-traffictypediagnostic: CY4PR1201MB0181:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0181170C4582DFE7C15047A1A17E0@CY4PR1201MB0181.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(39860400002)(396003)(366004)(346002)(199004)(189003)(13464003)(476003)(99286004)(186003)(256004)(6636002)(81156014)(74316002)(66066001)(81166006)(7736002)(305945005)(33656002)(71190400001)(54906003)(8936002)(71200400001)(486006)(446003)(86362001)(11346002)(25786009)(478600001)(6246003)(76176011)(76116006)(316002)(4326008)(6862004)(2906002)(66556008)(66476007)(66446008)(66946007)(966005)(64756008)(5660300002)(6306002)(55016002)(9686003)(14454004)(7696005)(6116002)(3846002)(6436002)(8676002)(52536014)(26005)(229853002)(53546011)(102836004)(6506007)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0181;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xRG0HmE9JIm3H7Fu7InvIGqggYElosh39F3sZPSe7u3hnKxkbdHkt1sH4dpwA6rjAq4tIPxtowgmGykgyGAwkiUoUYB3e8RS8sqNQpUYTPRlnqRvaVdYY+sW+i+XCesKSvhekvc1PSWM75WaM6kLPx2I3/xLdy+5wGjsWrjFZ5N3NCvv+JTVWghm7oGmW4jOgDurXYElTk651PJ59s7geWJWKx/avqO0Zt/V1Hso4432Hp/Ux8kfgDFZAOhgBBCndSrbxJzg9cHCBVoQvcdgvgTaxYKhrWMXBDukvJozfs1bSyEivwpWB8ucmIMmaLqHL7Dm7zu7SMyzuqNC06xQffdAPRs+22Ejx3vjpYoVXdl8JA7CaTCIoFH2zfR66xwsak2MO6zVv06+sE4qbzv3xGPYby928pkD1xM9Ed2LpYdUj0T2VOpowRrhe6GzD5i9L/f1M4DGSkvHa+acgKUdh5yMZQaVfNZTQvQuuZRmxEI=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c9bb827c-8db9-4c22-22f0-08d761d9ac36
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 10:19:42.0251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dIA4csXbHE3Bdt4K9h0jePtPvpIjy9psfLV0WC7kkk1ovQfOs0KUjL+9Tws/kE4+1SxTuOHJWYSh37bZlEwhBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0181
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_022002_621474_9EF26067 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 "buildroot@busybox.net" <buildroot@busybox.net>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Vineet,

> -----Original Message-----
> From: Vineet Gupta <vgupta@synopsys.com>
> Sent: Friday, November 1, 2019 10:04 PM
> To: buildroot@busybox.net
> Cc: linux-snps-arc@lists.infradead.org; Alexey Brodkin <abrodkin@synopsys.com>; Evgeniy Didin
> <didin@synopsys.com>; Vineet Gupta <vgupta@synopsys.com>
> Subject: [PATCH] toolchain,glibc: Allow ARC big endian glibc builds
> 
> Apparently big endian glibc builds just work, if we let the endian
> header allow that (which prev was #error).
> 
> So this patch bumps glibc to version which fixes the header (this
> hopefully will become arc-2019.09-release) and then enables arceb
> in glibc toolchain builds
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  package/glibc/glibc.mk                  | 2 +-
>  toolchain/toolchain-buildroot/Config.in | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index d46063c5d111..754408881397 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
> 
>  ifeq ($(BR2_arc),y)
> -GLIBC_VERSION =  arc-2019.03-release
> +GLIBC_VERSION = ec681dddfa99894513c85da7d5d257b60d04f915
>  GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
>  else ifeq ($(BR2_RISCV_32),y)
>  GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index c0612bf04176..587e097a9c92 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -48,7 +48,8 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
>  		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
>  		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
> -		   (BR2_arcle && BR2_ARC_ATOMIC_EXT) || BR2_csky
> +		   ((BR2_arcle || BR2_arceb) && BR2_ARC_ATOMIC_EXT)     || \
> +		   BR2_csky

I guess here we may just use "BR2_arc" which is set for both BR2_arcle && BR2_arceb,
see https://git.buildroot.org/buildroot/tree/arch/Config.in.arc#n54

-Alexey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
