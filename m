Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5140AC433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Dec 2021 16:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFEyjPHNb3p4YDzqVXQ3fJ2O70x91fSTKewbZC6yPSA=; b=jMmJAUZ98RanZZ
	2W6RqZQQIyswP0ZsX328UpNpackDNZXPE18Pj/EuiVD41HIVwKI8El6MdY2agJtJrsANeuNIISl+j
	mndegY4AN9l3gjKfNMxrsRO/5sg1p4GJHLLwKO/Q8ArUkWiXn7qPkha0zxmOS1fiW4JmbbEciqsQc
	MB7m1pAjtO1zOm3IgMrGqL3QGCOFrMZ9OppD8K9dobenpFhnpFBDMgwsW4FoGPH4tL99uYz788aMU
	xo2Bz63WjuaBG4O1siqqvGlgzTEi4ny+1FzeJ0EN/M+GabUMSo5Eeri5Pe3k/sjwLt4ZD77L80fkC
	yKWvM61jEqAVDNa/r+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muczN-009OOH-S9; Tue, 07 Dec 2021 16:06:45 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muczK-009ONk-Bf
 for linux-snps-arc@lists.infradead.org; Tue, 07 Dec 2021 16:06:44 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9BF00C15C3;
 Tue,  7 Dec 2021 16:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1638893202; bh=WSUP7ayUJq32ax/4abyFtNcGd2kd8rlWcxGlHX6y/9U=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=K9D4Ud5Rw/HyEOGQwEiFtdRxYY4ObRxSfL37+5+c2pSpTYe9/SVH4HakAJ7+Ba/zg
 PVkMT3YZ7qoTBrufnGf+49Ob2rK1D775Q/CVx4X4m3uSjFUVe3polpVJ5IlHaGL59b
 7CTcDNp+nowxtmfrt3L92QV62paq6kWibc1X+a/g4uD8XSL88/k603toV1C6wcQfgS
 TJADkSfGeW2YpxqtEPmJqkfb40fcimYKL9tUNz+TAuRmS5XYDFD0uC82fBABNaHZiI
 G6sulYnJBsgEfj0UuhNcXiTQG7F2uKmn9n5DvnXLgk42XQdf0rsB3AsqCpoB7vMF14
 J+BXRA9N1Cv7w==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id E5EA2A0096;
 Tue,  7 Dec 2021 16:06:40 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 14D2840069;
 Tue,  7 Dec 2021 16:06:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="tZwL9OG/";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiFavgnPLddVH48tLN7Wglk1RDgRttq5jcdbMLC//Hxz/eZwlxWC5TP10UCi1EZP3g9jsMAwjE+FXN3b2PLCawulFTyuYwPz85jaqoJ4t96v7+hO8HwjPr4fVTPZ3Cp/FJLGPDRQ7CpVH4mM2asbYqbUNEY3zd8PbZc5f+/GUjcfPv3E4DoW2fRxYl3/zJmCgeiSwWJrAY6VNcEgXx/yyiP7Y8d9qZqksMjDJwchyv9FG9F5BYRnNpwM+OJpoh4zdWpkvgYskxtTmbug9I2QcSuNno/xEvFicqWipXbnAmwBVL7HEfQCusxynkCoXq1sEtkBM4SxHQ514oiLtTkJUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSUP7ayUJq32ax/4abyFtNcGd2kd8rlWcxGlHX6y/9U=;
 b=EAAs82ErT0wwG662JJiRZN1BnRjW2x+8msIvmF+9IM8y2V0wcrkpyRW/yPquQ5aTujmRLE9FPB3pNnz68WbZCFK+CMbXQKVPapxugrR4azjjZrySZXO0S1wRlmA6YQcHKfeQRkOzXJ1nxJ/BI25zbZebna2mqRsQeJd2niVqgZIR/csqronkx73SgwqvaYt6CPOfmAVhGCYp2B7K+4nmH/bz+UH+ZlkIR74x9sp90lksc3zESgSZZL2i2fgzicmP//9N0mBDnHzjyg8cFsKjO+dOXKFN4VXxshqZYjAx9p+Ki2dpyChzQLwxF79F5dsdlHG2wznQqTu84kuYAaLwxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSUP7ayUJq32ax/4abyFtNcGd2kd8rlWcxGlHX6y/9U=;
 b=tZwL9OG/f2DSZSUF4zaF4LnodLjbf1R2WaKE3pNWfX8PbHmXAE2XM4kIBHlsoJ24VNv0Ekx78/KplfYC2QqtZ1RJPps/3J0jVtXbUVtWpM6Epc6e6M4FkAO/yX2OloVZmamBBZiaWSwKEylNQUAEJWcc2hlwRG9h8WvmaxFnL8o=
Received: from PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 by PH0PR12MB5436.namprd12.prod.outlook.com (2603:10b6:510:eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14; Tue, 7 Dec
 2021 16:06:36 +0000
Received: from PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::2ca5:cf5a:857e:4061]) by PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::2ca5:cf5a:857e:4061%5]) with mapi id 15.20.4755.021; Tue, 7 Dec 2021
 16:06:36 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] openssl: Use linux-latomic target for ARC
Thread-Topic: [PATCH] openssl: Use linux-latomic target for ARC
Thread-Index: AQHX64Nr0H1XnGXb8kK57el9FF8uQKwnMUit
Date: Tue, 7 Dec 2021 16:06:35 +0000
Message-ID: <PH0PR12MB54013D225BB69393A5FFCEE5A16E9@PH0PR12MB5401.namprd12.prod.outlook.com>
References: <20211207155910.15552-1-abrodkin@synopsys.com>
In-Reply-To: <20211207155910.15552-1-abrodkin@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 11b3059f-787c-a420-7647-4c8cee93c5c4
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c61280af-1b64-45c2-1d2a-08d9b99b8b77
x-ms-traffictypediagnostic: PH0PR12MB5436:EE_
x-microsoft-antispam-prvs: <PH0PR12MB5436FAD83B16737E0563DAF3A16E9@PH0PR12MB5436.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2M9Z6/cWVTnmfaeIf1/IKnfqx04Iv0ysJJScPlkUhX6CShmfeCXV/BaDpSBQySXTIv1oGC+O6Tp3dvGjpxBR6uylnr+q/+GoksfgW8JIScNhIWObk7VVQiFPNlygPpzYg2CnMBVZmZuaW/jBTLcaQy/rMElbE6VhhYyyT6EpV7eOYNu/h2JNu2rzJAtmBx1u5GPjehDqKyn8TmFBsW8x88LyoXa7JOFRc2NHhprE77eEVN3F8BPLB/Zqn6j+UbzMQbJVMxadxoWev1+T6DRfnoSMLs4Q3eEZAs3CiSjFJWW2TEdhaQ+sEAUKLy9e/ySDTjwE8/sYVdQG71Uh3WaWb6fOYv/R/e6jC4wnhlea/6wH8PGXX/tFUG+b6VON5AEr085IVq8e5ZYLWStywCWu+HEGulVZ0CG8hbOIS4dL/6w0NjikCk9xJwzqyW+WUM0GhW7jhr5Ye9bd80/eEzwMFmccloKajEw2CB47e6W+e/ZazRDhCnRLDn908loXvMA6eanJdUnFOnEa1aDbqrsf6zYGJIr3OoySx330KywqeEsU77WG4VXPtGu2PRhAv4yYCyqJaPoSe+JWEVtXe4X3fiTnO/hGRVAD6tGjOh2LUEGPOk24h74KpMBMYxsVuMA5L1cgM8Iu6IQ9vw2vX0i1V31yXgX4JTbARozSr9Qml9ilPG1uI2FdtqVAleiUzDBp8OG7dGmSKdrn0hA25XJG6LwbgX7AUFfYgPkwJZkb07+GVPyiHcx5C0S/8h0jU5CYAofKF3JrqYMUy8acX0XKN2Uyv0G9UbhspWJOdYft8JysmVvvyH4FPdTqaf986l0hK0X7DmiQAVXZ6HL0gGYBCg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(966005)(316002)(38100700002)(76116006)(86362001)(4326008)(508600001)(64756008)(8676002)(91956017)(66446008)(66946007)(66556008)(66476007)(8936002)(38070700005)(71200400001)(9686003)(122000001)(186003)(7696005)(26005)(5660300002)(6506007)(52536014)(53546011)(6916009)(33656002)(83380400001)(2906002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Q8Yht/Y7NIt/CjHcC8losUfa7Yvc/g+R3N+TlPwMlnDbkxUcS8UKEWfYHl?=
 =?iso-8859-1?Q?9g+MbPx636CXAQKa7+7CZTmrAzUOBU3ERZUpq1wxOYbrbTJe609v1PYmRQ?=
 =?iso-8859-1?Q?+WjZCy24QIo1rij+YFrKZ94fNEoz4N3o+UXTPkCC9lcDl6qqI7nEKkHdSz?=
 =?iso-8859-1?Q?08pxOurswp3S8ytKvgBlHWggTlYPfcHSR4jJ8FBQr1XryIGAwcRGXx7HpC?=
 =?iso-8859-1?Q?AaX72RJt9iYVKfo7zF4Dx5/mxaL0aEq2rVgoP/sYpXJT3OMIDXpAcZw0TS?=
 =?iso-8859-1?Q?ikZKJ2JTuLXrwsPpBvdaz2j9SyTh46tYZA8e7W94PtShLaY3iLUAGhNEcx?=
 =?iso-8859-1?Q?Hdn3vFn0K+QCzo2thdPVt6yesvsWJw9/cfPBuJNBFrX5CVwQ5heaUd1SW9?=
 =?iso-8859-1?Q?I8Cx+4K3SLGVm96SNBDzhY0cZi6xGM6ZgqT0xneAfCaYnQwHL1w5uCdOZJ?=
 =?iso-8859-1?Q?NWOYx2Nff3lj+0UMZJTpOIW2/g00T2Vm6YvTk6HUe8tie2sw/fVJGnbIRO?=
 =?iso-8859-1?Q?XbWMQw0l3peMIDBNaL0sSN/kEvFQz8Axb5utKRU8qXo8YVSq4vi98HlWyt?=
 =?iso-8859-1?Q?US+uMjrTK7RlG0rbj9pUyK++FofGeO2GHxJMxhKGHd3cQErBZhpzVsJm5g?=
 =?iso-8859-1?Q?bIazj9R75nRuzI8g64pw5RdJl5L7Mq9N/kgY6u2IWvrVbkXbvgJ7gz6lVv?=
 =?iso-8859-1?Q?QGl0VAdAXeTuLkkTo+D+0xiRmE1kOb7DJ3UaHpSr4WUyQOVKkuW4n4eurm?=
 =?iso-8859-1?Q?5qLzk53YfmXE7GeVq9B6+HxdbZuDKVnYW2bxC2MCFGRpQOkJ3j48zGQxAp?=
 =?iso-8859-1?Q?gEw3GS0zXRjVYBupazCewD0qDn3XPt/KGMwp/JQ9Ew1vBwZL/z5W4TBTB6?=
 =?iso-8859-1?Q?DeoQkEfiOEwJgb/RRo19Iue0rrBn6YJS2OFm/gFm5LPB5igXeeNHYmi6C1?=
 =?iso-8859-1?Q?INLlASWyZkSLuSL8pm44bTbAKSNI4gZLQaXB5CMCGUq7hL7kw8A4+1O9lp?=
 =?iso-8859-1?Q?k1geHb2LPNf9VeD7y7LxR7UPanEKE8pYvqEnvMVDTIjLouAwIdPE8to7Yf?=
 =?iso-8859-1?Q?KhyiRmEJyj3zX7/ckTIu3KrNAxfs5Lvc4nLZruZVuub2XzY5BUi18NA7d6?=
 =?iso-8859-1?Q?RQFwZ6coE8q+XDe7CqkTZJfS1Ir5uuldSDqfpXtdRGUHxLtVIrqskgEfP1?=
 =?iso-8859-1?Q?CR68bQcSdaHm6WSn518eF7y5hJ0L8vpB9naE5kKhg4gMWw229WcNXmZ+el?=
 =?iso-8859-1?Q?U7Kk8hyG8FpX2IMUNns+oeEHpczcIy6XmRUuZAI/9ibLwJcNn74t+Ib7pp?=
 =?iso-8859-1?Q?RgFGXw/BAGUCCo30I/9uw9gUn6EGZAytFaveAwUspJeuDIJUMNWvY6ALcH?=
 =?iso-8859-1?Q?9o0yWAP20XDDAd2UzHUKukwAc7x85HHu9BeAm1NW9tD0o/GMbDS0yJIl7i?=
 =?iso-8859-1?Q?IxsQFF2/iQwJyXFtaX6JppGvBAcVMQOfmGAQ/gSUUv2vbteg1R/CYU9VS9?=
 =?iso-8859-1?Q?L9DYPQoHujtm0y08cpVMu+0zefsR1PhQsuyHohdk+TK6iDzQfEjAYUxXRG?=
 =?iso-8859-1?Q?6UaM30amp743LsdiTLhJdQZW4+OZWLLWEezqu1mjDFxLOKXs3bunaUcRqj?=
 =?iso-8859-1?Q?Z268tpN+1ZUzQHYn45sMa70/wviFXywapWjYM2uSN6ec/KgqNuOvVUMT4B?=
 =?iso-8859-1?Q?x0iVjoOJxZ0zOuvScsw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61280af-1b64-45c2-1d2a-08d9b99b8b77
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 16:06:35.9593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T4Tyrga9FspSDWSZxTRtyjeQKGXPF1M8UMllYU5NQfB/IbZLn0Oss1nUE3IcUnmND9dWCD2l/S1AOF0a+sqshg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5436
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_080642_558185_3962D679 
X-CRM114-Status: GOOD (  15.31  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hello,

Please disregard this patch, as it was meant for OE-core,
where it is now posted, see https://lists.openembedded.org/g/openembedded-c=
ore/message/159312

-Alexey

> From: Alexey Brodkin <abrodkin@synopsys.com>
> Sent: Tuesday, December 7, 2021 6:59 PM
> To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org>
> Cc: linux-snps-arc@lists.infradead.org <linux-snps-arc@lists.infradead.or=
g>; Alexey Brodkin <abrodkin@synopsys.com>
> Subject: [PATCH] openssl: Use linux-latomic target for ARC =

> =A0
> Some atomic ops for 32-bit ARC processors are implemented in GCC's libato=
mic.
> For example those dealing with 64-bit data (e.g. __atomic_load_8()) as we=
ll as
> some others. That said it's required to add "-latomic" for successful lin=
kage.
> =

> Otherwise error messages like this happen on OpenSSL building for ARC:
> ------------------------------->8------------------------------
> | ...ld: libcrypto.a(libcrypto-lib-threads_pthread.o): in function `CRYPT=
O_atomic_or':
> | .../openssl-3.0.0/crypto/threads_pthread.c:219: undefined reference to =
`__atomic_is_lock_free'
> | ...ld: .../openssl-3.0.0/crypto/threads_pthread.c:219: undefined refere=
nce to `__atomic_is_lock_free'
> | ...ld: .../openssl-3.0.0/crypto/threads_pthread.c:220: undefined refere=
nce to `__atomic_fetch_or_8'
> ------------------------------->8------------------------------
> =

> Fix that by using a special target, which does exactly what's needed.
> See [1] and [2] for more details on the matter.
> =

> [1] https://github.com/openssl/openssl/commit/cdf2986a70d92668d882eb29737=
225f1aaafd0f1
> [2] https://github.com/openssl/openssl/pull/15640
> =

> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
> =A0meta/recipes-connectivity/openssl/openssl_3.0.0.bb | 3 +++
> =A01 file changed, 3 insertions(+)
> =

> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.0.0.bb
> index 4b1ae71a85..da73ed6bc3 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
> @@ -70,6 +70,9 @@ do_configure () {
> =A0=A0=A0=A0=A0=A0=A0=A0 esac
> =A0=A0=A0=A0=A0=A0=A0=A0 target=3D"$os-${HOST_ARCH}"
> =A0=A0=A0=A0=A0=A0=A0=A0 case $target in
> +=A0=A0=A0=A0=A0=A0 linux-arc)
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 target=3Dlinux-latomic
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ;;
> =A0=A0=A0=A0=A0=A0=A0=A0 linux-arm*)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 target=3Dlinux-armv4
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ;;
> -- =

> 2.16.2
> =

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
