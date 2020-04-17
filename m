Return-Path: <SRS0=p2sK=6B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B0BC2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:52:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F35214D8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:52:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q+KfFxnF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="h68KuR2e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WVnAtuGZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26F35214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+peRgvIjXSSGvTy4wqAX0fLStZ3t36Y7p6iO6otjZk=; b=Q+KfFxnFmWFtwa
	21TzHISnlHGordrHi6UIM+40uO4WVLbzk/MnkSKMME6IY3LW5sW+zU5Gt0ezirfR2vxqtlKm7rqDW
	3CyScNFiSbi7YfKp6RfchMEgDxGC/52w5gSft7X/iH1ShOwl7FgvuWuyYPCBgU2dVZe8NcHEL6MCh
	XN+MjQm6yjlOsvvYHJTZEKY3ok3e8aXZDU+0KmEnTW6EGNkpbtc12ZyVqyYMTq89QrwCp8bXFW481
	SaQTZhjA0/lcnqx38VMMNp9V4ba6979HyqHXhbJQ5vPCqN7J4l8sAU/MEssbgvBgd/un2gJAzsDo8
	3V6Ri0VfsLz0PhJSlQEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPamJ-0003hP-Sc; Fri, 17 Apr 2020 23:52:11 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPamG-0003gt-RZ
 for linux-snps-arc@lists.infradead.org; Fri, 17 Apr 2020 23:52:10 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6754FC033B;
 Fri, 17 Apr 2020 23:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587167528; bh=HBmYtS9p+YOquu/eYLLcJkcYIFsYKcTezT5EarztLoU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=h68KuR2e3Xg4tWuZiEYVx+8wVsazHyd/4nL/5VX58dZfSJmjnF95iL4HyDl3tF4WN
 zYIHfmF6obBYqPOJvl4P4KdP5qO8OpncnTmzisqh7taZEmdAp0YjNDBWVZG2FMqAD2
 O5ssnbA/ncki/fSq9T6inhx//do5QgYbfa9VPeCmfxPUs/1V2b15A2pcXVGjf5GOju
 u8BL/7s6+w9fSR5G6yxx7oYu3VkmC8JGuSVSvQ+/hr/XvCLG8wRAySgq/zDY5Vkdr3
 Iv+bE9zUdVnrDc9nvURK3bw5HIcnAJnkmxrgJI9vKuGfgatC55SvQRlS3KygqPu5AA
 jg0CBCGAA3Ong==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 14F31A006A;
 Fri, 17 Apr 2020 23:52:08 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 17 Apr 2020 16:52:01 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 17 Apr 2020 16:52:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KI/zgfzMde9BwwTMzNzBZIgkp739ub85FJqq3wWYMwycSAr776hgYim5o5ahO88srGZji0HCDEy96RD1rg57F9yguDn4CT/lKd/daKhlvzK+X8Jmnadepbzjo1pcNoA2GlBmTYtfCW1wKiXZtcI/N2DKdMbygMfFJ4wizQLA/gq0kekQnXs7w6B4GDznJpSQgI359fNnxXsBIirfOJBa+stSF32BWV4NjUo3TmgtXWkQ4PvmlVaby4qqDFv1lMrG7PGXmql9TfQ0yZ7EgIztfSviMh3f1jlr/Rg7PqFdeZtN362UhNVEXaGxND+RflMxO6wm93rMINLxlzxKbGJi7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBmYtS9p+YOquu/eYLLcJkcYIFsYKcTezT5EarztLoU=;
 b=MumYlsrjp0YCTI0Wv4pY4A54T0nA0+w4e32y+Ww2GJQQOJv7NbmsJgFGNonc0dCoy/2J2HCXw3cjnca0Bl5dY96vusFBmpE34ONba6vefagA9vldUB89qaqMedP+lQ5segdbd3bWRmg24jD1P5iQxv3Eh7bVrCPt3gCBaq7tMM05x6/mrZo+4Z+pokVqIxTEreDLBB+2sjxB3q4SW2OKK10S4vYm7deHwJD4nOZ/jsjQvLi0LfI+K45x2u6/KAvyYRO7saGfwuMW1ImEFgO+1D7vZpfT8m84nNn8RcJ6nEC+Vhesc258fANzdtP08s34DbOCUG/cEE3KXMOKoDO1iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBmYtS9p+YOquu/eYLLcJkcYIFsYKcTezT5EarztLoU=;
 b=WVnAtuGZMBfvmipghaXE9LuGt3+YypeGmTv0leZdIQSCt1EkGgvHJ0A9jQu47FrAo3KTPgwF/s6wj8SpaEJtOrpBuaLbLTdCg/KX2aORvwOiHBfNFRllG/9QkwsmCIEsfnjPVn5FD61jJhH2sJtac/JJ4Sj6HGzRKf2Vh1C/xDs=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3367.namprd12.prod.outlook.com (2603:10b6:a03:d7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Fri, 17 Apr
 2020 23:52:00 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 23:52:00 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v5 08/14] ARC: Linux ABI
Thread-Topic: [PATCH v5 08/14] ARC: Linux ABI
Thread-Index: AQHWDhqPbjjNXaIRdEiFTFv3bDDXZqh9/DKAgAAN9oA=
Date: Fri, 17 Apr 2020 23:52:00 +0000
Message-ID: <70206ab0-003e-afeb-5141-126920a3b6b9@synopsys.com>
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-9-vgupta@synopsys.com>
 <alpine.DEB.2.21.2004172301140.1082@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2004172301140.1082@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:c8eb:6ba1:57d7:7e16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b16aa050-d024-4423-7d7e-08d7e32a5236
x-ms-traffictypediagnostic: BYAPR12MB3367:
x-microsoft-antispam-prvs: <BYAPR12MB336781F74252EBBE973669F1B6D90@BYAPR12MB3367.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(136003)(366004)(376002)(396003)(39860400002)(36756003)(6486002)(316002)(5660300002)(71200400001)(186003)(6512007)(31686004)(478600001)(54906003)(4326008)(86362001)(6916009)(76116006)(64756008)(53546011)(66446008)(6506007)(81156014)(8676002)(66946007)(66476007)(558084003)(8936002)(2616005)(66556008)(31696002)(2906002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RN9YRZfOH5/CneNZ4bzoYMiKJWQVkhLIn5y+f+EzARfpNt0/hLigysx2xCi0QKTv5GcT4RAl04QcX7zi5FOLlXg6VHyrSUFGPtQSqFv9+EcgM49VYGWE+v00XCA9FqAskERqes4QJI86lgF7YgcbbBS13odDPlD+AVf67FWXu5pMjBZ0X1xVjn55eDEpvaBcagxsimChDw1flmoUTenErN7FdTrdAweuKrM9Z/nvM3CzLGTL5xjUVPv3jkWhtpD3iSQI6PRZohkDERKX00xYUotxytZCOfrInVJ4ybgNSEhvs/e3QTZCAhN/W/KZP+/bUPLQm17VcAekJxOZzEcXwC0bhHKWc6bRWa2FhPjw7TtBqBPPMoo2KsmV4egij/Fzkjws2bRByD8ZOTGNq4tzaSAi1SzPmtz7SbtxBwS6BiVpKJbdwzdbgggOeblCdaqA
x-ms-exchange-antispam-messagedata: sJmB0ffTjOd2zhF0WpMt7WfP9VYP5fjC2fl/uGbPw/W425kgLD4geryetRKGoB5yvkxG/lwR/UWdA36TsXWGxNlqJBP0KtIgonmVUT8bwiGK0zBK34fvUMiRp2RDZbHJSPlNs0DcPSUP5gNpEgPugc+2FQfoeyAViXkZOfTMJ3Kwmx8aJkbpr4wr4fGHuZFkdU62BhQfWF2ZHNqIt4BwAg==
x-ms-exchange-transport-forked: True
Content-ID: <DEBA46FB5F2C964BB0F1A418B500F6B1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b16aa050-d024-4423-7d7e-08d7e32a5236
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 23:52:00.2079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kcB86HqPyR28E3OGP9zjoTntC4E89K0fvFtEA6iR5DDp8TxA+OyrMO10v9JKg68q/FKi1wAysK0SCGHdJDkRsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3367
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_165208_953224_E97E377B 
X-CRM114-Status: UNSURE (   9.76  )
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

On 4/17/20 4:02 PM, Joseph Myers wrote:
> On Wed, 8 Apr 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> +      for (i = 0; i < stack_args; i++)
>> +        *r++ = va_arg(vl, unsigned long int);
> 
> Missing space before '(' in call to va_arg.
> 

Fixed.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
