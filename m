Return-Path: <SRS0=Gpdw=7S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68F4C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Jun 2020 18:47:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C871206FA
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Jun 2020 18:47:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BFOJ1zps";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YLqYLCAS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YqUaKyrA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C871206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0h6+CZAVk5zh6d3Ewe22FUnaNoG5WyYb60P5aTD75b8=; b=BFOJ1zps0252+y
	12pbUs5U97JEhM4bCO+BTbEN0Q+/7cLgq+aDzoY9NZtue9yCCEjxgamUq98CwhZMkex6d5Bpbgh9A
	jzdObeC8yMuQKlH2wUd4FAWfvn8SzLrJO53NaLH56FB8n+LMJVBdL/t2yxLV7QX4pVen+SXJ+V4Aw
	XfpGAA8pjBes+ZzVn612tyTkxUD1StAklv5lhFzebCh5f1mYdQo0ud12GnQB4eQSf2QWtwIMWvqDK
	snPnWUY8tP+6nu/bfV6lGLCQYg2+q3fACSUT/bBPhHSgnMF1mq2FvQq0tPk8DjrJ1uhavZbT7ysef
	1GQaWNPxIrL4sMWVYroQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhHN5-0007hI-M3; Fri, 05 Jun 2020 18:47:15 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhHN3-0007gk-HU
 for linux-snps-arc@lists.infradead.org; Fri, 05 Jun 2020 18:47:14 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5A57440235;
 Fri,  5 Jun 2020 18:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591382832; bh=t4wIIcTN9YyAsN/lYSUh2O7MmESzPluBoKAyBdIS7d4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=YLqYLCASZ7T+pGM74tliF+UgTwASVwQdep1SmHPkgT+OebCUEjwsVYs5XdqXxLQBQ
 7rQ+0PFYx5A1WxyqXSarDK+fLVkd9sN/9Jna6HSkFSODNq6YFHWI6vl43az+zUdgiq
 km7B1QDrVvINfNkaENnE3TGkNrx10LRIHqSBQg9oO5gDSU2frPVc83CqtMyeSfqlfr
 XGPRWG+g9pD84DSJZorJjtnRwXVniSVaX8CLKfFTi+V+DqIKLFQMUjWXK7feD+yZ0P
 fAA1ThJpXkEBvngIbOYBMijEAYrL35SJOE4VeIqbn1WHFfI9d0mttRfTBAwIOoYz5h
 48nEegsBLGP6g==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 14A29A006D;
 Fri,  5 Jun 2020 18:47:12 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 5 Jun 2020 11:47:08 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 5 Jun 2020 11:47:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7EfzL7OZ4rjpSFK5NtMcWOkyv3B3x5n5Buk3N2cAXNa9tQPy6TLZLY3Wn3n/SLFcUFvq7aGCKDB+VmHXmPdeC9fWcRmww9U3lM3+O5wiefm7RYwRGaMBO1SPiBBBKPa4Az9kEXXds9/q7ZxIfQzrl6wfJVTHCytuevWF5+a77S1n4B6bix5xCXtgAdmhMbj1tlmMenk6zBfWikN5vEJdLNz3x/h+LyEdA8n5gqLkLkD1nfsv6idsh6iDvt2en9RhjSLOs7ahGmyqdH+CIN0WFov2tpAOypOl8JmzMVuG5sUKsEeL6rPYP2nSustoGSh68obBy9fV1mrw1d9tzQnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4wIIcTN9YyAsN/lYSUh2O7MmESzPluBoKAyBdIS7d4=;
 b=BXHYX/tDSdcCcnTfxQomgeTTNPUoI7XRQEjLMWmsPMH8zLAYRJmI3PXnP/7+erI8cX8yugiUIqSMMAiMKzFTVbJoMaYpq+8GJlbMnvwTuF/zgfOF+8bb6Tp1pji8NEmC3xDZFRRoTWumkuq8IGMpmuPGTj3T9fqYOGS4uayELTiM2Lu2QgLsIwMpSnPyycaLdieQ5XXZ0gKzp9v7aJJUHLrNieNwR9uOrYUaaDPRN0oab+/TNjh3YxvPImTNxNLccv/TR1mmvQX23HDvs25XoQaZtp0FWrAdsjC1FXQja0ag9qEc6p+p5QqXTIi7mumuFd/RjM9Grf8MsaNptI/k4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4wIIcTN9YyAsN/lYSUh2O7MmESzPluBoKAyBdIS7d4=;
 b=YqUaKyrA/98SPwT64oAKHLhZDNWVwN1GaNtTN1+/NTHP1vuyyEOxILq7RoJO35Q2D0Ls7tLVNDZ06uNwKwutE/eyvNCI2upWlE6vebdsHBfxMTru+zZ4OZp683EOtRxgmICbYajgrjwhYY0RViClyXl/guHa20aYKppWBXRsNKs=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3558.namprd12.prod.outlook.com (2603:10b6:a03:aa::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.22; Fri, 5 Jun
 2020 18:47:06 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 18:47:06 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v2 0/2] rework dl-runtime: reloc_{offset,index}
Thread-Topic: [PATCH v2 0/2] rework dl-runtime: reloc_{offset,index}
Thread-Index: AQHWOGKkH6R06ZoemEibB4tJp/nroajKYqSA
Date: Fri, 5 Jun 2020 18:47:06 +0000
Message-ID: <134440dd-aa60-7c2e-d7c4-c3b7a91b229b@synopsys.com>
References: <20200601221823.17861-1-vgupta@synopsys.com>
In-Reply-To: <20200601221823.17861-1-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca730d3f-830b-4de5-0590-08d80980d861
x-ms-traffictypediagnostic: BYAPR12MB3558:
x-microsoft-antispam-prvs: <BYAPR12MB3558A47E1C82EC4CFF0C21A9B6860@BYAPR12MB3558.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0425A67DEF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pmL/j7AQi0Mi0K5tAbL7uUznqJawEgTgJa6z7jy2MkRCq7Bq+FMC89hoj1VIkynUJMK5K42bx8RobpJ5T3HG1POzlWwbo98D/9PpQzJabYhGwBxT7lHnaMU2l3t4siTOmCb62LhjxFPcR2HBuxM5K3fLekyCVJ85O1n71xCi74nEmLkeqha4YbFoHol5g2k0TsIU4BRmoQNpgOaoQAwAJFQ5RkVqi0o6X6XQht+J9IhJArRSNJ068WzVhfBPXxdtKOVtXzIu5wqRixReAGwLcc9ZJwV35JwFsZbviVlsCwGiUIbt090o1assTGxxnhutdxdqhqaNbNS2NTjq4cRulqFrG+g/R52U6qBcePYYDFGXWkj9E66P1Ayn8qDBPMaNedwFcgeTVG/RWYMKyVPRz6JY/HtMp4NCbACDyNUtvsk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(396003)(346002)(366004)(376002)(39860400002)(8936002)(4326008)(31696002)(86362001)(6512007)(36756003)(76116006)(71200400001)(66446008)(83380400001)(66946007)(64756008)(66556008)(66476007)(316002)(186003)(53546011)(478600001)(8676002)(2906002)(6506007)(2616005)(110136005)(4744005)(5660300002)(31686004)(6486002)(142933001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: yDQozhhDLQzXVxrA+Q/w3gZbBpiV4r1MnuFUAQf8JOaHfpxQBCkxAfSx8V0AYoqib2r11rO+CGEwg9Q6CmCx6ABbAlv4i3Xsd4TsJhVscSmVGwTvZmFUsVxnws7Rk7sE3zTf/hKKwxxBwds2g2SzSigIBlA3dL0pZ/rKPq9smnMptunemjG1Oik105DaKDuCW1IciExR2K4lB1CY7A8xmQjAqtsinT+wK6FQiKGDODrSlSwbxPGJTLwRpcgI/LjooKcYg2gqYsmPz6bQOSBQDBvd1fel/8Oja2IQtlq/ToecUJJWOoFQ+S9VgGcVZdWlNKU3oCA284zgikHjZmha4JYrgJf9U4rWvSbtwKjpb6piIDx1u5fHec1RTiXpDQcyhkSncf1byLCsQFAFsFMtOAi/UVTFUAMaHM6VWdouoPjJKgT+js5B33MSEehdncopNCOQv1M48xw00JmYWk4vpW5wnRf2mkPrsVDbXoq1Mfy6Jp6QA2EvOveAvPxAYW1nmAcRaCxFkiYZWLR2+pe9HD3r4FOni2t8CFzvVid6VS/3MfgD97CZm1/kblL2S73M
x-ms-exchange-transport-forked: True
Content-ID: <3806363E92AD9A4C8AAAF3B790E1713F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ca730d3f-830b-4de5-0590-08d80980d861
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2020 18:47:06.2356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBh4rXUf07sfIVwAVSzXanZBSC4Q84BTq6yCAQyLacqlzyPktkO4CJIdRnIF21wGPdE40xh0NSZeD5DlE8Jv/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3558
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_114713_646969_7F9667F0 
X-CRM114-Status: GOOD (  10.03  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/1/20 3:18 PM, Vineet Gupta via Libc-alpha wrote:
> Vineet Gupta (2):
>   dl-runtime: reloc_{offset,index} now functions arch overide'able
>   ARC/dl-runtime helper macros
> 
>  elf/dl-runtime.c            | 28 +++++++++++++++----------
>  elf/dl-runtime.h            | 30 ++++++++++++++++++++++++++
>  sysdeps/arc/dl-runtime.h    | 42 +++++++++++++++++++++++++++++++++++++
>  sysdeps/hppa/dl-runtime.c   |  4 ----
>  sysdeps/hppa/dl-runtime.h   | 31 +++++++++++++++++++++++++++
>  sysdeps/x86_64/dl-runtime.c |  9 --------
>  sysdeps/x86_64/dl-runtime.h | 35 +++++++++++++++++++++++++++++++
>  7 files changed, 155 insertions(+), 24 deletions(-)
>  create mode 100644 elf/dl-runtime.h
>  create mode 100644 sysdeps/arc/dl-runtime.h
>  create mode 100644 sysdeps/hppa/dl-runtime.h
>  delete mode 100644 sysdeps/x86_64/dl-runtime.c
>  create mode 100644 sysdeps/x86_64/dl-runtime.h

Apologies for eager ping on this but this is in the way of respin/repost of ARC port.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
