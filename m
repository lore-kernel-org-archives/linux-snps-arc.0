Return-Path: <SRS0=81lh=JR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24107C433ED
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 21:14:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29806613F1
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 21:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29806613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RSUeJY9MKEtvdRyCmdgLqRkPs9W37GEtgRq16yhyy9U=; b=iMEnET0ZHGl9DRzqRXAkw9Nuh
	Fu4fa7E9dksksFTnDkigKiq5HamLvFR/WZApD+GvrBoUwMQHrV01rSPgajTCRxJfAycymIIEVNvSp
	F5nezTvo/fEx3+zpZV06mDW566uip25SpnlF3gOb5utKlmLEx3R98VBYB6sdYlaKfNMscPfn0Lrot
	nEbQsAoMrO4UFo3mGGuSEtaFwNFLYz6ZnyADq6jjvVHjhHLK4uJ9yxL7Vo2wEJx+ewwhCVgWNqfQX
	NMgGhzRayBSdgEUFQJYHqnK8Z9EzZoDzY21XR3YNyJnCBSKmpg+Bu4bLzK80nx4OjmHpE59SIlC8Q
	JhveX8D8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYxhp-00D3mF-8l; Tue, 20 Apr 2021 21:14:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYxhX-00D3kx-5D; Tue, 20 Apr 2021 21:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Description;
 bh=V2lzBBYP24AyvHm27fc7znXxbzxcXRd+zXw7ZBZUcB4=; b=Tc1Dm5VJhMV1Mv63RbDFNuGWus
 MxXi8ORWSQfzcqUW4liul7QXbQ/zuIKCuKy3eTZRVq+70T9j+3I0fSv5mhXJ5cHpH/mNbJaL9LDEF
 89HJ+ohNP7tWQF3+ZcLixiFVPalJUFYexcZJMA/bjFLg9G4ROCD1WzLcfs4x9VMzggIaK7EJkhHNU
 zBHKC27aXvYAJyHJUJyc4GZHkI4Hj9dsCv553UfqNm+ctxN0Y7koNm+vHnk1Kv0CZzOS9hrXC9jE2
 LxJXRC2iFTdDQ93/F1G0DFOatnDYG+QsXteQk1vUHqC6C8LwOMLHCYFxCgrisPYgce3mGXO+8Rlzv
 bLorxPHw==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYxhS-00CQQn-3u; Tue, 20 Apr 2021 21:14:29 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 08E39400DF;
 Tue, 20 Apr 2021 21:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1618953264; bh=V2lzBBYP24AyvHm27fc7znXxbzxcXRd+zXw7ZBZUcB4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=fgVibSljnc2nQiW5jaBnRRgXDMlpmbHJrKeE/fb4HFlHORQSx3uge1xa7SAkWoaWa
 E0siAFr7E6MUusb35HdKCvY8HuaqwV4HywHfoHHH3IrQaFVF1jteDbgx0ui3GXmn8m
 9jT3plX4RDgQXbE2psSDbCy6AqdLyt2GwM04HicmB/fBuA8JWZzMrWEFrY73G24XUj
 +pMBuGNuLhO5m51GRl3L2Ly4ujCNg2Ty1Ye6hweo3/2A7/CPw4XBtrhsHZHE/4KtsX
 eegJAPdy1C652V+gUXMtoGNJLIaX6+uYT7MEgoRqp7vhC8JLhPthbcaosmSMvFsqlK
 qAc5BT0Fewtxg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id EACCDA0067;
 Tue, 20 Apr 2021 21:14:18 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8CDCB400F7;
 Tue, 20 Apr 2021 21:14:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="V4ZrO4oP";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F29Mr4MmSxfdFmO19x6Nir1bXsIxfhKz249eKklJ7JuHpkBqN6G4jLHs4krxoRJRBFyYQwPY8rL+1inJEMRwGkmHV0pqyOU025sZFOe0mKLDFSQMGMfI//G7lGBSMUp0+WcxIKkbxeBCevFouOVcAF427GVys71vonqp3WkxfiMWNqfz8GD1ZHbSV+8IhKoMNZrdT+SOwHPI8SVwYTg9qIVhq2nS848/o34bcsumer8VdFz+kii/VnSAWj+Pb845zySPAsykd027kubeigDWlN67mzmTUOkzH9SFasnRBqk0tjasv+LGTvfSOJkUhK+kJjZpF2b02GwKZdJaE1Q+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2lzBBYP24AyvHm27fc7znXxbzxcXRd+zXw7ZBZUcB4=;
 b=I+uqHkJU69al3mPA+qXqJcHqYWw2Veud4q35dTXCzT5gOpo/WL0huI8Cj+L2bNBHWgAMwUaoHL1dxcgCo9AJAnTkhsRuK4EMvA0Jowdlgnacf7xRlFZKn0U84L5nd8KcGuDbZ4sR1pY8djp3ySf4FG18UPWGbQ6nzCmogAZ8tc1eA2XrxeH8NdQI79tWQWqVoMeOi0BH3lhl7wZbRk//0V3i6QTUtSiiPnJeNmwbD1XYnN9aKi7QReKb8rVge49smIrFKiNuu6tI9OqEo0wC9T0jfCNmcR7u5x3XDsT/Vx8h27K7qkl9s39zLigVJpBdiA3njX5huTqzNap19ZcGMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2lzBBYP24AyvHm27fc7znXxbzxcXRd+zXw7ZBZUcB4=;
 b=V4ZrO4oP2FJkFzrmIVtr/5w5acv5pKh7+8rdc+ZYLowRrUVR+9o0ORcSHIq1UGxLyK5Iry/KwHgu1FRvMDsZ+bXjmbRQpY/J40F2fq5w7Fo/x5CrTm4bp+tbD/FNudAqQCGAID+08gJ8nHL5PX6aL+PY4/XoD5gGoNJT1SXTuzY=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB5015.namprd12.prod.outlook.com (2603:10b6:a03:1db::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 21:14:12 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982%7]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 21:14:12 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Arnd Bergmann <arnd@kernel.org>, Matthew Wilcox <willy@infradead.org>
CC: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ilias.apalodimas@linaro.org" <ilias.apalodimas@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "mgorman@suse.de" <mgorman@suse.de>,
 "brouer@redhat.com" <brouer@redhat.com>,
 "mcroce@linux.microsoft.com" <mcroce@linux.microsoft.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "hch@lst.de" <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Thread-Topic: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Thread-Index: AQHXMxVijWO/awtGlkiVwcCofC+50Kq4AUEAgAS3z4CAAAY0gIAAQlaAgADscoA=
Date: Tue, 20 Apr 2021 21:14:12 +0000
Message-ID: <8d0fce1c-be7c-1c9b-bf5c-0c531db496ac@synopsys.com>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <9f99b0a0-f1c1-f3b0-5f84-3a4bfc711725@synopsys.com>
 <20210420031029.GI2531743@casper.infradead.org>
 <CAK8P3a0KUwf1Z0bHiUaHC2nHztevkxg5_FBSzHddNeSsBayWUA@mail.gmail.com>
In-Reply-To: <CAK8P3a0KUwf1Z0bHiUaHC2nHztevkxg5_FBSzHddNeSsBayWUA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 294c2d41-0b0a-429f-b149-08d904413f05
x-ms-traffictypediagnostic: BY5PR12MB5015:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB501534AB6C15A2B63B81EC00B6489@BY5PR12MB5015.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6tEcbfHlAKXwMvtkOt0dHb+xftJsugey+7+9j1pyJ3oaV67GrIIKlbtbIrPFp7P1Oa6VYcarTeIG+u7+uX1Vc54apzHaBDGE1YADDtoTSP0c7kOTkyDPR2V32YS0Og5IfkJpDNqMb1DK56eAd4DPrYzKSyqXQJphSAh4zdgOAG86kX4cHUnywbfmR4BPUqYZA/eaD6RFbhp5+kTnhHr8mDYWjURlCOFy69UjcM66O2ch3rZmDHkB2JFm57Yq4Ux8TlqN+ApXYi/y2TrqqlU7VfmbdVrIJXca4+SjeQPBtb+WGVGsCwmDEmADl5jK8BOvX6cp6G738v/95hLu4iuqoxi4scjg9qYWwwDCtYT2dOMyWBidoTEQbF6p9Yy3469PVEws9trVSTwfcktPOR9x7EIllOgwwDaED/GK5Yq0AdS7DNq1g6tF2GQksiN/HagM5r0Apxyok5NOaNZFXspuXclVqvgBJxqjjD5f3ZJhBA2fivAG7TdeKwzRKZ+5Ty1M8mp/3DFk15baygY6fZ8JN2ud0gD7OnZ1qHVKzy9taI2hQc5ItIKeM1YfRlFwAat68mYPoR4IK5FnLPT9aKfGn9BRWFf9wD0brtzfglfIkCWEGjYTz5EVJQwunLU0RS2687PHf6Nj08uP8TTBGDYBdf7BQ9oR+HZ+L7AcQ5+3PuJWL/5V1zzbQCKKnPPPRA9a
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(396003)(366004)(346002)(39850400004)(38100700002)(122000001)(2906002)(478600001)(110136005)(316002)(26005)(6512007)(8936002)(66946007)(36756003)(6506007)(4326008)(8676002)(71200400001)(53546011)(186003)(83380400001)(2616005)(76116006)(7416002)(64756008)(6486002)(31686004)(5660300002)(86362001)(54906003)(66556008)(66476007)(31696002)(66446008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?djhWYXZYT3psL1o2bXkvMWxpV0FJUnJndFBQUjZvbUZIeEVnRUxPVkJwRzBD?=
 =?utf-8?B?NElQQU1xajlaNzd3S3BybWtVeDFuVkVMN3AyV2NGNmFGZ2FJUUl2SW4rOFlB?=
 =?utf-8?B?SmNBaTBydGtIc0UrZS93VEVMNjN5WlE5Yzd4VUl3eEhRaFFkSzBiZ1pqOGp5?=
 =?utf-8?B?aWNaL1k5dEVRWVF6RlFBRmJCQWx4S1ZQeUxpK2RmTXNxV0w4MnEyQXBFMVJL?=
 =?utf-8?B?VVJBUllWSU9DYmVqcnpJeUw1RUtzcGlmdjEvSVZTaFVEQ0ZidWVWcThPdzBG?=
 =?utf-8?B?a3pqU1c0RjdEcW0xV2Fid3d0ZzlMeFBxS1M3SVJoTVRndGRSN0VXV1M3SDJK?=
 =?utf-8?B?TnJ1MUdKelh0YkhpcE1NZkRmdmNkQ2Y0Z3pkeFFGeHJJbk14eXczZnN0czFo?=
 =?utf-8?B?ZFJaUGt5N3RqMnlRczdmdWNvazRZK3B6ZGFYakxPZEJmNElJRVQxaDNpL0JW?=
 =?utf-8?B?cEw2ZFpMcnhTUVNLUEJTdkpsYitXRDQxY1BDSGhpNFlqY1NSVE9QMGlGQTFH?=
 =?utf-8?B?TkV0ZEc5R1I4UFlqL0NxclYvTVFLZWFsRXhWRkVGamxhTks0WkdqUUlhU3VJ?=
 =?utf-8?B?WS93aDRNYkR6a1A2T01VMSt0VE5uSHNGRFFuODVxUmxueFhBekt3S1gweTF2?=
 =?utf-8?B?c3hQWlVxTWJSSGNUcm5Bbm1nM002dEJQQ0hQT3JGeVE2OWdqNlQ4Kytxamlr?=
 =?utf-8?B?d3grVUFNR294RHFWL0JGZzV6Qjd5MmlqUlh0RDVXK2F2U1JXdkxoU050MGtP?=
 =?utf-8?B?SGNvRi9Lb0FONWhFa1I4ZXVLMzIrYjdsUkVENXdBdUkyaXZQaTc2TkFiaXMv?=
 =?utf-8?B?TzBNYUdmQ1M3MElLbUpUVUh4SkI0d0paZHA0akNrOFY4WVlERDhLR2ZhZjlK?=
 =?utf-8?B?bExpNGxuZnZmL3FVWEdtcms5L3dkOVNtRUJGTE5hOGJJd1dVVXRWZXM3OXdu?=
 =?utf-8?B?WlBneXFweU1HQmc5UUEzNDQvR25SbUdmN0dZalA4V1l6d3N1VHkxYU1HcDd5?=
 =?utf-8?B?a2hTc09lM202NUhpMzZWYk10VVhlRUl5N01GenNJMUg1Wit2elFJa1d2UGtp?=
 =?utf-8?B?Y2l4Z2dFdGVuOGRnLzJQaUljRFByRlNDRTlSQXJEVkRSRUpjYXpYaTZPN295?=
 =?utf-8?B?anNmalRqdk1JVUdsdE5KSExQMHR1WkhEaHE0VnAxWkdnWUxPY3JycmNWWmRV?=
 =?utf-8?B?MzM2NkdaeTNBbWp4YTF4Si9oUFJmOHIvYzVuVWlRNkxYejJrY0lJL0NCMlpo?=
 =?utf-8?B?S1MwNXA4czFqTWtRYlZ0K3FvNnNJN01LYTd0M0RVSlZUS2NqSkNBNXNDNFF6?=
 =?utf-8?B?SkdKL2hGR2RSb3M4bEVIOGtXcFR3bzBTNVowdmFnMTBuaTFmVnJtMm9Gd3RQ?=
 =?utf-8?B?QkNNaGJGZ0dpekhIQTkxL3JlbWxwSXAyVFhXSGFuQ29ZekF6bGRBbUxEbVVO?=
 =?utf-8?B?ZlVVUENubWh2ckVNcXJ3MzFidWEyRTR2Umo3bGQxOXRJcnlUeVJMb1RFQklo?=
 =?utf-8?B?MGpjWjl2eEtFWTMyb3lMaG5EWFc0YTV6UC83WkZldjcxV2grUUJaem9HTmZM?=
 =?utf-8?B?SDlLVDY5SFVNYlF0SEFxY3VLakg2aDFHenh1NHMwUU9XYUZOK1B3a2xlQmM1?=
 =?utf-8?B?K0x2aFZudVBZRFRkSCtTeUl2NXZTM2QwVWs5dDNLUXIwc2EvZlNyT0gxSVV2?=
 =?utf-8?B?Z2hkL2xmaUV0TFNaNU1vMmp2RGoySHA0NytEb2ZEUEh4UnF0eXJnQkIzTkVq?=
 =?utf-8?Q?ztOLnCHKYuZBPK3Jzs=3D?=
Content-ID: <F26DDAB18054BD438678BBED0DCD8FAD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 294c2d41-0b0a-429f-b149-08d904413f05
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 21:14:12.4849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TdyhZFishppDk72GrJChuMmZZtK0XTiCdF0c2nTeLY35KoRqSawcEs83kzc/8dT9ro5UwhdfTT8fMJvDqlRvIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_141426_275889_3E800BB3 
X-CRM114-Status: GOOD (  20.91  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On 4/20/21 12:07 AM, Arnd Bergmann wrote:
> On Tue, Apr 20, 2021 at 5:10 AM Matthew Wilcox <willy@infradead.org> wrote:
>> On Tue, Apr 20, 2021 at 02:48:17AM +0000, Vineet Gupta wrote:
>>>> 32-bit architectures which expect 8-byte alignment for 8-byte integers
>>>> and need 64-bit DMA addresses (arc, arm, mips, ppc) had their struct
>>>> page inadvertently expanded in 2019.
>>> FWIW, ARC doesn't require 8 byte alignment for 8 byte integers. This is
>>> only needed for 8-byte atomics due to the requirements of LLOCKD/SCOND
>>> instructions.
>> Ah, like x86?  OK, great, I'll drop your arch from the list of
>> affected.  Thanks!
> I mistakenly assumed that i386 and m68k were the only supported
> architectures with 32-bit alignment on u64. I checked it now and found
>
> $ for i in /home/arnd/cross/x86_64/gcc-10.1.0-nolibc/*/bin/*-gcc ; do
> echo `echo 'int a = __alignof__(long long);' | $i -xc - -Wall -S -o- |
> grep -A1 a: | tail -n 1 | cut -f 3 -d\   `
> ${i#/home/arnd/cross/x86_64/gcc-10.1.0-nolibc/*/bin/} ; done
> 8 aarch64-linux-gcc
> 8 alpha-linux-gcc
> 4 arc-linux-gcc
> 8 arm-linux-gnueabi-gcc
> 8 c6x-elf-gcc
> 4 csky-linux-gcc
> 4 h8300-linux-gcc
> 8 hppa-linux-gcc
> 8 hppa64-linux-gcc
> 8 i386-linux-gcc
> 8 ia64-linux-gcc
> 2 m68k-linux-gcc
> 4 microblaze-linux-gcc
> 8 mips-linux-gcc
> 8 mips64-linux-gcc
> 8 nds32le-linux-gcc
> 4 nios2-linux-gcc
> 4 or1k-linux-gcc
> 8 powerpc-linux-gcc
> 8 powerpc64-linux-gcc
> 8 riscv32-linux-gcc
> 8 riscv64-linux-gcc
> 8 s390-linux-gcc
> 4 sh2-linux-gcc
> 4 sh4-linux-gcc
> 8 sparc-linux-gcc
> 8 sparc64-linux-gcc
> 8 x86_64-linux-gcc
> 8 xtensa-linux-gcc
>
> which means that half the 32-bit architectures do this. This may
> cause more problems when arc and/or microblaze want to support
> 64-bit kernels and compat mode in the future on their latest hardware,
> as that means duplicating the x86 specific hacks we have for compat.
>
> What is alignof(u64) on 64-bit arc?

$ echo 'int a = __alignof__(long long);' | arc64-linux-gnu-gcc -xc - 
-Wall -S -o - | grep -A1 a: | tail -n 1 | cut -f 3
8

Yeah ARCv2 alignment of 4 for 64-bit data was a bit of surprise finding 
for me as well. When 64-bit load/stores were initially targeted by the 
internal Metaware compiler (llvm based) they decided to keep alignment 
to 4 still (granted hardware allowed this) and then gcc guys decided to 
follow the same ABI. I only found this by accident :-)

Can you point me to some specifics on the compat issue. For better of 
worse, arc64 does''t have a compat 32-bit mode, so everything is 
64-on-64 or 32-on-32 (ARC32 flavor of ARCv3)

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
