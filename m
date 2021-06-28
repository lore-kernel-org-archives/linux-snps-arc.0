Return-Path: <SRS0=n5Wv=LW=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658F2C11F64
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Jun 2021 22:21:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9D5461CF7
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Jun 2021 22:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9D5461CF7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7fh4TO8leDySoiNwIqKwI9hkcj7FQntxV+u6nNc53fM=; b=f5JyxuF8GVpGIM
	Z5yN5eI2eTUeo4cnQiZGaJLOJQQGuKyHnCgCSGcEMP3izlEcat3S3f/A7xCmrZbYuYHsi++r3hKJ0
	24XA2nOkD6QmE5Woin5xFwv+06Pm24PjOnUdVIJUPwKGJMQWhnzYR3Dp+caprIQh2FYuYz617M6eH
	URrdtVRh6DGlQUJJtvtqG2LXEQhRLe/rBP7TPp2/dZeImurE/CFATl9zFIpVp4XbQ4iP7/PHuBh2P
	KcArvEDM+XewY2lNRuhZLk7GJpQ8gSc0O/GgIR7XrIlQe6rPLEPqUTk2QWeTiczQ2KUbBRZ8hc9z4
	asQdS9u5UBpTZOIBgN1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxzdR-009HX7-9C; Mon, 28 Jun 2021 22:21:45 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxzdO-009HW1-0o
 for linux-snps-arc@lists.infradead.org; Mon, 28 Jun 2021 22:21:44 +0000
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8C886C0BEC;
 Mon, 28 Jun 2021 22:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1624918898; bh=MrUtuIi9MsJAJGuJUyjvymhPbfHmx+B2aVXxLZDHATg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=masY1zlK8KNDVo+X/BeK9d8u7mdmMYk3kF8cy3HRKvWh3zXUSHRQ1UtHNDaHTUx+c
 QYj6BsbYCuPweRjSNkrad3haHKVaYlr8LW3SLHZdqND+avuVR9juzOu6bK7UwarDZ6
 w39RS8rpjG70oq3DbNyiop+IFWG4h9FMcw0RFhi8B7HWLSPKpxTOn81L/83prU2KKI
 dDLd4j6E1wOh3tsQK5Z42rkVZjGNhUHuTURIrJ7EA8i3KnMe4svhDFZEp0vOVUMzZl
 AkdziCe/qgwC2fStn2+E/vX2Az24hzSrOFqzEAJtXOV6NEYsIySoR8vUs+W1sRvA0n
 K3p/zaYQJoO5Q==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id E152FA008A;
 Mon, 28 Jun 2021 22:21:15 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3C3484009A;
 Mon, 28 Jun 2021 22:21:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ACtQy5ic";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4R/wEKigU2Bf6qhfl8iYU/pi8hQ5Pk8tgLpDd4OBxPUMY5NdpMt9oBoioCpstaqMaPwi4qAdqZxqA5mFHL3RAVMk5Yscy6rHve7DcOYHvrd2BKiYiWxJFp6VmBkUZjjznLOT/DZMDdG4ywvbWjQsIihipaatRmHj8Uh518s0KR8Juu2xoCJeF4PYCS8EW+TAb8Gw2wCAlREp2hPobVi582QCm9N7PUoJDmv5UfWzKCcYVO9VkzCryRXr8c0Iz8oqdK3Jvy/H6MG6xPv8ZF4nP21J0gUcopiELm7w6kYsyxEwGqJ8i0iF6s+4HtdJ9ywvvhMm7fddVokC04bh9lsKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrUtuIi9MsJAJGuJUyjvymhPbfHmx+B2aVXxLZDHATg=;
 b=Zpu0eULtwn/evRS3NjLp3AkoGQbnd1l4vxTZJL3676f/vEP0zXRNJSHBrIm2InX8nNwiOLROa6c68xfw2PEAZ3TkoeNLW9TZeALwU42c0ipCIhX3IwqrFbCBHQGV3AkWOdn2zI+GGU049rz+f00Gn1rw4bMon3JuT37+Dwwhd9LBEHzbZcoxI3lWr0wLWhN5tAXNiIHq9zDC7/2p4druNy7af8wSY9kJsfcerp4pIbiAigJ2A55eSKkCZmP91BvYrT2O8DSmyndF/3rPLEob1LRvDAOij+xPN2bOPSBDwh8kAX6aQZ6k6vmfz1XHJw8e84i8cYugeFS6ixFf301bJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrUtuIi9MsJAJGuJUyjvymhPbfHmx+B2aVXxLZDHATg=;
 b=ACtQy5icpa1r5BMN9U/YwErxANpYdbO1Vlvuvz6Q+j8jrznk8/yB64svGR2ZKS9efC0xfdOX+M+hR8A0UYgOvzJ1KsEJQWw6OF/yQRzQY14SB8b8eHVLtQFSKlLUGegkOF4snvVg6Ur93BjMgm2sLNL+gtSc8HkMlxhqYysOtnA=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB4711.namprd12.prod.outlook.com (2603:10b6:a03:95::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 22:21:01 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::8dd5:b3:52b7:b353]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::8dd5:b3:52b7:b353%6]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 22:21:01 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>
CC: Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "will@kernel.org" <will@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "aou@eecs.berkeley.edu"
 <aou@eecs.berkeley.edu>, "arnd@arndb.de" <arnd@arndb.de>,
 "bcain@codeaurora.org" <bcain@codeaurora.org>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "chris@zankel.net" <chris@zankel.net>,
 "dalias@libc.org" <dalias@libc.org>, "davem@davemloft.net"
 <davem@davemloft.net>, "deanbo422@gmail.com" <deanbo422@gmail.com>,
 "deller@gmx.de" <deller@gmx.de>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>, "gerg@linux-m68k.org" <gerg@linux-m68k.org>,
 "green.hu@gmail.com" <green.hu@gmail.com>, "guoren@kernel.org"
 <guoren@kernel.org>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>,
 "James.Bottomley@hansenpartnership.com"
 <James.Bottomley@hansenpartnership.com>, "jcmvbkbc@gmail.com"
 <jcmvbkbc@gmail.com>, "jonas@southpole.se" <jonas@southpole.se>,
 "ley.foon.tan@intel.com" <ley.foon.tan@intel.com>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, "mattst88@gmail.com" <mattst88@gmail.com>,
 "monstr@monstr.eu" <monstr@monstr.eu>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "nickhu@andestech.com" <nickhu@andestech.com>,
 "palmerdabbelt@google.com" <palmerdabbelt@google.com>, "paulus@samba.org"
 <paulus@samba.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "rth@twiddle.net" <rth@twiddle.net>, "shorne@gmail.com" <shorne@gmail.com>,
 "stefan.kristiansson@saunalahti.fi" <stefan.kristiansson@saunalahti.fi>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>, arcml
 <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH v2 00/33] locking/atomic: convert all architectures to
 ARCH_ATOMIC
Thread-Topic: [PATCH v2 00/33] locking/atomic: convert all architectures to
 ARCH_ATOMIC
Thread-Index: AQHXUW6ljftnBv7XLUWfOcoJEy64X6sE/CEAgBSegoCADv53gIABi12AgAAOa4CAAAIBgA==
Date: Mon, 28 Jun 2021 22:21:01 +0000
Message-ID: <e500f4e2-d9bf-9374-c2fc-8fcf1ad43d57@synopsys.com>
References: <20210525140232.53872-1-mark.rutland@arm.com>
 <a15122e9-700d-c909-4794-d569ed1f6c61@infradead.org>
 <20210618084847.GA93984@C02TD0UTHF1T.local>
 <8a056e32-26bf-3038-984e-fcf8cac988d0@infradead.org>
 <4ec7308f-02c6-a357-eab8-63b6f2b7a5eb@infradead.org>
 <YNpJnzqg0yySeEE7@hirez.programming.kicks-ass.net>
In-Reply-To: <YNpJnzqg0yySeEE7@hirez.programming.kicks-ass.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org; dmarc=none action=none header.from=synopsys.com; 
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a25707a-c67f-42ca-c41b-08d93a830339
x-ms-traffictypediagnostic: BYAPR12MB4711:
x-microsoft-antispam-prvs: <BYAPR12MB4711ADC1236F55DFBA06700FB6039@BYAPR12MB4711.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3SsX26NAZ2sQcTKSnVVtP6rodexosg6pSC2BxWXG35tHeGouSJBLNrpBu/t+FTqtnwgE2tjC1hTFQlX99h6AMuFp6LkVD1gBnZtn90d2M6BltJY5em/tUpMIaUAOQN+zII/t3XFtX2cDAAd17hh2tNgW7JRDz0AoA1eWp9CI8UqHsK7Nhr18aLn7wdlQz2pYti25HAKKEB62tiFV5FS0T80ZI9uD0uT3HBx9k//g/Q9gMJsioZDMwIV6L+/GVtwTSkSYO0AZYTbLMVrSAmVtYODXJYdBlIiMKv6/hxrU0ph7mI2zQQRC4ccvj/WcEs4KTD8i8GHX5tfreAyMG7cxx5nndj8NFjwOskRle5L0k0QzJO/bJrj2ZOo5tlMmpP5B71zlCEfhK/cDnH4UMh73KpBaQSL9iuOP0nCjwXksaNjR2SDuPc7JLj9eYTImStG/CLAhMVbkISeeMtx8OUt2WdudcYhbMsvXOOSdw+YdOMXBEbSHPQpS2X16XzJ3bp25aDUcRoVQmyaq+1VxIJyJlKzIzRzu7qkyJTaJPB9rzS/MaZXMezIu0uA6FF1g2tFx0P2kk+lwBs0RM0j0dBF+QVowQ4u4qPqgAAJQ5KR6bxCUNjT5DzEBjCpvI09pKYOcR+EAdjVwdALG+rg7IImshN5eBUfMUDTpe26oGJpRDDH6cRTyQSqVHzG17sjM1smTUjHnWLoVXv5XlfLBZN45tXQ0tilyrlRqfZ0ZbgKqHy0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(366004)(346002)(396003)(136003)(64756008)(38100700002)(478600001)(2616005)(316002)(6486002)(110136005)(122000001)(83380400001)(36756003)(5660300002)(54906003)(53546011)(66946007)(66556008)(6506007)(8936002)(66446008)(66476007)(7406005)(7416002)(71200400001)(8676002)(86362001)(31696002)(31686004)(26005)(76116006)(186003)(4326008)(6512007)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emxLUlBMaXBkUjJKSzIyQ1FDbVovQ0xqOEM5NjVjaUtIZndPL3RKWkJPWDBH?=
 =?utf-8?B?SzhIQndUcDdkMkRWUGhtTURYakJLRGlJNlByb0NPQVJrVWl5elY0MW5zWWIx?=
 =?utf-8?B?M0s1TWNteFdxeCtZcnJNR1FkdEVhWlFvVG1wVzdVd1ZKeEozMDF4QXdBZWc4?=
 =?utf-8?B?dHVHTjAyaTg4L1cvSlZBTUhraTNsVGkya3pKYkVCNVk2R1lpZEQ2MkI1RHNN?=
 =?utf-8?B?NXdZZXZwVEp5TUQ1elNiL1h3cURBSjZoeEswVEFqaXJTOWVZQkp5Qisxd3hN?=
 =?utf-8?B?cjQrU2xrNWFseWNRRHdudVpnK3lCeE9nNkFrUVk4U3VkVzBFNFFTZHI3eENO?=
 =?utf-8?B?OFF0cjdMUTZ2SEYvenZPL0x4SE5MbmJvakJiS1VvSk4rS1dOVGo4Ly9pWWxh?=
 =?utf-8?B?NU04TSttaktvQnlqSjlnWm1nYWpleWg4dGtvQ1NOdUJlK210c3cyWG1hTm5H?=
 =?utf-8?B?RHVSRVltV2ZDSUViRmdyYkppQ0pIUnZHYUFseFV6VHRIeEd1eEdyenlzNU9M?=
 =?utf-8?B?ajJPRkNkVEtXUXA0eHZzamdJSHVDUFRtbTMydUtOSTk1MjByVFpnQllDa1l1?=
 =?utf-8?B?Vm5jelhvQ3RzYUo0RFRtQXdOUlpCM3pKdzZ5aTFibExrWUF3YTFlSG9GRDVY?=
 =?utf-8?B?dTZkam0yRmUxcDBveWNBYnVFRVBHY2hyRnVYT2NQV1BFZS8rMThNMjJHU3pY?=
 =?utf-8?B?RHdoZ0xiVTZzMGVLTVd1Z2pQNkFRQ2RsSmtJRXB2QzMxUmdSSGsyZ3JFMlhT?=
 =?utf-8?B?cW8rei9DRXBHanBnell6MkFVdkcyci9IYVF1UzN1K0xRMG0rc2tqZndYZXh3?=
 =?utf-8?B?TkJScnExc2R1Rk9tOW5OWDg2eXBvS2NxSjBVdVJYOWhVMnBKMnBaUlBLSmEx?=
 =?utf-8?B?dnZoRDJjWUpvalBCakFiYnVXMVBLUHh6c0FHV01mbjNPMmJYOHZPZDFmSFM2?=
 =?utf-8?B?d3lHV3VpU3JWMWFJNzRmd2lxWml4WVBKeHBYWmRGY0hFbXJ6QmxFUFRiY2NS?=
 =?utf-8?B?VFdnWW9EU3dTOXNqOHNuNFRUQ3QzelM0K2c5TXoremU1Q0JicHFGVkpvaTVM?=
 =?utf-8?B?KzZyZWxSSS84YndDcUZhbys2ZUZtOUJYMGU1ZXRMUVp6T1pUSWdYTWZXZG91?=
 =?utf-8?B?UWduNkJId3JtVjVxbEZKUjNtSHpRZHIxZW8xTkg0bE5VYkFPUlZyUEZycWNi?=
 =?utf-8?B?eWxDRlo5ajlFVGcvWWV0Z2crT3Q3NUdER0N3aFlMRExmQVNsd0pQaVZwTTdR?=
 =?utf-8?B?K09SekJHVEtvWGhXNkREY04rL2wrU0hVOGRjNTR2by9GeEozaUpoMHpMN0lQ?=
 =?utf-8?B?MjdLajF4NG4wc0RyYWFGbW1mcGQ2TDhEVkNhWVZKQTdCMDZ1S0VYSjJoQTEv?=
 =?utf-8?B?dEVzS3JhM045c08vSGtjZEM4RjJXTkFNRExBUmZSZFFzcXpWb21Ec1MvTWFJ?=
 =?utf-8?B?VHdzNWVCSEV2RHFJeTRvRmpQck9FbTFaY1owQ2h2REx0T2hVSVltNWxWR3hm?=
 =?utf-8?B?WlFKeE13bjVQejBMcTEyQUdBbVR3TzNQVTUxTmtIemZDU2d6ZlFxSGdFWXZP?=
 =?utf-8?B?TUtzcVlUYTY3QTYxMVZocFRFYldidjdPT2x4MmRuWDJjS2J5R080ZjZ5Ykg1?=
 =?utf-8?B?SjJpKzA4TG1IVEhHOWlGNUE3WHh0bkNkbE5OcE1GVDR3MTQ4Z1ZMeGo1YlpJ?=
 =?utf-8?B?YmxsaC9qU3VVS05QbTlKeGY0YzBFcExQZjhPbUhJbWxOOXdnS1RiRWpremlz?=
 =?utf-8?Q?LNdFl+HOB4fX9JPf7U=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <0DC26151BFC69B42A81FCE446A7FB0F0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a25707a-c67f-42ca-c41b-08d93a830339
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2021 22:21:01.8490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2lBzBpoZppbfeOAmd6CNGPReVYz6sQUSaXO+cFi3giaau2wNaD9galMC68jlsafylEBy4cz84M93MXiBXeFZUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_152142_242238_1C71E66E 
X-CRM114-Status: GOOD (  18.44  )
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

On 6/28/21 3:13 PM, Peter Zijlstra wrote:
> On Mon, Jun 28, 2021 at 02:22:15PM -0700, Randy Dunlap wrote:
>> However, something in arch/arc/ did look suspicious so I decided to
>> try an ARC allmodconfig build, where I did see a few errors FYI:
>>
>>
>>    CC      drivers/iommu/io-pgtable-arm.o
>> In file included from ../include/linux/atomic.h:80,
>>                   from ../drivers/iommu/io-pgtable-arm.c:12:
>> ../drivers/iommu/io-pgtable-arm.c: In function 'arm_lpae_install_table':
>> ../include/linux/atomic-arch-fallback.h:60:32: error: implicit declaration of function 'arch_cmpxchg64'; did you mean 'arch_cmpxchg'? [-Werror=implicit-function-declaration]
>>     60 | #define arch_cmpxchg64_relaxed arch_cmpxchg64
>>        |                                ^~~~~~~~~~~~~~
>> ../include/asm-generic/atomic-instrumented.h:1261:2: note: in expansion of macro 'arch_cmpxchg64_relaxed'
>>   1261 |  arch_cmpxchg64_relaxed(__ai_ptr, __VA_ARGS__); \
>>        |  ^~~~~~~~~~~~~~~~~~~~~~
>> ../drivers/iommu/io-pgtable-arm.c:320:8: note: in expansion of macro 'cmpxchg64_relaxed'
>>    320 |  old = cmpxchg64_relaxed(ptep, curr, new);
>>        |        ^~~~~~~~~~~~~~~~~
> 0day also reported something like that. We found that this was a
> pre-existing error, and Mark's patches only changed the error, it never
> successfully build.
>
> cmpxchg64 is an optional feature for 32bit architectures, one that ARMv7
> does provide, and uses, for it's iommu bits. Building the ARM iommu
> drivers on ARC seem somewhat daft but is a result of that COMPILE_TEST
> config.

Out of my ARC64 work, I have a boat-load of changes piled up in this 
area. Once Mark's changes hit mainline I can send those out for review 
and we can also consider adding cmpxchg64 for 32-bit ARC.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
