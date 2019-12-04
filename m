Return-Path: <SRS0=xP+w=Z2=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAEAC43603
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Dec 2019 23:07:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F36212073C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Dec 2019 23:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pIvzGI9N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jPlXAlOk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="OFSa3lxM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F36212073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmJUUln9w5qjkkZZieySm0GKdF6tGSsFnmnsOcWHML4=; b=pIvzGI9NkEc8MM
	1P2Q7bB5h886vOOudy4IDwcqplIeo2xOzm+GwrIaalzwk+LEOwJhDPBJMB33e4uRDR4L+j+b/V0QG
	/1yhD36HPL6WpDS5aO4MHBucqBUtPYW8w43I2DOgjWtHktpTv2CgJnCyNzO6SWinmTN8MUINcYWxI
	mdWe+Ec58adf1LV1Jwsc5CkrIGQSTAMfolX4toEvS7BHh8v9uHL/V2uTOA/jvPZcYxgFRr5psheVM
	7Cx+CuOke+T+EIAf+OkxwiCrEiMM4XStHOJs1bNPgArRemZUfWWmzogi/QS0DI7IvhvY2HffIRPke
	XuBlc86b1BYgII4/AEOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icdjX-0000Sn-NQ; Wed, 04 Dec 2019 23:06:59 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icdjU-0000SI-OX
 for linux-snps-arc@lists.infradead.org; Wed, 04 Dec 2019 23:06:58 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5EF24C00E1;
 Wed,  4 Dec 2019 23:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1575500815; bh=98ZPTW9S1ijB5ZSbMpKDKBTPskM5yToFcc7vn8fnt4s=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=jPlXAlOk5BHBBV2nU5VzzI46ftSRZxxsprKMqUdPeoH38tIWv36hUTUUZGZfAS0XD
 REJr+N0iNe1WAwgbD0gcSH//3FbZWwyetwBcChvqsr/YP3ZRaqW/GC6MN1Z/2bVfbT
 kcFfEOQ9NHUUT0hosuqyyYcWRxB1CG+G7VrZAvgCVjJb6IuSCW+JXiC9vgjlYJzUht
 qM3oRUjaTLMKUknK1Nab7fFhALHlduLYMtIHcd2N+bXth7fZ65WMlGSl6KuCowSCWS
 Bd1irKehkjKN8HsthXUJ2ug0HNboeq1+QBEDwsWRpo1UUbUCO6LHUtwENAV7s2aBKK
 WtklwHN5cCYZA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id DCCADA007F;
 Wed,  4 Dec 2019 23:06:54 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 4 Dec 2019 15:06:49 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 4 Dec 2019 15:06:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+2O+1jvWEE6Nb8EQxEC1Ba0QLCBNDI0kKvOKwezUZde3MsqF4Uj++ZyGcjvl84Jeib2iPc3H5wxVtH9Wmwyf8fF/jOvquJBcef2qKg0E4rhlDIbNmoa9QurdcnIZhHHPDkPIdV3QRsVNPDRpOKZW61kr7LuowyErnXENNRgokklS0r8YNQI06kRP4nxU7+EXmnMIynu0Co+/d+Ortyigr02s8xtjKY2JyBMhFOdwRAAlGhuXHhd5Idx/BR7G1SbIePpbD8Wcib3CeeMv+jes+fho9q5P7+wYWq5FSRRTGHwGt/Sb48lbVgV2X0KX/x6RWtg2zYsFZwamsyPcBMwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98ZPTW9S1ijB5ZSbMpKDKBTPskM5yToFcc7vn8fnt4s=;
 b=W67UsjKr1rqGc8kb8gh7MLPpZjk+i/pERSoMEec9Ts0T4vET3+uR+caykm9oKklP+AeF9uYbVdXVup55SBT8S/UMmve+Gtn39s/WqSzG0eJS8NL9I5zU6bk5Zd+F33grUBAKz2JtTYpJe9ZxANPxeWvVDtP/DVrk/hl8L+kG9h6IsSRS4ihdQdZVkRWUwTAUWwMR6Sg03I5FvBHhOdGyOlS7rnOYgi2It3Hij4uynNRe3ZOkv24t3/+BQWaIOnDivUFu3SwUpZRBBEuWpECKeCKBSi/G0M8gSdGVY2uBDwSqS47Ilu+X5rzFrjdNA2qsG2Q8lb4GhgsXulEv0EuLdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98ZPTW9S1ijB5ZSbMpKDKBTPskM5yToFcc7vn8fnt4s=;
 b=OFSa3lxM6dJoxBcZr5WUmXOUuVzgXugY+VDghQblx86cZDVgIbGG4F2SYDzJL7K2/VMa34oUzq1SCaOZbACz+wYpZQ29tfda09qpAcuNtnNXVaeRHCCJ0MQgn5D9mDGIW82voGx9nih0ebI1HQVRtf3o4olQtzePojAKT5xaVMk=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB2949.namprd12.prod.outlook.com (20.179.91.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 23:06:46 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::19d8:78d:d881:c8ef]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::19d8:78d:d881:c8ef%5]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 23:06:46 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] arc: eznps: fix allmodconfig kconfig warning
Thread-Topic: [PATCH] arc: eznps: fix allmodconfig kconfig warning
Thread-Index: AQHVpMWj60pkQr0LxUy5lY9mNpUsd6eqpXaA
Date: Wed, 4 Dec 2019 23:06:45 +0000
Message-ID: <bdce1637-1046-fb21-3326-5536c59c7ff8@synopsys.com>
References: <7f2e6690-f377-86e7-6f56-e85d8d4d22a0@infradead.org>
In-Reply-To: <7f2e6690-f377-86e7-6f56-e85d8d4d22a0@infradead.org>
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
x-ms-office365-filtering-correlation-id: ee6e7920-67e9-4fdf-a2cb-08d7790ea2a2
x-ms-traffictypediagnostic: BYAPR12MB2949:
x-microsoft-antispam-prvs: <BYAPR12MB2949A18DDAC3B178643C9BEDB65D0@BYAPR12MB2949.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0241D5F98C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(376002)(39860400002)(346002)(396003)(189003)(199004)(316002)(6246003)(6506007)(66946007)(3846002)(14444005)(26005)(6486002)(6116002)(186003)(81156014)(53546011)(36756003)(7736002)(229853002)(305945005)(5660300002)(102836004)(99286004)(478600001)(25786009)(81166006)(65956001)(14454004)(110136005)(66556008)(71190400001)(58126008)(71200400001)(4326008)(86362001)(6436002)(6512007)(8936002)(4744005)(31686004)(11346002)(2616005)(64756008)(2501003)(2906002)(66476007)(76176011)(66446008)(76116006)(31696002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2949;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tYxzBRHmWQCoajHBe173uzv3rT0rCQtT6tq2UCckmCbxVjj4oIWoFXvilxGr8A0S22zNPI0zEFzTcv72B7A1LLlF8qmk6bkiYDrcAjUbE/DSxZRJ0gWM5eCDy/ZmicqIVoImJhP5364w/9YcuiK+B78yxTphMAAk0RX3cSfpFEfL4/Ke0KY5iV1HnP0LTb7fRj9d8+hCY+mWHlKORsmmR3FXQfCSze7Gfi6jKRBARLrBUAr2JTHcYCeIa8F9q285PkBeDsPHql1VQSwajhRzPfWzaOOKauvbTvBnnYzKow4kCrYMtkAYUD7VlOBWS+Ae66b6CMIJtegAa+7JRJ7CoWsNjAgBdvZXXtd0PnBTgCuIu0zGhuFUEOn4hkQi6nqSHAuKmQTdT1tsU0zLCCCbrYzPU7szOeI6LI8WVw32THORQ4Pl6DHP8Pg5c6s1pfxI
x-ms-exchange-transport-forked: True
Content-ID: <8CF891668E6BBE4294125F2D97940C92@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6e7920-67e9-4fdf-a2cb-08d7790ea2a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2019 23:06:45.9366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rdyMQlwzmEjBVaUH09PhfZCMFU3MY01l+6MfRAFq7ptTb8AsYvhFdu3UkA3MWhxaFDhZPHRQck73/6QS4ZP0iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2949
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_150656_868244_1E5C559C 
X-CRM114-Status: UNSURE (   8.64  )
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
Cc: Ofer Levi <oferle@mellanox.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 11/26/19 5:54 PM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix kconfig warning for arch/arc/plat-eznps/Kconfig allmodconfig:
> 
> WARNING: unmet direct dependencies detected for CLKSRC_NPS
>   Depends on [n]: GENERIC_CLOCKEVENTS [=y] && !PHYS_ADDR_T_64BIT [=y]
>   Selected by [y]:
>   - ARC_PLAT_EZNPS [=y]
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thx for the fix. Will hit for-curr after rc1.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
