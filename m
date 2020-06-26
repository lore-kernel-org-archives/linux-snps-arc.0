Return-Path: <SRS0=9Koe=AH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A355C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Jun 2020 18:26:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BA2720836
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Jun 2020 18:26:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EwG4klCz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eYAb4xob";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BRyuZz7t";
	dkim=neutral (0-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eUUxpQ1L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BA2720836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Content-ID:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYiPKJzaaDcDWFPyoPuM5/cXIock3n5JKBkdBPZzqys=; b=EwG4klCzFfURn6H1R7sdlErQ52
	SuvgAtH225WzW/LRNNFtNYA0LL3mDk5rPO2LrC0EKauUdiiJSMveGW1bD73uNmKWzyU5K9na8dFf8
	p39gMFv/v95quPuHVlfEYXiPHKn1ikyLk1AMKYQco84K9jbS7BgWEBcHGtIt8P+Lg4cGnVQ2Fa2S8
	LkzJyw3HW1s8bTu8rdeT/pOK90gF0Bu9oYrKR1EOTZV0nK1bE6Z4Un53zC5gV82TzFgHeExCEY3JP
	oYsL4yaMrpzKkqmX6vQ12t2Ejiol18fvGIX/7v6gPaZ2r5Rl51qLAV2t2eFkUsbWcJY/kQmIDD41M
	pG6NUmCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jot3P-0002O5-FE; Fri, 26 Jun 2020 18:26:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jot3N-0002Nt-E3
 for linux-snps-arc@merlin.infradead.org; Fri, 26 Jun 2020 18:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:
 From:Sender:Reply-To:Cc:Content-Description;
 bh=RYtek97qLCuus6COcPzPvgpteckp+CHjhwVMKgOhtaM=; b=eYAb4xobFsO/Zbl4IQBTaZNenb
 jgJN1FVDen2B9nYYVBA9S13VZuRPtpwzfeOpDIx8btVO9JVUk0MO5azTtwBroCv34+TZAJRXSvuKK
 YijEmmZOpBA2xO/t9YqbjEcNKI9hi1/aI3+oshwQKT5cklsPYw7PwN/LX8AOsbgzvdI5zdM0JUmSY
 wWWeUTywdIBz8LRFzH0AS6n++QhLsXQxGQJvfCQ6YJkHyJM4Gh0tGi4AssrLE9pyNFD+tqd76WVVy
 rPC9Bs95Kffb7Yp1UZtMmA1Qs15ZOgYE6B6PJzO/xrIBM5dv2dQZQI+V7tnoP0l4tSV2iwBN/kjVn
 oiFHZAQw==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jot3E-0003yc-SI
 for linux-snps-arc@lists.infradead.org; Fri, 26 Jun 2020 18:26:20 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5C3B740562;
 Fri, 26 Jun 2020 18:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593195959; bh=RYtek97qLCuus6COcPzPvgpteckp+CHjhwVMKgOhtaM=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=BRyuZz7tckXCw/MpwR6xcBk47mAlXeurf2prw5nvWsw+wQFZON7x28cS8Ve115aYF
 u7aEVlwKqlzL47VFjVJScNaWcN9lYajQe/PIq4K62cpPBgmgk3cxmwzSIsIKEyeu5V
 7dxp2jRh9+QOe1jX/WHBjBrtj4MvBE/R8h4oK9mYd3YOVElYQKQwBNFpVufQ9e9Imj
 hTCIpNI5FRAAqEb5Pl4olyRawT6OfxZ7ZPjq2b3MwTTvLE+2GkYRXFQFBMidtw6kwU
 oo86OPJ3lp7uWqzb+eVKPxl1FDgOPZ9Rq+H+V3q1D1/Qdn6GcU48gOFS9JIjnHzzfQ
 /y8mDjUvjpvdw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A612CA0255;
 Fri, 26 Jun 2020 18:25:54 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2054.outbound.protection.outlook.com [104.47.36.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 902C44016B;
 Fri, 26 Jun 2020 18:25:51 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="eUUxpQ1L";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FeuEH88zME8aAbIm/v+F1x8YbO0qw3P/3D19vdknn0r5C0LhuICEGL8YQTzlxYnYUDb/jRRi6wiW0gePgx3s2F8XgRa9e4Ikg/QGd0kixwusSwPmXZvGreF36aQ5x7oB97+MlDD4J5Bdvn+9tF3SaP2NP0TTbVtfYl5Q5mZHXBgEAl6lZIo325F80gtNNu9o3NJ3l2LVthtaO0OItHTURuYJBhirWIgBfzWttHVm1yIqAV6tQMdn/EeN+b5HHsTeyIMInIR9N6yQPoAWlga7VZ4RcwLbYiWD75QnBbPZGvn86qs3qM/S7S5GNPyObG+o2syzqB/oNZGiFk4ERxmFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYtek97qLCuus6COcPzPvgpteckp+CHjhwVMKgOhtaM=;
 b=R8d6tsnx0OCAF4+i3vVkuoWO4SACFtcwCEuX2Iwzr0G3y3u/nO5Ev610JRn3PTY2Y1L6KgDgfkCoOcEfocU20EO6SvETwCGAaUHk9VG0hybcrr9cPcBwicgMOtgJMANKjc7ZzGcRw+eO+2DoLqeMr/rLyegUBitXFfJWERxx4Ert8B8LwVGT2ggfWkR2N6/pelH9992z+6oQzkDOAq3Lt7/mW0fbrEz0O9sJ0Jo/4Wtw/zJQbZSQYMCSMpJgyoIF+KI9C7MSvhY12kH1gcFfdqprMS2xkWdNLSxbQJ6KS748GB9uGORiFCHEer68Qcvz6xIX22017LhAAKMRaBzBTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYtek97qLCuus6COcPzPvgpteckp+CHjhwVMKgOhtaM=;
 b=eUUxpQ1L5lyWjA4tsv9eqBb5H4QQ666PYGtsfh6T1wxZW66iOyvP9yeASI1e6dv/2I/MD+9PmVEy2hCLxzgQOUakhz5TDNQ1gHKRx0RPU0p64Sez+Kihlq2N2e526urEYfezf0Yrb2JnHZbc3oRGW1Mfb9BvAA4AV/i3uHi+IjY=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3480.namprd12.prod.outlook.com (2603:10b6:a03:aa::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Fri, 26 Jun
 2020 18:25:49 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3131.021; Fri, 26 Jun 2020
 18:25:49 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Carlos O'Donell <carlos@redhat.com>, libc-alpha
 <libc-alpha@sourceware.org>, "jimw@sifive.com" <jimw@sifive.com>, Alistair
 Francis <alistair23@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>
Subject: Re: ABI changes still pending for glibc 2.32?
Thread-Topic: ABI changes still pending for glibc 2.32?
Thread-Index: AQHWS9R1p174z7VwE0uemCrwVfDLd6jrNsQA
Date: Fri, 26 Jun 2020 18:25:49 +0000
Message-ID: <68a2f0e4-7155-7512-30ef-1dee13695e13@synopsys.com>
References: <c68be61d-fba3-2dd4-9d45-83bf6f55a5fc@redhat.com>
In-Reply-To: <c68be61d-fba3-2dd4-9d45-83bf6f55a5fc@redhat.com>
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
x-ms-office365-filtering-correlation-id: 34b91ab3-0aa7-48a9-5529-08d819fe5a1e
x-ms-traffictypediagnostic: BYAPR12MB3480:
x-microsoft-antispam-prvs: <BYAPR12MB34803D925C72E2464F2440C8B6930@BYAPR12MB3480.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0446F0FCE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D+bUTpZpBInwIsf/4hPY3aXE6rEj4weNDuNzy56Vsdn6zS5PQK9v7YpvwMfkOz7EJFri0kMm/dIYbvhRpH3kGq+IScLUCYlOGxjulzcc7lxW+H1XI5w38VOOUbBWnHvDBNDDAw0QkU8TztQwkcSeWLmOehSLxd5IT7SRb+0k0+QPTuOr8B/tgS/hMTivLnu6Lnzb6jAFsSqc8d/FpcY7L9N1dkwh2157o7jdaMTMOBoEyo4PLF5qUsN1fT4hseEHT7PE/tngz89mCh+RCrJ0GkC+VBqFjeVoDHLPhEEX9W/TXZYn9LwnqLFEsuuer/yhQAjUJ70muU8DfKNkwoh1vqgoNTbGtQeuLfKlXdznSbvcDT84HZ2aaePFF1ccCM1r
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(396003)(366004)(136003)(39860400002)(36756003)(316002)(478600001)(110136005)(71200400001)(6486002)(31686004)(186003)(76116006)(86362001)(66556008)(6512007)(4744005)(66946007)(64756008)(66476007)(8936002)(53546011)(31696002)(6506007)(5660300002)(2616005)(2906002)(83380400001)(66446008)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: L8lDKk2b2hvEV4kZBYWy4UfKOvfxGue3rulzk/iSSllc1s80rj8+EFMy4gU1+dtXj3XMRaQ97qAgHzzNznGBCrxpxTwj2zV4CSmL34j2C39r7KxE3N+nkkc3//8eD6AWtzU4qDG7ZqkEtqsSKP7zx/rWGL+6kRcePdrqOWSpCjjkEFZCFp/QrjUMSL1AqvVLsk81KgfgyWbSLJfSxtnAnKTnBnfpf+KsYb0URXGdPtI2AeG2LHf3w0UqLt9k8ZfuDEwUibb1XRD14YfIDXvYRdInnjuCd30a5jgvac0XnmdoQGrrYkRFBCUJotT5G9buEUfvdfFqMjF9mHGd54RR7pqFvW3F1gO9C4eVm84tuAdbckXsQX1MY9G4jpIVHtH7xwwI9XwjEZ7BOnb3dOd5XSaedal3S94Dw/uCwcTcjknTO7eWSjvZRdJ4TXOz8dKzUOxs59Q/e/JiPMiuy4PssZKCut6LU+aOZl7Sh27wInlcYZAZoEI5EqiBhg3cGiW97IwyIbNDIcxiUI7Gv8ZZrJFo6I1F/EQOH6Mz1gYkwZUymVxxiG4kOqvLd9IE4COQ
x-ms-exchange-transport-forked: True
Content-ID: <1279A80DF1C67C4B8EC46ABE7E4B467B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b91ab3-0aa7-48a9-5529-08d819fe5a1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2020 18:25:49.6300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OxZu5Ld0vD9llVHmeXt2Xnxx7x+C3v2Wtquqj/QFVcfHY6F9pNJ0mSnGBF48NmMMkotcc+OLMjCoJNQMFe/1uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_192614_129049_674F2DD9 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Carlos,

On 6/26/20 9:11 AM, Carlos O'Donell wrote:
> Vineet, What is the status of the ARC port?

Pretty good if you ask me ;-)

I don't think ARC port leads to any public ABI changes (but does depend on semctl
changes as we follow the same ABI). Any ensuing common changes (non ABI) have long
since been merged.

I've recently posted v7 so it's been through a fair bit of review and rework.
Special shout-out to Adhemeral and Joseph for that.
Honestly it seems production quality to me, just waiting for the green light from
past-reviewers / maintainers.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
