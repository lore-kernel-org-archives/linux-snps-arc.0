Return-Path: <SRS0=oU4o=3X=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB34C35247
	for <linux-snps-arc@archiver.kernel.org>; Mon,  3 Feb 2020 18:41:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48D7C20721
	for <linux-snps-arc@archiver.kernel.org>; Mon,  3 Feb 2020 18:41:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="grdmHJqb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="h3vvCsta";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="NMen1L7p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48D7C20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fb44ERPgOeO2Y/hEH54RZBkg3ISjbXkkXZcTSvbduRs=; b=grdmHJqbTwDmHb
	xF+GPMZeE4eXIn5BPoVY+yKULFaSnBxl4PZW79cwAbv667MG0M2umU/4oDx7XAw0Gewo9XiyxCNXl
	HUDXr/w+eM+ADs2m764AWPBhiKshHPIFtVhwTmax0KhsgP1PYpFoYzD40fwhKMW+So/LFJKMxc5dN
	i2QMD5eo4BsFav5XmuHAVr+7/IWofWYj+f3BFPXtla4Hzr8Kag9U3jIUYWEbQAQqjwBX7P6Lf/8ob
	9eGoumy2qwBfjYAyXsydsCAYnh7UiqmjXJVNFVs/IlCQXf+XNEbREZ11Uk8Us3SUvguUGWTu+6SU3
	7o3bQFuxWSLvAdtk0r6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iygel-0004Kt-Sz; Mon, 03 Feb 2020 18:41:11 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iygei-0004KS-QH
 for linux-snps-arc@lists.infradead.org; Mon, 03 Feb 2020 18:41:10 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D75DBC00B0;
 Mon,  3 Feb 2020 18:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1580755267; bh=xyazO1v1Rst24xDF8S1Nz/nJoqT+ynATv8zxkqgngiU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=h3vvCstaRcK3tr4EOsdb7n2W/L+MRUDO5bUK/GPFTpuQMGAE1Z8S4qT0wkcEd+7RT
 H43IoxKjUE1UTWfhU0+6oYcFvOh0gwU8nP0uOt6H8yb15naGydjqt6ZAEjn4AZ0JbY
 7TQ5VEAVb8DYIp5IhBzUhf2X7kKkOhSbmubKVMIqTgMWYRWahoGj6+/oomWL5C1pZ1
 Z0EdMOABaNRlK6R8qpar44ps83lAlF5gxCpO8vix2nJ3mVjYvjqbOiM95+NXYbZ1YA
 OZkJQq0a0AUmri3TnaXQJf3NtSGLqh2sAH6b/S9at6ODjE9F8cK3A+BKEvl/BIJFyy
 nusGvJhwIzijQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 467D6A0085;
 Mon,  3 Feb 2020 18:41:06 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 3 Feb 2020 10:41:06 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 3 Feb 2020 10:41:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oavfz64ApBtLNTMH1voAvfGdZYZaDKs7jiGviyL7jQ6kM5DRBjA4NyzapWiiUimD2X7DmyaWohan5LGDjVF7xNl2g1jdIHGJIJuUW/TEXFesxawP+ISS4r7M/s/HcMiOvgTQVtlyH9jK0NwGuVUFdoV93OFo/ZdsIYKCo7CASk1K/uDnT3gsvWrNOEAE2siB9WuT1v211WtChv81f0ZB5HZ9QC1GBsta3+Hhlra02GWLiYCHq3smvMySFqgys+wn54Q5HRXCekhlZb9HAHPbk49mcNwCXOQ2gzAu+XO5WjzOMvOB06ncSGSmmE0NCfIooL5ApvqrMxHovdf9fH/mjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyazO1v1Rst24xDF8S1Nz/nJoqT+ynATv8zxkqgngiU=;
 b=fWzJRADYpB4ShwEDSrN2WUJHGt/cM+gEq0md100RX+8wkU/pf56Jn9OQ7Z1lm5DLDyhZnp2sPSycsWwxj54AKatD54ade6svLZWKoU7+Yc/LW+PI833VUWe/yipTgakSU6ojQeNOjbLptwDTgrNcNj52GAtrDWSH51e331bJs5/KCI1q/3QuZvinlMZJZMtWDJeQAhqFZgk8smevwMfALNX1c6gpXNF2mM5OjIy4dhH/f0YAoFJnepHMUndhJcgetcyHq2Ma/2lTRk3A3m8YKAbj/pTT3vJHpIC3/d6bE2CPSvYLN1VOJyrgNqX/a5bL2CNxnhOHNfu+j5Co95so3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyazO1v1Rst24xDF8S1Nz/nJoqT+ynATv8zxkqgngiU=;
 b=NMen1L7p7UBiCrh0y7vauIDbIDarkQ36mwolOdUxGH4hxSqmkMvQozoEap2Tmba2y3FgcSEC4/20DA8Bcfhb08FxOKqlSq0Rc+JL4hUmVoI9JoC1RbOOhQIXPqFNZNqB4tOoh5ZSjRDyKmYDs9GgejFzNOOhXvmu0O3x0lYIn+Y=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB2872.namprd12.prod.outlook.com (20.179.91.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27; Mon, 3 Feb 2020 18:41:04 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2686.031; Mon, 3 Feb 2020
 18:41:04 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] arch/arc: fix some Kconfig typos
Thread-Topic: [PATCH] arch/arc: fix some Kconfig typos
Thread-Index: AQHV2KHypw3dLUwSbUm57lsiGJ4io6gJ0bWA
Date: Mon, 3 Feb 2020 18:41:03 +0000
Message-ID: <0cb45863-91b2-66ab-506d-9d8cd6b5c717@synopsys.com>
References: <cbd02a9e-5529-1054-957f-766072496009@infradead.org>
In-Reply-To: <cbd02a9e-5529-1054-957f-766072496009@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cc9d12b-1c28-4e51-6123-08d7a8d89fab
x-ms-traffictypediagnostic: BYAPR12MB2872:
x-microsoft-antispam-prvs: <BYAPR12MB2872E69D08CAFA5DDD462FCAB6000@BYAPR12MB2872.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0302D4F392
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(376002)(346002)(366004)(396003)(189003)(199004)(6512007)(6506007)(316002)(53546011)(186003)(110136005)(558084003)(4326008)(478600001)(76116006)(66476007)(66556008)(64756008)(66446008)(66946007)(26005)(36756003)(8936002)(31686004)(31696002)(6486002)(2906002)(54906003)(71200400001)(2616005)(81156014)(5660300002)(86362001)(81166006)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2872;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2zpa1HgZKvX151GVD/4KnKOzsf0WLLPUp7xjbMfxGRK0mTF2SBNI9251hctfcActsAvaNjIc9KQUvdjuRvNhhVahPQpK6vdWrjPy6h4xLarhRXS/Ibnmq0lOmk8D5HMo3aNq8ZPa3Drlkivw5tyJySE5OntFAdiKHcCsnNt5xzRB+rB4fdW4GRcV1pXCc2mcLIL1ejZn0hPADvA/MTJQpuOnck+y+hjwbMApvhCimy2D0Lxh1Dgy+kfKTGyQVruwyv/JeQyz4KPxng/wqDjgwj7IHPAa47L4VLFeTNSqyXxH9D2cUWU7gm2oV0NwYCeDK7ZxVPMTvVKQpX4ff0UxDQi8ESsCVfNN7fAvL6YQwvG7NKfh0zemYpHnVk/S8fha/dR0AVMwDsSAHSp9uUZAk0QwdH71hrUu5X5E67i/9KrN8e1A2XRGW1VsO1KVaeEG
x-ms-exchange-antispam-messagedata: EEJRC+oK9P7rnv1z3g2vgI3mbnmWbmmNQazdRH2bJunxgxHTTdW034DJ9fFAjvDLdHrs/mUelC8IXt+V/0C0Ozz1SOrNQuBgWzinLuReemp35d/uCFZbvZE03ktz4ucSXXRw3G88ySc+Y4zeQl12cA==
x-ms-exchange-transport-forked: True
Content-ID: <96AD5A90FE50C6419856E197FA7DEA27@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc9d12b-1c28-4e51-6123-08d7a8d89fab
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2020 18:41:03.7817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h/d3yGqevKJvuhr6YBoytCnMA2VPyrCc0vPv86crSMyLhW0AjNhVFUT9xWbPZoo/NEE2ztRhkzJzXI39kNYIAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2872
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_104108_965293_723802FB 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/31/20 5:49 PM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix language typos in arch/arc/Kconfig.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>

Thx Randy.

Added to for-curr.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
