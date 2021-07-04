Return-Path: <SRS0=w0ag=L4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BD7C07E95
	for <linux-snps-arc@archiver.kernel.org>; Sun,  4 Jul 2021 19:58:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E03AC613E7
	for <linux-snps-arc@archiver.kernel.org>; Sun,  4 Jul 2021 19:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E03AC613E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8M1PvIsOBTLWHhElGCishOiEK9ValkbOM0sZGldhfM=; b=plqvMei4bFGowI
	WkKyMPjhzUKYSVzuoSBsW0ZYWQeLFA0agMcc/w8WAdbHXvXLZgAarHRzGhP7bIXJ6zzkHa6cPjbVt
	0JwE2BmJ7yiTTtesVDoQoOHBk5SMYzsM+pxD1F7PJaoQWLtfAZGQ+yh0hTXToVBaozl0TkswUu5Mc
	Jzi/lX+5iJpzQMr55GvLdHuToi/uGtVueOVJteccU4aol4fa8tfDT46v1XdGoaJBVYvha4vfoSLUR
	SUdZeUYvAXDI5rnCbzq4zGlf6j/KJ17nDk7798N/8UUQYVR9n/vo9K+LQQ3JT4qJzkUrubPbzJ9Ez
	h4YW7CEXfMiBZ8RVkjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m08GN-006hdu-Cx; Sun, 04 Jul 2021 19:58:47 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m08GK-006hdW-1V
 for linux-snps-arc@lists.infradead.org; Sun, 04 Jul 2021 19:58:45 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 20608C0AC8;
 Sun,  4 Jul 2021 19:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1625428721; bh=nxmHpB36MSR/fwBkzr8IRiDk2p6Pp51uutFUV1An0Jg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=YdWtPxt437MKzdGNgQ2NF5dfzTLixnwPjbfYlRaQIxfGsJR6ZH9v8TD1Vf2Vo+wZD
 g3Ucx+z9GvbLHf60A28f9EmWyoYDUpRdIHslrxtN8VKU6Ea2WNT+fW6xkgdqH4WWKe
 3vdJJxj0LQGPZrfPfAbO5PooxoCa7b6eq/N9IgV6zQDEyEZsR8GZa00aPuAjD37RMM
 COKbv+np2T8HbO+5NhczmRwuUrrXLgKDGTVJy+xuU4bu1rDzziuhxDxSot4p/LfXzw
 IAxwReKVJUvir/z7KD220XCXmykNbOCdN7ohOY2BRnresNJf7jxx5S/IuOmTpUZxUx
 SZ4P8Pcwn7IDA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id CFEA0A0080;
 Sun,  4 Jul 2021 19:58:37 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id F08D440145;
 Sun,  4 Jul 2021 19:58:35 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="tvNDaquk";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbM4TkZjwYpJoQodczvsCuvHJHnVTOlFEB1IE0mY5Vf6dyXWF3EOkkaH9f3hUL8MNd+D1wbTbQhFGqVd/6gIEOumJzj8ylitLNw7UJkom3qXsYOA1VgGebP7NBV82IUN9xx5/qKNhPZoeyKkju+GoOB7nEZZqsqJg+iDHAy1bq2Apxjs+y+7dMDnGhDbjmJPkCDsaEuw+y/ziB+g5vjSk0dY7ptt7YebzqFdcwgvGDiam0cl1qxzWYd3dLQYNAvFwRHfQIyp4yo/A1CYoLP2Kq8EMtThsq+KR6W9iEJdBaxclwgt+Wk9IUwJU5ylfSWD5AMzAtLiUpB37b2N9woYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DraVdsQo7vhk7PWIgRx0qwBPjY6hiBJWIwOI3R2EaJA=;
 b=XGZggaLVVW5zJhhrEYpYU1vr1WNtAHDpcTdpHj2nCr7seHEZ0HBvbHrC9N3SntUGN8d4CzGsyqE+DVpcif0Jv+wKGdlnwYRJ00hBouzKAC7l8jJ3aQF+6k08wdyk/LKINegc51NOiWOuLTSNq8M/eDI5d2x6Q5qHJSfiKf/ZNdyLef/wAgyte2g9X4RAzRXCvLvU/uvIcs+52/vN55ke9f0dsSYWjKBVeGb6X3aHeLN8wztB8Ct3iFi9eErGalnMKGG/IANYlyUuIESTifwzGXWG+JpYDrpvaZ7/C1abxZFSEtE3cKbax6qxngUMGB/wRG9xbGshO4jFjwOHUp9TmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DraVdsQo7vhk7PWIgRx0qwBPjY6hiBJWIwOI3R2EaJA=;
 b=tvNDaqukFkbaYimInSd+5EeR+lvXE33ZhEPyZCUYtbUCZ7w79xXQVX6BWOlAzll2eAvCC3zkCrnNCLFSmD3gYteJlV81lvksKaeoHTklDK+KWJHHDbHI2uEk5suhHf5onxWXgrFyEYs2SV7k0bg54wk6UMSAzisenkXUtKP1reg=
Received: from PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 by PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Sun, 4 Jul
 2021 19:58:34 +0000
Received: from PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::ac74:26b:6f2f:510c]) by PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::ac74:26b:6f2f:510c%6]) with mapi id 15.20.4287.033; Sun, 4 Jul 2021
 19:58:34 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [OE-core] [PATCH] dhcpcd: add ARC support
Thread-Topic: [OE-core] [PATCH] dhcpcd: add ARC support
Thread-Index: AQHXb3agse06ROj560GCuyfCK5cq36sxkigAgADeIww=
Date: Sun, 4 Jul 2021 19:58:34 +0000
Message-ID: <PH0PR12MB54013C765B31173E898CAD8FA11D9@PH0PR12MB5401.namprd12.prod.outlook.com>
References: <20210702191521.28757-1-abrodkin@synopsys.com>,
 <YOCrKpzbRZjmJGLq@piout.net>
In-Reply-To: <YOCrKpzbRZjmJGLq@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [91.237.150.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06b32e77-2df3-4e5d-3d0d-08d93f261adb
x-ms-traffictypediagnostic: PH0PR12MB5401:
x-microsoft-antispam-prvs: <PH0PR12MB54012C2CC9038C692D528250A11D9@PH0PR12MB5401.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xUJexJr240hvjumcnhWSKhduAiR9eAt4R3wOu5qs7mF6zFO9UNqQ2AlEkqqe7BwWm3wkrXu7Q8KUvTavlbGsXkoiDvBWV7A0VcxpwGMBVpZJLRjwm+DnGjAUdPmbfttLRtLKLiTiKWARSsu91SMggfqU+cg1vM8xTuvUv8OLLBaHTWpnstYzMwjjqaGlYNTiaF8WO6mEHb5p8NtcOdYIJeJsoX/OISh2P/GgMhbVUaTiQZ+alj1S2BYDBM29qzL4XsJzoqtEBPmviK84DMR423xv3sw3qzi6+/Ta689vLWFFCUQ6Xe2MrZc5PA24RC8ReCgk5R15Pv/Pt08iCrzkFppr2zqeY0aXKNwjoDxXiYYQQ19kiClemNelOxEvOcVgqi5IXzVmiu0Q7rzXP4yvVYa1OUxwXlpHUfDhQGIC8yW1mwGmeWZ0qszAscq2xZsb52gR7Ek7AfmtC4vjZjddJQmY/SywZqLyrrNzCR4fF1nlyhjtdmfMaIgBkQj8A2GEzPiuU8HT0JOTtCnf8M3DNoLe3SrFAIrRzUdzdl7JAO2vmilwXdwDnL3qnIgcohthTi+dKMHvzWakXYJ88Wtbrv3AiaillacCdjGw3114dFQIgfgWgEIdbFhORbN7eOumyoNMCMJWLWE8qbd/MxtIXNt0Ku+H8Kzo4xKM6Gv7YvlsKBhvg9ASEE1F3GGrUVBo3iCMAf7iOFXEEvWE2X7eHYNhmj22WmZvCimgom3kU2b7vKKrU2LS/c1+XBox/3NvUSbXKmCs43WnWN/FBks0Pw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(396003)(366004)(39850400004)(64756008)(91956017)(76116006)(66446008)(66946007)(186003)(66476007)(33656002)(9686003)(55016002)(6916009)(26005)(66556008)(316002)(8676002)(7696005)(71200400001)(122000001)(4326008)(6506007)(54906003)(5660300002)(86362001)(966005)(52536014)(8936002)(38100700002)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?y5i+jwL873CX78qKam2g82duCKoKA1fLbyRCQGUiPmifUu/JilGRQKgYzp?=
 =?iso-8859-1?Q?3Iru/6EZlwwzuzcXhm/SMIJXMoup+HvIlE7Wi7ZZuZfO7c9ocBhIxKKjad?=
 =?iso-8859-1?Q?WZFCgHSFp/KMzBIPBOnsLtqX7QdgHQtkzgcTS+gJBqpfYV3TBrES/Qyy0I?=
 =?iso-8859-1?Q?o0WetpXulYi/njJVGhtLUgw+++h7RLosuutsKNC041x7MLV8aLHUoK6LOV?=
 =?iso-8859-1?Q?B/l6urk8zytL2+YmKTvmbTTi2LOBMrmrI+jUK+jtU6bBjXeHHwNSl9eBSj?=
 =?iso-8859-1?Q?swgYpU+ycIuj5lNRurNK4w9YuuJfXY9iv0fOAKy+FWdBRXZmGDsiz1cBNa?=
 =?iso-8859-1?Q?+pk8aZxVX+vq3uOMnTJVvKe+NWvpaxOibSgZZqJEG7PEeZhNrS6JDt90cR?=
 =?iso-8859-1?Q?mpxmKDshqrjPOVR+w9xqCzuEvcEYKvdecKRkHfdTb86YCk4bhzyPaw44J1?=
 =?iso-8859-1?Q?jqmZF6mldeCThVJ0RReEoXB2Py8gDcdqpVC4GffcSvGMfFxMKRjQQBqclR?=
 =?iso-8859-1?Q?PvOHOtY0c+/4h1jaR9zBK0Rn84l/qrpNp2fcUzPIlxst1Y7oz5OsH2fYP1?=
 =?iso-8859-1?Q?Vdz12YXV/T/Cj5hGRg/cc/aD0EX7GbTSPu+utQWjdBHwQANiplZmOC8zBG?=
 =?iso-8859-1?Q?OsE44oF6HcDdtOs8gPOICJl3R/npsgyh1vBJ8f14CE7kdAVdE8NxU3eS20?=
 =?iso-8859-1?Q?r51ncbyETqrI1o4cp2BG/DC75LKwofMVbJ/MvRGgwnDEFoInu61MEfM06Z?=
 =?iso-8859-1?Q?+iuYIUthTjM2ImurQsH6XidoRF32cqNXDe2ID/IHQDrGcOQ2u7CH9vOknd?=
 =?iso-8859-1?Q?iK7roUXm5ygdqPtl+FWm7L3225bIrgAsVJ1nnj3SkXKZDIvNyVkcPfnOUd?=
 =?iso-8859-1?Q?yLBQilIVo30ue6X5hZxzxjonNvvr1zHVYXO0/q0Vd+ap93IUt2r2MJU71w?=
 =?iso-8859-1?Q?XiEY5wHLY4J3OFRiU4bCLxUcbdkeoSTSOXzqzgBy0RW1cJOv5F5uf66T2+?=
 =?iso-8859-1?Q?QBNMPa7KNn06WTeN1F3qu2zCqc+RNDOKBjqS797sWNfzDYqo2pTDbZrVGz?=
 =?iso-8859-1?Q?zwVXPT8vgkkxwft1rNelcQghYzaHBU3nFG+dbqlZ/B5Mvg46v9pbFaPrT4?=
 =?iso-8859-1?Q?KKmtXyEjOLWXF12iaHVxJz0GClny//zEbRXBJBJYMdue8ho8vHNdor2xuB?=
 =?iso-8859-1?Q?SqDcGIHeCGPHfN84K6t7WNZKc1BvUks+bCThzO8b09VimkH3mq2Th60mnu?=
 =?iso-8859-1?Q?VMAnNNcvTNKKa4zPsbXb2m4WfXIUe8ccynkmZWUj/0vySvLPhgF0D2sQq8?=
 =?iso-8859-1?Q?j/JRCfvb8D/JgJExAVmrrh1f4TJqJGlWyut2dVQNWDohEof/N916pQAv6i?=
 =?iso-8859-1?Q?An1NOshmc3?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b32e77-2df3-4e5d-3d0d-08d93f261adb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2021 19:58:34.0513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kFLES9V5PvebYajZIbZils3WA6EJVDGGNc0k553UlKqIol6X32FfIQQzbT2f1SW3bnxXelqU3Iu8Ptcz+y0v1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_125844_233273_F0AE81DA 
X-CRM114-Status: GOOD (  11.60  )
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

Hi Alexandre,

> 
> I did run that through the autobuilders and it is working fine but this
> is missing an Upstream-Status tag.
>

I was a bit surprised by your response being under impression that I did
add "Upstream-Status" tag in the patch. So I went to check... and indeed,
I added it, but just locally, never "git add . && git commit --amend", thus
still have it as:
--------------------------->8--------------------------
$ git diff
diff --git a/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch b/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch
index ec895143d8..045f06a9aa 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch
@@ -23,7 +23,10 @@ https://github.com/wbx-github/uclibc-ng/commit/afab56958f1cbb47b831ee3ebff231dfb
 Fixes:
  - http://autobuild.buildroot.org/results/d29083700a80dd647621eed06faeeae03f0587d3

+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/82386110e67cf75c224e9817fce55e6b0f143266]
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
--------------------------->8--------------------------

So thanks a lot for spotting that, will send a re-spin in a moment!

-Alexey
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
