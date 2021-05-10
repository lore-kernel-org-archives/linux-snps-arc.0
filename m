Return-Path: <SRS0=C+4U=KF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795F7C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 19:50:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E7F661288
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 19:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E7F661288
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VDl8MYseO50YXyeHdMLtW8ZVh2t+AyOxFav3pFBW66I=; b=on3EfGqERRaSSKBAIcBWGBSkD
	8sJp9pUOtfninVujfVO4ewnPiZoO7BshshU0bBwhQIgx7l2U1bd3Dr1FCCWsaqQbuc7mzeItty2rO
	cQhsiXQMykajBbd+P6V5sQU7BT8ccGGix+ENqL2U6VK1f0dzN6yTXRCr8IabFlampR/xBak6wP/kw
	/rAPu1zdtF6XRka1k2bqdWTO4Hjc6wBtz3nQkr1VVOZihLmjCojBDTsAxsnjSf7gRbZHRNdnDTDDu
	s++LbW+W3xfLg8xnH+cEiK2WK5x/hXc9yAF86t79iIsQ9swnzeUbHZplS2C1smucjgi2po9fYXv4+
	lC+cYs6qA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgBuu-00Fbrr-Iq; Mon, 10 May 2021 19:50:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgBuo-00Fbr2-J9
 for linux-snps-arc@desiato.infradead.org; Mon, 10 May 2021 19:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Description;
 bh=btA7VbGZsIA1ZcSoeToSSD0M7j7Gj4F8ach+f/ygVRY=; b=0Iawb+llBjuw77Yo8y+gEdApzL
 0ntMlOB/ugeitSf4uQoSHTIfPm1HdCyqdl7w0U2DXgu8o/KIF7R9o2ARdcPKN30JtzuyPL1wrw/JN
 bEis6zYRRPV/ab/2cjj4yBNpu1WFiitczQWGp3aDJJm1ym8ALcWybrZXRWpoFpExMRV6S/z6YMjns
 zPaiJoU6qv4QAdEXvxxnwNMh+Iyn2emwNNQLKVuuqpIVvUnA9KG+Y/ZkzR8rSXSspvc+Z1MK/YqtR
 hHCIoVnj2akfcJKaOnqM2qg73Hy3SKRGu3JKvpfbxkxzlgK7lA5jigJFLUZlhd6t1VsoPXvuVXf2A
 P4abC5OA==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgBul-0095LC-B6
 for linux-snps-arc@lists.infradead.org; Mon, 10 May 2021 19:50:04 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CE51D4016B;
 Mon, 10 May 2021 19:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620676203; bh=btA7VbGZsIA1ZcSoeToSSD0M7j7Gj4F8ach+f/ygVRY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=BuIf9e81OFOic5K3cZSEpf3SCNPrqVSKcDV07dtZAG9QRxnwZKNBgzUHDuGypbrw5
 kiL90iF/t3yhd3cj80Mr97Z31TcgD6KBaHQzvGe1/oDAd6F8XspGkTDyv2/4B/GqCK
 Qbk+aHbDvtyqVjW4a9i/5kB0ZwaXJU/C4ot0mUjIxUBbfE1IhS7Bm5YLeLfoBX2gpG
 UXkh8L1NwBr2FqryaaZVXvShTyZmXYiaDzHJix6AmxyU83efG4KL7QKPnUn3rtru4k
 hfhWv2nLgijx/kur3zNSMnY9B8uLqXUzCXCqKHoX4F8tJ4q5LkTrg1RnawChhTB9ss
 nicgGokwBEGbA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E1B99A00A8;
 Mon, 10 May 2021 19:50:00 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9995540139;
 Mon, 10 May 2021 19:49:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="RO42zOjk";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyWK7hMfuNquLC2FmNTG+xUMRuaph8LZUa+yKLMW9qb7aBLmQj9TdkeqritcnYQ0+O7Ukb9QEBFTlvyT99X5Sj0gfdnY3YaSa9tuS1/j/MRO5abeoVow9LxR5DUGhpErlV/CERedbldR1zACdD+qg8TLqW7uHmqMdGF59rfuTtk6j5DjfWdDRk9SGfyeO2qUsSSbLAsxHcmqCcr1DYNTgVVKXxgjsY3njY5qNy1tn/FwvvjJsDAwJM921gN+YZ+AE/OhRV1irumX6p9D/TyN692b9RkIzGgEq37FtApj/RoEOdw2wB4yLPCjHB2aZyuFvzR/1sxYADIIFQtXzUMaag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btA7VbGZsIA1ZcSoeToSSD0M7j7Gj4F8ach+f/ygVRY=;
 b=oWXz45Of+QwgJKLN9cUBsT4F2x7D+7vq5J/htpS/fr2fEr8TQltVGOJiSCeil1NcFSqNdNR8XPIFuxr2rceh/2L42hEqDc7PKRwci4gAm+TlSp8muhCoB88vf8vC0vvt3tMWQIaho6xwQKhYMEi9BlaYF1tmKLP85zrjKUoc2PWjDong6y3R2GdIQ/SNjNMaRneuBWOQp1XOSBra9jnATnwOHzDadzoWaCDKfw73ek8HePgaNRQDjsOu9G48zKP/WtZdRoU5nB3lXpFAiBC3ZqDaSyVuEAuiXKWx7tnnrfVDUcGqzyNIvGCbeINpuUAq+ZYAKrrQ7PgLNP9gRj20xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btA7VbGZsIA1ZcSoeToSSD0M7j7Gj4F8ach+f/ygVRY=;
 b=RO42zOjknO3d2u3Cu6b+U3CbBocFKQU9bjTq+3VbJW0rX3W2j7IH9fXdV1qPDlxHcD1tU8pMyK4x1OQ0Y8WHg7350/vUvaXs2dIxhTUud5+AZSqFyDOR+slfy9AmAmaYA5StW9Una0zJAfBKfYjeOFcPFdU4qM2DjvRROpL53Ic=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2629.namprd12.prod.outlook.com (2603:10b6:a03:69::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30; Mon, 10 May
 2021 19:49:57 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 19:49:57 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Vladimir Isaev <Vladimir.Isaev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
CC: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2] ARC: Use 40-bit physical page mask for PAE
Thread-Topic: [PATCH v2] ARC: Use 40-bit physical page mask for PAE
Thread-Index: AQHXO16okJPGilDbKkCQWeJzblHZjKrdNJAA
Date: Mon, 10 May 2021 19:49:57 +0000
Message-ID: <4cff46a0-6e25-7a34-f67f-983e2f5fb08d@synopsys.com>
References: <20210427121237.2889-1-isaev@synopsys.com>
In-Reply-To: <20210427121237.2889-1-isaev@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53c9b317-7f5b-4828-75e0-08d913ecca1a
x-ms-traffictypediagnostic: BYAPR12MB2629:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB26290EDE09649987F9CF6BAFB6549@BYAPR12MB2629.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:31;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fUtaHLKoawQzZqBi+UQHjb/12I2KbPjP2/mkyCfACoDzI7aCjd7Aavg3IX6JEvvcOh8owGpPxLKulb5Jw9ynckA8NuyjHKiMI3jsRCIs1ctrWknkvLTGDpBntRkQ1VEYBvLecSQWG2M0f3E4ilqWL7tHYS6gfRW47ijFXLUSIVMBc7D//hIxUGyJbIGW4e176dGTw7b67uGazRci9KmBN3+jdMANdX8YfC3ERDW2QltwMgHi9LVB+sulbqaEFlKXuyGayTOmOaIPFnukz9+D38ps+KFJunqNvurz9yQe0xaWtVXkbmqufRawMeua9ManamHTQ28YIQfu7IQif5hKoYB3xYYT2ePZn6LhWoDdNt0Gfexn9FT2G0v9hD8ok/M3Gr0/TL15hUDvQpP8SmkwnuGQur75FnYP4jK+HPTeIxpgC69fCRf97yWdDFBBD8mW9qRp0D9uk/QN6NN5hIeb/IOkhY0hmLO8ZYSc+dcnL/aD63yd06ZySlINdZNG91btqrpNV7G5OQzEB4HLznldsw9MxwaXP8Es/ZSBId2ov+7Z+pNfbYFfrPOXSmO4rt+kLRDPETXsG5yuiVCtD0/7b09ToItFmFP+Yl6O5vpJFV9WwkIsr/up4VM6E+0E3EAmFo3tD5maPGJ+b7+qcXr23I/IY0SfxoZ954UcporuYYAPEgLO6lgaxcvY2LcxFmOt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(136003)(366004)(346002)(39860400002)(110136005)(2616005)(6486002)(66476007)(64756008)(54906003)(186003)(66446008)(66946007)(316002)(36756003)(66556008)(4326008)(5660300002)(6506007)(2906002)(31686004)(53546011)(71200400001)(8936002)(26005)(6512007)(8676002)(478600001)(86362001)(38100700002)(83380400001)(122000001)(31696002)(76116006)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VEdpVGFNaS9rTzNpVStvZHJTL2xoUm1wS1dMUUJ6OTEwcVplT2xOZ01zZWV2?=
 =?utf-8?B?blVPZm02TGQrUlUxYjNvajJZS0VRWllaMEFjR0NvZ2lwR3liY2xqVHlkOHU1?=
 =?utf-8?B?bWJEaFluVTdYNFNuM2NkTHpPamFlVm4wYVJYbFJucHpQU2Eyb3VqTXBnZ3hm?=
 =?utf-8?B?cjE2SHYraGhGRElvc2FXMDk2ZFdyUThMalJEQ0daL1MzSCtIcjF6N3czSmli?=
 =?utf-8?B?RVh1WGxYeGk0dFlsakRnKytDM1lvVlFKd0w5cGJxL1BJM0dzVFEvV04rTno0?=
 =?utf-8?B?S3BlRU5vb0F1d3h6eGdWRVJZTFVEaXZtRThJYlhXSk9zclh1eSswN1pLSllI?=
 =?utf-8?B?YlZTSWhlQ0oreTBnNE4vRVRzRDVRLzlLb0laM2tITFNEQXpEK3p5Mnh4Qy9v?=
 =?utf-8?B?aGlvejZyRkV4cnNoWkZ4Q3lQak9ucWJnQjVaTFlaaVJYWGRSWHRRcFk3VXZB?=
 =?utf-8?B?emxxSW1mSkFMektMZStwS1BuNjk1WTlZUmo4RXRLYjhuR2lSdjRuejdHRFVH?=
 =?utf-8?B?YlZtVXBPMVMwRGg3ZWZhU0NvZWxkK2t3K3hnZEw4YmI5Umd1RVdqN1dVc1Az?=
 =?utf-8?B?ZWN0MnRteDg0YWpSU3J1a1pxQ3E5OGdGRStDR0lHaXByRUluZzhVVmhaL2V3?=
 =?utf-8?B?NURxcW9BY1hlcGZYMndENDVFeEZpU0JVTnR3MTJ2emtUQnRlSk85S2RFeTcw?=
 =?utf-8?B?U1VPR0lZMWVkUUExN2E0OTc2YkdycnV1OGdWZTArL2ZmTzg2WDNVK3dnVHpt?=
 =?utf-8?B?MndHbFJyT2J1L0hrUzA1U0dLTXdzWGM2MEMzMTBNRGVxMGhMbitiVVNPVkh1?=
 =?utf-8?B?V3AzUGM1QVI5dFlqdjRYQm1HOUZtNW5pMzJ1am05RFRTYTlSamY0YW1JL2NO?=
 =?utf-8?B?Ym4xMEdzSGZvcjQxU285cGl0elFEWXFqeXJqTndWVkpRUUw1WVQyWjR5cHlO?=
 =?utf-8?B?UEJVVWhtV3VQZmQ0T2EyNjN4aCthZVpDM2NYME01cXZNWktUOXRMMW9PMFNB?=
 =?utf-8?B?Qy9aZ0VRSTFLMkdIdWUxT1NPWFh3Ky9Bdmc2bDljQ05BTSsvK1BIdmUyQVFX?=
 =?utf-8?B?QTNjOGR5VWE5WStSd2RHNms3V3BqYzRCL052cW0vTGkzYUhyVUtCbDRhcDVw?=
 =?utf-8?B?NW5MRThpUm9NR1g5Z3dRbjE4SW1qcjM3VWtxSkRLL1luYm1qc3FQdTlQZTU4?=
 =?utf-8?B?S2s3OEp6Z2Z1dFNZclMxbHFtRUw4aVZVNkpScEF4SFJ1V3owYWVodTZpV2hv?=
 =?utf-8?B?NEg2dUw5N1hWSk1yaE0zL2IvWXRVSDRzanRENTBBZTFsU3cyLzZ6WGMxNjRh?=
 =?utf-8?B?ZnVLRXVIWXMyeGVxWlQ0OFR1QS9rd3REOW95emR3NHA1SmJnV3MwU25CRFZn?=
 =?utf-8?B?VUpRdUdhSEZrT3N3YlFCcFFDOXM5TmNQV0lENDVKQVMxUFAyWHdHMjV4NU5u?=
 =?utf-8?B?ODl3QkMzOTM0QlZGNmk2QU1iaU5xU3hVeUVPQnFWdDVudmpndGhJQmVXdHBY?=
 =?utf-8?B?QytkM3RJRDF0d2lRQktpL3hBakVHeGZnalNiVGlTN0NNcXVoMUJ4dk8wOEJl?=
 =?utf-8?B?ZE45THo0RWpseGExQnVRMmZsaTcrOTVDK24wWWNQZDVqd0xPYUlWSjNRekZN?=
 =?utf-8?B?L0NSOER1TWhMYjFLNllwYkJJemVJQ0djdjVuTFp6Rm1wckxZQ2wzOENwMzBX?=
 =?utf-8?B?bEtLSTJqM255Y3dua0Z6dUZ5bytKVnBIeWFJRGtybmVCUGcyWkM1cG9yK0Mr?=
 =?utf-8?Q?1cNF7hifr/IXrSvBVE=3D?=
Content-ID: <D95BC756D289F449B547E62D18F1ACFE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c9b317-7f5b-4828-75e0-08d913ecca1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2021 19:49:57.2098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y7siIfvJ9MSbIwNLhhsJYuLJcUi/PhY8udRz+678DzWN9qlEzjKIkDWqzBEj8MpEGj4Hw4Fn2JPJxwL1vL10RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_125003_411841_4894C2C2 
X-CRM114-Status: GOOD (  23.59  )
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

On 4/27/21 5:12 AM, Vladimir Isaev wrote:
> 32-bit PAGE_MASK can not be used as a mask for physical addresses
> when PAE is enabled. PAGE_MASK_PHYS must be used for physical
> addresses instead of PAGE_MASK.
>
> Without this, init gets SIGSEGV if pte_modify was called:
>
> potentially unexpected fatal signal 11.
> Path: /bin/busybox
> CPU: 0 PID: 1 Comm: init Not tainted 5.12.0-rc5-00003-g1e43c377a79f-dirty
> Insn could not be fetched
>      @No matching VMA found
> ECR: 0x00040000 EFA: 0x00000000 ERET: 0x00000000
> STAT: 0x80080082 [IE U     ]   BTA: 0x00000000
>   SP: 0x5f9ffe44  FP: 0x00000000 BLK: 0xaf3d4
> LPS: 0x000d093e LPE: 0x000d0950 LPC: 0x00000000
> r00: 0x00000002 r01: 0x5f9fff14 r02: 0x5f9fff20
> r03: 0x00000000 r04: 0x00000a48 r05: 0x001855b8
> r06: 0x00186654 r07: 0x00010034 r08: 0x000000e2
> r09: 0x00000007 r10: 0x00000000 r11: 0x00000000
> r12: 0x00000000 r13: 0x00000001 r14: 0x00000002
> r15: 0x5f9fff14 r16: 0x5f9fff20 r17: 0x001855d0
> r18: 0x00000001 r19: 0x00000000 r20: 0x00000000
> r21: 0x00000000 r22: 0x00000000 r23: 0x00000000
> r24: 0x00000000 r25: 0x0018a488
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>
> Signed-off-by: Vladimir Isaev <isaev@synopsys.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: stable@vger.kernel.org

Applied to for-curr !

Thx,
-Vineet

> ---
> Changes for v2:
>   - PHYSICAL_PAGE_MASK -> PAGE_MASK_PHYS
>   - off variable in ioremap_prot is now unsigned int and uses PAGE_MASK
>   - Revised commit message
> ---
>   arch/arc/include/asm/page.h      | 12 ++++++++++++
>   arch/arc/include/asm/pgtable.h   | 12 +++---------
>   arch/arc/include/uapi/asm/page.h |  1 -
>   arch/arc/mm/ioremap.c            |  5 +++--
>   arch/arc/mm/tlb.c                |  2 +-
>   5 files changed, 19 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
> index ad9b7fe4dba3..4a9d33372fe2 100644
> --- a/arch/arc/include/asm/page.h
> +++ b/arch/arc/include/asm/page.h
> @@ -7,6 +7,18 @@
>   
>   #include <uapi/asm/page.h>
>   
> +#ifdef CONFIG_ARC_HAS_PAE40
> +
> +#define MAX_POSSIBLE_PHYSMEM_BITS	40
> +#define PAGE_MASK_PHYS			(0xff00000000ull | PAGE_MASK)
> +
> +#else /* CONFIG_ARC_HAS_PAE40 */
> +
> +#define MAX_POSSIBLE_PHYSMEM_BITS	32
> +#define PAGE_MASK_PHYS			PAGE_MASK
> +
> +#endif /* CONFIG_ARC_HAS_PAE40 */
> +
>   #ifndef __ASSEMBLY__
>   
>   #define clear_page(paddr)		memset((paddr), 0, PAGE_SIZE)
> diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
> index 163641726a2b..5878846f00cf 100644
> --- a/arch/arc/include/asm/pgtable.h
> +++ b/arch/arc/include/asm/pgtable.h
> @@ -107,8 +107,8 @@
>   #define ___DEF (_PAGE_PRESENT | _PAGE_CACHEABLE)
>   
>   /* Set of bits not changed in pte_modify */
> -#define _PAGE_CHG_MASK	(PAGE_MASK | _PAGE_ACCESSED | _PAGE_DIRTY | _PAGE_SPECIAL)
> -
> +#define _PAGE_CHG_MASK	(PAGE_MASK_PHYS | _PAGE_ACCESSED | _PAGE_DIRTY | \
> +							   _PAGE_SPECIAL)
>   /* More Abbrevaited helpers */
>   #define PAGE_U_NONE     __pgprot(___DEF)
>   #define PAGE_U_R        __pgprot(___DEF | _PAGE_READ)
> @@ -132,13 +132,7 @@
>   #define PTE_BITS_IN_PD0		(_PAGE_GLOBAL | _PAGE_PRESENT | _PAGE_HW_SZ)
>   #define PTE_BITS_RWX		(_PAGE_EXECUTE | _PAGE_WRITE | _PAGE_READ)
>   
> -#ifdef CONFIG_ARC_HAS_PAE40
> -#define PTE_BITS_NON_RWX_IN_PD1	(0xff00000000 | PAGE_MASK | _PAGE_CACHEABLE)
> -#define MAX_POSSIBLE_PHYSMEM_BITS 40
> -#else
> -#define PTE_BITS_NON_RWX_IN_PD1	(PAGE_MASK | _PAGE_CACHEABLE)
> -#define MAX_POSSIBLE_PHYSMEM_BITS 32
> -#endif
> +#define PTE_BITS_NON_RWX_IN_PD1	(PAGE_MASK_PHYS | _PAGE_CACHEABLE)
>   
>   /**************************************************************************
>    * Mapping of vm_flags (Generic VM) to PTE flags (arch specific)
> diff --git a/arch/arc/include/uapi/asm/page.h b/arch/arc/include/uapi/asm/page.h
> index 2a97e2718a21..2a4ad619abfb 100644
> --- a/arch/arc/include/uapi/asm/page.h
> +++ b/arch/arc/include/uapi/asm/page.h
> @@ -33,5 +33,4 @@
>   
>   #define PAGE_MASK	(~(PAGE_SIZE-1))
>   
> -
>   #endif /* _UAPI__ASM_ARC_PAGE_H */
> diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
> index fac4adc90204..95c649fbc95a 100644
> --- a/arch/arc/mm/ioremap.c
> +++ b/arch/arc/mm/ioremap.c
> @@ -53,9 +53,10 @@ EXPORT_SYMBOL(ioremap);
>   void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
>   			   unsigned long flags)
>   {
> +	unsigned int off;
>   	unsigned long vaddr;
>   	struct vm_struct *area;
> -	phys_addr_t off, end;
> +	phys_addr_t end;
>   	pgprot_t prot = __pgprot(flags);
>   
>   	/* Don't allow wraparound, zero size */
> @@ -72,7 +73,7 @@ void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
>   
>   	/* Mappings have to be page-aligned */
>   	off = paddr & ~PAGE_MASK;
> -	paddr &= PAGE_MASK;
> +	paddr &= PAGE_MASK_PHYS;
>   	size = PAGE_ALIGN(end + 1) - paddr;
>   
>   	/*
> diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
> index 9bb3c24f3677..9c7c68247289 100644
> --- a/arch/arc/mm/tlb.c
> +++ b/arch/arc/mm/tlb.c
> @@ -576,7 +576,7 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long vaddr_unaligned,
>   		      pte_t *ptep)
>   {
>   	unsigned long vaddr = vaddr_unaligned & PAGE_MASK;
> -	phys_addr_t paddr = pte_val(*ptep) & PAGE_MASK;
> +	phys_addr_t paddr = pte_val(*ptep) & PAGE_MASK_PHYS;
>   	struct page *page = pfn_to_page(pte_pfn(*ptep));
>   
>   	create_tlb(vma, vaddr, ptep);

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
