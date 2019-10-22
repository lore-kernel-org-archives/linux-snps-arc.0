Return-Path: <SRS0=+sMG=YP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808A7CA9EB9
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Oct 2019 18:18:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56B0721906
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Oct 2019 18:18:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B/3P9Fp7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aSsACQeB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="GpFPLrJw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56B0721906
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhJ9+YMFXRF9QfObCLPxkugRI7dT1xbYBK4Eo0jurLI=; b=B/3P9Fp7oHG/3e
	L9vD4NnvKL6igHtu7uYCGEc7ZHXqXutcaJUacThvxVNCg6xmY5xBMX9WqztnR71i+Ep5e56fROrrh
	ocu5jsVQjBI1xBxPS/Ky/jnKVt6iMA7gSILprhspyVL81qWiYo77G8WOjnTD19kT/D39+N9GXxYYA
	DVuQTGcfqhntIzaeKqmM6WnnpGxRxNWg4g4QRXOWpRJ0j7jQ0FWrFCiMR1v36w2pA5h+FRVdklHbw
	AOGPZfUfhpRILof5pkJAO61s4tA6EqqEd/Fa4EvjLkridsanN+9ywh27iUqlZA8TZVDzI9y2Bvh+U
	37bfqRHLOu/RnyVgPLVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMyjk-0005gT-Ct; Tue, 22 Oct 2019 18:18:28 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMyjh-0005fn-JL
 for linux-snps-arc@lists.infradead.org; Tue, 22 Oct 2019 18:18:26 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 083FEC0D9D;
 Tue, 22 Oct 2019 18:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571768304; bh=zToi3IY3oxfmfCzRc1NxmttcovpjjMP9y86c9QhAh84=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=aSsACQeBNs4DWuWD/pedlw1VTv8T+VuYc6e/5sTjrT82JVXiJtJRnekBOx0410WMc
 RNdWjUHVn5LtExoVdCQsjLeIQqcT7mDxqecxyvh5aFiuVCXwbeJbecz1HjOydYW1BR
 1iMnckPPMSMpopvI+5UBNuFC7+A8EnIbStZqZH21vlmqWrN38owlhY3R0E3KWm+nC8
 nuta9ESOpWTOY3uLOUxe3JPIaGgazaifQzhvFifH5GEEWQKLSyoDryUjtfPTa/fjRm
 R8O8Yat+3q6dS92xmQVJbDZ1lHhQ0ioDo7PBnpYaI0WgQ60IcK3HmPZbsmXvSerrCu
 zgbeQqO58YTtw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 17BCCA0079;
 Tue, 22 Oct 2019 18:18:23 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 22 Oct 2019 11:18:13 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 22 Oct 2019 11:18:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7+sr43zlnDyIwNVFUFPpxkhGQajR2VuiyiQoTNDB5hdzUXadN7kseZ5/ezU2V2L44bNfqlerY4nrz4BwMimbdb/IaqCnmr0GqFNI9pIKhu6ZIdeH60YLTjcH1eo5TnzZNL7lqlyBrm22rWk6asrlQTRpbW5sD/D4exM3JduMpQwltKqhxc8PBl7tq5cEjJhxAs5qOJ6wVKjrnRWv6qrjtNVOWa4hy9t2rhEmiN8vF1RPmEj/UHX0Mde0eGbW9JM074tgmCNV2DhggCQdrqNeAOHDeliorqJcx2CvKpYwtc2mw/5Kz/UOHU03CN+ewl4+qPsvYgADm3eOGr4TP0wmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qk8gjchOrRTwSYbcsi6FIionwmWv68d/BGtBJ6zNszE=;
 b=lu5mZuSIBkXqip4GiDNvJ1Ex8T7uOP0wLjRNd3LAF1jIW2ernOYVAErThJ70MtsPFkXTn9PCAoybJu+pKbSNQFylGsXE2NBiYG9AcqVVEOwuktEXKdVa2jfIFDFnP185XMmsX1uzKSiENUDW0sWDgWdbYvOqAvXof0b0tyRULEOPRoUwHgoi+kvIMhEB5OSBb5DTCo4RJXicrTMJiew+NrOtEAHtD56MCadCblDhwN3B81AN/a416ghz47B/YiIzK+K5CZvxkf2tuoF0tIF5D9oFEBp5la6fyV7tvxn5P7qD0fdHUETx2lnPad/3NXAXuzpbx0AAaGSIvwmn8TlNfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qk8gjchOrRTwSYbcsi6FIionwmWv68d/BGtBJ6zNszE=;
 b=GpFPLrJwn3EjCb48KDyxp+WBNiwHRgRgovKWGnl0luHLYFd87bsWyngUqcA+A6l7/YsPX47Hjtoovn6D17qErgIPzb4Wt3n+lZ8WFU2+p8nVu7N+fKJT7W+oWNI/rz6+U3frbKgpGXlQUmIc/OBnQ1N7N/GB/Cj6fdQ3CP29AZU=
Received: from BY5PR12MB4034.namprd12.prod.outlook.com (52.135.53.73) by
 BY5PR12MB3668.namprd12.prod.outlook.com (10.255.139.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 18:18:10 +0000
Received: from BY5PR12MB4034.namprd12.prod.outlook.com
 ([fe80::4c78:47a8:8619:8e3e]) by BY5PR12MB4034.namprd12.prod.outlook.com
 ([fe80::4c78:47a8:8619:8e3e%6]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 18:18:10 +0000
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Vineet Gupta <vineetg76@gmail.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [RFC 0/6] ARC: merge HAPS-HS with nSIM-HS configs
Thread-Topic: [RFC 0/6] ARC: merge HAPS-HS with nSIM-HS configs
Thread-Index: AQHVha3ZlqV0AbnDN0aDV+m0rg/Em6dgvduAgAY9BHY=
Date: Tue, 22 Oct 2019 18:18:10 +0000
Message-ID: <BY5PR12MB4034AE62AA5C70794526A981DE680@BY5PR12MB4034.namprd12.prod.outlook.com>
References: <20191018121545.8907-1-Eugeniy.Paltsev@synopsys.com>,
 <8fd4f94b-c0e5-ed2c-ede3-5c4e77a5a0e4@gmail.com>
In-Reply-To: <8fd4f94b-c0e5-ed2c-ede3-5c4e77a5a0e4@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=paltsev@synopsys.com; 
x-originating-ip: [188.242.248.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb4b295f-2da8-4137-d99d-08d7571c3236
x-ms-traffictypediagnostic: BY5PR12MB3668:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB3668AE403B75C0C052936D0ADE680@BY5PR12MB3668.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(376002)(396003)(39860400002)(346002)(189003)(199004)(476003)(14454004)(5660300002)(8676002)(81156014)(52536014)(229853002)(9686003)(478600001)(256004)(14444005)(6246003)(81166006)(446003)(4326008)(66066001)(71190400001)(8936002)(55016002)(25786009)(110136005)(71200400001)(6436002)(54906003)(11346002)(305945005)(66446008)(64756008)(66556008)(3846002)(7696005)(6116002)(74316002)(6506007)(7736002)(66946007)(2501003)(76176011)(99286004)(86362001)(6636002)(102836004)(486006)(26005)(91956017)(76116006)(2906002)(66476007)(186003)(53546011)(316002)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR12MB3668;
 H:BY5PR12MB4034.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WpGyHZNvtR/SxrYvxCAnN0U8T0u4gKa/obEjd8errzf+h9APF6GIu2BrAs93xE0c3WNT0lrrJsMWQQa3JmSJNjqa2PICM4CPYwNHBqX0QcvTuRlleOWxeWTH5nmuUSSa+9SzKgOqq1UEpgCopLXDu6DuWNre8VLid8G3iEjqvViVUlRiclFNgIuHnagCFK5qffPZf/AK77vncB7LSd3YJVKwvzXDPIu+OBL1UuxeufTRxLRdMI4KZRly1yh5Dbw9QvC6CXGW2FVIuewxUUeXo2RnMjJzN8nzwgtJinkeVvzq4RDl5UCxS7qGIRLyAuC+TYon/oWbN9Q+L8F7dFM9PPwaPL1Ky2gXkAoLE4g9i4uPGpRCXCOqxaqrInlTFF3r3iaDNg0ropxrmlFYWTvfZGmujHdXeicwrwdGA+OZmzCJkpETLCLO8EDuUIu2hX8W
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4b295f-2da8-4137-d99d-08d7571c3236
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 18:18:10.8315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0HvafWE1h4l8A3HOv2e4tH471CdEkp3Zbqh0ijYvuPj+0nJxEhIUKXd81P9EKK0KS0kN5oK6JrvJ9UZdZ95NMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3668
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_111825_673669_2C537B8D 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Btw, about nSIM regression runs:
We are using UP configuration for all nSIM runs and I propose to use pseudo-SMP  configuration (SMP configuration with only one CPU online) instead as our main target are SMP systems.

So -
run our verification jobs on both UP and pseudo-SMP nSIM
run uClibc-ng regression on pseudo-SMP only

 Any objections / thoughts?
---
 Eugeniy Paltsev


________________________________________
From: Vineet Gupta <vineetg76@gmail.com>
Sent: Friday, October 18, 2019 21:48
To: Eugeniy Paltsev; linux-snps-arc@lists.infradead.org; Vineet Gupta
Cc: Alexey Brodkin; linux-kernel@vger.kernel.org
Subject: Re: [RFC 0/6] ARC: merge HAPS-HS with nSIM-HS configs

On 10/18/19 5:15 AM, Eugeniy Paltsev wrote:
> Starting from nSIM 2019.06 is possible to use DW UART
> instead of ARC UART. That allows us to merge
> "nsim_hs" with "haps_hs" and "nsim_hs_smp" with "haps_hs_smp"
> mith some minor changes.
>
> We eliminate nsim_hs_defconfig and nsim_hs_smp_defconfig
> and leave haps_hs_defconfig and haps_hs_smp_defconfig
> which can be used on HAPS / nSIM / ZEBU / QEMU platforms
> without additionall changes in Linux kernel.

Thx for doing this, I was planning to do this myself.

But remember that doing this will disturb existing nsim setups
- Our internal linux/gnu regression jobs one of which tracks my for-curr and will
  fail immediately
- uClibc-ng maintainer who also seems to use nsim AFAIK for regression runs

So we need to notify parties involves (and it would be best that we align this to
a kernel release which anyways will be next one.

Also go thru the github wiki pages and wherever applicable please add the config
info for nsim (keep the old settings there for reference as well)

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
