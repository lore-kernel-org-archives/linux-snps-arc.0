Return-Path: <SRS0=vqj4=Y5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D427C5DF60
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Nov 2019 19:52:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C37F21D71
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Nov 2019 19:52:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WuUFiQPa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="P4eIQnDX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="CqW6sf3S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C37F21D71
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/q8VfusOF0yY+NWDCpLtJabAKWIZJQ6/nzDnfPSayQg=; b=WuUFiQPa6p/UKK
	zwwwHFSw8bOA/geuFKBqKoIK7+aA73ksvV6WtudV0I2+aIguNAyuBuGTi2vXF5kWHFuiXNi2CS2AH
	8k5kcQKTVVu3e6AfmkG/27rKWmO/fKi9vQ9aMyvZAwfOqf1Gh5EJjCXt28YZjfoeHwmTJc/WLJW3o
	lq2K8HMM0RsyC0KMWU8l4KAXKhFIARgxGExHJQhOe1k+minv87AhlgUBWrnjgys6+2DKUJL8i7B7U
	6xLryMD6wwdxPyPkaEE0mZ5g7ShtuSSfDx49k7ZH3+SWp4awAEp7myt0QnskGudgqXP0Yx1Ny/QhS
	0ktXNbQ3mcoPM8+eNnQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS4sL-0007ad-4R; Tue, 05 Nov 2019 19:52:25 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS4sI-0007aB-5q
 for linux-snps-arc@lists.infradead.org; Tue, 05 Nov 2019 19:52:23 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 554F0C0E6F;
 Tue,  5 Nov 2019 19:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1572983541; bh=kz0Vzq3g/7x8Yftm+eTnaSvP6aYOC92biUkAGVMk+78=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=P4eIQnDXIUCyxsYkcvD6uycgbzEQp1U+KTuTTPcIOM6XpVXih7f9D0zVAnTqmZ1wT
 DzwhlVWZqnSuifj0UNTvbORBJ7a75NifSG12rT6K4VinXMqHsYL+joo3qTX8b0wSgC
 fLOUaGlNgW3ZobqhrGXHbFrcWouM8fZfRvQoi6Gl9idI6wHdYvDkU7t8z2ePsqCQJu
 m/GZlEr5aPwSwFRdeVwcPPZ+ePaV0nMlaZjP5tsiJEWQ5ma+xvkCbYAraD4X1O6gL4
 tXaubgE8dgqCd0R7VQxk33Vd5k8BryW4VYipgSDAWUA49k8lmnCvR9R0j+fSsyy094
 qPeCVl89IV1ew==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9E9E7A006B;
 Tue,  5 Nov 2019 19:52:20 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 5 Nov 2019 11:52:20 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 5 Nov 2019 11:52:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N82LqVXuufWbks5teN+y8M2NBV1RIGdOMe+DkCEclZ44pHcS3zMA8TuvVgWISzDHm0Fbjm+rIY5NjN3P7GXlZ4EzXe/3qPIKdqMNzbGrxMdV0OOgPZoaEktGaybmUxSFss3wMPMEmVkcRWaA/cBT5NIyCIBwTOO5wBT0X3gk32Tp3jSVFz5ay4VYuBq3w/1E41xw7aSjkIqqfChj7CZrMa2agGkHy8mTAMYWrwAPJOKFXHV+gj0iJfBnZGh90n7wUxe7EoQ5BVR7Lb5sNyykrM2oqs7kxJh8iJE+cPMq5mPOku8Wsi3Z3RtAsF4Sq9QDgDwrNvdKCmbNKUEGg9PLeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXEhEEZQHBUhKURUFpmL4SY+HASRjg7zgbWcFxAIUgo=;
 b=iX+15X+Bj3aZ9XY7Af5UgIsSk8VWE7sC4Y6AS0eDq/6gUTb3o6DhE2DAcIIkV6YgAfoD7+nW95o7q0UkY33bh+TzvADdaLuQw51vxrKN4b65bwQaqUGoTy1qpMsWplz7hgRpLP+T76ir/rBaZV70RekdXEnTMCkEDE24D0mROtRPGZYSUHEMLq4WNQmTHb8cOKbw3MnOnzNmxLk2QT1NAFeD+/t8Xm1zP1S0hWSMymFFmSPm5F+03YAEM8RFL+A0EheggCYsFNIkwIWM/v3bJbGeG06AVscDT44FCsXURLfnLUTRTbNK7LqXTWvVVZMYe2yCgy3nvliuqAJ+5mJ73Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXEhEEZQHBUhKURUFpmL4SY+HASRjg7zgbWcFxAIUgo=;
 b=CqW6sf3SaVrTCEOwJAKiMu62LsFb2Is6d4kj8cJYqxgagn5MMPyqO+MLw5oK5Kt2HDI3JwF6spKWDmTKCL+FOa6DLsULK95sgrrp0FEClOP1+W/ndtB5gc1eQhStq3cdcU3laAo0b58h/cCg9KzWno/tFhLb8EC8mYt+WsvpXaI=
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB0005.namprd12.prod.outlook.com (10.172.116.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 19:52:17 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::1487:2d87:9871:3e4]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::1487:2d87:9871:3e4%11]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 19:52:17 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Sasha Levin <sashal@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: RE: [PATCH] ARC: perf: Accommodate big-endian CPU
Thread-Topic: [PATCH] ARC: perf: Accommodate big-endian CPU
Thread-Index: AQHViOHYaz1MyBn4kUuKPCgMuDadHqds68WAgBAmUXA=
Date: Tue, 5 Nov 2019 19:52:16 +0000
Message-ID: <CY4PR1201MB01208D47B2BEB18DA6E1382AA17E0@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20191022140411.10193-1-abrodkin@synopsys.com>
 <20191026131042.73A7E206DD@mail.kernel.org>
In-Reply-To: <20191026131042.73A7E206DD@mail.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
x-originating-ip: [188.243.7.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 717a651f-0a78-4be8-770f-08d76229a965
x-ms-traffictypediagnostic: CY4PR1201MB0005:
x-microsoft-antispam-prvs: <CY4PR1201MB00050967A8FA5DDF83C65157A17E0@CY4PR1201MB0005.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(346002)(396003)(376002)(366004)(13464003)(189003)(199004)(102836004)(99286004)(14454004)(6246003)(256004)(186003)(25786009)(64756008)(33656002)(66556008)(76176011)(229853002)(66066001)(6436002)(8676002)(66476007)(66446008)(2906002)(66946007)(52536014)(71200400001)(316002)(110136005)(81156014)(76116006)(81166006)(9686003)(476003)(71190400001)(26005)(55016002)(53546011)(6506007)(8936002)(74316002)(54906003)(486006)(4326008)(5660300002)(478600001)(7696005)(7736002)(6116002)(3846002)(86362001)(11346002)(446003)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0005;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2T5Bp/EGWi30GPPGstD9/qbepurVOeGPYrCht8BzSKxJCPfNEPm1HErkDmEi95YAPTZ5iKmMxgJaIZfrQxxHGVjtWSY2RgFjUewZi6ylPR/ZAHfJNEaoKKsDPBjEhEyquKjKBPknzL4m9/kvZn5VKyVGmTKBckR2HtoybcScKVJN9Uw9Qa4UWTZgSqulvrMZvpLvjzSk0WLLZVpllTYJ75SozjHgbJ2jRHvTy8J//DTwSaMNAT0+L/vfKiw5bW/FU7YfyMeSkSfVEH7zGx6VuCbm1S12vFA+tMOM9M7CbXU5gcngs0LUxv+OWynOMKf9y08HE43r1JKJHgmfFwThm23JXJdMTsBArHK33kq44323LklmoM3Lmdg0NgJi60666wScimP8kNiVljFo6TTT/m1y3MHoPKAVFLNOZFN+GCWt2pRJucXNt584WUDvdPQZ
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 717a651f-0a78-4be8-770f-08d76229a965
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 19:52:16.9925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JIK9SO2ajJIQMpRtCkvu0CH0ZvvJ4//7kI2LzCZCgDiBsAhabHlX+3dW9t+4Y9F8wexTwXAcZjwVU1u+BMPQ+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0005
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_115222_260410_524F5A4B 
X-CRM114-Status: GOOD (  12.46  )
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Sasha, Greg,

> -----Original Message-----
> From: Sasha Levin <sashal@kernel.org>
> Sent: Saturday, October 26, 2019 4:11 PM
> To: Sasha Levin <sashal@kernel.org>; Alexey Brodkin <abrodkin@synopsys.com>; linux-snps-
> arc@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org; stable@vger.kernel.org; stable@vger.kernel.org
> Subject: Re: [PATCH] ARC: perf: Accommodate big-endian CPU
> 
> Hi,
> 
> [This is an automated email]
> 
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: all
> 
> The bot has tested the following trees: v5.3.7, v4.19.80, v4.14.150, v4.9.197, v4.4.197.
> 
> v5.3.7: Build OK!
> v4.19.80: Failed to apply! Possible dependencies:
>     0e956150fe09f ("ARC: perf: introduce Kernel PMU events support")
>     14f81a91ad29a ("ARC: perf: trivial code cleanup")
>     baf9cc85ba01f ("ARC: perf: move HW events mapping to separate function")
> v4.14.150: Failed to apply! Possible dependencies:
> v4.9.197: Failed to apply! Possible dependencies:
> v4.4.197: Failed to apply! Possible dependencies:

Indeed the clash is due to
commit baf9cc85ba01f ("ARC: perf: move HW events mapping to separate function") as tmp variable "j" was changed on "i". So that's a fixed hunk:
-------------------------------->8------------------------------
diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index 8aec462d90fb..30f66b123541 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -490,8 +490,8 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
        /* loop thru all available h/w condition indexes */
        for (j = 0; j < cc_bcr.c; j++) {
                write_aux_reg(ARC_REG_CC_INDEX, j);
-               cc_name.indiv.word0 = read_aux_reg(ARC_REG_CC_NAME0);
-               cc_name.indiv.word1 = read_aux_reg(ARC_REG_CC_NAME1);
+               cc_name.indiv.word0 = le32_to_cpu(read_aux_reg(ARC_REG_CC_NAME0));
+               cc_name.indiv.word1 = le32_to_cpu(read_aux_reg(ARC_REG_CC_NAME1));

                /* See if it has been mapped to a perf event_id */
                for (i = 0; i < ARRAY_SIZE(arc_pmu_ev_hw_map); i++) {
-------------------------------->8------------------------------

Should I send a formal patch with it or it's OK for now?

-Alexey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
