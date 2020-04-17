Return-Path: <SRS0=p2sK=6B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B94C2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:44:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6046E206D9
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ERFdo1Eo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eEApoT7k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HeIfg9ke"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6046E206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQf/ugTpaG1OkWk8d9KygQ4wnAJK6GtblklCwQRUPrI=; b=ERFdo1Eo6NEs8t
	EGxEXA0JH7IjtJ9J3is0UFAnE82gw8LwNRIi1ja+JjVUMVAP9ae53IvpDq/e7IuEk9AqiJ+sWgTJs
	ohCVf6lpIGkrUDj7b81AEaNQcUm5EtT6vv9g+k2QgQ3VeuILCjIbHqxq3E5zb9RUCcWi+U9f/koo2
	X6HSPOsHtZHehzNkkt16vpDAq+rFuL+pKcAfrL+bsWKK0/AoQAZFlXoYtzxueTQia0ryVRR1I2bPp
	8rPutjMGlw03+hVIz2Q9oZ2DCXmsTxlQ8W/bADXWQ35PJfY7AbtTf8NafXgshO9IWNwJJ6ApBWiAG
	d7A7mhpRdeQm0MwRCzNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPaec-0006Q8-0Z; Fri, 17 Apr 2020 23:44:14 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPaeZ-0006PD-0n
 for linux-snps-arc@lists.infradead.org; Fri, 17 Apr 2020 23:44:12 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B238F40387;
 Fri, 17 Apr 2020 23:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587167050; bh=DnUiVpfGLFlFQ3tMufgzqNcpT9XPkxIzFDfRGiWCy7M=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=eEApoT7kcPSpMrjt08TRMHpscU01J6PG6QEQ7RUQLlTFLT6sS7mV/cK2drU3FJvOE
 mmJPtOICDG+FsdvV84qJFbqRL7laQNzJgGF0PJ6mxD24dgWfNcqfAaLsiz5iv6SVhr
 i8xPBrqgdxIYzPzvU4PS/aZ7e3RPbPHaYpMYVjSpLItLGuusdn85FrnmEOZSfG9BPN
 ygjE/y1036pwayn3wlxQvlGQsH6f3U3xvqXFntbMacWgvnj9OqEnHS3VEZck/9bQ21
 swG2FwWGoRhS/8MrdXkXBIGd4LNk9FVzeVJmuBnsLwHYweaPCjtkUx3BcYg209d7yO
 beu5sXNx0bIDA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4DACFA00AC;
 Fri, 17 Apr 2020 23:44:02 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 17 Apr 2020 16:43:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 17 Apr 2020 16:43:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJUL5w8QdAfdS4+3aXB6LbkQNuq9m4GQgmlfo4MnCkx1D5HuQfuEI0BOL3xIa4cUIseWO+gtFtQPRYZhnVVs9aB6zLE5uKTebLsjFc3cZtVwvT9YQbSqhm/ey+IP+BJpsR252UfmTV90aNZRQqNNNmtj/GJoY8USGtWxlb2ymJghwRf5IyggxXoGC1M2OFSR5FqHXI75KA620gPlrFHchjtpA090RKesYmETmHoACMmQhFpMYdFebrkrfTc/WLk5Ec6CKU9nqmQmsVxmmJ2BOfbIGXxgoYYTFeoJzt22cY+VBs2o7iVtPhBcgmdAQ4zvRnuJWK7J/I79/d/YKN9xZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnUiVpfGLFlFQ3tMufgzqNcpT9XPkxIzFDfRGiWCy7M=;
 b=GbJGi+tSN1A3Rf4a81hhzRCL7A3dPsjJ2OVw7npv/jymNd4uZWnW+2Uc1Cw2KYvFYLPYeeFwyZoMCKl2DO/wvQ2q/CMkgjdmJvHFtDe6cJk7W3r3OcEnVY3VslkjakkkRVPJBjcd8cgS/F5KZUufZsxUCWbyzbckslNBAeY54reip4k5hf+FkZXJCl6buiwjzJEYd7HY1tznps38WoHrJp58QdMV+75Gu/iPrVpctwBEpg7gCt1Xs9Pd3r6u0s2AR7BjbrlrJ5YngdwdoOQMSYaqYYwSVjXGSPs6NkEU+t75I3TQ1a0YApsJ9eQf951g209rAa0SXfU3uMRrNh82uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnUiVpfGLFlFQ3tMufgzqNcpT9XPkxIzFDfRGiWCy7M=;
 b=HeIfg9kesVyBrPJdvGjOKJ6CIoGSIuEGhobjg8hj+hqvXXis4sU445kzOovlPoaIQiMjLIqWeMa4T0F/iE9M+7GVUSfJ1t6cKZkAV083aeERm37RoQkBPhQjDEa0uRLlTra5Rb3TdQBcDlYNjnfntx/J/MlX9/9pUIk37t0DAFk=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2648.namprd12.prod.outlook.com (2603:10b6:a03:69::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.25; Fri, 17 Apr
 2020 23:43:41 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 23:43:41 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v5 03/14] ARC: Thread Local Storage support
Thread-Topic: [PATCH v5 03/14] ARC: Thread Local Storage support
Thread-Index: AQHWDhqQ/JoLX7IZOUCTRA3TEA3uyah99yoAgAAQrYA=
Date: Fri, 17 Apr 2020 23:43:41 +0000
Message-ID: <f5ddc30f-0970-6d47-6f29-e51a6f57423a@synopsys.com>
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-4-vgupta@synopsys.com>
 <alpine.DEB.2.21.2004172242490.1082@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2004172242490.1082@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:c8eb:6ba1:57d7:7e16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5581a555-6151-494a-ec48-08d7e3292901
x-ms-traffictypediagnostic: BYAPR12MB2648:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB26485C7617BC442F7D3E654EB6D90@BYAPR12MB2648.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(396003)(366004)(136003)(376002)(346002)(110136005)(186003)(2906002)(4744005)(2616005)(31686004)(71200400001)(8676002)(53546011)(86362001)(36756003)(31696002)(5660300002)(54906003)(6512007)(66946007)(8936002)(76116006)(316002)(66556008)(66446008)(64756008)(6486002)(81156014)(478600001)(4326008)(6506007)(66476007);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ko0+Fs8nQPM7QSbu3pyQQCP6dbqB8438ToKWyVzv7mYprkThW2dXyxMq6Dtamoo19+X01t52OiLATb5J593770P3ig+uOR+A4O49oE/DBjXhHtNw2nCNUYtCm9JHNkq8IYtcD+MNzUL8AoGOz/mw2YYzoJMwvlcqmdJU0OyVkkUO2leSb+G5GUUxnxOzKZ4j1TAn7qgqQVeQ5QfLYHTLmE9nVLYRj975fOm2uXkdtXJJSzG9RQiepZbuxcgUaAt99NHvibS25Cy3grGGVQ7TKG9+b2Dp3p1jvRiUgqkeeyyegNNxRSWtoCHNHRfMb/zAODaChppGxHi95Ryv82HK9shiYs8zRzbqsluiUxNZceXLV85CUSfDjrX9BuYXw7BRO/j2a7mX8hrpipRn7hgqenY/DKe8c3XI6W7brX/mK/e4+A/WUmBwxjpDA18GD66o
x-ms-exchange-antispam-messagedata: 3Fcf35vRvgfTSFCUo1ZzmftJYh/cor7IPiPLz+VocEjhJxZPy/2r/w+EE9x/jQp3ZW6Q0OIR4ibVIfojFgfX+gwHZvatBjAr3JpwGgElozERQSQihBzTSlMmbNgGbGqR+xqs9QrBQ495OyhF46W9xiMQdL4qZNZzXRiWRUjuWKGflaTtsgNr4LeLJExO/Da9sluqwICrTfEQmaMFede81Q==
Content-ID: <04240D20C442F64EB579CD29A981B56D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5581a555-6151-494a-ec48-08d7e3292901
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 23:43:41.6521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wWr2yBKoFT8yrn0XybaQO8F6cnBHprO5S1h0fyPnCXO2Z432D94+eVtxpxfCXIsQCmPWxz2l3UYd36kV7QmrGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2648
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_164411_069467_4CFE93A8 
X-CRM114-Status: UNSURE (   9.46  )
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
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 4/17/20 3:44 PM, Joseph Myers wrote:
> On Wed, 8 Apr 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> +/* Code to initially initialize the thread pointer.  */
>> +# define TLS_INIT_TP(tcbp)					\
>> +  ({                                            		\
>> +	long result_var;					\
>> +	__builtin_set_thread_pointer(tcbp);     		\
> 
> Missing space before '(' in call to __builtin_set_thread_pointer.

Fixed.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
