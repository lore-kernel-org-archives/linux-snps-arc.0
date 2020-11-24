Return-Path: <SRS0=6yCX=E6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F715C56202
	for <linux-snps-arc@archiver.kernel.org>; Tue, 24 Nov 2020 00:52:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D0F4206D8
	for <linux-snps-arc@archiver.kernel.org>; Tue, 24 Nov 2020 00:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sMCs2Nz3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="N4ykXx6U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Poix/JBx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D0F4206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:To:
	From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EoqsngT/CShqvAwFC9OfKBFVjHOueI7mn6BrKWhrsKM=; b=sMCs2Nz34vFVSnS1C98/yYVZ34
	wjPJx3mtgmFAhTkqDWN9Qag81l7RNdOuVvcILR6gHIoLiMK98tFc13gkDBY5rMVwEimCmNJUhCq89
	FOeqFMo8izAVwvkzW87SEguF6CkbQz7uEiE4HQNQeNjFiaPG4PswfTF8KNUeveR1u2MJzoOi5pLow
	vrsaR7MW1Qbx15HKYpHquL2axhnCIQ633WSOCH7ofhc+cjTP5F6fyMSJfTcCctKJ9TbaY22XGRglu
	9SNFpyZ9YUn63BvbViRLBg/gAFZfgZgAwLPag4BY68j0qtSKhB3hmlsdVuJKK0wi30udnZ+5/jze+
	C0Vpq/Ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khMZR-0004Fr-KO; Tue, 24 Nov 2020 00:52:37 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khMZM-0004Do-6w
 for linux-snps-arc@lists.infradead.org; Tue, 24 Nov 2020 00:52:34 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4B655C0978;
 Tue, 24 Nov 2020 00:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1606179148; bh=Cj/fR8fXnKfYiSuIoKJYkAiCE2dctkS28hle+VBha1A=;
 h=From:To:CC:Subject:Date:From;
 b=N4ykXx6UbYHmF0Xdtwc6PM2rIUb2pN439RhX3wZOYWQKFBgCjWQYFoYu1NQFtiSOo
 msKbGIkHIcXcGFMxcLawpFRhCbASXMMvI7d260HfuUREOxOVPiPWdjt8wYLEuvn/AY
 881TJ2uZGfXJmvSgG1x0onHgEJcXn+S4mA1fJMBwqkWz+tHYiQzVGnBGWv/C+UdOzQ
 DvaYCYYn7US6lMApD/FQHvw6QPuGrPlZdEw0lUyz05RSs3vAq5cB0U3NDCVdJusP8d
 pSQ784SZBpw4WGsDD6sn9HfrVHLPH9bl1yEUPWiPotSparMF+Uc0tTwT4aay/72oYy
 cAwg9NBAzA5+g==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3C00CA0071;
 Tue, 24 Nov 2020 00:52:23 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6A13340095;
 Tue, 24 Nov 2020 00:52:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Poix/JBx";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4GEmVOQ+bIDHpVE+rWCsi8jyYb+ukw6kUqQHhL2wRMr+12GNb46hP1dWD6UmFgDRIes8XIPRSrWwXe7CEQwdjxLxj4vJHRIAqj1rO6ZMF0eizIKnqDJVinm2rrAXt9xqkfF1k+tEfRGpbjSpWUMbSwBevtOyd5y++hb5LZIXEaAgnXPu76thK1lbY0yDMcm/n9MJrBlIMdfAhaJCsUGuIJp1VAP9D7EkyO3BaCqbEKf8p57mACqqjpSPPcZbgIQg6PAitQpvgqOfWC1UBFZsNPyld+HL/ZnlLYYd5wvLLk50awRvUsjhAiSf/VABNTYCVNCXdKPMsbpqzDWGzi+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cj/fR8fXnKfYiSuIoKJYkAiCE2dctkS28hle+VBha1A=;
 b=V6d9jfopMQD13Mj6Y3THrV/ZAHLuOxUGONkFlccbHtgp/BZqsNOGnEoSOvUajIs9EWSHW21oGAihOi7O7vh5hdNBFiWBXanctG8xxFlz9IyoL2R6sMcV+TN5Z4P6BQ51m46Bom7hq/fCGaoqdfIb+CUAhRmc78nhu7euH9wDi9z6gTU4vWD8ngjDEmDqJerYAU2B76jLZDf/TqQYGxXB8ZgWAV1JIXaj7UcDwEtaVkWTbpV9Zl6KJy11lI0ta4EIsgBn3YVRcC86VXcHv6swrOsuT93r08oDTh9USa8lVKn5HmbdR5mCjwdgRmxgLV0Lv66dqWq1EJoWiaF6ioi9eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cj/fR8fXnKfYiSuIoKJYkAiCE2dctkS28hle+VBha1A=;
 b=Poix/JBxqIwnE7hURHXAXwPEjvQ+jCsJSnIsn41cgxN6Hs5T7fRznXIJgr0cYjOhb8isWc8qAunOqsTD7jjXcZYebHbVwfBDcDC0LFdYMEst3uUn794njKUmERo0ykpL7UaffW43uq2pi6sVFYauvcSWllXHi+0azpbbZZBROxk=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3352.namprd12.prod.outlook.com (2603:10b6:a03:a8::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.28; Tue, 24 Nov
 2020 00:52:20 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31%6]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 00:52:20 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] ARC fixes for 5.10-rc6
Thread-Topic: [GIT PULL] ARC fixes for 5.10-rc6
Thread-Index: AQHWwfwQ0P+F/mr09UuieSUiYg1DhA==
Date: Tue, 24 Nov 2020 00:52:20 +0000
Message-ID: <e02b2e57-720a-758a-bea9-1d9c03fba539@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9cbbd1c-f423-4114-4a31-08d8901332d2
x-ms-traffictypediagnostic: BYAPR12MB3352:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB335280968A59617599ECFE5BB6FB0@BYAPR12MB3352.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1ks32VsPrQqRG+XyQ1rZEazya7KYbSCKF1qPspZss8RtYRuw+OOSWCjHhuQ+L/bIOJjh4iVkxvvV0cXoM1XGMZQNzmFhVzlh3CcDHEArWYhqMuoqZawxKF5o5vQWTfvQTVmyICpa+leAGGqWXPApa69YQDkjSbkbx/Pyckt4mgveDmWK6dSBViq21l2lrJNm4iku3E7ZtbJw/PWt36fHZYOqnfJSyBt+630PshSM53P6oTJ+3Q8c1rd5pL6XAvisnBUZQL1EaTONknOgDfZnO6zkS5rp2zeDW/DJgGS1lp+XI2T9sykZP5YnbvqzGuCUZmZNlc1QTG+HY1WwGbZeXRBPy0xuK9K+qTteRQ+pOWysa9UoxqAhgSjpiFSQoWtB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(66446008)(316002)(64756008)(66556008)(31686004)(36756003)(4326008)(76116006)(31696002)(86362001)(186003)(71200400001)(478600001)(6512007)(2616005)(26005)(5660300002)(8676002)(66946007)(66476007)(4001150100001)(6916009)(2906002)(8936002)(83380400001)(54906003)(6486002)(6506007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Fa3JfdbvuOBolNCGYMuaPFbo7uv6aOvImtl6wFd/y8S6aa0cip4fzoJ1vg0vRWEPQTqzMGFmGqppGz/yu4QHFsY9mDG1FNpJwOSjzRB6D5jGzXHWAcsV+NFfyQqnO8lMmxXhCi4b7agJFqFH41WAe2uxcW1Y1nUCV3iQr8rTy6k+ta94gIKqnyT2lZMKU62l6V61NBq8bxs+Y8gEStaBdhjz6eWsq8G2LbT3yySO5A1Nt4U5qhbCH0e9wDhV34MyLeU9GjpU7tmTtDNqwfGl9kYDDTJVplWKtji8wgfKuQYrxKZUx09wITxHbzxSCKZCmqqitL0AsGuIka4x2BST7/AObduUD5U7Ai5vqvoA8jK0oUT+cDlEPoJhdyydxJGuL42OKgwJnBpYQgFaMpM+tJ3hoVbc506t/iZMcvu01Mqf49TrB3DHKsI0dCZrNTutS5Ddegy9CIGpMvLyXY6OYzCJyCGcF+5aIo0eMQ42/8QKmaNcK2PpWdLd3nxgxk6IRSw/vgGI2WhTeB7FudfrgFfupFONMjctn0jAl0FRbpeZn19nwD3N3CtgsNMXTD+JtDq/qeqQEGGnJyN0s7RZVGmBR0kKbvg1Echm38vbsJRlZTeTQc/Hujxqv9+ICBy8GJpXR93HnuUoS6Ki/gDqUV61TSKxfS09Qay97Txmv0k17mYfHGREj5Q5C0CsPslBDwUqvlpw1ZdBS/Sy0eFP+YgAxiLxp7R2/VkIa9MPdn0bMW6PFr2f5074x4mFDoaLT7MtLOLy9yqtmU0aHN5+8BgBMMlnpoJZJCWQM0OVZUNljdOeKn3bVe/x9/kN6q47TS7gC0qtTa3EDqZQVhMEOvji+HnLGDPkCM6lU4wB32zSdn3zy6/XRB5LfrG+lbe2K9oCOX1keTtOWj2dr6lyFw==
Content-ID: <3CA2B7D5A7273240B92EF562036E7B4F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9cbbd1c-f423-4114-4a31-08d8901332d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 00:52:20.3226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rLgeJsE3O4w1pk31eAxwXhpXbm5I1NT9r78FqCjEi9q+bz8UtLR1EHNs6FZOR0weHBY5cFonszO1vq13DRNjvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_195232_748149_A653D900 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Flavio Suligoi <f.suligoi@asem.it>, arcml <linux-snps-arc@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Linus,

A couple more stack unwinder related fixes. Please pull !

Thx,
-Vineet
--------------->
The following changes since commit 3b57533b460c8dc22a432684b7e8d22571f34d2e:

   ARC: [plat-hsdk] Remap CCMs super early in asm boot trampoline 
(2020-11-02 11:45:09 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ 
tags/arc-5.10-rc6

for you to fetch changes up to f737561c709667013d832316dd3198a7fe3d1260:

   ARC: stack unwinding: reorganize how initial register state setup 
(2020-11-17 20:12:01 -0800)

----------------------------------------------------------------
ARC fixes for 5.10-rc6

  - More stack unwinding updates

  - Miscll minor fixes

----------------------------------------------------------------
Flavio Suligoi (1):
       ARC: mm: fix spelling mistakes

Gustavo Pimentel (1):
       ARC: bitops: Remove unecessary operation and value

Vineet Gupta (2):
       ARC: stack unwinding: don't assume non-current task is sleeping
       ARC: stack unwinding: reorganize how initial register state setup

  arch/arc/include/asm/bitops.h |  4 +---
  arch/arc/kernel/stacktrace.c  | 56 
++++++++++++++++++++++++-------------------
  arch/arc/mm/tlb.c             | 24 +++++++++----------
  3 files changed, 44 insertions(+), 40 deletions(-)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
