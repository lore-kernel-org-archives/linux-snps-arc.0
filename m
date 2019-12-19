Return-Path: <SRS0=9HNX=2J=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6915AC43603
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Dec 2019 17:09:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 098C824672
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Dec 2019 17:09:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DdR3466c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lp6eJZKA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="HhPYKcgq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 098C824672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IlnN2uji1h73G/10oYlshJQh/4bOFlHMvOTAH6j8iw4=; b=DdR3466cb5kAni
	XCPleJqqP4/OmlzlIQWyiLdGOC5idKZW5qSIsquHbbUJRv0uwuNPmacTjoMz8fVqAHzb6QCAD3dK1
	3ofKq2oHsc4t+hGtpMmToISrT2UGz2TfW08sQze2J7un9lpF1KUXEOnm3ghj7v4vRfql9420Q41p9
	TmMdzkH966Y5MEtbgeM0f/ESs1VVh/c9wdoTxt5JB0TkE0xplrzw7hL3tDFoKqASwjvm4x+1aOV5/
	dV+oLd+ElFoa8/tBwz9Kx6wPNsCnoN98VLZkH40txAMLOoDrEkjdS46gNd/0LNiUIc/IV3W0Vs0XX
	HPIhnsT/c78YsqZUEVaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihzIl-00070u-Cc; Thu, 19 Dec 2019 17:09:27 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihzIi-0006zv-Tz
 for linux-snps-arc@lists.infradead.org; Thu, 19 Dec 2019 17:09:26 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BA4E140639;
 Thu, 19 Dec 2019 17:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576775358; bh=V4RtHMWEt61XaElPPV5XPBtxMmUqJ4NvV86ywwxIzy8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=lp6eJZKAKlsEEUYZ/e3ASkMIMbGcXAFZx257/IyWpPlUmEvDzXEm1yPTLgy6zYgCP
 3oU2ng0miXrQYwXjcEUXtt7vNDn3B77ogntGkHZbUk2xWXuQAohal+MupwOgI4uKx9
 a2t6VWE8HKtigGvb3TmAxpxSJjEI8Ux9glxe57EmZaUHvyk2PL2EEgqvKNWPymR5Kj
 UB85IQuyauvkHun5WKil3ApFf6aHEJi35isbMQQZAHGaQ6IXwAh5ey4uIQApyUEv8H
 PHHrRoXDOYFo9dKAUJdUMHRyU6miwTu+DeMCvBcOOU2TJev1sXDzx17yj+EtiZN6D+
 EbFVqPileNbJg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B371EA0083;
 Thu, 19 Dec 2019 17:09:17 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 19 Dec 2019 09:09:17 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 19 Dec 2019 09:09:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dO0oXJdmC5RyEOGgHbQzVm48CeF+pVN0ZUV4qMxTJ7VvRkuNh8j+6wOYrdOvWV2qPzsNlhUihR2Tfi/0PKOd6d8tahpAA+rZucL/YrBGp+zhM5k0RYJ/YrVwcaoZt9owcO5IiTzF0BohRWSRvI2+6vslRlrBTHC4k+/u4rIycWPBCoTgoZUH4VIdyj/qgHZRgqDUavt5ylvIAaUe1oF9ao7PyxtF+2s8W6W6xJyoZmsZUymtRwhq/EIE+0gcIA9mlP4nJxnTdkg6/H0BO6pL6rdzqzoa+wRZDfaz46/ur13S4/2jDO1mk9P+38frgLPSq5zHsuuhQiSB4DxE9OFMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4RtHMWEt61XaElPPV5XPBtxMmUqJ4NvV86ywwxIzy8=;
 b=DArRtaYzVgL8Dn+6RAKjTMnM0wd1ulHYg56z9FxrYxxi8URZFnnmJSyhVj6rH9sqpxXj2tziHzMHdZkQQjKAK98ZxLoZ37ZhT+YQZu1wMpmN5Guu31OuZC1lAglvV/kSKuJulgmuq+esCZFqH6gB8HAF8aFrVMuGj4Q6v/vxNwfMEJfIjZ1nEa3Ka42BgPJ2yqwL5X2qMedKpuFGOv/HrP64zPoR6xNXcUVmLkzsXyLnHMaxI1x9QD/Ck16PWuqTraDAqhm2HWDpTnU+XqpqwNOyDICKEariwmGDk51EFcywXweI8tHIAcsUR5ZfeopgULoKWCuXgLx8Sd4W+OAprQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4RtHMWEt61XaElPPV5XPBtxMmUqJ4NvV86ywwxIzy8=;
 b=HhPYKcgqIsEhTEtOmI0BJIfDATGKj1ATr2zXyacr5jdtwWx7ntNRCfCs+8zMkFHMRc3qPhLjFYz7DYM17rWBLVKoG3r4Fu0vNK1J9KePQXQ+9SqAGSViNTsYexy3QZ7gzAAariDx92P8WEBwFusJG1/UVctwb/Iyn4qHwk73PbQ=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3255.namprd12.prod.outlook.com (20.179.91.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.19; Thu, 19 Dec 2019 17:09:15 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2538.019; Thu, 19 Dec 2019
 17:09:15 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [RFC/RFT WIP PATCH] arc: add sparsemem support
Thread-Topic: [RFC/RFT WIP PATCH] arc: add sparsemem support
Thread-Index: AQHVE9kRDcbJKd5PskKtnW8XS+AcVKfC0aYAgAAkuwA=
Date: Thu, 19 Dec 2019 17:09:15 +0000
Message-ID: <0c6a9261-d4a2-3ee5-657b-c2d4aeed6ec0@synopsys.com>
References: <1558885095-21540-1-git-send-email-rppt@linux.ibm.com>
 <1558885095-21540-2-git-send-email-rppt@linux.ibm.com>
 <DM6PR12MB4044A24346C2252684596421DE520@DM6PR12MB4044.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4044A24346C2252684596421DE520@DM6PR12MB4044.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78bad990-ef5e-48d0-d4e0-08d784a62d6b
x-ms-traffictypediagnostic: BYAPR12MB3255:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3255534FB01BCAAA415BDEA6B6520@BYAPR12MB3255.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0256C18696
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(396003)(136003)(376002)(346002)(199004)(189003)(2906002)(53546011)(6506007)(36756003)(6512007)(107886003)(31696002)(26005)(2616005)(4744005)(6486002)(186003)(86362001)(478600001)(66446008)(76116006)(8676002)(64756008)(66946007)(66476007)(66556008)(316002)(8936002)(81156014)(81166006)(71200400001)(4326008)(110136005)(54906003)(31686004)(966005)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3255;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Epds/6wUGUtVGK2cR/8Q4deSW96cTaq18uu7Z0zcdyM8eKf708cvexacvHsTy3CS1Ht+iUw1yhGhSe1Ly6ZhHVZPPiXUJPkruwCKI50Rns2Lgeahys6aX+NapANg/PuyTxvhRKSSOt3Btvb7331D9zSIwViiY+eKp8oU5dRV0DKGT+erYcPpRg4mnJm9v3cbVo0XiaIJ0eEf6VXgzQbLy7HwmjVTuXDZ+6EeK9NLcLaRI/2nJjI2Xw2SotBXBonvo3oRGonIJexOKw2f7CBQzCYAz/BPDDgSxAk5Vs2wXGLPeo60q9VzQAhqtkDX/AK0xwFlTh3lDGlXPLW+on2rhoQeO2ioGXquNy4y+o0k4d4Gso4ESaw23fnQ6m2ur2/vCoEhJGhnKFiQZE/jcGoTDo8IIGvs7W0SF0c9MCHzpP51AeICiED0d+h/MrXa4Zl8DKnY+OwKz4As/J+CFR8Hb3er66I+H3pVTsV+dCzAcp8=
Content-ID: <C64FDF9831A268468A2A122E379B4D9D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bad990-ef5e-48d0-d4e0-08d784a62d6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2019 17:09:15.6244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oIMbXlt/cbEiIFS0owttlnk2l53ziJ+qDK8gkpH5nb83k5KsDmWaFVNsVqgOG62tFipVZ3NYg1/YEa73gR835Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3255
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_090925_028427_99946756 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 12/19/19 6:57 AM, Eugeniy Paltsev wrote:
> You can find instructions describing how to run Linux with nSIM free here:
> https://github.com/foss-for-synopsys-dwc-arc-processors/linux/wiki/How-to-run-ARC-Linux-kernel-and-debug-(with-MetaWare-Debugger)#standalone-nsim-also-free-nsim
>
> If you are going to rebase you patches on v5.5 kernel (or newer) please also read this note:
> https://github.com/foss-for-synopsys-dwc-arc-processors/linux/wiki/How-to-run-ARC-Linux-kernel-and-debug-(with-MetaWare-Debugger)#v55-linux-kernel-note

Thx for nice update of the wiki page. I've made some mods to make the DW UART
settings as default and mentioned the fallback ARC UART settings in foot note (vs.
the other way around)

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
