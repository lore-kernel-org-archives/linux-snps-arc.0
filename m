Return-Path: <SRS0=Z+JP=32=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C5FC35247
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Feb 2020 22:42:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5356214AF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Feb 2020 22:42:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YRGXvlzc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="COqu3zES";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="CDb58ooa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5356214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4FcqwcDOseKRHghTogo5irJflq3OPGfC7bf36yFq+I=; b=YRGXvlzcoifKDm
	OmXNuub0BPEXSNsLNz2uot2RIIXLXNJZC0BfzifjFFgMWLKgzqKETNVctfZiaFlFOMxuRS7ZCS9EW
	0/wi+hIY5WQf8feTmEuaaRcz9X4JFfDhsoUG+H06nARsaMuTflTW3lf0493Pdn67eFnZ6rN5ky3ak
	UqD0Cbxo6UMpcm1M0QGEksMLyeCn2a3WDWXOoPZDoMT5wDfDPEtrvSr2XpRpM4qyJBXfDocBLRzI6
	bwCDKD9dhbDyHeytd1oWfjQJyNT2pNpSp1QrxLoYXOcJFdkmv355BIVnh788JsUHobcnsPuyQ5dV6
	1Z7ZOEO5p+15YB82bVhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izpqe-0005ex-IG; Thu, 06 Feb 2020 22:42:12 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izpqb-0005eZ-Gc
 for linux-snps-arc@lists.infradead.org; Thu, 06 Feb 2020 22:42:11 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5DF3EC05C6;
 Thu,  6 Feb 2020 22:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1581028928; bh=pyaQBwuDaqKw4oZusfaSY6B9zpt3L+oKtyMkjCvtYrg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=COqu3zESZBZnfQCqTU2CDvAnGAM+kIssZ+5BoE2uRVKWO0BfFPbuMi3duWy1/axba
 B48eiA4TZIQwizr83pzGT33EmMxCHK1WYyaJBzfjiA0DYbUwB+XMFZ5EIToYmLezZg
 TL7aV1MBSgUdbQHMkJrc8ZUcQZX/ldPLZGp4u96NJDLVbCUmwiz04PsvWm01DCE7tn
 /2Hp+1kGWgpW3nk36x6PBCHtwsIYIRvbKnxwCWmM342awmJtOfAKBzw9tI0zkiHlJU
 /WRKh9l1NljjOcIep6mXHTb/1XcPP5BCqTSY5V6g0Z/G99/nuNamTJazZFmnH1dOEI
 tXAJ+xvZ/rR9Q==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3C643A0069;
 Thu,  6 Feb 2020 22:41:59 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 6 Feb 2020 14:41:47 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 6 Feb 2020 14:41:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jN+PB5C9D/fC1tssI/bs0Wx2vMokp+kYfTKIzd205PCJMRZMO4EbjvNEcDaRv4IAmNCxlqNVOkXzS+88mAdFXxbLdtBC19o+6xERUX59Vgl9NVvdFWaCwyCweliL5p27dUS+3jJciPdLqsjBVmU/ye4eQr4dYyw5gbqOlGd956toc86S44bMevhGXDwQTK+GoyIsGzIvio28C5jnjpHyw79DYqI2SsB/W7xj7dradsOnp0TqA2qS282mYpm+wTDIgR2RI+cQqkle/sWqPt+4LFIcjXrd7dDIbP53Y8zvXGgaOsf1mthvtaBTiL3J+54bRABCG1IiWSMK2AOoB8K4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyaQBwuDaqKw4oZusfaSY6B9zpt3L+oKtyMkjCvtYrg=;
 b=JSDcTQNVEvVjRb6V0lyDXyY3fZXsU/rH0ZJOIbSe79kv9Q+MjGB2RCZebdUQ+KgVrSwiR0j/gAIwx7r3uVl/AtEq8u99IvzVT3XNy+pYch8ktKe1MSP17AaZEzTC9g7LdDbvE6nt4Ry5zDIM3GAc8zbNeULQBmvde2twu3DcbYkRbGhAShzrnWwsWbDx8KqMO0ZdwjvtzscyGog+UNc/tOetaRZNjVfK0Tv+ePRTDpFltv7m+l2Z2XlmVSxWdNLQj+s7GEt29Qc1B8QF2yfp9sLvF+MS0hV0km9vPsfJIt2xTZEoOjoaneSnXF4RakhhBDAiyrcLFq63VOsTi+rBYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyaQBwuDaqKw4oZusfaSY6B9zpt3L+oKtyMkjCvtYrg=;
 b=CDb58ooaZ5s984//80YHbrBehvEvS+Z/ptx76K7rVjsfhRbRXfV1qApZi+308MHXkUqGGmNpPuBqRjZzCW5n3C/gXycm3CyIB1Hz3h02mc7I4DFL+mRT48iFb6zybdxQJjRQB0ag0J4d8unoOkekD7ojY8UE4a1XFcWe78t8E+I=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3127.namprd12.prod.outlook.com (20.178.53.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.23; Thu, 6 Feb 2020 22:41:45 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2707.023; Thu, 6 Feb 2020
 22:41:45 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Alistair Francis <alistair23@gmail.com>, Joseph Myers
 <joseph@codesourcery.com>
Subject: Re: ARCv2 Public PRM (was Re: [PATCH v2 00/15] glibc port to ARC
 processors)
Thread-Topic: ARCv2 Public PRM (was Re: [PATCH v2 00/15] glibc port to ARC
 processors)
Thread-Index: AQHVzW0xcm0d0tcmaEmrZQM6snb/ZKfvZyQAgB8hOoCAAEvTAIAABGmAgAAJwgA=
Date: Thu, 6 Feb 2020 22:41:44 +0000
Message-ID: <926fb7b3-4f7e-1c27-f800-c385a078e274@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1901300220520.24454@digraph.polyomino.org.uk>
 <980d8411-e4b9-24c0-3340-c112d6d6c349@synopsys.com>
 <c3e18811-b5ed-2194-ba55-6c5f87f46721@synopsys.com>
 <alpine.DEB.2.21.2001172136520.13033@digraph.polyomino.org.uk>
 <8311a699-183e-6811-cf24-3ad85ff80321@synopsys.com>
 <alpine.DEB.2.21.2002062149360.22384@digraph.polyomino.org.uk>
 <CAKmqyKODf8rBqhV708hzMMcdbEZEQrf1T2ABGi-3KLSwWozqNA@mail.gmail.com>
In-Reply-To: <CAKmqyKODf8rBqhV708hzMMcdbEZEQrf1T2ABGi-3KLSwWozqNA@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: a639a660-6b13-43df-8047-08d7ab55be63
x-ms-traffictypediagnostic: BYAPR12MB3127:
x-microsoft-antispam-prvs: <BYAPR12MB3127E28884E8D3A625CB8417B61D0@BYAPR12MB3127.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0305463112
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(346002)(39850400004)(376002)(366004)(199004)(189003)(4326008)(64756008)(2906002)(66446008)(186003)(6486002)(5660300002)(31696002)(31686004)(81166006)(81156014)(478600001)(966005)(2616005)(66556008)(4744005)(76116006)(66476007)(26005)(66946007)(54906003)(53546011)(110136005)(8676002)(86362001)(6512007)(36756003)(8936002)(71200400001)(316002)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3127;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 86aWHpuNh3KwLX6oYzFpC+bsKytvlGogkhaaqVOuwmUHG/Uqh8pJczDV7Z7Fv+VXFAHp3NK/VdK8eJgzN2Ar+PsnA1xF0fLym0JNaEq5v4hIQjg5o1isCPEd4iaLqcoCH1PPd/FiG4we388jFnZsN4e+fxw1klyux4YzInb/MX0ImcKuYF2NXSynhDyx7COs2sY4qwnEGEnfhjFM3sadIXoFfP5l2qQrkB1D8KdteokvzZbe+UWTtXUJ2lsGfDVwELldbzTfPby8Exu/R4+BMQ/6wiVYKC5M91JiGTgEpd/jcwYRkkzsxwhJFLh4uUP7XAzClWnSnJDOWl9OsRSE5vbuYc44uRYbGgWe1UejdeHwNKkFznmgH7qslZh/ttFaVxxWjUedo8SSDodEonOPamDn/S2otBlqHn48SidpPMmn99Dklo3SeRdGDD1+2mVDOt73oRIaAh6eLVVAt/2wN9oG4eAu1kAypBEBKDreLvji6sVev55nRrsnNBz9u8K5j2sZn9Lcy/us7EvblJyroQ==
x-ms-exchange-antispam-messagedata: P60k0UoK0m/YmFN2RYs7LOBK1hdO3TSUPrAL1c7uoGe6Xpvi111h/Xf3qIPl3/fJfA6Qyqvo9iRDLbZqbKK/IL8ZZFZLS3+87AM+cZN4HXFEM6fjTmAHSgfielx9VQlq0Hbnm3ZM3VFJ72UsfQIldA==
x-ms-exchange-transport-forked: True
Content-ID: <8C9D87768AF84047B5AB90ED64D2CBEF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a639a660-6b13-43df-8047-08d7ab55be63
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2020 22:41:45.0326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SulLhRKFzKaT4Ve7FSEX6p14d0gXqwE9L3s1kD394iNospPHs8SauJqkX1WEkR26KZeDVN9awPehkcmk4VcwTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3127
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_144209_730687_D3F4FBE7 
X-CRM114-Status: GOOD (  11.04  )
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

On 2/6/20 2:06 PM, Alistair Francis wrote:
>>
>> I'd suggest posting patches that are on top of the RV32 ones (maybe
>> there's a git tree with RV32 changes to current glibc that could be used),
>> and that only support Linux 5.1 and later (so you don't need anything much
>> of the Y2038 support beyond what's in the RV32 patches).
> 
> Go for it!
> 
> My working branch is here:
> https://github.com/alistair23/glibc/tree/alistair/rv32.next
> 
> My latest RFC branch is here:
> https://github.com/alistair23/glibc/tree/alistair/rv32.rfc6

Thx a bunch Alistair. I'm rebasing my stuff on top of your next branch as it seems
to have more time/y2038 code so will help shake it out as well.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
