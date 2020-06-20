Return-Path: <SRS0=w5dH=AB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35386C433E0
	for <linux-snps-arc@archiver.kernel.org>; Sat, 20 Jun 2020 05:07:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B5B23139
	for <linux-snps-arc@archiver.kernel.org>; Sat, 20 Jun 2020 05:07:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jAykslze";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Kijos13n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qOKW3zJA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9B5B23139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEzp5c8wmWtlHLaWCpGZI7XhEpu17qg7qdS3RjqZUN4=; b=jAykslzeAJOE7F
	CL8b/s4zKOkzonvzIu56/XChNkbhAuRCibZlGAFsur4rWKT66P3yZ/BZVviAUNh4In+XDx5fwfR/N
	gV0kR0GbpUke9MxaKYsvdiea4k31347R9KGoDlodT/2VOT1QFSUiTMUn2lXTmD+uZZzhZjRHEv6Jf
	8FNcddabALDG6JIY3ThgreSEyq+p2P8/uBcxeeVtSw5BpfVoYNgotZSbld00Dwe/KNk4xLWu75PN/
	TA3Vpgu/PQABs3cYJLJceYXipBv/uz20ODJOd0li0saIdyTspmscx9say7PB8AJUdqJ+xP3lKisp6
	w1EM0NNjoIkqr0r8y02A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmVin-0007RY-QN; Sat, 20 Jun 2020 05:07:17 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmVil-0007Qr-FH
 for linux-snps-arc@lists.infradead.org; Sat, 20 Jun 2020 05:07:16 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 86A3A401AA;
 Sat, 20 Jun 2020 05:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1592629634; bh=FSUbmNtbc+Js9w+51druavq4J5bDBFUhdmZ3fq7sdIs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Kijos13nQH25OZqZOGJjITejvSKqRWZKIPKeOry+wGNBQFkDj7K3h8krLYkrDQULo
 4cPnpu8qdg5tamydx7YEDzD0mDjQ9R6FWxxhzOFQMdaxS6N7E/exzuIRt1Tq1VdW1H
 PvDbTZuENhCzeZi/AmVbQVtNLGDvUtocoDJ40JQ+s7ThCUo01OF0H6VaJgd2yfFOVS
 cNiAVl7VEXtZ8sWQ8+3BdA+v66sZKxDW4kn+IK9KExm0ks4AnPn3dKNEFOvwzs8ZzY
 SzBI0ozNGgXoIskmnOcq6A4+tYBAjQRymtoStCP3wj4br46bDQIIkVpmT8m3aDAcBS
 06l4m1/P1Biiw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 348D3A0067;
 Sat, 20 Jun 2020 05:07:07 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id D45D4800E0;
 Sat, 20 Jun 2020 05:07:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="qOKW3zJA";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2qjVfIjFbtIL2yx9tx5JdCfSyKzCtPKv7k1UoM3Nlcz2lcrk+HB7ixugJECJkkScbZDg79beMciXvz1ZckmMNT/izJdbkCvmHTFlcCd8f1pSVbnAhCATGf3t2mlgxdGty7g7LAnG4Fl6NFDIgUw8p1SzCKGmDKAV42/NVEdCO0HPUkJ6ELIsx5ucZ/U1ZNMtpL9dKrwq8YpJtNaaTgkrQDImZgUkyFh/IH8C2OWyC+M0f1tZm7Gk7M2Kap4UNXqDbDMxwN1wuDccwOWUZVc45k481pqEG2ugCe2bd/tEeVunpAxZfpirKiTVLfW67AvrLwn0oaat+lb3AQORDDZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSUbmNtbc+Js9w+51druavq4J5bDBFUhdmZ3fq7sdIs=;
 b=ElUgT+sdrO93J52vv22A/fLYZfSx3ewXC6TeyAx2dJ+Tp2/VicLDoGvvOwRPu+741iHT8/E4SA5FSv93JNeZqV2ptFPhzRhEc0J5NnPlo4iDIR6pYgVWf1+KoVSx7g8CMY5wp4zqhJ7Fx67/Sm+KLBqGg2zmW+WDXpw1Y2jRsoOSMM8Cc9Gu1E2B7PMO6FSeIKiW2v2J3LralvqvXzcPX2tQ1I/raEwgK3nw5F9pe7dMf18enEXGFbbdgoRIonV9x+7/ouR6nRDWLP4V1SsVshzGib9x67xuGz+9ZLrzCgZOKHstzMvWV4qr0WwBGYurKNzoEMANR2Q6fmDkuZbSFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSUbmNtbc+Js9w+51druavq4J5bDBFUhdmZ3fq7sdIs=;
 b=qOKW3zJA83MXXgaoSQtWTSctBbQ5n7aNU1X8p7y2hLzC+32q7NtnfvYWlPZAh92cmd6eS2n3RaJck76vsWRjIeCGaZssONobhTx+dK6VLC42qW5Ihafq9/HQbCvmw8o3x3rLUMN3yd47pdO9BH6Cfd7GRjZ1VrWYXdWlALOGG5A=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3638.namprd12.prod.outlook.com (2603:10b6:a03:dc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Sat, 20 Jun
 2020 05:07:00 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3109.021; Sat, 20 Jun 2020
 05:07:00 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Carlos O'Donell <carlos@redhat.com>, libc-alpha
 <libc-alpha@sourceware.org>, Joseph Myers <joseph@codesourcery.com>, Andreas
 Schwab <schwab@suse.de>, "Ryan S. Arnold" <ryan.arnold@gmail.com>, Mark Brown
 <ms_brown@sbcglobal.net>, Paul Eggert <eggert@cs.ucla.edu>, Jakub Jelinek
 <jakub@redhat.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, "Dmitry V.
 Levin" <ldv@altlinux.org>, Aurelien Jarno <aurelien@aurel32.net>, Romain
 Naour <romain.naour@smile.fr>, Stan Shebs <stanshebs@google.com>, Khem Raj
 <raj.khem@gmail.com>, Florian Weimer <fweimer@redhat.com>
Subject: Re: glibc 2.32 --- Two weeks to ABI freeze. Volunteers for release
 manager?
Thread-Topic: glibc 2.32 --- Two weeks to ABI freeze. Volunteers for release
 manager?
Thread-Index: AQHWRsCg+gJehUPmKUuC0JZDAyrO9w==
Date: Sat, 20 Jun 2020 05:07:00 +0000
Message-ID: <e00be318-568b-2da8-20a9-c504ac545505@synopsys.com>
References: <a5b614eb-2344-2944-96f6-3560fae2a3da@redhat.com>
In-Reply-To: <a5b614eb-2344-2944-96f6-3560fae2a3da@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ca80b45-e903-4ba0-46ab-08d814d7c3a2
x-ms-traffictypediagnostic: BYAPR12MB3638:
x-microsoft-antispam-prvs: <BYAPR12MB3638285B9AF4B694C06A2155B6990@BYAPR12MB3638.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0440AC9990
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LA0XHsDiPPGws6rle+ClypMkKiJLr3fCpCtIAbELZtBT1Bsl0sgspKYd0DzYSn8X3nwm3pEm+JX0kB2/XGvuepXmZ5zZvNyaVe0+XrkiI0mSuiEKZLn0ZiBl8KsXuatXOe4kMoxTykb1W+4ySarywp2/7SDVQIshR08HVLsxgOVLc92EyjxPuxRjiMg5oVM5WPhxTXI595aVW3+ALrDORSRSY2SDYYFts8IVFKSCB/19Cu3dwWn/hymhJj9earSYjM2vjt8NOFekPbzD1u0XnqWTZW8XGra3oM0T/OgJIIT4i5oIoP7exJLONScaIA6wRpCCYAFjzkTy9q9B5Jk9C4ibWGb7Y3b23uT2qhw9iDPiSjN8xmKxhLUzkIRs8UglSU0baxfeU+ev1j8CZgWdjA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(396003)(136003)(39860400002)(366004)(376002)(478600001)(316002)(2616005)(53546011)(6506007)(7416002)(2906002)(36756003)(6486002)(5660300002)(86362001)(83380400001)(31696002)(8936002)(4744005)(66446008)(8676002)(71200400001)(66946007)(186003)(76116006)(6512007)(31686004)(110136005)(64756008)(66556008)(66476007)(4326008)(921003)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: BD+vrjoi9Fn9mo0Ttwb7WnKCSNpA4pZQVKi7qPhW6jxAsMrNfCg9h1oeu0n3Tj1OILe27D4xaCoUQ911OtyCAPPOiWJjQ8tqysRA4B124OPW3aEOORhktupok7vrNAO0uJdvGFIHi4Vq0GyMe4raFonxCA9BHllZShID1KyK3khr7Qft+5YWlAquSCGximI0U+bPUpbjXfGMB9ezcc5MWgz4k2B6YhlDL0TArgJFjEthKBhU1zQZ+LEtAIJwCCBCZJjQg3ENwv2B7v2qZ6f/bTIQ8a3Kpk20P9RALpGH2awO8tAUK2oaFi1QIxteM6K8yrUASA2W3XpkoazUIp95fgMF2LHtBXWB1JuLZWH+DMLoCORBHaajFGzTx0uHNeSDxVUfrkWjf6tl9HPYLIfI5whuKu8o1d8S64klT7wxiMnjKHJ9cqFcrXbJqZJQ/fvdQyApaPbFJOFzEQ9zEYyiBq5bMEKMog4YXiWUyb/mJkXT2wiwuMOXR5VHTdna3vt/earwPNksfAbj0vTN/MQS2Sa/no3fSiJkHoVR/hLbmrS/N5uxSw+n3o5a4aS8kQZH
x-ms-exchange-transport-forked: True
Content-ID: <E97FC698E92BD541B3F13F01507D7925@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca80b45-e903-4ba0-46ab-08d814d7c3a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2020 05:07:00.4112 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0IvEgKN6nqkkpXUbMf+QkrTNv7joLWIPSYzvvRLlYmhA9qhh1ZRYOGqzly94HQZEdcMND5fuZMbfE6z3+bU3ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3638
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_220715_584922_879BF00B 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/16/20 5:02 PM, Carlos O'Donell via Libc-alpha wrote:
> The GNU C Library 2.32 release is scheduled for August 1st 2020.
> 
> The ABI freeze should happen between July 1st 2020.
> 
> We have 2 more weeks before ABI freeze.

ARC port seems pretty close to production quality, with multiple rounds of reviews
and updates already so it would be good to wrap it up too. All the accompanying
generic changes have already been merged.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
