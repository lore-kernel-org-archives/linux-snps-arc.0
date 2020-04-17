Return-Path: <SRS0=p2sK=6B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46219C2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:53:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13C292070B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:53:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P37hzWeb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SUNR/lXa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wIOLRXgd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13C292070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GjbmGUwtEIPLB6RH1KF7ckjrOaYcU8qGq9NITfEiiys=; b=P37hzWebBBxJkt
	DsGb53NsJ0ExqUHTuJv2z5pRBo5eDyykjJoX/ZlhnZilcTuNmTAxaeYN1jRqEWucGpkBzGUevJrsd
	IvSv/LfNHfq3f0c0eSvVk9Ja2D5GRuexYD5DfljjCdg1yhq06egsPQFdPvvLb/Ax/XKf1XTEDfnQm
	jCZ7beaFzYk57LSmtOVRxcFmaldmQVTyDKWfA63IduetRhLKw9Nv2/Kfmy+7ab2iHqPNedn5ovx/f
	ooCarxpd/BKgXO82r+vCOB6ulaiClhCyRkBWm4i2cOqOTu7vMJMZUax58ADs9P0qjXFHe39hjDhc6
	Aw29QyEASrlLnLft0h9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPanG-0003nO-6E; Fri, 17 Apr 2020 23:53:10 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPanD-0003mk-LV
 for linux-snps-arc@lists.infradead.org; Fri, 17 Apr 2020 23:53:08 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 522ABC033A;
 Fri, 17 Apr 2020 23:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587167587; bh=Xz4GehQIb/UNvrgYAVtY1obghODdUUKi12NrWik1UnM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=SUNR/lXa+BpDbRDkydID0dZTlQJ6CPxbrV8HuGmQPEZNFXAvxnzD79TVGyHbepHH3
 GwDZihRf8Uz+F/8oOzKLZr7FJhattu7I7ghj6E4EV6bdgQ6SIGU1qUq7w69xZf+1qH
 ss2JPFBPLDwmGMxv/B8Cv28wpo8vRbgGmhu93wEh8zceM0HnROFpYxlt4kAFlnIEEv
 ddVfvfwB8P9uRrZOgCPe+NGC8otJJWo9lRg5ffeUlvyesrzOC8Agb8gwG6wBmlAfst
 MrUvJHGgJh4v6Hz3xHBbxg6qXW6SrTOg4Ojaod/fYqO5ae68KuBBo4VOfNwrxKAa/V
 jO4vZLFjKfh9g==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 26214A008E;
 Fri, 17 Apr 2020 23:53:07 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 17 Apr 2020 16:53:07 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 17 Apr 2020 16:53:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fe2maBkm+8De3RYXsEL8TP5wo46SSU1qZIU3X8g0ALOKMEUr40o135l1JSxviGAwdlnSeTLmLTP0c1p+0N1EUVYwZWnewBVGCeolu/SMR2mc5f3BD/kfuo2b29n/xlNbhJvyGBeEKcaoPj+oCY2Mf92viQ0ulIsYFSpSWktGzpyJI1K+uhLPqg52jhzmMi/iNbUmvUNA99onYFe1/OawGEe5bCTy+5P45XGrAQq+NI5/sODJWnexI3dGvzUiT616v/w+BlgwCkRYcUgr6LH/fCjINuBBUCWSexDMFkp3Uq19sxaSK4JINhJHRzeo3qZEMWhmE3KalIDEAlsTY9pSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xz4GehQIb/UNvrgYAVtY1obghODdUUKi12NrWik1UnM=;
 b=MbcmXX2BWaB8rM0+ZIgaJne5rTCs6GD2g2/R6VwjFHkEkyriGqEGVtRKOX0sR+cDv3RASCuqWVbo++DF2A0NYG1OPaig8gUs/lytRR+7MrqVqpBlqN+qa0g4kiPDJTg8lPgJ/i6y1QqemwM3YocVsZ5BRWXA5iIfLr2D8Cvc08m2GHbADeYOLomkihhxGrohUM/Zh9NN9D8vLvmw1rCw8DkOBahfIGOr6zbZmM5BwcjU4IWC9ASlCw7gWwD+SZGq5QM6zjgQuCh+F3NYBzZ33Cq+yGVdYHZNDEfbixoqsA/a2Ts/SL4MDPl+LUe8/rW05sWlGFD3IzZFQaNDDCF4QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xz4GehQIb/UNvrgYAVtY1obghODdUUKi12NrWik1UnM=;
 b=wIOLRXgdRzNIP2cR9Jk156EvkAYBoMItAHfPbvJfuVKAV3YHAqKJcWaq5z0QCsnmPTWhVUcTVOjnWyIgwXceygPN0dtggAFvREJrCTOtfiVV4AzBRaHd/6uooPntWO7YvpReeL9DhQHLRYjI6jfBjY9r4jiyWujLUHJ7oS3aHlQ=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3367.namprd12.prod.outlook.com (2603:10b6:a03:d7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Fri, 17 Apr
 2020 23:53:05 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 23:53:05 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v5 11/14] ARC: Update syscall-names.list for ARC specific
 syscalls
Thread-Topic: [PATCH v5 11/14] ARC: Update syscall-names.list for ARC specific
 syscalls
Thread-Index: AQHWDhqN+owQdW7RZkuXcxpDvGG9QKh9/U6AgAANKAA=
Date: Fri, 17 Apr 2020 23:53:05 +0000
Message-ID: <b763c8c7-470d-c22b-52b9-76c29f414e44@synopsys.com>
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-12-vgupta@synopsys.com>
 <alpine.DEB.2.21.2004172305550.1082@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2004172305550.1082@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:c8eb:6ba1:57d7:7e16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89bca47b-a209-4f1a-bb1a-08d7e32a7930
x-ms-traffictypediagnostic: BYAPR12MB3367:
x-microsoft-antispam-prvs: <BYAPR12MB33675DD1FA5D829C051EDAB5B6D90@BYAPR12MB3367.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:390;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(136003)(366004)(376002)(396003)(39860400002)(36756003)(6486002)(316002)(5660300002)(71200400001)(186003)(6512007)(31686004)(478600001)(54906003)(4326008)(86362001)(6916009)(76116006)(64756008)(53546011)(66446008)(6506007)(81156014)(8676002)(66946007)(66476007)(558084003)(8936002)(2616005)(66556008)(31696002)(2906002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UYwGDXi1Ts9hT0pqd7pknDS+veps+fZpSPRRasCX4Gym1rTN/3g4OhfqQDp5fKMJr8/cRa8hnax6SDXO45rJoOAWM3Q+hvlZGpPhZGGxjK//cbuAPYKA/sDsUy7gdRZCD69vBB+wv4eXGP1xjKn1bVfON+OdSOALRyqtJoVQttT1OPpDbqQHp7Cbd46H46ow0AJfXvgSeVHaHWXHxG59D/tlDUSW//iwx0i2tTBelh652tPUPws9CizSFZxS0Bi1l9il6XKsEBBAgWsgTTl6AxuxL8DgJM59xKKyWXTeyae52lwl6UiRwjgtH4VaZ8n132CpEFI02MdS+4KvNK4eOM05BjsN86qUogqTc7qlxL0miJPJ7n+J2WaTwbWhKWkC6ZJmAauYfBUQsQI2u2enQ+/zcBfX2BfOPKLrnj7fimZi/CkzHKHXmeOqWgNwPwfb
x-ms-exchange-antispam-messagedata: w7p8Q434cm+XVE8yDu5YOVR2oHV8hM9Md+P8t35qbpmfGk+AWotCBduUvWkFAYsLuC7AA15KYAiTPZIWXbdVc+8wpNL9lp3/9KuVvfPs14WxnFffCWU+kjE8ONrtM/asjNSYldxXfMOI2TZemvKmcggn0ymz6JEeMNh7llFWU9qeOj3E2eDKxP6lPKolNiLEax8YtMeDQXKz6CBD7HqRrA==
x-ms-exchange-transport-forked: True
Content-ID: <22E067F9F0380F438F2B0E34E06A316E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 89bca47b-a209-4f1a-bb1a-08d7e32a7930
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 23:53:05.5584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: be54PLUeKxFEbma/Ui2nmd8CFhlWj9HtDHQ+83pQEERlf/vvvoxdGwlSp/KcjKSgDOMceIl9l0Lp7dP0wlTuig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3367
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_165307_765362_79E09383 
X-CRM114-Status: UNSURE (   8.99  )
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
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 4/17/20 4:05 PM, Joseph Myers wrote:
> This patch is OK.

So when the rest of port is ready, this will be part of main commit ?


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
