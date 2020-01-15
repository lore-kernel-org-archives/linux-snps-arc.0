Return-Path: <SRS0=FGIk=3E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05406C32771
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 23:02:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDEEB2075B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 23:02:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ptlmHGAH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="V/mx/1aE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="YR5Mtm4w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDEEB2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RUYdPxieVF9DIbRqWaBVW5TWxTz2EY+T2zSGvECD7is=; b=ptlmHGAHFTyscd
	dUVp+NgJ5rQwjPsgPfcOWYMyscSwG4Y9X1u67RL2XlIL6H6H5Vx2x3VFiYKWpEl2bpolBUO8Wb+sg
	mpySqGT4aojCL4PFcHZake+Bczn5JsRTU32IoV5uOvJid2bAC+3lfmqj6bpin5O/4g62A6Qc+cJzb
	RAeVcn88hnDARpHcyZEhoW464nFAGyHb1C49+2O11nPhBNnOQ0F+ndHj6uPPvy/F7+IhJKjYpPoz+
	LL564kRRlGId+yhJUW2i06MevyK8fhua2CY4eg7RU6VTILK8ch9IITlbQpNAj7q3KGgxIqF6wyWZX
	rTHjbIuoSij8+oU08mbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irrfx-0001C7-0A; Wed, 15 Jan 2020 23:02:13 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irrfr-0001B4-FN
 for linux-snps-arc@lists.infradead.org; Wed, 15 Jan 2020 23:02:12 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EB8C4C0525;
 Wed, 15 Jan 2020 23:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579129327; bh=5N0aWvdhJXHQK2AbtZqnhO0gdG+ZUH0HvJ8mAiJFJtI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=V/mx/1aEfZCmGOTh2331ASabO6VfNR7DTlfxYE1RKqlDCF9GPYGeBW0hOH07B8m7i
 zDth8PMgaf7v/xnCK6pSwvSLzQt6iDePX+Lv15zCh2Y+RrC0lvlVsEeTraCtRnwHLc
 FUwGCsJ1e5FzamqrmxgivctCljWHYC2Xm/Fcvd5vlFE8WwfV3celojwAABFiOPM06j
 Gad31+bsoxMdVWzga32gvOdK0QjthI3etqf18OCGxqErP2FtPPKyhdAnnVuHisahl+
 AeUxF7Ap870G/p1nn9MMCsuBKDSkKMKMuj8KG5a9xp6L7vdVXNGIXQqOWKudYaYDT0
 4JadMwBA7sflA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id F0063A0079;
 Wed, 15 Jan 2020 23:02:04 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 15 Jan 2020 15:01:50 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 15 Jan 2020 15:01:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPftBxwph2nlyexCyj7MsZWPfv422SnU4ZbIoNHBaQKyshYW8m4incUd5/LKVpxcQuTZEs4hZ01N93E/uCYgey9yjS4ToLRMnfsgH4vB4PG94WhoZ7Rj/HxrmJJo3HNR17soeBSDzzRWsLx587v857+iIDj3PtJ4sp6x9mz/tCYXfo+wfh4cWUsSY3xGH2nbMjvV0vK/6dR1MLIXWItT8u9PGpceEJsqLiZ19fTJeW0KoiU4nt+Mul4C1zeWnfo6GFsgQ81lUmWaz7ZxPhuzg8McgPRWSZgPLcvG93j1OvB0vZDmhwZjNloz1eFiAEaklEM1WB1NVJJ36NWf+YkaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5N0aWvdhJXHQK2AbtZqnhO0gdG+ZUH0HvJ8mAiJFJtI=;
 b=EeqIqxComnDXD4lAVJG5BqYuZBjUeiL9eFyd5DIEMlUIh4s9NcIBmsa5KYHh//9ZsXLq73x81ahDgZ/hxBG0JI8sgX6GQjIG5w4J2ryce2na0ZZPxhCr0SPxryXu1sLLafZnC10ITpDD3TKjmHHQMsBvJ1bJOSWa8dkuRQzG8f9IVHUUhsAJGz2ojchsNlx/BcyRQYZdEuLaSse8UGpi/G1zMqsFUosJKeP9qyakffOAXerZKuGFl2VdUa2cUqQBnrNN/V5g0Ug8U3tJVF7CNNBsF2kjiVW8ut4zm/m9lHI8wCVxS//LelZjG/DfGBgjruonXKdeIWUmnyQST5bQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5N0aWvdhJXHQK2AbtZqnhO0gdG+ZUH0HvJ8mAiJFJtI=;
 b=YR5Mtm4wMt20wUeDkivJPElXYp7YO3c+MUzZlto7N5eaA0SK6Qi7n69akHeNd3SqHHCmiKOEuTjpfT1c9j094utXkeyslx90Gqum+PkhTbPLmw6+hm+Cgvd/Wv5+dBatvOS/2/a71zW7fT9Ti+E8Hg4/c5zm6RRQpuGwTRh7Iz8=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3445.namprd12.prod.outlook.com (20.178.196.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Wed, 15 Jan 2020 23:01:48 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2623.017; Wed, 15 Jan 2020
 23:01:48 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [RFC 1/4] asm-generic/uaccess: don't define inline functions if
 noinline lib/* in use
Thread-Topic: [RFC 1/4] asm-generic/uaccess: don't define inline functions if
 noinline lib/* in use
Thread-Index: AQHVyxaHbM7a7l3XuUaNwAYN+sKBiqfqpFkAgAG1AIA=
Date: Wed, 15 Jan 2020 23:01:48 +0000
Message-ID: <6eb7587b-c3bc-691d-9d27-d4e687114a42@synopsys.com>
References: <20200114200846.29434-1-vgupta@synopsys.com>
 <20200114200846.29434-2-vgupta@synopsys.com>
 <CAK8P3a3W0eLK+qypnPwq=PdcF7+ey8OZEhmOoA6Bg7hMGm5hqQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3W0eLK+qypnPwq=PdcF7+ey8OZEhmOoA6Bg7hMGm5hqQ@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 13f1effe-33a7-410b-06de-08d79a0ee684
x-ms-traffictypediagnostic: BYAPR12MB3445:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB344528246EFADD457721148CB6370@BYAPR12MB3445.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(346002)(39860400002)(366004)(376002)(199004)(189003)(66556008)(36756003)(8936002)(2616005)(81166006)(66946007)(4326008)(64756008)(66446008)(66476007)(31696002)(76116006)(6506007)(8676002)(31686004)(7416002)(110136005)(316002)(81156014)(71200400001)(6512007)(86362001)(2906002)(6486002)(186003)(53546011)(5660300002)(478600001)(54906003)(26005)(41533002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3445;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fWlkuu5doewNfrbSIdE3skwK8DePMZ0OiWlkPXuHdOUpnQ2QgErcuxY3jeCEQzMtUW3yeE6nKhAunzLbK4BiXtJhK+CHuMeV81af6BBdekrqrSxVw/Lq4X4BEZAsT69ZGKkC+qlIx+I3e4lGvd08td1cGFx/NAxj4OFP5L7NXFy2Q9QeLG8RKF40anuNfq7EzwutiytL4fZm9IpLc9Na9h12bKMv9t17dhGmSvy28FZtVJt6uSadJjBvzbKrC9m0mFm6Gysebt/YFX1lM/Pcdtd17TY7LXtFl1aSuAKIRgXoRvnIxaNlLUREh+guXpgeoM6ey4mvwDxiUN02FPuRSTW0bSAMiCxUJJSBjisORIBuC2Xl/CljrwbCte9IDswXjdjT/Bx+xj2CGa9Xzp58KBZ122+lSkTMTzc9i3vt7PAill/G5iwGN+h4+YbnJ7isoJoCNkhOBtav+ajh6snRyhB2TDpFjV+T+bKLEB2Ft/s=
Content-ID: <B676B95FC3FC714FA1FB6336730C5498@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f1effe-33a7-410b-06de-08d79a0ee684
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 23:01:48.1957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OFJXx6/LxoaXZHq/MShv4RY0q05dOgIbP/GWnQbkwXPQWNHVBYy2xhkbWblp97m3jIUU6QtzdyUhEDHWsO6QbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3445
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_150207_622095_607AB376 
X-CRM114-Status: GOOD (  16.59  )
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

On 1/14/20 12:57 PM, Arnd Bergmann wrote:
> On Tue, Jan 14, 2020 at 9:08 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>> There are 2 generic varaints of strncpy_from_user() / strnlen_user()
>>  (1). inline version in asm-generic/uaccess.h
>>  (2). optimized word-at-a-time version in lib/*
>>
>> This patch disables #1 if #2 selected. This allows arches to continue
>> reusing asm-generic/uaccess.h for rest of code
>>
>> This came up when switching ARC to generic word-at-a-time interface
>>
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> This looks like a useful change, but I think we can do even better: It
> seems that
> there are no  callers of __strnlen_user or __strncpy_from_user  in the
> kernel today, so these should not be defined either when the Kconfig symbols
> are set. Also, I would suggest moving the 'extern' declaration for the two
> functions into the #else branch of the conditional so it does not need to be
> duplicated.

Given where things seem to be heading, do u still want an updated patch for this
or do u plan to ditch the inline version in short term anyways.

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
