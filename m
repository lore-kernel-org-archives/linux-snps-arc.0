Return-Path: <SRS0=C+4U=KF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27853C433ED
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 20:22:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C93361007
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 20:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C93361007
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ITTj8hv//Yt16288BR4MfgyLDolc38Fq9wiHVFkhTtc=; b=NPHzurK6C6XO13ac5nEouFPwY
	vAM13qeTVywOOjufos6FjyGA/cancCt9JAzIKg+SKH582IGETHkuad1Hx0eukXDhnmjI8bAq/8ClS
	mRkRp3gdS1RHB2UzBr6FgmVkDvapPFYBP+WTuksf6Dfa+u/uxFQYQCBBOOu4gdilEHhl0DHHg8Exs
	VYKKdQcXT/5m0W22sa7zkmmd08r0Crz0Mzfsy6Zhw/+xGIXJJTPtLVTYRsSw88Qpt0ARNU7CX8Gwl
	u+vSfUyxebO89rZ0h+QSVYY0h/MMYevsXOo1PkOgf08d2sCt8cICDNqKL1uM1O8kIkqwFyvcW362C
	HgqGgwmiw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgCQ6-00FeSM-Dz; Mon, 10 May 2021 20:22:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgCQ5-00FeS5-2z
 for linux-snps-arc@desiato.infradead.org; Mon, 10 May 2021 20:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Description;
 bh=w4t03/a4ZGuhhE7zXKDnL4ktz+7qHWZ6kw+w9L/3pAM=; b=NuSNMJ/dgTjSL/GsLpKOKqqT/2
 zbPI9N3iCQmLPoxekEkogDE4LFqiXb9HGuWJ26McBS1PK8ScNjK1yi8NkhhSJ1mj3W4dhSEZnN91S
 9VSRIWLdX1z6MKtBg4L7udKMGo6reOak9bWZU87lbEB3hq2Skf8rpjWQ3q6/cMYxICVSP3QMF7sgR
 gJ3mH8ZWBTt8j2urK7n6fuGdC3ukjWb5plwRan1LnZInNcCalGOiiSCfZ5FyEHSA6aDZ8kYq4bmes
 d1+zwueU62FtVPwvW03XbZb7BzqsN06ED0PDBBro4sm3bSnN6i9Zp7QhEV/buCmIgnZ8ODyTXawMC
 0vWXC93Q==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgCQ2-0096OT-3E
 for linux-snps-arc@lists.infradead.org; Mon, 10 May 2021 20:22:23 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AC6AD401D9;
 Mon, 10 May 2021 20:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620678141; bh=w4t03/a4ZGuhhE7zXKDnL4ktz+7qHWZ6kw+w9L/3pAM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=RNNffdSQHsujDhozGMTdi8HK6bPxvE60YloaWkh6zwIjMDWm20f1mfbzI5thRf4xc
 ovpgG+2zxV1iM1v/BeBPcYR/zATCoT2UJBep6RJ+Fr/QBUo54KVU0L04JJ5FMY8g7a
 MBTkcg0LKFqYMxDwNkiDb9QEhC6XxM+TJdu1mswcP+m/1+CyvAwPVWm9RhPjBwYG7e
 z144eLSgsnXahkzM9ZTYdYk7jAI2CzkEocHnQLfhmwL8gBzFZ36D9PaFSmk59Zo7xe
 4QqNu4hSVwKrZcruiw5FuGdo/7doh3FBm648BbgsWDlN9Hi1l+PoWPsIn9o0H3lN4K
 kq+5cqm6vj/vA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 28A61A0062;
 Mon, 10 May 2021 20:22:20 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 64BE9800C3;
 Mon, 10 May 2021 20:22:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="SWqmfVGd";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmFNssn/mk+EyQ0Tn+P04+ATDmGOGH1ds2SXkiKGDxO2TqLAYHQ5UqeJNfAs+094AjMFP/yOXPxsGCu+itUM926vOEdu3yxg8Ycpuqd8y6hXxtS9rv3H5cpNv3ZsgoSKRBi5cQ7u/Tz3m1JbJe58OQ3uzTAop2UO6Vg2BB6SQdghpwWExK9Bcz1ae/Oi1IT5gN+EYVxQThgnRH4dj9v02Q0nbkosXqBTxWnS89uHL1G/O3toi+0wkjXLo960cgiGnpdzhObsXkImzZ3OSRxZpbvSFGJbDUsCXxOqen0MRnRjNlhf3ND0TsfkJYWsP2vUpxNWL+rOiTvG7ISGts+flQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4t03/a4ZGuhhE7zXKDnL4ktz+7qHWZ6kw+w9L/3pAM=;
 b=UQYz5p9Q8PeLOmeZHMoeSAlahKBNMygzqBns3oIj2OqoPMGa1IESbfdqYNh/eDNAAVPvKUq4jAg8H7gXAq74Lhiyb76aX94LOnq74ffz99KqzxLluior2sM5QpJYTBE/AyAvFcDHrgs5UeI+IYxHwKn8guymC1AhteQYrEfkiXYreu2G7QE+frTuPzIFGNSlsVk3+Hy6gbLjKbDfCEBTKq/X0qzpjZRq/7nlcukNvnYj7h4R05JLPix14L2CrV6syCb3JBGocxM0okpvN8HBDjGCfoclegTegqCopbYwc8rROUSR3ithoCqEGw9xJfXfH2qRR6InFZxyzDPNu/meXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4t03/a4ZGuhhE7zXKDnL4ktz+7qHWZ6kw+w9L/3pAM=;
 b=SWqmfVGdUCgzI54Lee6Mcf/dbY2/hsVChclol1g9+GPWTWMuS+KursFaz2qqQ7WBMEtd6pHTUYH3ENfUnbU+rpSjH+KCv4NxsTUZWoq3vfAzTp8o0Ay+IEMLZsv2YKNjGnvjtu4OZQMEdojHMr4J+mAgil6778SskRIFc9m8sY4=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3528.namprd12.prod.outlook.com (2603:10b6:a03:138::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 20:22:15 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 20:22:15 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Vineet Gupta via
 buildroot <buildroot@busybox.net>
CC: Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [Buildroot] [PATCH v3 3/4] lmbench: emulate --prefix to avoid
 scattering binaries all over
Thread-Topic: [Buildroot] [PATCH v3 3/4] lmbench: emulate --prefix to avoid
 scattering binaries all over
Thread-Index: AQHXRcZtNxAMOp/k1UyLVLMgI3QVaKrdJTmAgAADjgA=
Date: Mon, 10 May 2021 20:22:15 +0000
Message-ID: <e39b28e8-79c9-df44-5113-82af630ebdfb@synopsys.com>
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-5-vgupta@synopsys.com>
 <20210510220931.1dc78bde@windsurf>
In-Reply-To: <20210510220931.1dc78bde@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cad8662-bec4-4148-bc1b-08d913f14d21
x-ms-traffictypediagnostic: BYAPR12MB3528:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB35282EED615116172B8727ADB6549@BYAPR12MB3528.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MDzuORjh15eEq74HRl7CnHi3U0kIVBXycIPyK+4DUGYq+VgLUG5WdGgO9PKpNHV/Z3QfXixynriffDowxrBiA+xxaxqct+SunG4E92hDi8TPeuulOlHsCAIWPeBq+BAJLjAorfr+NJaYaf9Cw0UtSnUbbhltjpGuEvZUfAcxZQo8lh0hbNkegATpHhKFmH9hvkFxKownwNAUN69HVtURKkAk6OKZbU50sAj8rc0mZYBBvwXpiQvlr5ZN7zZMukKDIkVfUT0NFqW4q8E2Q9A9ib9jCisWGN1nzEMG4vDNJqiY3Fg4Axex1Y+EavS1WF4K3j4ACqFjdvo5Z9S6Ldu+jTkVYvLow+zb9tExtnTn2dRFICmxHSI7Sy6vLlIAL1J3rQBI5xYT2pgp22YjcaJx96OLe1Fwk/mOQtK3nM2mictLx6WQd4zSoQcaAdhC4tJv442Rskvr208vVWMxy+sIPhH7qt2V7xAQK+1Mv9A26emfuaPnI9AQS3o5ECvMZAFDS+ncDxrJ5qWMZ8RPgJFkRg06e4/YwpnMO5ZBa+UwpMmCY/z+UNPpQiUpeYl5fN7nnP926nhVA1uVlYfPUblIthzFZjiF3JW+NHVzEmuCX9Ogx47FBDqabsWeiJr+5jahIFpHmxREZyAj4xz6cOM+5169oSLN9CgLVCbVBI7czUm83nY/p1TkSycdSplgVQHu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(346002)(39860400002)(136003)(366004)(110136005)(36756003)(6512007)(186003)(107886003)(2906002)(478600001)(8936002)(31696002)(54906003)(31686004)(86362001)(122000001)(2616005)(76116006)(26005)(38100700002)(4744005)(71200400001)(53546011)(6506007)(8676002)(6486002)(66446008)(66946007)(5660300002)(64756008)(4326008)(316002)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZFlQUDEwNHhENHYvWUJnYmRuUVVFcVNRMmF2VGxiaW5Bc3lPTzlVS1MyMTk4?=
 =?utf-8?B?OUZsQ3ZrKzdaVEFEU2NYNEw3ZWM1N2ZseWJ6dTArc2xJY29sdHhLUUhsQ0Zz?=
 =?utf-8?B?dnZ5U3lwM2JCRlJ0d3JpdVo0UGo2WXN3ZVpBZ2tsdm94MXlkQnZWK0lYa0da?=
 =?utf-8?B?Nk5hVTdiMXVMMXdGZldmN3MwTXY1elBtRUhXVUxPdHRuSVlSbTh1TVA3clMv?=
 =?utf-8?B?bTUwRWQ1V3p4a1E0Qk55Y1p4TVNSdTF3YThqWVNxOERqcnB4cEQreExpZ0Jv?=
 =?utf-8?B?OXVTNVovbDNFR2FKYWRBdGozTmp6cFpDeVd5dndxVGhzNGlNMCtlb09GTDNs?=
 =?utf-8?B?S3ZFYUNheEUvK0ZCSTNpS1NlbU9Gak9BdEV2TU9xNGUraGtzZGMreGpvLzN1?=
 =?utf-8?B?TVVoZHdkZFZRZzNXUlZBTWpyd1FzZUlWRng5bHlTMERwNzFkeGZsM1h2YUJG?=
 =?utf-8?B?OUk4ZXlFc056UzVlTU01YTQxMU90S2FuOGViVFh5OVRTN3M1V1hpSnI0WFNa?=
 =?utf-8?B?R3RNRnVaSmxRakxyYjJiSVBqMk5BOEE5YjhuZEZia2RSS1ZuWG03WkFKMnl2?=
 =?utf-8?B?ckR3a01KMGxZbHF2QmxaN25TNU9BRFduOE1nN3pnK2p1RWxoM3lXenhJYjRE?=
 =?utf-8?B?NGlQOW9kUTMxQTNGM3pzTTQ2dTZUV2NsUUV2N3dFSm1XVGI3VW9MNWhld2l1?=
 =?utf-8?B?ODhtWTBURUFIVnJZZXJ5U1lPbkNzcGQvUnh3U1BUeFU1MURIalNFN0dYUTUy?=
 =?utf-8?B?OUZkUHJXbS9aWHM1eTdTcjFXYVR3cHZ1dWVic3BEamVuUzh6bTBaTkx5RmdI?=
 =?utf-8?B?ZkRaZUtZRkZBV2hlaG10akdLcEpXOVNudGlYditleEEyZWdpVTlyM0l4c0xI?=
 =?utf-8?B?ZHgwWEJsRUc0YXluY1ZlTDZkV2pXYnRGeXF1WTdTelo5Yk05QWxBRy9jOTYv?=
 =?utf-8?B?M2MzTTVVS2M0LzBJd3VaUUlscjlldzk0SDc3MjJPd0FWTGJFSnZZWWppQWwz?=
 =?utf-8?B?SkpoYUZkNnZyUUp4S3FMQzdEQVJxOUEremlBV3lHZUdhbmsvaTNZSUlHaC80?=
 =?utf-8?B?MXVVcUVxbWNnOWx3SmZ4akJVOFY3ekJkTTh2K0IyN0dKVlNHVGJTT0dPUjlB?=
 =?utf-8?B?ZGE0RWJqM0l4YTdpMmtrRTdKVVZ4aHdhSlozTHJ1Z2ZNUk4xaXZJMmREcG5J?=
 =?utf-8?B?YW5UYVRrOXdwa3B3VHByZXUzbkpnaXhGVmRWbDdseGk4d1RPSjBWL0VqWXQv?=
 =?utf-8?B?TXZ3Z0UydllTNjBaMENlMTJhM2ZicHZYelp1UHB5K2NFdXpsUk1qZkdsZlRC?=
 =?utf-8?B?cG9HVnRiTTdXcHJTOXZ1UHlmRkZDbVl2aGJjYndneU90OXpPMzJkQlVHOXRi?=
 =?utf-8?B?b1dFZlF1VmZhWWJ4NUpwRFJVQzR3ajM1aS8rczg2UHZrcWNRc1lkYWxOM3Fj?=
 =?utf-8?B?KzVib0ljU2JCNVJIR25EM1FyamxQNFprbEwrM0VxQlg5Sm5oVTlzOTZGQUlx?=
 =?utf-8?B?YXNUWmYwYkRpTE1LRzRKazZ2MHpFYU9wdlZhYThaS3FUWWZkL29oT09nWmRU?=
 =?utf-8?B?cmR5bzByZG8yK2J5VjNIZzNsNmZBTnRZSEJSczUwV2NUZXMxZDVSWUErWExw?=
 =?utf-8?B?R2w5ZmNsU0hBOXpteFdSMm9iNHpUdjIxTWsxbHlDTjM1MnYwT2w2SGpTZFhX?=
 =?utf-8?B?Y0ZnUFJTUG83eEp2WWplQ3gvbVMvT3k1NVpZanZQWHRndkhqc3A1bjM5cGxS?=
 =?utf-8?Q?M2y7COmcOa2kg6Mz4U=3D?=
Content-ID: <B71065D0617C8048929965F3074384F9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cad8662-bec4-4148-bc1b-08d913f14d21
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2021 20:22:15.0848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1NJA9F9BVrQMHAX/nyUwdlAznRYvagR2FHXMVL0bpeoxMCc1m8T+q/qRXucrHDQv8a+kZ4Ek8UAQMKSs0E/CJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3528
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_132222_170438_3B50AC3C 
X-CRM114-Status: GOOD (  12.75  )
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

On 5/10/21 1:09 PM, Thomas Petazzoni wrote:
> On Mon, 10 May 2021 11:00:48 -0700
> Vineet Gupta via buildroot <buildroot@busybox.net> wrote:
>
>>   - moves all lmbench binaries to <target>/lmbench/bin/<ARCH>
>>   - scripts copied to <target>/lmbench/scripts
>>   - scripts/os overwritten to setup "OS" as expected by LMBench runtime scripts
>>
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> Where are lmbench binaries currently installed? Because /lmbench/ looks
> really really odd as an installation location.

They are currently scattered over in /usr/sbin I think.
Indeed /lmbench is non LSB etc, but it is one stop shop if one wanted to 
remove everything lmbench specific from target rootfs.
I guess one could do /usr/sbin/lmbench/{bin,scripts}

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
