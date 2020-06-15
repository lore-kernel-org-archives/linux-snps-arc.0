Return-Path: <SRS0=fi28=74=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95367C433DF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2020 20:12:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B4EB207D4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2020 20:12:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hxAiqCEN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jETB7lz1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="q/KO56dg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B4EB207D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpCwOJLspL9he7WPeQ4AfACwMpLuy+mHhqnJLkPTuh0=; b=hxAiqCENltW4JH
	gWACn0EH0o4LRPlqQPqABxrA2DmM3hrRgZ9qwQVVV7WHHZsITnfiQ/gl5f3Wae4dIE7V/RulvjTWj
	nDfVMTfzQjA26hs+gtWujLjpSCpe5Fyd7Px8gpXmf+ayrd/pM/RxXDjFwHHMOocURgj9S2tnKXVVl
	4Wd4N5AWu8X5/09ksCAManf95fzLBBe8j6NQmGRjNMD+1Gk/V9M09T5103PMBkT5zkORadBfo5s3M
	AJae1YN/om/tRi0ejZP13u//SuD2rteTT43153HPT1pdSqKrGAqEFKrANEFclncqF6YV/ufolbJ9e
	1afp0QHitpOrFtiy3K3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkvTA-0003Bz-3b; Mon, 15 Jun 2020 20:12:36 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkvT6-0003Ab-Kc
 for linux-snps-arc@lists.infradead.org; Mon, 15 Jun 2020 20:12:34 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 10FAFC0BAD;
 Mon, 15 Jun 2020 20:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1592251951; bh=cnLUl9iFLnidNMaSNFuNBX8C9zROE/c8Cr400aMleaE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=jETB7lz1TR9v3h27EhxGCm/6ay5n9H55LDMWBznBzPtoTRGdRM8d+p8T7TyWxkh2W
 Nq/BRiyRE69oBsB42IJNYca6bU8dTV97r3uE0HoGOi8RYAQMW/HyuDTilFO/LEwX7M
 ilDL8jjqYDQ/h2kn+iYIVKsHkwRWo0Nnaw54aO9huESsz2FAAnkS8VsQgjEucjzKhf
 +orXrPuXSnyp0DbBfCQm1HfVS8v254TQtGdS7AUPBkR1+NfKLWWvbtXbFm3t+Uo8uz
 jhgR957HxA7Zn38wvc5GOu2A6QTx9/8kTgFWRbqkmCmge6vIUvpZmXcHJ0brEFeOpQ
 PxZUun2Z6gXlg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E8610A0071;
 Mon, 15 Jun 2020 20:12:23 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2C152800CC;
 Mon, 15 Jun 2020 20:12:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="q/KO56dg";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsMH6R06n3W5MEbr62M6ZXT83NIrVTfekUKpBkWvxn2sxPtgSY5/D5HvhkOke2F2Jm908oDpFJvOxtHVUwopDQnikdfEFqqJAYzq7CUqq4BAiqBfTEHckxGqDOrd5D0/WHsC5VigNCUOThnUflwz+iuANpsvKfRB+NSulVZNumpKK+RWgMweu5P1KXuarZ3kAgHeFPF4KRTDOmW59atZc6LaFZPiayFY0Ap/iw7qbZPSS5GR0pHn7z+8ioHiXTHgMC7J8wzIW/wBIPVObhqk3HiUgy4+ixrOAS4PDwsH8SylA55mYkeFhkiNaFHNDix+Fe3aAVlRfvDMbAGvC4Qgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnLUl9iFLnidNMaSNFuNBX8C9zROE/c8Cr400aMleaE=;
 b=Sx6SDKs/xzIuGzsGMnELwLOw4ftFkeBhu+z8JqkhxFgJ/HvIPIZzgmTX8ZjdOrGdp2QFVDE7oJr4ARy3JSiJ+sAA5l37KBI1nLpFheP4rluTGPyDUNBxRns/gzt/hnpdFCRWrUTjF87kNoZBr8tyXagzA9uIuhfDTBkANlwqZQpWRGR7XSmz8ulFnDenoKbkQRNPNA1gJHUey5kM6l/ZrE6OqAsYHMjyuAahWQntbT5k1zxM/DmeTFHV6vCRbU/QkzR8O2ibkbEDTpUzhM2Zer+PDHFEaihRpEOytdIuWePrbotBEZXICO7J10Xy5pZNjJ9SSU1f8q8C5967b9aZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnLUl9iFLnidNMaSNFuNBX8C9zROE/c8Cr400aMleaE=;
 b=q/KO56dgJ7xa5qbr5RBTz4Q6uPdWtJAUc09XN2O5xxPVXTtTKOaIq3NBWYIOCjhwqAXa7nP+CEzN12cpFZ1g7DOVDXxn2QrSV0Q2l9A/BVTY1BOf3R5j4DRDG3b/maenx62eIBZrI4jrHBnJPHr1vsbr4Bi9Cekrf9QMwvtL38Q=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3046.namprd12.prod.outlook.com (2603:10b6:a03:aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Mon, 15 Jun
 2020 20:12:21 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3088.029; Mon, 15 Jun 2020
 20:12:21 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>, Adhemerval Zanella
 <adhemerval.zanella@linaro.org>
Subject: Re: [PATCH v2] ieee754/dbl-64: Reduce the scope of temporary storage
 variables
Thread-Topic: [PATCH v2] ieee754/dbl-64: Reduce the scope of temporary storage
 variables
Thread-Index: AQHWQ0iFvsR6QMu+Xkalpg/pKYNaTqjaE/EAgAACw4CAAAVFgA==
Date: Mon, 15 Jun 2020 20:12:21 +0000
Message-ID: <ce93933c-f110-690d-0531-8e0c3b8ab62f@synopsys.com>
References: <alpine.DEB.2.21.1911112247180.30786@digraph.polyomino.org.uk>
 <20200602023223.13823-1-vgupta@synopsys.com>
 <alpine.DEB.2.21.2006021814210.3673@digraph.polyomino.org.uk>
 <d38b8dfe-5caa-5884-8843-0a845afbbb67@synopsys.com>
 <115b2236-e994-cdfd-d96e-2e8d354b7fde@synopsys.com>
 <6d22b849-e27d-9843-90e3-7ea635c6d863@synopsys.com>
 <04e95814-5f81-1ca8-f0fb-1f6bb53eff78@linaro.org>
 <alpine.DEB.2.21.2006151953110.1874@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2006151953110.1874@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: codesourcery.com; dkim=none (message not signed)
 header.d=none;codesourcery.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6520fe5-de58-49e7-dc41-08d81168693a
x-ms-traffictypediagnostic: BYAPR12MB3046:
x-microsoft-antispam-prvs: <BYAPR12MB30468FBA0B22A12ABF668219B69C0@BYAPR12MB3046.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eLYcQALRBC7wZD3vyxXjAb8LTHHK1BfQR9U/5pFLHfDXx2UPngKkDfXPpk1IxswwJAhF/wJ7+7GCDdKXlH9PxvAVrJBx+q6UUXgV/bEG/q9qTF8FoukNuFO6A2GuR/B7dsqwmdmYOO0DP/YoXZzJNQGLbF8bGRJd1jsLIP1EY0NqP8tQYfwdqm4xgMmz23qaa39O6vKYII68Hph2M574ibhoMZSRaR4n9pBHhyRklru1Q8wGCrVYJqKi7XF0pDMDme5HQR+37UH/rL0wRASorJilyAjf62mBpAPhq7EmzoLa4VGAq0t1rWN25hbm2R46+LsYUWPzf1DBCRsWc6GcyefRQYPT9SyVE9aZK/wCcN0A8J3NdcdWBBn3u2AI0fVG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(376002)(396003)(366004)(39860400002)(136003)(6506007)(31696002)(66476007)(66556008)(64756008)(66446008)(6486002)(76116006)(66946007)(53546011)(478600001)(4326008)(2906002)(6512007)(86362001)(71200400001)(2616005)(5660300002)(110136005)(8936002)(54906003)(31686004)(26005)(316002)(558084003)(186003)(36756003)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: P6zWrjLr2H8Aam5yM3BhGSSLWNGY0HqVnHPdmvo6qITm3UOecth7sHGOAVT05MwN2U8Awg4ZJ9CwtaNd0wfDlmSd/9IvHza2A4wjPA1+f9ie/Tn6BZDnEP1Gw+/5VI5WeeO5S3ynlb4+mfPnIozyMWSLP78taIaCeKwB2/454abwx4cFHHxwOIbfXDnQUneW7V/y3wcgHDsvxXS4TWX2FQkdWSEYdKkEUFNEAFxPCE4j094IyiOWABgPo3y0FTGa90daB25LRP5+eMXLuLeE56Gpc/+jNFVlqRvqBhxodcRG8lM24Ep/oVMYSIhhZVFi/CVn9YI4hpOaH1SrGohXx4EcgGFHYeGy3c3VIOswdgHohxmB5wiVMdzIm/UXaq2Oh9IepCjNPAhHK+Z5SoXepkRliamaHH7XEraAZcJtSPHrzN2qiZINm7qqQJ0PxDAYK01QY9As2Ipy/yvXlndiH28x1Xj1OZdtV/aIbcfGxCQ=
x-ms-exchange-transport-forked: True
Content-ID: <EDBB7B07E094334EB47EF2517F8CFC06@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6520fe5-de58-49e7-dc41-08d81168693a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 20:12:21.1481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KHkAayghGFkdowjoVbNeRAnnziV6JWRwQDaZrK07F9mpfQHZ2m+pv4l8q3FbTImd2jEccXwRjSHShRWBZL6FbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_131232_837599_FCD43DA7 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/15/20 12:53 PM, Joseph Myers wrote:
>> This analysis looks good me, although I can't voucher for Joseph.
> This patch is OK.

Pushed. Thx !

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
