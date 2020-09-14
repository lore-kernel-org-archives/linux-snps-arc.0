Return-Path: <SRS0=fDo5=CX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E88C433E2
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Sep 2020 19:51:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3BBE207EA
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Sep 2020 19:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x3Wi82DU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IfTSkm9H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VynItc/X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3BBE207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hAYeECYL91It9rhLz64h7HzEAW9ggU1SpGcqCdGvf5A=; b=x3Wi82DUkwl15IhwdgPd9l6MO
	+iMbxDwzlm2JomO4dgosoYt+bdoUSvI/zyOI/Yx0fWu14xoFxHs6b4N4aUTPLzWQI4+m5iHXSSaY+
	1fkYlaBGiKGaM9VWx5dsvpZdVFhs/0hO7d966vdXiYttQzxbfsiX8M+a5IEQXTtRcpR9jpc5fB/VM
	YD3dOZt5It4e7f5CWX4yiyA5u+Lg7y54M58KWZv1Wl0su/SIBlBvETiCBGfXlGjHd+/94ChG0RtfY
	qjODPSujamoQBahnMdE+zcRKNQSkojK7NNKx3+GhoVV+BIMOy0PqVO+04NsdYRylBO+GUxlRgNZBf
	7+C73ry+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHuV7-0003U5-4a; Mon, 14 Sep 2020 19:51:04 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHuV4-0003T6-8S
 for linux-snps-arc@lists.infradead.org; Mon, 14 Sep 2020 19:50:55 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 421BE400FE;
 Mon, 14 Sep 2020 19:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1600113051; bh=wHHEKQXkw5FpzxP6voYYFcsv4zjZAmU2eY0S35MmlOg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=IfTSkm9Ho/dXRmO4DjTDmC1Uok2Zs8oF8LOEfV1s7ybf8wuygfcZG/9BmQGAFrB59
 KYPz+jyAKl1UYCguyaF18pXDYiQGcvrq0A0KLqLBtvuTIGmr8oif7ARdYITxJi6xIr
 Ewe0QOO9sjcLfjFC1ELnhtF8YxwLnePjbf5lORIgJfDo68bdXWR48CxEGyL4Cid8uj
 zMfVsyJOK6LgXYSFj1wW6N9ks8JRwFDh2BvuQd2vhVc0kI9nQ8Y0FsxZ2h2GwmGUUO
 Ni/Ffl/oQtcTASxxBQuIxna4k40IlbTvdU2dCwQ/DlqQF492XlX40P0GMufv3Py68D
 /X2O+oAL4APAA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E08C5A0063;
 Mon, 14 Sep 2020 19:50:47 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 76E5640032;
 Mon, 14 Sep 2020 19:50:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="VynItc/X";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OH5FP2lljI1o4wMQ658Z1hPvmtNpsKIBhznuC7os+VmgCtBuvgZ/A4IB3WrkPM+0zXl+0BbuQ9bmW228qJ2OXFQNLBSjSgILHW1zMCtxNoF8H5CAnX0D4kPDef/X0i8/Is4k8Qenv9s9GXIvAASdQ5FUvhiOsjoDZbuJffW+kWBwbmJuTmRBaHVatzDOC+owoMv9MPfzJ346qv6zsryVqytYGB528SHaQdmfoACCpwEBk18Qsockv5e3NihVKup/fmHq3dGrBjX7NJkyXQ8DSuimMjuk1S9f2kTIgvqQ9YCVXtB9oc+sJ1XmwSvP2eYEb6oAI/5/XFIp7HYgxGEZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHHEKQXkw5FpzxP6voYYFcsv4zjZAmU2eY0S35MmlOg=;
 b=aYM71KauUtGV+cq4slywpWOjmT12Jg2ZvDasGuKj1OpyMdrAjjI3LD6qKZgqM1SumtD0uf+WoS93AYoyOpCqbydAYxwRT74wjdYuWFVsjM1b1jxv+M3vf1W6q+lUwjOjJrcLjOQn7oVGokieoPwRAI/329rf+0E4vgXCAhXMUVdV6uXWJ9NCP935opS1tCgk3gV2AipAvuw11g2X373ACqN4a7LcatTJu0j3jHOhAoWG06+jsS37yV8py8AhSm9NZaJGHem11GzaaV4vqnr/hhSctirh8EBpug7byMW/I81VT4196bbXljm6onYzXbkzXkgicnlTPpviorQ+0tmo3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHHEKQXkw5FpzxP6voYYFcsv4zjZAmU2eY0S35MmlOg=;
 b=VynItc/XQIIQ+/pdYetj3O54/zi+0Nz0Q/ZPTOeJ+v6ikCiic7dzvDip+wI0BHvj+9lG7O+YPiH9cH/IJyvV7sQpBAYZcUhj7MZ+dwb0jhHA/r09WDaTV+s1YOfWGGrYOlAZIoCHrAraCPrJ2zqa85ajMs+rhkAJzz4fnd3Weps=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB3699.namprd12.prod.outlook.com (2603:10b6:a03:195::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 19:50:43 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e%5]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 19:50:43 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Necip Fazil Yildiran <fazilyildiran@gmail.com>
Subject: Re: [PATCH] arc: plat-hsdk: fix kconfig dependency warning when
 !RESET_CONTROLLER
Thread-Topic: [PATCH] arc: plat-hsdk: fix kconfig dependency warning when
 !RESET_CONTROLLER
Thread-Index: AQHWioz6KLpe6Ti1AEuQK+kdobnWxKloi40A
Date: Mon, 14 Sep 2020 19:50:43 +0000
Message-ID: <9ba22ab1-560e-3c1b-dfdc-77ebc609d41b@synopsys.com>
References: <20200914114651.105219-1-fazilyildiran@gmail.com>
In-Reply-To: <20200914114651.105219-1-fazilyildiran@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:b9:9593:5cb1:ebc3:8ee9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0906184-8f63-48b6-44d5-08d858e77774
x-ms-traffictypediagnostic: BY5PR12MB3699:
x-microsoft-antispam-prvs: <BY5PR12MB3699091878377E2A6773E15CB6230@BY5PR12MB3699.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FJ/L52yMscMGoxinEYOU36QCN3QzTl5Geqc/4tIVXRRGBUD1t1Wy1DzyQBjGHarYeAw8U7O7BlUS7aKw+SEFChCpVryyjQ9ZkOeppuUKiRJekfteRrLljOjjpwPPaybKODhrNnNsrdcqhdWZLZNuILNI+lvvdgW38jWgZvPZTvvrNRVu3yTajYV4/pGPRelhl+Re52V04F6p/Vw//qq1iV8jxkeNNRkCT7KOEQCMQUlfhs85XR7+BzAsWVpbLKETKbAFHf4Y1kqrocVZhGaW/1UxO+2XBQC/+bwvYYZu8WKsvKhYc84dw1JWNVaBEKY7iyqPdLwIeOytrzMhBjM3rx5PHGJ+eWIjLgz07c1/0viXtWj7mGUITK6KiHW00vl2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(366004)(39860400002)(136003)(2616005)(478600001)(6486002)(86362001)(53546011)(71200400001)(36756003)(6916009)(316002)(6512007)(4326008)(83380400001)(31696002)(54906003)(8676002)(186003)(6506007)(2906002)(76116006)(31686004)(66446008)(64756008)(66556008)(5660300002)(66476007)(66946007)(8936002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: vlJ3kdJjrDXWQtAkjJnMvq9Nzz+I+EBrdEbZLa/FfmVYQmzsx1rAwGwh9mdyvAi0dL5Wnb+tqHVvuxfpE/XliUzKJIlacNtLa5bCKsXEWgOIouISr6Sx+s+2aG5KyL5zgqApeKtVeXAuNyuAy97p2CJzZHEivXYeyQNy81wmtRQN6lV1nNJTzlSQ5F6RfLeg6+GWK52kaHoPgP/d8MtHeBAqy17LP6y3SZGTzbFokC2opYxxHOgVl+v6bJPnAPDR/Vu0qeD4Z8I3D1up+efgrZNcNat00BGlJlfOqa4Si6Ss9O5nwYTSugDenWEdKV9Mr+sxVQOKJF0Gnw7t1jFkMF8I2mWsql+TzixGXAs25YoBOYV2GJrm9Gf2cGVgeT+3/jQOKhL2F4zyd6q90c6Y0o6W+SEUk45gUSZUOJZ8ds2Mn7/FuAzyOWxu+3cRLHe8IhM3MBn7CmpMJquWZngI3QgM+aox0IWkoHG38S60IwnuqhXEYNaa2QlJgWG0tFQtbOkY6PCD0sSXrn1gxpLARPt/arfYW4+BE0RLNQSyde1jEJnqUDlANh3D5ywpo4JBHo/BJp1ICnsFwtxFdDjbrYkqjBvUYwE7GXghehFQdLoVmw3X105nhmLC6TNWzRGW8N9TsfV0DMszwOFqpIRccb0qQNSCpXeQN8+vVxzN/6J/HWGvnVDHgkkZEjZp3gBdYdsB2L6oC0VLN/uONbpXig==
x-ms-exchange-transport-forked: True
Content-ID: <01FB78103ED1DC42B5BCACA7BAFB6EE2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0906184-8f63-48b6-44d5-08d858e77774
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2020 19:50:43.6064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BtupoLWcKyABhM3E935U7RjiS9B2MNsqlenGvYQRD12U88ngWnDHSidsCFMDiTKo26vQbfDd4RllDRsZ42SeCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3699
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_155054_683664_962DDB73 
X-CRM114-Status: GOOD (  19.60  )
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
Cc: "paul@pgazz.com" <paul@pgazz.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "jeho@cs.utexas.edu" <jeho@cs.utexas.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 9/14/20 4:46 AM, Necip Fazil Yildiran wrote:
> When ARC_SOC_HSDK is enabled and RESET_CONTROLLER is disabled, it results
> in the following Kbuild warning:
>
> WARNING: unmet direct dependencies detected for RESET_HSDK
>   Depends on [n]: RESET_CONTROLLER [=n] && HAS_IOMEM [=y] && (ARC_SOC_HSDK [=y] || COMPILE_TEST [=n])
>   Selected by [y]:
>   - ARC_SOC_HSDK [=y] && ISA_ARCV2 [=y]
>
> The reason is that ARC_SOC_HSDK selects RESET_HSDK without depending on or
> selecting RESET_CONTROLLER while RESET_HSDK is subordinate to
> RESET_CONTROLLER.
>
> Honor the kconfig menu hierarchy to remove kconfig dependency warnings.
>
> Fixes: a528629dfd3b ("ARC: [plat-hsdk] select CONFIG_RESET_HSDK from Kconfig")
> Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>


Applied to for-curr

Thx,
-Vineet

> ---
>  arch/arc/plat-hsdk/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arc/plat-hsdk/Kconfig b/arch/arc/plat-hsdk/Kconfig
> index ce8101834518..6b5c54576f54 100644
> --- a/arch/arc/plat-hsdk/Kconfig
> +++ b/arch/arc/plat-hsdk/Kconfig
> @@ -8,5 +8,6 @@ menuconfig ARC_SOC_HSDK
>  	select ARC_HAS_ACCL_REGS
>  	select ARC_IRQ_NO_AUTOSAVE
>  	select CLK_HSDK
> +	select RESET_CONTROLLER
>  	select RESET_HSDK
>  	select HAVE_PCI

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
