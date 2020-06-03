Return-Path: <SRS0=RjUh=7Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E551AC433DF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 19:47:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C11020734
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 19:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="clbGWIbT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fAIzGl+c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dr1SYZiF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C11020734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzIkno7uUF2pTQJSpOX961ImSL2YMKnuSowv/+xIxCM=; b=clbGWIbTLDv7NG
	ysYd1/IthqaVLqq3jCqDATIqeauT8MnbdQfrL9cTnhFwYHvNMTFoD63KJnVzI5jzaE8LAxUFvye23
	koqFYdjTJnR2FUW9vyVogYEhK/lmNkD/nZO0EvkTsqSudKQdvOMJG6Ugrl4YBaHGn1LnPyLWZt6EM
	YgxlRwcNYJI1gqCldhFXmHmCyA452xpZ0iikqlODhfTk3qBAVBrk42hiw/9AZzsvg5FGMDAa+0bVc
	FiYi+t6mo7wcabL9GA5kd7SG78rKsh1Gf6bNwr92xUoNvMQH06Q52BjB0a7bjiPptRm9XyIuXlj72
	k+MrZQ38eFC3jda7zCuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgZLk-0000ad-5c; Wed, 03 Jun 2020 19:46:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgZLh-0000VF-4j
 for linux-snps-arc@lists.infradead.org; Wed, 03 Jun 2020 19:46:54 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BCD1B4017E;
 Wed,  3 Jun 2020 19:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591213585; bh=nOzEPv4G6lL0lY84NBsYrPZNylRObEdS7REbqn/ufa0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=fAIzGl+cdTAZ/loi2qMrkKOjrH+ENizFFfAuFaLDvnlmT7lL9tksu/sTKlzbvNeCC
 g6Z2LL3bkzLySchsrO/dZ4GhoP7gJ0IqD2YvegOmMhZhsOxDojg9WMfgkaVT2C6n0f
 rum48cegOb7pYGgOlTRKK4esnLvd2ecgMYdTVwrq2sEMHlvenmaSdy69Q32S/ThnNV
 zqozcp4K3fCbdrZ6Ey75PGIabnODkbiHwsq6w723slDDVXuansBxh4gypuE5IWbLTJ
 nYu4l7eOV1B2QmIDbd01hFFYpD8sfjuBLa3ZK1/IXcor5cvg/i2q2leDNLRoD6+c6Y
 7Hp/96SE5tmIw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6996CA0067;
 Wed,  3 Jun 2020 19:46:16 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 3 Jun 2020 12:46:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 3 Jun 2020 12:46:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ohg1KJ+xCxSbDbsny5j8frcnUlxCF7FA41QkP6kNjEjXBU40QOdEaLEcQ44HZSDeb5WNsBq9js74JwGDb+FJndDUBUOVC6dkCrmp23BdTdu84gA2l6EW0XnKye9iQXI1t7H2Ecq2Zfek1ADnBv0IFBa8JTLg+a6iChRgk3kQoKbCUssmqcIZdHWRk/kyMlcinfgLpYj2AUKmytbT+11JxUoOdeCE7aWf3mSDryVR9KzzDnb/Hc2ZY6VDdevWXFjzs8pPqjW6Ve4QaC7oCGYhMewNu99i+bPksipptbA46ALtlMjjOWfQEvRn9B/3GDZEN6RoM2M5JNHPrtq8P6oHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOzEPv4G6lL0lY84NBsYrPZNylRObEdS7REbqn/ufa0=;
 b=h3b9kZjWT1tXougIpTXToUs+/yzxulO8j8RiqJTJMEQBo0Cw9NYmMOiehT8QWiVDIPbsMiP/mu8R7jRePRNW5YXgm7mJ/bZ5dFnK2xb5At9H8qAAsP0EQlVUx/9bZJ1p1b2Ei/iPiQirJ3FCmIkcA2J2o4+y6glj9FFikbnIbiXZo64+C/gOsMwRkkLJ/i+0PLkFX6C2GvbGqcHhraGokhV2GZqydtduHSJ/+EnDxubZsTsl/0ni7jau0tMGWQAJx6Xhfs+XT5m8D3l+aoQHpk+T+Q1uCaZ2yLVYgv51f0mp04D75+ikFaiNn4r57/JR0uK/kGTuJfDc2LPbBKr8NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOzEPv4G6lL0lY84NBsYrPZNylRObEdS7REbqn/ufa0=;
 b=dr1SYZiFSRpAZiia+1OForbmJrUALreM0Mp2NuJoNp4rZguGI8Qikfe1lwnv9gGRRQhs6OZJbYtHz+ZJjC/9V+6c8/8UR+qH5sSiuJjFawX8kSA9j6ga8m4Q06EVOSqumFNFqotaQXK9YSKvsoh4J2PKTIePMePsX7KiKIQwuqg=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 3 Jun
 2020 19:46:12 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Wed, 3 Jun 2020
 19:46:12 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v6 07/13] ARC: Linux Syscall Interface
Thread-Topic: [PATCH v6 07/13] ARC: Linux Syscall Interface
Thread-Index: AQHWNdk7jGc/VtI9YkWN6o0lqZFobKjHU5GA
Date: Wed, 3 Jun 2020 19:46:12 +0000
Message-ID: <b047f6c9-58e5-c78f-d949-52ca288d3fa5@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-8-vgupta@synopsys.com>
 <248259c7-8263-805d-56cd-9db397eb9c04@linaro.org>
In-Reply-To: <248259c7-8263-805d-56cd-9db397eb9c04@linaro.org>
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
x-ms-office365-filtering-correlation-id: 2d763437-0793-4715-a973-08d807f6c50f
x-ms-traffictypediagnostic: BYAPR12MB2710:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2710218D6265FE979467E491B6880@BYAPR12MB2710.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 04238CD941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SpZB44F8zE8vvwEhvwztIJRkA4qbr3W8Qh/3UpcTPjeJ9WdaVcqczbLiUm3oRNTuitTnj/DCKYTpTNrR8E7HgoM9lu6KH33iDjHDEcZfIVrJ6imzLu4QsCklgx+M0lElpx2HbZgYCrm+psX54b4dA/exyJN7HIqxmriGvbIcUt6tlIJse95LmCOHgkDvID/quJiUro32qfJ0ahlItT/qC9kbYab+HQUE5LZRt91Dfv4SeGPO68durh8gbhybjzelS2gkn7385ZK7Ut7l8RSBbGNpGOSVA0NiyoSBnCt9EgrPJYwhYAfi6mOWHFN1o7nRFsOo9o+V46jsBaUd33/SbHQivgwF7QsnWLLkfsZBxg2JSyK+2CEOmvNTMIdfX7FSrHN/uItN4E1OuMOwUxV2XrMsS0bRJylHUwvVp/rLzSm7fsaESa75T49umMCDUumJtU0uuLkMQtZJCp3+iVCVlCGpIEa7RfhhFQhXN+dIFh6SYek5pao2MJnpxWW8fcPH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(396003)(39860400002)(366004)(346002)(136003)(76116006)(6506007)(66476007)(110136005)(53546011)(6512007)(66556008)(316002)(66946007)(66446008)(86362001)(64756008)(2616005)(4326008)(186003)(966005)(6486002)(31686004)(478600001)(2906002)(8936002)(71200400001)(8676002)(5660300002)(83380400001)(31696002)(4744005)(36756003)(533714002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: rhG0Dk4axG0WxYr9so+Iy5g3Gad8Aufgx3RU3JhjJyN2iVvr1iwIveDpQzEs0vnOQqXxho3pl8eyaNDCw3RiPB1tY8op4BUR866xoeUtZJpIEaX8XEfl58+kEeng5rrOMq6q1HiybcDJGLtigggQAX9haxrrk1OpJ/eAaAEYpkXo9xjS5MyKbhLbbkKh3GN8hZuXRKmbN165Xavwqv0N1qdyqQTHH1rs/FhKcbVU4bHE+4TeSDe0zF2exsMg1razMEvXBuKYfHHSVCoXomvLzHTlilpOO1WNJSX5xEULjG+/5HUKbqSaLeoyjekuvDF94aGbryJzitmvVlCaqmp+IHhWQh/1Ux3ZwKy7QIzNqOJVVl90GJ6dbgiluvZCOr1lebfbvZYehLXPF02ECYrRMNVDmsMzX8r2Sas82R+6DuJU85C6O+Bq4uFH3D7dHjPPYRa3Iqv8M6GLQyDak6qNcSW9GTfiOrAjWxAub1RnlzTZXOvqdniicMv6aRTS6CYwYKw3ISCKyv6mn3nKTK8ohPHh6KGt3XGscIa69N9GH5CcAmkCt2Ctb0/5zpW9QYYS
Content-ID: <F73069B4167AF7459816418E8B4C207E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d763437-0793-4715-a973-08d807f6c50f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 19:46:12.0823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NGKym3Um/o0EBboaKIogT2JA5VOgvbbZ608z6pywOrDY0+baKSbMsOm9u57Kau0Ml/3nOrRoVNv2oqE3rVbL5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2710
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_124653_261132_D5D1B9BD 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 5/29/20 9:49 AM, Adhemerval Zanella via Libc-alpha wrote:
>> +	; ----- child starts here ---------
>> +
>> +	; Setup TP register (only recent kernels v4.19+ do that)
>> +	and.f	0, r12, CLONE_SETTLS
>> +	mov.nz	r25, r9
> Do you still need to set it since the minimum supported kernel
> for ARC is 5.1 ?

Right.

> It should be safe for internal glibc usage, since for both pthread
> and posix_spawn it blocks all signals including SIGCANCEL and SIGXID.
> However this is still small race window if this is called directly 
> with pthread cancellation or g*uid in multithread.

I'm not sure what you mean above. Do you mean not doing this in glibc and even if
kernel support didn't exist should be safe internally ?

fwiw as mentioned above kernel sets up TP for clone (SETTLS). I detested doing
that for a long time, give ABI implications but ended up doing it anyways due to
an actual race hit when running uClibc tst-kill6 [1]

[1] http://lists.infradead.org/pipermail/linux-snps-arc/2018-October/004480.html
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
