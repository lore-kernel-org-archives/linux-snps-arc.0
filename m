Return-Path: <SRS0=blQs=5P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BE0C43331
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Mar 2020 20:41:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E27B20733
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Mar 2020 20:41:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mU7YjiGq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="J0pG4/da";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="p2fnrL3F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E27B20733
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgOxifIgW8YGhZi3RLooRuIHWnNNmyiithJ6f+/rGzU=; b=mU7YjiGqkaGTWu
	T35dygZ2l/fxQByZ/tV4edC84uGYp+ucHTIXiqxdKoA2zM60laXfNkPsZmpA3AbigT2dgYauenmmY
	RRC/3hGKf1c8ydFyOlNz/QLfT3Z+NQiuSJ8JRd747h80YaVPiRpz5wJ85ed0PM4kk2+L9fDPbCDwi
	/O68VLv4MXs5ArUvmmK8HMhEhAZOEa/ZQaJrqz6p2xUqLGyFDliyp6hQR0VwMLMYX+hWhPKpV74un
	P2neu/82qUmUXgNZLh2T6+KPtwv2QfUf3yvdrgjaXj2vQAJ3Qq42AvB5t1ZWKEcZmy0Xc0SjnTRZT
	RS1hBs2jejLTA2Agn4VA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ1Dp-00080W-Gx; Mon, 30 Mar 2020 20:41:25 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ1Dm-0007zr-R4
 for linux-snps-arc@lists.infradead.org; Mon, 30 Mar 2020 20:41:24 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6EC3AC08B0;
 Mon, 30 Mar 2020 20:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585600880; bh=FakzqnDWm6ZUkYx2PKGqcTdJzrp2Amx0TQDF+WzKdbs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=J0pG4/daYF+7PNtpj6Xtee98DcHSVSscVdEEFGOum6FLb87Ehihh59/wIDF8uweNu
 uivDTD9vxYbH53wCo9+9k+afpR86LGap+Vv8OegLsh7ggmNcLrqGhbdJ5f78uRUY7k
 lrW39iu60Yqu++nMglr5sCfjg2JIdqY+YOX863NRxP17y6BOVMitKgu2fSmJZO1k7R
 QeOgiqv7iJljqv7GRbBd498ruE9S4MKTimB2lYJhUMty/2F14oQMVZdz6/VRnGuv2S
 RATqc0UCiUrkatXpiIGFiCEftUwjX0938eFTHT4vXkReloIKsi9ICjbSGiNjK6KvS5
 GIzx3dFCKrUcQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 98457A00B1;
 Mon, 30 Mar 2020 20:41:11 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 30 Mar 2020 13:40:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 30 Mar 2020 13:40:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqWXh8ZUNZ/6tt40ycq+dgdc765pjMuBL4hT83tohGaARqFGNV+g3h8wcDTI98/pNA9VaQdD+2mdVlPLPVRKuj9QFQIjOVUuiWQy9A5vzJRloa6GLshS9+M3Z4PyNc7hvbCDUFRaoAIXHamk46JiU1Ax5WQMC10aI4R1FcB/JGxkzl1+liP6gSMiHKvHm1VTccPuR87j9MDuT9SzIeGNM/VnEhABsrTqIx3V7hk0roHZdQpxfLuYnghf1bno1rpUMs8ERAJ3yBSiTHBoM4+AO9BpKGMeMzsjHW6x6EqsHa4ANR1FAOrPCM9V0B14cDB+pI298O8819B2H6Z9m3Ecyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FakzqnDWm6ZUkYx2PKGqcTdJzrp2Amx0TQDF+WzKdbs=;
 b=Wb2dGr97pFS//rICooy6v7/d6XuNzfJQk6LeqRwl1yUTU4ke6PUojsBJWh1YKmaXTxaMwH4QoPr/LaCgCQpiIcy3JcKT7tsNB+eonPP4eXhrzOlcuI0xt1/cbsoDGKuSfxBl0k+SSZlXCY8AlTufX0cI2h9RCfBOTGEsxm3uwpMpQ7IA6nZ8QihiUkPDY3DNWBWZkEQEJ8q+CgiU+Lf0upHekRO71AkkRDELQxCIMvfmNTLItbbKgtcYASl+rcr/9DWwV/P8Xhnn4YM2rPr4R0TvgILtoU8ij7xkbmSP6ckp0mNd4ho0lyJzFsKNGdZV6XIk+elgZGjoUke/jOR36g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FakzqnDWm6ZUkYx2PKGqcTdJzrp2Amx0TQDF+WzKdbs=;
 b=p2fnrL3F87xpZxGGNDcDOqevuXuePn7tPaQQGLyRcLxcuKhniYrGuik+f3kRoA/tzk4FdOQdKhqY3mHTz3+hTEbyEIp62ByP9AUsiKzkKRn6cV7IvkcFkHMYe5IZ28dp6HG1edGWszmwwU+tiIQf9uV5RbcjiIkPDiDMCdW584I=
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 (2603:10b6:910:1c::14) by CY4PR1201MB2517.namprd12.prod.outlook.com
 (2603:10b6:903:da::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Mon, 30 Mar
 2020 20:40:45 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::744c:4e95:39be:9d44]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::744c:4e95:39be:9d44%12]) with mapi id 15.20.2856.019; Mon, 30 Mar
 2020 20:40:45 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: RE: Build regressions/improvements in v5.6
Thread-Topic: Build regressions/improvements in v5.6
Thread-Index: AQHWBpcvcUuu+ZudzU+b+A9JmGkSJahhl0cw
Date: Mon, 30 Mar 2020 20:40:44 +0000
Message-ID: <CY4PR1201MB01204FB968A6661FB8B295ACA1CB0@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20200330085854.19774-1-geert@linux-m68k.org>
 <CAHp75Vc1gW2FnRpTNm6uu4gY3bSmccSkCFkAKqYraLincK29yA@mail.gmail.com>
 <CAMuHMdXDBtOo_deXsmX=zA9_va0O5j8XydxoigmS35+Tj7xDDA@mail.gmail.com>
 <CAHp75VfsfBD7djyB=S8QtQPdKTkpU5gFzyRYr8FshavoWgT0CA@mail.gmail.com>
In-Reply-To: <CAHp75VfsfBD7djyB=S8QtQPdKTkpU5gFzyRYr8FshavoWgT0CA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jWVdKeWIyUnJhVzVjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTFpT0dNNU1qSXlPUzAzTW1NMkxURXhaV0V0T0RBek55MDRPR0l4?=
 =?utf-8?B?TVRGalpHVXlNVGRjWVcxbExYUmxjM1JjWWpoak9USXlNbUl0TnpKak5pMHhN?=
 =?utf-8?B?V1ZoTFRnd016Y3RPRGhpTVRFeFkyUmxNakUzWW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXhPRE0xSWlCMFBTSXhNekl6TURBM05EUTBNamMyTnpZM056VWlJR2c5SWxs?=
 =?utf-8?B?dldWUk5TMlV5ZURNeGVXWklXVE5JZWtSb1NsVmhTR2t4Y3owaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVSlJTa0ZCUW01d1EwWTNNSGRpVjBGV2RFMDFObWtyVFM5bGQx?=
 =?utf-8?B?Y3dlbTV4VERSNk9UZEJUMEZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRklRVUZCUVVOclEwRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRlJRVUpCUVVGQlRXcE1jekpuUVVGQlFVRkJRVUZCUVVGQlFVRkJT?=
 =?utf-8?B?alJCUVVGQ2JVRkhhMEZpWjBKb1FVYzBRVmwzUW14QlJqaEJZMEZDYzBGSFJV?=
 =?utf-8?B?RmlaMEoxUVVkclFXSm5RbTVCUmpoQlpIZENhRUZJVVVGYVVVSjVRVWN3UVZs?=
 =?utf-8?B?UlFubEJSM05CUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlowRkJRVUZCUVc1blFVRkJSMWxCWW5kQ01VRkhORUZhUVVKNVFVaHJRVmgz?=
 =?utf-8?B?UW5kQlIwVkJZMmRDTUVGSE5FRmFVVUo1UVVoTlFWaDNRbTVCUjFsQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRMEZCUVVGQlFVTmxRVUZCUVZwblFuWkJTRlZCWW1kQ2Ew?=
 =?utf-8?B?RklTVUZsVVVKbVFVaEJRVmxSUW5sQlNGRkJZbWRDYkVGSVNVRmpkMEptUVVo?=
 =?utf-8?B?TlFWbFJRblJCU0UxQlpGRkNkVUZIWTBGWWQwSnFRVWM0UVdKblFtMUJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZDUVVGQlFVRkJRVUZCUVVsQlFVRkJRVUZLTkVGQlFVSnRRVWM0?=
 =?utf-8?B?UVdSUlFuVkJSMUZCWTJkQ05VRkdPRUZqUVVKb1FVaEpRV1JCUW5WQlIxVkJZ?=
 =?utf-8?B?MmRDZWtGR09FRmpkMEpvUVVjd1FXTjNRakZCUnpSQlduZENaa0ZJU1VGYVVV?=
 =?utf-8?B?SjZRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlJVRkJRVUZCUVVGQlFVRm5RVUZCUVVGQmJt?=
 =?utf-8?B?ZEJRVUZIV1VGaWQwSXhRVWMwUVZwQlFubEJTR3RCV0hkQ2QwRkhSVUZqWjBJ?=
 =?utf-8?B?d1FVYzBRVnBSUW5sQlNFMUJXSGRDZWtGSE1FRmhVVUpxUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVkZCUVVGQlFVRkJRVUZE?=
 =?utf-8?B?UVVGQlFVRkJRMlZCUVVGQldtZENka0ZJVlVGaVowSnJRVWhKUVdWUlFtWkJT?=
 =?utf-8?B?RUZCV1ZGQ2VVRklVVUZpWjBKc1FVaEpRV04zUW1aQlNFMUJaRUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVKQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlNVRkJRVUZCUVVvMFFVRkJRbTFCUnpoQlpGRkNkVUZIVVVG?=
 =?utf-8?B?alowSTFRVVk0UVdOQlFtaEJTRWxCWkVGQ2RVRkhWVUZqWjBKNlFVWTRRV1JC?=
 =?utf-8?B?UW5wQlJ6QkJXWGRCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkZRVUZCUVVGQlFVRkJRV2RCUVVGQlFVRnVaMEZCUVVkWlFXSjNR?=
 =?utf-8?B?akZCUnpSQldrRkNlVUZJYTBGWWQwSjNRVWRGUVdOblFqQkJSelJCV2xGQ2VV?=
 =?utf-8?B?RklUVUZZZDBJeFFVY3dRVmwzUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCVVVGQlFVRkJRVUZCUVVOQlFVRkJRVUZEWlVG?=
 =?utf-8?B?QlFVRmFkMEl3UVVoTlFWaDNRbmRCU0VsQlluZENhMEZJVlVGWmQwSXdRVVk0?=
 =?utf-8?B?UVdSQlFubEJSMFZCWVZGQ2RVRkhhMEZpWjBKdVFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFrRkJRVUZCUVVGQlFVRkpR?=
 =?utf-8?B?VUZCUVVGQlNqUkJRVUZDZWtGSFJVRmlRVUpzUVVoTlFWaDNRbWhCUjAxQldY?=
 =?utf-8?B?ZENka0ZJVlVGaVowSXdRVVk0UVdOQlFuTkJSMFZCWW1kQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVVZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCWjBGQlFVRkJRVzVuUVVGQlNFMUJXVkZDYzBGSFZVRmpkMEpt?=
 =?utf-8?B?UVVoRlFXUlJRblpCU0ZGQldsRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGUlFVRkJRVUZCUVVGQlEwRkJRVUZCUVVObFFVRkJRV04zUW5WQlNF?=
 =?utf-8?B?RkJZM2RDWmtGSGQwRmhVVUpxUVVkVlFXSm5RbnBCUjFWQldIZENNRUZIVlVG?=
 =?utf-8?B?alowSjBRVVk0UVUxUlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkNRVUZCUVVGQlFVRkJRVWxCUVVGQlFVRktORUZC?=
 =?utf-8?B?UVVKNlFVYzBRV05CUW5wQlJqaEJZa0ZDY0VGSFRVRmFVVUoxUVVoTlFWcFJR?=
 =?utf-8?B?bVpCU0ZGQldsRkNlVUZITUVGWWQwSjZRVWhSUVdSUlFtdEJSMVZCWW1kQ01F?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUlVGQlFVRkJRVUZCUVVGblFV?=
 =?utf-8?B?RkJRVUZCYm1kQlFVRklXVUZhZDBKbVFVZHpRVnBSUWpWQlNHTkJZbmRDZVVG?=
 =?utf-8?B?SFVVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFWRkJRVUZC?=
 =?utf-8?Q?QUFBQUFDQUFBQUFBQT0iLz48L21ldGE+?=
x-dg-rorf: true
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
x-originating-ip: [188.243.7.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad64e596-8673-4191-fe9a-08d7d4ea9efc
x-ms-traffictypediagnostic: CY4PR1201MB2517:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB251776230094854223112471A1CB0@CY4PR1201MB2517.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:561;
x-forefront-prvs: 0358535363
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0120.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(136003)(366004)(39860400002)(376002)(396003)(86362001)(52536014)(76116006)(64756008)(478600001)(66556008)(4326008)(66446008)(66476007)(8936002)(7696005)(81156014)(2906002)(66946007)(107886003)(81166006)(966005)(53546011)(5660300002)(6506007)(54906003)(8676002)(316002)(110136005)(9686003)(55016002)(33656002)(186003)(71200400001)(26005);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8csSHnS2eDBgpl0qRyX3S7ZKI4JTcY0ADsEgGDaoOF4NwZeBAozeMgzvS8EchgVsLFkWbJP5TVFzaI0M99AVn29N/+EPz/CDN7cmHWHxtQntA5Vwbg3IEEyQTVcIWo8L/ZXNRDugeL3LgtHSm2C47A9oVsINlm6xiZI3BzadRP1c/dllysxyTbZs4mmAaKKS85mv9Yffo5HRI2ocXIMTWT1RHt9oI30LP+UeyCFfOyqRfRprUbv1KD3HZdnK5pmxXjr5/KKEmWHyiSIRPQWdxbBREMJ+Q8GV9wBmcsf6SrmLCOIfX70qXQIvov2RRLsNhv1EmXjLKF24oz88L6yf5+flOPu2wqDN6vXFH1b+GDoF3UYG5OtJdciUbOypgfEVXaNbmuRPwjmuJhXUhoBPHUZ1+dOGAuZqc/xITpNmCnKZcBW97huwiKEgwIYyD5SJ2gPHaVhecxqwaCDw9Q2HKfVkMt3PZ0T00pdGSUKpd8enOxC44wT819gBbW2QSetyymEB1XEfaLl0XQ+9Q95NVw==
x-ms-exchange-antispam-messagedata: /gS/fHm/Ki4QRPKlxOfLvtk3lUzD5hWNvzBwYq5RClg7K7X/e3m7HaWJdSoqvH78tX1MtqdlvJa886y00iaGCI2fnpbDgIyX77tN0/j5reGsWUot31qtW+YVqpi70PRtbYAMdWVy1wIDP4xRh8uUPQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ad64e596-8673-4191-fe9a-08d7d4ea9efc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2020 20:40:44.9511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AiOgPgJ1ao++UtnYy4Dq5hjDTupcVU1v7zHcLYEK7JQy7YFUBrKSphJTvaEiRTWw4/SwO9ndxuLZLwgTBrFnfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2517
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_134123_008112_F43798B3 
X-CRM114-Status: UNSURE (   9.52  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Andy, Geert,

> -----Original Message-----
> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> Sent: Monday, March 30, 2020 4:28 PM
> To: Geert Uytterhoeven <geert@linux-m68k.org>; Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
> Subject: Re: Build regressions/improvements in v5.6
> 
> On Mon, Mar 30, 2020 at 4:26 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Andy,
> >
> > On Mon, Mar 30, 2020 at 3:08 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Mar 30, 2020 at 12:00 PM Geert Uytterhoeven
> > > <geert@linux-m68k.org> wrote:
> > > > Below is the list of build error/warning regressions/improvements in
> > > > v5.6[1] compared to v5.5[2].
> > >
> > > >   + /kisskb/src/include/linux/dev_printk.h: warning: format '%zu' expects argument of type
> 'size_t', but argument 8 has type 'unsigned int' [-Wformat=]:  => 232:23
> > >
> > > This is interesting... I checked all dev_WARN_ONCE() and didn't find an issue.
> >
> > arcv2/axs103_smp_defconfig
> >
> > It's probably due to a broken configuration for the arc toolchain.
> 
> Alexey, do have any insight?

I think I do have some but first I'd like to get it reproduced myself.
I just built v5.6 with help of both GCC 8.3.1- & 9.3.1-based toolchains
and didn't see a single warning. So I guess I was doing something wrong.

FWIW

1. My GCC 8.3.1 toolchain was exactly this:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2019.09-release/arc_gnu_2019.09_prebuilt_uclibc_le_archs_linux_install.tar.gz

2. Linux kernel is vanilla v5.6.0

3. Configured and built as simple as:
   make axs103_smp_defconfig && make

-Alexey
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
