Return-Path: <SRS0=KuJb=7M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A293C433E0
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 May 2020 02:18:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 337BB20707
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 May 2020 02:18:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hDyoQSMf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Bgh7AHzg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QD4xDsYS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 337BB20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+tmx82xaDZe8T/lGBZijRdgbuV2Ycog3f2c9GCrFg4=; b=hDyoQSMfi49j5h
	slZBomlDhNESpUbOCSjjqz50sxy1JMfF56Y+OAlY1K0v5HGIfdK2qhObqGKJATPGXRo8A61KY2jq6
	RP6sTdz3hOYxi7rPwEAYkp0wvo+QRpwod/VwmuZaoYlo0lQWkusIjJjcmCLVjli9IplraLvO37tx2
	BDQccPj2xXBd6B7Xdu3Tsbz1dbHT89vNq/4tmXvgRC2hpQGqRl6iJB1qnBApnAcVRMpDIryCDSckX
	UJFJhWIlqsn+ko6Ydh3I/3ccedW4fSC9r8Adlcui1qAkNGYyJ+S+VuIfrqNG7T4noWvyParFDE09e
	25bA21vJvm4y5lUa0P/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jer4y-0005J9-Dd; Sat, 30 May 2020 02:18:32 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jer4v-0005Il-UD
 for linux-snps-arc@lists.infradead.org; Sat, 30 May 2020 02:18:31 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 112B540957;
 Sat, 30 May 2020 02:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590805109; bh=w3t/2Mp6dCFGe0vIu7MAc0wXF7yTKC8bjirENgJri3g=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Bgh7AHzgWg+saCq1F6MgbPX13E4ILu8KoZQCu1rydCaFfmZmyBogRF/yukU7Z/xse
 laDipmjVOlMk4yhoNYnshhjv6JecmWFFsd3ZE3BwrfUo4CpQ5yGgJb6PI5H3iC9pcd
 u3RVw0/JNH4fx7Tj4RORpDFOhrZQhTIowjlx/IoQLjrNWWUJWNQfkk5da1vNg5BrWA
 dNQLUGJPFaKaGJvNyYqMtfmRjwI7lN0LjdDAVhxS5ZSz/ceU/rwqN/KcIZD6k5vaTi
 om1MgwOgSPpkEIPbI9hgG8T0KrEhZgiex1De8VKWk8Ry7yFRITPp9wusGafxKfaD9D
 /7LcyBRPxaJnw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id AA961A006C;
 Sat, 30 May 2020 02:18:28 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 29 May 2020 19:17:14 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 29 May 2020 19:17:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2JY9WKcyvf5f2RSUwnpRSTeDvCDjbIgCQnDV5szACvhNymdMCzv8q4Q8HJ8JHcIPO0PQrUiXygrjcdbYBXujtDPi3zD/w8qrwcplv4gSn5V9HlL8wX8LAfsU3bj5pSZfJpgbJppAeiYPCkPZTzfsASyYeqrko2ExnUAeRpu+epModYOdY1BlgPNazYhUFLZ/MGGgkbIlPkeu62jhgpZE2/ikMZbv90r+fcAuutTblIfMH06Yc/kVTw4zRMPJr/jESvJXLZmcKhsys8hMq8Rsjhqft2JX4Qem0AozFRAp63qbOvbZ7WSCRHl9B/1uSQoGtOGN0X2Mx71t2xJeU+Fxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3t/2Mp6dCFGe0vIu7MAc0wXF7yTKC8bjirENgJri3g=;
 b=S8Y6xAO4YRCryVzvU+j8ZUmdg/FMJ0yfbgKY+ldy9OCeWB3eY4dBP2taZbUhuC0/X0ohPNPOgRL7xqJdLhSkndazcr2xS+Oow6W2lDUg7ZJOk/Xfp6FONT0TlaYyxIf+jBh8q4lWobg6qpRwMdctIKtvMayDFvQ9GX4mvy2hECc+B77qY77RGd/e7wSPhOsifAjlmJ1jg6ed2yYJ1dxDbD3329pOLmzYu99AISOVOJ+NUxYI1QKUvR57ZgnhZ9uIjkHvGCra2aL+o1hnyRqchRHLPkFd8WfV5VqGQ4SpT0IwLZ6ZKLT7HPg/sQpvwRdAB751i7gtfO4gYKgknUwtDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3t/2Mp6dCFGe0vIu7MAc0wXF7yTKC8bjirENgJri3g=;
 b=QD4xDsYS36i7cgrpAvWCeG3eL39yjB+byG5ZV5rBbNEEBscxBUo0hvfvhNxOipRfdyLqscLaZTavlL+35JGdwE0cQ5bQaoWwmgC0e9FfQc0U7xPLcnVFutJF1tQsx6nTuGYPGPa11qLm+NXJamTZTMs7uEHLzJcRQL2HOLrsQ0s=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3448.namprd12.prod.outlook.com (2603:10b6:a03:ad::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Sat, 30 May
 2020 02:17:12 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.018; Sat, 30 May 2020
 02:17:12 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH 1/5] ARC/dl-runtime helper macros
Thread-Topic: [PATCH 1/5] ARC/dl-runtime helper macros
Thread-Index: AQHWNiY/9Gxi1tPUOEeH4T3QPtBbWqi/5I2A
Date: Sat, 30 May 2020 02:17:12 +0000
Message-ID: <befa4b5f-620f-ef29-c414-353ca4ae1752@synopsys.com>
References: <20200530020047.5490-1-vgupta@synopsys.com>
 <20200530020047.5490-2-vgupta@synopsys.com>
In-Reply-To: <20200530020047.5490-2-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: sourceware.org; dkim=none (message not signed)
 header.d=none;sourceware.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf01b88b-9b0a-484f-c172-08d8043f9057
x-ms-traffictypediagnostic: BYAPR12MB3448:
x-microsoft-antispam-prvs: <BYAPR12MB3448DB915E6583C2985E19B9B68C0@BYAPR12MB3448.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 041963B986
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hNlLTY7tW+3PgVe2wM2zTGCEeQTEpsPXRjuFBI0glJURhAe3jntSaddibD+/vX2JtkKnalizatuOqYRoB+V/FEt+fJoOPbLLr2phVUbJw16LIhUMtaLlpBMEmjr3oCbRDZhObUPf285pUYOtR9+nD5liLgg2R+/9jJF7stHp1GIf+TFq9CmoyhdSHCwiwwPvN56Tle1cJyATsmHIueCvM7ISOk85ZDh8Ldlo/GRTMt+LHfk1r2IJ8kYenVUW2wtv5U5m/Qx766m8UqeZWZ+hoO42pim366NwMi88S+vnExS4IhBK0nModmiE0UKF3Vy8PreCMfE8C81bV23ZESHBOoZFmT5ArBxtxHKVHRNAMAZRMBbtGwXGvUX0fTKj8EZK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(376002)(39860400002)(346002)(366004)(136003)(2616005)(31696002)(6512007)(4744005)(8936002)(8676002)(5660300002)(53546011)(6486002)(6506007)(26005)(186003)(64756008)(66556008)(54906003)(66476007)(86362001)(66446008)(71200400001)(66946007)(76116006)(2906002)(36756003)(316002)(4326008)(31686004)(6916009)(478600001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: J3SzCaYn56Ex1553dmbs/KaiDAhp2xZz7ffUYbotlngQpG/ii0PSPclfnb9EXS6BJ7uQuqim7ZlnnwfGTmU6WigIPXb/djKWNo69Qy/cSir2kyPAzRwD8AbBSzhde22k+W9+QFTXZrz9gZE1k2pO98dahp7KbWfxlakPYQ/OGwCyr0ZMRi7KSedAFQnCN49F8laLSP1771QkivhXoFCaHguvkVPHjmmGlPGDw27yItdlO2FuQnm29ZvD9jppy3DHXTdQT2883sjAHoXK6aZR0FuCGBP3BuM/5o4TkQ8FQShJFUHJpwDsPyhfmB1Cxd8tQqfq6MGxux783vGAZ4eFUaLPHD4NeAyY1sumWU71dqZNpAsOIFZh5f6aAaP9GZpkm+QUey+f+QEh8Cf4PVtbrFVSQHtNl+kugt1b3obWDKDEOM09uXDhVpAIY+iaKgXK+fAt1BvKVbxUe3dAfsOoVkFBmemjfLne193oCiUV3+TU4JlhTBYTMO1ypCDxuotU
x-ms-exchange-transport-forked: True
Content-ID: <98995055CF08C140B64C910D7AC48FBC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bf01b88b-9b0a-484f-c172-08d8043f9057
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2020 02:17:12.2656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rtzVQrROmONkFwhixrmgRMqQlim5XWd3ikUiME4weuEHQB2fIquuhg0yzvOfOUNSNL82uUuHujzFp5Hy1lyZYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3448
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_191829_989570_7291DDAF 
X-CRM114-Status: GOOD (  11.48  )
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
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 5/29/20 7:00 PM, Vineet Gupta wrote:
> This is purely for review purposes to attest the interface defined
> in prior patch
> ---
>  sysdeps/arc/dl-runtime.h | 42 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 sysdeps/arc/dl-runtime.h

Oops this was from a different series, please ignore. Don't post patches on friday
evening :-(
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
