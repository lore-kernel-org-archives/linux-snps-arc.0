Return-Path: <SRS0=FXUf=KQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E718CC4707A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 21 May 2021 22:35:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66CB86135C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 21 May 2021 22:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66CB86135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQZqzfMrLpKFWlda2WJ/a4R5kqvbWjStLT9834mY6FA=; b=M1w3IxeqyBPIKoEnm3FfNrqjYU
	x2ZUTCeUOVPBG4RRF2hxWhqE0WMuEGOgGyzhjMArtCFH5vm2fs/LtfYs/+bYGyd+5KY6+4u8Xt4iW
	tYRoFc3MrWrKsECEZ+HYvCc+00ABa7Cxe3Q44zFZ9SU5CGd5VMZIXpoPcZ88o/yIbA/n3j1FXWUsa
	b0piC5+UVNr2/uXK/qfKg5xC+ho74GQVzffqu4ns1FH30rUV4jZZm5gOCOxFezkZ8WmuB8u5q9vnb
	xAap/0rkS19MnSZ4YXNemWa40JF1S9d6iPd5l4d0p3Tu6qs5t9lNayuQkzEqxXG72/DikiVsXmLXF
	EPuhiJNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkDkE-001GBc-Ss; Fri, 21 May 2021 22:35:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkDkC-001GBG-63
 for linux-snps-arc@desiato.infradead.org; Fri, 21 May 2021 22:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Description;
 bh=K7x/0PrBes2rRbr2uvjV5lEGhFUHtU7EI88F54suLzg=; b=iJYo54BsbgvKR3b2wAVDnCkiO5
 auXbWHF6koxU2ctM0kb5Mpv7CK7zWSdkrdETO9tQBLeG7/ZjLz61fnPeT2Awd+TtCBt5V8zt01umU
 UvXyzg35S1zbZa8qltgvM6sBgd7JHBQB6TJWz4YXWewRPNtNjot+oR7BZxIzPeHS8RROe4aODWXSb
 87hN3lWb9aTaL2rdBhw3dXOIqPf2MCT+jQl79655UUwybVGEQ14reSKpzRkpsQFbrGcq22v2LU3AM
 X4V1jJ+hIins8Y6EaW/wCrsmZ0aN8gb1zOJYZCbfVGrH67obE5ckumcEKSY0vU7qTPfJrOg+uCTp/
 DHIeewtQ==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkDk9-00HTVz-F0
 for linux-snps-arc@lists.infradead.org; Fri, 21 May 2021 22:35:46 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1E66D40167;
 Fri, 21 May 2021 22:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1621636542; bh=K7x/0PrBes2rRbr2uvjV5lEGhFUHtU7EI88F54suLzg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Ayno1k3qoKzjL/oMH2LDN4UyvrjyAjJiTs381dGU/yeb+yvsrazBtOIb21MPWKIJH
 kVNR++Z56WgTvWLMaNoeMB3UPGC0N2dl0IQImggMTY6/b0nOuzhkR+4GU2erx8aQAw
 5eyJnJRfDj6d6Gqy2O5byA+vII0QLrzrYDV9catWOqJdg7krTae9cDagwCUZWHmmMP
 Ypr+PR7skgEnZ7iRCqZdabj+HGpWEq4eabHkCtRfEmkT6EmVDrsdmCPnrGms2MGxH9
 U0bPT9bozoUuSW8zEP6n/19pQwO0AyHfT2aTH6Cox1hVnX3/FeJk4SIzpFOX+w2Drd
 yjdUx2vYB+bXQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A607EA006F;
 Fri, 21 May 2021 22:35:39 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id A4B5A80269;
 Fri, 21 May 2021 22:35:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ou5K+o5h";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AN2KpIAfWja5bIqWZce0/3qUa6Osmx69Bu8IgwWGCIfpFKuzhQxm3w/frveNhEuvehMC2F1gOfUS7flcOU0K2O/C3U58iB2X2G4/FjTVpZkQgh2EpJsw6XFl8vqzrW/ccofMC9HkVB9qg5FDc54kWGz7poufC1qWK1WIaf6ctAUP1ZDla9Ig3L1yX+ZC0Vy/tcZkY9kzN8Q2rWTxPnKznQJU+A2AffbEeY1FXkmD6PhLFydEhqW/8sIOD6S/er+MO7wOo5X61idLdYZCsWXzcLo/pAS1P8LFtHieYbUrgUYJoZ3oDMEynKapDq/pwPh8dpUghX/uGba5YXhLUtSNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7x/0PrBes2rRbr2uvjV5lEGhFUHtU7EI88F54suLzg=;
 b=jsg8HiIj+IyRko8EK4hu6b3fNVSXN0OiuMqwyriojeQwifopQr7sQ8T7gUDcDcXbUOr694WKMmtzgio3HwI1aLlOBZ3G8uHvNPW32Mb6dOaHMx51ELEF/jo4oiGl/kjVrZs0uE3tdLFZ1iNf+xksmqDGLIYDQNUJ5Ic0G0YeZd4LbYD6lt8Oo84xk7n+rR3e3p7KebSM8iJUjNP+dLcYeVX4IdK4rhQN02Pt+Oq/uxVbjpt82wzAGi5EZDwDMEdmHbt0M22PnMd5wnbxHFf6xlNZN2lodP9CYLigbLgLzCWx1YdYrFf2XCLjGBf4leWcoYtslW78U8kCT4PkCFMJ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7x/0PrBes2rRbr2uvjV5lEGhFUHtU7EI88F54suLzg=;
 b=ou5K+o5hylUCvO4sUj+wCFtadBABcYSCOFL9qjX//V0KFGDvmg+TiiTQ6mx5E4LCbOpPEXok3dlPuDMOEidLw3nwp0KPUxqxQrre9DmaE2wd28beQbYG5q1mHX+TD/Op8R+iONN1vCvlnaY8LCHmFZtnaq3kHeDHov50tia+vgg=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB3698.namprd12.prod.outlook.com (2603:10b6:a03:194::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Fri, 21 May
 2021 22:35:36 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 22:35:36 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "guile-devel@gnu.org" <guile-devel@gnu.org>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] add support for ARC architecture
Thread-Topic: [PATCH] add support for ARC architecture
Thread-Index: AQHXKzDLne9s8F85C0Wu+wHeMjfltqruzNgA
Date: Fri, 21 May 2021 22:35:36 +0000
Message-ID: <f8fd467a-7724-331b-9c27-4ef61a40928d@synopsys.com>
References: <20210406220414.2400239-1-vgupta@synopsys.com>
In-Reply-To: <20210406220414.2400239-1-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: gnu.org; dkim=none (message not signed)
 header.d=none;gnu.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c941fc54-0a32-486e-6b0f-08d91ca8c101
x-ms-traffictypediagnostic: BY5PR12MB3698:
x-microsoft-antispam-prvs: <BY5PR12MB3698643A4F86F1B1F655C916B6299@BY5PR12MB3698.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HNfM0F0y3QqXK9zBCVqfWj1VAd3vmlMUfGxtoeEIWYJvkIXCR1G9QDOtrdqVEDDGXMk60oQEEF3dtFfMT9xsbJMr4ygTWdNHq7Hyh2XSU/UoHWA+PY3exYO4QAgQ6ica/kOamUNUSUmftJq1UScxmZec/VaxUJ5F/PdpcgOyo8s/AknciQGTcKsIFDd7RinjPWWlPJSRlhPwwvc84g/sMVCMqEmBaY/h/YhE7LpXArlzU9YK/8PMkuu82P7qK+k91CttJ/9fFq/vvnbyL0og8aWGNtAVRDYLQRmzEFAZjZkuggFvzBPxvcmA28qEEoR9t5TC2VVGLyAFSPf5HrHkWV5l1FAh7Cu104bD4QGx0whYUYwMs8Jxf5sZ4sIrZ9+cGEcNIhh3yY8sFuNKegKnDjxi7Rbt2RrsLrxoMty8QrOMgQQluws0k99rPQvFKin6bKQTrI71Fu7U+dwrljT9l2hE1q+8FD/OHu4YpQiqGzrLakfxkOhpZKCu9LenwbkmHUvL6xQ2Q1WdduueURobIZgQLNergG4p0TBFkLTPBBMV8usBhKYYCyU9qe6CSRBTRmf08UvRkZoyuLmE9UvOPe4r/oSAYjC3TGDzfLOQD9l5jts9V8fqbxtjeqMdevUdxl/tYxmvO3Tl6oTF3CFOaMUArjIH2lXXiaYE8+HuMn2RQ80mkWmkY62Ko+zZDUbO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(136003)(366004)(396003)(316002)(186003)(36756003)(66556008)(8936002)(31686004)(76116006)(8676002)(66946007)(66476007)(6512007)(4326008)(31696002)(6486002)(2906002)(86362001)(6916009)(6506007)(53546011)(66446008)(83380400001)(64756008)(5660300002)(2616005)(26005)(478600001)(38100700002)(122000001)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UzJDNHhIWlNrQW41d1V3UlFZMjE3R2s2clBZaFhkWTJNOGxXUm8raFBmaWlB?=
 =?utf-8?B?V1NPQkhWZitaMGlxOHR2Nks5cEpOZDBtUzFTTXE0cEhqNkhNM1ZyRnorZnZk?=
 =?utf-8?B?bldzV0hiU29vazVLWFR1YVZKYVRHeW5waDNhWVYzaWVTdEhPcFowT0o0eSth?=
 =?utf-8?B?OSt2WGphQ3h6U0JJd2xTT0VmVXBxb0IrLzlPQ1o3cStkbEg5N0kvRTNKbXlk?=
 =?utf-8?B?MWIzaThJNmQzOFlKK3Y1SnhJbU96MW9JYURyK0FGV1h2NUIrL2xoKzkySkdR?=
 =?utf-8?B?TG1uMTViNSs3YVZULzJISm1vQ1I2ZDBSazJ3aGdmUldGVUhKZHRid0QzRkh0?=
 =?utf-8?B?Vm1UNFoxanZFeVI1TU5NMWU0bHMzQTREbHo1UlNHdHorTW5zMERyQXFmd1py?=
 =?utf-8?B?eDZGNVZvUmkrQ2FBQ3R1L0VwSnVEMC95cjliZldSaDQzSCtyU3ZpQXlEL29S?=
 =?utf-8?B?dFQ3WTNHYTdYc3VmbzhvenVFNUNlYUYxRSs5TWpvQXEwdCsvT0x0VldxZkx0?=
 =?utf-8?B?UnJkeUZnODVVaGs2bWJRKzg5NFhRRmtrYjUvMFcxY1hPTmkzOTUzU3E4N0l3?=
 =?utf-8?B?T0Nhck5PZm8raG9kbWVBeW9XWU9yS2xUNlZZNzg3QnZwa2hqc2hseGFMOGdm?=
 =?utf-8?B?MWRGMzZ3NGh6TWNzVVFQY1A1NEExVjBqUW5PcVZBTzVoY0ppVitCVml5bGJG?=
 =?utf-8?B?dTFkUmZQRzJFcExyMDhacGhlR0RlSkRqYXN2aGRvNDFGQmpiL2llbkxjMVNy?=
 =?utf-8?B?TllLZk5EV2VHMEFMMHlFem1weU9sOXdid20zNlBnUDhvVldoYkVJem1BSlM2?=
 =?utf-8?B?NWJ4SWhRR1dSeVltdStIRld6R2dMYVNiMzh1V2p2Ui9ySkNKUG5FMGdSZUdS?=
 =?utf-8?B?cHRLRDQxRG5UejFRRm4wUmNXYXRkVnh3YUwvMHYwcDA5dkJ3WWZ0akxqdm1l?=
 =?utf-8?B?UHJvVS82dHdXeE9zb2lJRC9uUnVub3V1dldqcUJwcTY1TENwMjY1RktnQ1N6?=
 =?utf-8?B?ZDYrTzJHUHVQVTZZbXc0eGFocDJua0Z4S2YvVi9RZVQ4UG5QKzZpUXJMODAz?=
 =?utf-8?B?MHRSdXZqVEtHTUxYM295UDU0K29iemtvcCszVmZXd0dpcmk1RTVRRUFBRjJX?=
 =?utf-8?B?Nit3MktodmV6N2pDNXR0dTd3T21sVFRBa3pHd04xZXVzUFJJM21MaFhSYkYw?=
 =?utf-8?B?djladGJuZTMrTkppVnRZVm1xUzkyZUduV1FuOTRpQW5oWUl4ZlloR0R6cjNE?=
 =?utf-8?B?b3p4Rkg2NzNMdDQzUkhqMm5zSGIwWnJaUGlZY0JOekZ2d0E1WVp0QzR4MGhy?=
 =?utf-8?B?RUxlcWticmkveUh3SnBJaWFvcWp4SWl1ZzRBdzNuR09IeFdycExnZnFsakxN?=
 =?utf-8?B?MmpIQUpIUWVqRVNKeEF0NGpoc0c2R1JZUkliUHRBcFNZVWhqeFA1ejdmUGRm?=
 =?utf-8?B?a3BqT25Eb1E4SStFQjQxOFRycno1SkM5bmNSNFh3a3NFOTh2TkY1a1B3TDlE?=
 =?utf-8?B?L2ZVOU84RnFoQStmTDlJZWM1Q1NnWTc5Y1cwb3hLdzVuSFNJajJRZzdDY1Ix?=
 =?utf-8?B?Mm9hV2dCbkRpNjVZdkJjcUs5alpMNEtVcEl2cXVPMkFCcWx4YTVob2xrTVc3?=
 =?utf-8?B?dEZOdFJUTG4yZ0IwOEZ2a1c2blFaTnMvNFEwcENja1VENTA2MngwbmVzZEYr?=
 =?utf-8?B?ZlNSaWQwcmRTODVkc3k4S0tWaFRraThBUm5wRXRZWDgrbFFGK0hHb0tMUzVD?=
 =?utf-8?Q?LH0zB79+scIerfI+mw=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <71FC45E2C6C7874D9252767872C2BB5C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c941fc54-0a32-486e-6b0f-08d91ca8c101
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 22:35:36.5706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j1qZqD0RjS/BFbp3phN0LFxrvTGIukNTh4lFMgKtqNnrNzMtxkDLelhQnlFL4VaXQbCcUyhayF19A1tzrZsZ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3698
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_153545_603180_785D4EB0 
X-CRM114-Status: GOOD (  16.96  )
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

On 4/6/21 3:04 PM, Vineet Gupta wrote:
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>   module/system/base/target.scm | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/module/system/base/target.scm b/module/system/base/target.scm
> index 2088cd86697a..8bdcd66039e4 100644
> --- a/module/system/base/target.scm
> +++ b/module/system/base/target.scm
> @@ -77,7 +77,7 @@
>         (cond ((string-match "^i[0-9]86$" cpu)
>                (endianness little))
>               ((member cpu '("x86_64" "ia64"
> -                           "powerpcle" "powerpc64le" "mipsel" "mips64el" "nios2" "sh3" "sh4" "alpha"))
> +                           "powerpcle" "powerpc64le" "mipsel" "mips64el" "nios2" "sh3" "sh4" "alpha" "arc"))
>                (endianness little))
>               ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" "spu"
>                              "mips" "mips64" "m68k" "s390x"))
> @@ -118,7 +118,7 @@
>   
>             ((string-match "64$" cpu) 8)
>             ((string-match "64_?[lbe][lbe]$" cpu) 8)
> -          ((member cpu '("sparc" "powerpc" "mips" "mipsel" "nios2" "m68k" "sh3" "sh4")) 4)
> +          ((member cpu '("sparc" "powerpc" "mips" "mipsel" "nios2" "m68k" "sh3" "sh4" "arc")) 4)
>             ((member cpu '("s390x" "alpha")) 8)
>             ((string-match "^arm.*" cpu) 4)
>             (else (error "unknown CPU word size" cpu)))))

ping !
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
