Return-Path: <SRS0=zsFq=7J=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F74C433DF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 May 2020 01:49:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7272F207CB
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 May 2020 01:49:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tmqI2dmn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dvRHN2nL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aXeUmsWA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7272F207CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SDiifJ3inwPF6s2ooYRFs4CZupif66DYGxOvW5E3IM=; b=tmqI2dmnrzUo5t
	na/u6gvBiCd2YOHsSYoZTntsx0aPoZCijd9OilbbHrR4CUk0+UWGurON87b3LyllP2oaemFlE6rTU
	q+YB18JaTRTYUks5AK8dcwHfiWH+emTd/w+w/A8Cb/8cFTV9oWALoIDH8EntTUM0DQ4OOE668Z8zc
	u6gsN9O2qu0xZc3q2WxxM+8McFgTEm+xBC9dJtJlusumCHPJutrBC6L8limApLPXQunuyRy0xzaG4
	Lbmu1JiNjLOSaK4TVlOYAzkMiG6LaGAtT70PWPmmQGfuOntfD5+GJXN/2zvVRmKXy3GiRajs+Bk1H
	oOaoYi29DHym10XU31Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdlCW-0004nM-VZ; Wed, 27 May 2020 01:49:48 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdlCR-0004mn-Us
 for linux-snps-arc@lists.infradead.org; Wed, 27 May 2020 01:49:47 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1A2D6409D6;
 Wed, 27 May 2020 01:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590544182; bh=aNwNoma7znum9RI2U++2d4fCOJvXgjBcSkr8Ie3yhrM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=dvRHN2nLfx34oalOMOZNIi2T3OMqp08VJwoTEH3GnOinvJRTQeqStAwJsbm5igLCf
 LD9wFU7r1+58HYCmKx8kOwWgteb4Rmj5R3SpFfeLPOoIbTS2c8MnBi/ROan4py5swT
 RZmDAUd9cLYniIXuhAAbW72LIxDJUYauP5GVgUNXQIhGsaGOqhlv8VGkYPQsLmfLUn
 iL8QjlUsbBrQ0q0+P0BK8vr+FLeGF1LVa0xRALPTugOdGdGDbGbGZ2yA5ZpDjH6hG8
 Oz/06D2f12jIj3Opo0E0IeZX8C/UhTGqZcNK82461VYouOwDiDoJf5oTZfPGnzO00S
 4+gHyqkIkK7TQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 97A7DA006D;
 Wed, 27 May 2020 01:49:41 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 26 May 2020 18:49:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Tue, 26 May 2020 18:49:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJJzt7f3NFP2HpbpCgbE99AhtptqzS66tP8yfNEb9V/xcu5POCFORpbeXXNtXjl8Fkkp7RRG3GE348ynkzr/txAqnZFxDDFqX+3XFMzh/FtLDBZLAGb4pMzHf6caLuGW+2glvVOBtSEufwxgoZK5cIacrUZ7JmnTF4Sswg7tBrMzRaEu0X8qFN/GsWWJEBzgo5YLAZz11sH7944RxGphAS9xP534KNZ7QJWaJw86K7WwhvIHUdSVZGMw9e/l/roehEMgz57OHxh+MBZU54rscGBiN1MUKUQsT91RJcGS49Px2vMQ3T8HzZF4MZoi7iy7xLn1VUNhRIwC62BrfZFW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNwNoma7znum9RI2U++2d4fCOJvXgjBcSkr8Ie3yhrM=;
 b=Lfa9WmOkjZj1y55LOSOLmUY7MJp36jfSsUJrDHa6DFpMolGbw18BtqT8VPFRz+xCvrzWngYbhIWBGEMY+S75KQ6YetyccG/Cu6K8Jtl5Bz01r8Phbz1zwwfhcMavJfS28eupXFIrRO4zSJzKxYBimLZpJ1arSPCN73ZSCuWTAGSAe28zsbnMqCjc4PgK5m4j2GNu5hjZzZuGxz4xMqz7t2UHp4O8kMBTbeOhMG/ne2vUGHV0mgxRNxlqLZ6n3xFZXIX0LyAHKJTo+7IerYuoBWov+4JkD9cFB1SwyqforFZh4DSUegFc7B2H+sSjlo5TIWWfBcGILzGdvcPESlazMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNwNoma7znum9RI2U++2d4fCOJvXgjBcSkr8Ie3yhrM=;
 b=aXeUmsWAUoKT19FHjGSGSetsqlGs8x4L8jOxbI5sn7AEN40XZ31V35mang+e6F1w+FEsgZzQdqcxzMb4Ni+fjbqgmN8lb9YHdSXIdthVuVORuHv5qUHscuFXMTt9uPoxWMbmVUXcryOCUde4SoJi7qrjHJJdpcUOA2SdooCO3aA=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2632.namprd12.prod.outlook.com (2603:10b6:a03:6c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Wed, 27 May
 2020 01:49:18 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3021.030; Wed, 27 May 2020
 01:49:18 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v6 00/13] glibc port to ARC processors
Thread-Topic: [PATCH v6 00/13] glibc port to ARC processors
Thread-Index: AQHWKlIRP4r4qWPT3k6aK8fkXwvGwKi7PWoA
Date: Wed, 27 May 2020 01:49:17 +0000
Message-ID: <ace49dfd-a15b-2a4b-3710-5c3814cadd25@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <d171cd4e-f74c-bf7b-5db9-5ad737e4a5bb@synopsys.com>
 <6bfc68c3-4b95-bf5a-3e12-23bf7c492df7@synopsys.com>
In-Reply-To: <6bfc68c3-4b95-bf5a-3e12-23bf7c492df7@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: sourceware.org; dkim=none (message not signed)
 header.d=none;sourceware.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 865389df-c934-43bf-6c0b-08d801e02b3d
x-ms-traffictypediagnostic: BYAPR12MB2632:
x-microsoft-antispam-prvs: <BYAPR12MB263220CCE574C275B2517A65B6B10@BYAPR12MB2632.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zer6m93ieC0GmGCaVxa1cOAdBYVbzuorsE2+BFYo+RyEqzYFxS+YOpqNcvMBmUMHWQFjzUtVexUK+QTfDOflntYxdA+gxVyENDjVFwKj9AwpZ7MkuJNm2Ik3MrtZZbmbcUBS6rPCxbIYexgIAbY8YyNQkfWKMM4dTrirJbQRlckhG5L6TOGJHRL5h00sAImALO3pSF4juLUhJvpNSESPmEljgdH7MIZQARRf8WxG6/Jvk7qCEfWqm4bw91fUjIUxE3hxwEOOigl+FO3uxcxAX79BsPQviBCP7Gy1JYvcPfIRYZCRtXPFuRGPgbALZDdDE4ivZx1voLnr1BMYijLJPTIAIHuOIWcyjQwVj2w544vIURlHTy7SyUc4VB+mbnWcsZJdbAuvit03b+SybpRqPIzmA12AZlulWReVTyElFwKPzeR6OsC/8zpKvzmlCzP3tNoea+p5fmHrM6pYugfQyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(39850400004)(366004)(346002)(136003)(376002)(86362001)(5660300002)(16799955002)(64756008)(966005)(2906002)(31686004)(36756003)(6486002)(2616005)(186003)(76116006)(66476007)(6916009)(4326008)(6512007)(66946007)(478600001)(66446008)(31696002)(66556008)(8676002)(30864003)(71200400001)(53546011)(316002)(54906003)(8936002)(6506007)(83380400001)(43740500002)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: PfpoSbFieuAymKQIBKTIiiaZsB2h8Y5SrbI1PxZzqlT84PkqEW3GB5jn4CcEblXaCTrq2HU6IC5+oihknbMzv0Wu9pUPkQi8UM5OKjqXiRfoF9q5ihluNutVxvbZQQRp4ji/fbO4r07D7hq07Ap+XuCBlZ69lZhkWjUR+gK4uNpKO4CIYH0KZBaZadC/HOkleWIp2XEIKWPMABm4hUo3goVWuMnTf4/dhJEjURuU9vHkNtREzIWTW8vp0pwsDz0Ii8yupGJfwc1E8qqdYFeKVcgkZT0+bs0PMl72bQ/EyDB/0b9m3/ytZ6Ie8FccalUDk8mQLEVRIVqJ6vExhLf+FAF0eMu5FnF7Li5AsBvQTI9tULTYIowJx/I5kIbmWr4CwigCet9YXaSG/Ehh7ew3L+ta4M2EZ4bPNm+mx52YZq0JzW9o0aSqBy48SF9QYsX6SeYscYFWcsKsJc1vB7mqGSzLEzRpwN0yGjGZ+TrTPbibIS4lqruuesgqP3rjiJTSP1EE2q/ssnxkmF2x/c2bA9THVJCHrDOnfZZtvJv52YEqb1wrNsbz/+CZ2HKN6XRd
x-ms-exchange-transport-forked: True
Content-ID: <0B4CE28FE59D03478E7928925ADC45CF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 865389df-c934-43bf-6c0b-08d801e02b3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 01:49:18.0234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DUk2p1hviDKW+6GzKpgB0G9sLyFFroFnf26A5BjGh/dtabMzwDgYBgNb/TSqIZdgTHp4gSVGT89JK7PWdN9asQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2632
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_184944_063794_FBD53F3D 
X-CRM114-Status: GOOD (  12.20  )
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
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 5/14/20 5:45 PM, Vineet Gupta via Libc-alpha wrote:
> On 5/4/20 2:21 PM, Vineet Gupta wrote:
>> On 4/22/20 6:41 PM, Vineet Gupta wrote:
>>> Hi,
>>>
>>> This patchset implements glibc port to ARC HS48x processor from Synopsys.
>>
>> ping !
> 
> ping ^2
> 
> I have rebased and adjusted the v6 patch for semaphore header unification. Would
> appreciate more technincal review.

ping ^3

Hello list,

Can some of you please review this patchset. The only comment I got on v6 so far
was for a common semaphore header which is merged upstream (and dropped from ARC
port). I'm wating for some more technical feedback before posting v7 (and
hopefully Alistair's sysvipc code is also accepted/merged by that point)

Thx,
-Vineet

>>> This still needs a couple of inflight 64-time, offset patches.
>>>
>>> git@github.com:foss-for-synopsys-dwc-arc-processors/glibc.git  upstream-v6
>>>
>>> v6:
>>>    * Dropped 11/14: merged upstream
>>>    * _FPU_SETS() inline asm reworked
>>>    * Introduce fixup-asm-unistd.h to elide 32-bit time, offset syscalls and
>>>      regenerate arch-syscall.h
>>>    * Fix snafu in updating build-many-glibcs for ARC
>>>    * More code sytle fixes flagged by Joseph
>>> v5:
>>>    * Big Endian formally supported as multi-ABI
>>>    * Removed code for ARC700 processors
>>>    * Hard-float code updates: fegetmode, fesetround, feupdateenv
>>>    * socket-constant.h update for 64-bit ABI spun off as standalone patch
>>>    * __syscall_error made glibc_private
>>>    * math ulps regen
>>>    * gmp-mparam.h removed
>>>    * lint fixes as flagged by Joseph
>>> v4:
>>>    * Dropped 1/17: Merged upstream
>>>    * Dropped 17/17:
>>>        - 64-bit time/offset code chunked up into respective patches
>>>    * sysctl removed
>>>    * Updated README for arc gnu triplet
>>>    * Updated install files for ARC gcc/binutils requirements
>>>    * Updated NEWS with brief ISA/ABI info
>>>
>>> v3:
>>>    * Support for Hardware Floating Point
>>>    * 64-bit time and offsets ABI (although all such changes are confined
>>>      to a single patch)
>>>
>>> v5: https://sourceware.org/pipermail/libc-alpha/2020-April/112657.html
>>> v4: https://sourceware.org/pipermail/libc-alpha/2020-March/111855.html
>>> v3: https://sourceware.org/legacy-ml/libc-alpha/2020-03/msg00167.html
>>> v2: https://sourceware.org/legacy-ml/libc-alpha/2019-01/msg00681.html
>>> v1: https://sourceware.org/legacy-ml/libc-alpha/2018-12/msg00678.html
>>>
>>> Documentation:
>>> --------------
>>>
>>> (a) ABI doc:
>>> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/wiki/files/ARCv2_ABI.pdf
>>>
>>> (b) Programmer's Reference Manual (PRM) : needs a download request to be filled
>>> https://www.synopsys.com/dw/ipdir.php?ds=arc-hs44-hs46-hs48
>>> https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-HS.pdf
>>>
>>> Test Results:
>>> --------------
>>> (a) build-many-glibcs.py
>>>
>>> | Summary of test results:
>>> |   1251 PASS
>>> |     15 XFAIL
>>>
>>>
>>> (b) Full testsuite ran in a cross compile setup using buildroot on HSDK development
>>>     platform. Bulk of failures come from cross testing setup and I
>>>     intend to improve things with native testing going forward.
>>>
>>> | Summary of test results:
>>> |     30 FAIL   (-3)
>>> |
>>> | FAIL: csu/test-as-const-tcb-offsets
>>> + FAIL: elf/tst-audit14
>>> + FAIL: elf/tst-audit15
>>> + FAIL: elf/tst-audit16
>>> | FAIL: elf/tst-ldconfig-ld_so_conf-update # not true: dlopen
>>> | FAIL: iconv/test-iconvconfig		# Needs gconv installed
>>> - FAIL: iconv/tst-gconv-init-failure
>>> | FAIL: io/ftwtest			# Requires execution by non-root
>>> - FAIL: io/tst-futimesat
>>> | FAIL: io/tst-lockf
>>> | FAIL: libio/tst-wfile-sync
>>> | FAIL: locale/tst-C-locale
>>> | FAIL: locale/tst-duplocale
>>> | FAIL: locale/tst-locale-locpath
>>> | FAIL: locale/tst-locname
>>> | FAIL: localedata/sort-test
>>> | FAIL: nptl/test-cond-printers		# needs Python3 and target GDB on target
>>> | FAIL: nptl/test-condattr-printers	#    ditto
>>> | FAIL: nptl/test-mutex-printers	#    ditto
>>> | FAIL: nptl/test-mutexattr-printers	#    ditto
>>> | FAIL: nptl/test-rwlock-printers	#    ditto
>>> | FAIL: nptl/test-rwlockattr-printers	#    ditto
>>> | FAIL: nptl/tst-umask1			# passes if run natively on target (NFS ACLv3 support needed)
>>> | FAIL: nss/bug-erange
>>> | FAIL: nss/tst-nss-files-hosts-getent	# Timed out
>>> | FAIL: nss/tst-nss-files-hosts-multi	# Timed out
>>> | FAIL: posix/bug-ga2			# DNS issue: google DNS vs. SNPS
>>> | FAIL: posix/globtest			# require same user on target and host
>>> | FAIL: posix/tst-getaddrinfo5		# passes outside corporate network
>>> - FAIL: resolv/tst-resolv-basic
>>> - FAIL: resolv/tst-resolv-edns
>>> - FAIL: resolv/tst-resolv-rotate
>>> - FAIL: resolv/tst-resolv-search
>>> | FAIL: stdio-common/bug22		# Needs more RAM: 2 GB memory
>>> | FAIL: sunrpc/bug20790			# missing cpp on target
>>> | FAIL: timezone/tst-tzset		# passes outside corporate network
>>>
>>>
>>> kindly review.
>>>
>>> Thx,
>>> -Vineet
>>>
>>> Vineet Gupta (13):
>>>   ARC: ABI Implementation
>>>   ARC: startup and dynamic linking code
>>>   ARC: Thread Local Storage support
>>>   ARC: Atomics and Locking primitives
>>>   ARC: math soft float support
>>>   ARC: hardware floating point support
>>>   ARC: Linux Syscall Interface
>>>   ARC: Linux ABI
>>>   ARC: Linux Startup and Dynamic Loading
>>>   ARC: ABI lists
>>>   ARC: Build Infrastructure
>>>   build-many-glibcs.py: Enable ARC builds
>>>   Documentation for ARC port
>>>
>>>  NEWS                                          |    9 +
>>>  README                                        |    1 +
>>>  config.h.in                                   |    3 +
>>>  manual/install.texi                           |    4 +
>>>  scripts/build-many-glibcs.py                  |   10 +
>>>  sysdeps/arc/Implies                           |    3 +
>>>  sysdeps/arc/Makefile                          |   21 +
>>>  sysdeps/arc/Versions                          |    8 +
>>>  sysdeps/arc/__longjmp.S                       |   50 +
>>>  sysdeps/arc/abort-instr.h                     |    2 +
>>>  sysdeps/arc/atomic-machine.h                  |   69 +
>>>  sysdeps/arc/bits/endianness.h                 |   15 +
>>>  sysdeps/arc/bits/fenv.h                       |   77 +
>>>  sysdeps/arc/bits/link.h                       |   52 +
>>>  sysdeps/arc/bits/setjmp.h                     |   26 +
>>>  sysdeps/arc/bsd-_setjmp.S                     |    1 +
>>>  sysdeps/arc/bsd-setjmp.S                      |    1 +
>>>  sysdeps/arc/configure                         |  182 ++
>>>  sysdeps/arc/configure.ac                      |   26 +
>>>  sysdeps/arc/dl-machine.h                      |  340 +++
>>>  sysdeps/arc/dl-runtime.c                      |   33 +
>>>  sysdeps/arc/dl-sysdep.h                       |   25 +
>>>  sysdeps/arc/dl-tls.h                          |   30 +
>>>  sysdeps/arc/dl-trampoline.S                   |   80 +
>>>  sysdeps/arc/entry.h                           |    5 +
>>>  sysdeps/arc/fpu/e_sqrt.c                      |   27 +
>>>  sysdeps/arc/fpu/e_sqrtf.c                     |   27 +
>>>  sysdeps/arc/fpu/fclrexcpt.c                   |   36 +
>>>  sysdeps/arc/fpu/fegetenv.c                    |   37 +
>>>  sysdeps/arc/fpu/fegetmode.c                   |   31 +
>>>  sysdeps/arc/fpu/fegetround.c                  |   32 +
>>>  sysdeps/arc/fpu/feholdexcpt.c                 |   43 +
>>>  sysdeps/arc/fpu/fesetenv.c                    |   48 +
>>>  sysdeps/arc/fpu/fesetexcept.c                 |   32 +
>>>  sysdeps/arc/fpu/fesetmode.c                   |   40 +
>>>  sysdeps/arc/fpu/fesetround.c                  |   40 +
>>>  sysdeps/arc/fpu/feupdateenv.c                 |   51 +
>>>  sysdeps/arc/fpu/fgetexcptflg.c                |   31 +
>>>  sysdeps/arc/fpu/fraiseexcpt.c                 |   39 +
>>>  sysdeps/arc/fpu/fsetexcptflg.c                |   38 +
>>>  sysdeps/arc/fpu/ftestexcept.c                 |   33 +
>>>  sysdeps/arc/fpu/libm-test-ulps                | 1140 +++++++++
>>>  sysdeps/arc/fpu/libm-test-ulps-name           |    1 +
>>>  sysdeps/arc/fpu/s_fma.c                       |   28 +
>>>  sysdeps/arc/fpu/s_fmaf.c                      |   28 +
>>>  sysdeps/arc/fpu_control.h                     |  106 +
>>>  sysdeps/arc/gccframe.h                        |   21 +
>>>  sysdeps/arc/get-rounding-mode.h               |   38 +
>>>  sysdeps/arc/jmpbuf-offsets.h                  |   47 +
>>>  sysdeps/arc/jmpbuf-unwind.h                   |   47 +
>>>  sysdeps/arc/ldsodefs.h                        |   43 +
>>>  sysdeps/arc/libc-tls.c                        |   27 +
>>>  sysdeps/arc/machine-gmon.h                    |   35 +
>>>  sysdeps/arc/math-tests-trap.h                 |   27 +
>>>  sysdeps/arc/memusage.h                        |   23 +
>>>  sysdeps/arc/nofpu/Implies                     |    1 +
>>>  sysdeps/arc/nofpu/libm-test-ulps              |  270 +++
>>>  sysdeps/arc/nofpu/libm-test-ulps-name         |    1 +
>>>  sysdeps/arc/nofpu/math-tests-exceptions.h     |   27 +
>>>  sysdeps/arc/nofpu/math-tests-rounding.h       |   27 +
>>>  sysdeps/arc/nptl/Makefile                     |   22 +
>>>  sysdeps/arc/nptl/bits/semaphore.h             |   32 +
>>>  sysdeps/arc/nptl/pthreaddef.h                 |   32 +
>>>  sysdeps/arc/nptl/tcb-offsets.sym              |   11 +
>>>  sysdeps/arc/nptl/tls.h                        |  150 ++
>>>  sysdeps/arc/preconfigure                      |   14 +
>>>  sysdeps/arc/setjmp.S                          |   66 +
>>>  sysdeps/arc/sfp-machine.h                     |   73 +
>>>  sysdeps/arc/sotruss-lib.c                     |   51 +
>>>  sysdeps/arc/stackinfo.h                       |   33 +
>>>  sysdeps/arc/start.S                           |   74 +
>>>  sysdeps/arc/sysdep.h                          |   48 +
>>>  sysdeps/arc/tininess.h                        |    1 +
>>>  sysdeps/arc/tls-macros.h                      |   47 +
>>>  sysdeps/arc/tst-audit.h                       |   23 +
>>>  sysdeps/unix/sysv/linux/arc/Implies           |    3 +
>>>  sysdeps/unix/sysv/linux/arc/Makefile          |   29 +
>>>  sysdeps/unix/sysv/linux/arc/Versions          |   16 +
>>>  sysdeps/unix/sysv/linux/arc/arch-syscall.h    |  303 +++
>>>  sysdeps/unix/sysv/linux/arc/bits/procfs.h     |   35 +
>>>  sysdeps/unix/sysv/linux/arc/bits/timesize.h   |   21 +
>>>  .../sysv/linux/arc/bits/types/__sigset_t.h    |   12 +
>>>  sysdeps/unix/sysv/linux/arc/c++-types.data    |   67 +
>>>  sysdeps/unix/sysv/linux/arc/clone.S           |   98 +
>>>  sysdeps/unix/sysv/linux/arc/configure         |    4 +
>>>  sysdeps/unix/sysv/linux/arc/configure.ac      |    4 +
>>>  sysdeps/unix/sysv/linux/arc/dl-static.c       |   84 +
>>>  .../unix/sysv/linux/arc/fixup-asm-unistd.h    |   41 +
>>>  sysdeps/unix/sysv/linux/arc/getcontext.S      |   63 +
>>>  sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h  |    6 +
>>>  sysdeps/unix/sysv/linux/arc/kernel-features.h |   28 +
>>>  sysdeps/unix/sysv/linux/arc/kernel_stat.h     |   26 +
>>>  sysdeps/unix/sysv/linux/arc/ld.abilist        |    5 +
>>>  sysdeps/unix/sysv/linux/arc/ldconfig.h        |   27 +
>>>  sysdeps/unix/sysv/linux/arc/ldsodefs.h        |   32 +
>>>  .../sysv/linux/arc/libBrokenLocale.abilist    |    1 +
>>>  sysdeps/unix/sysv/linux/arc/libanl.abilist    |    4 +
>>>  sysdeps/unix/sysv/linux/arc/libc.abilist      | 2082 +++++++++++++++++
>>>  sysdeps/unix/sysv/linux/arc/libcrypt.abilist  |    2 +
>>>  sysdeps/unix/sysv/linux/arc/libdl.abilist     |    9 +
>>>  sysdeps/unix/sysv/linux/arc/libm.abilist      |  699 ++++++
>>>  .../unix/sysv/linux/arc/libpthread.abilist    |  216 ++
>>>  sysdeps/unix/sysv/linux/arc/libresolv.abilist |   79 +
>>>  sysdeps/unix/sysv/linux/arc/librt.abilist     |   35 +
>>>  .../unix/sysv/linux/arc/libthread_db.abilist  |   40 +
>>>  sysdeps/unix/sysv/linux/arc/libutil.abilist   |    6 +
>>>  sysdeps/unix/sysv/linux/arc/localplt.data     |   12 +
>>>  sysdeps/unix/sysv/linux/arc/makecontext.c     |   73 +
>>>  sysdeps/unix/sysv/linux/arc/mmap_internal.h   |   27 +
>>>  sysdeps/unix/sysv/linux/arc/pt-vfork.S        |    1 +
>>>  sysdeps/unix/sysv/linux/arc/setcontext.S      |   92 +
>>>  sysdeps/unix/sysv/linux/arc/shlib-versions    |    7 +
>>>  sysdeps/unix/sysv/linux/arc/sigaction.c       |   31 +
>>>  sysdeps/unix/sysv/linux/arc/sigcontextinfo.h  |   28 +
>>>  sysdeps/unix/sysv/linux/arc/sigrestorer.S     |   29 +
>>>  sysdeps/unix/sysv/linux/arc/swapcontext.S     |   92 +
>>>  sysdeps/unix/sysv/linux/arc/sys/cachectl.h    |   36 +
>>>  sysdeps/unix/sysv/linux/arc/sys/ucontext.h    |   61 +
>>>  sysdeps/unix/sysv/linux/arc/sys/user.h        |   31 +
>>>  sysdeps/unix/sysv/linux/arc/syscall.S         |   33 +
>>>  sysdeps/unix/sysv/linux/arc/syscalls.list     |    3 +
>>>  sysdeps/unix/sysv/linux/arc/sysctl.mk         |    1 +
>>>  sysdeps/unix/sysv/linux/arc/sysdep.c          |   33 +
>>>  sysdeps/unix/sysv/linux/arc/sysdep.h          |  224 ++
>>>  sysdeps/unix/sysv/linux/arc/ucontext-macros.h |   29 +
>>>  sysdeps/unix/sysv/linux/arc/ucontext_i.sym    |   20 +
>>>  sysdeps/unix/sysv/linux/arc/vfork.S           |   42 +
>>>  127 files changed, 9254 insertions(+)
>>>  create mode 100644 sysdeps/arc/Implies
>>>  create mode 100644 sysdeps/arc/Makefile
>>>  create mode 100644 sysdeps/arc/Versions
>>>  create mode 100644 sysdeps/arc/__longjmp.S
>>>  create mode 100644 sysdeps/arc/abort-instr.h
>>>  create mode 100644 sysdeps/arc/atomic-machine.h
>>>  create mode 100644 sysdeps/arc/bits/endianness.h
>>>  create mode 100644 sysdeps/arc/bits/fenv.h
>>>  create mode 100644 sysdeps/arc/bits/link.h
>>>  create mode 100644 sysdeps/arc/bits/setjmp.h
>>>  create mode 100644 sysdeps/arc/bsd-_setjmp.S
>>>  create mode 100644 sysdeps/arc/bsd-setjmp.S
>>>  create mode 100644 sysdeps/arc/configure
>>>  create mode 100644 sysdeps/arc/configure.ac
>>>  create mode 100644 sysdeps/arc/dl-machine.h
>>>  create mode 100644 sysdeps/arc/dl-runtime.c
>>>  create mode 100644 sysdeps/arc/dl-sysdep.h
>>>  create mode 100644 sysdeps/arc/dl-tls.h
>>>  create mode 100644 sysdeps/arc/dl-trampoline.S
>>>  create mode 100644 sysdeps/arc/entry.h
>>>  create mode 100644 sysdeps/arc/fpu/e_sqrt.c
>>>  create mode 100644 sysdeps/arc/fpu/e_sqrtf.c
>>>  create mode 100644 sysdeps/arc/fpu/fclrexcpt.c
>>>  create mode 100644 sysdeps/arc/fpu/fegetenv.c
>>>  create mode 100644 sysdeps/arc/fpu/fegetmode.c
>>>  create mode 100644 sysdeps/arc/fpu/fegetround.c
>>>  create mode 100644 sysdeps/arc/fpu/feholdexcpt.c
>>>  create mode 100644 sysdeps/arc/fpu/fesetenv.c
>>>  create mode 100644 sysdeps/arc/fpu/fesetexcept.c
>>>  create mode 100644 sysdeps/arc/fpu/fesetmode.c
>>>  create mode 100644 sysdeps/arc/fpu/fesetround.c
>>>  create mode 100644 sysdeps/arc/fpu/feupdateenv.c
>>>  create mode 100644 sysdeps/arc/fpu/fgetexcptflg.c
>>>  create mode 100644 sysdeps/arc/fpu/fraiseexcpt.c
>>>  create mode 100644 sysdeps/arc/fpu/fsetexcptflg.c
>>>  create mode 100644 sysdeps/arc/fpu/ftestexcept.c
>>>  create mode 100644 sysdeps/arc/fpu/libm-test-ulps
>>>  create mode 100644 sysdeps/arc/fpu/libm-test-ulps-name
>>>  create mode 100644 sysdeps/arc/fpu/s_fma.c
>>>  create mode 100644 sysdeps/arc/fpu/s_fmaf.c
>>>  create mode 100644 sysdeps/arc/fpu_control.h
>>>  create mode 100644 sysdeps/arc/gccframe.h
>>>  create mode 100644 sysdeps/arc/get-rounding-mode.h
>>>  create mode 100644 sysdeps/arc/jmpbuf-offsets.h
>>>  create mode 100644 sysdeps/arc/jmpbuf-unwind.h
>>>  create mode 100644 sysdeps/arc/ldsodefs.h
>>>  create mode 100644 sysdeps/arc/libc-tls.c
>>>  create mode 100644 sysdeps/arc/machine-gmon.h
>>>  create mode 100644 sysdeps/arc/math-tests-trap.h
>>>  create mode 100644 sysdeps/arc/memusage.h
>>>  create mode 100644 sysdeps/arc/nofpu/Implies
>>>  create mode 100644 sysdeps/arc/nofpu/libm-test-ulps
>>>  create mode 100644 sysdeps/arc/nofpu/libm-test-ulps-name
>>>  create mode 100644 sysdeps/arc/nofpu/math-tests-exceptions.h
>>>  create mode 100644 sysdeps/arc/nofpu/math-tests-rounding.h
>>>  create mode 100644 sysdeps/arc/nptl/Makefile
>>>  create mode 100644 sysdeps/arc/nptl/bits/semaphore.h
>>>  create mode 100644 sysdeps/arc/nptl/pthreaddef.h
>>>  create mode 100644 sysdeps/arc/nptl/tcb-offsets.sym
>>>  create mode 100644 sysdeps/arc/nptl/tls.h
>>>  create mode 100644 sysdeps/arc/preconfigure
>>>  create mode 100644 sysdeps/arc/setjmp.S
>>>  create mode 100644 sysdeps/arc/sfp-machine.h
>>>  create mode 100644 sysdeps/arc/sotruss-lib.c
>>>  create mode 100644 sysdeps/arc/stackinfo.h
>>>  create mode 100644 sysdeps/arc/start.S
>>>  create mode 100644 sysdeps/arc/sysdep.h
>>>  create mode 100644 sysdeps/arc/tininess.h
>>>  create mode 100644 sysdeps/arc/tls-macros.h
>>>  create mode 100644 sysdeps/arc/tst-audit.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/Implies
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/Makefile
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/Versions
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/arch-syscall.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/bits/procfs.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/bits/timesize.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/bits/types/__sigset_t.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/c++-types.data
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/clone.S
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/configure
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/configure.ac
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/dl-static.c
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/fixup-asm-unistd.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/getcontext.S
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/kernel-features.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/kernel_stat.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/ld.abilist
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/ldconfig.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/ldsodefs.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libanl.abilist
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libc.abilist
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libcrypt.abilist
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libdl.abilist
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libm.abilist
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libpthread.abilist
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libresolv.abilist
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/librt.abilist
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libthread_db.abilist
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libutil.abilist
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/localplt.data
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/makecontext.c
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/mmap_internal.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/pt-vfork.S
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/setcontext.S
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/shlib-versions
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sigaction.c
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sigcontextinfo.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sigrestorer.S
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/swapcontext.S
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sys/cachectl.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sys/ucontext.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sys/user.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/syscall.S
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/syscalls.list
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sysctl.mk
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.c
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext-macros.h
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext_i.sym
>>>  create mode 100644 sysdeps/unix/sysv/linux/arc/vfork.S
>>>
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
