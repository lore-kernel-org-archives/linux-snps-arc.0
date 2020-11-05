Return-Path: <SRS0=YnoV=EL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44BBC388F7
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Nov 2020 23:16:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E83120704
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Nov 2020 23:16:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IL3ImSYP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="H7U08ZdS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wibj9UVq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E83120704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4pee/v0yHgWbrJ2OLUMZ+I3VFyDcVGrvz91J3PNjzwo=; b=IL3ImSYPWayh6qTfLrHO7L70s
	JFbfU6XgmAQC22/44a+7rajEJ8opsRbBgRPCMNMiNMJBgyZJtsiSgPj6zm/GrJxmhmF01gIdc8dXG
	a94ngk2jcO61KuC1PnjJ+WG0rKwgARwK7DnyJZmXuPFNmFVICtBXfUm+b8XWDaKQ3+ewrfu/1Do7L
	MhXXjQFty46jFT/m70C9CAGacxykDGG4Bl0l30SidEUVwV/d6mqbscrK/3cFZGdQF2n7UHZNANWlB
	wtUQt7HVw7yiecJSibWNqHzfLLYIlUoM2jrUnLXR66YP8Tk9M+deKUq1TIhpsmvpGykXyzFJj1hUL
	QSzhQQCLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaoUy-00085W-BO; Thu, 05 Nov 2020 23:16:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaoUv-00084n-QH
 for linux-snps-arc@lists.infradead.org; Thu, 05 Nov 2020 23:16:55 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4FB2FC0004;
 Thu,  5 Nov 2020 23:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1604618208; bh=mxsNSlk2iHdnOgBAlPr8nNWO+ug/+gKmSLD7uzw/jbw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=H7U08ZdSrvWbZZ29ANVHuQFG/fDdbZzAFKg+D9YWbktHXmfR4Y6+LhpIuXDaMvFBv
 mRR+KFiaePMRq06IurEk649VW3sW43N/16ejBZs3Ff7Qw+NHFH24TQ29fA1JBEqn2j
 S5/ga6UcXjIWswAhctD/xXnzG8MldwZsUGmugGhJ6g/y/eAPvjx+xpkY7pYZCBEu0k
 05q43I9liYqrGPC9pl5PcbYTXBrPjU4jOzIvkzfQSfFoJ4G4L4RZscwNQKUDZ2/f5N
 RVdGkeESto91NvfMwj6v5ercbhMpcYSxtGAOAFVuyZR4CzUKjngfHbu60q0X+2N4W8
 jQ9UWFOXnOaAQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B430BA0063;
 Thu,  5 Nov 2020 23:16:47 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id CD094400CB;
 Thu,  5 Nov 2020 23:16:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="wibj9UVq";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCfASv3Oqb/EsJnvlZ0DxgXUnJEroqmDcPtIfud3zHXWjfH0B3M9y5s+n/ny+Zk2YMDbUlq2LW8h90tzSBQLhzHW0tvOZ4YGDGG1IwO/lY7lb4jO6A+c73+r1i0NQR3TpvmKCXvXgzey/7RZ6PgAUqKQgflUgiZnueNukpj5Z5Cq+6LKArw2N9HF4+p9/Fd9sMmmNw1tjInCn0IFu1FRuyKkCmeGrFNzyTk7S/YimdVRI39crtDh/ReAIrrleUqNoGDL1nVUDVSBHFoNogYhtYuFNfPmUGbhBfilREzxQ8DcJQnHlp+TjXa95MOLEuMEp3JY3GkaBQvwBDp7p9sdqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxsNSlk2iHdnOgBAlPr8nNWO+ug/+gKmSLD7uzw/jbw=;
 b=EN5rjkEpcY2ctYemrdEcsioVGAqWHYgn4rdJmP0VgiGhskuTGIGlrMHciIxB0Ggf+rOe98ir0TDiNABjaht7fYLS+/TAf6/tcCRXlBbDSPRcIepUGAS+NW3m1kppNUnQAAAOMFd3eMQ6zao6OGwWxJKrjEzjUT09sj1WXCEfOE59fEy86d+vDhIm9cnLXddHu8xDA6Yh4DXawFSm4696NYXXIqj23unQa4nK0WI/csOThiP3owc8Nn7Ue3pEl82leeW5c2G/6ftHRLP7vMhTfkeCPFO9abbARCwj9EUvemRR1kR5fGUlS0OLaR1EOUZ3NuMlE2xa0LbO/UFHTFNQbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxsNSlk2iHdnOgBAlPr8nNWO+ug/+gKmSLD7uzw/jbw=;
 b=wibj9UVqYoc0kU/jV/VMGby0cN5sh6y3NS/r8FxBUJroCFN+ivjQXpOyY4k3xXzGMDdZ7azeXvMKLswPXrZT8s9q9YaxsRHo45cVqB03sxOF8Y0bklc1NVO8vJ64G64YsJX6Ed/LhlZAuB5gpmUfSKjCVGIOZHoN1FOxmugKEuw=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB3748.namprd12.prod.outlook.com (2603:10b6:a03:1ad::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.24; Thu, 5 Nov
 2020 23:16:42 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31%6]) with mapi id 15.20.3541.021; Thu, 5 Nov 2020
 23:16:42 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: Re: [PATCH] ARC: bitops: Remove unecessary operation and value
Thread-Topic: [PATCH] ARC: bitops: Remove unecessary operation and value
Thread-Index: AQHWp+7k4lh/dGb60EipqqFMJundjqm6Q4wA
Date: Thu, 5 Nov 2020 23:16:42 +0000
Message-ID: <d1851511-51aa-de74-cdfd-d1bfc510b5a3@synopsys.com>
References: <21124fbdd2ebfe150cc750f673a31e89d6fe5752.1603314740.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <21124fbdd2ebfe150cc750f673a31e89d6fe5752.1603314740.git.gustavo.pimentel@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6554af5d-51f1-41d2-fdf5-08d881e0db5e
x-ms-traffictypediagnostic: BY5PR12MB3748:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB37486F63DC6810BB5657D995B6EE0@BY5PR12MB3748.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vZBmwEPWpz9tk09L4h5dUAxyVegGQug7ay46Kv0Dm/D2f6p2KjWLQ2ZU66/6cOSNF6xM3RuhPCiYNNPWesDt2eWShWzWhGRRaFXCwSbpvCNID1be2kDm5m4GGuBHxyM1WiD2/k9x0alevqFJf4lpBx2XgXlgskobSEz44w6uq9YgsnuS8juiZP7IiXpRdTLq8RZvxobDqIqoGiRBjEGxdcwNoLLl+8uVjFJWixDYWJwZxMmux0euqUf0VZMMnoz/jh17geQnUF4vI0tQds71ENpmQ/keZty86HWIoKWegUClLubymHBj7RiaVb0uUqKGOSx9/gO4HhW+EZ5/y+d/HL7Fu0gBVsOrHbx6m2HSNLouJNGkwGmeJ7Ngl0Sd5kde
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(31686004)(37006003)(26005)(6862004)(36756003)(54906003)(316002)(4326008)(6512007)(478600001)(6486002)(53546011)(31696002)(2616005)(86362001)(6506007)(71200400001)(2906002)(6636002)(8676002)(66946007)(5660300002)(8936002)(4744005)(83380400001)(186003)(76116006)(66446008)(66476007)(64756008)(66556008)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: F9swpaDOvoK+yo1nCfwiG/FnXJ89KXUCFqk2ATFsHVnsWVICA+sDohM+1WBjXj/5AbeXzZ55On7SYrWWzfHE/jiwpi3W6KlZFIDpBr9W7V6APaRGf1aJcobmcZ85q1j50hudLwvDBEPmCQbcoaQino8GIefoLXZl+hs+D4J4C0fiJoTAb7H1/kcvA4BeyFflkzIUMRZ3WpG4r5sdbJMpMKDorNkruQZMR6fr2JpnkdavWArDgaSo8jUupoi6QO8R7NWC6aCMCxgeX8ZV4bzV+nh3vQTFdpQt34h0/n6g/XcLfoO2b2jnqtHIMtKnY3rx7thUEc33AP+1YTHfSAHK25hETirrvi48h1llcF2VCaqo9NGnsys1z3Maz7XsauSgbqAXyUxj0o2L9soQYR0DA3dZLA7re9sEUOdtlZsYITL2nHC5caM/jfL4jf/n7l/KiSj7rm4zPDuJASX++SWQcedzOLCd3CH+js1VWEo4gnXLDnfK0Mw0SxpDUDpGJNuiXqJB+3UN9sGumrQAYOPWT1yX6tAEWP/PYqNk/Eu8F+Qo1oeXmNSpaDyltXwvQa+d2zXv2AzA54rnczvMMNw1TT98+cRIKzJGGpmoaUrGdSU5+KlD+naKIQZKn+bYNShvTL6he/oja5mq1umQFar8TA==
Content-ID: <91B29CF89278C14280529EC920333014@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6554af5d-51f1-41d2-fdf5-08d881e0db5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2020 23:16:42.4988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IxVvxc0p0bEwI4jkGL+dTSI7ZyhxC0Pg2bJaLUJIJA5l6ydZeIj2co9bcR9FvjAv2DI7M+v0fJm+cFMsJsSi4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3748
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_181654_078938_81B556AA 
X-CRM114-Status: GOOD (  20.80  )
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
 Joao Pinto <Joao.Pinto@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 10/21/20 2:12 PM, Gustavo Pimentel wrote:
> The 1-bit shift rotation to the left on x variable located on
> 4   last if statement can be removed because the computed value is will
> not be used afront.

All of constant_fls() is anyhow optimized away at compile time, so this 
won't affect any code-gen at all, still this patch is legit.

> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>

Added to for-curr !

Thx,
-Vineet

> ---
>   arch/arc/include/asm/bitops.h | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/arc/include/asm/bitops.h b/arch/arc/include/asm/bitops.h
> index 50eb3f6..8cddddc 100644
> --- a/arch/arc/include/asm/bitops.h
> +++ b/arch/arc/include/asm/bitops.h
> @@ -297,10 +297,8 @@ static inline int constant_fls(unsigned int x)
>   		x <<= 2;
>   		r -= 2;
>   	}
> -	if (!(x & 0x80000000u)) {
> -		x <<= 1;
> +	if (!(x & 0x80000000u))
>   		r -= 1;
> -	}
>   	return r;
>   }
>   

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
