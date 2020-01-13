Return-Path: <SRS0=AvZA=3C=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C77C33CA9
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Jan 2020 16:49:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA76B20678
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Jan 2020 16:49:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TeAaEDMa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KbodioWC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="oGe+xPsu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA76B20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cqb5oqA/2d++jDmypWh9BI7TrYe71o8pEl+F8xx7/oI=; b=TeAaEDMagMMtxD
	Q+No4T66MiFBWh6BSxS57Ef5mXtMD9gdzhSLeRdncnqUGcgvAUOnn7R4GnLVHKH4F7/NfBvllyx4O
	RJKYgBUuGgBmN5gkN1X3cKokGqOzlfPIzmvCam9fKqS2GIRV5bA7301gXvcmcT/RA8jJ75iEZMxog
	Us1HYkz2NpF+JtdMvVRY0Yz1i8uCkhPiHBYqgOMGfwnlLXX+3gtuvI/bqLFF6xZY1lEjKzyriD0Uc
	O5J8ZVZfXXEAjghgaL9Hk5UpCdjm0RDshN9Jv8KARnot6erLEN27piW9qfWC9nrdWLZWIP8Gfrnib
	G6slCsFUHK9m+drci6QA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir2uC-0002Y9-NA; Mon, 13 Jan 2020 16:49:32 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir2u9-0002X9-Pg
 for linux-snps-arc@lists.infradead.org; Mon, 13 Jan 2020 16:49:31 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D98C8C05DB;
 Mon, 13 Jan 2020 16:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1578934167; bh=pBPYSXlrkAVnXnpSQyiUHIINTZnIlRFr/ju+i939ZuY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=KbodioWC06QeM3ZIGGO7/oj/3k9h1zByGDEbR3ON0NTaJnaxD/Q9yXayG3e+g8jTM
 xRWtYqVvWqvSe7Ycx6/Mf7OKr51lRmnJpzT3Ys+KO7a+9A2OXvffb+9jeuBqUa3wAz
 57tSUm7UNvYdQ0Aon1zXXSgG9qs9HguwbhJ4B3r7arZz36nwfjqCAYuewIqBzL4hke
 Dw+BrSxHw8+KIPMf6KtHX9rOCx9ZbOF2jpCOoDrFeGqALC1Nyl2orWAfKrjF3BX7zM
 N+B/ll13d0S1scDZGqltK1Xp2MGmLQ143qwt0jXIPbp+31iUlLv8nSssb8QiHSAAos
 n8aV8CthAHq9Q==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 86DBBA0083;
 Mon, 13 Jan 2020 16:49:27 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 13 Jan 2020 08:49:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 13 Jan 2020 08:49:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOsRu7fG2Lc/1mOX4BJ184j0fLlI9/73433qnFqjXTZgmC9aq0OcYQPJlFBMIySl+z6Q4r5Zpf92clRjQxZqNDlUNz6AR34Tu0NN0l57dl5cYpzPcA21f+LkwBdAVgPfYIMyORqY+njpCheVXijsWu4KuhWsfq5nTunTxLT6QhhzhP9ImlpuG7EmsWgGvwz29Oy52U/0+5pd46wGaabhi+cKQT+wnQ7/LWyhGmkuNxUjdUWaVuVw1vvNRV3dgy+4SmV0eSUQ9JCZHVYSz+QHLDrCEHdHRG4Uhi7E0VTsR2im/8fsv0uoOThOz9cPK903oaOkxopRkRHpeE6UGCFovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBPYSXlrkAVnXnpSQyiUHIINTZnIlRFr/ju+i939ZuY=;
 b=AeFuIGWMmw78DCyiAVzs6cx4U1+A/27FlK/i0zLHy+lBTFsQcz54kGclIakVUffAbdxOGTTj6WsCdPrYOE7gkRDjrBHhd5xR8bW6jIJiAVBbo67Bsg/jE+BvOX2hlR71vbcnVkoNTjPRBTPRzlA4cw/M0Z07a1UW0jOiVals9ZlWWnEI0rmLJX4orOrzXPVLd30FlhiuNlTD6iLNOObwahEQErmsiG2mmpO8+PJEltoEkU7oRQGn+ibaba/CJ1dmFEQRu7Izs2T/EQ3lnx3gXd+2NO82y+tPvQ8ZyoJbjP6CmcYIDztvz37rFzYJHkqebRglHihxtRiqdOuHtD+Z3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBPYSXlrkAVnXnpSQyiUHIINTZnIlRFr/ju+i939ZuY=;
 b=oGe+xPsuf7V4gxotNrnDH02WY0dCfIQ8A0Ceo8F+2SV4aKT+bUJgVEhSvNOvdWph42QauvBUNb/YeINHDyChu+g3VeEvKYWyF5bU0JjV9c89+dxo1SBDMVWum4BASYPucb2JYiWCgQYTsUTOAwKtByIEw0A0ZndWHb1DGzIpvPE=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3573.namprd12.prod.outlook.com (20.178.55.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12; Mon, 13 Jan 2020 16:49:24 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 16:49:24 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH 3/5] ARC: handle DSP presence in HW
Thread-Topic: [PATCH 3/5] ARC: handle DSP presence in HW
Thread-Index: AQHVvOAPR1zSenMpqUm+DVM4mBlrGafecrQAgAWfTYCABNcRgA==
Date: Mon, 13 Jan 2020 16:49:24 +0000
Message-ID: <1a0b853a-32f4-09eb-2aeb-acf63a092f02@synopsys.com>
References: <20191227180347.3579-1-Eugeniy.Paltsev@synopsys.com>
 <20191227180347.3579-4-Eugeniy.Paltsev@synopsys.com>
 <6b80df9d-d0f2-d1e1-8e4b-b65531b938d9@synopsys.com>
 <BY5PR12MB403418CCC56FE9E2EA3232D2DE380@BY5PR12MB4034.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB403418CCC56FE9E2EA3232D2DE380@BY5PR12MB4034.namprd12.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: e7ef147a-c987-4c42-5898-08d798488bcf
x-ms-traffictypediagnostic: BYAPR12MB3573:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3573E86B5E8D1E7FC5177B2FB6350@BYAPR12MB3573.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(396003)(346002)(376002)(136003)(366004)(189003)(199004)(478600001)(110136005)(76116006)(66556008)(66446008)(64756008)(66476007)(4744005)(5660300002)(71200400001)(54906003)(36756003)(316002)(66946007)(2906002)(31686004)(8936002)(6512007)(6506007)(4326008)(31696002)(86362001)(6486002)(81166006)(81156014)(8676002)(186003)(26005)(107886003)(2616005)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3573;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tsk2DCKidyOLvVcHCmViUlDs1IDOoN/sYob17UnOqpgNCtgQ/Qv4B+q930fHlfStm5mzLJbgwK7PzJbd1z6rZ1Kq1itNSuKv0a1lZ+cp0nozBLSOaJQtlFmV9/ac4FoK3VXyEXFXrBU/Q6JsMIs6z0g4kXlDNfKTqRJtPIE7naIq0OXRiR387sxBldhafDmOcryTZHAteL5D0FXQ9UwFSjTjfOC43hXWxzL3bQyYE0XfRZClSja/T9y4OfJllxe7GpDZlbpm0+qUxZBRXI3WOxYkO9hyrbtsY9OUbKlsh9HPh1Y3liau+kWGXe7rt8EEI3OPV8K48REnA7L1miYjNLQZ5NXhWpiotMeOeZyHWFk7Mksz9u1qg4DbMFIo96pLikErwxY/rGxelUIlBBdF40oZJONlVBSPrIkUZ5QBoUornonrpNPMd2aUFTYvHJxV
Content-ID: <406820F04E3033419A91B2D4273C2199@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ef147a-c987-4c42-5898-08d798488bcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 16:49:24.2146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d244OmiIjcrM8g+V484Uw92atqVfZY9iWE/A2GVi8vyPVjAC3OtRRVTJr5zcBRhzxwwLgAGXR69ZxQKUtgsp9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3573
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_084930_045956_E2980214 
X-CRM114-Status: GOOD (  13.96  )
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
Cc: Alexey  Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/10/20 6:54 AM, Eugeniy Paltsev wrote:
>
>>> +             CHK_OPT_STRICT(CONFIG_ARC_DSP_KERNEL, present);
>>>       }
> My idea here is to encapsulate implementation of everything dsp-related in the
> file with dsp code. So I'm even thinking about moving the config check itself
> to some function like
> 'arc_chk_dsp_config' which will be located in dsp.x file
> and call it from arc_chk_core_config in setup.c
>
> This requires to move config check helpers to separate file/header from the setup.c
> However this allows encapsulate all DSP code (and some new subsystems code later on) in its files instead of spread it across the arc code.
>
> What do you think about it? If you really dislike this idea I can drop it.

Ok makes sense then !

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
