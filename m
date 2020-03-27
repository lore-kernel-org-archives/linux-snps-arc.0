Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47BEC43331
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 00:38:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 668A82074D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 00:38:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qxg4nsA9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YvwEIOIS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="H8E/qnFf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 668A82074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4klONnMTu+9A5atu8kh+RE2QFZvNiSUTNjkUy1ZDic=; b=Qxg4nsA9NxRML7
	FogSpwEQpHDV7GhXWyUa08mZEPFNXwOTeYn/9tSapE6mWDwZfOl4+ShRmayn2pnJWiP/NzCHUavOh
	BK6RLuNblpkQM00s/cY4HLdWOf2jM36n1rHvCxqSITSoTKs6cMPGsZYvUUIxW0liMZV56rPSTid11
	lgGTaH5wVFiHOUiqIHG8IQboze9oOBkTnGjIEVFukl92msGQEfcXZZePKaouKEubjlvYGI5hchFNc
	au9ySyOuHpHD0Yf3fROqdkLXcbKEV63sJALqE8NBrPevUQvSw52bwgE5qJu5wjYuBAF357vZrr6Ls
	QxxqPrdBG3vQgflws+rA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHd0b-0002QC-Ft; Fri, 27 Mar 2020 00:38:01 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHd0Y-0002Pd-7w
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 00:37:59 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0CEAE4080A;
 Fri, 27 Mar 2020 00:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585269476; bh=bEpUxKSQdNwGQ3SwDbK2ynfvi98I/ki7BevzHbac5uA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=YvwEIOISCitpq6K6vfO+0ComUtr6Zsj2lzQqy16n0rH7cbg59FTi7a6wp5jk6fsVY
 CBcEyF5yvZnSAMpyQFzULT+d2mXoEkpSi/nZMyNDSx9jPS6DdfzXzi2ZBu3zIDtMTg
 jEKAs75FKje+r5nno9GAH8V0+EPYSivgHDf7+RgZdpX69toTUtACZuyYeVkxqFe0Ca
 nCjZDPljTlMyj2iEiUxHCUgcKs3L3jqlhdYYIsHLTZ+c8mWqfoNG6g8JQacQJo9ixm
 D0uA2Gv4C/vW2fOxOIDsE4nu/9jwl2Uc0Em+nX/nzC4jcEP0I3KE/7q/ky2kl3UOyp
 skzg/8XcXP3Bg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A0737A006C;
 Fri, 27 Mar 2020 00:37:54 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 26 Mar 2020 17:37:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 26 Mar 2020 17:37:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LA83eBI/yRK+yyPa31lSZILanRUXbXglUXPYkMU+eOSzos0PsWbBBQFlMVN4iMPX88BXRuzKJILKTxE/Y2b+hVyYWn/wdTKR3OjwgHpQHmilDS9jhYWXhVY1FYR4aSSehP+xbmXeGUw4KItkEUYl4ERSNQLqihS4mStlzvUWV/fx8RjLB5jSpqskQ3wonT0OSvIekn+9cMTeu0VkZPwuMfvJqIuBZyHqK0ff98ZPiVN5i5AaNiPwiR8pwHts6Jk1pDrvM/eFBvRBwZcUSOpPGiE2JHIHUvV3D/jZO/lktCc/2HTWYGmhV1zBkxYH3iuwSt+s9ac/0C2d8HZ5OHPM3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEpUxKSQdNwGQ3SwDbK2ynfvi98I/ki7BevzHbac5uA=;
 b=WOZY3RujwhNt8Bwfp37yRqRqJhLRbleMM2j268Gn40BZFr/VSeVx0QaXXmPd8YZJfd2Q7abbAjYRvexiWF8oI+I95ejhyr3n0uV8jAiCGDnZpcc1tnUq2u6A9zUxU+pglflLIoOQY8BMLlMIdn2SCGwTYrXGTtCePHNegY+qNZpFM1QDvHd2FtXTd3REPb5vosHfyl7n22U1AFShpX3A5thEfy8d1OhGPKuCecuEgIDkMFEQxwL0YZDjdVcVmLgtgMCyIn37vAsQeRY15z75Oagr8eMbSWXZIsHEI1Vwlnthls1NQLi4Ed/geiRXSE4TSRorXYqO+LNwDEThn5ocyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEpUxKSQdNwGQ3SwDbK2ynfvi98I/ki7BevzHbac5uA=;
 b=H8E/qnFf0Z1DHAlxhfiym6J8rutcoCihZ8Kc/E9MZyzdCtLA8XrsGI8go3D4LYJ6oTU7EdL4cDKERG05Ew6/ChTOP9M7Lb4ZrBlxgmIDyQymoBCWJaAVNcY8E3Rz46Oq9l5K47vGx4LkDDnjJ4rPwaxAxgfXHmOVeC+35KPonUY=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2744.namprd12.prod.outlook.com (2603:10b6:a03:69::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Fri, 27 Mar
 2020 00:37:39 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 00:37:39 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v4 02/15] ARC: ABI Implementation
Thread-Topic: [PATCH v4 02/15] ARC: ABI Implementation
Thread-Index: AQHWAxFm54JlFNEhBkKvfA/7WM98LKhaKYeAgAEOuwCAAGFsgA==
Date: Fri, 27 Mar 2020 00:37:39 +0000
Message-ID: <bf2ffe60-290d-4849-dd77-dbe22e4d3e05@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-3-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003260138130.31593@digraph.polyomino.org.uk>
 <7a3df848-1ef6-9e54-3b5a-9cdfcaf436a7@gmail.com>
 <alpine.DEB.2.21.2003261843120.24611@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003261843120.24611@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [24.7.46.224]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31aefdf2-8f85-429f-289a-08d7d1e70dbf
x-ms-traffictypediagnostic: BYAPR12MB2744:
x-microsoft-antispam-prvs: <BYAPR12MB2744C8AC24359C168B0F93BEB6CC0@BYAPR12MB2744.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(136003)(396003)(39860400002)(376002)(2906002)(86362001)(186003)(6512007)(31696002)(36756003)(8936002)(53546011)(64756008)(8676002)(66446008)(6506007)(76116006)(66476007)(66946007)(26005)(66556008)(478600001)(71200400001)(4326008)(81156014)(81166006)(316002)(31686004)(54906003)(6486002)(2616005)(5660300002)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2744;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J49wBMXA4GDxovJefHllAEHho6+V8CoDjfnOLzE1JB6kzNNLyp/c3vs3ZlQ/avUrSmvNGsYgYXoOXiRJZ6WyByrdY5PqB0RXUO5lxCxzpsyI5wgx23ow1oa4rymEBb6U6+DHaqiZgCDL06LTiYGXRn6odDoOR0Ih/4B1uRVfkkg70OYDf4RIxsR7JmLSeRkzxknRzgKmiOVrBqohpPbRoprfZGxnKTBYh8S5Q1ItPfRWHvTFbFWZLBrx7x1T7sIdUXIbaAqd+LNuEvaQkjsMT4GaK0CnQwjNBIq5p2VMXipX1RtAoXRI08AJ9JD0wwVJuoYAPQgATtjJkL+/lgyq9PG2Ab3JmxgHm6uNgSzziadFkrWXzZrCGeia07XHILUW8rpcr2inYY+4qbkOUxpFBjY3rQpu7c16zLJnS6Lx+w8NNzAmjVEF+8W15sWpmt3i
x-ms-exchange-antispam-messagedata: FHuxkZrK51cSrbb8wP42C+iSLRrNM8e/VHGmt3sLAcg++xt/Khu7yan2JJUNL92nJHgLHMZKLFeDv4VzDM5fvbzU9f8KS6SDItnrSc1YPOKaOg32fgJhP1I4BvRjp1syx0JOCVNQWrqOz4zxacCBYg==
x-ms-exchange-transport-forked: True
Content-ID: <23AFE3F065E0F14190EB3E2463016C04@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 31aefdf2-8f85-429f-289a-08d7d1e70dbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 00:37:39.3247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DwjTULH9emG8BTM9ZimNaOHH9d4Eh5QsWxuwxXUWX4Z+EAQwH6c/SJQL7ybxW27mc7pOh7uRNGnbN8uNuWs6kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2744
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_173758_351850_F877601B 
X-CRM114-Status: GOOD (  13.88  )
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

On 3/26/20 11:48 AM, Joseph Myers wrote:
> On Wed, 25 Mar 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> Hardware-wise, ARC can be configured to be LE or BE and software supports that
>> (cfr Linux or uClibc). The initial glibc port was only aiming LE but we ended up
>> with BE as well due to a customer engagement. And given much of ARC port is
>> currently generic (minimal asm), no real change was needed except enabling it in
>> this header. We do plan to officially support it so I guess we need some more
>> changes in Documentation / ABI listing etc.
> 
> Yes, if you want to support BE then it should be documented as supported, 
> it should have its own dynamic linker name (with consequent GCC change 
> required to use that name) and it should have its own build in 
> build-many-glibcs.py.

OK.

>> Right, we've had 2 ARC ISA: current generation ARCv2 (basis for HS3x and HS4x
>> processors) and the older ARCompact (ARC700 cores which run Linux and still
>> supported e.g. in Mellanox NPS cores). From instruction set pov they are very
>> similar (although not binary compatible).
> 
> If they're not binary compatible (so you can't have a binary that works on 
> both) that indicates they should also be considered separate ABIs (so you 
> have four dynamic linker names, each with corresponding build in 
> build-many-glibcs.py, plus any other variants that are relevant to build 
> in build-many-glibcs.py without being different ABIs, such as hard/soft 
> float).

OK.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
