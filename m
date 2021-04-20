Return-Path: <SRS0=81lh=JR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B648C433B4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 02:49:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BE576113C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 02:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BE576113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TC8/kAYFHoOGpaC3VMGRRFJZLYytHZa/4z+68Wk4vo0=; b=VhdphHNRHxX4F06XO8TO20O3I
	XKkLTs3+QgX3bs/Mh2HcsOsZT4il+wUfuQ1L+TLtPdQmVPAOz+HxvuoNb6NVbK0Vo210h6OR3vawU
	TlL0Ok+FxgPpV+fqk3eTC0rys+L/JLA8osn3U8hwUbPM5iGxcpxheNar05m5pP09dcgbCwl9jVxy4
	EC92yDaJOA7/m91OIM6RcFJhs2AJP7XpZSGzjiv1ESfD1HmYL104uh5ysWRsImhbFyclIN1/09zO7
	hPm+7DXlyYfonqmsFI0dLGggwmgfQ6Pgc0Nm9YL3cUYg8UQfPNwlhcf1H9kQClmuHZRc1Pa5ggPOK
	ReyrnAktQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYgRc-00B17P-So; Tue, 20 Apr 2021 02:48:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYgRL-00B15c-VU; Tue, 20 Apr 2021 02:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Description;
 bh=qUAQP+IGrGdZp0YA+E2JQQ+xs1dUfAdn6QvpZjqfK2o=; b=bor2MSjV0lk4/L0t/Fqd0aVJyb
 8ySYBrYBuk+C5OKtsIbUMDASQGvBfDDkWMH5Jky1thNjcN1mqSg1GJwfuLimeuNkSmmVVHoArtyOv
 wk9AcWKXtMgAxDGD4K/DZsfA7cODKAOLaszy1FscbhYt9S5NuXZA64x1K4LXJ9nxCZ/tVz5TeceyH
 +Q19W5/Eu8cGckM50eU7vF85+kL46buT4ikJuaesIaUhj/IJdedFJJsiMjFF2ENMxWGrp6fSHqmr2
 8avnBodFAM4dElpnak7v3FjE7UQPwr2poLYbVdnGlsTBtLWc3Yt1Dh1pDLFrHKIDosWTLnw6jZVpd
 z4712PUw==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYgRG-00BmBu-HB; Tue, 20 Apr 2021 02:48:38 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AEE07C0080;
 Tue, 20 Apr 2021 02:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1618886910; bh=qUAQP+IGrGdZp0YA+E2JQQ+xs1dUfAdn6QvpZjqfK2o=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=jAt+h+uwzj3Qc0I5b/CfO4CqwhoDdPqf/fW1vkLKbIyl+nF54GNdJI2TwAje68eNX
 ze/DSIQvgv/PnVjBGOoMx0WmhM1JeXGDebND6AJGfTraa/8o3F4LSf/u9u4iQJYTQf
 iU36VyI1LIKdGkVpXH+zf8bTov4U5CAiEChAMk7RmTXV3tHhroySpcBDaV5YLKoBGM
 +jCVzSh3FW08oz7jVtRml6zBr8TKh8Pnej6N5gf/sAQdfAJAHZv5Y4PVoS3pe4dQcB
 ZttN1M25DwzQ9GxCeL0hRq7mrTzCN+JtMyrBux3oismNFN3qjw4yKViCjqLCu6+As2
 vmpJZ1iN/RoOA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5A85AA0096;
 Tue, 20 Apr 2021 02:48:23 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2044.outbound.protection.outlook.com [104.47.74.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id C88E04009A;
 Tue, 20 Apr 2021 02:48:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Q4RCQFRY";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzVLhOq1G7swHWFHB+GNE4jXIZjVUI0fk8tazUbFmlnBN7pVtS93bxxOF7+J8TmJ0AGgnKFA0124DPQUdhvaxO2JH8cbsB3OSinKrm39hQ8GnmG/ZxE7geb3nXv2GCFkI4s/XOxUVrnOe6ZXXTblLcC2tmNqsGFufuizBqJQfelnK8KJWZWQwVtxiudtCTT/YT9gZIzGjwLGGiIBRNaksxXfCtL2e51d8iT4Dy+Wnj0FAjF8EReeldP42ylWrAEgWZIJ1CPX4BhKSJNLvBtB848CtQYWSDmvFUBfXD0GuuQGLwGmAHzPQ9D5Z3wVsga5JGl/7WXAob7DCoE+lU5eUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUAQP+IGrGdZp0YA+E2JQQ+xs1dUfAdn6QvpZjqfK2o=;
 b=Xjjhxg8ASS3Xsa9iFjmP5eaig8AU7UFOqEg3ZdWot+cwt/jAiv9UtpjkMdGkJTOwfnh+5s52pXkIer9TF7hL8wcMrORUFeJ1tIKNeEU2VwZoIsBUqxDzHZAttpEt9IgDNOViUpKOdS9sGZIbt8+S00pcWPhYxN/cHj9h++13+Gb4XxIQjbaiyL7BdnQHB5hwi1WuOeUmfQQOFNF/mQCmvNBDkCEnTPT01CN0ZyRPTO1y9IRaqzXP/c3hxirjHRhQ7/vN83Qn2Q5OoUQanX/DMhtRAUFCPV8j5/NfyHelJsMf0X/N9IgiVGQx458Y2nat8eE/IeG9bUjaEdb1loLSdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUAQP+IGrGdZp0YA+E2JQQ+xs1dUfAdn6QvpZjqfK2o=;
 b=Q4RCQFRYvLoPAJY0k4dhNg5HIeqpZuUipyR56fvdXtxiqkBsJavn4e1vSf3wbHNMkE3mdAQ9ZkFHG/X5M0KWQp66f3rnTwv4DmV3QGxdyZsKBTIsnY8dR9aPN1P63p0qidt3P4sVNePAV86BYMgVSpxqYYVRyc4P5VqfNBMjflA=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB4982.namprd12.prod.outlook.com (2603:10b6:a03:106::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.24; Tue, 20 Apr
 2021 02:48:18 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982%7]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 02:48:18 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Matthew Wilcox <willy@infradead.org>, "brouer@redhat.com"
 <brouer@redhat.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "ilias.apalodimas@linaro.org"
 <ilias.apalodimas@linaro.org>, "mcroce@linux.microsoft.com"
 <mcroce@linux.microsoft.com>, "grygorii.strashko@ti.com"
 <grygorii.strashko@ti.com>, "arnd@kernel.org" <arnd@kernel.org>, "hch@lst.de"
 <hch@lst.de>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>, "mhocko@kernel.org"
 <mhocko@kernel.org>, "mgorman@suse.de" <mgorman@suse.de>
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Thread-Topic: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Thread-Index: AQHXMxVijWO/awtGlkiVwcCofC+50Kq4AUEAgAS3z4A=
Date: Tue, 20 Apr 2021 02:48:17 +0000
Message-ID: <9f99b0a0-f1c1-f3b0-5f84-3a4bfc711725@synopsys.com>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
In-Reply-To: <20210417024522.GP2531743@casper.infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org; dmarc=none action=none header.from=synopsys.com; 
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae4a7ca5-bbfb-496c-d44b-08d903a6c09c
x-ms-traffictypediagnostic: BYAPR12MB4982:
x-microsoft-antispam-prvs: <BYAPR12MB498243392B89A28882FE3071B6489@BYAPR12MB4982.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HgwXo2HX2pqA9pAHhYTMJVVDJaASZ9sfGYdBkwlxzuarA/FxzHKP2IE7n0T3LQRrjqhwcXOqFc43I96ZtybhZ7zei9fs8OxN1rrdWQxBqmzF5it4KXKdxqddq4Sbv7TdSGCSrKlxPfkpdZtOrukICFc42tm6AgBhER4Wel28hA5gr3bYanZoKkglQ3RPwNmLWOIwBhFSL/9Cv8UHYCrETljQckq4aW43Qben3SkeAEilmWT9oI17cYvgzoSCq8QCqaiWyFV9WD3wAhXuw2uOUsD78ViBUYUAQ4uQLToddwku1KoqTCs2/8ZElYEyfo4w2W3xSN7LfSQpYBJdY0s4h5bb2bLT9JFXZSLMt1nXvFNQ7tualty+MesrrM+xj53QFl96oFu3ysuSpsnHizHK1eBiVaPqe6FGqr2peDE4lDQ+2pzHbrK+/BA7lVyCm5XODpyd7DvvrR7HcvR8EBTr2wLJVSs6hXA+OfuV6XKghtwt3Gqd/582EC03TePdA7+/svbsnQHi053Re9R6CDVUNaBEjyY3wP/uhvtCm4szhD8ngnZXUPhik/7J9pjKYRcGUqBHsNhfuxAxNCTp3qqc18ff687X74ijBqvMSO7fO3f8rAWNwB8FYwmihvhQI2ADd3m+b3SdEJOvhTde5EjQ1CTl8qkwdYOBp7D7nfFO52XZ3SjPktCJNpmAYhuvqWou
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39860400002)(136003)(366004)(376002)(66476007)(66946007)(64756008)(31686004)(66446008)(66556008)(2616005)(53546011)(36756003)(6506007)(76116006)(8676002)(186003)(8936002)(83380400001)(26005)(6486002)(110136005)(7416002)(6512007)(316002)(54906003)(478600001)(5660300002)(122000001)(38100700002)(4326008)(71200400001)(2906002)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dmVPMTd2N2ZQWnppMkcreFJzTVlHZ2tDNnIwT202bk9aQm5tUGxKL3B3WE83?=
 =?utf-8?B?cWlPK0NzZzFyYU5tUUNkTWRhSjJRd3QwbnMxU1dDMDM2WEtZSmliNVcvZlND?=
 =?utf-8?B?Ky95UkVzdG1yQ2NQU3U4cUQyQVQvdXRubDlKS2Q4Z2N2ZG1KajhBc2JZdDVi?=
 =?utf-8?B?Vm1TZkRWQ21sRGRnYzVKMXV0Umk5T2RMaEUrL2NTbnl2VnhkTUdWTElyWHQ2?=
 =?utf-8?B?d3RmYWNHcFRYa0VGd1U4RmUzKzI0NXVZMmtNdTNzTnNnanJXVkJzWlc0NFZy?=
 =?utf-8?B?VDNiYVZqYzdidUlDZVNrNHpyRVFQSk1rTGwyR0Z0aGFVZHhDWHM0SXdyMGdy?=
 =?utf-8?B?VHJEbTBJaEsvck90T3FyL21XcUlMQjU3RG1KRGtyb29IV2VINDRSM1k5ZzFn?=
 =?utf-8?B?MncrRXRPYTVEQ0dxL0xXQzhZQVlpYU15UG9jT0psU1FGUUwraHhPVkFURWpq?=
 =?utf-8?B?V0xZdEIzSy9vOHpZbWtrQjJrZlFxNklVNEhXWkxFS1RCaGlPUzB4OG8xbGhz?=
 =?utf-8?B?azlBZi9JeFdaVm1iTnRyS1ROa0kvWi9BcmJCWjh5b2dGbmRwTmlvT3EyTkQz?=
 =?utf-8?B?bkZoeFo4SG1KTkFlVVhVQ0tnQ25sSG9SN21hZDdGNHE1SG1iYm1Na3ZOSzV6?=
 =?utf-8?B?TjBFMGF3Ti8rbStWTmJVWUVibWhDR2xCWXN1cUUxdEczdTZpZWNxK21XUWxa?=
 =?utf-8?B?a3J5WUJ6TFI4MGcyc214SGtFZVlySmlOa0I0M1Y2TERrSTNCeldXcitUM2c0?=
 =?utf-8?B?cU1VeFE2NGtjZ3JJZVFZNWFUd0MxcXFGTWFCYkVaYnJUalNGWDVxWkE4Sks5?=
 =?utf-8?B?OFZnRE5pajdTcGRqYnpHWDI5Q2dNcEVSMVhQWUF4K0djOWYyNWFrWEQwYTRN?=
 =?utf-8?B?WE9wNEdqc1RFUDhkMytsZXUwbW1iQkFGTFlDOUVDVnMrSjRyME1WT0EzSVY2?=
 =?utf-8?B?Tk9aS2dTS2VWT0taeER5ekZyb1YwK2xDWnhYK1plUkpiUGxDZVFadEdDQmVh?=
 =?utf-8?B?bjFZVytCS0hxa1NhN2xWN01naGFiK1d3dkw4QWZoTUNMOXFLTmRlcHFVQThn?=
 =?utf-8?B?amE2aHhnZHkwN0VPSWgyWUtndDFZV3FaY291OGhnS2VRU0twOVpVSGQ5Q1A2?=
 =?utf-8?B?OUozVnNObm9FQi9URjNoWm9vUlVQRkRSTzl4R3hEL1h0R1VMcDBubmFBckZC?=
 =?utf-8?B?WDU1b2Z6TTR4eDVCRGZMTVhBNFhQOXl5SW1meTBKamhMMDRFSUJ2cDlQNXhU?=
 =?utf-8?B?QTFvQ2hGZ2NVbk1nUnp4VGFIYTFQRTJHV2NnQzJNa0dIR2wzcDVOUGtwNG8v?=
 =?utf-8?B?NlFRS1V2ZkM2N3hNK1hsVmlVcDVXWGNQajRHQVo5amJLZmN4dEpIOEVSV2Ny?=
 =?utf-8?B?UGsvZWI2TEl6a3VWNG50ZWI4S3ZKRkEwWnJCTU5iZE5Ddnp4SWRIREh3RXhI?=
 =?utf-8?B?YWVqR21NZFVqNTN4ZzhGK29lYXB5QVVLdlo2QXJYQkhCWFJzRHFiWm9XUk12?=
 =?utf-8?B?UkJOblAwVHBkR0V0T2x4Z01kSW9aL3VlbUI0Nzlxa1lUQ3kzTG9GNHhKN0F6?=
 =?utf-8?B?cDkwb0ZYYkFtVWZWUFlzZEJ4aGhCSkRlbzV1N0tORjB6eHdQUklTQlJJa1pN?=
 =?utf-8?B?UWw3Q2xFUnNERXlCRzJ5dlZLOWRxUGxSMVpDemR6ZUsrWXhFNDRQZGN2ME1C?=
 =?utf-8?B?VkoxNldmWVNrRlQrR3QrQW01VHAwUk5yeXpUNVM1bi9vZTFXUHhiWG9nOENX?=
 =?utf-8?Q?LgoZTf9Z1d4IaxtQ7Y=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <4BDBF6EFD3284647AECFC870F7B57F29@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4a7ca5-bbfb-496c-d44b-08d903a6c09c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 02:48:17.9954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sSIHKpZAMSbnlRcpRRWTq7fVCDb0jABv8dUhZuXm/OzEtRDgUG5Kz47UksNzMNEPkTPgwzM/eLTm/wntBwD2cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4982
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_194834_640067_47D2458B 
X-CRM114-Status: GOOD (  31.24  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Hi Matthew,

On 4/16/21 7:45 PM, Matthew Wilcox wrote:
> Replacement patch to fix compiler warning.
>
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Date: Fri, 16 Apr 2021 16:34:55 -0400
> Subject: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
> To: brouer@redhat.com
> Cc: linux-kernel@vger.kernel.org,
>      linux-mm@kvack.org,
>      netdev@vger.kernel.org,
>      linuxppc-dev@lists.ozlabs.org,
>      linux-arm-kernel@lists.infradead.org,
>      linux-mips@vger.kernel.org,
>      ilias.apalodimas@linaro.org,
>      mcroce@linux.microsoft.com,
>      grygorii.strashko@ti.com,
>      arnd@kernel.org,
>      hch@lst.de,
>      linux-snps-arc@lists.infradead.org,
>      mhocko@kernel.org,
>      mgorman@suse.de
>
> 32-bit architectures which expect 8-byte alignment for 8-byte integers
> and need 64-bit DMA addresses (arc, arm, mips, ppc) had their struct
> page inadvertently expanded in 2019.

FWIW, ARC doesn't require 8 byte alignment for 8 byte integers. This is 
only needed for 8-byte atomics due to the requirements of LLOCKD/SCOND 
instructions.

> When the dma_addr_t was added,
> it forced the alignment of the union to 8 bytes, which inserted a 4 byte
> gap between 'flags' and the union.
>
> Fix this by storing the dma_addr_t in one or two adjacent unsigned longs.
> This restores the alignment to that of an unsigned long, and also fixes a
> potential problem where (on a big endian platform), the bit used to denote
> PageTail could inadvertently get set, and a racing get_user_pages_fast()
> could dereference a bogus compound_head().
>
> Fixes: c25fff7171be ("mm: add dma_addr_t to struct page")
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>   include/linux/mm_types.h |  4 ++--
>   include/net/page_pool.h  | 12 +++++++++++-
>   net/core/page_pool.c     | 12 +++++++-----
>   3 files changed, 20 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 6613b26a8894..5aacc1c10a45 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -97,10 +97,10 @@ struct page {
>   		};
>   		struct {	/* page_pool used by netstack */
>   			/**
> -			 * @dma_addr: might require a 64-bit value even on
> +			 * @dma_addr: might require a 64-bit value on
>   			 * 32-bit architectures.
>   			 */
> -			dma_addr_t dma_addr;
> +			unsigned long dma_addr[2];
>   		};
>   		struct {	/* slab, slob and slub */
>   			union {
> diff --git a/include/net/page_pool.h b/include/net/page_pool.h
> index b5b195305346..ad6154dc206c 100644
> --- a/include/net/page_pool.h
> +++ b/include/net/page_pool.h
> @@ -198,7 +198,17 @@ static inline void page_pool_recycle_direct(struct page_pool *pool,
>   
>   static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
>   {
> -	return page->dma_addr;
> +	dma_addr_t ret = page->dma_addr[0];
> +	if (sizeof(dma_addr_t) > sizeof(unsigned long))
> +		ret |= (dma_addr_t)page->dma_addr[1] << 16 << 16;
> +	return ret;
> +}
> +
> +static inline void page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
> +{
> +	page->dma_addr[0] = addr;
> +	if (sizeof(dma_addr_t) > sizeof(unsigned long))
> +		page->dma_addr[1] = addr >> 16 >> 16;
>   }
>   
>   static inline bool is_page_pool_compiled_in(void)
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index ad8b0707af04..f014fd8c19a6 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -174,8 +174,10 @@ static void page_pool_dma_sync_for_device(struct page_pool *pool,
>   					  struct page *page,
>   					  unsigned int dma_sync_size)
>   {
> +	dma_addr_t dma_addr = page_pool_get_dma_addr(page);
> +
>   	dma_sync_size = min(dma_sync_size, pool->p.max_len);
> -	dma_sync_single_range_for_device(pool->p.dev, page->dma_addr,
> +	dma_sync_single_range_for_device(pool->p.dev, dma_addr,
>   					 pool->p.offset, dma_sync_size,
>   					 pool->p.dma_dir);
>   }
> @@ -226,7 +228,7 @@ static struct page *__page_pool_alloc_pages_slow(struct page_pool *pool,
>   		put_page(page);
>   		return NULL;
>   	}
> -	page->dma_addr = dma;
> +	page_pool_set_dma_addr(page, dma);
>   
>   	if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
>   		page_pool_dma_sync_for_device(pool, page, pool->p.max_len);
> @@ -294,13 +296,13 @@ void page_pool_release_page(struct page_pool *pool, struct page *page)
>   		 */
>   		goto skip_dma_unmap;
>   
> -	dma = page->dma_addr;
> +	dma = page_pool_get_dma_addr(page);
>   
> -	/* When page is unmapped, it cannot be returned our pool */
> +	/* When page is unmapped, it cannot be returned to our pool */
>   	dma_unmap_page_attrs(pool->p.dev, dma,
>   			     PAGE_SIZE << pool->p.order, pool->p.dma_dir,
>   			     DMA_ATTR_SKIP_CPU_SYNC);
> -	page->dma_addr = 0;
> +	page_pool_set_dma_addr(page, 0);
>   skip_dma_unmap:
>   	/* This may be the last page returned, releasing the pool, so
>   	 * it is not safe to reference pool afterwards.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
