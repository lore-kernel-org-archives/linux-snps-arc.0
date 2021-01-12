Return-Path: <SRS0=SdQC=GP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E475C433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 19:51:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37AAB206C3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 19:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37AAB206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k6tEtuepnCNDtehAtIF0v4lmA6h3zDgX0FXK4Dpz7tQ=; b=KEQ6R9ftB8ags16M8Fjjdpy93
	5reAIEIuHsLSFFfhyAvf5CH3ycWy3Naa3xYvKfyv5RKwY0S4WvbV6R/2Crqb3y7eY99o7P5anyUnE
	hEVBiHvHVRSB0U6FwWV3aK3PdkKGU6cMPXC1lJtZsIjHFmw2hkkH7T6I/XdIYzcKBxW6P1hkk0WFc
	Amzn76i9o3P/DAs4vr418gC7Zm94KxnnVQ/ve1t9fkQUE+LvfatnStP4pCP7BnH1v3NFMyQTq/udd
	60R2t8wC+eYjrEsZiD+GJIUeKdB7xC3fwnCAhaMSg+3YOTq91mM/gBETybmMYK91INiPvJMuDvgQ8
	Q0ayALa7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzPgx-0004tR-En; Tue, 12 Jan 2021 19:50:59 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzPga-0004gp-DN
 for linux-snps-arc@lists.infradead.org; Tue, 12 Jan 2021 19:50:48 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 38567C0092;
 Tue, 12 Jan 2021 19:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610481029; bh=2sgEAl7qKwwJQj3ZlFCgAkQIulcETigRD8kTK+8mjeA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=DJIU3oV8cyHCxnCK7N2wji/lFeJ5FxFc1KsuknborMZnqC34lrDOK/akRPBKKg9cZ
 oka4qW76NvJPGIBZ6+0pULqoXKcBzxKjLmrl4k/Psx51oyEF1/CHAwnH0j8FHTXzSX
 2JGfLDvuoKSz9+14yQx4Ht7Q8mXJ3nHZI3e0eLCUJQp3E/YTXfg3OWy6azTKzHQZGZ
 J1T9S0tZ6h4ozFVQ/Ix40nCF29onYFbk5S7OpuIlko4vIPtHBlkp/Dz39r6P49fG+3
 BreiMVODwc51CHwn9TLUCBmFCmxfzCPbs6O3A7SXxpuwdPGHoMy8w9MSxq+kpRy3dk
 aRxKtDr/OAiFw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 10D58A0083;
 Tue, 12 Jan 2021 19:50:23 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6CF03800C8;
 Tue, 12 Jan 2021 19:50:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="TWHKYlzv";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVV7I6RME6WP42zIWFHE/zSPAUZBJpRCEKbJVmy3hcd6OTbn8SO7obd4c9hYkHZET+YKbybm1Gh9OQtd/K3PvJgJ6hS3IviAaIt4m21F4i/eWA51drbp3eMLidlNxJPZ7SUiQoZKrXtUOrfqzcucpDDasB86vFq30KRmgTiCrO9FXifaJ8Q0hrxkuF/SWq4ny2dl7dFO+38h0beksBvIxRp/lFphTA46vkdOwWcTzm9oVz4EJciD0zcmIg0YBTm1hybe7SFr339n6FSa91p+c0KpaLcWmciQGXzNRf5MU85d7wg8X3J4L1VuegqhIvaln7vywxCfLKNSeiLUYpNc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sgEAl7qKwwJQj3ZlFCgAkQIulcETigRD8kTK+8mjeA=;
 b=gxhQ8nyY/Ba7whGb+c4VIaLfeZrPKg6uqOVSEAG1zr9NPY4Hso+vKSxvuzRmy8fleHGVll1VIV4scR8UB2D5z6Xla5JfiAqJtvlyBOJzKy+G3lZ1QFRdsZKEkHUD3TkOk5gzkCMGgbvp3fZHOkskMp+tloGC48yps7E56wU/ZnWA2I2+tbi3dHiUeYsb4KdkKVAqUttuNELD3EJTE98xqdtLfXL/zf4kDULu+qxFlK6+vGdJH9yCmPEt9Jx531m3mMu8DjyP3cia5eKmI1Ppcx80v8OJ44efKbaPLyUY/SrKOAEZNOu/xhAr31cDYVgabCpaskcTIGKHEyrFIHcKhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sgEAl7qKwwJQj3ZlFCgAkQIulcETigRD8kTK+8mjeA=;
 b=TWHKYlzv8lnqQ+4E4MAygJPuhzWfrZAhCD2CmUnzSseJYNU+/aJlAbISYnnBOc66E3AnPA0iVSp+eVElXsk/iJ0xY/3zGTwK6ZKY9YF2xx7vVTdgROJ7dJZoOJmIrv95N4mRku/LgtiEENijiONC2YyWH4MhcbrOnkJwf1gHpgk=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2856.namprd12.prod.outlook.com (2603:10b6:a03:136::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 19:50:19 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c0e3:82e9:33d2:9981]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c0e3:82e9:33d2:9981%6]) with mapi id 15.20.3763.009; Tue, 12 Jan 2021
 19:50:19 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Paul Spooren <mail@aparcar.org>
Subject: Re: [PATCH] glibc: add arc700 patch
Thread-Topic: [PATCH] glibc: add arc700 patch
Thread-Index: AQHW3Vlgr4RE/sC4xkqlKcGY8Ycwa6okYu3wgAAargA=
Date: Tue, 12 Jan 2021 19:50:18 +0000
Message-ID: <83c2acb8-f029-f8a5-450d-a4080ded2d99@synopsys.com>
References: <20201225003616.11895-1-rosenp@gmail.com>
 <CAJLcKsHop76+H3uU8siRTKv9+iYx_vGF+Ov2821PO=e_+F54aA@mail.gmail.com>
 <CAKxU2N-9CeCqktMHsyaeNYa4T95AcDxAM2WOLKEkXabpbMjw5w@mail.gmail.com>
 <7BH2MQ.Y5B59E3281ZZ1@aparcar.org>
 <BN8PR12MB3330FAFDE68DCBC270F76EA3A1AA0@BN8PR12MB3330.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3330FAFDE68DCBC270F76EA3A1AA0@BN8PR12MB3330.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.75.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18bfabe3-181d-4016-074f-08d8b7334a50
x-ms-traffictypediagnostic: BYAPR12MB2856:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2856D92E7BE1297A63939B7FB6AA0@BYAPR12MB2856.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VB6vsp825V3lAgRwTbHVUxwCj7DKeEHbD+f4Nl3zhjGJ027trdmbmZ/asgIxJlPz3zBZzzaaijs8quLPkI9aO+18BJ2gZvBmcZJmVK2JIzpgEHTvt2W5bcDbsAVh8WayXzDmuyZak8LrLc1ma+21S4Sr6nk1HkqPNUUQ3mgDy5eiXMhJ7/s2ZjmrwpI7uC/zj+1opmeLXZHyb0P8U8IyAiJE1nOqA2dxFz5YGkqU8YxfAd0G1las2pFsDBE/JUAJKN0Tl1Kf4GCOL6DH/aO7VgY3E5iePk1NMgWQvV9F9xPOqIYK3FQDQImJwXUdFfWGga+x2BkIxXlLJ1ry3TW5dQFiPTb0VFIS8SsjWnjiQ0LUKUJ+QDzSa2PfrKGojLVR/uCi/6yIbmgTwwXMmXJEEynfP4lOIu5SU5/1FKDyZ0mwn/sYwn/JowrRHuM5ypbbT7vPVVmYuAQF/ykE1qV1T63DxM3kmntLE6/xzkrO8euyDMKo6b4e9d6FezsohMsgQS8KcRDU/GHFS+WCEGwEMxydlBr5V40gTMnrEmH4L0OchRlDZ1aidmvK2dKPich2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(346002)(376002)(39850400004)(396003)(5660300002)(36756003)(86362001)(66946007)(478600001)(8936002)(4326008)(66446008)(64756008)(2616005)(31696002)(83380400001)(110136005)(6486002)(26005)(6512007)(966005)(186003)(30864003)(31686004)(107886003)(6506007)(2906002)(53546011)(316002)(71200400001)(66556008)(54906003)(66476007)(76116006)(8676002)(43740500002)(45980500001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?OKVzyJi7tz6cXj9hHDfpnDoD34LxE3p0+IpDMrfeGPZ40AGSjn5my9EB?=
 =?Windows-1252?Q?xK7NR7Jfl04qPjmeCU7opD+zSl0gE5KvmWlAIlOjx/JyRLKFrJDj7PDR?=
 =?Windows-1252?Q?/1NqSbiyrDrvAIxIZFDrPg3/YjAoToiJVmMhytTbrDatXAtCgY/RQn2i?=
 =?Windows-1252?Q?u/vi165kPOm2hfVx8eqB/uePxO0HedCiCYj5GcwUPVhO2Va3zHHsqqB+?=
 =?Windows-1252?Q?nKvIWLykwt2Uosa5Pp2SxZp17TJ0waeNMnKYlmbasUIPPr3+jMC7mm4R?=
 =?Windows-1252?Q?sy2MYt5a/W0hUDK3Zk/np32JwV1sWAGZGdSzUsmBbaSeMgz0ljHi3pmD?=
 =?Windows-1252?Q?AxBNEeHBRuI8l2+kxy4PnyehSSSnlqpt/C4+oIHE31QvFFMiAP4ZQtTS?=
 =?Windows-1252?Q?ujnx8dJdKH/+KSW9+IpgZLa4ndsO5NYeTNGDibXNgCsjdHyZzCY5w0h4?=
 =?Windows-1252?Q?g5igHmT8SuN3aJd/s1yVyXeORjKH7FIngrWR5jB7E/LI5mcbmatsIspm?=
 =?Windows-1252?Q?Xlk8UJdCm+zPrafY11TDG7AeLTng31A//7i7sPRJkmpkJJWTs5oyNy8Q?=
 =?Windows-1252?Q?kKtiZKKlyn3zQMxN3O6C/A35YVgegEuzPPVVwxlp43+qx0qPZOpaKrWG?=
 =?Windows-1252?Q?xzEr5oXhgE0jiRxDhOstYAwK8i5MVEjABue3mZ+W3RQj1o1pih7eZSc7?=
 =?Windows-1252?Q?uFQ3+jus+0LncLZOBKbpt0YiWMBDsvvZpWcKGzhHJnsJwYwFDAuqHyMV?=
 =?Windows-1252?Q?6kOZi4IQb4kjGqxJQpzq/7O9stkVvTTjT6Lk0Rsh/xqV4aam73AdjPer?=
 =?Windows-1252?Q?fp6B76qpxMKS4Y91QphYDS6tjZx1ueA/R7ye+IhNJBy2Ut6hJyS8qk4h?=
 =?Windows-1252?Q?0vSeFlVCTrRy6ZF6E6kc8hoNSiwXZSiP6yLIIaVEaCO4AD/qLBS+Arfb?=
 =?Windows-1252?Q?ToE/7hW7ezV9xcUcXrpZh/bgUs0+gHZ3/Ml03Q1riyu66bpy3sOn41n5?=
 =?Windows-1252?Q?dXmaOQFFKxfOzEuWlncu4S+67fy5HyFA9kDWlYe4E17XHcjyXw0=3D?=
Content-ID: <AA1817332731B34EA5401F4584470138@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bfabe3-181d-4016-074f-08d8b7334a50
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 19:50:18.9649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dw+rpktU71OVSTaQ9tOlNmBgXQHRDSKsd9uy0dz01ml5p3VjxdxXrQ4R4LGowOUhACqMP46UxqYL/OM6OzshMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2856
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_145036_720038_2C253402 
X-CRM114-Status: GOOD (  29.89  )
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
Cc: Hans Dedecker <dedeckeh@gmail.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 openwrt-devel <openwrt-devel@lists.openwrt.org>,
 Rosen Penev <rosenp@gmail.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/12/21 11:40 AM, Alexey Brodkin wrote:
> Hi Paul,
>
> With that patch I obviously get basic target image built successfully =

> but then it fails to boot that way:
> ------------------------------>8------------------------------
> [ =A0 =A00.554310] Run /init as init process
> [ =A0 =A00.554665] usercopy: Kernel memory overwrite attempt detected to =

> kernel text (offset 98294, size 6)!
> [ =A0 =A00.554733] usercopy: BUG: failure at =

> mm/usercopy.c:99/usercopy_abort()!
> [ =A0 =A00.554789]
> [ =A0 =A00.554789] gcc generated __builtin_trap
> [ =A0 =A00.554833] Path: (null)
> [ =A0 =A00.554897] CPU: 0 PID: 1 Comm: swapper Not tainted 5.4.87 #0
> [ =A0 =A00.554945]
> [ =A0 =A00.554945] [ECR =A0 ]: 0x00250005 =3D> gcc generated __builtin_tr=
ap
> [ =A0 =A00.555058] [EFA =A0 ]: 0x807fc9f0
> [ =A0 =A00.555058] [BLINK ]: usercopy_abort+0x88/0x8c
> [ =A0 =A00.555058] [ERET =A0]: usercopy_abort+0x8a/0x8c
> [ =A0 =A00.555121] [STAT32]: 0x00000806 : K =A0 =A0 =A0 =A0 E2 E1
> [ =A0 =A00.555209] BTA: 0x807fc9f0 =A0 SP: 0x8f02bef8 =A0FP: 0x00000000
> [ =A0 =A00.555270] LPS: 0x80aedbb0 =A0LPE: 0x80aedbbe LPC: 0x00000000
> [ =A0 =A00.555487] r00: 0x0000003c =A0r01: 0x0000000a r02: 0x00000000
> [ =A0 =A00.555487] r03: 0x80c24ba4 =A0r04: 0x00000800 r05: 0x00000000
> [ =A0 =A00.555487] r06: 0x00000006 =A0r07: 0x00000006 r08: 0x00000000
> [ =A0 =A00.555487] r09: 0x00000049 =A0r10: 0x22eeb13c r11: 0x11c05fc3
> [ =A0 =A00.555487] r12: 0x00000000 =A0r13: 0x80715ff6 r14: 0x00000006
> [ =A0 =A00.555487] r15: 0x80715ffc =A0r16: 0x00000000 r17: 0x8f120010
> [ =A0 =A00.555487] r18: 0x00000000 =A0r19: 0x8fec8d90 r20: 0x8f17be00
> [ =A0 =A00.555487] r21: 0x8fec8d90 =A0r22: 0x80714000 r23: 0x5fffe000
> [ =A0 =A00.555487] r24: 0x8f02a000 =A0r25: 0x8f038000
> [ =A0 =A00.555487]
> [ =A0 =A00.555487]
> [ =A0 =A00.555884]
> [ =A0 =A00.555884] Stack Trace:
> [ =A0 =A00.555942] =A0 usercopy_abort+0x8a/0x8c
> ------------------------------>8------------------------------

This could be unrelated to glibc and just be the kernel issue we've =

known for a while.
https://github.com/foss-for-synopsys-dwc-arc-processors/linux/issues/15

Try disabling CONFIG_HARDENED_USERCOPY

-Vineet

>
> Originally I got it with GCC 8.4 but later exactly the same was =

> reproduced with GCC 9.3 so it seems to be not related to the compiler, =

> but rather hints at some corner-case in the kernel configuration which =

> gives such a behavior.
>
> I created a bug-report here about that problem: =

> https://github.com/foss-for-synopsys-dwc-arc-processors/linux/issues/35 =

> <https://github.com/foss-for-synopsys-dwc-arc-processors/linux/issues/35>.
>
> IMHO we may apply suggested patch for glibc in OpenWrt and in the =

> meantime debug observed problem.
>
> BTW we now have a free version of Synopsys proprietary simulator nSIM =

> (available after a simple click-through registration here =

> https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi =

> <https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi>) which might be =

> used for test runs.
>
> -Alexey
>
> ------------------------------------------------------------------------
> *From:* Paul Spooren <mail@aparcar.org>
> *Sent:* Monday, December 28, 2020 11:37 PM
> *To:* Alexey Brodkin <abrodkin@synopsys.com>
> *Cc:* Hans Dedecker <dedeckeh@gmail.com>; openwrt-devel =

> <openwrt-devel@lists.openwrt.org>; Rosen Penev <rosenp@gmail.com>
> *Subject:* Re: [PATCH] glibc: add arc700 patch
> Hi Alexey,
>
> could you please test this patch? I have no devboard at hand.
>
> Kind regards,
> Paul
>
> On So, Dez 27, 2020 at 15:29, Rosen Penev <rosenp@gmail.com> wrote:
> > On Sat, Dec 26, 2020 at 11:50 AM Hans Dedecker <dedeckeh@gmail.com>
> > wrote:
> >>
> >>=A0 Hi,
> >>
> >>=A0 On Fri, Dec 25, 2020 at 1:37 AM Rosen Penev <rosenp@gmail.com>
> >> wrote:
> >>=A0 >
> >>=A0 > glibc does not officially support ARC700 so this adds the missing
> >>=A0 > pieces. I looked at uClibc-ng and a patch by Synopsis for glibc.
> >>=A0 >
> >>=A0 > ran make toolchain/glibc/refresh to clean up fuzz.
> >>=A0 >
> >>=A0 > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>=A0 > ---
> >>=A0 > toolchain/glibc/common.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0 2 +-
> >>=A0 > ...use-of-DES-encryption-functions-in-n.patch | 87
> >> +++++++------------
> >>=A0 > .../glibc/patches/100-fix_cross_rpcgen.patch=A0 |=A0 1 +
> >>=A0 > toolchain/glibc/patches/300-arc.patch=A0=A0=A0=A0=A0=A0=A0=A0 | 5=
5 ++++++++++++
> >>=A0 Will the ARC700 patch be pushed upstream ?
> > Up to Synopsis.
> >>
> >>=A0 Hans
> >>=A0 >=A0 4 files changed, 87 insertions(+), 58 deletions(-)
> >>=A0 >=A0 create mode 100644 toolchain/glibc/patches/300-arc.patch
> >>=A0 >
> >>=A0 > diff --git a/toolchain/glibc/common.mk b/toolchain/glibc/common.mk
> >>=A0 > index faf749eea3..555bd19a61 100644
> >>=A0 > --- a/toolchain/glibc/common.mk
> >>=A0 > +++ b/toolchain/glibc/common.mk
> >>=A0 > @@ -8,7 +8,7 @@ include $(TOPDIR)/rules.mk
> >>=A0 >
> >>=A0 >=A0 PKG_NAME:=3Dglibc
> >>=A0 >=A0 PKG_VERSION:=3D2.32
> >>=A0 > -PKG_RELEASE:=3D1
> >>=A0 > +PKG_RELEASE:=3D2
> >>=A0 >
> >>=A0 >=A0 PKG_SOURCE_PROTO:=3Dgit
> >>=A0 > PKG_SOURCE_SUBDIR:=3D$(PKG_NAME)-$(PKG_VERSION)
> >>=A0 > diff --git
> >> =

> a/toolchain/glibc/patches/050-Revert-Disallow-use-of-DES-encryption-funct=
ions-in-n.patch
> >> =

> b/toolchain/glibc/patches/050-Revert-Disallow-use-of-DES-encryption-funct=
ions-in-n.patch
> >>=A0 > index 002e7a1770..10d9f65d18 100644
> >>=A0 > ---
> >> =

> a/toolchain/glibc/patches/050-Revert-Disallow-use-of-DES-encryption-funct=
ions-in-n.patch
> >>=A0 > +++
> >> =

> b/toolchain/glibc/patches/050-Revert-Disallow-use-of-DES-encryption-funct=
ions-in-n.patch
> >>=A0 > @@ -23,11 +23,9 @@ provides them.
> >>=A0 >=A0=A0 sunrpc/des_soft.c=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 2 +-
> >>=A0 >=A0=A0 13 files changed, 305 insertions(+), 90 deletions(-)
> >>=A0 >
> >>=A0 > -diff --git a/conform/data/stdlib.h-data
> >> b/conform/data/stdlib.h-data
> >>=A0 > -index 6913828196..d8fcccc2fb 100644
> >>=A0 >=A0 --- a/conform/data/stdlib.h-data
> >>=A0 >=A0 +++ b/conform/data/stdlib.h-data
> >>=A0 > -@@ -149,6 +149,9 @@ function {unsigned short int*} seed48
> >> (unsigned short int[3])
> >>=A0 > +@@ -149,6 +149,9 @@ function {unsigned short int*} seed48 (u
> >>=A0 >=A0=A0 #if !defined ISO && !defined ISO99 && !defined ISO11 &&
> >> !defined POSIX && !defined XPG4 && !defined XPG42 && !defined UNIX98
> >>=A0 >=A0=A0 function int setenv (const char*, const char*, int)
> >>=A0 >=A0=A0 #endif
> >>=A0 > @@ -37,8 +35,6 @@ index 6913828196..d8fcccc2fb 100644
> >>=A0 >=A0=A0 #if !defined ISO && !defined ISO99 && !defined ISO11 &&
> >> !defined XPG4 && !defined POSIX && !defined POSIX2008
> >>=A0 >=A0=A0 function {char*} setstate (char*)
> >>=A0 >=A0=A0 #endif
> >>=A0 > -diff --git a/conform/data/unistd.h-data
> >> b/conform/data/unistd.h-data
> >>=A0 > -index aa070528e8..ddf4f25132 100644
> >>=A0 >=A0 --- a/conform/data/unistd.h-data
> >>=A0 >=A0 +++ b/conform/data/unistd.h-data
> >>=A0 >=A0 @@ -437,6 +437,9 @@ function int chroot (const char*)
> >>=A0 > @@ -61,8 +57,6 @@ index aa070528e8..ddf4f25132 100644
> >>=A0 >=A0=A0 function int execl (const char*, const char*, ...)
> >>=A0 >=A0=A0 function int execle (const char*, const char*, ...)
> >>=A0 >=A0=A0 function int execlp (const char*, const char*, ...)
> >>=A0 > -diff --git a/crypt/cert.c b/crypt/cert.c
> >>=A0 > -index e070ca398d..80029e9078 100644
> >>=A0 >=A0 --- a/crypt/cert.c
> >>=A0 >=A0 +++ b/crypt/cert.c
> >>=A0 >=A0 @@ -10,22 +10,6 @@
> >>=A0 > @@ -102,8 +96,6 @@ index e070ca398d..80029e9078 100644
> >>=A0 >=A0 -}
> >>=A0 >=A0 -
> >>=A0 >=A0 -#endif
> >>=A0 > -diff --git a/crypt/crypt-entry.c b/crypt/crypt-entry.c
> >>=A0 > -index 502b5846f0..09332c690a 100644
> >>=A0 >=A0 --- a/crypt/crypt-entry.c
> >>=A0 >=A0 +++ b/crypt/crypt-entry.c
> >>=A0 >=A0 @@ -35,7 +35,6 @@
> >>=A0 > @@ -114,7 +106,7 @@ index 502b5846f0..09332c690a 100644
> >>=A0 >
> >>=A0 >=A0=A0 /* Prototypes for local functions.=A0 */
> >>=A0 >=A0=A0 #ifndef __GNU_LIBRARY__
> >>=A0 > -@@ -177,7 +176,17 @@ crypt (const char *key, const char *salt)
> >>=A0 > +@@ -177,7 +176,17 @@ crypt (const char *key, const char *salt
> >>=A0 >=A0=A0=A0=A0 return __crypt_r (key, salt, &_ufc_foobar);
> >>=A0 >=A0=A0 }
> >>=A0 >
> >>=A0 > @@ -134,8 +126,6 @@ index 502b5846f0..09332c690a 100644
> >>=A0 >=A0 +=A0 return crypt (key, salt);
> >>=A0 >=A0 +}
> >>=A0 >=A0=A0 #endif
> >>=A0 > -diff --git a/crypt/crypt.h b/crypt/crypt.h
> >>=A0 > -index ca8ad456cc..7d0de95018 100644
> >>=A0 >=A0 --- a/crypt/crypt.h
> >>=A0 >=A0 +++ b/crypt/crypt.h
> >>=A0 >=A0 @@ -36,6 +36,14 @@ __BEGIN_DECLS
> >>=A0 > @@ -168,8 +158,6 @@ index ca8ad456cc..7d0de95018 100644
> >>=A0 >=A0=A0 #endif
> >>=A0 >
> >>=A0 >=A0=A0 __END_DECLS
> >>=A0 > -diff --git a/crypt/crypt_util.c b/crypt/crypt_util.c
> >>=A0 > -index 4b2f0a89cb..b012cde6bd 100644
> >>=A0 >=A0 --- a/crypt/crypt_util.c
> >>=A0 >=A0 +++ b/crypt/crypt_util.c
> >>=A0 >=A0 @@ -34,7 +34,6 @@
> >>=A0 > @@ -196,7 +184,7 @@ index 4b2f0a89cb..b012cde6bd 100644
> >>=A0 >
> >>=A0 >=A0=A0 /*
> >>=A0 >=A0=A0=A0 * This is the final
> >>=A0 > -@@ -788,7 +785,6 @@ _ufc_output_conversion_r (ufc_long v1,
> >> ufc_long v2, const char *salt,
> >>=A0 > +@@ -788,7 +785,6 @@ _ufc_output_conversion_r (ufc_long v1, u
> >>=A0 >=A0=A0=A0=A0 __data->crypt_3_buf[13] =3D 0;
> >>=A0 >=A0=A0 }
> >>=A0 >
> >>=A0 > @@ -204,7 +192,7 @@ index 4b2f0a89cb..b012cde6bd 100644
> >>=A0 >
> >>=A0 >=A0=A0 /*
> >>=A0 >=A0=A0=A0 * UNIX encrypt function. Takes a bitvector
> >>=A0 > -@@ -889,14 +885,12 @@ __encrypt_r (char *__block, int __edflag,
> >>=A0 > +@@ -889,14 +885,12 @@ __encrypt_r (char *__block, int __edflag
> >>=A0 >=A0=A0=A0=A0 }
> >>=A0 >=A0=A0 }
> >>=A0 >=A0=A0 weak_alias (__encrypt_r, encrypt_r)
> >>=A0 > @@ -219,7 +207,7 @@ index 4b2f0a89cb..b012cde6bd 100644
> >>=A0 >
> >>=A0 >
> >>=A0 >=A0=A0 /*
> >>=A0 > -@@ -921,15 +915,12 @@ __setkey_r (const char *__key, struct
> >> crypt_data * __restrict __data)
> >>=A0 > +@@ -921,15 +915,12 @@ __setkey_r (const char *__key, struct cr
> >>=A0 >=A0=A0=A0=A0 _ufc_mk_keytab_r((char *) ktab, __data);
> >>=A0 >=A0=A0 }
> >>=A0 >=A0=A0 weak_alias (__setkey_r, setkey_r)
> >>=A0 > @@ -235,11 +223,9 @@ index 4b2f0a89cb..b012cde6bd 100644
> >>=A0 >
> >>=A0 >=A0=A0 void
> >>=A0 >=A0=A0 __b64_from_24bit (char **cp, int *buflen,
> >>=A0 > -diff --git a/manual/conf.texi b/manual/conf.texi
> >>=A0 > -index f959b00bb6..51fb2f5aa1 100644
> >>=A0 >=A0 --- a/manual/conf.texi
> >>=A0 >=A0 +++ b/manual/conf.texi
> >>=A0 > -@@ -780,8 +780,6 @@ Inquire about the parameter corresponding to
> >> @code{_XOPEN_LEGACY}.
> >>=A0 > +@@ -780,8 +780,6 @@ Inquire about the parameter correspondin
> >>=A0 >=A0=A0 @item _SC_XOPEN_CRYPT
> >>=A0 >=A0=A0 @standards{X/Open, unistd.h}
> >>=A0 >=A0=A0 Inquire about the parameter corresponding to
> >> @code{_XOPEN_CRYPT}.
> >>=A0 > @@ -248,11 +234,9 @@ index f959b00bb6..51fb2f5aa1 100644
> >>=A0 >
> >>=A0 >=A0=A0 @item _SC_XOPEN_ENH_I18N
> >>=A0 >=A0=A0 @standards{X/Open, unistd.h}
> >>=A0 > -diff --git a/manual/crypt.texi b/manual/crypt.texi
> >>=A0 > -index af23dd7847..1b151f2d74 100644
> >>=A0 >=A0 --- a/manual/crypt.texi
> >>=A0 >=A0 +++ b/manual/crypt.texi
> >>=A0 > -@@ -16,8 +16,19 @@ subject to them, even if you do not use the
> >> functions in this chapter
> >>=A0 > +@@ -16,8 +16,19 @@ subject to them, even if you do not use
> >>=A0 >=A0=A0 yourself.=A0 The restrictions vary from place to place and =
are
> >> changed
> >>=A0 >=A0=A0 often, so we cannot give any more specific advice than this
> >> warning.
> >>=A0 >
> >>=A0 > @@ -272,7 +256,7 @@ index af23dd7847..1b151f2d74 100644
> >>=A0 >=A0=A0 * Unpredictable Bytes:: Randomness for cryptographic
> >> purposes.
> >>=A0 >=A0=A0 @end menu
> >>=A0 >
> >>=A0 > -@@ -190,6 +201,199 @@ unpredictable as possible;
> >> @pxref{Unpredictable Bytes}.
> >>=A0 > +@@ -190,6 +201,199 @@ unpredictable as possible; @pxref{Unpred
> >>=A0 >=A0=A0 @include genpass.c.texi
> >>=A0 >=A0=A0 @end smallexample
> >>=A0 >
> >>=A0 > @@ -472,8 +456,6 @@ index af23dd7847..1b151f2d74 100644
> >>=A0 >=A0=A0 The next program demonstrates how to verify a passphrase.=
=A0 It
> >> checks a
> >>=A0 >=A0=A0 hash hardcoded into the program, because looking up real us=
ers'
> >> hashed
> >>=A0 >=A0=A0 passphrases may require special privileges (@pxref{User
> >> Database}).
> >>=A0 > -diff --git a/manual/string.texi b/manual/string.texi
> >>=A0 > -index 23f516439a..5586b52dee 100644
> >>=A0 >=A0 --- a/manual/string.texi
> >>=A0 >=A0 +++ b/manual/string.texi
> >>=A0 >=A0 @@ -36,8 +36,8 @@ too.
> >>=A0 > @@ -487,7 +469,7 @@ index 23f516439a..5586b52dee 100644
> >>=A0 >=A0=A0 * Encode Binary Data::=A0=A0=A0=A0=A0=A0=A0=A0=A0 Encoding =
and Decoding of Binary
> >> Data.
> >>=A0 >=A0=A0 * Argz and Envz Vectors:: Null-separated string vectors.
> >>=A0 >=A0=A0 @end menu
> >>=A0 > -@@ -2426,73 +2426,73 @@ functionality under a different name,
> >> such as @code{explicit_memset},
> >>=A0 > +@@ -2426,73 +2426,73 @@ functionality under a different name, su
> >>=A0 >=A0=A0 systems it may be in @file{strings.h} instead.
> >>=A0 >=A0=A0 @end deftypefun
> >>=A0 >
> >>=A0 > @@ -538,10 +520,19 @@ index 23f516439a..5586b52dee 100644
> >>=A0 >
> >>=A0 >=A0 -@node Obfuscating Data
> >>=A0 >=A0 -@section Obfuscating Data
> >>=A0 > --@cindex Rot13
> >>=A0 >=A0 +@node Trivial Encryption
> >>=A0 >=A0 +@section Trivial Encryption
> >>=A0 >=A0 +@cindex encryption
> >>=A0 > ++
> >>=A0 > ++
> >>=A0 > ++The @code{memfrob} function converts an array of data to
> >> something
> >>=A0 > ++unrecognizable and back again.=A0 It is not encryption in its
> >> usual sense
> >>=A0 > ++since it is easy for someone to convert the encrypted data back
> >> to clear
> >>=A0 > ++text.=A0 The transformation is analogous to Usenet's ``Rot13''
> >> encryption
> >>=A0 > ++method for obscuring offensive jokes from sensitive eyes and
> >> such.
> >>=A0 > ++Unlike Rot13, @code{memfrob} works on arbitrary binary data,
> >> not just
> >>=A0 > ++text.
> >>=A0 > + @cindex Rot13
> >>=A0 >
> >>=A0 >=A0 -The @code{memfrob} function reversibly obfuscates an array of
> >> binary
> >>=A0 >=A0 -data.=A0 This is not true encryption; the obfuscated data sti=
ll
> >> bears a
> >>=A0 > @@ -549,20 +540,12 @@ index 23f516439a..5586b52dee 100644
> >>=A0 >=A0 -undo the obfuscation.=A0 It is analogous to the ``Rot13'' cip=
her
> >> used on
> >>=A0 >=A0 -Usenet for obscuring offensive jokes, spoilers for works of
> >> fiction,
> >>=A0 >=A0 -and so on, but it can be applied to arbitrary binary data.
> >>=A0 > -
> >>=A0 > +-
> >>=A0 >=A0 -Programs that need true encryption---a transformation that
> >> completely
> >>=A0 >=A0 -obscures the original and cannot be reversed without knowledge
> >> of a
> >>=A0 >=A0 -secret key---should use a dedicated cryptography library, such
> >> as
> >>=A0 > =

> -@uref{https://urldefense.com/v3/__https://www.gnu.org/software/libgcrypt=
/,,libgcrypt__;!!A4F2R9G_pg!L0pWJaBdwuz-RV1Owa4-1r5ltn0XoiGm9-1v7fhQt0WSOIZ=
3tFyWidJsvem-W51g$ =

> }.
> >>=A0 > -+The @code{memfrob} function converts an array of data to
> >> something
> >>=A0 > -+unrecognizable and back again.=A0 It is not encryption in its
> >> usual sense
> >>=A0 > -+since it is easy for someone to convert the encrypted data back
> >> to clear
> >>=A0 > -+text.=A0 The transformation is analogous to Usenet's ``Rot13''
> >> encryption
> >>=A0 > -+method for obscuring offensive jokes from sensitive eyes and
> >> such.
> >>=A0 > -+Unlike Rot13, @code{memfrob} works on arbitrary binary data,
> >> not just
> >>=A0 > -+text.
> >>=A0 > -+@cindex Rot13
> >>=A0 > -
> >>=A0 > +-
> >>=A0 >=A0 -Programs that need to @emph{destroy} data should use
> >>=A0 >=A0 -@code{explicit_bzero} (@pxref{Erasing Sensitive Data}), or
> >> possibly
> >>=A0 >=A0 -@code{strfry} (@pxref{Shuffling Bytes}).
> >>=A0 > @@ -579,13 +562,14 @@ index 23f516439a..5586b52dee 100644
> >>=A0 >=A0 -beginning at @var{mem}, in place.=A0 Each byte is bitwise xor=
-ed
> >> with
> >>=A0 >=A0 -the binary pattern 00101010 (hexadecimal 0x2A).=A0 The return
> >> value is
> >>=A0 >=A0 -always @var{mem}.
> >>=A0 > +-
> >>=A0 > +-@code{memfrob} a second time on the same data returns it to
> >>=A0 > +-its original state.
> >>=A0 >=A0 +@code{memfrob} transforms (frobnicates) each byte of the data
> >> structure
> >>=A0 >=A0 +at @var{mem}, which is @var{length} bytes long, by bitwise
> >> exclusive
> >>=A0 >=A0 +oring it with binary 00101010.=A0 It does the transformation =
in
> >> place and
> >>=A0 >=A0 +its return value is always @var{mem}.
> >>=A0 > -
> >>=A0 > --@code{memfrob} a second time on the same data returns it to
> >>=A0 > --its original state.
> >>=A0 > ++
> >>=A0 >=A0 +Note that @code{memfrob} a second time on the same data
> >> structure
> >>=A0 >=A0 +returns it to its original state.
> >>=A0 >=A0 +
> >>=A0 > @@ -600,8 +584,6 @@ index 23f516439a..5586b52dee 100644
> >>=A0 >=A0=A0 @end deftypefun
> >>=A0 >
> >>=A0 >=A0=A0 @node Encode Binary Data
> >>=A0 > -diff --git a/posix/unistd.h b/posix/unistd.h
> >>=A0 > -index 32b8161619..6fac59999f 100644
> >>=A0 >=A0 --- a/posix/unistd.h
> >>=A0 >=A0 +++ b/posix/unistd.h
> >>=A0 >=A0 @@ -107,6 +107,9 @@ __BEGIN_DECLS
> >>=A0 > @@ -614,7 +596,7 @@ index 32b8161619..6fac59999f 100644
> >>=A0 >=A0=A0 /* The enhanced internationalization capabilities according=
 to
> >> XPG4.2
> >>=A0 >=A0=A0=A0=A0=A0 are present.=A0 */
> >>=A0 >=A0=A0 #define=A0=A0=A0=A0=A0=A0 _XOPEN_ENH_I18N 1
> >>=A0 > -@@ -1129,17 +1132,25 @@ ssize_t copy_file_range (int __infd,
> >> __off64_t *__pinoff,
> >>=A0 > +@@ -1129,17 +1132,25 @@ ssize_t copy_file_range (int __infd, __o
> >>=A0 >=A0=A0 extern int fdatasync (int __fildes);
> >>=A0 >=A0=A0 #endif /* Use POSIX199309 */
> >>=A0 >
> >>=A0 > @@ -643,11 +625,9 @@ index 32b8161619..6fac59999f 100644
> >>=A0 >=A0=A0 /* Swab pairs bytes in the first N bytes of the area pointe=
d to
> >> by
> >>=A0 >=A0=A0=A0=A0=A0 FROM and copy the result to TO.=A0 The value of TO=
 must not be
> >> in the
> >>=A0 >=A0=A0=A0=A0=A0 range [FROM - N + 1, FROM - 1].=A0 If N is odd the=
 first byte
> >> in FROM
> >>=A0 > -diff --git a/stdlib/stdlib.h b/stdlib/stdlib.h
> >>=A0 > -index 3aa27a9d25..67e5e66f94 100644
> >>=A0 >=A0 --- a/stdlib/stdlib.h
> >>=A0 >=A0 +++ b/stdlib/stdlib.h
> >>=A0 > -@@ -962,6 +962,12 @@ extern int getsubopt (char **__restrict
> >> __optionp,
> >>=A0 > +@@ -962,6 +962,12 @@ extern int getsubopt (char **__restrict
> >>=A0 >=A0=A0 #endif
> >>=A0 >
> >>=A0 >
> >>=A0 > @@ -660,11 +640,9 @@ index 3aa27a9d25..67e5e66f94 100644
> >>=A0 >=A0=A0 /* X/Open pseudo terminal handling.=A0 */
> >>=A0 >
> >>=A0 >=A0=A0 #ifdef __USE_XOPEN2KXSI
> >>=A0 > -diff --git a/sunrpc/des_crypt.c b/sunrpc/des_crypt.c
> >>=A0 > -index 9b4bd2d5dd..a4d8b2936b 100644
> >>=A0 >=A0 --- a/sunrpc/des_crypt.c
> >>=A0 >=A0 +++ b/sunrpc/des_crypt.c
> >>=A0 > -@@ -86,9 +86,6 @@ common_crypt (char *key, char *buf, register
> >> unsigned len,
> >>=A0 > +@@ -86,9 +86,6 @@ common_crypt (char *key, char *buf, regi
> >>=A0 >=A0=A0=A0=A0 return desdev =3D=3D DES_SW ? DESERR_NONE : DESERR_NO=
HWDEVICE;
> >>=A0 >=A0=A0 }
> >>=A0 >
> >>=A0 > @@ -674,7 +652,7 @@ index 9b4bd2d5dd..a4d8b2936b 100644
> >>=A0 >=A0=A0 /*
> >>=A0 >=A0=A0=A0 * CBC mode encryption
> >>=A0 >=A0=A0=A0 */
> >>=A0 > -@@ -105,7 +102,7 @@ cbc_crypt (char *key, char *buf, unsigned
> >> int len, unsigned int mode,
> >>=A0 > +@@ -105,7 +102,7 @@ cbc_crypt (char *key, char *buf, unsigne
> >>=A0 >=A0=A0=A0=A0 COPY8 (dp.des_ivec, ivec);
> >>=A0 >=A0=A0=A0=A0 return err;
> >>=A0 >=A0=A0 }
> >>=A0 > @@ -683,14 +661,12 @@ index 9b4bd2d5dd..a4d8b2936b 100644
> >>=A0 >
> >>=A0 >=A0=A0 /*
> >>=A0 >=A0=A0=A0 * ECB mode encryption
> >>=A0 > -@@ -118,4 +115,4 @@ ecb_crypt (char *key, char *buf, unsigned
> >> int len, unsigned int mode)
> >>=A0 > +@@ -118,4 +115,4 @@ ecb_crypt (char *key, char *buf, unsigne
> >>=A0 >=A0=A0=A0=A0 dp.des_mode =3D ECB;
> >>=A0 >=A0=A0=A0=A0 return common_crypt (key, buf, len, mode, &dp);
> >>=A0 >=A0=A0 }
> >>=A0 >=A0 -hidden_nolink (ecb_crypt, libc, GLIBC_2_1)
> >>=A0 >=A0 +libc_hidden_nolink_sunrpc (ecb_crypt, GLIBC_2_1)
> >>=A0 > -diff --git a/sunrpc/des_soft.c b/sunrpc/des_soft.c
> >>=A0 > -index a87de96cc7..f884f8f21b 100644
> >>=A0 >=A0 --- a/sunrpc/des_soft.c
> >>=A0 >=A0 +++ b/sunrpc/des_soft.c
> >>=A0 >=A0 @@ -71,4 +71,4 @@ des_setparity (char *p)
> >>=A0 > @@ -699,6 +675,3 @@ index a87de96cc7..f884f8f21b 100644
> >>=A0 >=A0=A0 }
> >>=A0 >=A0 -hidden_nolink (des_setparity, libc, GLIBC_2_1)
> >>=A0 >=A0 +libc_hidden_nolink_sunrpc (des_setparity, GLIBC_2_1)
> >>=A0 > ---
> >>=A0 > -2.25.1
> >>=A0 > -
> >>=A0 > diff --git a/toolchain/glibc/patches/100-fix_cross_rpcgen.patch
> >> b/toolchain/glibc/patches/100-fix_cross_rpcgen.patch
> >>=A0 > index 6ee1e80424..9baed08139 100644
> >>=A0 > --- a/toolchain/glibc/patches/100-fix_cross_rpcgen.patch
> >>=A0 > +++ b/toolchain/glibc/patches/100-fix_cross_rpcgen.patch
> >>=A0 > @@ -33,3 +33,4 @@
> >>=A0 >=A0 +typedef char *caddr_t;
> >>=A0 >=A0=A0 # define __daddr_t_defined
> >>=A0 >=A0=A0 #endif
> >>=A0 > +
> >>=A0 > diff --git a/toolchain/glibc/patches/300-arc.patch
> >> b/toolchain/glibc/patches/300-arc.patch
> >>=A0 > new file mode 100644
> >>=A0 > index 0000000000..66f7aeb3ef
> >>=A0 > --- /dev/null
> >>=A0 > +++ b/toolchain/glibc/patches/300-arc.patch
> >>=A0 > @@ -0,0 +1,55 @@
> >>=A0 > +--- a/sysdeps/arc/atomic-machine.h
> >>=A0 > ++++ b/sysdeps/arc/atomic-machine.h
> >>=A0 > +@@ -64,6 +64,10 @@ typedef uintmax_t uatomic_max_t;
> >>=A0 > +=A0=A0 __atomic_val_bysize (__arch_compare_and_exchange_val, int,
> >>=A0=A0=A0=A0=A0=A0 \
> >>=A0 > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
mem, new, old, __ATOMIC_ACQUIRE)
> >>=A0 > +
> >>=A0 > ++#ifdef __ARC700__
> >>=A0 > ++#define atomic_full_barrier()=A0 ({ asm volatile
> >> ("sync":::"memory"); })
> >>=A0 > ++#else
> >>=A0 > + #define atomic_full_barrier()=A0 ({ asm volatile ("dmb
> >> 3":::"memory"); })
> >>=A0 > ++#endif
> >>=A0 > +
> >>=A0 > + #endif /* _ARC_BITS_ATOMIC_H */
> >>=A0 > +--- a/sysdeps/unix/sysv/linux/arc/syscall.S
> >>=A0 > ++++ b/sysdeps/unix/sysv/linux/arc/syscall.S
> >>=A0 > +@@ -24,8 +24,13 @@ ENTRY (syscall)
> >>=A0 > +=A0=A0=A0=A0=A0=A0 mov_s=A0=A0 r1, r2
> >>=A0 > +=A0=A0=A0=A0=A0=A0 mov_s=A0=A0 r2, r3
> >>=A0 > +=A0=A0=A0=A0=A0=A0 mov_s=A0=A0 r3, r4
> >>=A0 > ++#ifdef __ARC700__
> >>=A0 > ++=A0=A0=A0=A0=A0 mov=A0=A0=A0=A0 r4, r5
> >>=A0 > ++=A0=A0=A0=A0=A0 mov=A0=A0=A0=A0 r5, r6
> >>=A0 > ++#else
> >>=A0 > +=A0=A0=A0=A0=A0=A0 mov_s=A0=A0 r4, r5
> >>=A0 > +=A0=A0=A0=A0=A0=A0 mov_s=A0=A0 r5, r6
> >>=A0 > ++#endif
> >>=A0 > +
> >>=A0 > +=A0=A0=A0=A0=A0=A0 ARC_TRAP_INSN
> >>=A0 > +=A0=A0=A0=A0=A0=A0 brhi=A0=A0=A0 r0, -4096, L (call_syscall_err)
> >>=A0 > +--- a/sysdeps/unix/sysv/linux/arc/sysdep.h
> >>=A0 > ++++ b/sysdeps/unix/sysv/linux/arc/sysdep.h
> >>=A0 > +@@ -128,7 +128,11 @@ L (call_syscall_err):
> >> ASM_LINE_SEP=A0=A0=A0 \
> >>=A0 > +=A0=A0=A0=A0 mov=A0=A0=A0 r8, __NR_##syscall_name ASM_LINE_SEP=
=A0=A0=A0 \
> >>=A0 > +=A0=A0=A0=A0 ARC_TRAP_INSN ASM_LINE_SEP
> >>=A0 > +
> >>=A0 > ++# ifdef __ARC700__
> >>=A0 > ++# define ARC_TRAP_INSN=A0=A0=A0=A0=A0=A0=A0 trap0
> >>=A0 > ++# else
> >>=A0 > + # define ARC_TRAP_INSN=A0=A0=A0=A0=A0=A0=A0 trap_s 0
> >>=A0 > ++# endif
> >>=A0 > +
> >>=A0 > + #else=A0 /* !__ASSEMBLER__ */
> >>=A0 > +
> >>=A0 > +@@ -139,7 +143,11 @@ extern long int __syscall_error (long in
> >>=A0 > + hidden_proto (__syscall_error)
> >>=A0 > + # endif
> >>=A0 > +
> >>=A0 > ++# ifdef __ARC700__
> >>=A0 > ++# define ARC_TRAP_INSN "trap0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \n\t"
> >>=A0 > ++# else
> >>=A0 > + # define ARC_TRAP_INSN=A0=A0=A0=A0=A0=A0=A0 "trap_s 0=A0=A0=A0=
=A0=A0=A0 \n\t"
> >>=A0 > ++#endif
> >>=A0 > +
> >>=A0 > + # undef INTERNAL_SYSCALL_NCS
> >>=A0 > + # define INTERNAL_SYSCALL_NCS(number, nr_args, args...)=A0=A0=
=A0=A0=A0=A0 \
> >>=A0 > --
> >>=A0 > 2.29.2
> >>=A0 >
> >>=A0 >
> >>=A0 > _______________________________________________
> >>=A0 > openwrt-devel mailing list
> >>=A0 > openwrt-devel@lists.openwrt.org
> >>=A0 > =

> https://urldefense.com/v3/__https://lists.openwrt.org/mailman/listinfo/op=
enwrt-devel__;!!A4F2R9G_pg!L0pWJaBdwuz-RV1Owa4-1r5ltn0XoiGm9-1v7fhQt0WSOIZ3=
tFyWidJsvRu8SOsL$ =

> <https://urldefense.com/v3/__https://lists.openwrt.org/mailman/listinfo/o=
penwrt-devel__;!!A4F2R9G_pg!L0pWJaBdwuz-RV1Owa4-1r5ltn0XoiGm9-1v7fhQt0WSOIZ=
3tFyWidJsvRu8SOsL$> =

>
> >
> > _______________________________________________
> > openwrt-devel mailing list
> > openwrt-devel@lists.openwrt.org
> > =

> https://urldefense.com/v3/__https://lists.openwrt.org/mailman/listinfo/op=
enwrt-devel__;!!A4F2R9G_pg!L0pWJaBdwuz-RV1Owa4-1r5ltn0XoiGm9-1v7fhQt0WSOIZ3=
tFyWidJsvRu8SOsL$ =

> <https://urldefense.com/v3/__https://lists.openwrt.org/mailman/listinfo/o=
penwrt-devel__;!!A4F2R9G_pg!L0pWJaBdwuz-RV1Owa4-1r5ltn0XoiGm9-1v7fhQt0WSOIZ=
3tFyWidJsvRu8SOsL$> =

>
>
>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
