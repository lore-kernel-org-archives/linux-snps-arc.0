Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D36C43331
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 04:35:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAFAF206F2
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 04:35:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CRE3x6Ye";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PbIaXFHd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Y1/grYhq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAFAF206F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kvW1h7s/KMw4Hbr3aommwcbZ+5jwJw9GJzSNvc8cx2g=; b=CRE3x6YenWkFli
	okeBcZb1xxWK7aPPD4QS3rpWhn4aQ4OzIA0iVCeyPFdrTNL0nBeUnkADPr0yFNzf+L7AGFeQIVkQo
	GuxMxzImxefWzcg9rVA9PqrxmH411YbzM+6Ln/jZdDwreUWsMfEbUNp+fxVQRnxPrAjEp7AnrmPAP
	xVc5q74nChTk/s/gnPDqipMkvrjYqwiY1U9DTK0wQGfNwzrCXYMudUj/n+rxvA2lPp5NV7NKNPajb
	EGHrVPhhN/oR4ZJ0vi6iUfEKk9iUF309J9rziz2rxdE/nl8sXFjf2V6VLwmYPcLfJlJ763aqd0NPW
	SvVO71MTIgvKxnRWDHag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHghz-0000M7-0x; Fri, 27 Mar 2020 04:35:03 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHghw-000093-FY
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 04:35:02 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 13FED40609;
 Fri, 27 Mar 2020 04:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585283699; bh=XjzU5bZsoykyMmMe1MPDQjUm2feslM2PylQrPN0NPYY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=PbIaXFHdrn6a/XsVH/3XbDq2Ij/SHUiWFYVbzgdwogvfkrp84T+6cs/1nwPD8OmiI
 /9otJseTkVTMciTf4DdOm5gsarBhGPYkeo/WmL3RlD3PC4JAEtpOSQ11blx2zTQxA1
 7lUi0ChqAy6b9MbwnMrZ2zpA7WhdNLqwfmTjdUPxoZcnv01Q1CVq31sIMsp9Umoz9P
 ZQYsUW672zr2lsfKkMtKOpArdxvcX61s6Co/YsnMZmZPV8nltI2wG5P375R6fzZOu+
 XKyPH5jj5Rp5QsqaLRd+i6XJufRfCnooacuVLeex6TVdLZzO9Jb+HKwEogpJ7gcHpO
 DkQvDQFT65sAg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0298FA006C;
 Fri, 27 Mar 2020 04:34:57 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 26 Mar 2020 21:34:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 26 Mar 2020 21:34:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jm6Io0UCjMZP6C6Gc7rG1Neae7awwebsfU97rA+1Sc1COTLFy+P7Y5WJf95l6/RhGKExJL86pVfkzVWxR5GCvxNpeSAhudurNVnQJKBFG4SjCg2PD6Mb+Ts9ykLL3JCnBE9TfE4fGcxIiXNqlqqafVckmbA/z02JgT3VUk9HLfH56obrcPD3p2qTOCiN5T6X7E2mB+RV/vu93wDw7+DlpgnQZfxGGLeHErpc7u7TI3BH8nUE9fk+YvJECpH++LecwDuQg5wGIPoFiTOp71BJ3BytIiYpcvnUHT3Wpn7wDFJyJWr4bTHBbv/NjzoWSRlI6xw6ie/kitsta4e+0srv8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjzU5bZsoykyMmMe1MPDQjUm2feslM2PylQrPN0NPYY=;
 b=Re5h/gc4CQKkBT9pQda0H2v6tc211ppqRkOFPPoy55TFrRlEPGIrDvR9W301mW6noc3dDJ0rKS4EwnKDu5Wnlwt/5T/30i4wONcrQiwtogvb/vZEAia81qh9R2o7n8YhuoVqnlDMU72ZJvi+dIPEKWoS9ldRtbuGmFvj57SKgBKAS4lFks3qjWwPMFsQT9xDXbc81k+cr3Fx4CACy6SODS2rhkDFnTHSZf+LnUP7cTGdU0fgEToxFqiLHhwho6+giV5qhKPDZxgu/trvHkirdfGn15/Em1LVnEcrVqkuaw2RVsOhZJ3Mqg3UQpewTNRPuXZp1zoHHiChjrhNwaY0aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjzU5bZsoykyMmMe1MPDQjUm2feslM2PylQrPN0NPYY=;
 b=Y1/grYhqVmM2X3ngrdIT4Xbe3qPjbBJ4Z1n8gFGuWAzaL/kYXrr5sGPMcsGZwi2lsviTRVHOx3ehbBd6IBQ8OZHvcW5bHFiPrqerzA+XBOIJ8O5XVgHLPdQp5Kihvd8XcGhbeaUtYb0zCxJJuEn5BkkaR/gzdZhEc1l84+c5Vi0=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3221.namprd12.prod.outlook.com (2603:10b6:a03:135::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Fri, 27 Mar
 2020 04:34:55 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 04:34:55 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v4 08/15] ARC: Linux Syscall Interface
Thread-Topic: [PATCH v4 08/15] ARC: Linux Syscall Interface
Thread-Index: AQHWA8nCKJOg0vJk/UCKzcs+aYlmXKhb2osA
Date: Fri, 27 Mar 2020 04:34:55 +0000
Message-ID: <f0fd1b9f-d1fb-6492-18d5-2c1bed0941e3@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-9-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003262342490.24611@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003262342490.24611@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:24c5:8a14:3f19:e6c8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d5865e2-91a3-486f-dc97-08d7d2083325
x-ms-traffictypediagnostic: BYAPR12MB3221:
x-microsoft-antispam-prvs: <BYAPR12MB32213469849AE3D47F09E3D0B6CC0@BYAPR12MB3221.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(396003)(136003)(39860400002)(366004)(54906003)(6506007)(66446008)(64756008)(6512007)(36756003)(186003)(6486002)(66476007)(316002)(76116006)(4326008)(53546011)(66946007)(6916009)(66556008)(86362001)(2616005)(31696002)(71200400001)(5660300002)(31686004)(8676002)(2906002)(81166006)(478600001)(8936002)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3221;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LApA0BWaMD68KKaC8mVLZOIYTWDgsEdZaCM/uzzS7fdqMYkgF3qaDAwhNBPKQlEzR3X1w2yLNTP3XZDBqJa0l4gGtbJRdo10EBxNr0K0iDrj3SuTUEbPSpiOeZ14GR9Vfr/Z9+xhQGqW4PDksLYFaB5gbsEfAdtLffmguz3PL8BthTQhiz0c0zLMzvOii1MFFQlAKutqMxZn3Mwdkbs6sxEyGOgZ0PxHTncl1UhFXc4onrgEt7Q+wXXZFkB6VYEiLY7WXbiZF2t+4liByj8zrSuqjtKslIASSOImanE5C1ODCEAEX067RFNTOcQ8tS7qF0oqkbvzlLq9wY7Eh1hNr9luAXDH2iiR/c8okQVYoQmbX2R5pbws+c6S4IbpD2xBmpyauW/tjVWE7Oc0+RmDy2zSTJm5GR5EphPpxHIFj+DuIuC2Eh5M4h7j5DevM2sG
x-ms-exchange-antispam-messagedata: c/KNA4KluIdoU5sLoSpEjofx1r6Gn48tqIHayY02eF5haOatuycnOkuvRLYdiB/P+MkczuytKNT1ybO8rQXsp4kx+UF6MCyQbZ8SDl/ODULcODF0tnksAnTgGzuG1oZorZmp+d8ZQ8mKuFW3AV6OJJ7MoqA8Ru3RboEr1W0Cs9wr/Sj1X1K+Qjyv9tUQz/T/2GQTQr3pzk0Rxx5QauaUWg==
x-ms-exchange-transport-forked: True
Content-ID: <902C9310BB8FE34FA355A8D8A186248C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5865e2-91a3-486f-dc97-08d7d2083325
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 04:34:55.4935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2VuUuvVVDVsX90Roozvg9j/SDtUjwLanLDETmO0y39fA2xD4rDDb4apVdcCX15vWTkgb0rskaYxtwyBqHcTGHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3221
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_213500_588641_EFE2E96C 
X-CRM114-Status: GOOD (  22.75  )
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
Cc: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alistair Francis <alistair.francis@wdc.com>, Lukasz Majewski <lukma@denx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

+CC a few folks working on 64-bit time changes

On 3/26/20 4:52 PM, Joseph Myers wrote:
> On Thu, 12 Mar 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> diff --git a/sysdeps/unix/sysv/linux/arc/bits/socket-constants.h b/sysdeps/unix/sysv/linux/arc/bits/socket-constants.h
>> new file mode 100644
>> index 000000000000..74b0c06edb36
>> --- /dev/null
>> +++ b/sysdeps/unix/sysv/linux/arc/bits/socket-constants.h
> 
> As far as I can see, the only reason for having this header is to use 
> appropriate values of SO_RCVTIMEO and SO_SNDTIMEO for 64-bit time.
> 
> It's best not to need a separate version of this header for all future 
> 32-bit architectures.  So I'd suggest putting the conditionals on the size 
> of time_t in the default sysdeps/unix/sysv/linux/bits/socket-constants.h 
> instead.

OK this was loosely based on RV32 port. I can fix as you say, as a
standalone/separate patch I suppose.

But in grep'ing I see a weird thing: SO_RCVTIMEO in user exposed socket.h has a
totally different value from socket-constants.h - how is that supposed to work.

$git grep SO_RCVTIME

bits/socket.h:348:    SO_RCVTIMEO = 0x1006,     /* Receive timeout.  */
bits/socket.h:349:#define SO_RCVTIMEO SO_RCVTIMEO
sysdeps/unix/sysv/linux/arc/bits/socket-constants.h:33:#define SO_RCVTIMEO 66
sysdeps/unix/sysv/linux/bits/socket-constants.h:33:#define SO_RCVTIMEO 20
sysdeps/unix/sysv/linux/riscv/bits/socket-constants.h:34:# define SO_RCVTIMEO 66
sysdeps/unix/sysv/linux/riscv/bits/socket-constants.h:36:# define SO_RCVTIMEO 20


> Should the choice of values of these macros, for normal user programs, be 
> based on the time_t for the current compilation (as affected by _TIME_BITS 
> in future) or on the time_t for the default ABI in glibc? 

If that's a question for me, I'm afraid Its above my paygrade :-)

> If the latter, 
> it would be a __TIMESIZE conditional in the header (that is, a conditional 
> based on __TIMESIZE == __SYSCALL_WORDSIZE, or using __WORDSIZE when 
> __SYSCALL_WORDSIZE is not defined, since the actual kernel conditional is 
> about whether using the same time_t size as kernel "long"). 


> If the 
> former, it might use __TIMESIZE right now, but that would need to change 
> when _TIME_BITS is supported to a different macro meaning the time_t size 
> for the current compilation.

This approach seems similar to what Alistair has done for generic/bits/typesizes.h
shall we pursue it ?

> 
>> diff --git a/sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h b/sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h
>> new file mode 100644
>> index 000000000000..6c129398483a
>> --- /dev/null
>> +++ b/sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h
>> @@ -0,0 +1,6 @@
>> +#define JMP_BUF_SIZE		(32 + 1 + 64/(8 * sizeof (unsigned long int))) * sizeof (unsigned long int)
>> +#define SIGJMP_BUF_SIZE		(32 + 1 + 64/(8 * sizeof (unsigned long int))) * sizeof (unsigned long int)
> 
> Missing spaces around '/'.

Fixed.

>> +/* The minimum supported kernel version for ARC is 3.9,
>> +   guaranteeing many kernel features.  */
> 
> But actually it's 5.1 at present.

Right, fixed that.

>> +/* All syscall handler come here to avoid generated code bloat due to
>> +   GOT reference  to errno_location or it's equivalent.  */
>> +int
>> +__syscall_error(int err_no)
> 
> Missing space before '('

Oops, fixed now.

> 
>> +{
>> +  __set_errno(-err_no);
> 
> Likewise.

Fixed.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
