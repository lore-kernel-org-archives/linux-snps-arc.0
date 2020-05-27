Return-Path: <SRS0=zsFq=7J=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5CCC433DF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 May 2020 18:38:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC82520835
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 May 2020 18:38:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cr4RxcMe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RR0pLf0O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="v9H2j1yW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC82520835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+OHAZA1XL/U3PDC+p61fwG5Sp1ORf3Hy3hgXDFA+iQ=; b=cr4RxcMeWTHACF
	UxXI4heYVFvR1kSTDHcmhuXP3poOoY10r8H6BHK5PRgvxgAFGWJiF7G1ANEiHbjgljDfENF5rXN6i
	SR1bNJyoqZkd+kX+4KJ1/4KALT14QCJNPBWu04LHgIJcPdICXBA/1fnNr6Bq4M0Ep+hugTRphwwJN
	+sfYRkE5bLZY2kZ9g/zZ7IBGzFricYRV6XqPmB8UUWFc30TXHRvrT+P2yB0bgv8WmyOMldQCvIrDn
	QP/IHIPBB2v1BoFK5YvK6kIvrvAYYA94261P/DJndLo4Rkb+oHwgyE0EpyUjquQ97jde60unXf38m
	AvVFQEvID3PlBkoyfExw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1je0wg-00024t-Mr; Wed, 27 May 2020 18:38:30 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1je0we-00024S-7X
 for linux-snps-arc@lists.infradead.org; Wed, 27 May 2020 18:38:29 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3555B40213;
 Wed, 27 May 2020 18:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590604707; bh=M//bmATsoI3Fpt7Rlx5CQNhiW+o89qZGtAMlx0CqtCQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=RR0pLf0OlZzc1DN1+7COu3Hy1slc8VhAybNE9uCyZFMrxx2ZYg6uIMmAk+69UY+QD
 rGxl75/hVj8kxmbGK/hQsdcPbBS7+H9Ytfww0SLbtmJD0XILIK0CFw44r0hTVq1WkB
 i26b9+2BuOoVeZ+R0hNTxOn7ApMJQ6NSE/J3bnzwqk9+FKk8u2bLyl3jCkEtVe+hvZ
 MaSZ6B4Q3CCXhEeANtHTYUd/5lCHgKVCrCe0xICP5fgAGL5jLM+Ii4hXEKXq8ibjlN
 lhcPXuQ7DII2WGjCF7dusD0pOP7nEHfgetN5EZaSgXibc5yuljk3Uloq9PeNQ56L3J
 he/K7fp5je7EA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 479F6A0069;
 Wed, 27 May 2020 18:38:24 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 May 2020 11:38:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 27 May 2020 11:38:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuDw7U5tSSTdW57pViG8epoznHewpArbXYtNRKmV3gpRz4AlsegENZio9ZUzXJB/smnvr3qGMuAVtLTUnBKgAniujkxDU3WQk2E3W1ygQBeAzoAhFYMWuwb5eSeG9Lv2sjQqS+jrcwgLwjiXKcWI0NpDrMRF1nbLAXo+3IFeKM1w9uwjBS7nMI7OaSq4r4fpB27KGjytzbec4ieNGtd1+vPZdNclKfqDIVLLrcXDb3PBPCTIr7iIymHtd86X330sYo9UKcSeDR7ntr9JgI3qQ6hoihxWPtNmNQrGdaOhjWOgJgIq5AOmszifPWGdR6brLIsq/nwP43eiiJCOB4VsRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M//bmATsoI3Fpt7Rlx5CQNhiW+o89qZGtAMlx0CqtCQ=;
 b=nrIh7Hp8gYYINzgl6FKwQK3Rg2kk3sug6faUrVduawUtCn6mcWEEvYevpJAAvKl30QsYqFKUne5hUQK54mMSifivpfB1BzQnOSLchaNixC+kHgWkpr4kmVMhrMyIr8Q5rlxt7EA0XnOskoi8kFwB+vgbrTirhoePP5kgDNT9mV/XlCn9qN3BYxGuxJXV2/qDS24gGHeF31CB08pGoVWimXMf2JZBKq75m0aIDkdMhkf0zepdY6zh/zgvSaBkWBhbA6LjAN9HNnXqEgY86g1PXyL/GSaNZ+0xgiZVfu3lthCMrHcPycG3AFIJPVf+e/tlXWXKSpBlEfS4wrRdQ5I0jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M//bmATsoI3Fpt7Rlx5CQNhiW+o89qZGtAMlx0CqtCQ=;
 b=v9H2j1yWwJd79eRJTDqDTVkkTAQzOk/ixFV4++REaovj8vJ2cM0QQTsD1WCpx5Smcvg9u0kn4gO0jOirDXc5aUbP8iM9X/AhRa0NYxqbVqIOLmYUmj01xMZ6lO42ibSDyQb5yTzXi1L1q3hyfz/T2UxwIuPwDvAbvIKmpNNYzvI=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3383.namprd12.prod.outlook.com (2603:10b6:a03:dc::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18; Wed, 27 May
 2020 18:38:15 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3021.030; Wed, 27 May 2020
 18:38:15 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v6 00/13] glibc port to ARC processors
Thread-Topic: [PATCH v6 00/13] glibc port to ARC processors
Thread-Index: AQHWKlIRP4r4qWPT3k6aK8fkXwvGwA==
Date: Wed, 27 May 2020 18:38:15 +0000
Message-ID: <2234ca63-e48c-4c02-e36e-328b56d42fd3@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <d171cd4e-f74c-bf7b-5db9-5ad737e4a5bb@synopsys.com>
 <6bfc68c3-4b95-bf5a-3e12-23bf7c492df7@synopsys.com>
 <ace49dfd-a15b-2a4b-3710-5c3814cadd25@synopsys.com>
 <d7f1176c-87c6-90c6-161c-4705a47837ea@linaro.org>
In-Reply-To: <d7f1176c-87c6-90c6-161c-4705a47837ea@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28541de8-49b8-415f-eca6-08d8026d1e00
x-ms-traffictypediagnostic: BYAPR12MB3383:
x-microsoft-antispam-prvs: <BYAPR12MB33832ED400FFC4D37CA9CD30B6B10@BYAPR12MB3383.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ir5gd9hTDwSQ/F6dtDD+UAW19cXf4n15IlJZqZsS94KBHfsHWh7euTI2IY5jsaOiPaj8sLJnqoQAOVT02bCAyVjaN6pocHqbY5IbWh1GrS+Rlol5hLPohxaos9vWh3yMzNGGeId39+iahOQtjDOhhbJTr5n8fxQqDCbziHYQ6UTJkzRGcHZNorNkOFBAZolmksG/iGut6BobLNFzxZ1hKP4Srp4jyUIHTrYTwt9Ll0NaZDKfpZxyqUdSyKm9Q1pBGZ8g48/oCbwECJeFcJPdztIiK+UJG0ggqpMiDbG/iT7luL76EiAvqLKdDOhAGXZs0A94Q8gtu9sFqZS7V8VEu7PoFGZHBdI8n1n3FNIPgMK+SCHOkPItnmUxbjnJfdM0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(396003)(346002)(376002)(39860400002)(136003)(71200400001)(31686004)(316002)(53546011)(6506007)(6486002)(36756003)(4326008)(8936002)(86362001)(76116006)(8676002)(66946007)(66556008)(66446008)(186003)(6512007)(64756008)(66476007)(31696002)(478600001)(110136005)(4744005)(2616005)(2906002)(5660300002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: FvOebdHr+Q9xHVyxs7A6qlLyMNvdiv8Y03O/CV7w76YInRMviZ0BMiKHOgrO/DJlzCE7p1dFNSfjigZise+h2fLMswSFNfjojMRylEPo/hQ6N5soHZJme+O0t0ZFr6MpNHHjS1LDWWW5zwmrv+3Bcz7U5cRaiItCAaoAAyFPOWqWQqW7VjlqAteh8nj/beBSMF6C//T0oxDl2PK5jyrqGF7dOISweHmZwd0sNTQBLYNgK91wBpAePx6VdLEj/VwtsW0KMoBR7p5z79DCizFo/9cCpRFtlRUPSCZeFWrTyAAmpsYaMlYgoisVTGF2bDcHBmBQLj3V3cUYNUPsfh2qZtxQ/OGnPrYUrA+zY6Jb6aR+7xjTDNd3EzgXbcxHgTF+iKC9SCJOE8FK0zG52gw4OCawGTYENjaGF0NQOWz5rWpshvjVmmcoVFirYoILUWt11NMEAtp1fB1ffOw3ef8Nb38a1ps4ZL4IHGZbDT8vGQ/fX5ij1f6/bFne46+YpNAfAPwWposDqYKIgwO5FRnYYg9qbviNndrZVssUwHzNDtxkwu/q8DQpXyV3mHFdlnRc
x-ms-exchange-transport-forked: True
Content-ID: <D05F5EE44AD86840BA1082353B1601E5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 28541de8-49b8-415f-eca6-08d8026d1e00
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 18:38:15.0433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k3dtMFnDaoegvDIti/qzPdiYwIw47ODDCmO/KhpeCRjmGPxxMMXN3OYSgNos1bkdK7NndMTKm9hviNO5ibivXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3383
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_113828_308563_7E90E1F3 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 5/27/20 9:41 AM, Adhemerval Zanella via Libc-alpha wrote:
> 
> 
> On 26/05/2020 22:49, Vineet Gupta via Libc-alpha wrote:
>> On 5/14/20 5:45 PM, Vineet Gupta via Libc-alpha wrote:
>>> On 5/4/20 2:21 PM, Vineet Gupta wrote:
>>>> On 4/22/20 6:41 PM, Vineet Gupta wrote:
>>>>> Hi,
>>>>>
>>>>> This patchset implements glibc port to ARC HS48x processor from Synopsys.
>>>>
>>>> ping !
>>>
>>> ping ^2
>>>
>>> I have rebased and adjusted the v6 patch for semaphore header unification. Would
>>> appreciate more technincal review.
>>
>> ping ^3
>>
>> Hello list,
>>
>> Can some of you please review this patchset. The only comment I got on v6 so far
>> was for a common semaphore header which is merged upstream (and dropped from ARC
>> port). I'm wating for some more technical feedback before posting v7 (and
>> hopefully Alistair's sysvipc code is also accepted/merged by that point)
>>
>> Thx,
>> -Vineet
> 
> I will try to help on reviewing it.

Thx a lot.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
