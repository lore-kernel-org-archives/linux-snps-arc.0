Return-Path: <SRS0=oU4o=3X=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C484C35247
	for <linux-snps-arc@archiver.kernel.org>; Mon,  3 Feb 2020 18:40:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EEFE20721
	for <linux-snps-arc@archiver.kernel.org>; Mon,  3 Feb 2020 18:40:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e4ktht4X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PjhjgezT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="FvnvA7Ie"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EEFE20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRAPRddHpWZVAyzuBm4l/z9Gz9ZgX5zz2JJdWyiOJUg=; b=e4ktht4XFHJb/9
	NntanK350ANvUUV1TLPAHaG7MXRTJffC2TksY+ccXHpKxbUbQNwQKMlliGejzAxJEuSnwgPIUPG5X
	nnE5xBc8+zaDlM+LQgQXUMO1zy8j7KUf+Ldvl9QGQeCrc+73lvD/oYG14YKH3kAhPXWb+sg03ANna
	zIHOozxPLb0ErQmBM3GFHlMJ9RaReX3fzBNM7C3Y3iEcGvvB4oRCS+u7Bj0W33SyVWBmrPJN010Sa
	VXV1V8txHNE+0HP/d0wigaX9H52as2Kp1YypOYfBGtC/PbccSKix3L3FXXXQBMb6XSZBxEZOT/Iks
	v+r5HivsPTI02FyQP4Pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iygdn-0004HN-F1; Mon, 03 Feb 2020 18:40:11 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iygdk-0003Wi-NC
 for linux-snps-arc@lists.infradead.org; Mon, 03 Feb 2020 18:40:10 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4C775404D1;
 Mon,  3 Feb 2020 18:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1580755204; bh=Z9EMkszueL9oVRSdj463ht52C1qhCV9O6tO9dsoXKPw=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=PjhjgezTU/n9aQbClnYGhWyeBaSaur5GEGPqEvY5fBTolikNf8RK+g1ELQl0wrX8q
 egDJizh8WP5hENs2Th/0ur9BFniXVZlRjE4rwQ7tS4sBbp+h/URi53xksWKP5Bi258
 Fo3eGz7FMvu5MwmD9hmqs768b3Gae/WqoJIBwFXDvsRbY3VM6N6yKDOCWNGCE3q0Ve
 Xl05zXTGb27bVoKTekMlBU9W/VulUuVGjPOvwRdFoOkillK7YrC0H8Twf3YYnbtall
 jl4Y8QWKJHtqG7T9MA3I7zhk4PucweyiU15Dc37SPTisdsrHdaYO26m+8xU8vao9VU
 d48CnfBMgTTGA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id DB2EAA00B6;
 Mon,  3 Feb 2020 18:40:01 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 3 Feb 2020 10:40:01 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 3 Feb 2020 10:40:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzopPVPXyigmfGzsCEo7YGskoABmTW3uK+NdQQieuI5X0ZDyYSKk+OBQzW0SFv2okJ2r2fBeWm999dHFAcBD8N0/RsZaJ0fhme4jE4zvl2VFOEgj1Yt1hOv0lhGeTBHToPOd2EU/VatDUfa6/Q1+CkkEUh1o0hpJASdxnPZHZUf0Loc41fl8s1hTS4xgW8MjxQ3CfX46vU6hPZ19mMLFuk7rxQekFs15qU/qNAw+R2yFhbjG1MMMlFJu7kkUf8tbIPKclgrzO4dGVHsJ933fVZ+CFRulONB6K2OAkSBJCJaWkclRY0lvzkiQ4qAL8wJWFcxL8R6B8vIz30YtLcdgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9EMkszueL9oVRSdj463ht52C1qhCV9O6tO9dsoXKPw=;
 b=VYFZz4BE+CA3oTlJw28UWq2vsyK/eD8CsoFDDQjUL0XU+P59394DNm3VsxdUQUUwfHsLYrtqKQB1+Ik6O1xH4xJrIalVr6LcQhnKGZWmVV8F6aflqQnoRe44811EiRrwt8wXADyyu0bwW8H8XKiHXRvL4hLjgS0oMFWb0P7ycGC2vDrgWLzGx9DxvKrM3TznY01QW2Pd2pVkOByrSMBsb8nFApq+MOL5HRYIq7pl1ruBe8ukNgCEeSneWbc92U5TNa0MGZbsKOrk8RUyJUS0CoW6vOx958AY6XBwxMPUdBn3I0nLmIJey1xpgKynflIuVvlV1MNiHKf0xIFVtgcG4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9EMkszueL9oVRSdj463ht52C1qhCV9O6tO9dsoXKPw=;
 b=FvnvA7Ie1CsFEkAuHpvTyy8ZoNKPCAHW+C97HpLWod7lCtLss80GUPBSfBW88yzFZ9zlDtZfElhWj8Upd9Q1GgHqLslu4s/qM5RB8bWixfAzfAAmqynF7X2guuHo3wk5zX7shqY30MlwlnAbCjjg7qd01av2vR1jgON5I5ihMeY=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB2998.namprd12.prod.outlook.com (20.178.54.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.29; Mon, 3 Feb 2020 18:40:00 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2686.031; Mon, 3 Feb 2020
 18:40:00 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARC: Cleanup old Kconfig IO scheduler options
Thread-Topic: [PATCH] ARC: Cleanup old Kconfig IO scheduler options
Thread-Index: AQHV16L2pzpjUToSIECUgzznedEkl6gJ02aA
Date: Mon, 3 Feb 2020 18:40:00 +0000
Message-ID: <deb5929b-b265-8256-a709-7a5f149514ba@synopsys.com>
References: <20200130192403.2982-1-krzk@kernel.org>
In-Reply-To: <20200130192403.2982-1-krzk@kernel.org>
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
x-ms-office365-filtering-correlation-id: a38a04b1-3345-4117-5be1-08d7a8d879a8
x-ms-traffictypediagnostic: BYAPR12MB2998:
x-microsoft-antispam-prvs: <BYAPR12MB2998354FA8CD44EEC35E25C9B6000@BYAPR12MB2998.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:126;
x-forefront-prvs: 0302D4F392
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(376002)(396003)(346002)(39860400002)(189003)(199004)(6506007)(53546011)(31696002)(4744005)(6486002)(2906002)(71200400001)(66446008)(66556008)(66476007)(64756008)(76116006)(86362001)(66946007)(8936002)(36756003)(186003)(5660300002)(26005)(81166006)(31686004)(2616005)(8676002)(81156014)(6512007)(478600001)(110136005)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2998;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vIfNITvywuqTHGyYGNmDZ6GruFpw66fb870sJjaNOUvRhJvDEWbBLadfc+HZjU/Nxbt3OtgSK/kDqUsQvKb/xhhBA+6a0LkB4ilVEF+ZlKSnFTjHfuSWrwxAAu8VUnD9tq62MNRVp55rt9mGjdrP0TafWccZoVgHaZ68YsF/SqbrVdItSUiFb09I0ZK/cWFN+zK7RPuKkSRuQPprAmq8lk/qPCRroZCR6H4FQfFLZCWi0T7SxJCRuh/u0gOoKUpRhfpxRN6vEwYSqAQiHGBDi+aXWJZmrAmni5Y6hpUXNlGCoruIz0JWdf1YsgBv2b9nRpjpPyyYvlxISkTjZphu6KwgAp5Iqd3JOX4YoDddAW1Qc0JGUm8vYbEQV5sThPy/8iawoPmfguGcemzBrc2Q0Z2okQF327TUqTNHWVPYRQTK79otMxwYaiAqONqobCTE
x-ms-exchange-antispam-messagedata: cupnuFrVemBH3ZnctqPlczowF6KG9bH+FoigXIhbWj7vDO0vRaIWYzJtJxwHu7tSokN0WUXmtiH/wqysuK/1dpHSsKjEvpGxL/BXfkTkn0telquulc+WX1RbOpLX1Q1uILFctThM3ph5f7UUEEyYCw==
x-ms-exchange-transport-forked: True
Content-ID: <33D3DE8D1B54964DBBE1F14F9F3088ED@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a38a04b1-3345-4117-5be1-08d7a8d879a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2020 18:40:00.2114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sGWNV97WkQwIwuqUerHtHAw4TLpOIhq/gqhu9QWrBs5Luc1NqkWBDUl543l1eAJWlRrIoD6zyLRrec77wqy12g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2998
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_104008_792726_689FAEDF 
X-CRM114-Status: UNSURE (   8.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/30/20 11:24 AM, Krzysztof Kozlowski wrote:
> CONFIG_IOSCHED_DEADLINE and CONFIG_IOSCHED_CFQ are gone since
> commit f382fb0bcef4 ("block: remove legacy IO schedulers").
>
> The IOSCHED_DEADLINE was replaced by MQ_IOSCHED_DEADLINE and it will be
> now enabled by default (along with MQ_IOSCHED_KYBER).
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thx, added to for-curr.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
