Return-Path: <SRS0=Ntev=CS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA06C433E2
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2020 19:15:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25092206A5
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2020 19:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uLa/5wFT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WDpgEwlA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="I3bjkLs8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25092206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gTOhqvYB+AbB+m3OMprSW0VUFGrHsXcX1kVfSIAAlcU=; b=uLa/5wFTiJ2ZQgDaBk4FTA+Ss
	h8wdqWSYUNJnf5qhFLOJZlUGYBcX0ddjNUXC4YZrrc+K/3W/mRj4oWu8QzHhe1DJy7VvCskrwP8vz
	DMT/qMtzqNAkTIujtThM7m8R8RQxwHVIP0nVTy22IrYFeKTZhndQavHdbgdG6uTONU7iwvchMDSeC
	HPC6pTjsV9O0wcPB0p7MQ/0p1mrsRBCvcOzBsg7Hz00/iRza4HFa+ELqpGzwRCGx6f9YB+PZXPjUi
	cSsCehT+rFy9mXD2HP7R3omtsFulBs95N+Kzr1Ad/L8pMVNfywm9Bf44ExNR2MbDQamnTtVZu63mM
	jn1HWxcHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG5ZE-0004jo-Gf; Wed, 09 Sep 2020 19:15:40 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG5ZB-0004eZ-2u
 for linux-snps-arc@lists.infradead.org; Wed, 09 Sep 2020 19:15:38 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 07F28C008D;
 Wed,  9 Sep 2020 19:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1599678935; bh=orfFqmhTg944Egi/ZjlPiuRhpFVtI7FXONzVl8XeIzo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=WDpgEwlAej4hAyIatdsGOQoUeLtUY3y0B7S2Btuolzd9xwx0YEzUAXF9n+rPZO3fn
 kxdRdI8EV/0c+sSkhJRttIkHi7RDZkLORvvHPJRRQaIOIKYDigGuW+Dzj4G0iTh49F
 33O1wKPiwvL70I+ANnnZbrJYxH8Vw6TA418G1hcm6PfU5WG0WipD/vq2jsE886vmJg
 EVoc4skra5oNbm9K7OqCNjMWGy7Nf+2MI1090q7OaIlR5lybIQ6Xlun+Nk55bM3x09
 okhZe2uBuYylc6SDa+D18jz0UflB4isDtdA66Mlvh4Pengwcw4Q5QGbNi4R50Zudqn
 VL4TW5b+Hfobw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0784DA0067;
 Wed,  9 Sep 2020 19:15:32 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9A25D80236;
 Wed,  9 Sep 2020 19:15:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="I3bjkLs8";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qq5JcEdspRcm+EClxg56KHu4nCpxxLCJjkphbv9FwsJ0k+5u0Jd4NKcTIR/h/KBya+yR+ULH8WPU/F0pJ3vY1WZGIyU0PzZW1XM2csHGBK1LOFchFBq6GT7wBmn/Ku+lCMSQLefQjHYiUfZGJPRl1VR2kpKTU86f1aHtDvwDDcGt4pT6SXn93jribeIRLYKyo78+EzDq5dEY0971XT24FIfgZYK6NawccRr87jKCrbjaEq79p/qBQy1GTOhdqljxRu+dGlsWH5MZVvtlUBa3/yL0VKHzI79oeECHBySAedu7RYUwW8cVOCyOZoar2sz7Y0ZETx7/0uTV8tiymevcVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orfFqmhTg944Egi/ZjlPiuRhpFVtI7FXONzVl8XeIzo=;
 b=e8Hdo0sTJay3H1+qn4lsDpHJXStUN/Cf1ZvO9wdMAzrFpPLkzFJLr/yeg0uMNtmaLuDFYDU1Om56DCOUJFzZBe3CpXKGKcHff4S/2DevDvafrNCaGHpB9b1SPu//NtdAHJefsiUoyPqtBp/Yvn2gQXiedeP39n4vFPSKNITBz515We9Qp+/mJtoZFF49VagOXo+LeWEsjWJLq/Gik7urOQPD+WlGZ+KKxSzMN0CA8+yZcgeV/leToq11eKFRizqF9mXXhXTBvVBGW6TZFYBLECNl7SzimLfCxBmvw+eJ6BW0w9H4Ti+B+o1YAy6MCuaE41TcIU1w3ZbVs18/0NTLGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orfFqmhTg944Egi/ZjlPiuRhpFVtI7FXONzVl8XeIzo=;
 b=I3bjkLs8bJjT33ZgVyzkXPdzFMH5oP2NCnek/XXFFNXR9YuJ5pCv2eYxTygyDdndJKDpY5ufgFZd+12tFyhYxfa9D0yliE9WuY4977fcMz7E05LlzURgHFSDTrA9j5jctNR3py4eYGJaClM6bffUhiDKAKbhmPsvx/z/wUiZZKo=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2854.namprd12.prod.outlook.com (2603:10b6:a03:135::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Wed, 9 Sep
 2020 19:15:27 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e%5]) with mapi id 15.20.3370.016; Wed, 9 Sep 2020
 19:15:27 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH] Remove STATFS_IS_STATFS64 conditional as it is zero in
 all ports
Thread-Topic: [PATCH] Remove STATFS_IS_STATFS64 conditional as it is zero in
 all ports
Thread-Index: AQHWhlO1mIM8eXOgXUy2n2LIX5abaalgo6WAgAAK2AA=
Date: Wed, 9 Sep 2020 19:15:27 +0000
Message-ID: <00b063fc-0baf-9e9f-0a13-23191b580efb@synopsys.com>
References: <20200909024826.3377653-1-vgupta@synopsys.com>
 <fee85a94-c54e-96c8-ca93-2d57d40ab4a1@linaro.org>
In-Reply-To: <fee85a94-c54e-96c8-ca93-2d57d40ab4a1@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:b9:9593:5cb1:ebc3:8ee9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d76b7ea0-ea67-40c9-3832-08d854f4b60c
x-ms-traffictypediagnostic: BYAPR12MB2854:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2854D4973CD5CE4E6358BCC7B6260@BYAPR12MB2854.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nOjcyxBGwKXc496HfDr6umt2cwAef1tVGwt9JfokOwoYWiRw68CsAQMFYBivcLfLZ89SUjZApQGDaaH2CE5wlyW98UiLhxjuL99zCpa2pZQszergBoWWpDO0S0+93QRlMGW3HAuH85goEwUZ5cTVGlJsGkIi96hSUlziudTBq29zgFndtULdH0Cfl2E1uW8KO2kYuNc/uMStrie1uy7z790Cyn9uoyu5nzsqOXEuE75WHtPrBcN9GzXtxc8NRE9OhDZHDf1Y8NKQazvf28l1Nci0zTIeo61f06zs18e3qIfka0Vw//Wl7Q9aMps3tKOa9j6+Rk77D1wx2THtQFfZUaw1KTCM3VNFxGRcG1dcNBSjzxvwY6YkB3vvnXAHXt/N
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(376002)(366004)(136003)(396003)(53546011)(6486002)(478600001)(6506007)(6512007)(2906002)(31686004)(4326008)(5660300002)(31696002)(86362001)(110136005)(36756003)(316002)(83380400001)(8676002)(2616005)(8936002)(76116006)(66446008)(64756008)(66556008)(66476007)(66946007)(186003)(71200400001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: KzpZC4iupZalxrDk2GSraT3e4CkbPF+NSsCa3yc73Qdrg5Qz9k46BmqvACj8a4MIqnC8hVFU1RwmwnPyCyXKjvoaTb+uZOjuVg4hkGgFto3Vd8HrT+n+H51mf8BqABZjdPNX+NdX22V/F21MkrmyB6HPaGFLkqJ6G5FG7iXrPqpo5A2mBtp3Z96hJaUeWq1vtx4CaTsQ/Rkd9BXZkYHq0qtEYOEowC2DvHVE4llJIHIIUtHkPgYgtyUTTF3Zw4tHSVqhYqihZvWzW83y2JHeO8MDkGZKZTKnsV4YUxI0MQw866QJO8tCXDY8htTBAYEN4ixTqUu+YCXtcytgeuI964f/zUK93u/fBhZssNlbIjMAG4BpkzdRJ1KC42keyIUzD8j2CF+e+Z9Ed/Br5b0YO9QDu6BryiXQKN8pNXWmgxupb2uQBRbLltjsmsy94isFurnEM2olRFgPOwwXtWoKAyqJqSQpA7W4d37RULusgiDfPdzCS6oVIMa4Qn/xD70YiRTaBhla2L51pzf0Ds+yunqEreh6gDtfokZ8j8vzpsVuWWlhysGFQB37FkZy1fAFzVYckxt9Z72ai9aG6BsMWipwB5m/bse3zSSGS3oLVbDwEk6QWeKFwLKK8mczxoXHtCzThI+tN4bBSqNQI/x6pq9SEaOf/xTY/iPLXVxq4T5vCIQcj0/5KKCqJ8crYD96S0E31wepfUwQTT7hMTf7PQ==
Content-ID: <1A7155199820104CAA1ECB8696E54A94@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d76b7ea0-ea67-40c9-3832-08d854f4b60c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2020 19:15:27.4323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +fAfL5lRpkSKAwLojdaRBT/21hDr39caXxIEY/H45KcYuJdqRvpe95Wr0wMZFKjyBn/1ioi0NhP8GzuI6BtDsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2854
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_151537_546069_8FA94799 
X-CRM114-Status: GOOD (  19.53  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 9/9/20 11:36 AM, Adhemerval Zanella via Libc-alpha wrote:
> 
> 
> On 08/09/2020 23:48, Vineet Gupta via Libc-alpha wrote:
>> From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
>>
>> This seems to be dead code, so remove it.
> 
> It could be useful for a possible statfs/statfs64 consolidation, but indeed
> it is dead code now.
> 
> LGTM, thanks.
> 
> Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>

Thx. But it seems this could collide with your series. I'll wait it out and rebase
after your changes have settled in.

-Vineet


>> ---
>>  sysdeps/unix/sysv/linux/alpha/kernel_stat.h       |  1 -
>>  sysdeps/unix/sysv/linux/fstatfs64.c               | 14 --------------
>>  sysdeps/unix/sysv/linux/generic/kernel_stat.h     |  2 --
>>  .../unix/sysv/linux/generic/wordsize-32/fstatfs.c |  2 --
>>  .../unix/sysv/linux/generic/wordsize-32/statfs.c  |  2 --
>>  sysdeps/unix/sysv/linux/hppa/kernel_stat.h        |  1 -
>>  sysdeps/unix/sysv/linux/ia64/kernel_stat.h        |  1 -
>>  sysdeps/unix/sysv/linux/kernel_stat.h             |  1 -
>>  sysdeps/unix/sysv/linux/microblaze/kernel_stat.h  |  1 -
>>  sysdeps/unix/sysv/linux/mips/kernel_stat.h        |  1 -
>>  .../sysv/linux/powerpc/powerpc32/kernel_stat.h    |  1 -
>>  .../sysv/linux/powerpc/powerpc64/kernel_stat.h    |  1 -
>>  .../unix/sysv/linux/s390/s390-64/kernel_stat.h    |  1 -
>>  .../unix/sysv/linux/sparc/sparc32/kernel_stat.h   |  1 -
>>  .../unix/sysv/linux/sparc/sparc64/kernel_stat.h   |  1 -
>>  sysdeps/unix/sysv/linux/statfs64.c                | 15 ---------------
>>  sysdeps/unix/sysv/linux/x86_64/kernel_stat.h      |  1 -
>>  17 files changed, 47 deletions(-)
>>
>> diff --git a/sysdeps/unix/sysv/linux/alpha/kernel_stat.h b/sysdeps/unix/sysv/linux/alpha/kernel_stat.h
>> index d637e099cfe4..670841140765 100644
>> --- a/sysdeps/unix/sysv/linux/alpha/kernel_stat.h
>> +++ b/sysdeps/unix/sysv/linux/alpha/kernel_stat.h
>> @@ -86,4 +86,3 @@ struct glibc21_stat
>>    };
>>  
>>  #define XSTAT_IS_XSTAT64 1
>> -#define STATFS_IS_STATFS64 0
>> diff --git a/sysdeps/unix/sysv/linux/fstatfs64.c b/sysdeps/unix/sysv/linux/fstatfs64.c
>> index 9d22fa228fa5..4a339b548aa7 100644
>> --- a/sysdeps/unix/sysv/linux/fstatfs64.c
>> +++ b/sysdeps/unix/sysv/linux/fstatfs64.c
>> @@ -22,15 +22,6 @@
>>  #include <sysdep.h>
>>  #include <kernel_stat.h>
>>  
>> -/* Hide the prototypes for __fstatfs and fstatfs so that GCC will not
>> -   complain about the different function signatures if they are aliased
>> -   to  __fstat64.  If STATFS_IS_STATFS64 is not zero then the statfs and
>> -   statfs64 structures have an identical layout but different type names.  */
>> -
>> -#if STATFS_IS_STATFS64
>> -# define __fstatfs __fstatfs_disable
>> -# define fstatfs fstatfs_disable
>> -#endif
>>  #include <sys/statfs.h>
>>  
>>  #include <kernel-features.h>
>> @@ -85,8 +76,3 @@ weak_alias (__fstatfs64, fstatfs64)
>>  
>>  #undef __fstatfs
>>  #undef fstatfs
>> -
>> -#if STATFS_IS_STATFS64
>> -weak_alias (__fstatfs64, __fstatfs)
>> -weak_alias (__fstatfs64, fstatfs)
>> -#endif
>> diff --git a/sysdeps/unix/sysv/linux/generic/kernel_stat.h b/sysdeps/unix/sysv/linux/generic/kernel_stat.h
>> index 2eed3596c0ed..5a600f188320 100644
>> --- a/sysdeps/unix/sysv/linux/generic/kernel_stat.h
>> +++ b/sysdeps/unix/sysv/linux/generic/kernel_stat.h
>> @@ -26,5 +26,3 @@
>>  #else
>>  # define XSTAT_IS_XSTAT64 0
>>  #endif
>> -
>> -#define STATFS_IS_STATFS64 0
>> diff --git a/sysdeps/unix/sysv/linux/generic/wordsize-32/fstatfs.c b/sysdeps/unix/sysv/linux/generic/wordsize-32/fstatfs.c
>> index 93d9d94a0a61..bacc1543013a 100644
>> --- a/sysdeps/unix/sysv/linux/generic/wordsize-32/fstatfs.c
>> +++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/fstatfs.c
>> @@ -21,7 +21,6 @@
>>  #include <kernel_stat.h>
>>  #include <stddef.h>
>>  
>> -#if !STATFS_IS_STATFS64
>>  #include "overflow.h"
>>  
>>  /* Return information about the filesystem on which FD resides.  */
>> @@ -32,4 +31,3 @@ __fstatfs (int fd, struct statfs *buf)
>>    return rc ?: statfs_overflow (buf);
>>  }
>>  weak_alias (__fstatfs, fstatfs)
>> -#endif
>> diff --git a/sysdeps/unix/sysv/linux/generic/wordsize-32/statfs.c b/sysdeps/unix/sysv/linux/generic/wordsize-32/statfs.c
>> index 7421501b4a40..a678e96058ce 100644
>> --- a/sysdeps/unix/sysv/linux/generic/wordsize-32/statfs.c
>> +++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/statfs.c
>> @@ -21,7 +21,6 @@
>>  #include <kernel_stat.h>
>>  #include <stddef.h>
>>  
>> -#if !STATFS_IS_STATFS64
>>  #include "overflow.h"
>>  
>>  /* Return information about the filesystem on which FILE resides.  */
>> @@ -33,4 +32,3 @@ __statfs (const char *file, struct statfs *buf)
>>  }
>>  libc_hidden_def (__statfs)
>>  weak_alias (__statfs, statfs)
>> -#endif
>> diff --git a/sysdeps/unix/sysv/linux/hppa/kernel_stat.h b/sysdeps/unix/sysv/linux/hppa/kernel_stat.h
>> index a3ac53a1ef2f..9ffa3ba638ea 100644
>> --- a/sysdeps/unix/sysv/linux/hppa/kernel_stat.h
>> +++ b/sysdeps/unix/sysv/linux/hppa/kernel_stat.h
>> @@ -31,4 +31,3 @@ struct kernel_stat {
>>  #define _HAVE_STAT64_NSEC
>>  
>>  #define XSTAT_IS_XSTAT64 0
>> -#define STATFS_IS_STATFS64 0
>> diff --git a/sysdeps/unix/sysv/linux/ia64/kernel_stat.h b/sysdeps/unix/sysv/linux/ia64/kernel_stat.h
>> index b38bf741d37b..da8e2a91eff7 100644
>> --- a/sysdeps/unix/sysv/linux/ia64/kernel_stat.h
>> +++ b/sysdeps/unix/sysv/linux/ia64/kernel_stat.h
>> @@ -18,4 +18,3 @@
>>  
>>  #define STAT_IS_KERNEL_STAT 1
>>  #define XSTAT_IS_XSTAT64 1
>> -#define STATFS_IS_STATFS64 0
>> diff --git a/sysdeps/unix/sysv/linux/kernel_stat.h b/sysdeps/unix/sysv/linux/kernel_stat.h
>> index eecc962de390..4354d14f76e9 100644
>> --- a/sysdeps/unix/sysv/linux/kernel_stat.h
>> +++ b/sysdeps/unix/sysv/linux/kernel_stat.h
>> @@ -35,4 +35,3 @@ struct kernel_stat
>>  #define _HAVE_STAT64_NSEC
>>  
>>  #define XSTAT_IS_XSTAT64 0
>> -#define STATFS_IS_STATFS64 0
>> diff --git a/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h b/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h
>> index 765e0dca6763..159870d9d5a7 100644
>> --- a/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h
>> +++ b/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h
>> @@ -49,4 +49,3 @@ struct kernel_stat
>>  };
>>  
>>  #define XSTAT_IS_XSTAT64 0
>> -#define STATFS_IS_STATFS64 0
>> diff --git a/sysdeps/unix/sysv/linux/mips/kernel_stat.h b/sysdeps/unix/sysv/linux/mips/kernel_stat.h
>> index 388df1bfffec..a41d15f95cfa 100644
>> --- a/sysdeps/unix/sysv/linux/mips/kernel_stat.h
>> +++ b/sysdeps/unix/sysv/linux/mips/kernel_stat.h
>> @@ -57,4 +57,3 @@ struct kernel_stat
>>  #endif
>>  
>>  #define XSTAT_IS_XSTAT64 0
>> -#define STATFS_IS_STATFS64 0
>> diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h b/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h
>> index c5948a4d3c1c..c28ad2dbc165 100644
>> --- a/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h
>> +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h
>> @@ -48,4 +48,3 @@ struct kernel_stat
>>  #define _HAVE_STAT64_NSEC
>>  
>>  #define XSTAT_IS_XSTAT64 0
>> -#define STATFS_IS_STATFS64 0
>> diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h b/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
>> index 5c10da3356f2..b764efe1a625 100644
>> --- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
>> +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
>> @@ -18,4 +18,3 @@
>>  
>>  #define STAT_IS_KERNEL_STAT 1
>>  #define XSTAT_IS_XSTAT64 1
>> -#define STATFS_IS_STATFS64 0
>> diff --git a/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h b/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
>> index b38bf741d37b..da8e2a91eff7 100644
>> --- a/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
>> +++ b/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
>> @@ -18,4 +18,3 @@
>>  
>>  #define STAT_IS_KERNEL_STAT 1
>>  #define XSTAT_IS_XSTAT64 1
>> -#define STATFS_IS_STATFS64 0
>> diff --git a/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h b/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h
>> index a4416009f1bc..eb6023692955 100644
>> --- a/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h
>> +++ b/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h
>> @@ -32,4 +32,3 @@ struct kernel_stat
>>  #define _HAVE_STAT64_NSEC
>>  
>>  #define XSTAT_IS_XSTAT64 0
>> -#define STATFS_IS_STATFS64 0
>> diff --git a/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h b/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h
>> index 30afb553b9b8..2a26a78d9c19 100644
>> --- a/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h
>> +++ b/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h
>> @@ -45,4 +45,3 @@ struct kernel_stat64
>>    };
>>  
>>  #define XSTAT_IS_XSTAT64 1
>> -#define STATFS_IS_STATFS64 0
>> diff --git a/sysdeps/unix/sysv/linux/statfs64.c b/sysdeps/unix/sysv/linux/statfs64.c
>> index c9411286375b..153654ac318f 100644
>> --- a/sysdeps/unix/sysv/linux/statfs64.c
>> +++ b/sysdeps/unix/sysv/linux/statfs64.c
>> @@ -22,15 +22,6 @@
>>  #include <sysdep.h>
>>  #include <kernel_stat.h>
>>  
>> -/* Hide the prototypes for __statfs and statfs so that GCC will not
>> -   complain about the different function signatures if they are aliased
>> -   to  __stat64.  If STATFS_IS_STATFS64 is not zero then the statfs and
>> -   statfs64 structures have an identical layout but different type names.  */
>> -
>> -#if STATFS_IS_STATFS64
>> -# define __statfs __statfs_disable
>> -# define statfs statfs_disable
>> -#endif
>>  #include <sys/statfs.h>
>>  
>>  #include <kernel-features.h>
>> @@ -87,9 +78,3 @@ weak_alias (__statfs64, statfs64)
>>  
>>  #undef __statfs
>>  #undef statfs
>> -
>> -#if STATFS_IS_STATFS64
>> -weak_alias (__statfs64, __statfs)
>> -weak_alias (__statfs64, statfs)
>> -libc_hidden_ver (__statfs64, __statfs)
>> -#endif
>> diff --git a/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h b/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h
>> index b38bf741d37b..da8e2a91eff7 100644
>> --- a/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h
>> +++ b/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h
>> @@ -18,4 +18,3 @@
>>  
>>  #define STAT_IS_KERNEL_STAT 1
>>  #define XSTAT_IS_XSTAT64 1
>> -#define STATFS_IS_STATFS64 0
>>
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
