Return-Path: <SRS0=aZIh=55=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5570C2BA2B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Apr 2020 21:12:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FBAB206DA
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Apr 2020 21:12:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CdOSeTci";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aLphxtL5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jTQnTDZO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FBAB206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+odSOyBNITYsWsQ3Wmm2cbin37UUYOifixPG0KLZ3Ac=; b=CdOSeTciNn3VXt
	xAZwH/59irexXjp1+K4vcWCby94VCxCpdTRPVYTyZtmKhEWvkmsteK7fXnx9gdKTBzn3+T/BbdUHf
	H+EYEF3oZtg966uKpMZ+vvBKWcn+24kHmtEU3juwGN65Rop0POeRssxw/3IFavIKFC4xxsLkYVNeG
	coKEZEsn7XZTT7c5ThMrZU9mqgbpWfwjQbX0h0n+2MBo8MMfzYysle4JXDDQlpiW/rkuLXfHY3TwA
	cWqVjNNjKzdgQSPGBNl4j1rv8HaEPE5BEwOKifsspvSOJwbp3mnDMg46NZRdg4QiusxziWtCCBZq0
	fuQEmmo5jgRn89H/xYdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jO6No-00078k-UN; Mon, 13 Apr 2020 21:12:44 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jO6Nm-00078I-B6
 for linux-snps-arc@lists.infradead.org; Mon, 13 Apr 2020 21:12:43 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 36A904006E;
 Mon, 13 Apr 2020 21:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586812362; bh=pN6o4eidmOSfuwpFcPj7r23yFKVFx/DJiW2aj2C163M=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=aLphxtL546t8/ROnb86rBA9BENTTL0aI6fYZzlJl3J5xEk21imBBuOa8bc2TgIQga
 ZrfW/Iwdfx4gh38rVhkw62bKP9eMN4LTKLPGYeRskdPdduRm1HYFUpdSmAbh3ieG72
 58pa36h0VAgh+0Xm1ctk54I+R8uRMnd1dMaMdyNHIvPg/itdO20+5RXxvFK/u30cDn
 meXrqNOYwwyj3GSzyoORYdQfZZEOrBe7YqrQRR258Ve/yWjTcWTyD7X21bUhBwg+3I
 PEUAXLp9mFsF6TLNsPOqLlugMKVHAEx6E14UDRUn8m9jEZUgX6ui9kBpLMPn6l95yN
 YkwDaQJ4Qh/WQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 21A58A0069;
 Mon, 13 Apr 2020 21:12:42 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 13 Apr 2020 14:12:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 13 Apr 2020 14:12:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBF80YPSd0WtngspOprgnsCm4CgNYsW6+hf2CzRcp2GC2/poY4V9Wpt+tI/a92Sx+zO8GFdaFjUHFItZezpqOqJ16WkyaKcFo95XzWSk2rdGjPtDcMzK4hrtfRs1DahmjDxotP7QDGzVH9gK7HC3Yiw9IbdwbWobrxI5Pl4T/abqGWOp3BLv3qpYAXTxHNBYDN5SGFwLRnvID3Q806LMtudzwgQEvBWD6edx/+qSZqCVlSPBz9CosYYAI36u6Wl8JaPiKBPmKwJjdqgKKdeOjgzIVrsv6PlB88UO1WczX3ML78Hp0IkewrW4OUjyeRxp33t9NbX4DAoeRmeOQCiAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pN6o4eidmOSfuwpFcPj7r23yFKVFx/DJiW2aj2C163M=;
 b=cDNtyJsBxRKyjhBU9MYWqDtjA0QPmovmMzvNGFRWUYsY0Y2bVv+uMOMT1ktdwrNv8M4scgE786xV3P4bekBxK/xvoEEuvRD2PbUEauOQXttN1WH1w+zAiDS6F40w/qpmVCrEuyaAAZ4gh7LkSHJ2qL3+aLAAjNCxOO0zNaOuoRUEAPvQwV2m7nW9Yn97iarK0ixsCi2Hp6Oc7YQQn0hu2B2mJJgEdNixYiews6tBASbKOj+OQtbHEqzCjgBjuTsuuLWq0VN0P2Qs/bc9QUKkf4LJH9flLppbx0nNFdUugfy88afQnAXFtKnyTeLh9J2+QDZpmgGKxG2f3JGSBFwZkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pN6o4eidmOSfuwpFcPj7r23yFKVFx/DJiW2aj2C163M=;
 b=jTQnTDZOCP8LsZ+ygImmzcyGUDjfVemgd9N1Oonn5QJhGdzMZqJEvyDqIikOL7ZY18WctQvZHH1e1XUo5SPVURhSTMxBcqKKNAGqMNqbS7QVVvm4tnlwjn6HMNpRxZMOICzX7hec3tRLcGiLrXlgwh/7a8Msorgrlk2YPxF6ogk=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3351.namprd12.prod.outlook.com (2603:10b6:a03:de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Mon, 13 Apr
 2020 21:12:40 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2900.028; Mon, 13 Apr 2020
 21:12:40 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v3] Make any 32-bit time based syscalls unavailable for
 TIMESIZE==64
Thread-Topic: [PATCH v3] Make any 32-bit time based syscalls unavailable for
 TIMESIZE==64
Thread-Index: AQHWB6YXXY4j5+K2H0eFv1trJub2pqhsekUAgAsm9IA=
Date: Mon, 13 Apr 2020 21:12:40 +0000
Message-ID: <9eda9480-d0d5-07ec-3a99-83e61b076a2a@synopsys.com>
References: <20200312183325.594-1-vgupta@synopsys.com>
 <20200331214717.23902-1-vgupta@synopsys.com>
 <c87dd5b4-8be6-714f-3210-4cbfbe89a069@synopsys.com>
In-Reply-To: <c87dd5b4-8be6-714f-3210-4cbfbe89a069@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:7c06:2fd:ae14:dd9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5349b32-57ff-43df-4f79-08d7dfef665c
x-ms-traffictypediagnostic: BYAPR12MB3351:
x-microsoft-antispam-prvs: <BYAPR12MB335115F67944BCBC011E1343B6DD0@BYAPR12MB3351.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(396003)(376002)(346002)(136003)(366004)(36756003)(66446008)(64756008)(66946007)(54906003)(478600001)(76116006)(53546011)(6512007)(66476007)(316002)(2906002)(66556008)(6506007)(5660300002)(31696002)(31686004)(81156014)(2616005)(186003)(6486002)(71200400001)(8676002)(86362001)(4326008)(8936002)(6916009);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XY51Ryng/YMzgAFGqpmg+7HKrRRFiY8/e3RQPGE1Ux3r4fvCxH4dFPqKAUy1f5IivW1eWfjXnCEJkggQTzmi8PP5/iaApYOftekW3oEB8N+47jkMb/BG0cBUrRp1kj72xDvz5XR+S93yZjFnF8XsuUVPlFcn6nfLSX2iNSFOtJIvUuqzqRol0S3Hp65X2FFjvtzyMZeS4oBWBic3XwP4E4UqOlMTNI+Qh40qRuYoVf2oWS6rDIUwWDBlrI1eUUmOdq2EQci/ByTu0sv1/wCLx339odC+Kn/x5cv4p9qqZnDh0DZSGyJjsa6wIVdhStcPQgBwebIoWidAUysYsW3QwLj4ToAVq8qUQa1sH+5P/8HCnW5AFgDhxqj8v2c1GmmFuXV0ba4el0zgZL7WugI3oWyluJRkOPpaNsNi5tID5Lg903Z+Ykx8an5yebVMXqyvT4R/gajVYrF5QVxQvr6XtEYP3T+vPyFh9hB4hiMExboR4aQyR+2agk2INyftGCzCFS/PkyDzA9s3vc1QcUdm3Q==
x-ms-exchange-antispam-messagedata: uUUrcI08rne2fj2WomsjsS5mezh4AOTWd+20zXOTsM6DE6OIA4k/pR5K/v5Jgb+hHr8A5BndTIhynBGSbK9GPw/J18ekyTPd4jKM1zJFQfRJqiu6wwBF2jBliiByYKGutits/LmBTj4bi8RHFd7XCWE6daN3LRBcX/OFG+KUmCO2V66nCT31AiemBI/6Lud/kB+a8DUidO9ykUup4BRYsg==
x-ms-exchange-transport-forked: True
Content-ID: <7DC746D36B370B46A1C355C8F9647DF3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d5349b32-57ff-43df-4f79-08d7dfef665c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 21:12:40.2068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XCyg1vK/OhuIkgaLGbTgRhoIQx6t63g9xhI+BfQ4nQvXw4lvEC64cDYobnoh7PEkxtSJTG4YiOz4QnypjPNxgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3351
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_141242_389652_9ED977DC 
X-CRM114-Status: GOOD (  13.03  )
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
Cc: Stepan Golosunov <stepan@golosunov.pp.ru>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 4/6/20 11:54 AM, Vineet Gupta wrote:
> On 3/31/20 2:47 PM, Vineet Gupta via Libc-alpha wrote:
>> From: Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
>>
>> An older asm-generic syscall ABI may have kernel provide 32-bit
>> time syscalls, so undef them to not mix 32/64 in 64-bit time regime.
>>
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> 
> ping !

ping ^2 !


> 
>> ---
>> Changes since v2
>>   - Made x32 safe
>>
>> Changes since v1
>>   - don't redirect these to 64-bit variants
>> ---
>>  sysdeps/unix/sysv/linux/generic/sysdep.h | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/sysdeps/unix/sysv/linux/generic/sysdep.h b/sysdeps/unix/sysv/linux/generic/sysdep.h
>> index 40b4b955ca1b..b83e17e1c9d1 100644
>> --- a/sysdeps/unix/sysv/linux/generic/sysdep.h
>> +++ b/sysdeps/unix/sysv/linux/generic/sysdep.h
>> @@ -17,6 +17,7 @@
>>     <https://www.gnu.org/licenses/>.  */
>>  
>>  #include <bits/wordsize.h>
>> +#include <bits/timesize.h>
>>  #include <kernel-features.h>
>>  #include <sysdeps/unix/sysdep.h>
>>  #include <sysdeps/unix/sysv/linux/sysdep.h>
>> @@ -25,3 +26,26 @@
>>  #ifdef __NR_llseek
>>  # define __NR__llseek __NR_llseek
>>  #endif
>> +
>> +#if (__TIMESIZE == 64 && __WORDSIZE == 32 \
>> +     && (!defined __SYSCALL_WORDSIZE || __SYSCALL_WORDSIZE == 32))
>> +
>> +/* Don't provide 32-bit time syscalls even if the kernel ABI provides
>> +   them (Older variants of asm-generic ABIs e.g. ARC).  */
>> +
>> +# undef __NR_futex
>> +# undef __NR_rt_sigtimedwait
>> +# undef __NR_ppoll
>> +# undef __NR_utimensat
>> +# undef __NR_pselect6
>> +# undef __NR_recvmmsg
>> +# undef __NR_semtimedop
>> +# undef __NR_mq_timedreceive
>> +# undef __NR_mq_timedsend
>> +# undef __NR_clock_getres
>> +# undef __NR_timerfd_settime
>> +# undef __NR_timerfd_gettime
>> +# undef __NR_sched_rr_get_interval
>> +# undef __NR_clock_adjtime
>> +
>> +#endif
>>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
