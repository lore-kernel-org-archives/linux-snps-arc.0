Return-Path: <SRS0=vrW9=4Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E18AC10DCE
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 01:26:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B34C2067C
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 01:26:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U0RvBGOe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DCC0i89R";
	dkim=temperror (0-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="QWi8jgOU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B34C2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=py4fdUyn3XR8Nu010ebAoAOc8FDxKyVPSInngrqU5eQ=; b=U0RvBGOe42Nk1w
	VM0txJiKz4odOcSFy4Krq8xwEVRYCeTHvCMz44w45o17+ioSIpzoAD9gsqj+5d/YJNAqqyA/OCTET
	svb+GXNLhvJnVh5XyJygLzAvw1sBX+cyctLChb0l5CSZb0B8JMWaNU00niWdUKfX7/K0/QAX/ESYJ
	glj6VYH793Opr1+OoVP8Sq5FidDb0m75Ng5ip8/ZnueNaMu+wGxUsX8FNcVWctE8bHTUgcMK6D7oK
	cxRUbNlU2w+tTYSly1A9OsI4jebBKGWeo5X/DWa/7D7Adcb0+QVjirJdmL5fYgcVuFrMYNa0PKzLK
	k+l24nSohI3Jd56ZUTjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAOEh-0006wN-4g; Sat, 07 Mar 2020 01:26:39 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAOEe-0006vn-2v
 for linux-snps-arc@lists.infradead.org; Sat, 07 Mar 2020 01:26:38 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9CE4FC00B0;
 Sat,  7 Mar 2020 01:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583544394; bh=OjVy9VzMEOJPkU9hIMUE1oWGihyNSJiFYwEYdA27A24=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=DCC0i89RD5XJG/IMZKHhI911tx/gLGYkQcPN18UkS5NoUgY2ChLSjUnkchfrKP37H
 QoQXoBre10ywC5mKoQmE4BrikS8XwnGhXJjkCPAwerjLU3tDnuTljPSeernN/XYYeJ
 DEp/RUCwWrJkV5cnW87tdVoaBSZKUCwlfxDQ9SS/FvYSpAa604bOqRhR94nyFZuDIc
 bwgqymRUPlS4HQYSUnCiu2HRkzs5EC7erkVPqEO3vE1GHoFLWnrRJR+RGKb2+k0qpj
 Kgnmk1xx65HJ45HKv/5/l1RQlR4wm6qDS4e7jIqLZaoy6NpSj4uFSQrocYcjr8kpcY
 8LDU/UQVL3PXw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A7C10A008A;
 Sat,  7 Mar 2020 01:26:31 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 6 Mar 2020 17:26:24 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 6 Mar 2020 17:26:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkA3/27HkDvcEl0nB9aet+qm6hb4MuMRPXn8F0FvgnTyP858tyZKT4NDsDcX7CJ3Gl3DzB7OrjLZjsdm4qoOf0Rjhmwg0O2+97Q7OnqsOxpQy2tQ/q0PbDvKuerCM2s3qV2tLvbeRB1TriLXlARpF9qvAvo0S8P+wWvykp4eLXqELp4UCZTYGQ68HU7vWGffqWYD1SsRkQQJmYm8lv2/RRHvz8G6PRlArHjG1LVDLqDdTAEKXU8QdS+jpxtUYMfKJ8JYELrpnUeOAv4sRW1quTCbrmeXZXIQtRtV9lT5XYOjjTIpcC+Q8r0oXGk8widHNY6G4GC3kpdEL7RA1hHiMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjVy9VzMEOJPkU9hIMUE1oWGihyNSJiFYwEYdA27A24=;
 b=TbCYTLxglLWkIngam8NCLpVcYtEz22aWECWUA1tG0U7F4nH8vJ7EtgpBLBph8ElIJx6eFJl7Eg1vbbkyUfE9mPQNJTa6G4+qMvvpQOReQbCPSLupE4dzdLeZplKrNvoWOABlUCdie8X+nereNLFvqfzTfP1+Pdu1FIVmYcJFTNM9xjx3jNwFC7HBdfnVh9FaQvGcaf426XrnzoNatC889QF8gWLommhPYsCoCE6tCww36z1WQsn6Icr+m6NkbohwN/dzb7h64EBOShQbiL8X87Rl4CE+jg4CwCAHrpkWHMvZv+3koYXFOdJ6N7XgsF5PqwlF+hSiABE6KUfnVvI1DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjVy9VzMEOJPkU9hIMUE1oWGihyNSJiFYwEYdA27A24=;
 b=QWi8jgOUVqeP4vf7TRxR2mo6rsSgrVx6wALtUQ3SAiLL1e+JG7DYjSYrcEjPSD13Hp2p7dR6BJ9FDq48/OAQjUt3SANiwa9o2vDUGYKWelVdd/MXeJKeOXMsGQJtx4CF5TSUr02a2QITwQ6b/TxYhJbw6W7TPQX33bpaTB9K1Zc=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3096.namprd12.prod.outlook.com (2603:10b6:a03:ad::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Sat, 7 Mar
 2020 01:26:21 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Sat, 7 Mar 2020
 01:26:21 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v3 16/17] NEWS: mention ARC port
Thread-Topic: [PATCH v3 16/17] NEWS: mention ARC port
Thread-Index: AQHV8+SLvTlvWDdLZky6zRYnn4HPmqg8QuCAgAALiwCAAAO8AIAABN6A
Date: Sat, 7 Mar 2020 01:26:21 +0000
Message-ID: <bb8fb713-1adc-38dc-6f0a-1bacacd4f4e1@synopsys.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <20200306182419.13945-17-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003070013170.26274@digraph.polyomino.org.uk>
 <8eb3acaa-3d83-a6f9-cf2c-7355b1a83410@synopsys.com>
 <alpine.DEB.2.21.2003070104380.26274@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003070104380.26274@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: e2a24b6f-68e7-4182-2b98-08d7c2368b6e
x-ms-traffictypediagnostic: BYAPR12MB3096:
x-microsoft-antispam-prvs: <BYAPR12MB3096E3238A072A5B9DDE2D78B6E00@BYAPR12MB3096.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03355EE97E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(39860400002)(376002)(136003)(199004)(189003)(53546011)(6506007)(2616005)(478600001)(66446008)(8936002)(5660300002)(6512007)(64756008)(4326008)(186003)(26005)(6486002)(36756003)(86362001)(316002)(2906002)(54906003)(31686004)(76116006)(6916009)(81166006)(8676002)(81156014)(31696002)(66556008)(66946007)(66476007)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3096;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: obOfWnWpDai+IFfXIVNzBdET5rmiltE9nEPDhAgWRJoHAs++ejIoNvry71Q8jd5v+JMl5lK6vRiZYK6+cTrRkcZETtyo6V/BCj6/WaeTLUHrGq/01VqhDlyK8jnT+m1Q7RNXwpd2Z+QLLd4TO6ltFEHxjYw3Y3YwDFqCIUeZOopb7vtPzCRjTRb7IwvFAfGT1lhsLpbQIZdK7qIz8IcvRiWvxe93RD0So1XBWS3asNv53Dy/vilJ9AHSR8PGXmaHTHQScyxvMQOl+cOdDw1adcdSI5G1JqdUIsSYu8fEYvBV2F/LxhZXfO/m1rdN85nt0mQwmHb6YZqyH6PQMbcvxaTFsxkU5pEu7N5wzu2cIWBKP9jwGde1pz7Sn4YHB9+3+mnOZs5zbMJsaI46npJJ+3HfdmWtOZxLvn2SB3v+B/9nbt/lvlBe/LMDW5WRB/Tt
x-ms-exchange-antispam-messagedata: O+pZ85z1m9O123QYRYiiiYtzSuxRIUq5TcjKfIoPUdpFbJoJHHgXNoLvBvGtrrF+xFrS2uzc6Xe0oomVwc/W5IaNQ8RS+ykx9GagYrEcZX02gbP6zjwlksbxLOmOqm+YBi7yuUUGS1vC0vu0o/xFYw==
x-ms-exchange-transport-forked: True
Content-ID: <5C99F84315A4DD49B63A4F43FCF33328@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a24b6f-68e7-4182-2b98-08d7c2368b6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2020 01:26:21.8160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bom4HtXseGchj/gm7Cg5xokXmxFkgt0WE14S54WeJBj7Hlptz1S5XUe2nHlvXc2YEjJZaNzOAgsLfr0EF8Tbxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3096
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_172636_272501_1C6E7BFB 
X-CRM114-Status: GOOD (  13.83  )
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

On 3/6/20 5:08 PM, Joseph Myers wrote:

> "normal" means "the versions documented in install.texi, node Tools for 
> Compilation, as the minimum for building glibc on most architectures".
> 
> That node should give comprehensive information on what tool versions are 
> needed to build glibc.  If an architecture requires GCC more recent than 
> 6.2, or binutils more recent than 2.25, that needs to be documented there 
> (unless the minimum versions for that architecture are the minimum 
> binutils / GCC versions that supported that architecture at all).

Something along the lines...

-   * GCC 6.2 or newer
+   * GCC 6.2 or newer  (For some architectures specific later versions needed)

-     GCC 6.2 or higher is required.  In general it is recommended to use
-     the newest version of the compiler that is known to work for
+     GCC 6.2 or higher is required. ARC architecture needs gcc 8.2 or later.
+     In general it is recommended to use the newest version of the compiler

....

> 
> An alternative in some cases is increasing the global minimum.  Typically 
> the global minimum is a version from a few years ago; if it's been a year 
> since the minimum major GCC version for building glibc was last updated, 
> it may well be reasonable to propose an architecture-independent increase 
> of that version to the next major GCC release, for example.
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
