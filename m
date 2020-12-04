Return-Path: <SRS0=o9aI=FI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DA8C4361A
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Dec 2020 00:30:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 138B3223E4
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Dec 2020 00:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 138B3223E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8WMdVnvO+SeApBmQJfXsRdNu1RQZDqWmDGvco91MdjY=; b=sCUISiWil1XvdWkSkt/YCqADi
	m3RBlf9EHfk0R30fjJtYTgQFUuYpiGImH7mJBoE+0cCS6bN1v7f4ACdTlbSH+3jd2vA4A3Rdyazrk
	u/VtIzvogDimCIPr0f/U0VqdmpLNyJI+VALUOzMXV8uH18Re5OiBcDaDBVrm5XJf2Nv3Z6ZjjP+6+
	Vay320mi66FFivVXN69PtLQQ9bdf8G0c3IsGLY4xobd/HdnDZBgUTGZiDsnCVfAHyrhoDfVsHDDxc
	zFOroXbcOwO6SJFqHA7Oic+WNkJmS6qS5MMH5X0mvBNIjBObof96d0n/eTZ+7AWtH1C8THe99g6xR
	V4pmBdKYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkyzm-0007W9-QP; Fri, 04 Dec 2020 00:30:46 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkyzk-0007Vh-E4
 for linux-snps-arc@lists.infradead.org; Fri, 04 Dec 2020 00:30:46 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 185A640E76;
 Fri,  4 Dec 2020 00:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1607041841; bh=ToyLqeIeaJ349UAuujsUeiScQI3/ci2tBZErTh7ZynU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=XYzm0gqNU1Bp/SXt88c4guTsjbSwqeYRGFLBt+H9EsK5Dq8V8JpPHpUFPyQV2xMaM
 AKjQtB98RdLXVomSKVf2S9w78NInnAhyzVv63fXX46mLO3NqjrPtJPYOyGl9BC5WkJ
 JfRFZFlIBZED8S2k7BF4/H2bDx3nMVS+uNnTLD2w28jAjWXd/qpX0nDJt4yVO6BBr+
 rY7cmfMON3cubCITlGAfir2N6owEYyV9sodrKewH/SdYzYAnH3SMnHsMyY1+kMxyiL
 fyWSCCggGrksAJ3H3ZzOgKSeuItejWtcp2oKyR3vbs8iedpEDxzfPAqxj+uuozzv6l
 k7mTsaWcNhmjQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7BAEDA0067;
 Fri,  4 Dec 2020 00:30:37 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id D579080214;
 Fri,  4 Dec 2020 00:30:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="mqDQAXwE";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlF9Oc78PBOSF0EmumyB8nxnrfA8yjVkVt+17Nv0vgN3l9/+SomMDWelypeUX1knBfNgqzfyneLFg1bLLciS5oHdER2Io6RKCwJ5WbKnIRrBSzU2OPw28j8LxWqh5nn+ldoftfrFrFvy7OiUZQI9u6nPf0fCrwfGzVtx6Hn3wIobfpCcKtL/phMjFLLvfi86q9XDJNts1cycT4rr3jMllqY3wFlOtDt5w7f2QmJKmUVrkSWANME7JSFnO+pIw7I/08V+FTgxz0t7sR1Qo0HtDNpy6Z+pdxQzULZjw1whtTTqhUwyaAS71fbb79WDLRPM1OPHsZRKdh0Q5N6hUmEmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToyLqeIeaJ349UAuujsUeiScQI3/ci2tBZErTh7ZynU=;
 b=f+QRQQKaMjq+TdtoFzldDCtauNrV+wOuc4j3gEm1LLhSFuIxglBe++7PcGyl4vuZ2+wyA6H5SfUGlYEO3INdd8yuCN7ck/PWFdi9qGEGfQ4iOl5PXLofFFkWkVk48qUbl9lXxlaNSSxGqYw1rzO1YBWPGa37Fqs84cjAr9RA25hUtoC9uT6hTdQgp2zM8AzhIbHnI4oKPszWZAvldMv6Ot6TJLEcQLRb3GNXQMcJDWU5MSqxBxFmW+mQgT8SnWQBnZ/nvwosFHjJKLU/Q869UALTSGRCdHFTYn77eknac2VT1+J2it+9iA/dTb5+7G9RSAP6jgViKIMbz5P4uPcG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToyLqeIeaJ349UAuujsUeiScQI3/ci2tBZErTh7ZynU=;
 b=mqDQAXwEHGYbxVcLV0nxVlyQF4MB6hK5RvOsWlm80pDZIHECyaGAD/UfR/xWKfOWRVjpevDoABgJtVew1Kvam9P6Yn0j+mx4POFJ25tNG9eLoyGrmwq/mVPOyBCx4eU1lr7lIlXWYdvERWJn8fIlxqJvy8oqRDKZWbsrA1GP6j4=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3254.namprd12.prod.outlook.com (2603:10b6:a03:137::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Fri, 4 Dec
 2020 00:30:32 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31%6]) with mapi id 15.20.3611.031; Fri, 4 Dec 2020
 00:30:32 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/3] drivers/irqchip: Remove EZChip NPS interrupt
 controller
Thread-Topic: [PATCH 2/3] drivers/irqchip: Remove EZChip NPS interrupt
 controller
Thread-Index: AQHWydSsYldq4gnw00SliHhXITN1Bg==
Date: Fri, 4 Dec 2020 00:30:32 +0000
Message-ID: <04e1075d-77a4-9144-f96f-319c3b84ef85@synopsys.com>
References: <20201105212210.1891598-1-vgupta@synopsys.com>
 <20201105212210.1891598-3-vgupta@synopsys.com>
In-Reply-To: <20201105212210.1891598-3-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d65f892-abfc-41bd-5346-08d897ebcf5a
x-ms-traffictypediagnostic: BYAPR12MB3254:
x-microsoft-antispam-prvs: <BYAPR12MB3254736F6BC679C4AFC26390B6F10@BYAPR12MB3254.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lP/Kz1UFwFeyjq0d8LR4bCWixITB0B0+jF8t/7ZDXfBIqEf/lkzELdKZoMRiqjJnpC3gmtoJOCK2K8BIcVUcL3dwHlAXtP26LBMbEZfalZ6s+hmtyudKFOzFoRfpOrHZJ1KI0WUVR6KmRor7xFyoXnONYJlk3/2CJpn5fI0mg9bwgNw3t31HCXWJeoQeKirOC3s4afEBFMMbvQvVJfH8hJWC+Vag1/6mFKrDCFCdl8yoh5j+V684PEQwUEZEvmh+Bek5jogzgWEWtDI/vQWaYjJmx0P7VxfFeEKJoIxVZ5OPvmYRher8K7zvY8KdAU6RppABwr9bXMYKE5x5XHIakXkHQ7BTo6xc3KbHzQGvgEiSE6lkIFsI96Q3SkJyaJV9iDL7m0dZ8HkSCQhQNoPCk4edJWHpKV0qmLMrsUamwlY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(83380400001)(66446008)(26005)(64756008)(31696002)(66556008)(66476007)(110136005)(76116006)(54906003)(31686004)(478600001)(8676002)(5660300002)(186003)(66946007)(36756003)(2906002)(8936002)(316002)(2616005)(86362001)(71200400001)(6506007)(6512007)(53546011)(6486002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MGVwY2dhRjdPNnE0eFNzSlIxZjhyekdzV2U5RzNQOXRrazFqSFdldWdGMlhu?=
 =?utf-8?B?eEdIZk9DWEppSVVNTGwvalA0Y3ZvUFRTbTNEQkpIOW1mejk1YjcrWDBrbzJ6?=
 =?utf-8?B?L2VEUnA0dUg3bEJRZ1VBQVprbTV4ZUk2MGphQ3VvRlhjZmtIT2tJN1Fwb0Vu?=
 =?utf-8?B?bjBYcTVUQVhSOCtXMnZhYXFhMDBHS1RUYm0xSnFOV1YyM1FqYTFOVkVlNWRJ?=
 =?utf-8?B?L1N2U29HcGlVZDFQRVlmZ0phN2pCMzB5cWU4T3pob2hYZHMzVHNXMGhrVXVD?=
 =?utf-8?B?S014TzJnVnUxY2I5QU9BVWhnQlc3SXU0eXdyQzNOMHU3d2xGZ0lRcXl4Nytn?=
 =?utf-8?B?RXVVdkJEdDU1Z20yYTRXRThDcXJ6bmtJMStTMURkbGxiZDRVVjhEMUc3dVZO?=
 =?utf-8?B?QUl1dExkK3dqRFBDQUo0YjlpdUZrMTNMem43aTkrcFNjMjYrU3BTYlRPSTVw?=
 =?utf-8?B?aGc5RXE2WnFPdlArQ1pWMVJMakJTdXNvcTZUMkRQdzFqUFlQL2x3QXhKZnZM?=
 =?utf-8?B?cGxhWE5jTUdvN3R3Zi9pWGFPNGR2TVBMSFFIbTVpaEd0a0xvalNqRllqQjJM?=
 =?utf-8?B?K3RqVmNpdHVQWmRTWlg3NVBvMzlqMTduSVFzazA3eVhzbGtSM3hNc1QxV0Ey?=
 =?utf-8?B?emsxM3lLbDhaVFZUYm9iT3RoOEV6MHlDQjFmU3hDb05ub20vcnI5QW1ya2dO?=
 =?utf-8?B?RTB4K1BqYlprU1VqV0Z5OWcybnoxUmVYVlpsYldhUzdQNzdmbllOWDl1dGg4?=
 =?utf-8?B?eWltUTJHYUlrQ2dQWVVjZ05JNS95QzZQQXByZXVWdWZrbStGOGpMRDZEM0dz?=
 =?utf-8?B?bjNYaHA3V0VlTDVMYTVZOXpKelVYemhyR0NtNFdXUjdyQWd0RmRXdVpYcFpT?=
 =?utf-8?B?eEZ0M0ZmNHQvMk5XbnJvZkFBYXdXWGFwVkhkeHZXam9mTXVTRGNTd2dWVnVi?=
 =?utf-8?B?M3ZiU0dzUDNHZGlXM3l4Zi9NVUVKUEc4UFZaRmdDdEdydzFuSVlLUEQ5SlJq?=
 =?utf-8?B?UTk4amVsTFM2TVJIdmNYSUp0eEY0NE50enl0ZkRZVnM0WnNONUV3ejBaVjFy?=
 =?utf-8?B?NWlWODlIVGZMOFRvV21nQ3RNeVZyVDhlaDNQNzBJcTJHZHBoaHJReEVJNVRG?=
 =?utf-8?B?V2xrUGFoOTg4bWdETEpkMGxaNlg2WlVNTVNpNkZ3cjgrQlpvcHJmaDlaem8x?=
 =?utf-8?B?WU5QMnBJRURhRmdTR3VFMkM3amJVWXNyMXJRemNObXpvaGFLcUxoRFhKVUx2?=
 =?utf-8?B?RDVEVzU3ZUlTamw1SHFyRVZNT2tsNVg3Q0dSMVBQNFhhUVRhc1AyZmNQT1Zr?=
 =?utf-8?Q?qPY6iY47JIkgI=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <A333E7463D44A747B1FFD52821F677CD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d65f892-abfc-41bd-5346-08d897ebcf5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2020 00:30:32.3148 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GYJpPufO8VKljwaGmqzqYf13eUCJYgFW9MNbRwFtUG1PjZlvpEmrnpgIEF5WDSC80hvIDYyNg2d3xNqw2sCsxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_193044_945149_29A30F13 
X-CRM114-Status: GOOD (  28.60  )
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
Cc: Marc Zyngier <maz@kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Jason Cooper <jason@lakedaemon.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 11/5/20 1:22 PM, Vineet Gupta wrote:
> NPS platform has been removed from ARC port and there are no in-tree
> users of it now. So RIP !
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Ping !

> ---
>   drivers/irqchip/Kconfig     |   7 --
>   drivers/irqchip/Makefile    |   1 -
>   drivers/irqchip/irq-eznps.c | 165 ------------------------------------
>   3 files changed, 173 deletions(-)
>   delete mode 100644 drivers/irqchip/irq-eznps.c
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index c6098eee0c7c..7920c3a3017d 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -389,13 +389,6 @@ config LS_SCFG_MSI
>   config PARTITION_PERCPU
>   	bool
>   
> -config EZNPS_GIC
> -	bool "NPS400 Global Interrupt Manager (GIM)"
> -	depends on ARC || (COMPILE_TEST && !64BIT)
> -	select IRQ_DOMAIN
> -	help
> -	  Support the EZchip NPS400 global interrupt controller
> -
>   config STM32_EXTI
>   	bool
>   	select IRQ_DOMAIN
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 94c2885882ee..0ac93bfaec61 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -86,7 +86,6 @@ obj-$(CONFIG_MVEBU_PIC)			+= irq-mvebu-pic.o
>   obj-$(CONFIG_MVEBU_SEI)			+= irq-mvebu-sei.o
>   obj-$(CONFIG_LS_EXTIRQ)			+= irq-ls-extirq.o
>   obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
> -obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
>   obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o irq-aspeed-scu-ic.o
>   obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
>   obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
> diff --git a/drivers/irqchip/irq-eznps.c b/drivers/irqchip/irq-eznps.c
> deleted file mode 100644
> index 2a7a38830a8d..000000000000
> --- a/drivers/irqchip/irq-eznps.c
> +++ /dev/null
> @@ -1,165 +0,0 @@
> -/*
> - * Copyright (c) 2016, Mellanox Technologies. All rights reserved.
> - *
> - * This software is available to you under a choice of one of two
> - * licenses.  You may choose to be licensed under the terms of the GNU
> - * General Public License (GPL) Version 2, available from the file
> - * COPYING in the main directory of this source tree, or the
> - * OpenIB.org BSD license below:
> - *
> - *     Redistribution and use in source and binary forms, with or
> - *     without modification, are permitted provided that the following
> - *     conditions are met:
> - *
> - *      - Redistributions of source code must retain the above
> - *        copyright notice, this list of conditions and the following
> - *        disclaimer.
> - *
> - *      - Redistributions in binary form must reproduce the above
> - *        copyright notice, this list of conditions and the following
> - *        disclaimer in the documentation and/or other materials
> - *        provided with the distribution.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> - * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> - * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> - * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> - * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> - * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> - * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> - * SOFTWARE.
> - */
> -
> -#include <linux/interrupt.h>
> -#include <linux/module.h>
> -#include <linux/of.h>
> -#include <linux/irq.h>
> -#include <linux/irqdomain.h>
> -#include <linux/irqchip.h>
> -#include <soc/nps/common.h>
> -
> -#define NPS_NR_CPU_IRQS 8  /* number of interrupt lines of NPS400 CPU */
> -#define NPS_TIMER0_IRQ  3
> -
> -/*
> - * NPS400 core includes an Interrupt Controller (IC) support.
> - * All cores can deactivate level irqs at first level control
> - * at cores mesh layer called MTM.
> - * For devices out side chip e.g. uart, network there is another
> - * level called Global Interrupt Manager (GIM).
> - * This second level can control level and edge interrupt.
> - *
> - * NOTE: AUX_IENABLE and CTOP_AUX_IACK are auxiliary registers
> - * with private HW copy per CPU.
> - */
> -
> -static void nps400_irq_mask(struct irq_data *irqd)
> -{
> -	unsigned int ienb;
> -	unsigned int irq = irqd_to_hwirq(irqd);
> -
> -	ienb = read_aux_reg(AUX_IENABLE);
> -	ienb &= ~(1 << irq);
> -	write_aux_reg(AUX_IENABLE, ienb);
> -}
> -
> -static void nps400_irq_unmask(struct irq_data *irqd)
> -{
> -	unsigned int ienb;
> -	unsigned int irq = irqd_to_hwirq(irqd);
> -
> -	ienb = read_aux_reg(AUX_IENABLE);
> -	ienb |= (1 << irq);
> -	write_aux_reg(AUX_IENABLE, ienb);
> -}
> -
> -static void nps400_irq_eoi_global(struct irq_data *irqd)
> -{
> -	unsigned int __maybe_unused irq = irqd_to_hwirq(irqd);
> -
> -	write_aux_reg(CTOP_AUX_IACK, 1 << irq);
> -
> -	/* Don't ack GIC before all device access attempts are done */
> -	mb();
> -
> -	nps_ack_gic();
> -}
> -
> -static void nps400_irq_ack(struct irq_data *irqd)
> -{
> -	unsigned int __maybe_unused irq = irqd_to_hwirq(irqd);
> -
> -	write_aux_reg(CTOP_AUX_IACK, 1 << irq);
> -}
> -
> -static struct irq_chip nps400_irq_chip_fasteoi = {
> -	.name		= "NPS400 IC Global",
> -	.irq_mask	= nps400_irq_mask,
> -	.irq_unmask	= nps400_irq_unmask,
> -	.irq_eoi	= nps400_irq_eoi_global,
> -};
> -
> -static struct irq_chip nps400_irq_chip_percpu = {
> -	.name		= "NPS400 IC",
> -	.irq_mask	= nps400_irq_mask,
> -	.irq_unmask	= nps400_irq_unmask,
> -	.irq_ack	= nps400_irq_ack,
> -};
> -
> -static int nps400_irq_map(struct irq_domain *d, unsigned int virq,
> -			  irq_hw_number_t hw)
> -{
> -	switch (hw) {
> -	case NPS_TIMER0_IRQ:
> -#ifdef CONFIG_SMP
> -	case NPS_IPI_IRQ:
> -#endif
> -		irq_set_percpu_devid(virq);
> -		irq_set_chip_and_handler(virq, &nps400_irq_chip_percpu,
> -					 handle_percpu_devid_irq);
> -		break;
> -	default:
> -		irq_set_chip_and_handler(virq, &nps400_irq_chip_fasteoi,
> -					 handle_fasteoi_irq);
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
> -static const struct irq_domain_ops nps400_irq_ops = {
> -	.xlate = irq_domain_xlate_onecell,
> -	.map = nps400_irq_map,
> -};
> -
> -static int __init nps400_of_init(struct device_node *node,
> -				 struct device_node *parent)
> -{
> -	struct irq_domain *nps400_root_domain;
> -
> -	if (parent) {
> -		pr_err("DeviceTree incore ic not a root irq controller\n");
> -		return -EINVAL;
> -	}
> -
> -	nps400_root_domain = irq_domain_add_linear(node, NPS_NR_CPU_IRQS,
> -						   &nps400_irq_ops, NULL);
> -
> -	if (!nps400_root_domain) {
> -		pr_err("nps400 root irq domain not avail\n");
> -		return -ENOMEM;
> -	}
> -
> -	/*
> -	 * Needed for primary domain lookup to succeed
> -	 * This is a primary irqchip, and can never have a parent
> -	 */
> -	irq_set_default_host(nps400_root_domain);
> -
> -#ifdef CONFIG_SMP
> -	irq_create_mapping(nps400_root_domain, NPS_IPI_IRQ);
> -#endif
> -
> -	return 0;
> -}
> -IRQCHIP_DECLARE(ezchip_nps400_ic, "ezchip,nps400-ic", nps400_of_init);
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
