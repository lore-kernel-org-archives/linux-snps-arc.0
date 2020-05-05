Return-Path: <SRS0=QvW+=6T=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E729C47247
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 May 2020 23:01:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEC5D2064A
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 May 2020 23:01:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LYQ9GvgI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UXuUPFqj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DB0tyXg3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEC5D2064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KX7TpqMHckutKukJehdXV+CbJq0wr0ZHZGyQHTcL+NY=; b=LYQ9GvgI126HR1
	mJS+b2aZ9EbsG+7tIHTVKoPfmwI2qs7Vd665nMWfS3zBh/LF6O08dhi3xqnW/56huVuT/U4Y96vBS
	DvxhZqiI/L8b6Jt2LCZmxZDSDew9dDJs58guly67nJNpGm//R9QLcRoUX+7DtU3NsOwvgXB/4UZMF
	oJL6JgCaHGWXU/iepvclEuIzmfHmYjihPldO2eSvgJ04i2QNZ+GvdB/J4+mS6q2AvtUe9GjJwKAwy
	3AJEQ6XKQZB2x/yulG6jHLYhVLCgYY2H0ttMuRwYbbVQFl8NowwdeVwrotu6muhNaaKqs7LbkVKrH
	WQE+lpZvJb6olNq2mD1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW6Yk-00012T-U3; Tue, 05 May 2020 23:01:06 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW6Yi-00011U-MG
 for linux-snps-arc@lists.infradead.org; Tue, 05 May 2020 23:01:06 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F38D6C138B;
 Tue,  5 May 2020 23:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1588719662; bh=SKXp6OPUVq3qAc10MTM9HPiHAQU+RxFislh+D5nxWPY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=UXuUPFqjK5nr17XNoJYCZzy9ayTER89Pw5jRQdj13BYH2HRZQfqEn13r6afSq00c6
 zcJ9eB81Cecs8rJrtr/HVWNsogngYJoTQpjovE61vdnrfc+mUwdnStMvawDvyRYl9E
 r3F+HyNYY0nBbypVYOrBF9lHGC5bSBl91ytCsnvN3BuFP4uKGwIErMsRM2zwYDNrJh
 cYF3Dg2df2gKJd0Q4WoY0OtPEWN8cU+mGZwYtcLSit/kLbx7eatNZ7gh1F2haWlaZA
 uHjMn+iqx7ykyR0IGs/dFJTtLQOAbn7bpWpwpQsqMlle2x7LWTokzo+A69h+/S94o9
 mEbJiJhIFghYw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5FA51A006E;
 Tue,  5 May 2020 23:01:01 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 5 May 2020 15:59:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Tue, 5 May 2020 15:59:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXyi99JnNKuHEHIgAqoXCC3gWK5fDvvOP1tbd0YtAIu/xqZooF6yvCnjZ9EkHqGoRZvEUoNiL+owt4/BEa5yks34KehtAE4AoF7QMRFBTkZPATsrUUIV9s45DfBZxTIElQy9R6o39NoLuvF7AT4apAtPAKhqSBh/SA/O5GojiIZxcMb4JsQA/1+sDAVA7khFKA9noG8cMEQo+8sVUWvuquZhzbd/RU0xs5SLa/LIWRCyDgKmN6nJpPisvQh3333ZTnGPK8MyfHN9LA/LyDS2HFK6Fs9z4hjoRxhdBeYbsDMljULGRsV1Tx+0vg2zhIp8RxyXzgDpsDzDJtqBLnsqKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKXp6OPUVq3qAc10MTM9HPiHAQU+RxFislh+D5nxWPY=;
 b=IK+JksNITFw92Lj/u2bAxMaXuEUX30EvYxBJr4Hz4MvzKYujgp9FvdZRLWJAZtchXTxWU8iPI7F5BWmy0XbK3E/oii3UGt32F2JJ9iWrKVtNneWR6vZaDAeaBqMelK87Dz5DB2O8MLmslSqH0QDc7x7u6I/nWwB9vxLNPGdIzeJGtu8bUg4fgvFmhnrgANcNMEcIkw5Z3n18GMt2djU0ORXGXT0u4F4UE8kW3igXKr5Uj7HOwnBYfAhDoCCtRi7nxXx2nt+q3hWWXxLyArbiIfvc2XnjT27ApIDfJQ2NfT0ZAmqDfUDIkEz7mkeEwwa2IauVy7e7PEVh3c5sA9JSjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKXp6OPUVq3qAc10MTM9HPiHAQU+RxFislh+D5nxWPY=;
 b=DB0tyXg3gv+eMiNfal+IJi6LS/INPeZbipO9Oy1jHVCaLzTvHdsAMpMG8GvqNsV9pWk7IUyHnvdYVrPYKsUV8SmovlYTuUn9rBGjj6OJypjxW6n+s8IktY9yX/ogIwhyepz/azi52ER1+Y8v6C+9gZlidx0+w5kolNUJlqUfv+k=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3462.namprd12.prod.outlook.com (2603:10b6:a03:ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.21; Tue, 5 May
 2020 22:59:35 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.2958.030; Tue, 5 May 2020
 22:59:35 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH] semaphore: consolidate arch headers into a generic one
Thread-Topic: [PATCH] semaphore: consolidate arch headers into a generic one
Thread-Index: AQHWHN86ZIIk/t9jLEuG1kf02EfpF6iZ5pcAgABBWgA=
Date: Tue, 5 May 2020 22:59:34 +0000
Message-ID: <9b8f822b-0df7-d3b2-eb6e-eaa07216a589@synopsys.com>
References: <03f4a9b3-b1ca-90fa-0b6a-609a3135267d@linaro.org>
 <20200427215938.14136-1-vgupta@synopsys.com>
 <ac93c301-36d3-b20a-d31c-50c1f3264c68@linaro.org>
In-Reply-To: <ac93c301-36d3-b20a-d31c-50c1f3264c68@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ca251e3-5aea-4a03-ec18-08d7f147faf6
x-ms-traffictypediagnostic: BYAPR12MB3462:
x-microsoft-antispam-prvs: <BYAPR12MB34628338C8E42BFC6223C170B6A70@BYAPR12MB3462.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0394259C80
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YWP6UNX1M+JfBeWJhQV/JgzQe0m+ZGkZ7XNJCsSP77tAPeb9LQ5dNUd7Abx3E6oJmP2ueIQgJKmAsnglJmLt/fsAI+mrRF7YjY63CpPLjV8/Lg5joS/SvCx/SIV23IWirO/yk+4clF7yckwlnGr1o9P0ad2pdqhTQFEOK95sbP7/9jTCs8nk4WkyS8Otu1A1jfPH8Z7DTgd1sQFS+r/PQrQ+bJubEvQ7AVnyQO678fnfcW0VohQYdT/opGBgKZ/ZZu47VjTNybpTsPHFnLEHUEIerF2f2SlyizbBZdh5JEc1gozth071dpEvWPbxRtPPB0PPux9Q//MV8qiJYMPiouqdI0jBEK3Y8GWowTGIxG1hT5B+KzbujuyuBuJmun+R4Q0Igkg0j71PdBLc8bBszFQfcVcUOGO/BhSfz4IwiPigjfitWUdf66gP9vW/7jmiO5Aob+Ib07BGro++yxowX7E7o8lG2F6WKOemFkCeXzzEuwhARtk9/isU21DzGThgd5F5O0hNXHkaVhncRSQNXGKJ1O9Q1GlHZwZF4htVQlzrxpeiVQ+KSNCVS23tdFU2saJ+CybA0tTSDsm7XxlZxA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(39860400002)(366004)(346002)(396003)(33430700001)(53546011)(6486002)(316002)(31696002)(186003)(110136005)(4326008)(64756008)(76116006)(86362001)(71200400001)(66446008)(66556008)(66946007)(2906002)(66476007)(36756003)(6512007)(4744005)(6506007)(478600001)(8676002)(31686004)(5660300002)(33440700001)(8936002)(2616005)(41533002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ZIqM3foQxbcmX0jK5ZyVJ6WKY2OsBK27dqv9KwhEZ9JPCF1U1AFd5Sh1FYs9QmtDogRo3RWd1GLblG+hwVp6+y6tAHpnyXmb8xZ+/RJCf496NVUwQvmIiMHpm0Y2gfdwFXQhXMi7FWWUV0J/mS5mGQgOL00OE4mGXPR0Umjirxl8w6v4I0WfBF1SCOXjYMkgIF0fIz9p4fPo514/89Q21Ef8T2ziR9OH2boCNIP8nLsYNDjNB5+qXBoPCPJcUiophGOw6CrQ5DW6Veyd1nvEUIzAbglZHjcYMDAwrTIb6uVGTE3IAr5ddZ6wJwHv3x0W11hmHpl7e7E0kHq4jBHgXGs0xxBzsXsYT2iTczsbHTnCwRNpHQ5n8Nh4QJu39R6VOEhijoBN92wPRrGcFNdpNrolgkxoPzP1o+cT/9D6t3A79p0oFr8rylssPxbNJ/fp3GQw6c3qOuIrahdqurpbZsTGXbLlzu7BfTTq7ClGkJHZpJpfXcyfCxFayzrZqj5bqLRHpKZHLHJPIehO9q2QezT/eWHBLyboQo9QwVwOSvoqSgiDpqwuRkM0uB3IsyI/cdjLllFjhCGhM2+EjaCLrJGfNixLuHEB1qngay+YJsOYoWzCeaOyK4UvHaFXWaxNwHWTNV5UyiSqfBGAkLOUWo7oI3kJiQSsDJ77cfk32PFrVYvbnEX5RYGf5sAlqxP1WF9nvTIiIM7BOPiAeLMOtrRXO/ovyIaYxGJ2HUJ3MpE7Tx/6NgVsKsHPyuMhIam1EHLb7mrdaG3gCyo5uW7NQkNvQGpSnj5Sd2WDiYXEohumUnwKBjWCuOI7zHK3qtI+d+zO9Hcu9OhQtXnPUvTBeJzZxBe9gihuhz2UBNJlCz8=
x-ms-exchange-transport-forked: True
Content-ID: <DD729414997BB042B4CD90BB724AB380@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca251e3-5aea-4a03-ec18-08d7f147faf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2020 22:59:34.9833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HKYNXeu6Iq+EPdCRUPxuxQxtVTKLze5TO1dcxGlWovTCIX2E3fB+tTGspdigWP3dbSGotGEEqk2p3QgZ3kqaiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3462
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_160104_863456_9BAAE030 
X-CRM114-Status: GOOD (  10.86  )
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

On 5/5/20 12:05 PM, Adhemerval Zanella via Libc-alpha wrote:
>> diff --git a/sysdeps/s390/nptl/bits/semaphore.h b/sysdeps/unix/sysv/linux/bits/semaphore.h
>> similarity index 100%
>> rename from sysdeps/s390/nptl/bits/semaphore.h
>> rename to sysdeps/unix/sysv/linux/bits/semaphore.h
>
> Ok, although I think we should handle as a new file: add a online description and
> remove any 'Contributed by' line.

Ok did explicit add/del but still git rename detection triggers, this time
matching it to x86 version (with 90% similarity). I'm pretty sure in the past
delete/add used to elide renames, perhaps the heuristics have gotten better. AFAIK
there is no gitconfig setting to disable the rename detection.

...
 sysdeps/{x86 => unix/sysv/linux}/bits/semaphore.h |  5 ++---
 sysdeps/unix/sysv/linux/powerpc/bits/semaphore.h  | 40
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
