Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36391C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Dec 2021 20:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6Ly91zkDNmK0ow2zplqvqp9quAGBnf/sVJPhLx/Fis=; b=c0xtbZvHoYfnqp
	wAdVuAD9HmgL9VfnCM+U5enN0XrCCJvxWxnX3bKhFF9mtqsTc3HAnu8rsxWtwaf3OeKRkFEql45Il
	yQdZJKe+Xyeg0v1Y3ECttrA+n+NAkpn9TFdId7bOlaxsOL167zOe76h1q+yYTFhA/EeRnKEJi1EO+
	v4HHwKOMatYTExxDXN22nyxJzlYmoKE0F12L9fXMLHMVDSdJWgqg0ifi2cesC1KHITwcuf2jjyMcC
	YzZXV67VVswTc17sUOhHv00c/oqI35sC0jxzcVvgBHM2JUJz0v4WDMMDkXVzHMUEt9u6d3mrWglH+
	HxYViJ+VBZDRPK/Zynyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msWHH-00A3sY-24; Wed, 01 Dec 2021 20:32:31 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msWHC-00A3rH-T1
 for linux-snps-arc@lists.infradead.org; Wed, 01 Dec 2021 20:32:28 +0000
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C292EC506A;
 Wed,  1 Dec 2021 20:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1638390742; bh=CD0G7b2xNnaVEWo2QMfU/CiAedg8nvdVf9XX3FPBufw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Y3VXUVAD2/yPOmfWqNeprVOFUbxy/bTG7QpGS+SrBvJmbvPJnEbdFyftObPbeiqGM
 OHGC3+wp6fd8v0fKvUDRmmAyGpzppqZYUJyBbJ2fNXLI1CQ0Q48Beg6Omp9weR51ei
 /1o310SL6+B2GwQoN/5edLJQOFB633BmM8su/4nYKy393VVNXENor6BUQQBr7EmTly
 Hx+Xt/y5rr8/AtwLp9WwPEvpXRx28BPg1g5Vqg1tKiLiEaVx6onxp8PmzyTHQ/ZBty
 NO3vtKjfQo9VOLIgAHeCSUUCUns7STYwZC4wR7zJLoBUsWotNrmbWfMBiIfIl99Nn8
 LeL7ChfWEHt0w==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3C1FEA0081;
 Wed,  1 Dec 2021 20:32:19 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6B1C580056;
 Wed,  1 Dec 2021 20:32:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="KusSkh04";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1x2Mr5BA8Abya3B+S6XC3XZPihxh+mQmWWeKiKskPZGlRk/c0VF+eRmQWL3DTgHZQH9try909mfHomGbBim+KBsoC6fS0ixuimM5Uh3hRBFoUSwu5dnJA/GbUHyOw91LZNH9FeXiAIrvBDIDDB6UW5I9pwiLomMVg4zOXoRGJyMqNHvRx3C6R4+Qk8zWjt1S4rAvGrPMG4M1V86kqpCEoRjlY4aZMfFgzBHKzMn7yywM+NhtgjG5kZbAeDzD3us/uCdNdsAXb2s6MsUhsbJ9SXObp2Xj+pYuPTnfutye9MD5U5/2f7YDPzHD6BE3ql/4pvWW3Wpe689IIrRWOvxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+lhztOxWi0vQHm7dlBZJNE36dya6Iwj+aCJoamGbuQ=;
 b=T7PTxnyIyL5SuAjOZpaVcs34rAM1vT7DV87rn7MjkC+yYZUrlPBkcD3+jP8WguSFFqfAib4W05OMRpNdmROE5Y7RJ4TEP4LNPFvqgJxbud1l///vn5xh5U2q24q6zTnheEBNNTBRwzZMolBagUOAE5ftKvSP53G5cfvFy1ycEhxEwJKR0rCXGeN3Owtf2xPIJP8c4qgqzGkXU3YVNBo3l4gWbuZMRQEXg8fCURqSog+AqKbk/K7V1FIQKaKI4z4Qa64ZWdZVUX72KMleUpOchMWhfSTdKqTAENMIXeV93PLczzYQ0okO4b9CfdUhvZvq+oQtFBVaTa5k1DyrQ4VjVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+lhztOxWi0vQHm7dlBZJNE36dya6Iwj+aCJoamGbuQ=;
 b=KusSkh04ryLPttohH0yBdZ+6g0VLjtc2f/2x7ijCGSTAAYtMUSQ5V+o6ZSxtz7BdCjd6mgTQs6vkI3YiBwCza5xFUt2tz/YamHl6MvtzMsI7amCB/OSTWc+OSLNi8IX7LOP26Qpg9JwV1uArLlb6chG1tex7oN85DXgMvlQBt1Q=
Received: from PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 by PH0PR12MB5466.namprd12.prod.outlook.com (2603:10b6:510:d7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14; Wed, 1 Dec
 2021 20:32:15 +0000
Received: from PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::95bf:94a4:e746:d70c]) by PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::95bf:94a4:e746:d70c%6]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 20:32:15 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Jonathan Corbet <corbet@lwn.net>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Vineet Gupta <vgupta@kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2] docs: Add documentation for ARC processors
Thread-Topic: [PATCH v2] docs: Add documentation for ARC processors
Thread-Index: AQHX17dUyYYH0jdSEE6Xa5YniPzLXKwbKTOAgAMMOK4=
Date: Wed, 1 Dec 2021 20:32:15 +0000
Message-ID: <PH0PR12MB5401E55A4E8D1D7360C02E68A1689@PH0PR12MB5401.namprd12.prod.outlook.com>
References: <20211112065059.7273-1-abrodkin@synopsys.com>
 <87fsresjx6.fsf@meer.lwn.net>
In-Reply-To: <87fsresjx6.fsf@meer.lwn.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: ea871cac-4543-e287-b8f3-01aa4487fbf7
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f175df6-cb11-4e8e-26b7-08d9b509a96d
x-ms-traffictypediagnostic: PH0PR12MB5466:
x-microsoft-antispam-prvs: <PH0PR12MB54669D5E1510C0C3AFD8D936A1689@PH0PR12MB5466.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jDDfZUYz0iuPwPvmyzynbdoHKXxJUbRjBB/84Af8RRoAtpWYQcFbx09EN1RQy+ncQKCt2uZkNpcdgH3YwAPo3PiUfXt0E7rDNxaMoD6I/E5ENl1BHKMdvsvsUffFbu/UfFZAab4ibnX9Ga6ZZL1NdNoJ2s+NiJdlvMi2/0L/NND+rwTTCaKVySZjOd15iKVusFUd6i7ToyVyqN69sE+dISpwgM9BttAXUV5vL+qsQHbUCIn9rw/alGsCrOW7OO1sr0y7kakjuyPaMLy3NI1oIZM3rGSJIGVe9Xlri8v1H0xFhPNZuy2fHmGQDpTwA3X7B3JEMpw5FdhgsiX6XxXIbrWCymWFx2C9uaZQrUf9uwQU7KdncN6xzSUGFHA6/fSFdSgs7II/X74wHN4IREvw90mon+feSj9BkjHobEhf4rZMC3tk9s0eCPCh0i3gruQPe8FMdJKVXF2IlvllqW/rvMloWLeLLE5b2fzR9gtaBio1JDuNlWwngW8TFS+FSInIqd1nv5VqGV6EZHYmRHSwP/wBOQhHF7bhTBqxZhtXFvykg8hI4qNW9FCtJ8qazMwSXA2B7sJQCsdLytRwV929YsUPX1A3sG4Hx9Y21sJYFygvF48F83NeBCXPB92lHdI6ezBznuuU1/x1PXj6jxPAKcnr/0SdAFk+HSyBgfRzZrV0Bh7aU5n+GJECJ2yU7YAfP7NPay95sCdgwqro9iDbunZRwnT9FfrhxUIISUKNEnoyE9QccLTC0c3ncfVRITc4onZk+fQhbx4xYrGd0X+loHrEAwnyZeFLt/ci3BIZpe8OeNo+OQtoRv4ETunm2pVG1nDKMsCfu9021BnAzEzxPg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(55016003)(76116006)(33656002)(7696005)(4326008)(6916009)(508600001)(8676002)(8936002)(38100700002)(6506007)(5660300002)(9686003)(66556008)(64756008)(186003)(26005)(54906003)(66446008)(2906002)(16799955002)(66476007)(66946007)(71200400001)(52536014)(316002)(86362001)(38070700005)(83380400001)(91956017)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QY+muklPZ8WFaFx8MYMel2FdcfYmjuAmpFjsu28orvzxiZhmc6uDBAjpYH?=
 =?iso-8859-1?Q?kxbF0ZWqm20Z/UwXm8Otd37QvRDqi3GWJNhO9wcHnixjjl6Xc8EVsqJgcR?=
 =?iso-8859-1?Q?cMd45uO7+Sf1O2xtbdXUxkM9pp9LpE4+yj+aC6zb5xRSgs05KqSZexdYJ0?=
 =?iso-8859-1?Q?gawAj0DV0Bi29ylYewxr0j4HctNyyy77GTWicbPuCLQD903/izT8sQe7G5?=
 =?iso-8859-1?Q?Mni0XVwLWZD47aR9lS+/jGSmm895u++ocuPKTMTpIV2LITiSD2At/4xsBY?=
 =?iso-8859-1?Q?d93BE/4fxvPMlZSHbzIq4jUqIZdjyJ+h2biUnmCI6iGzFTYkAtD1fS6i2B?=
 =?iso-8859-1?Q?KHUCevTcL4lj0dFN4XzV+rI64Bt93Dq+s4e9K76Xfyw6PUdNlOcwZPn98Z?=
 =?iso-8859-1?Q?Ij+HfOWygsKPLsOicv5ZomYtNQRtvizlgUWhWjPxU/C7ALB0Oi7jKriafS?=
 =?iso-8859-1?Q?OehnGtO36IgwIuE+wPx0WIPvKorKH+o3NG2Z4TQXfGhzNhZ0fun4Zn6agB?=
 =?iso-8859-1?Q?3dP6NCZWmrBBqJ+TbCNRi83Py9aWH4L1yFFa2TQI888htVuPkCs7djqf8g?=
 =?iso-8859-1?Q?e3k91roJyoNYV2HkucPmsXTjAOBR5Ck/2GAlz23+FMc41ixhfjESvWjUj1?=
 =?iso-8859-1?Q?QIbRsreLtoSz5Z2dl2fjy185YF7Rwyr7eB/J85HZz1osCBTSwlRdu3G8u+?=
 =?iso-8859-1?Q?3dmuuocEZGXGiwDqQMYg8felIEEbCvDklkLeW2CIswl6ngIHAmusYvr9zp?=
 =?iso-8859-1?Q?wiizo/wUIt+ztLs1n0vKikhd2h+GF7BoDaawBz9Pv9sSUML6SPNa+5iFwP?=
 =?iso-8859-1?Q?ZmQIQchrT/7tZKiZytN5Ialn2i1areJRJ6w5K9iqELL76WfqeJbB6UG6O6?=
 =?iso-8859-1?Q?gg8o0Efu5KcRIXr65yFoABFRdtUPg5BxJTteOmDaNBelkTSCBkLBV4boAT?=
 =?iso-8859-1?Q?fXImjOeUetM/Nb41D74U7iqtuXXeMPfRkgmxoVCUaDWglrzGoj/pyunmMx?=
 =?iso-8859-1?Q?vAof+v7u3+EiA+UoAYD7LG0VrZs6eeVdx2QutWU4Hyzrv5o81oSN2T/13i?=
 =?iso-8859-1?Q?0Gd59WQgHIEswdoFVYcN20kpJPf0sFT5ndNReR22OaS/Jq9re771Cb2Yef?=
 =?iso-8859-1?Q?oOlJhNIAN4WdbRjHSgnaXW2jqbtwufaU3ACQxa8Sau8mwDKssLxJT/WhLf?=
 =?iso-8859-1?Q?7bodsfVexnvlbSuVEYUtDTHC7oOjSwzyKYYq5C09uSLkuSHc1nvyky7/wl?=
 =?iso-8859-1?Q?zmwNQTf93oQlcv4NLuXjWfnNqE/ZfouEDCufs6UlUJ3W03yNwau7VKivPV?=
 =?iso-8859-1?Q?fMzdl4rSBq355IRJ+C/2ThtlwMeXhrkmZChbCVXK5cmknSk2i0BTSPfo7h?=
 =?iso-8859-1?Q?swxmIAifUU674FhPFBOqtIpRtxYoVn02TY+r77C0x+24Cgj+H/qLE7lydN?=
 =?iso-8859-1?Q?A3BjyDl3FLbiStSE7IA0ADFaPsnA13B3KzaNo+X4quFedpcEJ3X/F0dVvC?=
 =?iso-8859-1?Q?BRSw68NrOZvtEA/6Yei7JM/5FJCIm0U1N9Ei4u1+/rOYAyxfiW06bgnEvi?=
 =?iso-8859-1?Q?ffD1I17eipVNeaKGIf5FRE6kX6wZ8uep4Ub/aiYuUG3bMNVk5pFf0eWuXx?=
 =?iso-8859-1?Q?CEFwbmcJ6Zknyp12zf7q8HRB7YPe9PIU0ocjbL9yEmZGYR7tgF7bwMqQ?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f175df6-cb11-4e8e-26b7-08d9b509a96d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2021 20:32:15.0725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DBeYz9Wn3Tm45kuJxyofGER5rZpEjaQzDoHwqK9P/RqFSrhMZ6bi2+Y7A5vZtXWnEm18pcSqLaE/3PSpCe63zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_123227_011772_8C3B36CC 
X-CRM114-Status: GOOD (  23.15  )
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

Hi Jonathan,
 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Vineet Gupta <vgupta@kernel.org>
> 
> I've applied this set, but I have a couple of quibbles that it would be
> nice to see addressed...

Thanks for taking care of that!

> > +3. `<https://www.synopsys.com/designware-ip/processor-solutions.html>`_ -
> > +Official Synopsys ARC Processors website location, with access to some IP
> > +documentation (Programmer's Reference Manuals, AKA "PRM's", see
> > +`<https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-HS.pdf>`_)
> 
> This manual requires registration (with a fair amount of information
> required) to get.  That should at least be mentioned if we can't find a
> less obnoxious version out there.

Well, I'm afraid that's the best we may get as of now. I wish is was available
with no registration whatsoever, but at least it could be easily had now by
wide audience.

Anyways, I'm wondering what kind of mention do you think is appropriate here?
Somehting like: "note, registration is required"?
 
> > +Building the Linux kernel for ARC processors
> > +############################################
> > +
> > +The process of kernel building for ARC processors is the same as for any other
> > +architecture and could be done in 2 ways:
> > +
> > +1. cross-compilation: process of compiling for ARC targets on a development
> > +host with a different processor architecture (generally x86_64/amd64).
> > +
> > +2. native compilation: process of compiling for ARC on a ARC platform
> > +(hardware board or a simulator like QEMU) with complete development environment
> > +(GNU toolchain, dtc, make etc) installed on the platform.
> 
> These enumerated lists would render a lot more pleasantly if you
> actually formatted them as RST enumerated lists - with lines after the
> first indented.

Indeed, I'm much more used to Markdown and there it works ;)
So should I send a re-spin with fixed version?

 
> > +In both cases, up-to-date GNU toolchain for ARC for the host is needed.
> > +Synopsys offers prebuilt toolchain releases which can be used for this purpose,
> > +available from:
> > +
> > +1. Synopsys GNU toolchain releases:
> > +`<https://urldefense.com/v3/__https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases__;!!A4F2R9G_pg!N40JBI0hlr_f_ZX-pTGEO-vBvxNaA6NF4WYKA3yamILtuUOhgiEsFqRLfdx9VfetWmy7or8$ >`_
> > +2. Linux kernel compilers collection:
> > +`<https://urldefense.com/v3/__https://mirrors.edge.kernel.org/pub/tools/crosstool/__;!!A4F2R9G_pg!N40JBI0hlr_f_ZX-pTGEO-vBvxNaA6NF4WYKA3yamILtuUOhgiEsFqRLfdx9VfetayTOVRo$ >`_
> > +3. Bootlin's toolchain collection: `<https://urldefense.com/v3/__https://toolchains.bootlin.com/__;!!A4F2R9G_pg!N40JBI0hlr_f_ZX-pTGEO-vBvxNaA6NF4WYKA3yamILtuUOhgiEsFqRLfdx9Vfet7I-6RoI$ >`_
> 
> These, in particular, render in a pretty ugly way.

Right, here it gets even worse due to missing newlines. Again, fixed by:
-------------------------->8----------------------------
diff --git a/Documentation/arc/arc.rst b/Documentation/arc/arc.rst
index 249d03c6be8e..4dbd107f02e6 100644
--- a/Documentation/arc/arc.rst
+++ b/Documentation/arc/arc.rst
@@ -10,23 +10,23 @@ Below are some resources where more information can be found on
 ARC processors and relevant open source projects.

 1. `<https://embarc.org/>`_ - Community portal for open source on ARC.
-Good place to start to find relevant FOSS projects, toolchain releases,
-news items and more.
+   Good place to start to find relevant FOSS projects, toolchain releases,
+   news items and more.

 2. `<https://github.com/foss-for-synopsys-dwc-arc-processors>`_ -
-Home for all development activities regarding open source projects for
-ARC processors. Some of the projects are forks of various upstream projects,
-where "work in progress" is hosted prior to submission to upstream projects.
-Other projects are developed by Synopsys and made available to community
-as open source for use on ARC Processors.
+   Home for all development activities regarding open source projects for
+   ARC processors. Some of the projects are forks of various upstream projects,
+   where "work in progress" is hosted prior to submission to upstream projects.
+   Other projects are developed by Synopsys and made available to community
+   as open source for use on ARC Processors.

 3. `<https://www.synopsys.com/designware-ip/processor-solutions.html>`_ -
-Official Synopsys ARC Processors website location, with access to some IP
-documentation (Programmer's Reference Manuals, AKA "PRM's", see
-`<https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-HS.pdf>`_)
-and commercial tools (Free nSIM,
-`<https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi>`_ and
-MetaWare Light Edition, `<https://www.synopsys.com/cgi-bin/arcmwtk_lite/reg1.cgi>`_)
+   Official Synopsys ARC Processors website location, with access to some IP
+   documentation (Programmer's Reference Manuals, AKA "PRM's", see
+   `<https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-HS.pdf>`_)
+   and commercial tools (Free nSIM,
+   `<https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi>`_ and
+   MetaWare Light Edition, `<https://www.synopsys.com/cgi-bin/arcmwtk_lite/reg1.cgi>`_)

 Important note on ARC processors configurability
 ################################################
@@ -53,20 +53,22 @@ The process of kernel building for ARC processors is the same as for any other
 architecture and could be done in 2 ways:

 1. cross-compilation: process of compiling for ARC targets on a development
-host with a different processor architecture (generally x86_64/amd64).
+   host with a different processor architecture (generally x86_64/amd64).

 2. native compilation: process of compiling for ARC on a ARC platform
-(hardware board or a simulator like QEMU) with complete development environment
-(GNU toolchain, dtc, make etc) installed on the platform.
+   (hardware board or a simulator like QEMU) with complete development environment
+   (GNU toolchain, dtc, make etc) installed on the platform.

 In both cases, up-to-date GNU toolchain for ARC for the host is needed.
 Synopsys offers prebuilt toolchain releases which can be used for this purpose,
 available from:

 1. Synopsys GNU toolchain releases:
-`<https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases>`_
+   `<https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases>`_
+
 2. Linux kernel compilers collection:
-`<https://mirrors.edge.kernel.org/pub/tools/crosstool/>`_
+   `<https://mirrors.edge.kernel.org/pub/tools/crosstool/>`_
+
 3. Bootlin's toolchain collection: `<https://toolchains.bootlin.com/>`_

 Once the toolchain is installed in the system, make sure its "bin" folder
-------------------------->8----------------------------

-Alexey
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
