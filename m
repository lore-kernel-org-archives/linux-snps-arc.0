Return-Path: <SRS0=Z+JP=32=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5285C33CAC
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Feb 2020 17:19:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68475214AF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Feb 2020 17:19:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T68haEjz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZC+sW+Ka";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="Pyl47fsk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68475214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnV4eG4qI66xk/XManQMrquQ+b5bZzD748NWp1Tz6yA=; b=T68haEjzMm7Moj
	RndNR7QsC9n5vdl6XBymx0PO8MliJIvSeQU4jZGAMyMzT9KwcqtixnlwbJ1DZrlb+7aijXz7ixCWC
	UeVWdkb59ekyAw3vfJh96xofwMorMot/Z39eeabpPZH7SMEUSu3WBmF7nto4vAYaWT3b22LrNxJcj
	6VfN67X+RrhvuP90RfXqZa4YxHl/SOxgZ4pofMpVbs//7cl3yRTvRvcg9iWhzXidVqjhFgU+rgory
	FbIgfffSJDyyiVP2K1YxigSa02UhrH/Y7eMfN2clrAL5clfphF1wxOZd8OjU8AKZPd9JgmxgN3TfC
	S4lsjeyZUNNLGAo56OOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izkof-0008Ap-5G; Thu, 06 Feb 2020 17:19:49 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izkoc-0008AT-5m
 for linux-snps-arc@lists.infradead.org; Thu, 06 Feb 2020 17:19:47 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 55D3340861;
 Thu,  6 Feb 2020 17:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1581009584; bh=EVHFYWMafoIPnnZYVZ5yNyupgJkOkyfSPqp6tZTECG0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ZC+sW+KaiUsPltH9iCkSspoRXcC9D8D8VtIIGeQqeLSGBbumkEoo3m4NCL3zE1gdd
 541oIXVGU+UF8f/WihVOJ5Sb76K0Foz06v6OzmXN4NC28bCJbBvqPgRfhefy9Tlwdr
 ughImWzD7F7upwVkQWnO+lOsoaAeHeI2dyI2qrhqSGYKuGFmpFttZqd8qbEobWn+Yh
 03wlViRHqy2pwq3kIlVNJVfALtqnzZYARGxcR/BuvgjGGlRE7wEPPM93WrPOP/LMDq
 eDimMARSZSNjAgd7G17WAR5vkRmh94mkRT31HDTL0yGVWinAuqtLN0mwqPD+IDO+0f
 eSAAdWaY0SMiw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 79954A0085;
 Thu,  6 Feb 2020 17:19:42 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 6 Feb 2020 09:19:42 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 6 Feb 2020 09:19:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQ3PsAHYVLXUYdtbwSxAT8TxpdDNvyp8QZzKeirKxxncSK2UD7d06F8B90Q0hqIDXFeUVP2/Zi5JQI+w7BCHKwGaJpkWbkP0IOhVC/Fstb9YJSlHxdKrFb7VAH6JI3rf4q2tiuR4AWnaoic76aeydelsYKnN1Cz0DWByZjtlRrFK/A9u/A3MLfVw8taFUxQMhQnfC4KWysu2nXpZ5tkwE6qmgO8EiQ3irMCuiKgpJcg42f19Hao2D07bL+YEKcx3FBXfYEBCv9Q00Zen7DEV0dE6mhoYsxZI3moA6mgmaTo1eHF7Parva43mNdL4q40Ii95e8OKh/5nHkp2CCAGP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVHFYWMafoIPnnZYVZ5yNyupgJkOkyfSPqp6tZTECG0=;
 b=hFTq9fq8a8tZqrHmkQOUWkd29mydE8eB91WGb4wrYeW8wEHOU6L0QRC8B5YK8aorEGtEm4pa22oYjvKevvjWn5pWpvC3cVaUD0jiKwo/VXBJJcSE8Qb5v3WoNlcHeyHoENAuusr5OsA795fnwS7j0/KocmwRfLmhCl4L0oBCT/G3m7GnkvbtHj6LRhvTPzd1sv1wt4Bj8AQzRD0bCUdSTrRAfCPjrminiAktMvVnrWSjH5rtL5EAl8Q5XFoF3DvuHbbjShburwAfBy0/uplKzSPYALfO78NoWuVMNHZELWD6OtR5BZCC1L/7iYFYatFySspdn1rP0PV4X2UqeujWOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVHFYWMafoIPnnZYVZ5yNyupgJkOkyfSPqp6tZTECG0=;
 b=Pyl47fskG9oNRgLTtMAA4gQAsiIRPWsSHMA93WyIqg3UzLOBzda+KMdTp22aWc9l4JNBg5mXoDXIy05giL62iIAWU7AWrR3GjqdTdq4GdebRZYCUMF8MJ2rni4L5K5mWWsEVMGvIVQR7NgOIm7abpVr3yAqV3bEvsDx1YkdQEVI=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3207.namprd12.prod.outlook.com (20.179.92.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.32; Thu, 6 Feb 2020 17:19:39 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2707.023; Thu, 6 Feb 2020
 17:19:39 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: ARCv2 Public PRM (was Re: [PATCH v2 00/15] glibc port to ARC
 processors)
Thread-Topic: ARCv2 Public PRM (was Re: [PATCH v2 00/15] glibc port to ARC
 processors)
Thread-Index: AQHVzW0xcm0d0tcmaEmrZQM6snb/ZKfvZyQAgB8hOoA=
Date: Thu, 6 Feb 2020 17:19:39 +0000
Message-ID: <8311a699-183e-6811-cf24-3ad85ff80321@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1901300220520.24454@digraph.polyomino.org.uk>
 <980d8411-e4b9-24c0-3340-c112d6d6c349@synopsys.com>
 <c3e18811-b5ed-2194-ba55-6c5f87f46721@synopsys.com>
 <alpine.DEB.2.21.2001172136520.13033@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2001172136520.13033@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9b6f2fd-39df-4229-7ac0-08d7ab28bfa4
x-ms-traffictypediagnostic: BYAPR12MB3207:
x-microsoft-antispam-prvs: <BYAPR12MB3207EB99A524AB12A27C7248B61D0@BYAPR12MB3207.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0305463112
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(136003)(376002)(346002)(39860400002)(189003)(199004)(53546011)(31696002)(86362001)(26005)(6486002)(81166006)(186003)(6916009)(71200400001)(81156014)(36756003)(31686004)(2616005)(6512007)(76116006)(66946007)(478600001)(316002)(66556008)(54906003)(66446008)(66476007)(64756008)(6506007)(8936002)(2906002)(4326008)(8676002)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3207;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /G056z2OPBmWGGFSw9FLna6ZS7hj4UdzHc4GJyUcMgqppUuCUAF64dgKMObsHN1J8F2WxcBGK53FDiEs9apBOmWpfg7FXO+vOaDkSKTVh11pXNPhTY4wW9vqoQyZ5gRNEdp33B4kHH3e8NxWI97JsbBGEl7ypO1Setl7epQmVW1HLRWR/aoqWL63pmEaqvtOB0/Saki8y0ImA2uqp6O5nUDPM3QaQp0kTLlK5hi1ai+AC16Vjag32rF96G7oyodq3jTVfezrAUlfeOtn/WEmrHKpMJWMvSOv+NRlmzdwHZwwqxNTTOLwg7CrOMePZO4E9arFmqaM0fwh0SSD8WdGiivqpFkz0FRxsKKDgOUi8660I0RkyGXiWzf7noTONXMultJY3AzW8+6KBb3uQwr37gQXCjvdTFT0G1xybi/mKSYMG07EvvjaM3InhulIWeTF
x-ms-exchange-antispam-messagedata: r7mDNt2JQNYoYtx0mX+5FcRJxhtCtMZsOS53gVlCgSLCJAvtp8FhzKNotXLy8TgapIyeie39YhcwHJlaJ9rj0/YVrz7tWenqcCdhpWZDdMhmfOJqCE7o3cg8ggqjI09sQE+WLEtW/ChktMG6barlYQ==
x-ms-exchange-transport-forked: True
Content-ID: <816C2F41F64CD945862C4269327FF040@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b6f2fd-39df-4229-7ac0-08d7ab28bfa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2020 17:19:39.7054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UNRq5DPW4Fu7Gsf127e1TRtQcHFXyLJpQsXmOtJ7eeLiy7UjQku1nwpKHaKdQ9Lev0FwIE7a+SBmRwdpNRKuNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3207
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_091946_295875_ABFEE88C 
X-CRM114-Status: GOOD (  16.08  )
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
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/17/20 1:56 PM, Joseph Myers wrote:
> There was one technical point regarding the glibc port I raised briefly in 
> a discussion at the end of the Cauldron in Montreal: you should consider 
> whether it would make sense, as a new 32-bit port, to have 64-bit times 
> and 64-bit off_t, ino_t, etc. from the start, as RV32 is doing.  We don't 
> have a specific policy for this, but it may make sense for new ports not 
> to include ABI variants that either are, or will become, obsolescent. 

I agree we should do that.

>  If 
> you require Linux 5.1 or later for the port then all or nearly all the 
> architecture-independent pieces required for a 32-bit port supporting only 
> 64-bit times should be covered by the RV32 patches, which I think are 
> quite close to being ready to go into glibc, though you'd need to watch 
> out for any (new or existing) #ifdef conditionals that might try to use 
> 32-bit-time syscalls if they exist (which they don't on RV32) - and that 
> would not prevent supporting older kernel versions later if desired, as 
> the Y2038 support gets built out (including, in particular, the support 
> for falling back to 32-bit-time syscalls in functions for 64-bit-time 
> interfaces).

Ok I see patches in flight on the mailing list. Would it make sense for me to
start off in parallel with ARC port which will take it's due course of review and
rework and in that process upstream y2038 work settles down and I then
rebase/switch ARC to that. Or would rather wait for upstream to settle down and
then I adjust/post ?

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
