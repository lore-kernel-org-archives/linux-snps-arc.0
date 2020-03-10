Return-Path: <SRS0=UT4s=43=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F77EC18E5A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Mar 2020 12:19:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D208E2468F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Mar 2020 12:19:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E2rusBcc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="A8LTA9Bx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="SelP34jX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D208E2468F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFas/arT/hBLsanYgkoDtkHkd/ihRC2FtQdLOxaBhpU=; b=E2rusBccREMV4m
	uJ6kWasUVOQM3tYAK7No6gNDdKmQhe14a1i3sFgwhrJyk8V7ivjxzhggPxMr0i2SEHraR+MNt/0Iu
	wVM0k99AQbG07cHlABkgdZjE5g/7I4HShEdUMKsdWB18Q96KPjVepU7HkmkGjXwTaS3P7Rujg9Y3D
	CBBWKEswR0jDb/gwHBwl2+FlcC2ovd8wUG+uHHQgwNHyd07+9BMTnZa+Ix3FY28R1OdPwaSpMEjkL
	knmvsgbSqW6qu7gmrc9GaD7UbzHeNzBTfQeQEXfPisBxtAmRYJIsvT718xpZoyAd6iJSXX1mkU4w0
	lXlUDUhzFOnvVT49OO7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBdqz-0005uO-4Y; Tue, 10 Mar 2020 12:19:21 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBdqw-0005tw-Vn
 for linux-snps-arc@lists.infradead.org; Tue, 10 Mar 2020 12:19:20 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7C3AEC08C3;
 Tue, 10 Mar 2020 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583842758; bh=qHi6r2jm5C+A4UoSUPpE/S6k66T7hXhnIoGL6IfmrpU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=A8LTA9Bx1elj2YmcQ3r4DHW9MJW830zLPVsCoMEaW6ekUS0woPOUEuF45Lty3nmkQ
 VG/DubWzNo2PxLmgZAyFH3dlZ8OnWBiavTdMCI/CBVS4x5yMiurCf37BoOaKhwXA38
 srjpx7qar/9eiysK1NoIsVFhaKci/hQbILDPBD9hO0VxwbXKqORYCv9W3M7urbUhaA
 S/q4b/JVYCzIdosY8yc89/3FC8P8EwuvzbIJw7UfcUOakAnpZwlvqVjzUrPsFw/iKs
 48ein96aA2rQOTVdCZCrycfU/lqBNL8CeM+/V3yZWZ65PhdioNF8/AYB439LAq4rqo
 9ErsbfWT6VecQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 1D4E4A006F;
 Tue, 10 Mar 2020 12:19:15 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 10 Mar 2020 05:19:14 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 10 Mar 2020 05:19:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmYWRrov7Yn1Dj0o+qrHHW7cH2u93/bJjuAotcuTeyPPb2I6POavs0PTxm4yan8PdRAeoj0+EXMVv+Zo0AlB7qHJAmO/akQZyfvJ+Yn9hXmMzfQysQ30Nz9Dr85TuCRx9fNgCIgwvRLNflUBEdc6rUBaKcvVC/oNtapdeKpmzRijgkUvK4FQFyI5f+KgvbASrMKgNee94Em9iY5zJ2BpU2aUmma7TGeI2JkMHx6qnWkqC+26do5HtF+W6hrQ1I2auGQIBSeCta8M7LLRIJ98D6gIQYoat3k2MtRirJMAuv633V2TZw5S/oIiXztt3sgMKG39ACsOXq4cNikoZLcetQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHi6r2jm5C+A4UoSUPpE/S6k66T7hXhnIoGL6IfmrpU=;
 b=jlOTx1Gc7lm4y78o1sD2TWBnNUZ4Ny/DuAl3LCuiavFCjS2hpSw9ITUI20scxSCaMUc4eE7OCo9ITxtGk+Df5oJYcgJZNB6/U+eWAZ/xWEf/nAHXrj3++XZ/Z2n5mNSGpaY6bdLNbwumV05cmiU8oKqZYxG1fgJKD8+/rA54zk1cGLD0YMLCrHXLilma2Pxw1JuW9B8C30R+A5K46pyHOZe9FK5XWf6QV+1jN8vfqCVDLbIm12dXDuHA7MxkFcggpiN008Mqicc46d5tIAfZXyMh9VDEjSxFMfA89XEHGbCi2MLaSwemueNXGfzozGZaU/KguMBpnMdbyAfwbOJQzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHi6r2jm5C+A4UoSUPpE/S6k66T7hXhnIoGL6IfmrpU=;
 b=SelP34jXBqx+NcBW/VujIAFz4pgD8TyEkEpwROI9cm/LuXuDULmuBa9h2kFsZyLVkACwJm8C8o5fYGInkuVboZiXMhB+g76KGdFV6O42b2LoUvBLffme/ZmEmeSAiWQfZq9pfTbITLPz5MGWaE5df8YE++yb85D60vdfB00JNSw=
Received: from BY5PR12MB4034.namprd12.prod.outlook.com (2603:10b6:a03:205::9)
 by BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Tue, 10 Mar
 2020 12:19:12 +0000
Received: from BY5PR12MB4034.namprd12.prod.outlook.com
 ([fe80::3531:93d8:93db:207a]) by BY5PR12MB4034.namprd12.prod.outlook.com
 ([fe80::3531:93d8:93db:207a%5]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 12:19:12 +0000
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH v2 2/4] ARC: handle DSP presence in HW
Thread-Topic: [PATCH v2 2/4] ARC: handle DSP presence in HW
Thread-Index: AQHV8ykv/JMPPGHpokOBrJCtc4/bvKg8Q+KAgAWB5js=
Date: Tue, 10 Mar 2020 12:19:12 +0000
Message-ID: <BY5PR12MB403438CB6508C7F3BAE4F7F3DEFF0@BY5PR12MB4034.namprd12.prod.outlook.com>
References: <20200305200252.14278-1-Eugeniy.Paltsev@synopsys.com>
 <20200305200252.14278-3-Eugeniy.Paltsev@synopsys.com>,
 <2d11b6d9-a37a-8cc3-1feb-a9dbc345de12@synopsys.com>
In-Reply-To: <2d11b6d9-a37a-8cc3-1feb-a9dbc345de12@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=paltsev@synopsys.com; 
x-originating-ip: [5.18.243.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca381f11-4fbd-4756-4b42-08d7c4ed3e0f
x-ms-traffictypediagnostic: BY5PR12MB4035:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB40357AC53BA69901D34EC00FDEFF0@BY5PR12MB4035.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(366004)(39860400002)(136003)(396003)(189003)(199004)(66946007)(26005)(4326008)(52536014)(33656002)(66476007)(8676002)(81166006)(81156014)(76116006)(64756008)(9686003)(66446008)(66556008)(55016002)(91956017)(6506007)(110136005)(7696005)(54906003)(316002)(2906002)(186003)(8936002)(71200400001)(5660300002)(86362001)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR12MB4035;
 H:BY5PR12MB4034.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NwnNKBNYA1keQC+tpFlVUxDBkYrYsscY1Kvf6Mgv5UyT4HLUCiSt4ej2HZmuM0Na1G4vEx+ippwtkgRUk+1Ptu7hu0mjfQZBgSGlbOjgBoNc/FUMCfqmaiwlkmfdebrp9NKV2vR+nWPbs37A1N3zkuL1N7IpR/nXQ+dn1H/NOnk2D221I5JkpMPIioRG+7BF2XVYwN0s2oFe8j0W2AMLpbMC3ujakPAYC4l2p6VwwR9TKC0sB+Z3TDpwqfbrFB4lIUsU3xb7LIzjOeX8yFzGSJsXKSQruiKmnGFznD9YPCXxL/hGsKiwrfDOUc1liFjY/+vj9DlmkZfymn7vbVSdANwokF4hrj0GFjvAWP20NB8L2PuKZNllY2nNupmBA7IOf0bVTR4FVLirgrfJO9PHSzn6mInVogRIzp8+UEDTkULNrqruAaFyLyNlFqkSyKBp
x-ms-exchange-antispam-messagedata: 1BBVTgjAmgnUrATF8fadlmVgNIuWJejMbV71//nEoa0heGuK43qJerL/sKA1aRzwMeIOcXuGHK0AOeNZLpWKbWCIX930rMVLoME90znpAmC2N2Qrxm3kEyxbrGiqaRil9qUMpxHunZtHzNhm0xb21g==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ca381f11-4fbd-4756-4b42-08d7c4ed3e0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 12:19:12.2283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S0wjRVUSe2NPjn9ye0JMvK+qKjW5s/ESH0uoVckfBQAIYg8q8lraYqcyraPqYw1u26VPlJ2fk4nFNMk25vFsMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_051919_091274_B58B1943 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

>From: Vineet Gupta <vgupta@synopsys.com>
>Sent: Saturday, March 7, 2020 03:12
>To: Eugeniy Paltsev; linux-snps-arc@lists.infradead.org
>Cc: Alexey Brodkin; linux-kernel@vger.kernel.org
>Subject: Re: [PATCH v2 2/4] ARC: handle DSP presence in HW
>
>On 3/5/20 12:02 PM, Eugeniy Paltsev wrote:
>> In case of DSP extension presence in HW some instructions
>> (related to integer multiply, multiply-accumulate, and divide
>> operation) executes on this DSP execution unit. So their
>> execution will depend on dsp configuration register (DSP_CTRL)
>>
>> As we want these instructions to execute the same way regardless
>> of DSP presence we need to set DSP_CTRL properly. However this
>> register can be modified bu any usersace app therefore any
>> usersace may break kernel execution.
>>
>> Fix that by configure DSP_CTRL in CPU early code and in IRQs
>> entries.
>
> How about below ....

Good description, ACK.

> "When DSP extensions are present, some of the regular integer instructions such as
> DIV, MACD etc are executed in the DSP unit with semantics alterable by flags in
> DSP_CTRL aux register. This register is writable by userspace and thus can
> potentially affect corresponding instructions in kernel code, intentionally or
> otherwise. So safegaurd kernel by effectively disabling DSP_CTRL upon bootup and
> every entry to kernel.
> 
> Do note that for this config we simply zero out the DSP_CTRL reg assuming
> userspace doesn't really care about DSP. The next patch caters to the DSP aware
> userspace which this actually saved/restored upon kernel entry."
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
