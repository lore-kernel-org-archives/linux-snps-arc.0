Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF833C2D0E8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 19:09:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE4962074A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 19:09:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xg9E9PO/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CGUgos9J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SkgAcCA4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE4962074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tIGgghzoqOv4BKjqAWkP+E8pmBmrIsWXp2FQOSQ2SAQ=; b=Xg9E9PO/w6nEhE
	/T7f3mHbPD0mAEa1BX+E6K0h7ZGHxXUzhOpJsnRf8g5qKvpNhAltGYgGROXExSEpQM6lV769B8wdo
	30999uhxy/4itLLIjU7bOdbeKyrsxpgqpB4fZo7ykhNk8V/9ce9Ksx6kl+UWmsDsYsqlnOp23ILg+
	vs2eFIgAEjremNI1kipi4UAMFUa6eRFjuf8hL3m6QVbK4WIsOoc7PkkyL2HIWvdr1XRGEnYJjzXH4
	AeWoByhPgbn/yJa3h7Y7PUvl+9DjVh2I/GG/C3ZCMI/I1tOYNhQPb4bsyJ3eABgntbvnViO+aDisT
	y9AkYOhR7iaB4ttEbdNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHuMV-00048e-0P; Fri, 27 Mar 2020 19:09:47 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHuMR-00048C-K6
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 19:09:45 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F3327C0FAA;
 Fri, 27 Mar 2020 19:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585336183; bh=J1aJpcfVEXc7XkMMCgFg5k6iJfMqr4jIwIUWSb6oViQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=CGUgos9Jlh9j2pPUGb47ByuLZsGearutuMoRmZmpaD3EpEIKNw6+bzstUdfQ33Y0t
 z2LN1d1+1PiBzWnDg4DnrGJL7loi4wfsnaAZxus6NxYUT6BNwHMPQzO7hBOCzS4ihn
 V4pHzxIZXAxRlESyN3JTASLBrDqAZucFuKt5Ns/u+dF2h6pbnNWUPVbKBZnESrBed+
 IEC41THBPnzw2wW+LOsm2MKwVSm4Mc/aTbumUBDxe8sY7mmKEdWBcUAj/HkUZGal/C
 sjxmutdBhA9EP8iiLSZyJjkB+dEFmviylXhsyb1e2+wuP8kAOFX8IYL5AYIcu4aouT
 rBDz/PIdn0afg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id ADEB8A006C;
 Fri, 27 Mar 2020 19:09:42 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 27 Mar 2020 12:09:32 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 27 Mar 2020 12:09:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mk3kk6JNXNmIKEq1giDF325zpFlO0pj6mKHIkHJXzkOu0iyhojFma36hRu2iog+kBkSjqNACMCBv4K5ZpWbUhBAA+iZe4Q4kO52i84ERNz37119RrIBiyjOeCjmUe+zwY2PMcr+JagazADzQaDDdU8zEQIt8psXOk4+UZAKXZUAFB3lUT4QZUuD6uVg1LjaqvbMep4GI1T+QPFVzya3X5jLMGXUUkHsihdGYG1SJQVm1uP/7RHdgMfly2sOw8kn+pz8WAyo7c3yeB9TODQQmsp+sxMa2MGTTDqlDSkSCIq8QzLJWpRHpxHJt9mWUcw90pazr5OvkqXhzxF8bSHsExA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1aJpcfVEXc7XkMMCgFg5k6iJfMqr4jIwIUWSb6oViQ=;
 b=hqR20BcGL/LIEXZcXBj+KsUM4Wyx4dc5NUAozhOwCxKfhdK1XZjrN85ycArqSUr3TGpOu3ik4u3OB1J146exEsIUF8ZaXIPD3BDk0HxsTifVIH8E7KEhx9qc8IuurJIgk5Q1KTse0SuOP5q9wJ4PlxN57HsGSg2MnrKk0BNbzeaTQXd6yGMANxk1XbMfZf70PAsVcg/rvJ51nhAP5F2/7x6t5T20f48H9C5jZxaRjZXxbl0flClexEIuXwMPmuWRhdmc/a64pTqHjG2lteh+P2ufi1drOY0lTR1KeUlJ1L3yuICEgDO7uff9scRwqqt1Z75eemwt86t0plqxOKCflw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1aJpcfVEXc7XkMMCgFg5k6iJfMqr4jIwIUWSb6oViQ=;
 b=SkgAcCA4XJhUjOIK8nKdePoVZodPEKDMTBnSc4Q9JhSr87UPt2zNBV803TGPN/gjK7iKe8tSC/CfEaJmbDA+agSf8w2d4ARyx6oVB47CIGD1MUDzQ/0sC0QeccRObT0ez/P0PMSqIUASFwI86cWGeQYme7om16/Vn9OQufOdVUQ=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3397.namprd12.prod.outlook.com (2603:10b6:a03:db::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15; Fri, 27 Mar
 2020 19:09:30 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 19:09:30 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v4 11/15] ARC: ABI lists
Thread-Topic: [PATCH v4 11/15] ARC: ABI lists
Thread-Index: AQHWA9BhwxgpKZ9Hp0urfPs3EKbVXKhb2tYAgADrnYCAAAhmgA==
Date: Fri, 27 Mar 2020 19:09:30 +0000
Message-ID: <66e9d7d0-6312-d413-ce5b-8a45cf784f16@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-12-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003270039380.24611@digraph.polyomino.org.uk>
 <96e4c23d-d81c-6622-b7f1-6fe8e9bb06ed@synopsys.com>
 <alpine.DEB.2.21.2003271839050.5132@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003271839050.5132@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: 4e10a456-c57f-4858-bcac-08d7d28260d2
x-ms-traffictypediagnostic: BYAPR12MB3397:
x-microsoft-antispam-prvs: <BYAPR12MB3397C928B54737CE41ED41A6B6CC0@BYAPR12MB3397.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:277;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(346002)(136003)(366004)(39850400004)(5660300002)(31696002)(6486002)(316002)(54906003)(71200400001)(4326008)(2616005)(66446008)(478600001)(53546011)(6512007)(86362001)(76116006)(36756003)(6916009)(2906002)(8676002)(66556008)(81166006)(6506007)(26005)(8936002)(186003)(66476007)(81156014)(64756008)(66946007)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3397;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dumaPQMFbOuA8tDGyQmuWfC3IawJqpph5w2iars5tGcdNbZfn/tuE1yxAraflvn+XtFToYN37ZMGy6xAxX2yqlx9IDdpJ11Pi6yv1UeOlpJGcRbvkgmS9VdIp9blqKZ1VA9M6io/CH9hzD3LPUm8O9hir5ncUd/RQWo3F1K65sFCFZFxeDLvzzkIJgyiRhlicjuxMm4W5wm6QMghBwcIBHZUH+6uytHwp8Y5cLM4XsxRcAnwoRAAylyj8CzTzsG1g9p+O87Mge27xKLPJSe5FRgm+Z1QFR2vfXHY6aSDIuXRfjQtfSrJzmuTRoYCnHo2ZPpNf/x7vQYysgGUmqId56Y/A4lZalCo5jDRtmtdznHJTzMa1atIDuh+l7xLM/ezaJcOLBxj5Sd6X0PFwuANXRrJXB5cWAzondVfx0NeLboD20F0bPb5E9OQlrtUuIHM
x-ms-exchange-antispam-messagedata: vKz28h2MwD9P3bodJ35ZddQBTab7BtZEPlxp41DLM2/8MyezOgoa5hJY5RyvcYi3zw2W+xADZ6A6WDrXIUWj/PF8Kwp9+Q81W3Vyd1gF3Ax4xLmh4oRg4DibycwElr13VIMV0kXCCVoiOpXRmbQsHg==
x-ms-exchange-transport-forked: True
Content-ID: <B74553067511024B8382C265F130F32C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e10a456-c57f-4858-bcac-08d7d28260d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 19:09:30.7350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O3ziWae/z52jhLMIq77Y4eSE8JleuT9pmOqKNj/3RYZir+338gDEtnXjlsfGd+6kPxva+1dv61Lx+FW08R1wIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3397
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_120943_727948_78C2164D 
X-CRM114-Status: UNSURE (   9.86  )
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

On 3/27/20 11:39 AM, Joseph Myers wrote:
> On Fri, 27 Mar 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> Done now. FWIW regen-ulps simply barfs so these need to be hand edited.
> What exactly is the regen-ulps problem?  It ought to be working for all 
> ports.


PASS: glibcs-arc-linux-gnu check-compilers
PASS: glibcs-arc-linux-gnu rm
PASS: glibcs-arc-linux-gnu mkdir
PASS: glibcs-arc-linux-gnu configure
PASS: glibcs-arc-linux-gnu build
FAIL: glibcs-arc-linux-gnu install


pwd=`pwd`; \
python3 -B ../math/gen-libm-test.py -s $pwd/.. -m
~/upstream/build/glibcs/arc-linux-gnu/glibc/manual/libm-err-tmp
Traceback (most recent call last):
  File "../math/gen-libm-test.py", line 686, in <module>
    main()
  File "../math/gen-libm-test.py", line 674, in main
    all_ulps = read_all_ulps(args.srcdir)
  File "../math/gen-libm-test.py", line 262, in read_all_ulps
    all_ulps[name].read(os.path.join(dirpath, 'libm-test-ulps'))
  File "../math/gen-libm-test.py", line 166, in read
    raise ValueError('bad ulps line: %s' % line)
ValueError: bad ulps line: idouble: 1
make[3]: *** [Makefile:105:
~/upstream/build/glibcs/arc-linux-gnu/glibc/manual/stamp-libm-err] Error 1
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
