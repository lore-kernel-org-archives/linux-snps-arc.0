Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A4CC433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Dec 2021 12:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqQ05JqDLqExCcjTDTjRy32vbSjwEXws21WGHXWUV/k=; b=nKfNZYnOYi8Ait
	OWp3JDC64wCsdlRkZb2sButNwTagPy4UJS7iOoAXNUBPZXXYe3uT98F+AG4UX8bGpxFBW6dV9MD6/
	fOj9Mh7fr3tYx4mC6YtBMeipTjU1Jg1pcDTQejh0me+K9Yc0LABd+9NxvD7tl1iv2Ljl1/IWU02Tn
	WxYd95bdkRXJQftTe/EvDQR9ajTGAqcTrEyUlvb1oC1heLJ9eqOUNlZq9rczSN6afcqDUD3+/y03/
	UhyUqpikpA6Kf7Vt9FJB7uBNYbgowa21riSkEVz3OlSj625nb0tyMrVAaFhL2J84vQmik/qgtMHP5
	hj+fzzRsuUXA0IlBgWaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx6yW-00DwkD-S0; Tue, 14 Dec 2021 12:32:08 +0000
Received: from 188-39-32-17.static.enta.net ([188.39.32.17]
 helo=mail.airspan.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx6sV-00DuzV-NB
 for linux-snps-arc@lists.infradead.org; Tue, 14 Dec 2021 12:25:57 +0000
Received: from FS50.airspan.com (10.2.10.50) by FS60.airspan.com (10.2.10.60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.12; Tue, 14 Dec
 2021 12:25:52 +0000
Received: from FS50.airspan.com ([fe80::5103:1cfd:775b:73dc]) by
 FS50.airspan.com ([fe80::5103:1cfd:775b:73dc%5]) with mapi id 15.01.2375.017; 
 Tue, 14 Dec 2021 12:25:52 +0000
From: Barbaros Tokaoglu <btokaoglu@airspan.com>
To: Vladimir Isaev <Vladimir.Isaev@synopsys.com>, Vineet Gupta
 <vgupta@kernel.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>
CC: Miika Keskinen <mkeskinen@airspan.com>
Subject: Re: [PATCH] ARC: mm: Update ARC_REG_*C_PTAG on each cacheline
 operation
Thread-Topic: [PATCH] ARC: mm: Update ARC_REG_*C_PTAG on each cacheline
 operation
Thread-Index: AQHX7iPAZzqOKo4ehEGf1OJVEc+hJqwxqzNwgABD/QA=
Date: Tue, 14 Dec 2021 12:25:52 +0000
Message-ID: <4ed121be-083e-342a-f3b8-5f27bcee87a5@airspan.com>
References: <cdddfeee-1718-ec30-bb17-2971d74b89cd@airspan.com>
 <BY5PR12MB41314B91969F89D2AC638C41DF759@BY5PR12MB4131.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB41314B91969F89D2AC638C41DF759@BY5PR12MB4131.namprd12.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.35.200.190]
x-c2processedorg: 9bdab810-6dbc-44eb-a994-a231bebe8d9f
Content-ID: <F5035B6F52F5B34880D61A6EBFB313EE@airspan.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_042555_795343_5D3B1988 
X-CRM114-Status: GOOD (  13.74  )
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

On 12/14/21 11:36 AM, Vladimir Isaev wrote:
> On Dec 11, 2021 3:12 AM Barbaros Tokaoglu wrote:
>> This patch is for a problem we observed on an ARC770D and MMUv3
>> implementation.
>> The problem was although __flush_dcache_page() returns there were some
>> cacheline
>> entries that didn't flush to DDR. In our case updating ARC_REG_DC_PTAG
>> register
>> on each cacheline iteration with updated physical address helped flushing
>> cacheline entries to DDR.
> 
> Thank you for sending the patch, looks like it is really possible to have this problem
> for certain cache/MMU configurations for ARC700.
> 
> It will be great to have configuration which causes the bug in the commit message,
> so it will explain for future reader why this change is needed. i.e. something like
> 'For X kB cache with X ways we have tag LSB (cache_size/num_ways) lower than
> page offset (XX bits for X kB pages). So it is possible for PTAG to change even for
> single page loop.'
> 
> Thank you,
> Vladimir Isaev
> 
Sent as v2 with updated commit message to include the cache configuration.

Best Regards,
Barbaros
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
