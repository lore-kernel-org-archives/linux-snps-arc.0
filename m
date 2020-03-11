Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D614BC0044D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 21:10:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B134920739
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 21:11:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g+xatrpQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="D66Yb8In";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="lZMBb4FC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B134920739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKYtTMvi5jFQTu7JQKDH8UXmDshkWBDYFfW3jzYoWjM=; b=g+xatrpQbxhfgz
	roWIimd8x1AOwNBLwp5Rkdg0eqWS7qu9RTMeMos1sRZq2kp2ooy2Ace47feaXaxSnow2Uuyoslmyl
	Q2aJWSpxf2oHJPnrP98EGTZ9caEFiO/DyCR4Y+Y6QT4ROjRHkoWDracRsCzp18qQ2N/KcozsIQ9XU
	oeL1jO+Wlrvacgs9qzhzNC0d8nm5ivfzIGdIznu7GcfhpRWP6kfm2PsdaPNu+OCoX8aRcw+g3czYM
	itewhwX0NnITUo+tfv8gut8BuH+W141FW5uoIb7APd08PTRZ27ANV8/Ths3FU/cy/YulNowRT8kcm
	wVv4xK7RyekDHOb6BAKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC8d0-0003Ip-Ma; Wed, 11 Mar 2020 21:10:58 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC8cw-0003Hz-OE
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 21:10:57 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4C947C0F6D;
 Wed, 11 Mar 2020 21:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583961053; bh=WNC6DozOlP+L7U2CmsQjwoA4wovARtHTV7A5RcFjaks=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=D66Yb8InCdlmwWZXGUhyc3Tk/G4cI1sYjwmmcwnwuStUz1Ya7bfTYZmhyQ5uAhnf2
 e9Ym4w1X/lbR8YcyVpA7ABJsHCuRbtUAnLbYA6Z5xz5LxWa+CFEE8HGTFyeHcwuzfJ
 0fOcG3+1lxvyzyaJn6xpTFOKbeioGZ2fe2sRWAVvaVjkdKNL5h/zXuW00SlvE8KKE9
 UkwK/Ikgw8fxid9qbkkqMKDpBF7Ra6VS1g422uDYjLDuuRwBkRm0VsN1q4RS0nkkM7
 OYH5ORujOXEMiFMwz8mPaWXpjIugC2Bv3aV1ezVQRZvMe41+4N57ykrNSudVkTPbp/
 i37MCwMKY9wwg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 1ED54A0083;
 Wed, 11 Mar 2020 21:10:53 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 11 Mar 2020 14:10:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 11 Mar 2020 14:10:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXtMeFdR8bam+Kz4uz+HowZIqyDRBiEPc4V1RcwLzvQZ6zw7XXgcmYCle2ZYebguRjnn1vQtMvvaL7uvq9DPMReY3siQPEmJoe/SxkMPK7gbSwsR3yCYEi2A6RrIguTiJB1Q0FS0W+CGNECFVrVbb9+HF5jrBZcXa4QqDpzjaAo13Njn72S7c2eNE7z5IXIx8tlTylwMqf3WcC2bLB1mILL6mh6Z/37ZZfFDbPtfkedifKdeAtRg6iM4sBKnWdHOV7p9Vp9/a8106KQLXxxVDUAgWy2hjBgScezV27zMG1ssWKuqY7TpCrIlLCYcXAKROe5zdc847Ow20Dm3V7fwqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNC6DozOlP+L7U2CmsQjwoA4wovARtHTV7A5RcFjaks=;
 b=h7WvhlyC/OlrxvtWxNol6PLYQzqhT8xEcb6ktRODaU/oSNl/hZ0whvrH7W7w7c09eOvGXEDh9RJfBr34sfwmckqibkL8GMGzZfurq0o5RLeiZTVZgQ9d9hP/4uVUlGnJXRPOytjDEM9tPZSJbAOMO0Tzlh55/gcAKoAHYVhok2myNmqILFCUnCXrIThaT1mcnI3WtATyOzPZogmJ1YpeTVJsIlbCdHa7mODY1XZH4cMF7mPLGmd8gAOgIvVhruUppPNTHlc/Sgj0c8r+YDz+aYDdGRExDPCrajxVBWucGtrzil3BQvTfb7zHd7XznZ7Z6m9VIXZEFRQGi4AgKDqdSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNC6DozOlP+L7U2CmsQjwoA4wovARtHTV7A5RcFjaks=;
 b=lZMBb4FCE3QwjSjiufcho/ebE9sXNpqM3mWdKp2A+2lgspMI7AKkcr9lx8ebh3IEFhowdaC9YqO88HBfGDYhYiLzF1GZ407yNc+WKTn8SRbu6pQct/Y8AhGFxTGyJMNtpxHjjo0q/dT9UtKOBwrbEQZVdKWn9jdmV7C1kIxzA5o=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2728.namprd12.prod.outlook.com (2603:10b6:a03:61::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.18; Wed, 11 Mar
 2020 21:10:32 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 21:10:32 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH 2/2] ARC: don't align ret_from_exception function
Thread-Topic: [PATCH 2/2] ARC: don't align ret_from_exception function
Thread-Index: AQHV98Hv9KDgib9650awLwyjmkVe16hDqFKAgAA3uQCAAANwAA==
Date: Wed, 11 Mar 2020 21:10:31 +0000
Message-ID: <a6728afe-10e4-ce85-b133-17395ac99b86@synopsys.com>
References: <20200311162644.7667-1-Eugeniy.Paltsev@synopsys.com>
 <20200311162644.7667-2-Eugeniy.Paltsev@synopsys.com>
 <448ba208-56a5-d8b2-9675-7be03b872c23@synopsys.com>
 <BY5PR12MB40348292DA303489C1DA2B66DEFC0@BY5PR12MB4034.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB40348292DA303489C1DA2B66DEFC0@BY5PR12MB4034.namprd12.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: e4f3352d-71f4-4786-504d-08d7c600a23c
x-ms-traffictypediagnostic: BYAPR12MB2728:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2728AD3D2291780400279238B6FC0@BYAPR12MB2728.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(396003)(366004)(346002)(136003)(199004)(64756008)(66476007)(66946007)(54906003)(8676002)(66446008)(66556008)(8936002)(81156014)(71200400001)(81166006)(316002)(186003)(53546011)(26005)(6506007)(110136005)(31686004)(76116006)(36756003)(4326008)(86362001)(2906002)(107886003)(6486002)(478600001)(2616005)(6512007)(31696002)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2728;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1SEFvrW7yfsRk9wkDvsEayrPRstBECRZ0Jcjnd6C8iz9epnQkmdYTyp+VRL2kanKWG5STFvjGQYdR45uguhWrURUSeDVVSG5WGwcvqlNloCk1HtlnGEguqFXxkU7+vEI9fWJbDzQyhTgmWnKxigNaJqB8Wxo0mKLUBDWU3+kquN4lIESpnokXB2UYMTmsMwGQxJpfHEIm//3obxghHTmtJoLOMRiyA01lLq+YAoQ4Eay3kTo228vEKTfqW7BuNrxgnfpnbWJSqH/5x4VE+OWLuDWRZAO1FkBJvo7y6EAnw3e/DzbwGwb9Ck04r8qbVHDtri6mH3bbAOgSaXB1mQVIR7+GViZb7SdZJ7K/DLFnDp5tb6Srk4zbuAhMQNsyVTKlIItQWRVw91hA64mE1Tv7e6YE0rMgIHVgWSE40uJJOq9lgu48EQkvX6Yh27G1DKL
x-ms-exchange-antispam-messagedata: 3IRTVE5KjML6Ht5a5m2r/anIlYMp+EqaMwjxH6k+tAouotVjfGbQ7Ezx9dL6aPPqe16gS6ct0ZIpY2CkDh89PLifgqGCFGO8kpP6SY+ymND45k26W8FEwTzOvAeUGiPHZDU0ZcnfCc7z6ON9G9GqGg==
Content-ID: <175F414B7612564092E7BF61F1044787@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f3352d-71f4-4786-504d-08d7c600a23c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 21:10:31.8237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zoC2j7FYJ/QdsXZPOtVZ6wfVRPxL2Pdl5950dw2wPlcP4V0lkMhEM6n0scyh4gtE6GtYTJLFVgGdAgEgBrzB9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2728
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_141054_859604_A704E6E9 
X-CRM114-Status: GOOD (  15.93  )
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

On 3/11/20 1:58 PM, Eugeniy Paltsev wrote:
>>
>> I would like to keep it aligned.
>>
>> ARC700 definitely has penalty for unaligned branch targets, so it will definitely
>> suffer there.
> 
> Do you know some exact numbers? I'm not an expert in ARC700 (fortunately =)

I don't remember the exact numbers either.

>> For HS, unaligned branch targets have no penalty (for the general case atleast),
>> but if it does get unaligned, the entire entry prologue code will be - i.e. each
>> one of the subsequent 130 or so instructions. That doesn't seem like a good idea
>> in general to me.
> 
> I really don't insist about applying this patch but I don't understand your
> argumentation about ARC HS like at all.

I knew you would argue hence I already copy/pasted the start and end of the
epilogue already in my prev reply which you didn't care to read thru.

If you start counting instructions from <ret_from_exception> all the way to end of
<debug_marker_ds> there are over 130 instructions all of which can be rendered
unaligned by your patch. What is worse is that this would be unpredictable: the
unaligned case will mostly NOT happen, but a new compiler or some subtle code
change could causing potentially side-effects we won't even know where to look.

>> I faked it using a nop_s and the SYM_FUNC_START_NOALIGN( ) annotation and can see
>> all instructions getting unaligned.
> 
> What is the problem with it? It's totally valid and fine for ARC HS to have instructions
> aligned by 2 byte. Or are you talking about ARC700 again?

Yes I know that already. It is fine in general as I explained earlier, but can
potentially NOT when 130 instructions are unaligned.

>> Before;
>>
>> 921238e4 <ret_from_exception>:
>> 921238e4:    ld    r8,[sp,124]
>> 921238e8:    bbit0.nt    r8,0x7,212
>> ...
>> 92123ac8:    rtie
>> 92123acc <debug_marker_ds>:
>> 92123acc:    ld    r2,[0x927d81d8]
>> 92123ad4:    add    r2,r2,0x1
>> 92123ad8:    st    r2,[0x927d81d8]
>> 92123ae0:    bmskn    r11,r10,0xf
>> 92123ae4:    sr    r11,[aux_irq_act]
>> 92123ae8:    b    -140    ;92123a5c
>>
>> After:
>>
>> 9212393c:    nop_s
>> 9212393e <ret_from_exception>:
>> 9212393e:    ld    r8,[sp,124]
>> 92123942:    bbit0.nt    r8,0x7,214
>> ...
>> 92123b22:    rtie
>> 92123b26 <debug_marker_ds>:
>> 92123b26:    ld    r2,[0x927d81d8]
>> 92123b2e:    add    r2,r2,0x1
>> 92123b32:    st    r2,[0x927d81d8]
>> 92123b3a:    bmskn    r11,r10,0xf
>> 92123b3e:    sr    r11,[aux_irq_act]
>> 92123b42:    b    -138    ;92123ab6 <debug_marker_syscall>
>> 92123b46:    nop_s
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
