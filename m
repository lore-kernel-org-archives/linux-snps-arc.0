Return-Path: <SRS0=p2sK=6B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DDFC2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:50:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC42F214D8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:50:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l9sbqs+J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CnIYlk3D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="oPY3AX69"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC42F214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFrLq7JiJPBFIpnB0btiizWJIY+l/jOPdj4eHMlqcKI=; b=l9sbqs+J0kopnS
	xwXSGM/FiZQfXAYh0wUxFoJyBb18SoZEpIMjCw8UwLwFEW5jiDZM/Bc6LT3agOe7EDfaHhfMcayIR
	otBPgqRbjBbR3ckijpC0lJ4Jwgz9Zjc5h6rbgqSTgO8bXDTVOJcwuA0X1itLp3mXn0OXYeRNcWCrZ
	tx/sZo/pdVxqYR92OJcqSUVztx51hiM7iwotdj+oT0iK4r7F4seOvP0khFEJ+0JTXflajx9abNoJq
	q03XdnTwKz8CtENRYg6ENPV3Gw3l6H7FE7e2zKSvG7ecYLntjVPE17XacxfgeH+znHwateIIAwUDl
	I7qp2TQ51niCR1V5q60Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPakM-00033v-TQ; Fri, 17 Apr 2020 23:50:10 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPakK-0002QR-Bg
 for linux-snps-arc@lists.infradead.org; Fri, 17 Apr 2020 23:50:09 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D2F78403B9;
 Fri, 17 Apr 2020 23:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587167407; bh=/TMa65JhAVEj86FdDmgEGZpEl09qPl1m5XZwkGubivs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=CnIYlk3DBX72GxgXS0uqkcG626YzvMltumJ2o8qUS5NYKqdIbFrBANdaYhrbruWgV
 kccNeZ1fwTbadI/1UBhhunrqJObV/0ceBv2w5IFldYiulayqjoKuCFv9UjCrR8hdvD
 Z1Iab2nVWrK7lGIOSI5RAW0Zo3CFwajqDO7QVM0ApUUBFpjuVOKHyNYwIjjurUAP05
 rB+YRv2LT0addzzCzqIHJ4TZzPgpC/qhVEL/I0NWQk19hZVPAKDXUOAUTMUxrVlNlc
 HIZhvK9KRqkq/3S+0ue+qfDiMh/niwO4LTDZ3uQ3Er2rrex5H2P9GRg3+JgPASB5J1
 5kdCXJtQ8Y2oA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9BC27A0067;
 Fri, 17 Apr 2020 23:50:07 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 17 Apr 2020 16:49:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 17 Apr 2020 16:49:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMpTSqWPhlQlvhRgeRTferQOxQ6uWStZqUGdkxgIlRfKySHO9j6Ll8yRbr1uthn2drSALvSF1PLtn3rkcwRJUdGzlrLF1c3I598wnLp6baBwuITSp+227okZN8y2NIJAmPMbZpZwvNNDfk1/0fWOG5iASSBapx4Wuwdw1QbZnstqF3YpvtGYJWRvJo4Ik8Pk/Zih3ZXKql+yn8kVZhOUYQql6PeyxLEs9wfKvvIbh+3OuqMpA2cqKJ8D4KggN8Z5oSEQBjzflEFOVECfG7Ppmhu6yjP/IMG7YNz9bXyh8zWYdxih0TH5aaeBNC181mewmlwtkbzt7HX36xf8j73FoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TMa65JhAVEj86FdDmgEGZpEl09qPl1m5XZwkGubivs=;
 b=lJEq+8t3b53L/I+rMq9/uV8J4JTGQdo/yQQvBCzUUBXVDxYVGODNKVyQs9DrItWymXkWIrGXDEhJa/WpM5VrBVVdS2Mh4Oy3i7oReY/Yimx4zMFjrYdKEVBaA2EUBH6i4aNFBQgDt7WEWzGcwPgO6ozwxQDPLtimqMs1phseV6RjpI+NHFVIXJ8RQDkMKud5xkVgZAfAMyk5CVg6nY/bMLCIaEHTGmUhOxq84Itx60Km/N60CbOGYZ2t1vvTFvG6TddXRRhrpesOxo8Pq171Bm4JcqJVR52n8R5gnJyOlKmKsOrSe4FQS1RVS58pe/98JCDPB+VFws0MvmxySr3xWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TMa65JhAVEj86FdDmgEGZpEl09qPl1m5XZwkGubivs=;
 b=oPY3AX69GH4NaY0FvEYmpsrxKjBGNi+Y9jGh/FQ5pV41Ng77daE521lqslfEQWu/+kGBIwAa4wwjmCoFhhw5ympS6k+oAP0tzOfcN9zLrk9MiuGynOCSp9lqYG4wlNMrUhYbLEy+dv2cCCENDF16Bn9jRDWCGy8liNENd8XxeP0=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3445.namprd12.prod.outlook.com (2603:10b6:a03:ac::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17; Fri, 17 Apr
 2020 23:49:50 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 23:49:50 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v5 06/14] ARC: hardware floating point support
Thread-Topic: [PATCH v5 06/14] ARC: hardware floating point support
Thread-Index: AQHWDhqPeErNcwwBHkatv0MUyFK6b6h9+5QAgAAN+YA=
Date: Fri, 17 Apr 2020 23:49:50 +0000
Message-ID: <081fa944-9428-b5cc-40a3-d97a96b4cd1c@synopsys.com>
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-7-vgupta@synopsys.com>
 <alpine.DEB.2.21.2004172254500.1082@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2004172254500.1082@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: c282e4df-4374-42d4-e5ca-08d7e32a0506
x-ms-traffictypediagnostic: BYAPR12MB3445:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3445F0C635F40892DF1B2385B6D90@BYAPR12MB3445.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(396003)(376002)(366004)(39860400002)(136003)(6512007)(66476007)(66946007)(81156014)(66446008)(86362001)(54906003)(76116006)(64756008)(31696002)(316002)(5660300002)(110136005)(8676002)(66556008)(478600001)(6486002)(6506007)(8936002)(36756003)(2616005)(186003)(71200400001)(53546011)(31686004)(4326008)(2906002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IoAi9uMXJ3uDmiX2gWy6JjLXe42LZ4wR1GkyKuJdftBIQOjcsCWtgrCM19kUeWtlD0BBCb8uzUkseqXGP6mCzpDZA/H8hpZ8Wa/3HP+CxGw2mIwdUe9QP8TTgqhGS5dshCEPWC2mOaBVHNbxladIdTVIFXvNwXOJNsD5vuOUYTRv0/zH0JNcuQc4dOCAB6BTnPtVhykN16g2lgzp7Z/bHeYpXnPc3tPp6ggz0ySCjjxyYzZLVMAqGUE4Ji3Bx1CJkEXD4+0oxFCeP/zY8q9HbMZJi3Ba0nlwt2iyqibgKDhQZbxxfBvh//8trcQeH3GkHMv5oS4NbXh2TyVDjLb08E8UP7v23nwSlTr12fhGujZiYwkKz9vUO0eXEC3GinLFamKrywMdkMgDhVxdnUamfd+oDFgIP16B1DU9ndbdOd9EYWaXeiHnJ7AE/haShKg+
x-ms-exchange-antispam-messagedata: XPMNyPi24bAsBQnPGt8qzvsY4mDXpGf2N+kVM6YsoFcbs6CjVCLhSzzxFIFwJXpvTwgf9dsJDESM+HFMVvpqxqW/3RohMEpFS+5Q0td1WKfKe1RSyAy/sx6nJGzjYsD/I08zdPbQ5KFGBnDB1swtFgnd+Zzg8X6U7+DxJ6/vyVYq20n0z3CX84Fjnn/9XgqYAuf9rfIm+PckU65Pzbcl1g==
Content-ID: <E992BBDC1069594DA31D7C6ABC44C282@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c282e4df-4374-42d4-e5ca-08d7e32a0506
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 23:49:50.7225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fty+I7reROh9n8je++KGT5lgPMU/qMyZWPY0FPXlcXlBWqhv7vyrwEVZrscZkxWYgKxmUtohlQk/j8u1NsM8Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3445
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_165008_436545_2075BA46 
X-CRM114-Status: GOOD (  14.30  )
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

On 4/17/20 3:59 PM, Joseph Myers wrote:
> On Wed, 8 Apr 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> +#  define _FPU_SETS(cw) __asm__ volatile ("bset %0, %0, 31	\r\n" \
>> +					  "sr   %0, [0x301]	\r\n" \
>> +                                          : : "r" (cw))
> 
> This asm doesn't look safe; it's modifying an input operand.  I think the 
> compiler will assume the register it puts %0 in is unmodified by the asm, 
> because it's listed as an input.

Indeed this is a bug, as wiggling bit 31 was not present in inotial code.
I changed it to "+r"

> As an architecture-specific interface, it's not very clear if the 
> interface for _FPU_SETS should be that it modifies the variable passed as 
> an argument, but I'd guess not.

But does it not depend on whether the value is used after the fact. And with +r we
enable the compiler to DTRT.

>  My suggestion would be to define the 
> macro (using do { ... } while (0)) to copy the argument to a temporary 
> variable, and do the bit-set operation in C code on that temporary 
> variable rather than as part of the asm.

I can certainly do that if you think so.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
