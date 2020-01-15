Return-Path: <SRS0=FGIk=3E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FC0C32771
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 23:00:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61FC02081E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 23:00:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fe5lOXJe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ViqzQsxJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="Ufia/eH8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61FC02081E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9lvy9HGEPW492m2sqx7uSzLxAyD62WHkFkud4nr2wyg=; b=fe5lOXJe6vLv6f
	gm2LlSwO4bsQRE9HaLBI9mpv9kZTItfOGrJ0rQA/P3F0W4K4PGINEVPojbF5KLYPOKKjJ5Re0IuMM
	+hsQMfmUsNWvNzJ8ITtYuboVmguTkounEg+Il1N6Sx7T1cpLknWUFSur9V4PzFMqbOUc+J0yY/dzb
	ixLeiksPF9+x+DOnXF2RzHh/KseGFP4Roq4KM+IdqhVQwMmIoYtARNaM1JNgHaHjs7qJZTW25cW3Q
	u8/S0oDrq41Xcmh6JVXaZ5XIPiG0bR5+uiwc9DRzcXXlw2zf8P0kSkt4cMuVtwZZdI7zhAJtjzwPP
	8xOMAzx7S/07NW0jAqYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irreG-0000pb-Hy; Wed, 15 Jan 2020 23:00:28 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irreA-0000ns-MU
 for linux-snps-arc@lists.infradead.org; Wed, 15 Jan 2020 23:00:27 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3594FC0525;
 Wed, 15 Jan 2020 23:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579129221; bh=aL7a/z4s4wNZJY9xrtcBxVa3c2vUOJNtlLUj6Zn/GPM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ViqzQsxJtpnhRPWAfu37ZiruRL540n+S1+dulActVbnve/mHkxX0CoeXUv94+wyqK
 HC90aJO2LUWmDPBqt/LTxI3KzSI7icoNBQwIqqM4kR/XGI4uWcrdhIRaWyHQfuE4wO
 bayu6czbIBAbjvazTyT1Cy/RB78+upU/Amth0VuGl8049nF/m7TSxuWz652HsqAJBN
 pX4PJGsTJwESCV2vW/DMiGvyPsdD0507Kq5Dv3ei/O9kxtJXkvSi5s0tiHEP+O39Rs
 lmaXepUXDBJLNTL5V5Xu0I4TXKV6HCEGC9/Y/ykq4iWwu/euVhFd2YUl2uJ5T6F4CT
 /S2kyrUmq1nmQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 39C21A0067;
 Wed, 15 Jan 2020 23:00:20 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 15 Jan 2020 15:00:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 15 Jan 2020 15:00:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dACTkH+302gyKBoClJ7gf4gRJ5P312Ieuh5NEGCF19aEXEHpUguzrii2B+Q+kXU5RSiE0qzNDhEphhCPeebTqLQMEzqA3OL07OjZVdDz1QqBCpe9TVyfCCwrKkMU2pMW3DjtWlSGIeeBJ0aBn3l8bZuhSrhlYy/GRmskTmbyBcT8UFBkzpJkTIpn8y883Q+2kUYIgUyeUBOo3iHfmUiHkA4EhtW6vdyzekA8s2Oh3wzLS0mfmKnlbZvcAMwG6QSGlYNp4hcyC7ZukLD6i1ZwS057EHWCqli4akAUoQvnR22aME+25fcdW120y9608a9Q0kV8lOz6ke3XYWIoUUdAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aL7a/z4s4wNZJY9xrtcBxVa3c2vUOJNtlLUj6Zn/GPM=;
 b=DXXM5nT0q/J+hnEUH5Oku9oomCSvoXkxoPcuelFUss04T+Tlp3ewaZJ/1wM4Rs0CFvdybQRZaGfDIYRKX8qgJCdeG/XjhGTDOjjVOgz4YuqoeaOopuqtE5YtVNSSHDu28p7kYowzzOveRexOuFGOOv1jKYCZUZFPm5tCnO2STfe28LLerRvniN8wlfxmoJ3uj0KDB1DsBtfHSWrYpJ3uBu4xbswNbStA4uE/cJ/MHQIKj7zxrCL5zuC6L+s1uTtGaJ8iniKWQHHiAfWjLtmfXaGrcRfbdMTBrJTaKywSeYiWTpM2TiSCXY7stS8vykVGFpEWp05Ar8nfd4yTZXkg/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aL7a/z4s4wNZJY9xrtcBxVa3c2vUOJNtlLUj6Zn/GPM=;
 b=Ufia/eH8fWJhbdVLVSD+Ahb0HZM8NiaOV2NPDCkAmdUmOclCbRbfNpbWQrLqC+zgQEJ1JGMSzzMOJ/0bgO9ggopbHnUGVZdLMtuRqNnJaEBfHU54QCEujG9FtJpc/gMCiVPLZjnH967SH5LLHujeFaBLLBI2OEMdUXNSGTuuxJQ=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB2646.namprd12.prod.outlook.com (20.177.124.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Wed, 15 Jan 2020 23:00:18 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2623.017; Wed, 15 Jan 2020
 23:00:18 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [RFC 2/4] lib/strncpy_from_user: Remove redundant user space
 pointer range check
Thread-Topic: [RFC 2/4] lib/strncpy_from_user: Remove redundant user space
 pointer range check
Thread-Index: AQHVyxaGa9XIQ1INcUi806p/qvo5ZafrzegAgACLBoA=
Date: Wed, 15 Jan 2020 23:00:17 +0000
Message-ID: <ff24ea2b-e232-36a2-4e11-c89400feff45@synopsys.com>
References: <20200114200846.29434-1-vgupta@synopsys.com>
 <20200114200846.29434-3-vgupta@synopsys.com>
 <CAAeHK+zxVw6jOu-NzjR14U_i5cpDynE=OC3D5WswTvqT8o5NhQ@mail.gmail.com>
In-Reply-To: <CAAeHK+zxVw6jOu-NzjR14U_i5cpDynE=OC3D5WswTvqT8o5NhQ@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: e116f8c8-82e1-4976-d91a-08d79a0eb0b4
x-ms-traffictypediagnostic: BYAPR12MB2646:
x-microsoft-antispam-prvs: <BYAPR12MB26464456C0A2BBE1CB1CA7D4B6370@BYAPR12MB2646.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(346002)(376002)(366004)(39860400002)(189003)(199004)(86362001)(71200400001)(186003)(53546011)(5660300002)(6512007)(316002)(6506007)(4326008)(478600001)(26005)(6486002)(6916009)(36756003)(54906003)(966005)(31686004)(7416002)(8676002)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(2906002)(81166006)(4744005)(81156014)(2616005)(31696002)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2646;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MSTnxnxFc9lH0t0c/5Gc0XoiccobuzPWQOolU2B6A0GiJEuUzAH+kig2zo6UfVXq817wbPD7xeQSe+bCKXDh93altTP2LO92tMFVBpqq1UIwkW72lNaKTK3IAEwZVclPaT7oCIMRIU//4DwRjhqpuqVsRO2oMAS2WnC/XDOLZrsF5BqH+BChEyFfbPv/s1jZZA0c+3XvJUFmG/7eKz+yR7q1IZg27ZsDE79EFZM5ryHeozNcsiPHZXUMbSEfcXHWKaOayd5Fm7T6U5xiYRMwcl+/k/kb01jjcbVpDF3jUglakQ+Rj8gqXFZG/A0Uzwmq6ZayIJ7STVlZmL+uyltb5KHSml1gCWZJ7L7yeJNLoK7i5Uq3IGeAVE01JUhcs2cR1itXmTCo/+q2F50AyqbHZBbC1G99VO5/JXfc0wIHdc9M8G+62v3eReRrhAm1TpiXJRHI7nwPZynH2AJkk5/j607Ykf4SjFRxDzOWhIxGieraYzFc/zgUMGKpLAEN2viXk6nFm18PsY3oHFfCZglNSQ==
x-ms-exchange-transport-forked: True
Content-ID: <3D60597E658C594BBC4C84C7030A0485@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e116f8c8-82e1-4976-d91a-08d79a0eb0b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 23:00:17.9317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EmTEpNjYJh8NYdu1oKNFR/rNiO1EGKOtVPlpy7XNx1quAI6TvSzeOVUyDJTs9MK7aTm2GbAz5i1tJ0hnGIgE3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2646
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_150022_850607_693295A7 
X-CRM114-Status: GOOD (  11.67  )
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
 Arnd Bergmann <arnd@arndb.de>, Khalid Aziz <khalid.aziz@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Aleksa Sarai <cyphar@cyphar.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/15/20 6:42 AM, Andrey Konovalov wrote:
>> -       max_addr = user_addr_max();
>> -       src_addr = (unsigned long)untagged_addr(src);
>
> If you end up changing this code, you need to keep the untagged_addr()
> logic, otherwise this breaks arm64 tagged address ABI [1].

It is moot point now, but fwiw untagged_addr() would not have been needed anymore
as it was only needed to compute the pointer difference which my patch got rid of.

> 
> [1] https://www.kernel.org/doc/html/latest/arm64/tagged-address-abi.html
> 
>> -       if (likely(src_addr < max_addr)) {
>> -               unsigned long max = max_addr - src_addr;
>> +       kasan_check_write(dst, count);
>> +       check_object_size(dst, count, false);
>> +       if (user_access_begin(src, count)) {

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
