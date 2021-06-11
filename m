Return-Path: <SRS0=BC9U=LF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E3FC48BD1
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Jun 2021 17:45:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8424613D3
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Jun 2021 17:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8424613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0A7/KopTlYMU0j1HhUv9thRZiPuxqKI0+8oV09CRStc=; b=sPvUWk20wwhcub
	i0baWONNuTzRxUUyga+41nUu5hL2brFL/ggVbkAAScSnDwLozFbuCOrIGt8CA6vf2p1UhZ3RdPFUn
	bBysLTKMT36K8gcTScBcMQ3uHHZL2rsiy02mZGizPaj6Rb27NECIQ0/pS29o67L8P1CtnA/DfgyNN
	N5mXjvFVUGGpMML0V6bWpowuGUYbL3IG7kyZiJM/aarDmmOC6C6rh2ZejqXf2fi4Lms2arUcCyZlT
	kSL4mdarMU1KHRBNUbUNzqYFKKaGJ9aBq6hzlB24aXcQeWShX4D2CK+iNaDpobUYv2yFi14QITUhK
	EIaUKJQG3UiHMZS/LzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrlE5-006MCz-2p; Fri, 11 Jun 2021 17:45:49 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrlE2-006MCc-AI
 for linux-snps-arc@lists.infradead.org; Fri, 11 Jun 2021 17:45:47 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3E398C09B5;
 Fri, 11 Jun 2021 17:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1623433545; bh=q15T2ZiGeha9JEzJ+wAvDHDj6US+C6sEJctonZeqUBE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=H2XP5R0MW527EfCeoOjgPQ0EnGc4XFe9ZAQ5hSqVkWWzYsLpL/88eEHQeJ0q580Dn
 K4A8OPTiP2VT5t95zFhby37nIC8W2aCCEYHR1Mj567SiroQvwnH84a2xIoEND2FoVc
 crDRzRxlL2ibo5CotOEBD0IhmLC5+MAZhpcIQfq4XWet7Uv/kTy3jgA1OYeiQ4BNNx
 LB3K3ez1J1u5ROJZQ2hc/9E/p1fxe5tIeEnLQpBQxU0ZpQtb6OsYRFdwF4ByycG3DC
 oHNX9sVPY57nNQiE4phGdg//XkxiFs6Y+pH/tp0cY6A2usmHzcZiMAwP4paZARwIeN
 LPY/QvyIPeN4Q==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 47285A005C;
 Fri, 11 Jun 2021 17:45:43 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5ADD140031;
 Fri, 11 Jun 2021 17:45:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="TEU2hKGu";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Im/vBrnDWBOcSFmImqD9RmyNG91vwCS5MvhetsKlz7AB3i1IQqtUK9dlDJDhWB2xNIID5k1xarHiAkZx2Ras0G2UPxCsxJjfPAikMIe6sSOmvz07ViisFT+0UPGf5cQYRlshQxOJxLZQ4yOcYghPDpZ2psx8UfhQvpnjoH8knjB36frHS1UnjF4YMoPl96cHg47GifFZGPYOjcx/L1X1IiAM0en0TYhXSBzgo46xcHl+BZiIBhGMl6HlrIytTNAmLF5VT+RNIouozyfpt+YrBQfSLH+PLqZKCJPvD4rrdosaBXP9T3+ocHJSKrDBjdfhI3G3vN2A2M78Ae3J9hjIhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q15T2ZiGeha9JEzJ+wAvDHDj6US+C6sEJctonZeqUBE=;
 b=YLG6/jJY7ME2IW/fJpEDiCh4oL/h+pFulFixYU88Tij/MKvu7U2ZaAbZXuluAvwz59wTNVlPJdHpIWoasiJQ9vjqSxcAKMtCFF9i7r6mdL9Y0tbtCBkg4knQrSWWk55WuUeR5BIk3vva47wBhOiPdjvuCaStHHEGj+OA4PN7hFaZIJtJek7vOVWWfCAm07/TpSPUEmVBXHTL5igoiqyu6eqbn/y2OKBXkNEM8H+3X9tFD1cpN/15HDK+WfFglWdqhn0mJleIe5ngyoCjW7e5237DZCopAUi0txvTwRRUmypyHo2TbdZxVqxO3ljYYK0ObUcwqnrzhf7/51Gbl8mRMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q15T2ZiGeha9JEzJ+wAvDHDj6US+C6sEJctonZeqUBE=;
 b=TEU2hKGuVn1X0Rv6cjgyZN7fWmZZAOQOZ2IkIDot3GX2kbE9eWXUAnjX6g+55EjShEb950FPS3ya1hD2dLgxKDbB2nWz1DNUSck3JLlxCTCaMTuI0eLhnOBex31gj7rp9mwcS/BMsdd/sD71CTTcgRUwoXgPPmZ7lHdow28AwO0=
Received: from PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 by PH0PR12MB5402.namprd12.prod.outlook.com (2603:10b6:510:ef::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Fri, 11 Jun
 2021 17:45:40 +0000
Received: from PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::a52d:d877:25a1:a7bd]) by PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::a52d:d877:25a1:a7bd%5]) with mapi id 15.20.4219.021; Fri, 11 Jun 2021
 17:45:40 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "linux-yocto@lists.yoctoproject.org" <linux-yocto@lists.yoctoproject.org>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [linux-yocto] [PATCH] ARC: Rename nSIM HS to HAPS HS
Thread-Topic: [linux-yocto] [PATCH] ARC: Rename nSIM HS to HAPS HS
Thread-Index: AQHXVlnjUCODt/2fgUyC3NiDmVdWzqsBOE0AgAABwauADdKtvIAAC7mAgAABB9eAAAj2AIAAAKnQ
Date: Fri, 11 Jun 2021 17:45:39 +0000
Message-ID: <PH0PR12MB540188610442B2CFEA05529FA1349@PH0PR12MB5401.namprd12.prod.outlook.com>
References: <20210531201641.2804-1-abrodkin@synopsys.com>
 <20210602210146.GA26712@gmail.com>
 <PH0PR12MB54014FDE72F1682196FEF1C2A13D9@PH0PR12MB5401.namprd12.prod.outlook.com>
 <PH0PR12MB5401FC57FA40A239F8CA20FFA1349@PH0PR12MB5401.namprd12.prod.outlook.com>
 <CADkTA4MY6iMDr4e+qxJzOimUyzDFVGTjr80W698Xm70WkLEgJQ@mail.gmail.com>
 <PH0PR12MB5401A764F799B18F11AA578BA1349@PH0PR12MB5401.namprd12.prod.outlook.com>,
 <CADkTA4NdaWrxfOr9sDKrUDj4+ssACtgxU2TN5kDWegdeubeH=g@mail.gmail.com>
In-Reply-To: <CADkTA4NdaWrxfOr9sDKrUDj4+ssACtgxU2TN5kDWegdeubeH=g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [188.243.7.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd9478af-d19e-4348-7090-08d92d00ba73
x-ms-traffictypediagnostic: PH0PR12MB5402:
x-microsoft-antispam-prvs: <PH0PR12MB54026AA5B36ACABBCE83B923A1349@PH0PR12MB5402.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qvrJHjTPclJ91lV747CVfqApBjs9DQNwYKj5qsRVQ2oXVxEC8BMpFmBss/kJU111aDs6v5FRTzXFTyXHk/3Xpa9OshqL4AzBFbhMdtELfxz+oIozQrE6DwCLRNDuZW0RHR+sNvbr6QM1G/Rav3gXf4BrrwH2CgTK+PWovCId9qGFsqzvMihRMD7Iz72cPMW+21ODb3h0QZsLtH0UFzwkAobpeco9edDnwMNHsj3vCGVqN0ynFKNHdLXolXaXGO/CyErRK9tRBhZQss50fCIfGsvAVNiUjSuQQ1e2isT+GAhiFLOtk5JgQj9I6G9hDir96HmX7Cul9JdvClfm9vSj+zOEillApoDUYyeZ3kd0ckYcJ3bSXIoeZ0e82Zq7VJpRlxdA6y8UPzduK6YXyg1dMs1cwIhfQSIhtGmPXXHKCoWpCiMJNfpiqxfBW4Tna8JyttPab+d4EBxd5D7SPSi5BdRyZycWz2YNmnIZWQyvQFl2G671yAw8dPVC9dihgSWs2IXeGAsTydTLpmZATCl2n0tq3yd5d1u9cT1V3cev/4RjmooGBiSQKdlUp9WC43vuCwpV8DcnnkSqPnZwQmy7K+XM5L/4ADcXb2MsR8W/fOQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(396003)(346002)(39860400002)(366004)(8676002)(186003)(6916009)(26005)(9686003)(8936002)(4326008)(64756008)(66946007)(66446008)(76116006)(66556008)(91956017)(52536014)(66476007)(6506007)(38100700002)(7696005)(54906003)(86362001)(316002)(55016002)(5660300002)(33656002)(2906002)(122000001)(71200400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0fbDaq6Llz9ys48+tLD/ixiA89etFxBiwNtsNr3xeLtYPyJs7DMzA1vUm3?=
 =?iso-8859-1?Q?nWnjJlmPHd+oCM9xd3FPNj7jXadyvaYX1n0FpHJ7h7qrmGS27EQSlBN48o?=
 =?iso-8859-1?Q?mdmdabPjGg0jQs8MaJqYCLN/hNm3M0LFFqY7+Dtrc8UQmSi5zI+mIY98+5?=
 =?iso-8859-1?Q?MoJJwP0139vOpBr804p90EZNScxlFtBdJtNjzkqVYnMusutpwC4/qmG6ZN?=
 =?iso-8859-1?Q?1WK2eM+lN6d6UZRv1hVpNSshZo+bg9rWzmdbmJB5t0NOLpwIMtsQ/ODwg2?=
 =?iso-8859-1?Q?LbTB2ARuK6IYR97k827NWtWRZCEH9ixe57qmG4Ty+Kt2gz6LtJF/SWMscZ?=
 =?iso-8859-1?Q?GEsHTENby6bwFlBzlH1TPcYg47A+mfy+cmvT+H/m8cE6Ursrcl4tMIdw96?=
 =?iso-8859-1?Q?r/DShinIHVm7XJD75eh0d5ZightiJjkoI1jjvw4Ud571Hanf9ksuBtiT3q?=
 =?iso-8859-1?Q?OvZiZF3d5KkNnvll2eILPDXEXvna0JqHio6MnZr/9rqQx1VOBhAAwSjv5r?=
 =?iso-8859-1?Q?yJQtN7S3fGeS+b+KHbJX/gJ2uJP9D3EPuWSM1dT12LZhTIaTTR7JXyRXbB?=
 =?iso-8859-1?Q?ixwrgsqTteljBo1L0H+e8vDbUpCdZ9fMtklrTlvLmnWL5+rraCqfHGRaM8?=
 =?iso-8859-1?Q?oHh4o9jZJ8UNZrqbsqrgMznmU2gn/7nakiv4CIhCRdZPnhU6LWC5MbkoBs?=
 =?iso-8859-1?Q?8+pGk43rOVzgA0b129Pw6vjZ/4HzqqAaXnU/CSRRrRqHKorS/ZF2cFVHUT?=
 =?iso-8859-1?Q?XyR1BxslAwuOOIK4289rlW7hs9fDj7sVr93nztNAWcig13MKcWevMQe30n?=
 =?iso-8859-1?Q?CtNXIRUD141MS3pGeqWMs8G9QNkNo/ibw17XbH5u6gAbJjhTOEUCDnGHNJ?=
 =?iso-8859-1?Q?VANuqm78H60wr28QGpvBRN9rc56W5iki2cpXzSARu3pMpClz57zvlOvNhh?=
 =?iso-8859-1?Q?rBovmkuY7A4m1OTSCBqSpSx/YGs2OX7EINC4lhj4WLyL8w1of2JETK9q2J?=
 =?iso-8859-1?Q?YrjjILx0FSZXOm8f/kC77Snd4Mg3kxwPlE0ECtixaWesplk/5/Ec3B5SXu?=
 =?iso-8859-1?Q?CbYnkbUNi3ZpUnKmGR7Vt3KT1S8KNjsMTlSFRKCx4babraX7SikdoDvgp0?=
 =?iso-8859-1?Q?hNSbf5b7IdHgyI9gO3DXCgshQUIGtre6HmI1//xrNtzqUsxoXcIf0oJJcL?=
 =?iso-8859-1?Q?9lxRwWNrNG41YxmPwLXCMecuheyS+0ndDydu547GKuXYa8yJ35tiuuZhDb?=
 =?iso-8859-1?Q?CaAuVQrviCvxWHyOUWL7hw284GVAG7SfPGBXp33U0ePViJGR4d3kwChC+0?=
 =?iso-8859-1?Q?YKWSj6oBJus9Y2gZIY3to/kXNEYdJkXdNcNF/3Zt9scaLQuunFHe5jrNkm?=
 =?iso-8859-1?Q?uWgnXLW47C?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9478af-d19e-4348-7090-08d92d00ba73
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 17:45:39.9838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lrFt0B73CWbHCA7BZGg2bW/wc6VagnJAp3o0v3kNPtpGCh4IMBR+4BD02ydyUu3zCjovOBX0ZwvIpFLgomouJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_104546_437947_49154329 
X-CRM114-Status: GOOD (  18.04  )
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

> > > The author as it comes in on your patches is rejected by the yocto git
> > > servers, so yes, it had to be fixed up.
> >
> > Do you know what needs to be done to get that fixed?
> > I hope to keep sending patches from time to time
> > (and was about to send yet another one just now),
> > so would be good to make things simpler and exclude
> > that manual fix-up step.
> =

> Did you send the patch via git-send email ? And what smtp relay did
> you use (if that's the case).

I did sent it with "git send-email" as I always do. That was exactly my com=
mand:
-------------------->8-------------------
=A0git send-email --to linux-yocto@lists.yoctoproject.org --cc linux-snps-a=
rc@lists.infradead.org HEAD~1
-------------------->8-------------------

I used our corporate SMPT server, again as I always used to do.
 =

> The patch had a "via lists.yoctoproject.org" in the author, and that
> is what caused the server's pre-commit hook to reject it.

I think what might be wrong - on my first attempt to send it, it was discar=
ded
by the mailing list as I didn't have my email alias properly set in the mai=
ling list
settings. The thing is my internal and SoB email is "abrodkin@synopsys.com",
while our email servers nicely convert that "shorter and supposedly ugly fo=
rm"
into more beautiful "alexey.brodkin@synopsys.com" once email leaves company=
's
premises.

So I added the latter email as an alias and on the second attempt it was ac=
cepted
by the mailing list.

Let's see. I'm going to post another patch now and hopefully it will work a=
s it should.
If of any interest, I may add you as a Cc for it (it's for OE/gcc).

-Alexey
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
