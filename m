Return-Path: <SRS0=LXey=26=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F3EC33CA1
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jan 2020 19:02:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E4F3206ED
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jan 2020 19:02:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BIucZSWR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cbpQbDHR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="D+U11gff"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E4F3206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkyPJkuv/1rhmWTLGCo6C7lBH7W6eEDa76TLp8+q5lk=; b=BIucZSWRIATwo+
	QCYeSjiMu0BDOYDp6to4oTyklCSn5X04zUPamnLmXbbV1it9UzteLhPQO5ixkncYo8wW1Bx5BgU+Z
	MaZQvZN4kyMMQyZ2MLk5nCqVJ12PuXMPtvvEC+lo1+5k0CSVNxJYzEbPTKZ5NtSilg+7VXB3yc18P
	f5md89ZPB60WfGxbLqXKmGsgMtKgeyUOY5UGkYc0zgYpHsD6ZdZUotvTuTN3OQWLsrCvja/C16laq
	wIOrTM8v+xiUxmiAxQEU/vdldYceOKNYIkVd++F22Vl8P+RqW3Ap+OOA9RyG3qkr5bW2Q/zjzaHWi
	IZ7IqNYHmPM85sCwnMgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipd4F-00023i-DS; Thu, 09 Jan 2020 19:02:03 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipd4C-00021m-TT
 for linux-snps-arc@lists.infradead.org; Thu, 09 Jan 2020 19:02:02 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 676CCC00BD;
 Thu,  9 Jan 2020 19:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1578596517; bh=6rX1QNqgN7AIyl1Um8POPl1F749eAXZl193MTnB6RFA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=cbpQbDHR+jdJg68PJXy3QsLkYdX+wb8rjzoKRWcdyxpE3LE/Kusjir9FCgG787A6b
 oJq7rlD0EahdppJ37wkxKpStKgbFgX1ntdxIiwNwkoXbIBod23eXrKKZDyoo54s3vi
 UN8EwfVUg+aGDkq5D7Ti5GMDsaLA9hFDMqySMrdPBIGpCAs7YTLBX2jQeJIOzP4G3B
 tlR7JLLe03vohZSNvYjTbMiR7k6Y3tzatRJSAxz/n56qLfTFtJetZI8S44YZm8YQZd
 l5CUb3kugw3nXgUEknnqF/TSgqGtXjrw8jjnH6QEq7mYGyJjKAuvIybxVYg5JhweFg
 ceZFrwyJxOCcw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id CA3E4A0067;
 Thu,  9 Jan 2020 19:01:56 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 9 Jan 2020 11:01:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 9 Jan 2020 11:01:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3oldwCDtTTVhI/zRqKDZb754YVWmWZhR4GAO1hZOdNO4NvDAUoas5Bv66Z2sDi562mNrCadPsv+t8CdyGYUQsteq3q//1lw1eL/E9c1OSc2z/kpHkHgnPIpzG+16oG0Z6IuozRU8z550eLPLZ3idm/02O4Q6liSs/W0LqLvPLO99R0fXg2OOpzr89QlJw534eBcOBjy5OpJVqRYl1wE3mEIidX+nnf6dXAuuEO60Q3XJ4+w+K33kL8uWQRChnL5h8KZBcppcs8xWzu+9UN0Mdn9glAx8I3YOiaI6sAVtce3vKmcWGvaCgZC/4OVydpaPXw1pYZxtr35aTOFJHmjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h78LBTdhwF6Kx+B/2HSfM0atsLKkT730Nn+BguLQMgY=;
 b=kbGIzsdxM2xaGbeCoDfFPbYPARRDl8FrMElSaZVfenHjHlEExXoiP7F/ojLh4d7H02Rhe+lT448+2VEeRrPZ0LC+MvS8gvSOCacnw2O59KStTnW/6PN8w0AlZZ0zzuRIKW0+g72yKwm4al9okp5MQSeJJJ+dqf77YLbg9aaJVnxCu4RcnPrdhsleDJkoeWF2hpcYdLYfKc6q2Gfs3gOHS6xyu6jP2Hqi2npsgH3Hu+ClNBBo3Xfu+q2Ll7zyFGm04pGf/qZVtcHkd7vqY3tJ5TQCuwZegdbf0fg7ly0GUhyxeZcgfDdfvMcQd4NFP8OI/8RA0RQN775ujmM2p7i4qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h78LBTdhwF6Kx+B/2HSfM0atsLKkT730Nn+BguLQMgY=;
 b=D+U11gff8XXpU/ZD/lmUhFRjeWCUQmHjeEXt7VgcMX0PHEgcxT71l66Kg4mInzUcNBkaiToMmzyryi1czHQLcGqNIR4iMaq4hoxC3RGzzfX3UsRu0zEGHWQ9jWu5Bf3MT64jek1W1tfFRxAdbxklrIHsrZkoY897276RO9Fvv5E=
Received: from BY5PR12MB4034.namprd12.prod.outlook.com (52.135.53.73) by
 BY5PR12MB4308.namprd12.prod.outlook.com (52.135.54.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Thu, 9 Jan 2020 19:01:46 +0000
Received: from BY5PR12MB4034.namprd12.prod.outlook.com
 ([fe80::21e8:207a:f5a0:e090]) by BY5PR12MB4034.namprd12.prod.outlook.com
 ([fe80::21e8:207a:f5a0:e090%4]) with mapi id 15.20.2623.010; Thu, 9 Jan 2020
 19:01:46 +0000
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH 4/5] ARC: add support for DSP-enabled userspace
 applications
Thread-Topic: [PATCH 4/5] ARC: add support for DSP-enabled userspace
 applications
Thread-Index: AQHVvOALEgJG1jhHKUKrXAMj7igcXqfflg6AgAMuUuk=
Date: Thu, 9 Jan 2020 19:01:46 +0000
Message-ID: <BY5PR12MB403419E2722BE80E329D3409DE390@BY5PR12MB4034.namprd12.prod.outlook.com>
References: <20191227180347.3579-1-Eugeniy.Paltsev@synopsys.com>
 <20191227180347.3579-5-Eugeniy.Paltsev@synopsys.com>,
 <a3890ccb-e948-6ad6-c2ea-5b77b9d3a289@synopsys.com>
In-Reply-To: <a3890ccb-e948-6ad6-c2ea-5b77b9d3a289@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=paltsev@synopsys.com; 
x-originating-ip: [84.204.78.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d49ddd5-c26d-4957-4334-08d795365fa5
x-ms-traffictypediagnostic: BY5PR12MB4308:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB43081D31E752B00F64B839BCDE390@BY5PR12MB4308.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(346002)(39860400002)(396003)(136003)(189003)(199004)(91956017)(81156014)(81166006)(2906002)(478600001)(8676002)(64756008)(66446008)(66556008)(66476007)(66946007)(33656002)(76116006)(86362001)(8936002)(7696005)(186003)(71200400001)(4326008)(6862004)(52536014)(5660300002)(6506007)(26005)(316002)(55016002)(6636002)(54906003)(9686003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR12MB4308;
 H:BY5PR12MB4034.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UHUn0szkWPWILP3AvYf7cTkSnzBjzteT9UaLCeJIP+DQ6kOdzRqWTmRH7RWLDGMh82fHtnw2/R3KZaLWWhFfLHYfkCjjeEDoT0cFmazMnKidKBkrlcBQXlQ2J1imkhTTLobTIdwyfHejSUoIjDpB8Nt77wKOq1/IlocbJkCfFjoeCWQNvPw5M9b6Y4DXy0T9sJNX95qjtxh9NVREEBSQEpZKnru2uOnyGC/2qvY1g39bKgjcJd1qkowQuQTpO3+Q5PMgTUUz+WplJwpFFR26cRB2Ug9oYkPZJvE32MVPpSwrVuSSxj1ixE0Xr7Q1i6PHlcgaBgyami6liwEiS9xYZtqP72GLQWni6yHMU9kH2UJWSXqbgahGj0fdZ7yzy3u1VMMFq/olj1wVjRkx8IHoe4WvIjIus84LEiNPP6h+iWbOkAuH98Z+smxGjy/3tyFt
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d49ddd5-c26d-4957-4334-08d795365fa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 19:01:46.1324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uK9jkxH9C+MhoxRlU+TRJqFwTN32wnPinLNem5+c1gu4Wx/vQ65wkpHcHxXMPJuhisMXlhRq+XoOTnh0mGQvtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4308
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_110201_060281_6A34A290 
X-CRM114-Status: UNSURE (   7.92  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey  Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Vineet,

>From: Vineet Gupta <vgupta@synopsys.com>
>On 12/27/19 10:03 AM, Eugeniy Paltsev wrote:
>> To be able to run DSP-enabled userspace applications we need to
>> save and restore following DSP-related registers:
>> At IRQ/exception entry/exit:
>>  * ACC0_GLO, ACC0_GHI, DSP_CTRL
>>  * ACC0_LO, ACC0_HI (we already save them as r58, r59 pair)
>> At context switch:
>>  * DSP_BFLY0, DSP_FFT_CTRL
[snip]
>> +
>> +#ifndef __ASSEMBLY__
>> +
>> +/* some defines to simplify config sanitize in kernel/setup.c */
>> +#if defined(CONFIG_ARC_DSP_KERNEL)    || \
>> +    defined(CONFIG_ARC_DSP_USERSPACE)
>> +#define ARC_DSP_HANDLED                      1
>> +#else
>> +#define ARC_DSP_HANDLED                      0
>> +#endif
>
>This is a really bad idea - u r introducing explicit include dependencies which
>can change even outside of arch changes !
>We've dealt with enough of these problems with current.h, so best to avoid, even
>if there is some code clutter.

Hmm, would it be OK if I add this option as a private kconfig option?
I.E (for ARC_DSP_HANDLED):

---------------->8----------------------
config ARC_DSP_HANDLED
	def_bool n

choice
	prompt "DSP support"
	default ARC_DSP_NONE
	help
	  Depending on the configuration, CPU can contain DSP registers
	  (ACC0_GLO, ACC0_GHI, DSP_BFLY0, DSP_CTRL, DSP_FFT_CTRL).
	  Bellow is options describing how to handle these registers in
	  interrupt entry / exit and in context switch.

config ARC_DSP_NONE
	bool "No DSP extension presence in HW"
	help
	  No DSP extension presence in HW

config ARC_DSP_KERNEL
	bool "DSP extension in HW, no support for userspace"
	select ARC_HAS_ACCL_REGS
	select ARC_DSP_HANDLED
	help
	  DSP extension presence in HW, no support for DSP-enabled userspace
	  applications. We don't save / restore DSP registers and only do
	  some minimal preparations so userspace won't be able to break kernel

config ARC_DSP_USERSPACE
	bool "Support DSP for userspace apps"
	select ARC_HAS_ACCL_REGS
	select ARC_DSP_HANDLED
	help
	  DSP extension presence in HW, support save / restore DSP registers to
	  run DSP-enabled userspace applications
endchoice
---------------->8----------------------

---
 Eugeniy Paltsev
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
