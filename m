Return-Path: <SRS0=VylK=6I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6351C54FD0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Apr 2020 21:20:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FDDE2098B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Apr 2020 21:20:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V6jF57gi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Fb6Lw+fa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FoAYaKrF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FDDE2098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=huoeEGxuVhkh1xYo4zfgNLemBkx+HGbIf9fKGcto6Ww=; b=V6jF57gi+Ly6KQ
	1l9pUXz40z1Axvt+yyK49KXdLvJuUkZxLBf1lT3GtX4KwHLSY5zEwLxvD8dqt5/ljR7h82G7uvo10
	9j25+jLXJdQI1pJcvutTpsGDr+rViA7lj2esISqtS1yncofQwtwBFZGuCXXib6qrAsidv9Sh7vT6C
	u5W7kG1zSocXwCor6TfiN8RGmWta19a9cFF2HYSMbA3hVoYQsI0kcr5ixnefcmKOedODh0OfbPeTR
	gq9b7IjhN418bm7Ppyy1KAdxuYDOSjeM6zU1je0WhuSKbLLSu8e+vfpEocbNrOmrKV2Sl2O4Wtp4q
	unjbYjECafxjSCXxMwKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS5kR-00041X-G6; Fri, 24 Apr 2020 21:20:35 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS5kP-00040K-Bx
 for linux-snps-arc@lists.infradead.org; Fri, 24 Apr 2020 21:20:34 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 013B34048C;
 Fri, 24 Apr 2020 21:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587763230; bh=YKwHvqjRDmKC89+TBqHXKF62woefMolRgKiXdIuDDDE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Fb6Lw+faKozXPchs7QeFA6R7z1sVZjAhMa9UQbNz+d44O+H++1TEXqgHqv36NTJHP
 IVHKWKcG8rvn6e4bbsg5l/tJj3rLZQKn9pe+DYxgFJzXJYdCHRs4oFxDw2YGBm1KCb
 4xwodmNGdpneVt1V7D7x0s5DSM7NdpDzsiDFjzCtUnwTiIGULp2bZ4wbhKSvQvwP9x
 mVq0AXJqsAjbQsvupAWiKxuWBqRorVbPsmKfvfENIBDQ03ZTtDvDNKuhVBwwFxwv9H
 r1lz+Y1NlpaVr8Gyv7/tA0ThO+hCg0E9DCP7yzvZ7d2/48nWMnn2s02n/+oXIZiQ4T
 NsBvOx0cuOjiw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id CCEF1A0083;
 Fri, 24 Apr 2020 21:20:28 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 24 Apr 2020 14:20:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 24 Apr 2020 14:20:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6JHMH9yOqQrusMCE/Y4epLERMel6IVRlPjdMCbWmJhU5hSKgE5CsmkOSWVlU8Nw1z8r0cfJPdB1eXZGjEYbSQ6CNSwRU6USO/gIoTUpykXF7MC40YL0h/lzDuotNREeYENLle98cNZ0C8kwlNubHqol/lUV0Bx0byslqUp8Y2m18LuFlmFo58xUi7H7bKmnplB6p5tD6AL1xGWHNrgD9ZmvfDG1UgwIincUOxMGZykR9tW5qQHR7nlXsRFZ3TiIQW9T2w75brhff0qq3fekhZyi3BofP4+qOHAxuxEsULCQHnfJwJmXGi8Vm240g14FJ0QNqB3UdAcQAnsltkLEvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xV+dwGfa4NmKd0uCh/1ZgMNd14y872vh1Npa20dyEwM=;
 b=gKybep0053pgxAhvK442ukuFPkKQqNgXhxRrXf5SmogYUu/CSGt1/rEyP2IBOcBTRpS5bAPXE6mtly9LCaHGxTF8OLRvNrAx8E/swmAyc2q2fh9RtUxnTPB5smMfbckZfkLtCNDjxaGItK9Y9f5oAzzm5lvcFpFL8DVWOlLICmSDhM/0oXsgWMxQilbsOfh+k61Sj30nGE3gWIDOhsVHZikiRpbTXa/0WJJKbsxhaFKEZIEKtmQS9Yhyqi76rgh/24s5z65gFFSZIG+QJmyk5qE0TJrEg8EvWymgiQQS1+K+ZE177p1wvLR/8uUNL+NsccvDjX9BI6XIgo/hulbCFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xV+dwGfa4NmKd0uCh/1ZgMNd14y872vh1Npa20dyEwM=;
 b=FoAYaKrF9eGRE3W4zoFgdamvfD+iam1nhNvOx0tTrV3LgdzTOVIwGHNOuFdDTy0sb7iXO05IUD3HUakc5w9QiMubJYwBX9GLvcsTsUsXPhj9Fssyg2mDuif2s8hqBEKAElPyu6U+PoI3O+sIo7j9LdVW3fgt+o/kuF2lsFqwgLA=
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 (2603:10b6:910:1a::19) by CY4PR1201MB0008.namprd12.prod.outlook.com
 (2603:10b6:903:d5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Fri, 24 Apr
 2020 21:20:11 +0000
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::8d22:7d25:8892:a09]) by CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::8d22:7d25:8892:a09%8]) with mapi id 15.20.2921.030; Fri, 24 Apr 2020
 21:20:11 +0000
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH] CMD: random: fix return code
Thread-Topic: [PATCH] CMD: random: fix return code
Thread-Index: AQHV/tYSWC5UhMzfgk+bsOjfPWBFNahWVCCAgDKpMNQ=
Date: Fri, 24 Apr 2020 21:20:10 +0000
Message-ID: <CY4PR1201MB0136999E9D65F94EDD586636DED00@CY4PR1201MB0136.namprd12.prod.outlook.com>
References: <20200320163817.8628-1-Eugeniy.Paltsev@synopsys.com>,
 <CAPnjgZ2nauDtf2Wa4WCSNaBp7wkmSH1NpNHmj5R7RX+RD4Wp6A@mail.gmail.com>
In-Reply-To: <CAPnjgZ2nauDtf2Wa4WCSNaBp7wkmSH1NpNHmj5R7RX+RD4Wp6A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=paltsev@synopsys.com; 
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17a81f30-510c-41c4-4ccf-08d7e895459f
x-ms-traffictypediagnostic: CY4PR1201MB0008:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB000852E040B5EE1AC30CABBADED00@CY4PR1201MB0008.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 03838E948C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(39860400002)(396003)(366004)(346002)(136003)(52536014)(26005)(4326008)(64756008)(66476007)(9686003)(71200400001)(66556008)(186003)(66446008)(81156014)(91956017)(8936002)(33656002)(76116006)(110136005)(8676002)(5660300002)(54906003)(86362001)(55016002)(4744005)(2906002)(7696005)(53546011)(6506007)(66946007)(316002)(478600001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: abpqryzKr+Djl+Hm3x/6M6Dx0Q8riGqmdC8/MkCT3pynGAFt3g7Rfl7H+zbH1Pci71/41G/bKw6v1ehBv7itZzhUlEVzrbW55eRC05B14JCSV0f+4mBUhDYNs9hZxV5gdJmzISUg6f/4chlLKuSPiqLa5+R1VMNyGTepNJc0w+fAaQAwS7KgtNWMuFW70o6eFmB/jkNzSTuCi+qvUbmQCC3JM7gA+EVmXe0xLq1kdsz5gjJ6Xbg+DOamPNz/Zoji0aae+QoLAslBVZlrrHWt1nEZ47Ftg+pQvS/HlbQdLrM0nQRYqo9PnNbmhPgLDPhtjpzdYwzkLG9ggC2g7j4XDPboEYppGaa8m8mBejf7CbudHbn8umhYWp7TAOnYpzRWcE/vURSHWKUS5S0T7xp4SH0nWaJUbDGXDFsOFKAVrXk38JTnnloMgxKTdU6gxA3+
x-ms-exchange-antispam-messagedata: 1OCxHESlCnROVJuoVwEPvN7C5ar1vGKR7V/Edt3+evlejGVR/e4TYnnhxVT+8enu/Y2x6ip0Q1hcTRRm1oC8l5jL5iCAJ79l45nqXLBUBSY6/1YEDNJkGhr9yg94RfVDD8TphqJ5QUtKkY72nWgPkA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a81f30-510c-41c4-4ccf-08d7e895459f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2020 21:20:11.0014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GoCBPOdxOJ4gwF1hd67MaRvv6jAfSBkiHTJdC+aXtSyso1UKO6Gku4/j7Ow2WGoJjLTnOnPkLkYIQ9oomBmjIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0008
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_142033_481083_AEAB1B2F 
X-CRM114-Status: UNSURE (   9.33  )
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "uboot-snps-arc@synopsys.com" <uboot-snps-arc@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Simon, Tom,

I guess it's perfect time to apply this patch. Thanks!

---
 Eugeniy Paltsev


________________________________________
From: Simon Glass <sjg@chromium.org>
Sent: Monday, March 23, 2020 18:37
To: Eugeniy Paltsev
Cc: Tom Rini; U-Boot Mailing List; uboot-snps-arc@synopsys.com; Alexey Brodkin; linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH] CMD: random: fix return code

On Fri, 20 Mar 2020 at 10:38, Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
>
> As of today 'random' command return 1 (CMD_RET_FAILURE) in case
> of successful execution and 0 (CMD_RET_SUCCESS) in case of bad
> arguments. Fix that.
>
> NOTE: we remove printing usage information from command body
> so it won't print twice.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  cmd/mem.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
