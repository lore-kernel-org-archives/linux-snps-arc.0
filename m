Return-Path: <SRS0=2Xzh=DN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EFFC4363D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2020 04:07:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BCE1208A9
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2020 04:07:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aFJpx/9F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cqiH1sPq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gHBjCKBW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BCE1208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Content-ID:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVgSUO6Pe6rnm4tNat5nHQaXg2qiFhwYKf2cYnzRVr4=; b=aFJpx/9F/KKMfnBjP0Uglx8VWZ
	gU7XYGLsbH3oCBdVP55uSxFgj7jflKoaVZ5Cs7RZJbxYDz65Dgy5GMtiajrm/tdnVVROxUNeF7p07
	+mIr9qGL5dZ5NIs4oxMVKeeaueSixPZvBeoKb1cOgMsSZAlkQoYDUDKIxqJ0dAPazEaiNXZYedMq3
	9IQ39Mw/WjQMaxpr9jRvBePwiroR5RxZ6Ll9Q9phetwYFGrQ3tWtuTcXn7LCpYp8JbeYeePh6qL/i
	cApGgKs+A4nhrnBDWSw7eMCIJfKDJQHDaXLHLBr9Ik1qopzFElzt50rOmC8WdopPhrwo1mfZoCi1h
	pl4N44Ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPeG2-0005JS-Ek; Tue, 06 Oct 2020 04:07:22 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPeFy-0005IX-JW
 for linux-snps-arc@lists.infradead.org; Tue, 06 Oct 2020 04:07:21 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6A937C033A;
 Tue,  6 Oct 2020 04:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1601957237; bh=onpG1+1rfs2DFjaoqCSy6h/kavcUGdB5nwgYTQ1meHk=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=cqiH1sPqecvams6SYq2vqVMyXs0oOAbkFbz0GAouE98ogSHfyUa4VHyxExqlAUNUQ
 kIMWjH+bEEYTB2GkbEMdZ55F5WCpBoXDKd9DXT8yZY+iyUtiyxIPpAqML9WkSgl6Ob
 SnyAnymidZfPh4SPtzKYAds2S72bYCyjFHnKWll01xppDTar8ah9w+XYku+iI3F+1g
 v074fnPROCddPYVV5q3rgIRa8PEBck5+vuJVyrv7R66XwOOp4B+CjCt9lwp2NEmEEj
 N/GPLC0JMuJhXLCi0HYkjc66l9/Eeq2x49hsQ4ZxX0CzCfU3Lwu3XwuhTMo3hyx0Xi
 iYB0RsHHOfWpw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7E32AA0096;
 Tue,  6 Oct 2020 04:07:13 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id C77748109C;
 Tue,  6 Oct 2020 04:07:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="gHBjCKBW";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkiSyq4TMeriOuer0pBedxAPyA5hw0p5DNgxQltHVF4sOmYKa6tFsR29Bya7qbYr5wKVg+8Ec5F7lfab1+0jzcpy6TnzcM4xcdESvlGmShOEUwlF188NKFXpAsO6ennTtw/GgzWV1o6ecZ0DNuDRxpJvi3gVPJXjiW+/c4BVx3AAX1REct7rUAeShyf/x1ieVfTmbAvdDptBScFpgbK7pBbPRELH5l8wQkq8YlnJ/RoaDNVCjQYIjCL7ybOtHlGOisp6a7q9xcAEpa764HUvjXVDD2/jNgVqtcJfI54MPwUPbp9QdsbGml/j3xHizyj/6drMvKBtI6iPzL6HANj78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onpG1+1rfs2DFjaoqCSy6h/kavcUGdB5nwgYTQ1meHk=;
 b=hg/Dvx2wCJT4xU7bc+2YUOYfXvGGnbRgxE67vB7Q46p6nANyove4rsHymrEEwqyTMlGkkOQLOwdag+NvTs0t9gdtwKEKfMN5x+R4+PFzrgz0cNlLvq/geGamOP/ZSwDXDsxwmzeMMAtlxe5SqVvTeVsoklic4ujF1o46bZNAXONL8sQ1eK8fqCBymJ3EWZC0zQvg64R2zCQjIkZVx/xmYpybmdZ/XNnPuJUnmmWgWKndbLxAf6Ww6bu1zEDS3Fz3sQkguB51DuntWOSupGCDHpCG66kF6Edx4T2BWif2Gliu7cMxnsEwBILMKz++9Dui2/DVSsCMv4EacA9nsQJcvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onpG1+1rfs2DFjaoqCSy6h/kavcUGdB5nwgYTQ1meHk=;
 b=gHBjCKBWnGjfZfZduTFGuQfAiF5DnE0cW9CZh1c8KjeQrCX/fcQE9iGV3Ipdce5V4UhE7JgUQLiS9NyUQ0Lwq5Ce+9vDKNP9qLl8oRp4LvulFJSK7uEeqQ2y2gjTK8aaQtO1GkgP1j0SsoOOCg4NvUVzjVj19JxcSE0TMfoRmlc=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB3924.namprd12.prod.outlook.com (2603:10b6:a03:1af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Tue, 6 Oct
 2020 04:07:11 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c962:6a42:6a0b:24e8]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c962:6a42:6a0b:24e8%5]) with mapi id 15.20.3433.045; Tue, 6 Oct 2020
 04:07:11 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] arc: include/asm: fix typos of "themselves"
Thread-Topic: [PATCH] arc: include/asm: fix typos of "themselves"
Thread-Index: AQHWm5D/doUTYFsBwkuHXQQagIqAmKmJ9TEA
Date: Tue, 6 Oct 2020 04:07:11 +0000
Message-ID: <6364c89f-8381-c019-d3d7-0abad902e99d@synopsys.com>
References: <610cc0df-deac-e2f6-e9ce-b19b3cba9501@infradead.org>
In-Reply-To: <610cc0df-deac-e2f6-e9ce-b19b3cba9501@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org; dmarc=none action=none header.from=synopsys.com; 
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47bf2515-58d5-4e5b-3116-08d869ad4cf3
x-ms-traffictypediagnostic: BY5PR12MB3924:
x-microsoft-antispam-prvs: <BY5PR12MB3924FAA9F2EBC72FEA41E531B60D0@BY5PR12MB3924.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P7Oyj+nK+UYuizXYOdxRYdeL8BjjMNQA9ccrPegU1oexwsBadc4AGPmtwPJvwY/I9NiFWAxueBn4QUQTJW9pm4qBN4rF7eXFTeEcYFOYNRxe2E6yyWhxBLUkKmh/+WVvQuc6gOIkbcR5GUy4nNImGxPLGLT2UurY5O+ZNFKCmdk5pH3KP3ThgV04tGpU3nzO0k8sWwKl9hYgePGqyFd3LKSvXDaVpbH+/nvU2VHnfY4ESTDB+uCcHEwjvTbh+NdQ4v9vXBMdiIckkmNkqq/7okyFN4GiF1GmCzSinVs4jbd+ObzF8vI6YqgGXksytrASQU+nMaAQrNzaTy6aelKdm0XHWRUGrME6U+q+bx+8WZoN3YxhdWZWrXEweUeqw3qK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(8676002)(8936002)(2906002)(83380400001)(5660300002)(31696002)(6486002)(71200400001)(31686004)(26005)(2616005)(186003)(76116006)(66556008)(53546011)(64756008)(6512007)(66446008)(66946007)(6506007)(478600001)(66476007)(316002)(36756003)(110136005)(86362001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: biP/onVxm0Iu/n/SbuZVnyhkMteVnEoliY5HO/xETCETqZGxDVTibYXGns0gK6acQqvGiOelT1BH2FTt/0WeHt+rPjbEUwuLs8RowICEa0F86r1Iv88IRDFbUaht4U0qMUFzVaTAa7xWQH3/hUD4yQ8TUftq9QBekGo7Vx/THs99Hpv0gPl/jksizJAMhPE7I3gxvlOvXNbmHHvS68Fu7y22R+1BLcNU8j6yvQ0z9tmIjDz8IjEXTFiTi7nBZrAX3TE/nAQLN5MzQKW+F839aIaPdnfE7y9lL7V0NvT7ZRXvBD7h2TlHCvOEanatSoelwz+3QYk3x2nnhv8nR37/6MIuwf0Luj5y6Q2aOzhN/jlmnDf6zqHdI5ULOFxz/Hxx5E8F0jm3pUfUmSUdThz8EXiXQskXKZFFTdiNk3ioUke0U5o1yRUVKKdg1mqg+DY56bzqYsuEGkPV9n/amHyv6NRORaSs2HrfjzRgWAGjE3/T6CVZDYejFw3Sd8di/xB0J80EllSUqhUVdW5GPp1kSqXOIffkjOPOmyE+mCB+YQLA/vxWi27ZlpARC5Kzgv027mJIXR8V7Aj6uvKcGuRtFgrDeyW5Jw9KKIPX6NJi465cJdb/4qPXz27v9vaBJC4bbr6W6ZoQ1Zx0hLpeRX+T2w==
x-ms-exchange-transport-forked: True
Content-ID: <E26E1842011B6044B93CAB36E17EBAFC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bf2515-58d5-4e5b-3116-08d869ad4cf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2020 04:07:11.2940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tnRi72eI99Nimn8Ri81bRVbtGJpn64Ew5Myb8jvE5sjUvsq9/nR5Tth2D7GMtQwZtErRFkGCZHLuTqLlV1XGAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3924
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_000718_827097_18463D7D 
X-CRM114-Status: GOOD (  16.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 10/5/20 8:30 PM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix copy/paste spello of "themselves" in 3 places.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: linux-snps-arc@lists.infradead.org

Thx for the fix Randy. Added to for-curr.
-Vineet

> ---
>  arch/arc/include/asm/atomic.h  |    4 ++--
>  arch/arc/include/asm/cmpxchg.h |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> --- lnx-59-rc7.orig/arch/arc/include/asm/atomic.h
> +++ lnx-59-rc7/arch/arc/include/asm/atomic.h
> @@ -45,7 +45,7 @@ static inline int atomic_##op##_return(i
>  									\
>  	/*								\
>  	 * Explicit full memory barrier needed before/after as		\
> -	 * LLOCK/SCOND thmeselves don't provide any such semantics	\
> +	 * LLOCK/SCOND themselves don't provide any such semantics	\
>  	 */								\
>  	smp_mb();							\
>  									\
> @@ -71,7 +71,7 @@ static inline int atomic_fetch_##op(int
>  									\
>  	/*								\
>  	 * Explicit full memory barrier needed before/after as		\
> -	 * LLOCK/SCOND thmeselves don't provide any such semantics	\
> +	 * LLOCK/SCOND themselves don't provide any such semantics	\
>  	 */								\
>  	smp_mb();							\
>  									\
> --- lnx-59-rc7.orig/arch/arc/include/asm/cmpxchg.h
> +++ lnx-59-rc7/arch/arc/include/asm/cmpxchg.h
> @@ -20,7 +20,7 @@ __cmpxchg(volatile void *ptr, unsigned l
>  
>  	/*
>  	 * Explicit full memory barrier needed before/after as
> -	 * LLOCK/SCOND thmeselves don't provide any such semantics
> +	 * LLOCK/SCOND themselves don't provide any such semantics
>  	 */
>  	smp_mb();
>  
> 
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
