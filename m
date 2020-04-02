Return-Path: <SRS0=zcuS=5S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1F1C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Apr 2020 20:23:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3CFF20678
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Apr 2020 20:23:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I8pB84QK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Yuz9KbBl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CNpDhyhH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3CFF20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NrSIYMxr8xqRU7fjs0iE3Ika/F3RhVp6r50SCIbZtvo=; b=I8pB84QK4fpFjp
	BfTIaP59b2lICz88go/4CQmZe3I18hRqWr3AjkpX89lHtpyDhL04aWYadQpZAnVbC3qEwcuppThKN
	O4MwOL7iMMO4r5SltJx/5fNDFMkukiLtrtyqladfBuOh4tM8wX+kkA7+YfACJsvfe+/OZSCxXuVxb
	O6aptJtyi1UN4I7VLw0scLLDZ0XDgRjNUvy/50IDCpxWAUXqufXVtUNEs8rboGapRDxdVYUggiYwD
	FPKKadI4pNvlWJS0na//XL8/sps9b5x8xyftc1KiMod4pURFDn6dCK6kQtGJLWlAqgwiKFdfalamn
	LUzhvkP0I/EnXWHVA7Fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK6Md-0001LN-JW; Thu, 02 Apr 2020 20:22:59 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK6Ma-0001Kk-Ch
 for linux-snps-arc@lists.infradead.org; Thu, 02 Apr 2020 20:22:57 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 14A5943BAD;
 Thu,  2 Apr 2020 20:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585858974; bh=VryCSnciipIUv2b0CyG6ruwvexAHegbqb91DHoO/7s4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Yuz9KbBlLAH0DLvVvQweL/X2q3U78JgEpjQfMqG0+Kb3BzefUm3z/4dQ7+OyxoSBh
 QF0HK8D099IPPPJr+OVCVfNPWKoEJgvE6OrQBqNMJL9EdnnNzLBJ4T11i152z6WAqc
 eqNEENI9DclKPdjIOsiulRswjTBo+JCCRG+O0kUuSbFHCR1+vXs52N/AMaNoOLmvtY
 PMklQK/YSDvaxb0iEDwOVNUyN/AXs3y2zyQNxlDI1Kq0A2OYCOu3aQy4fbLmt/IVZh
 LSiZgqUtsJmITidQfCd3cPNxeQV3RVZ25DueL/on9GMCSmk1eJiajNvub2ktpV9tdD
 I9nfkPSX5J02Q==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3DCA6A0085;
 Thu,  2 Apr 2020 20:22:53 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 2 Apr 2020 13:22:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 2 Apr 2020 13:22:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkwyEvTyjzdtPkFNo4+sdppE804r1Qim9Db+gz4jJys7uBneeRZA6XGBDycF2Dmr7DzmG4WwzXzf7Z9wfbs7xHVdMyZQFjX51MU2ZcKHsO5rOqJGXip12GMuoTo3CFAR1tCGoJRRY5wbMav8BZVPMzViZ9rTHeOjfNSbgBsbnwe+3S/z9ZzzT2uancf2S0jj8hhAA4sCQGJ6pcNnxyQV07xGw2rORkOJ8oFx7tRnO9cdobAd8q/Tz/vVSGXYVuuzkhAT1ruC/ERETjFt7+aj4BMzHVuCttfzyngmjeY1Im2uWaph+ytIbK1d/a03NFz/FrWdQCdN0gZsH69pYcC6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VryCSnciipIUv2b0CyG6ruwvexAHegbqb91DHoO/7s4=;
 b=VcboFxZcCZhJcwIDiF3YrVcXrDv+U61r2oMYzNiPe98Ho086nBm9IWL2juzyDwQNfmZpLTgHC0/eFCQmoqmm4jOXny8tW0t+7BO7PUb5hsjwIqmsxn/AAEB0J6g8c33fSMvv+R3HIZuJ/PAHbXBTxfytPsrHR2csSxVPI67CHTLodHro30kr7OrKJl4FOkgLAnBMykVDkjtv+JqMFQVXpAlVKWP7J7XqhiXtkqOGXx7uH+k3e6P3DPoizVRj9ruiBwzR9pTZ4V+MCR/6QGqBASxyORJYMRQlYkRXs9QPaLy3QFNQhIYugV1t5q3hXHCxY5gEGdKlQGKPG5qmkr8U1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VryCSnciipIUv2b0CyG6ruwvexAHegbqb91DHoO/7s4=;
 b=CNpDhyhH/mYccxHsYohHO2LGR2fqUhsHed97YfaP+WtM8hD/7hoLCoVonmOrKImDdXoXIXkjPSlapFu/ep9HWzLT1vT5l1+PzMJ/HmLjPIhny25Oklg6e9D7FmoIkfaD57dXZtdkPPJhbIFh9Q0OlUK1Fi11dhg9SUvJvQoIuUw=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2727.namprd12.prod.outlook.com (2603:10b6:a03:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Thu, 2 Apr
 2020 20:22:48 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Thu, 2 Apr 2020
 20:22:48 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fweimer@redhat.com>, Joseph Myers <joseph@codesourcery.com>
Subject: Re: __syscall_error (was Re: [PATCH v4 13/15] ARC: Build
 Infrastructure)
Thread-Topic: __syscall_error (was Re: [PATCH v4 13/15] ARC: Build
 Infrastructure)
Thread-Index: AQHWB76r442emsqWgUWhjf9688nTzahkgDgAgAEIBTCAAME5AA==
Date: Thu, 2 Apr 2020 20:22:48 +0000
Message-ID: <e658d929-db30-163f-3fa5-9611b7316427@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-14-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003272238480.5132@digraph.polyomino.org.uk>
 <86b7b480-da30-3eb4-3e1d-1d8785604770@synopsys.com>
 <57eeeac6-75d2-05c9-f1fe-bb642329ca77@synopsys.com>
 <alpine.DEB.2.21.2003312246280.30236@digraph.polyomino.org.uk>
 <3b5edadd-b29d-f138-c440-ed6d38da6a67@synopsys.com>
 <alpine.DEB.2.21.2004011703160.3007@digraph.polyomino.org.uk>
 <87zhbufezy.fsf@oldenburg2.str.redhat.com>
In-Reply-To: <87zhbufezy.fsf@oldenburg2.str.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:2878:237:6628:fcbe]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7ca06cf-6cdd-4ac3-5cbd-08d7d7439c98
x-ms-traffictypediagnostic: BYAPR12MB2727:
x-microsoft-antispam-prvs: <BYAPR12MB27271F0DEB89703902387013B6C60@BYAPR12MB2727.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(136003)(366004)(376002)(346002)(39860400002)(31696002)(81166006)(36756003)(2906002)(4326008)(66946007)(316002)(110136005)(31686004)(6486002)(66556008)(54906003)(64756008)(6506007)(76116006)(66476007)(66446008)(6512007)(5660300002)(53546011)(478600001)(4744005)(186003)(8676002)(86362001)(8936002)(71200400001)(2616005)(81156014);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iIq5ZhtIt9TD69PE9bL8lMbxLdP/KOck/b9YeX502uN/1I6/wYgmN7Y0wdSKhRI0g37vVcVbR7wAQqf0c4Z5lftucpFriFwmOEivh7upPGQA0YY15fvV//DXz7wZpo+BF/1e41SJ1LelyKyZCiQxmV/hsq4o/dxHN1ajE0UB4tFLvHz9a9EZG7dzkZuhbSURLKykzA/gU7NJVnc8oNkRjBe8JFAES1msNv5klR1P6iVbJBSZcoNH/TGF0BNYQIg6URi7OlsOfcZAxYxKee/pbO561IvMAX5LeFPEFElRn1qWG+aaclcwmDm4SxfYoxm2vjjMzlKaeqj3PI0zdTMZJwxurgYEeLyk9QtoUeHUXFcEMQIEQwhcuXORMwqnPqTFooNhBiRgowZ8tT/JNx0B6yofyiyMWAwz4wWSQ8bnQDrLIEFGjLXWr0PKxhC3TgRM
x-ms-exchange-antispam-messagedata: sgUuZCU7egsOp2jGT+L97cdwDlLaElLiYz9aykh0faFhiVaByHiFjZSrCTXKy0Ks8nOvE2P02P7pfba73+6X7sck8wgAq903DlAXkC+BN7phyCsqLByvD4d4SwHvvMJdQi9dULAp6Ol7rYcxKWihFeB27uxXPBpaWf5f9e4jnNktiGT0sPU2nMJz+KypaTQFDYqwLQl7MtbYzxKY8ynMng==
x-ms-exchange-transport-forked: True
Content-ID: <B906078D94ABD5488DE6FB38FC4E1DEF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ca06cf-6cdd-4ac3-5cbd-08d7d7439c98
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 20:22:48.5956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I1NxJlO2igy5QB9FTiFUNpxHNYMOYvSvq8YFTlgDKKfSlqISLo3D1QEdzy52PzQdPMOZsqLPxpTYJ/FOzmPaxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2727
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_132256_510468_6503773E 
X-CRM114-Status: GOOD (  11.30  )
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

On 4/2/20 1:50 AM, Florian Weimer via Libc-alpha wrote:
>> What if you move it to GLIBC_PRIVATE?  My concern isn't that it's exported 
>> from the shared library, it's that it's exported at a public version.
>
> I think it's preferable to duplicate __syscall_error in each shared
> object that needs it.  It avoids potential strange loops if the lazy
> binding code itself ends up calling __syscall_error in an different
> object (e.g., from the DSO that implements malloc).
> 
> Maybe we can make this work as long as libc.so uses an internal call,
> but it looks tricky.
> 
> Alternatively, we can enable BIND_NOW unconditionally.

This seems too big of a trade-off for a seeming small optimization. If you folks
feel strongly, I can drop all of this __syscall_error dance. Just let me know what
approach to take.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
