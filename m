Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA55C4332F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Nov 2022 13:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+YtUM8IO+OpQ9SClRsUgK5rvzqPxaOPe4y6NlVWNurk=; b=4YuffQnFj9SB/h
	SU+CGlqwrN69r9KRzaLEsuBe/1ND8nbod0JlcK/gLuK9Na2rqer7OFJO5tVYDG28btsmlzFfAnx3Z
	oDinQm4/SgrLIycv3aLJgs8hG9dhGuKVlGfMynj7+CHLk4+drgHkDwQNiaCULeVeCBDHWG6JWXwyi
	7dmoCZ6YZsUyg19n/ZZc2cvgB1CCrZnNzZAOs9PX7UccqiGbiLsRinJJp9HqAzm6ED+W4ypg3VvfJ
	R/qa0ToRRSi7NhE7IDXK1wT7ZoclJZccoVwM19V/lhi7fdSanyN26AwM6Y+/ZD7FUybUtZH7KzwgB
	NOSNaLNnLUMvzxbwE9zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6Wx-00DwJs-6W; Mon, 21 Nov 2022 13:08:11 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6Wq-00DwHc-UH
	for linux-snps-arc@lists.infradead.org; Mon, 21 Nov 2022 13:08:09 +0000
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ALCQ2ch012066;
	Mon, 21 Nov 2022 05:07:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=jSwcdfh7lP+23zUxUu0VGuSpR4FM6ZFwQzM+PT/XS+E=;
 b=nbzSgq7bmlsvG1jpo91Dwib9prLV6sJNoCAzDFWlHIuQcVdXql9wkFHHIEmKC6RsoVTD
 PaCTW5C2+20pu+cJgh4Y0pk3L+YvJWpjVssXh1QgTz4+DVrXE3S2s07nYV6FzQJJUnoG
 1+/oCdaOG5yflMVLXMEo30SDBPibEbFOaeUQbtHverryxIeuQod01jvwUEZXhy9nYi30
 t5o5sqdL8NK1zY9+sUGL0/NjuVEoOQIUAvYy+QYLko/lDwlFLtLGGY9H3OF/xnGJ0k1D
 Mb7zKJp2cnByxaF47VpycIGlV5cNzEs1dCblDhzNB/ugkBT1JyH55Bdi5WgmI0Km5RF/ 4A== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3kxypnen7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 05:07:58 -0800
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 01C744008A;
	Mon, 21 Nov 2022 13:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1669036078; bh=jSwcdfh7lP+23zUxUu0VGuSpR4FM6ZFwQzM+PT/XS+E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kEdIVQZ3iBpfLzMrPHjQYBH3TA0eYjLZ0wwUTviDrdY3qLhd0UbiWoXEKzeiiXGhv
	 EY5k6h1o2bXjlsezaitHfExXN56buZv+ef/yfGYBKy3JuCf/jY25VRYg3GOWWpLS9P
	 Ha5WBHMkPNHy20oezp5K7Fe6tu4WEoOnRjTIKDaZ8dLS3mEY04i7L5hVHgTt7k+jnL
	 WarxVnRsmgc93lDN2vlJpQ2YgcsqbUAwhINyHp/SUTVr5W7uY21bAIJomUCF0rsh7O
	 +RChF5c3dUoZy0FmtTVEjV11E3kG7Q3pkTO1O9QgLLP8HjLwrOOATDo3WSO+tdzfHH
	 c/UyhXPUU7W7w==
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BBC3DA0086;
	Mon, 21 Nov 2022 13:07:56 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 01A09A0144;
	Mon, 21 Nov 2022 13:07:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNfq88QdfZU2VcFR2tC4IHDpxm9XGi5FNNGths8onqGUqwRmMhHsuP0S6670c96bxYUMn+LxOMQkdtwpfJwlH2/9+LlP7ABeXWyeKOpqwCjJIpBZyVaUjsu2HGUO15XN5k9mWe+IrWbHryCQfU83yPeir01n1mHe+jjy5G1ZqzbSG7jHwJMXyGu1nUbyHkbl2MMxfrGzw+AKKn2+fzCuLWw+V3CYmjNZzbP+bCrFusO3Qa6Sa58COLihQgY0uqoHF4mvlDzGeRc9BBOX7rgkGXjSZp7zWWMMfftHmUn0ukXaOG28oSXZlgWF56hYQF19qukR10BNL/bwYxtS3FnShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSwcdfh7lP+23zUxUu0VGuSpR4FM6ZFwQzM+PT/XS+E=;
 b=ScX57N4Ux9PrvtawHPOlhkPEjm+L2KTAdPNWML6kKjWjw1CRvcQtaGxRafXSu3PyeOxSx8QHP/FKvcLe7X/DhOirfA8KBVqh6J5qX4Z7Pw4LQw/bXW3J5zxRYoUMWODbjqnCnWOG7XY2DdsyTL6BZ3lZDfn/5IgVZ4+WmzN5KXXdDLvIyNRV6MeTCljMLOKTNTciGMVFDTp+60szSXgyWwkjvm5ST5poC7xzH0NspdZ43Afud9R2metcKEUFnGTurnGuFLUXD9DtaNy0e7RvT8Yu6Va2O4mlxMrAUGrYy7S+7CH90bQUav2ycZmFWbrSh3V37Ww9hsOIBnBdoasdzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSwcdfh7lP+23zUxUu0VGuSpR4FM6ZFwQzM+PT/XS+E=;
 b=CC/qJ9GrCGScTh3YyfoADY5RKiow4nKKdGsHzjPtkEpOABzUX4yZi3INAFxbc4oq1Y9yDB43RJbp/5fiwqYDc8VkDocLkc6wD2pzR1Fj8KLi6C8LbkckM1yeUZ9e/c/7kyP3Kpt7T2KlnbiwPvgE1d0P4AHNohnfkYdoVNIlR3I=
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by DS7PR12MB6070.namprd12.prod.outlook.com (2603:10b6:8:9e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 13:07:52 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::ddea:c7d0:207f:68d]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::ddea:c7d0:207f:68d%4]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 13:07:52 +0000
X-SNPS-Relay: synopsys.com
From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
To: Vineet Gupta <vineet.gupta@linux.dev>
CC: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Subject: Re: [PATCH] ARC: update definitions in elf/elf.h
Thread-Topic: [PATCH] ARC: update definitions in elf/elf.h
Thread-Index: AQHY+0/hfnbeoh/BT0yBFz/qiHwMda5FZt2AgAP3CQA=
Date: Mon, 21 Nov 2022 13:07:51 +0000
Message-ID: <de0e7112-4f83-03b7-3dca-a132a59635c8@synopsys.com>
References: <20221118131542.23188-1-shahab@synopsys.com>
 <abed8f65-738f-e9a4-7353-801ebc10fa70@linux.dev>
In-Reply-To: <abed8f65-738f-e9a4-7353-801ebc10fa70@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR12MB2782:EE_|DS7PR12MB6070:EE_
x-ms-office365-filtering-correlation-id: 6948dec1-d2a8-4e2c-2c31-08dacbc16592
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  xOiTWOgr7vzo0rohy19fl/lDTg01woIZKtZU7TpSZPSGeaq6DGtUtJbpvvqhRLS0AyvG0waml1Xfh938QY173emddlGSu2YjAh4tV2I/RdSnq0ZMLAhi5ZgfQpfIIMNHCenNqGBdEwSelN2iwKKP1GPdo4LRSkVj0BqOE2cbslBsv62rjhMhkKA0qvRwLWB+qo/o+Qqc16XU6K3xn0LLaEPMsXJLSEHgvI6BPcRHzohJ77s/mtpxE9338/4sfbt77/NpQmeO5HboHWaZQsY5w09oBSY+rsma35TJbxyjDhsnINMPfKj2UXBqCqsnuQIOgKYz8H3pcD7jAANGEK1zsRntYYqBfZOgfLEe86v46Awnfl/fEGNyFUbEYjNbYcvq82Yzlduaggel+ojobwx4B2BaLXiw9XWshTqJ+BU6fdAocIx3kq406IcfXlGfX5Krj3cZIo0esBoZJXH3BfhXIOrdO3eIO0YMiCQ52tWS9P/mFpSiF9W5J/XCETrlC4HheNq+ABAbqbpkk6j8+7ZS432zye1P0j+5Z6iOwxjVN7+nQSGAped8wypOAx3/8LO1MNU1VC5j50FlzdTHTs2sg+E5bvF/0Zyd8vjxwsk1i4Ck2SuL82TddDU9t+8IUVagcMXTWtqoX4p94ZqSNBsVbGnrE0aHtIXmkoyycM104T9gLrY4uloIB6gye4wizlB17ed4iN3U/dkftqgICxWZHLurSaTirTzdDtJ2v301W+KWO1fokvgnHq2nvkrhkmXa
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2782.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199015)(53546011)(83380400001)(2616005)(38100700002)(186003)(38070700005)(107886003)(122000001)(2906002)(8936002)(15650500001)(5660300002)(478600001)(966005)(6486002)(6506007)(6512007)(71200400001)(76116006)(41300700001)(91956017)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(316002)(4326008)(54906003)(6916009)(36756003)(31696002)(86362001)(31686004)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cFYvZjBaM2NydVFmWDJKU2Z3cFh2V2hIOHI2U0ZNVUw4aEF1ZlNrQWtpSjFX?=
 =?utf-8?B?bXNyNXVOcUMxb1BPZWVLL2NhcHZIeWZqbGZhK2VWMWlDQWF3bStFb1V1ZVRJ?=
 =?utf-8?B?VVdZWlY5aGdLcnFNbitjaWkyNERWc1pmVStEa0xWL25BZWJnY0w4YmUzOVM0?=
 =?utf-8?B?ZU1JdjdEYi82ajFmb1VoWENGdkY5djFVSmdjMkZycVVTYTJUY3pGeWp5VXZ6?=
 =?utf-8?B?Z29iS2hJV3dUKzFZZW5ybDFPT2ovUlVtYnRTTEo5elRtTUNHK0lEdjJWcGtO?=
 =?utf-8?B?cUI0OXVsK3pUZ3hPUU1UOTFTdE5IUkF1VjQ5ay9lU05nelcreXlpOE54Y0lr?=
 =?utf-8?B?dkRiY04wdVJwTHJTYmtSSkROdkdUcWFPSEI1QmhuY3VKUFMvVEtHajhhdy80?=
 =?utf-8?B?WU9aa1FjbWRMclpIaStQdWZvaWtYNTlCQkE5YWkwRXl3a3R4R2h6ZDZ3eTIr?=
 =?utf-8?B?cXR3eHB0M1BUczlsU2RzZjc3bXExWHozR3V5eFJ6SnNndEtWVjh4R0E3VFBu?=
 =?utf-8?B?MVRBek1WaWxjR2hpeVZuaURBeWZXUHBKMElDeHorU3JtSTNMM0tZYmNmWEJ4?=
 =?utf-8?B?V21YL1dlby85Zk9OUkxUbkxIRFJGY2t5OHg4QktveStjVEVoWHNDeXNsQUJP?=
 =?utf-8?B?R0c2ZkovNHpKL2xJNUMvU0ZZN2NVdStPbml0U2tZcFNKUEhFcWgrQWVxUGVH?=
 =?utf-8?B?cjRCZDlOeGNNeWNyZldTS0w4K3NjZC9CbjJ5OHhCdzBtdDQrNjNrMjlkcitr?=
 =?utf-8?B?K2VnTWl4bXVHcW5OQXZ5K0V2NERTc3NYNmZBd0c2SDM1cEhMVVl0Ujg4STJH?=
 =?utf-8?B?NWt2OW1CeVEzQW9CVnNTK0twMlQ2cjdvTWQrYmsvSDUvY28vU04ycm5rZUN5?=
 =?utf-8?B?eUJtQnd2U3FFWlAvTHBPTzhqb2ZqQ2Uwbk1xOFVJc0JuNXVqNkJpQS9GK0p3?=
 =?utf-8?B?Rk5TYlVTS2VlTjBDZUlxVFVnVkU5N1dXKzJVSFM4anlHWCs2a1RJdmpBNUZG?=
 =?utf-8?B?UWEvUldOMFJuSklwci9sdHhEOGtJa0h3Y2JxdWxGcGFKdUFsakRsRTZuc1Np?=
 =?utf-8?B?OTVzUUtTSkNYb2F1ZUdRVkMvRExYNyt5d0I4Z0lXMllYYW92KytOc2VGV1RB?=
 =?utf-8?B?c0tkVFdSbERSS0tVa1o2cWE5WWFtRm0wa21vMkthSC80bGZhVTk1bkZqUTcx?=
 =?utf-8?B?aGs5K1NQMWF2Uk5NVW9qdmgxeWV1ZkZwbE1UOVZ5Zjdwd3pFRkhaUnA0RkZU?=
 =?utf-8?B?U09pSVJLV0hhMUFUM0xPQWduNFgxcUVBOVNmejQzWmxQVWczeUlnTlFxOVZU?=
 =?utf-8?B?ckx4eXBDV2kzcGpXMDlqNjc5anpRbnZQbkYxaEFsWDNpYm14dEZXTHNubjVH?=
 =?utf-8?B?MC83UDNWaUFBZHhmT0pWOWVIeDZ1dEtpN09qWkxaVk9tTkc5cStnQXFISzVR?=
 =?utf-8?B?SmIzT1U4Y1paNksxTVhTMk1XVy82TW9OeTRsK0gyT3BQY2RodWVxbjFNdlFZ?=
 =?utf-8?B?QWg0RFFWek5oRGFrYjUwWjlhcHJyQWg0bHJ1MC9XN0FXS205UmxPei9CbURF?=
 =?utf-8?B?L0N3c2piamN6aWxiejAxNFhDL1pFVUl0OWlSQXdoWjNxWWhsV3ZjQ0dOMFhM?=
 =?utf-8?B?M0Vwb1hRb1BpUWlGN2pwODdFYVh0SDVWZFRSdDBPR2VqNmlJUHJnWm1ZYkVt?=
 =?utf-8?B?cnZTZnYwalhyVUFORUNWaUcyN216ZHltaXRhUk9wQXJpQWtmN1cvZW1FTUJX?=
 =?utf-8?B?V1pJbGtEcVFidG1UYU9KTGJhOXRvcW5XbDBURjFKSHpmc1l4dTRQOHRDVmEx?=
 =?utf-8?B?SmhqQTEzcEI5UVN4V2VzTkxnNGdGa3VhK2xpRExrK05mRDhMUGR0ZVg1djJH?=
 =?utf-8?B?cnZwSEFsTHQ1NTdXb1RQVHpkOWFmSjBXM2J5TnlRVmNPaFNuZ0NWMEp3bTcw?=
 =?utf-8?B?SlE0cytLZFJkWkhSOUUreGwvZGsvWjVNd254WTBQMFU2NzRjZWdBb3h3ekd2?=
 =?utf-8?B?NnJUTTRZMEsvdXlENi9CcldIM283QXRVeDR5ZU5NeWJiczBYWldUVFNzQlFZ?=
 =?utf-8?B?NkUzNTB4S1VYaGZvc21ncWU4YitMMzFCZm4rNnFDallaZ1JxZmFHc0pwNlhO?=
 =?utf-8?B?RHZXdlJVU1A1bkluTDNzenhVOW5kSmI0ZmpIQnM0L3Q0Uno4emdabHdSS1NO?=
 =?utf-8?B?T0E9PQ==?=
Content-ID: <A8BDE124F53B014FAF359566E7A7137B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	N8xyM0Pt7kRoj3B3rgKJl1bV60Xdjh50ATMFmOtcbo/e1MA+MVb2eVModdfVGxYlYIO4CMtOF5qyRrcnB4i9fZtyslBwJOmWQHerHuxaMzneJsku/28W04Chpl1DipZQjxz1xvLGRcU8hFoRHy0/uNx8wOPePJtW3XsmVuuQwXJdAMDzUfMlmwQAe3i+Ffoj1G2Bn3bPSdQ3p1QFL+hiIh7rB/iaM4UNYHevUxzIzVPGbJymaFg8Jtr2u7XZBDSXmU7k2ZjaSBgk+EDfOWtyP0kotnguIpwQTsRQuFR9XEkQO7PYfdNbgSrTLRVlieDg2T3rLQpBC3FdN0OdNlXHhoWBc8Ap9yBleo8tQADg77nEEW2E0FKis4lh1bZKvSUCcuGMwtTxR0xi/UaLy0oREQRpSruQrnkuiwYGLesI2Vlynw6ND4XeSFpHn/DH2oaW1Z/LDddxcchu2oQTFZMpzJq0BQC+vN9HKAqs4KOO95Aqnsl+Ad+cU8CFvOdN9NqdPxNnmA/NY5uCfqvar4oROeLjHMyUex4VYDk0eHnURDNEe/RRH6u5CuhMzYLs4CQ16B15o5NdZVh5idqQxCnj5aEYKxwPs/jvhWdPH4vEs/AOlwL9rAJ8z9uQ/lvqiJSiw7zXYeZoEaPs3gTeY/s0H31IVh6FNaO5KTyeT3YpVl9l48XUi3AG32rGJiaDf+vn/HNe5DJUmIUXA7gC3odGnsFD4JrtIjDaC5Yuyrr9EY06EtF71ffbvXPyhvYLI5lxvpwaqprDOkqjgy5B0d8SVOAnbBoum5sqV1L4inksRLepcoh+LrFIutL+Ql2hufCK075LJNyUYNQY3KLJrCcsSNeYrJD7ILNZXiuY8PC9rOMlsDUAbeQJynWeiyOKaQgV
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6948dec1-d2a8-4e2c-2c31-08dacbc16592
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 13:07:51.9082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jnA2XKR7sT9c1MANDIRQdVtVQT+m0dN7IMPDBZbYELLnGDi0hbpuuGIOmRFQuBVZV72BxQNPwFW/NMogia5vaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6070
X-Proofpoint-GUID: sJfs2pWOgvXXGDA7DVd0F2YzhsrLRrVL
X-Proofpoint-ORIG-GUID: sJfs2pWOgvXXGDA7DVd0F2YzhsrLRrVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211210102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_050805_235190_01061A18 
X-CRM114-Status: GOOD (  21.81  )
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

Hi Vineet,

FYI, a second version of the patch is submitted [1]. Regarding what
has changed, a changelog is put right after the sign-off line.

On 11/19/22 01:34, Vineet Gupta wrote:
> On 11/18/22 05:15, Shahab Vahedi wrote:
>> The majority of the update is about adding new definitions,
>> specially for the relocations.  However, there is one rename, one
>> deletion, and one change:
> 
> For completeness: And some cosmetic changes to uppercase hex digits.

Indeed, there are some cosmetic changes. If you don't mind, I'm going
to leave this part out of the commit message.

>> -#define R_ARC_JUMP_SLOT        0x37
>> +#define R_ARC_JMP_SLOT        0x37
> 
> Did you build glibc with this change ? There are references to old definition.
> 
> git grep R_ARC_JUMP_SLOT
> 
> sysdeps/arc/dl-machine.h:199:  ((((type) == R_ARC_JUMP_SLOT                                     \
> sysdeps/arc/dl-machine.h:206:#define ELF_MACHINE_JMP_SLOT R_ARC_JUMP_SLOT
> sysdeps/arc/dl-machine.h:277:        case R_ARC_JUMP_SLOT:
> sysdeps/arc/dl-machine.h:337:  if (r_type == R_ARC_JUMP_SLOT)

Thank you very much for noticing this. This was a snafu on my part.
I forgot to bring the complete changes from an old downstream branch
I had. This has been fixed in v2 of the patch [1] which is now tested
by building the current master branch:

$ module load <arcv2_toolchain>
$ configure --prefix=/usr                                \
            --with-headers=/path/to/sysroot/usr/include  \
            --build=x86_64-pc-linux-gnu                  \
            --host=arc-snps-linux-gnu                    \
            --target=arc-snps-linux-gnu                  \
            --disable-werror                             \
            CFLAGS="-Og -g3 -fvar-tracking-assignments"  \
            CXXFLAGS="-Og -g3 -fvar-tracking-assignments"
$ make

[1]
https://sourceware.org/pipermail/libc-alpha/2022-November/143536.html

-- 
Shahab
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
