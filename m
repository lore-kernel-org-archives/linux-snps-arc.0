Return-Path: <SRS0=BC9U=LF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8090BC48BE0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Jun 2021 17:00:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21089613C3
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Jun 2021 17:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21089613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKEnAvXKstow8QUnFLMGbDXJFV4eDd7NtktCK0sU7oA=; b=1J4Ph9rOoxd/TD
	terYv0WkJJHxQFSrg2o1p5vYJdu6Sm2gpRcfYlTkU1z7O6TlSp7fCE0r+VWMVLGQDgJcE+UtCepdj
	LJTJpyf7ULEIx86mtDHutUMdzn4a3k0Aaa3xwDxzewyMTAPwWHgWBPTDrLNwqVL4Z9UFNe1zXak2y
	W7Y44Rigxjkkk6Edl6Oxf9ZgQRzTSU/TEtqDC0NtPTWNLvy2K5Yd5acRG50bEHnDPtJL//Awb/oDI
	v7ScwTm97j2kMpy7RGOpR3oPaIq57SwuGXX7Muq+hcl3e0JsQN44p11fPXHlEy1H14f0UH91w1Hvu
	Dm23bvGKkAm6ucnPBkMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrkVr-006BYv-L6; Fri, 11 Jun 2021 17:00:07 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrkVp-006BY5-Kk
 for linux-snps-arc@lists.infradead.org; Fri, 11 Jun 2021 17:00:06 +0000
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EA716C0948;
 Fri, 11 Jun 2021 17:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1623430804; bh=aQ0AiiQCJLNX0Pp0zgGrft0SJzmBgBZ49j2QhLeUnLs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=gmCWag0290XSSFNzL6GzfX6107f2KQNRf0U6Bq+1ISI5X2TCC0VjD+JNfeX8gsNHa
 L8BaHe7cA0m4vogmmKn5S2567zRnWi7B9bgiTJ7Pp/faUBaRFEucAoayF+GuetDRyK
 VkaZ4nX5LoB6GHuUCrSoAAtCepCAGG55DcnuQv4/IRW1GC5hnauBh5LrpsXaFBdRG+
 17SbCxp8aK2jAQO9KcZi//tS3gIs2ttA9Tr6u/KmhQEflRB/svAPB+JamYs568H5i7
 JHcSEKl1eHYDpGHh4RuIUVZt1Y8A2fwXnZnqMa8JmDAEC/H1jXR/CsPVd6IXhUJGKE
 IXP9kkc6gW4FQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 55296A008D;
 Fri, 11 Jun 2021 17:00:02 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2046.outbound.protection.outlook.com [104.47.56.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 00CFA40154;
 Fri, 11 Jun 2021 17:00:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="vbvDybKk";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AA3wP7Cm+8eCgYHEf7R0WBI3nAaAmEwHex8h9tAEiM5Ljib0stpIu0IddbCoWdVPQLyfxGStbYdSbrnajOsvoZ/WkdFK+ryDpTWLrUIi34PtKil93jaHuE8Gl/BO0wbL50j8Xvn0JCp7nJTp/meat4rL9l7b8MjEVU7ArPitK7dxhuD4psLEgZKhcDGoxFCb1UgHvtEfMkouSNxD7+kFmSlIoyuGkI9YnFYXZHnDumKt4puSXfWzN9OkXKZnIqCTTnpZlJwhsb+PcFf6uUG3v6o4smUYszu2zFpPg763iZbTOV4tZqhKI3/XoV8FTm2NglEUCUac/yUn8tBKb7Gf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ0AiiQCJLNX0Pp0zgGrft0SJzmBgBZ49j2QhLeUnLs=;
 b=AUx6aqoJhBmmA4x7H+Pdd7sE4v/AzQ5MTAuqXiF5SIwE1nS9hia4wNc710N/LmYx1+nwXpFVELqUp/Y47rbKuI9esdkkpFgKdlOBsf6FfCAjm6xgrNyH0stigZKWXVxxHDpv0FFB5+XpWJI7vrPEtRKjaZ3adqGZa4UbwvoVXE0ZyB0I3uexgOrf48QT/ZqziU3MrpWbgq9ntX6x99bJhSlLawVusFc2BMDjj87lsfaBlC4bfvGO9HD0LXe+VkXD2NQ+u7H4RGVpw9/ZjwPgi6MK7gy1IyCkKrd7kAWB18Kv80J+edxbh7gKwkxQQhEb8jgt+ofyfUH7zpcHf+J3Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ0AiiQCJLNX0Pp0zgGrft0SJzmBgBZ49j2QhLeUnLs=;
 b=vbvDybKkyh+/Zl0OmsrZIXS85NSK/8sJTmnSncbEzBOZ94RGO1G0cotvc4GXd9RcMT7f97CSWfp6tYNGUt3376rYbSrqi4I9rdCj/ExIhiP2H2y06pSE4rwN2cMVo1pIqBL20S41ijj8PyZzhL75FC7yuDX2JxCSOO31Iyl03J0=
Received: from PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 by PH0PR12MB5467.namprd12.prod.outlook.com (2603:10b6:510:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 16:59:59 +0000
Received: from PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::a52d:d877:25a1:a7bd]) by PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::a52d:d877:25a1:a7bd%5]) with mapi id 15.20.4219.021; Fri, 11 Jun 2021
 16:59:59 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "linux-yocto@lists.yoctoproject.org" <linux-yocto@lists.yoctoproject.org>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [linux-yocto] [PATCH] ARC: Rename nSIM HS to HAPS HS
Thread-Topic: [linux-yocto] [PATCH] ARC: Rename nSIM HS to HAPS HS
Thread-Index: AQHXVlnjUCODt/2fgUyC3NiDmVdWzqsBOE0AgAABwauADdKtvIAAC7mAgAABB9c=
Date: Fri, 11 Jun 2021 16:59:59 +0000
Message-ID: <PH0PR12MB5401A764F799B18F11AA578BA1349@PH0PR12MB5401.namprd12.prod.outlook.com>
References: <20210531201641.2804-1-abrodkin@synopsys.com>
 <20210602210146.GA26712@gmail.com>
 <PH0PR12MB54014FDE72F1682196FEF1C2A13D9@PH0PR12MB5401.namprd12.prod.outlook.com>
 <PH0PR12MB5401FC57FA40A239F8CA20FFA1349@PH0PR12MB5401.namprd12.prod.outlook.com>,
 <CADkTA4MY6iMDr4e+qxJzOimUyzDFVGTjr80W698Xm70WkLEgJQ@mail.gmail.com>
In-Reply-To: <CADkTA4MY6iMDr4e+qxJzOimUyzDFVGTjr80W698Xm70WkLEgJQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [188.243.7.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2583927c-5b37-41fc-332a-08d92cfa58ec
x-ms-traffictypediagnostic: PH0PR12MB5467:
x-microsoft-antispam-prvs: <PH0PR12MB5467377594EBF4327A4B3413A1349@PH0PR12MB5467.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mzmCVAi2FAw6jkwht5GAiI1rdyGiULNqO5M1txNyffveSln0xpNXrMFjimts0Bv5UAM7FROlYMxO7++/TTXQXLNX+gk6xKGoqEkrVw5qcsqZR1oXisCCihb6d5NArSpYSDrpMg7L5OTari9g1wtv2MLsZ17AW9cVQjKttqWDxUVA2DpQH6pS1WzuGkTe0xiq9rOPyG2kiMFZfy9KREanFqdrmcYsdzJ5S+baq+jei/I1Q7rl7i66OLZfCB1AyzmylsqAnalKNlN00+4p8AhsImKP7JEuyk36XbglylbQeEN7aeF2pjyqAbG3URJQZEVpRO8Zb+hOtrd6W15HiRKyHahwHCWqoe+a2LqX2jgb7VbbQW5CBZ3dEfFYizaMLInIZVCkaP+wjtyUKkDI4LGlHfDdFpaJQUQUL1X0eR5I89YY2h8phonh2sIda/3+kvnY51rwo05ifRM6GMNW5Z/SDV7C8h2G8Cv9crQDxvmdhjahqdAyxX6kAceKq9we6iWN8jUJ++oi0RMxLb5E/gvZIEiHDRV8XRBjlfH1tkFVJ91Wx6Jxw6fhQSlTE6CXkHHCfbQqmCvu1bJDFdLLEhvCzjIotH4TzVp3Soiln9T3VdY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(396003)(346002)(136003)(366004)(91956017)(76116006)(316002)(54906003)(8936002)(8676002)(71200400001)(4744005)(86362001)(55016002)(4326008)(9686003)(7696005)(66946007)(64756008)(66556008)(66446008)(52536014)(33656002)(26005)(2906002)(6916009)(5660300002)(6506007)(186003)(38100700002)(122000001)(478600001)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+96lErqGtgNeTaLr5/KhgC1cha6HtsDp8O276h1ITa/OjfVoM0K2WTSMmI?=
 =?iso-8859-1?Q?/84d00SVLqs/Ytu/1iN3yu45cve+756RGljmZ1NwA13USvtLLs2Mqax2np?=
 =?iso-8859-1?Q?ug2WSGabRIQj7cko/DUgr3DcN1B+KSPRN0m5jyrNs/QHAY4pdiGGHTh815?=
 =?iso-8859-1?Q?bKfeYk0lAm52ZzFzKhaBnT6wSu25jZh+Ev3VNIStW+BnsS3X47hBSLjmh9?=
 =?iso-8859-1?Q?RzfJzV1Mo799T0dwfH7yhawnZaW8Uur8htsaK+d8M4Zqgj+KbRXx3Fep6q?=
 =?iso-8859-1?Q?qcHb1t3YfVQANSbVeATj6VG8ThvVu8yrnCk1BzzN4rFbsIQlOVKBxFT/bJ?=
 =?iso-8859-1?Q?eR0lo44FRuzCFDor6rRb+I9SwDDP2sOujdqBVOXnF4WnYgw0rBohN2kvhs?=
 =?iso-8859-1?Q?mbBpbhH9jbQ8YsKeBfGOlBx7ZD3oaytHIRtvsED1jGFel5O9xqxmdTAhsh?=
 =?iso-8859-1?Q?CiQPmzohMsp3+XBTUhQlnYfDhP8/tAPkaaMZYyH467OlCuNLLZa/qzdToG?=
 =?iso-8859-1?Q?4Qyd/86FfpClaPLF2kiZNFXMbuXLaKmF0emrcyQpztcazB500CEvG32ki6?=
 =?iso-8859-1?Q?Irf3+mS701x/rgXffYXb7F8+ct73ANNKQekaFoTSTuV50pMOAmnvErl75f?=
 =?iso-8859-1?Q?lZC57jbzS7dUgk2LiuNyozOM6A2Z1PWIQbve3mfqf4w+Swp3zt/syIo7oN?=
 =?iso-8859-1?Q?TywleaG8ztE6QSZX8rrpRulm4MPJ39XRexW9LCeYu2JlfiaalYI5TpGC9Z?=
 =?iso-8859-1?Q?aWDuNdim7pLvd+GJ0PXtFVjFXo6SDkPJzg6sECng9G/7pRQH6pvOAxWgqx?=
 =?iso-8859-1?Q?0rkObSIp7qUFiXycQ90+R5a9TlYjUBlJwNUXBlykdLEl7s2uthUneNfzGS?=
 =?iso-8859-1?Q?OT5XfTj/+l75gUGd03JrASKIGCddmgvdtubYRJJuEZq4m+Vtq5eiAUucct?=
 =?iso-8859-1?Q?z4vUUW4TRlvyOfZ6RyUZQn34qTs8rI86K706baRXBkQQdZU872itegZWUh?=
 =?iso-8859-1?Q?XodWACxKkrnenSuZ19PtMb8CAYgZP/xcTJuU0xmMAvSkTwPDtMMOkaNixy?=
 =?iso-8859-1?Q?MEUE4H4xF+qH3CQpFyesdj9g0FPwcPyTYRuzqBBShR/43fNbQ7jc3MB0qM?=
 =?iso-8859-1?Q?+wY0Tn3cnPj66a/zVQWi0YiJEtZw408ntyWuavkktZCnPRkZH9LDngSaYe?=
 =?iso-8859-1?Q?NdytGJiZVFu8eCyiBSa95TOkciKOiahUSKeiVcSntMB1f2N993r3a0u/ln?=
 =?iso-8859-1?Q?D1ZMNsDMX96qY+Srj4Ng2yqz9DrPEuZxlLADNTEojwsXiQLa2kcohdXeGM?=
 =?iso-8859-1?Q?WN6rMx66IyV8AEZ567+P/4YJvHvlX60YVp/qFT9XmUL+om0=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2583927c-5b37-41fc-332a-08d92cfa58ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 16:59:59.4229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mlr+RmNyefeOlj6WlIMRPMr7UzRiiQwDMJcxn5Or5TTV+jezextTyMXg4lNU1YcjJOo8XBeEWDAKD3QeZuekUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_100005_821065_41119458 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

Hi Bruce,

> The author as it comes in on your patches is rejected by the yocto git
> servers, so yes, it had to be fixed up.

Do you know what needs to be done to get that fixed?
I hope to keep sending patches from time to time
(and was about to send yet another one just now),
so would be good to make things simpler and exclude
that manual fix-up step.

-Alexey
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
