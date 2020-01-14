Return-Path: <SRS0=v1Oz=3D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1A6C33C9E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 21:37:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D9852187F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 21:37:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JrHgHKQu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TVpnjz1B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="SkQ5Lx71"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D9852187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7mDU4ya65NEFzL0OewVfZcJzsis1+Srac+hzSABP6w=; b=JrHgHKQuQle/gN
	Jz7atQv7YiT7K+RweBvmQp5CBklUHLhg0TA6qkqJUghdoC111DnfWtF5hcnMDmEPAdLwx5fwa9GUY
	o4ES18p45hUuN8zO5taEH9gMrU09WE/DGJXXzsB+Si276r+vLPU5Uh2uPSmCtH9boS1vSio/cZGto
	R2GwT1mQhKQ5A1w1kpVrX5jQi5kqj1hlvckALNFJcfcZYu+JiClwCz/HnrFZurDEsFh+KcHCTMJvg
	f5XSaW4chst6V0+OdqYAAwIvKkQo3tTw3mLl4kzXHaBWR9ya64APa3CQ5p3m1yBtVfNS4RGSMxdv1
	Kmg35NP8e4TDhERk7Dbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irTs7-00005y-Db; Tue, 14 Jan 2020 21:37:11 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irTs4-00005J-ST
 for linux-snps-arc@lists.infradead.org; Tue, 14 Jan 2020 21:37:10 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 25C85C00B0;
 Tue, 14 Jan 2020 21:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579037827; bh=IGoaseOLOTBBKU71cinrmDHmBLJIVMsgQKrQ4bcmKpY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=TVpnjz1Bjb27L7xLAwjRdLSCxwovOQe04GcniVIBP+2YLvvhUn5rbBfcPzzqJvJ0y
 Cpo/jToeFpiDX8fceIhug5H3jPMGU1/odaZFeH2hFvqYdGzixcP37XA2nBTU9wcFZx
 LxfygJDokzB57O+7a1jcGhXKCioAmesuF9w75J+tZXQvLVPRgl0dAQTz5Z7xqBSOU4
 FuWFPL/iZjufYb4rZaG4aZHcyuiIR1Tmar8//6LjKnpOeYi7E6ZniSSn6E0lPDakJm
 iDZtKJCfhX1WwrJO8URvuJpZzfnmJY/KxdvYIR+V6WJu/stGmaA1jWGzXbdLpoE584
 GV/0vfBNu4zqA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A8082A0079;
 Tue, 14 Jan 2020 21:36:47 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 14 Jan 2020 13:36:16 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 14 Jan 2020 13:36:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0NakyKvXOomcyI1r0fP0U5VG1A2KRpa78fABrJz2aGDnPKLIBC5/t7BfjI/If8WWkgVPLmCzJupvE28BUg1Ju6PEGX5y9fepHCeC72RFtIvSelG7oUbbcB8pRQhblLdClgZE+AhpqIRgWp1yXFwQruKn4Z98BeacP7wCASctEE4kXN8qajkToWkmjk1gUIv92LojC/pdj8Axl6HYhTfA1FC2KCpBSA0HoiNVRnTNuwC+gz8Ym+2aTWbwgf8mIP27Y/IeIEsFqJJ2/qg5B5bJpKzKUQCQvbvA7NwU3wmB4zqiMu5L3SKe1M/fGZFFQeo6Le0pQtR/I3jpXAyaw9unw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGoaseOLOTBBKU71cinrmDHmBLJIVMsgQKrQ4bcmKpY=;
 b=ZgDqJaza5CkjHfeaMbi+rPAlCYX7rHHa625q1IZ0Ho8+D7r0SU8cINX3b5A1C1ugvkwZK8qO/prcESU4egYgq8RGQWvYXKjl1coHAmPnA/ZXBRAc6c2hlRQM9Pc6cADZT8JEov4DeN28R7Jfv2B1UHwMtY4b2wu2Lti4EiQTGf0t8A6rVnOE2JTHy31iPXtR294Yx2h6z43b8e+PiXc4sePuFizj5TFAyXqFPGLTAdTXPz7n6d9+X0BMuvDkYIgvXk3gFGoCJHW5cbYcOihwvabGiv1w91wKxD3cBotdjs7Syiu1zv2z2awn1nNDbBfG/ai3XFpSJNu/v99/NUIr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGoaseOLOTBBKU71cinrmDHmBLJIVMsgQKrQ4bcmKpY=;
 b=SkQ5Lx710qH3QpmvNVEt4wc6gUFvlGGv//BUmBVNkfeDRR6SjZKisxa82uZ3q6JIf++/V6k4ir3t5pBFimelgy6rXqNQVgdDKxg+qdWpHDLjCK+zXwSrdLYa6zUoROlzIShte+GyWnpw45mKz87tV0bHq9g5fEYgVLX0DSCGfxI=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3430.namprd12.prod.outlook.com (20.178.196.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.11; Tue, 14 Jan 2020 21:36:15 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 21:36:15 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 4/4] ARC: uaccess: use optimized generic
 __strnlen_user/__strncpy_from_user
Thread-Topic: [RFC 4/4] ARC: uaccess: use optimized generic
 __strnlen_user/__strncpy_from_user
Thread-Index: AQHVyxaGhnH3EiIrPUWW/UkFermp56fqoAiAgAAPFIA=
Date: Tue, 14 Jan 2020 21:36:15 +0000
Message-ID: <3734021d-1756-3a09-6595-14ca58c64bf9@synopsys.com>
References: <20200114200846.29434-1-vgupta@synopsys.com>
 <20200114200846.29434-5-vgupta@synopsys.com>
 <CAK8P3a2GUqmcA_q33=20OrK1+cU4f3mCrgci_bO3ho4B5PRODg@mail.gmail.com>
In-Reply-To: <CAK8P3a2GUqmcA_q33=20OrK1+cU4f3mCrgci_bO3ho4B5PRODg@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 3419362c-b51a-4387-4f40-08d79939c866
x-ms-traffictypediagnostic: BYAPR12MB3430:
x-microsoft-antispam-prvs: <BYAPR12MB3430CF0F3406F0D49271B0EAB6340@BYAPR12MB3430.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(396003)(366004)(39860400002)(376002)(199004)(189003)(8676002)(66476007)(6486002)(7416002)(2616005)(71200400001)(66946007)(76116006)(54906003)(5660300002)(31696002)(66556008)(81156014)(81166006)(6512007)(8936002)(186003)(26005)(36756003)(2906002)(316002)(4326008)(64756008)(86362001)(478600001)(66446008)(31686004)(6506007)(53546011)(6916009)(41533002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3430;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LW3UdTWTvpqCLl0N1wxyBABjXzu9YFCveJM6ewNBb4BBc2aG8HEiy72thzsPL9chl69rVhl6KjrFQpwBvzQuTVuR6afgH2IqSuLz6pPeHnsF4bzdA92UhorXfkK8QIrE6eGje3IDJCMBhls//csxaHF15EcB5PMuYsyJTKra80mbNOLHS5I8Kyf9huY1aZQ5AkwH4FssREWbDZSQOWNi1JxBvRC0T+2ItrOaBO980FtNqNTfr7BgmdWhjVnEav2xiCRHAdH7ICCGZ97UOWEI3ylRiC7E73dwZyaMkfqyBAVKXUTGwpej1tQvfPQpx5IsWh9FxhwJ6+BHD4D7I9PHoav8AwX9vZG9ooZaB5mqEKi4AhtK00rKiGohfwHmgn5LeRammi9047JFSCBz/3GSscD95qKBMQYknLS5Iyb/lFEaIaBPH8ClEbURqR6vmGl+1EoeEfymkmnjrMb8CPxyxC91rP/dHCmoI4wM7e+b6EjhaSSJ7GGdng4X7tR4cU5J
x-ms-exchange-transport-forked: True
Content-ID: <3F5200B14FC6254BA227563B1C09096A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3419362c-b51a-4387-4f40-08d79939c866
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 21:36:15.0298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HRzidHlpCTjetmq7iX4h0uw9eJ6RP1gGYeJSrUFVw2u/+Lwm4+B7RIlrk5m0WwiW28T/iGtvehJvYQzOhji5BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3430
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_133709_096317_BCF3E29F 
X-CRM114-Status: GOOD (  15.67  )
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
 Peter
 Zijlstra <peterz@infradead.org>, Andrey Konovalov <andreyknvl@google.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Ingo
 Molnar <mingo@kernel.org>, Khalid Aziz <khalid.aziz@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/14/20 12:42 PM, Arnd Bergmann wrote:
> On Tue, Jan 14, 2020 at 9:08 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> 
>> diff --git a/arch/arc/include/asm/word-at-a-time.h b/arch/arc/include/asm/word-at-a-time.h
>> new file mode 100644
>> index 000000000000..00e92be70987
>> --- /dev/null
>> +++ b/arch/arc/include/asm/word-at-a-time.h
>> @@ -0,0 +1,49 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2020 Synopsys Inc.
>> + */
>> +#ifndef __ASM_ARC_WORD_AT_A_TIME_H
>> +#define __ASM_ARC_WORD_AT_A_TIME_H
>> +
>> +#ifdef __LITTLE_ENDIAN__
>> +
>> +#include <linux/kernel.h>
>> +
>> +struct word_at_a_time {
>> +       const unsigned long one_bits, high_bits;
>> +};
> 
> What's wrong with the generic version on little-endian? Any
> chance you can find a way to make it work as well for you as
> this copy?

find_zero() by default doesn't use pop count instructions. I didn't like the copy
either but wasn't sure of the best way to make this 4 API interface reusable. Are
you suggesting we allow partial over-ride starting with #ifndef find_zero ?

>> +static inline unsigned long find_zero(unsigned long mask)
>> +{
>> +#ifdef CONFIG_64BIT
>> +       return fls64(mask) >> 3;
>> +#else
>> +       return fls(mask) >> 3;
>> +#endif
> 
> The CONFIG_64BIT check not be needed, unless you are adding
> support for 64-bit ARC really soon.

:-) Indeed that was the premise !

Thx for the quick review.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
