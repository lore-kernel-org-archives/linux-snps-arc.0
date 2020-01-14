Return-Path: <SRS0=v1Oz=3D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFF9C33C9E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 22:14:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9F9624656
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 22:14:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sPjVMBu6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IU7t2Sb2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="f8cScqlM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9F9624656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajX98gKL1ern+qHvLe4+cYAoMJKywIAXfOABpAZ1yIg=; b=sPjVMBu6DD2cf3
	POIlQq3+BSHF+LkoPpiI2uNcEA0pRnDw/UeMU56l1uHHyJgNuqt2K91V5kI/VCGApNvPvI/5LYnwJ
	SB0ux8rwlT8E1zUrttix1syqPC1A1nqVDwv1hbLHXUtprGagDSaAuj7Ie9Ns2hJNaeV53X99EK4CH
	RUg5OPHmWOZR836EUKtSqvgVbgHhEjRA5GMCYb5hv37tIE3QEVL8kX9poizyPZobof88PBw/Z59+P
	WjSIFATe79CLuOEp3tqYX7g1v34YGruZQ2Hv5qGkMx8dtU5400IUstMxjsuqbZlZobRYwa1COli20
	Ty/e2IV0gWR/oxi/aeFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irUSR-0000nz-69; Tue, 14 Jan 2020 22:14:43 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irUSO-0000nE-0s
 for linux-snps-arc@lists.infradead.org; Tue, 14 Jan 2020 22:14:41 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9E100C00BF;
 Tue, 14 Jan 2020 22:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579040079; bh=kbkDR+FjHsooBwpisOHzZVcT4FgZLz9uPYQljdMvgok=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=IU7t2Sb2LGvxqwj7VtIaVv/kchUBZ6eC90zbHic4SFivFs5yxuAdP+WljdTTT3DVo
 +IAgtoMbMm6DcCRuZdD/QsrxzIs0tyNG/JpsBv1f8SiHJcsBs/hKOE674WLe6asnkn
 xigrh/AMswh/ee2Yaa1ClubIw5Z8iDSaahA/mR7YBRQdmcu//KllP7Zp86GfwjzwYm
 C2juUtxBNclXHUsDjcfvVtk3zhqDxn213vv89OKO2OMLWsPm7r2g0lVNinfeM6TCT+
 R0E72pQbD5BT/icvfik5f5JWoCYSrVAkcZ2XIm5qBYFaIzdHHWpzxNK/FXdv0oB5Li
 m9pcIlPHh2yZA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id DF832A008A;
 Tue, 14 Jan 2020 22:14:37 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 14 Jan 2020 14:14:35 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 14 Jan 2020 14:14:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvVsocyMOdQbOlTgTl2ibA2fhWVFJNgDT7OQvezIqfWvUQj3INwfmagukqfGh3TniKSY7O2GFnVqtGA8c4dYcL22inEQJRtk7elJc0Wm6O8Kkn3fa0vFrVz/3lu9PMdbAOzGpiP0EViExBEfcXuhpgEdfzbmvW7rTEgEk9wwQgce2LkrAWof7XyMRapZ9NzGHtyMQxK2zpEl2sZE6rzQMfNHMzd0DBysqJGG9YfzcEj3asV6g4hht9apPB6cEuFJr7lL6bnKLYDymL87MZJfBax1QVGiwbaaRZYmrKwd/zIEma39c2XsXPcuqd2ECmtChLVFsCACAuWzNoS7EHwdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbkDR+FjHsooBwpisOHzZVcT4FgZLz9uPYQljdMvgok=;
 b=Rlp75e4AAiv+DakmXlRKLP7BgIZ09eCPiIJeZ2gxPhpXObdpUGmpNF3uoPjpm8e4cgM/SfGiqjhZP4gTHI+Bl1e0xJB5xwgXae1kJ7RWe1hwtSXjBFrbo2SvlzJixMg4h4diN4DoKX+wgNuhoe16QKB+WlvQ0U67Lw9KQAOLwsE1j0SB0HOBKLMzkwj/xpewUUNVlsTyHZ7jQKUldMbqtKnRg3UI3wTv1w+DLR6FOom7Plpp7v2zSoX8UskfOG/zuAGcMMQcDA7CFx3cOu2junQFaLF6C3g5qm2aaGfBncanrUsJ2u30YsCci2cLASrn/2ADEiJ4OZBPaG3KUDEpxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbkDR+FjHsooBwpisOHzZVcT4FgZLz9uPYQljdMvgok=;
 b=f8cScqlM7hKmPzPJFxGR2X6YlTfgMjPiLAO+EtPInTY8HGrRMD4gZRmx7x532Lg4l9B53lRBncGtPWU18JDUTzSZUVZ06W5VRdfO9OpMAOYaSrl868F0LPQtn0zEtxz2psEel+hN9qKRcaJBzxFCXY7LnZW9AcY410ypTIFi3M8=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3367.namprd12.prod.outlook.com (20.178.53.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Tue, 14 Jan 2020 22:14:31 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 22:14:31 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC 4/4] ARC: uaccess: use optimized generic
 __strnlen_user/__strncpy_from_user
Thread-Topic: [RFC 4/4] ARC: uaccess: use optimized generic
 __strnlen_user/__strncpy_from_user
Thread-Index: AQHVyxaGhnH3EiIrPUWW/UkFermp56fqoAiAgAAPFICAAAOWgIAABxwA
Date: Tue, 14 Jan 2020 22:14:31 +0000
Message-ID: <67715aba-fa40-1f46-288d-391d086328ac@synopsys.com>
References: <20200114200846.29434-1-vgupta@synopsys.com>
 <20200114200846.29434-5-vgupta@synopsys.com>
 <CAK8P3a2GUqmcA_q33=20OrK1+cU4f3mCrgci_bO3ho4B5PRODg@mail.gmail.com>
 <3734021d-1756-3a09-6595-14ca58c64bf9@synopsys.com>
 <CAHk-=wjX-c9YpPhbQ073UPnTvELNQCN49vqK1yY7JGuHSn5-ew@mail.gmail.com>
In-Reply-To: <CAHk-=wjX-c9YpPhbQ073UPnTvELNQCN49vqK1yY7JGuHSn5-ew@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: ac5bc04c-1279-4708-1953-08d7993f2152
x-ms-traffictypediagnostic: BYAPR12MB3367:
x-microsoft-antispam-prvs: <BYAPR12MB3367189505272C1437849906B6340@BYAPR12MB3367.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(366004)(346002)(376002)(39860400002)(189003)(199004)(8936002)(186003)(2906002)(26005)(5660300002)(54906003)(76116006)(66946007)(8676002)(81166006)(81156014)(316002)(478600001)(6506007)(53546011)(71200400001)(66556008)(66446008)(64756008)(66476007)(7416002)(36756003)(4326008)(86362001)(6512007)(6486002)(6916009)(31696002)(2616005)(31686004)(41533002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3367;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CeCJUHPgn2uXPzNUXTrW0/a0Vyq1Hf6pOt5cbmWatgondr1SYU2lsr1SZ2aB/ZVFfpkL9iuFfMPEqR0CrohDvCyBYc6P9ZM00KmmnsUa9RwSiSHDXBCLknq4OQR0Jnrd7dDj1AvwBZk9zWgULfNpWuDUZFFigI7O+9qlRwbNevVUYtEHzSffx0+D/v4McuDgeTbZzifmxR0vkVgVh7GmWwsumoY9G1crRkL8AFTOPY4+KR4j++07V/s263JMwpaX8vh5R6aWeJCH1J7GwgL3lnSPhYCCfbqvIofN3Lc3C6a1vheXfj7KIoPiav2wklP9JjqW1RqRGxP2s8GpCiHfF45QyxVA+22Rs3n+5xsjpFWo+D6eaVgiBTbHvSekOobqRQ1IheURChLb+QKvmNbg6HQBoktdoDnNxKLL25Oq3NLd7SsGX/73zjjgnFwjFaH0wZcjz+Z2bi8GbVkNeCPGfAqmWzMHUiby6QRBvTuOvew=
x-ms-exchange-transport-forked: True
Content-ID: <482E57B4610060459E6825AB481A2823@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5bc04c-1279-4708-1953-08d7993f2152
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 22:14:31.6602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tyDi7hbG8IwIdfseSelsjBVTq9yQFBuPhWPDF9mhp2NU6EOll4FCsoeEs2o3W4IpwE0SARtDy6o9LdXdTVOjDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3367
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_141440_179447_9E69CFFB 
X-CRM114-Status: GOOD (  16.27  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Andrey Konovalov <andreyknvl@google.com>, Aleksa Sarai <cyphar@cyphar.com>,
 Ingo Molnar <mingo@kernel.org>, Khalid Aziz <khalid.aziz@oracle.com>,
 Christian Brauner <christian.brauner@ubuntu.com>, "open
 list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/14/20 1:49 PM, Linus Torvalds wrote:
> On Tue, Jan 14, 2020 at 1:37 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>>
>> On 1/14/20 12:42 PM, Arnd Bergmann wrote:
>>>
>>> What's wrong with the generic version on little-endian? Any
>>> chance you can find a way to make it work as well for you as
>>> this copy?
>>
>> find_zero() by default doesn't use pop count instructions.
> 
> Don't you think the generic find_zero() is likely just as fast as the
> pop count instruction? On 32-bit, I think it's like a shift and a mask
> and a couple of additions.

You are right that in grand scheme things it may be less than noise.

ARC pop count version

# 	bits = (bits - 1) & ~bits;
#  	return bits >> 7;

	sub r0,r6,1
	bic r6,r0,r6
	lsr r0,r6,7

# 	return fls(mask) >> 3;

	fls.f	r0, r0
	add.nz	r0, r0, 1
	asr r5,r0,3

	j_s.d [blink]

Generic version

# 	bits = (bits - 1) & ~bits;
#  	return bits >> 7;

	sub r5,r6,1
	bic r6,r5,r6
	lsr r5,r6,7

#  	unsigned long a = (0x0ff0001+mask) >> 23;
# 	return a & mask;

	add r0,r5,0x0ff0001	<-- this is 8 byte instruction though
	lsr_s r0,r0,23
	and r5,r5,r0

	j_s.d [blink]


But its the usual itch/inclination of arch people to try and use the specific
instruction if available.

> 
> The 64-bit case has a multiply that is likely expensive unless you
> have a good multiplication unit (but what 64-bit architecture
> doesn't?), but the generic 32-bit LE code should already be pretty
> close to optimal, and it might not be worth it to worry about it.
> 
> (The big-endian case is very different, and architectures really can
> do much better. But LE allows for bit tricks using the carry chain)

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
