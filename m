Return-Path: <SRS0=vrW9=4Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402E6C10DCE
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:55:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05227206D7
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:55:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r6nrYEKF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VbpB5czI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="h4yNxejw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05227206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zktSfgvCOYBE7Ag6Vgwru0YWtOBWyhO1nPtqTJrhojA=; b=r6nrYEKFVReLsH
	/rO6dscHUXQj1OXUoGe060aBHk4Hxr4rIa0XU8drvWn69Y7xMexNMZc0iwzVXjellTQmGQzTuAkUg
	26nUWKQ5XONCHxCtnBXuL1VjF98SrKhrg/vBCsDbvw2cXfnQzS5qciXAa+mjIUkrB53pZr7ukh9RU
	pIMd++Ath3QdK3GKDYHnOgFKmo2C6osCCEbhId/gUWfiITwXWtZsP6ypTsOezt819tudlfJ8M9qk0
	Fc5AAp9oLtNBUsojj5RBBVUIgPE/EbeePMBediabOZjD5koJjdlA7/SzwRhPHP/L4j2Ild780n+Hj
	kvGTdTn/dkObd58EZ0bQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jANku-0003vo-Ho; Sat, 07 Mar 2020 00:55:52 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jANkr-0003vJ-TH
 for linux-snps-arc@lists.infradead.org; Sat, 07 Mar 2020 00:55:51 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7BE2A402D1;
 Sat,  7 Mar 2020 00:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583542549; bh=R852vkFCsZuz/b82Hc/51orEIHk5PFsxxdATpxDUjrE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=VbpB5czIj4WF2PqNiSk3OJ80uBBYb8UrhbZR27FSATE2ttzOq8BVm01UouxalMo+k
 yqJLQjaUSEq0sA8Go0TStCfU6bshgNyEzoO4An1N06V2VTf2gC6knKc9Z/3aIg9DXp
 Mecmshpft4KyHNzhruiLhqPk5c7G+4gWKuMGSTZr1URSDIQ5I/isu0J+HgZb4b5N4c
 zxwqlm2tl4f3E8qOL2ox9PUEiyUfKrqg/nsyeFTcEsxgaXjS7LG6JrMfHnlSmFniV+
 Hpk7KaRR4RvFl9EmeZIRMU/pzmmWX3O35rDiqslShaNckfKLCvl4RY5YyqldeuPtLh
 wxLW9SuPo6pjw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 46265A0067;
 Sat,  7 Mar 2020 00:55:48 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 6 Mar 2020 16:55:36 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 6 Mar 2020 16:55:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HG3bWZCzYgalaEfajz7IbwPpmPa97HB5JqwKNO/WhlRzp+WqmOw4ATnaGGdYyvuRoqPwr3KsyVxTEgJ87Qnofpii57hcHjZXhx67ytJ72GqeAlLkWZ7niRWqNKQw2H52/Y6zoWuVaKLN0BwvE1dZgKxpgZAmZ7Op9XWUl6bXpYKPoq8/buWUOHDy8imLe2UV+uMgEk64kuvoUcxDCByGyyGgbp2/RyMncRUtD81ZzBUorGrJcAd+RhbImgPGMJr+DzOkKH9Asql+Y+3IAvx7Z80Bt8AyYlw0SppAcL89Ff41jTjT7CSFe31T/xMg30Dx9bSF8w7f1GQzQX8nYQpKrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R852vkFCsZuz/b82Hc/51orEIHk5PFsxxdATpxDUjrE=;
 b=Ws/ynqX4J8JfeHWlkzhL2fp9waTr4Mo9UYU7HjGT8sfpQY6NYo1MZJ++CDBkgZYLHIYA8LooebCIGtMEgvAYVsNxlaZwN5BHEPJeYAHhne4AvmxzkLka+WNVs+d8G+0kN3HaM/7sCieImif4bO1/eD0a4UE9jX9LOPCy3sixGK3bu483Lgji1Dfu1j1nRVs47bBgepw8v6PVBJ1w1AOo8Pvsp2WNh673GT4GlVfUl4BJH5DqlFnOHbawSiP5oiJowbdXfmYoUAbjsb2hxFgc48Us6nqhDhJ5Wdc6UOqVNPraTsENqrxokNSq/ZQd/ng3EP2V8h3tmMHFIwkWZ/TGIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R852vkFCsZuz/b82Hc/51orEIHk5PFsxxdATpxDUjrE=;
 b=h4yNxejwRPZ2T7x/hIRrDYEpoWS/03w0mQqnTx+tFc1x6mPVcUN4A3+Ku4mMIQPqR4lfx/6ZbQTpIncULEiAw3Wj+DFmrIr6cMsdxJ7x4Y7Z9PDzRItlGIKjyAaSelkrHfKFvMJEdA46ILBDI7aAzcBN6mQ9Cv0XW1a8BBPJYGk=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2952.namprd12.prod.outlook.com (2603:10b6:a03:13b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.18; Sat, 7 Mar
 2020 00:55:34 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Sat, 7 Mar 2020
 00:55:34 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v3 16/17] NEWS: mention ARC port
Thread-Topic: [PATCH v3 16/17] NEWS: mention ARC port
Thread-Index: AQHV8+SLvTlvWDdLZky6zRYnn4HPmqg8QuCAgAALiwA=
Date: Sat, 7 Mar 2020 00:55:34 +0000
Message-ID: <8eb3acaa-3d83-a6f9-cf2c-7355b1a83410@synopsys.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <20200306182419.13945-17-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003070013170.26274@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003070013170.26274@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5fe9321e-bc73-4d5f-fcef-08d7c2323e12
x-ms-traffictypediagnostic: BYAPR12MB2952:
x-microsoft-antispam-prvs: <BYAPR12MB29526D4128C8163D03CE9DA5B6E00@BYAPR12MB2952.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03355EE97E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(136003)(396003)(346002)(376002)(199004)(189003)(4744005)(54906003)(316002)(53546011)(6506007)(81156014)(81166006)(478600001)(66946007)(8676002)(31686004)(2906002)(8936002)(6486002)(5660300002)(2616005)(76116006)(26005)(64756008)(66556008)(6916009)(66446008)(36756003)(66476007)(186003)(6512007)(71200400001)(31696002)(86362001)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2952;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BHUKIOdnH/SDhWFYC05BUcq1IJ+rK+UCWZMOo8xmSLVSOZdAS3iY+KrqlWFyw8ZEUq9UWTCoHcZ5YP2upHLbMGTqIzdUIUvPpcajn5pH95bk2XNCdEhHoSLPKv5Cxm9idkjMQOe7HdPkTs4rH1RYCj0Bod1x4fPdKg2leXGe/CVSMQ7KSbSR7Dx678cAKIbhytBLaJDEZuiQcH1t1+sLnfcqw0R51MdmqvKb25Kz9XKF8Qod+X5ct6DZP1X0IItHi2fRH95E8p0+aXlZrT8V3JGi2gccgi21uVLmp9RZByKyttHmVoloI0IFMDab2Xi28+fxPEWP2u7W/GzLxY2zwcnp73aTMPXMZxAJA8FglOnIahFBjKCcdUJ/wnxfhBVGc2o3aHeLuzA1FApk+YO3Hbqy4FX7f92lteooOhW3InzAlctdDCBBPvrk3nMMTd4M
x-ms-exchange-antispam-messagedata: Tq2skPOGqHWfgI+Chg5+HZZlYloHIaVdMcV3V2Or5RwKzEkwQRCl8Ad1cMGDqvWjvAEGuwWwCg5dU1Jl1RCICNHXIAIMFaUX1ZY1vJQt/QU/BrrtAt65OSqh4oMskXKMScI4iku8b0WSZh0geTBK9A==
x-ms-exchange-transport-forked: True
Content-ID: <EE774FFF9E25D346A66677F3C863AFC7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe9321e-bc73-4d5f-fcef-08d7c2323e12
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2020 00:55:34.0550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SPpLYkx6PCYTM5aDesU/V5OUynGvhEiRNoMfLn7E8S+Lmc0ZBD5HPMAkrcwqTWgE41p/6KEqiXGPm0i9VT1KYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2952
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_165549_955398_F4D4A0A0 
X-CRM114-Status: GOOD (  12.23  )
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

On 3/6/20 4:14 PM, Joseph Myers wrote:
> On Fri, 6 Mar 2020, Vineet Gupta wrote:
> 
>> +* Support for ARC HS cores running Linux has been contributed by Synopsys.
>> +  Port requires atleast
>> +    - binutils-2.31 (binutils-2_31-branch: commit 6ce881c15fc4, 2018-10-04)
>> +    - gcc 8.2 (gcc-8-stable: commit 0d5ba57508c5, 2019-01-29)
>> +    - Linux kernel 5.1+
> 
> You need to update the list of supported configurations in README.

Ok did that now. Is it not supposed to also cover the hf (hard-float) configs for
architectures in general ?

> 
> Any architecture with a higher minimum compiler / binutils version than 
> normal needs it documented in install.texi, with the INSTALL file 
> regenerated.

"normal" would the ones mentioned in build-many-glibcs ? The min versions for ARC
are over year old already so I don't think it needs mentioning.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
