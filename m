Return-Path: <SRS0=/nRw=AM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DA7C433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 00:11:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F30D20722
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 00:11:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TgCrebew";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PctPwGag";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iSvN5Mkq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F30D20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M7CHMEZkWmkGHLfBpLvwIzHLjxOi2VBh1Sc20DwLxGo=; b=TgCrebew1AEzLLcocQXqsShEi
	co+jC9fAQw2S5XksNX8EUZ69iei13dy2LwAvqNQO+NB3DZcKltmkhX9cvgLgRddKmT7fc4I33RPRr
	5Uxd4QFgMXujXx4t1GeN8vNI9u4KAEmd+wr0M0UMAsPKgaTGEWPWw+dZ6sCMypobIIBnExUtIvhFH
	R2AeEKkPTPTVdkSUssSoptMyB8zxfg9gwjz5btClvyh4gj/QrVrqglJ0qyUua++PtysHDRtOBWHbe
	cgXr/xvyMifaYOvX4kt94LE8pPJLorcHgVYHmRHfpYjYZL9pN94L5om5LVKzMON74oveWbkbV/CVs
	PnZMqrVhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqQLy-0005ia-TU; Wed, 01 Jul 2020 00:11:54 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqQLu-0005hp-18
 for linux-snps-arc@lists.infradead.org; Wed, 01 Jul 2020 00:11:53 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DBEF440162;
 Wed,  1 Jul 2020 00:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593562309; bh=azGQMZtK6Lj+97HM0rb+kks6zkF9m/OaHUZ2plTosLo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=PctPwGagtEls3oIng4xOV0YRdTpb6cRq734yKAzWiDQAzLNtcw1McnEYalFiTIkjF
 vIMNSgDjPnqU/oPW7ANMqBBufr7FIl8vBuQ4y1nCAWAV2zRhgebPy2jNX2RajyvmlY
 ozp15K2YOwdr6eNZeInmbCchQA8+5FPTVa7FlDHdZ2AJMJ4bxMEuqGDINqD9GORZNB
 eOCNm9Nl6MrtZSEEE6qOwTXO8I2x5NdPtbhFFX6RyYV6bjEctgjnMGf/R8y2GLsk7G
 +tr0WIAJj9fnkcFMkgt/7JBOTCXzK85OwtwaVd3NPhpX6pOdl3KFjZul/emDI59gcm
 xYnV9s0Hp/GXA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 08995A0067;
 Wed,  1 Jul 2020 00:11:46 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5872B80056;
 Wed,  1 Jul 2020 00:11:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="iSvN5Mkq";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NA42ruJW7IFy7RO6sEkjTNNxoA2P1DBo+2m9N1T3QdSvzEwLfs6h8cN1GPfhRT6krb/2dU5VWE2kcFGRjuDJGZ1rOjdE6HJoVzCVwxiJw2yvWWJ1mFvQ8RB5Q4KXY9qhOMlMYJOK+tid5Wng4h2dlpt83i3jqwWJOEO/MYlMj0aGFw2eDqSQ7xonAreVbqNDtNay1408Tl3d+Q2XYpLEsfJeWDWcPn6xKjJnmjHiQp89bsBC3Q5R8I8S5LBTZReL8H9tHk3lA60+hjd6Fr2PsHr401xwvPWOy0m/t2iLG4PzP/o+4+BUunDVyJRUI47ygY81mFM1gLfdJkmOf5B+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azGQMZtK6Lj+97HM0rb+kks6zkF9m/OaHUZ2plTosLo=;
 b=U4wyRIaGv1kiVYEVyThysiykJLyj8fOw6K1dYrtTFtgKN4/El6bLfC8ngFLjQvSGXOu150n0XG8MVsXA8KwAsYhJaB4+LWi98d+dcC8wgiQYSWyza2qmE7rTQuV2xBwFNBWXQpd7anWem5HKaLD87nnOsY7cETWJl4Myz1GijKObx89/hG4hGwPThDc2Cc1IUrpGf/sIqgH8bJsweYixdyme3J/uH9byHsL3jDGLkS5cfAWBxnm/h+G9dUXunhWDpwT1/WTc25HV3ElsPpgn793ahq9aJAfqhfPPr9S6d6gP5Fgfq6WjCED0pHKqRowWfT8fnY7F2yaw9eFs7fIDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azGQMZtK6Lj+97HM0rb+kks6zkF9m/OaHUZ2plTosLo=;
 b=iSvN5MkqslYIO+baV7sxbPBJWW3nhsA4yZ5eeE+/vzwQaHIqj2fg4O7HwzmYDGL3bnDmU3w5IZOWdo0Oh/llDhhuozOhuyQSer0U+e4kV7dwMo2hpsJtiRDQvCuMj6JRbcng6jVWyCwnLavmISd8IHYeAatJ8X4/g1J9sycSv5c=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4018.namprd12.prod.outlook.com (2603:10b6:a03:1a7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Wed, 1 Jul
 2020 00:11:42 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3153.020; Wed, 1 Jul 2020
 00:11:42 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v7 00/13] glibc port to ARC processors
Thread-Topic: [PATCH v7 00/13] glibc port to ARC processors
Thread-Index: AQHWTzwytpRooBUOGkq98kzaMNWkFw==
Date: Wed, 1 Jul 2020 00:11:41 +0000
Message-ID: <a3afd7ef-87d9-f033-fea3-f4854b9188ef@synopsys.com>
References: <20200615201441.31820-1-vgupta@synopsys.com>
 <c5edd9af-9dc6-d572-4779-6897e43c0a31@synopsys.com>
In-Reply-To: <c5edd9af-9dc6-d572-4779-6897e43c0a31@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: sourceware.org; dkim=none (message not signed)
 header.d=none;sourceware.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 775ec8f6-cf58-4c18-fa93-08d81d535522
x-ms-traffictypediagnostic: BY5PR12MB4018:
x-microsoft-antispam-prvs: <BY5PR12MB4018C98F70FD6B13AE26B71DB66C0@BY5PR12MB4018.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oYI00F/+GVx3Qzube6XjG0QxjzR00BrLctC75dWyosFWsX2A5z+H5lVx/bkSPOhnqeiXKn3NWh7cAYrx+lYy0j5AXENqUQb8p2XQ+F/CW+GCKVdvmGBX2ItGyihBKAJaeTLomSDKi/vSKTGUUCTwyI6nbvYnl5JqirX+r7aO5fkDm/1rThGP6ATwBNlPPVKsksQip10T55PXddortZIBe+9M1yZOwWT36MLJkysqDA3y2561JxKbbCnb/+JUAeJgW6T/IvU9uyLWV37w4cNKi5C3KwC3FSBBqPfdjrtIFA0FFDJEEJDWUWcuknJJw3Jf7NzJp9KBbb531JNX3gyHcbhfd36NCVMY5JZhnRyoc2pDQvFNcZlGxDiEitx8+jiwHOnikFIc2ZnFfkhjm6FafUlRc1+eAntsy9xZj9XubqfO+/f8zbffE74yVQdJGKg6nOfYiGuDMnd+kgK34DaIXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(366004)(396003)(346002)(39860400002)(2906002)(71200400001)(26005)(966005)(186003)(54906003)(36756003)(53546011)(31696002)(6916009)(6506007)(2616005)(86362001)(6512007)(66946007)(66476007)(66556008)(64756008)(66446008)(83380400001)(76116006)(4326008)(316002)(31686004)(6486002)(5660300002)(478600001)(8676002)(16799955002)(30864003)(8936002)(43740500002)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Tx68jnBiOIezAQr6ew9sT3Of/P2UPCe48uTMs0Baq5NQrKpuUmIHdJwD0SRRhCjTkQvbCKTslrIRWBU+kftDVNKinNJyCoCqp/6eW9TokB4CGXOSvCboA4tMFZKn0NGVGBzazdiCoYacqo7pPj3o5NlyalgxHVS+cRH/oqn1WZrAqbqkh/uDnvz1YN7HaX7L7nABprkieUtDmbgyecV3O2Pp7ibO9s5DelGiMwwee1TU4hhaaPioNaCEEWcXhGwtvGqOYeL6reFYncwQ83U1I2ff1yXjDe8MWw/9sFz+g5ZXQK1PnYPIHrJ2vQndFbpLvy69SsdC7rH/+3CJPHrj6+BIPqryq0WIdE3jh7X4daSpaXwvwqnlTUv3qXoUiN3en8I/TrwTDI93Hn3e6R8ibXEuMkDyjC0+Gz9AyxAEF5TDq+j7MvBZdc+valqooTqCuPXmwJAyHqTlWcQOiskV7OHW8jGtiNpuqKrmLIwedMg=
x-ms-exchange-transport-forked: True
Content-ID: <C6729C549025C54B99C603C5262FEA63@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 775ec8f6-cf58-4c18-fa93-08d81d535522
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 00:11:41.8403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3+zBZjTtfqiGd6R1w3fyKAIJp5thVX/Qbq8+Diw1yJHnFi+g3HNV7IiqCjBbO8YUM4a1PkFk9QgKL4sOZdn1WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_201150_392753_278A887E 
X-CRM114-Status: GOOD (  15.49  )
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
Cc: Carlos O'Donell <carlos@redhat.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/23/20 9:56 AM, Vineet Gupta via Libc-alpha wrote:
> On 6/15/20 1:14 PM, Vineet Gupta wrote:
>> Hi,
>>
>> This patchset implements glibc port to ARC HS48x processor from Synopsys.
> 
> ping !

ping ^2 !

I've posted the incremental series (v7.1) as a followup to include rebase fixes
since v7. The changes are minimal and documented in respective patches. Kindly
review so we can get this in, in this cycle.

Thx,
-Vineet

> 
>>
>> git@github.com:foss-for-synopsys-dwc-arc-processors/glibc.git  upstream-v7
>>
>> v7:
>>    * Addresses review comments from Adhemerval Zanella and Florian
>>      Weimer (many thx to you both)
>>    * Dropped ARC specific semaphore.h (following upstream 1270fbaaeebe)
>>    * ARC specific dl-runtime.h (following upstream 8dbb7a08ec52)
>>    * ARC specific math-use-builtins.h and dropped ARC specific sqrt/fma
>>      routines (math-use-builtins.h will be disintegrated once done upstream)
>>    * setjmp/longjmp to save GP, no need to save r25 (thread pointer)
>>    * makecontext/startcontext use r14/r15 (vs. r13/r14)
>>    * flatten out register file in mcontext_t (remove scratch/callee)
>>    * Use of 'C' comments in asm code, LDR/STR macros
>>    * Use of L (..) in asm code
>>    * Dropped asm global register r25 specification for thread pointer
>>      and rely on __builtin_thread_pointer
>>    * NEWS update rewording
>>    * Sweeping update of Copyright year 2020
>> v6:
>>    * Dropped 11/14: merged upstream
>>    * _FPU_SETS() inline asm reworked
>>    * Introduce fixup-asm-unistd.h to elide 32-bit time, offset syscalls and
>>      regenerate arch-syscall.h
>>    * Fix snafu in updating build-many-glibcs for ARC
>>    * More code sytle fixes flagged by Joseph
>> v5:
>>    * Big Endian formally supported as multi-ABI
>>    * Removed code for ARC700 processors
>>    * Hard-float code updates: fegetmode, fesetround, feupdateenv
>>    * socket-constant.h update for 64-bit ABI spun off as standalone patch
>>    * __syscall_error made glibc_private
>>    * math ulps regen
>>    * gmp-mparam.h removed
>>    * lint fixes as flagged by Joseph
>> v4:
>>    * Dropped 1/17: Merged upstream
>>    * Dropped 17/17:
>>        - 64-bit time/offset code chunked up into respective patches
>>    * sysctl removed
>>    * Updated README for arc gnu triplet
>>    * Updated install files for ARC gcc/binutils requirements
>>    * Updated NEWS with brief ISA/ABI info
>>
>> v3:
>>    * Support for Hardware Floating Point
>>    * 64-bit time and offsets ABI (although all such changes are confined
>>      to a single patch)
>>
>> v5: https://sourceware.org/pipermail/libc-alpha/2020-April/112657.html
>> v4: https://sourceware.org/pipermail/libc-alpha/2020-March/111855.html
>> v3: https://sourceware.org/legacy-ml/libc-alpha/2020-03/msg00167.html
>> v2: https://sourceware.org/legacy-ml/libc-alpha/2019-01/msg00681.html
>> v1: https://sourceware.org/legacy-ml/libc-alpha/2018-12/msg00678.html
>>
>> Documentation:
>> --------------
>>
>> (a) ABI doc:
>> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/wiki/files/ARCv2_ABI.pdf
>>
>> (b) Programmer's Reference Manual (PRM) : needs a download request to be filled
>> https://www.synopsys.com/dw/ipdir.php?ds=arc-hs44-hs46-hs48
>> https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-HS.pdf
>>
>> Test Results:
>> --------------
>> (a) build-many-glibcs.py
>>
>> | Summary of test results:
>> |   1251 PASS
>> |     15 XFAIL
>>
>>
>> (b) Full testsuite ran in a cross compile setup using buildroot on HSDK development
>>     platform. Bulk of failures come from cross testing setup and I
>>     intend to improve things with native testing going forward.
>>
>> | Summary of test results:
>> |     30 FAIL   (-3)
>> |
>> | FAIL: csu/test-as-const-tcb-offsets
>> + FAIL: elf/tst-audit14
>> + FAIL: elf/tst-audit15
>> + FAIL: elf/tst-audit16
>> | FAIL: elf/tst-ldconfig-ld_so_conf-update # not true: dlopen
>> | FAIL: iconv/test-iconvconfig		# Needs gconv installed
>> - FAIL: iconv/tst-gconv-init-failure
>> | FAIL: io/ftwtest			# Requires execution by non-root
>> - FAIL: io/tst-futimesat
>> | FAIL: io/tst-lockf
>> | FAIL: libio/tst-wfile-sync
>> | FAIL: locale/tst-C-locale
>> | FAIL: locale/tst-duplocale
>> | FAIL: locale/tst-locale-locpath
>> | FAIL: locale/tst-locname
>> | FAIL: localedata/sort-test
>> | FAIL: nptl/test-cond-printers		# needs Python3 and target GDB on target
>> | FAIL: nptl/test-condattr-printers	#    ditto
>> | FAIL: nptl/test-mutex-printers	#    ditto
>> | FAIL: nptl/test-mutexattr-printers	#    ditto
>> | FAIL: nptl/test-rwlock-printers	#    ditto
>> | FAIL: nptl/test-rwlockattr-printers	#    ditto
>> | FAIL: nptl/tst-umask1			# passes if run natively on target (NFS ACLv3 support needed)
>> | FAIL: nss/bug-erange
>> | FAIL: nss/tst-nss-files-hosts-getent	# Timed out
>> | FAIL: nss/tst-nss-files-hosts-multi	# Timed out
>> | FAIL: posix/bug-ga2			# DNS issue: google DNS vs. SNPS
>> | FAIL: posix/globtest			# require same user on target and host
>> | FAIL: posix/tst-getaddrinfo5		# passes outside corporate network
>> - FAIL: resolv/tst-resolv-basic
>> - FAIL: resolv/tst-resolv-edns
>> - FAIL: resolv/tst-resolv-rotate
>> - FAIL: resolv/tst-resolv-search
>> | FAIL: stdio-common/bug22		# Needs more RAM: 2 GB memory
>> | FAIL: sunrpc/bug20790			# missing cpp on target
>> | FAIL: timezone/tst-tzset		# passes outside corporate network
>>
>>
>> kindly review.
>>
>> Thx,
>> -Vineet
>>
>> Vineet Gupta (13):
>>   ARC: ABI Implementation
>>   ARC: startup and dynamic linking code
>>   ARC: Thread Local Storage support
>>   ARC: Atomics and Locking primitives
>>   ARC: math soft float support
>>   ARC: hardware floating point support
>>   ARC: Linux Syscall Interface
>>   ARC: Linux ABI
>>   ARC: Linux Startup and Dynamic Loading
>>   ARC: ABI lists
>>   ARC: Build Infrastructure
>>   build-many-glibcs.py: Enable ARC builds
>>   Documentation for ARC port
>>
>>  NEWS                                          |   11 +
>>  README                                        |    1 +
>>  config.h.in                                   |    3 +
>>  manual/install.texi                           |    4 +
>>  scripts/build-many-glibcs.py                  |   10 +
>>  sysdeps/arc/Implies                           |    3 +
>>  sysdeps/arc/Makefile                          |   21 +
>>  sysdeps/arc/Versions                          |    8 +
>>  sysdeps/arc/__longjmp.S                       |   49 +
>>  sysdeps/arc/abort-instr.h                     |    2 +
>>  sysdeps/arc/atomic-machine.h                  |   69 +
>>  sysdeps/arc/bits/endianness.h                 |   15 +
>>  sysdeps/arc/bits/fenv.h                       |   78 +
>>  sysdeps/arc/bits/link.h                       |   52 +
>>  sysdeps/arc/bits/setjmp.h                     |   26 +
>>  sysdeps/arc/bsd-_setjmp.S                     |    1 +
>>  sysdeps/arc/bsd-setjmp.S                      |    1 +
>>  sysdeps/arc/configure                         |  182 ++
>>  sysdeps/arc/configure.ac                      |   26 +
>>  sysdeps/arc/dl-machine.h                      |  341 +++
>>  sysdeps/arc/dl-runtime.h                      |   42 +
>>  sysdeps/arc/dl-sysdep.h                       |   25 +
>>  sysdeps/arc/dl-tls.h                          |   30 +
>>  sysdeps/arc/dl-trampoline.S                   |   72 +
>>  sysdeps/arc/entry.h                           |    5 +
>>  sysdeps/arc/fpu/fclrexcpt.c                   |   36 +
>>  sysdeps/arc/fpu/fegetenv.c                    |   37 +
>>  sysdeps/arc/fpu/fegetmode.c                   |   31 +
>>  sysdeps/arc/fpu/fegetround.c                  |   32 +
>>  sysdeps/arc/fpu/feholdexcpt.c                 |   43 +
>>  sysdeps/arc/fpu/fesetenv.c                    |   48 +
>>  sysdeps/arc/fpu/fesetexcept.c                 |   32 +
>>  sysdeps/arc/fpu/fesetmode.c                   |   40 +
>>  sysdeps/arc/fpu/fesetround.c                  |   40 +
>>  sysdeps/arc/fpu/feupdateenv.c                 |   51 +
>>  sysdeps/arc/fpu/fgetexcptflg.c                |   31 +
>>  sysdeps/arc/fpu/fraiseexcpt.c                 |   39 +
>>  sysdeps/arc/fpu/fsetexcptflg.c                |   38 +
>>  sysdeps/arc/fpu/ftestexcept.c                 |   33 +
>>  sysdeps/arc/fpu/libm-test-ulps                | 1140 +++++++++
>>  sysdeps/arc/fpu/libm-test-ulps-name           |    1 +
>>  sysdeps/arc/fpu/math-use-builtins.h           |   70 +
>>  sysdeps/arc/fpu_control.h                     |  106 +
>>  sysdeps/arc/gccframe.h                        |   21 +
>>  sysdeps/arc/get-rounding-mode.h               |   38 +
>>  sysdeps/arc/jmpbuf-offsets.h                  |   22 +
>>  sysdeps/arc/jmpbuf-unwind.h                   |   47 +
>>  sysdeps/arc/ldsodefs.h                        |   43 +
>>  sysdeps/arc/libc-tls.c                        |   27 +
>>  sysdeps/arc/machine-gmon.h                    |   35 +
>>  sysdeps/arc/math-tests-trap.h                 |   27 +
>>  sysdeps/arc/memusage.h                        |   23 +
>>  sysdeps/arc/nofpu/Implies                     |    1 +
>>  sysdeps/arc/nofpu/libm-test-ulps              |  270 +++
>>  sysdeps/arc/nofpu/libm-test-ulps-name         |    1 +
>>  sysdeps/arc/nofpu/math-tests-exceptions.h     |   27 +
>>  sysdeps/arc/nofpu/math-tests-rounding.h       |   27 +
>>  sysdeps/arc/nptl/Makefile                     |   22 +
>>  sysdeps/arc/nptl/pthreaddef.h                 |   32 +
>>  sysdeps/arc/nptl/tcb-offsets.sym              |   11 +
>>  sysdeps/arc/nptl/tls.h                        |  148 ++
>>  sysdeps/arc/preconfigure                      |   14 +
>>  sysdeps/arc/setjmp.S                          |   66 +
>>  sysdeps/arc/sfp-machine.h                     |   70 +
>>  sysdeps/arc/sotruss-lib.c                     |   50 +
>>  sysdeps/arc/stackinfo.h                       |   33 +
>>  sysdeps/arc/start.S                           |   74 +
>>  sysdeps/arc/sysdep.h                          |   53 +
>>  sysdeps/arc/tininess.h                        |    1 +
>>  sysdeps/arc/tls-macros.h                      |   47 +
>>  sysdeps/arc/tst-audit.h                       |   23 +
>>  sysdeps/unix/sysv/linux/arc/Implies           |    3 +
>>  sysdeps/unix/sysv/linux/arc/Makefile          |   29 +
>>  sysdeps/unix/sysv/linux/arc/Versions          |   16 +
>>  sysdeps/unix/sysv/linux/arc/arch-syscall.h    |  303 +++
>>  sysdeps/unix/sysv/linux/arc/bits/procfs.h     |   35 +
>>  sysdeps/unix/sysv/linux/arc/bits/timesize.h   |   21 +
>>  .../sysv/linux/arc/bits/types/__sigset_t.h    |   12 +
>>  sysdeps/unix/sysv/linux/arc/c++-types.data    |   67 +
>>  sysdeps/unix/sysv/linux/arc/clone.S           |   93 +
>>  sysdeps/unix/sysv/linux/arc/configure         |    4 +
>>  sysdeps/unix/sysv/linux/arc/configure.ac      |    4 +
>>  sysdeps/unix/sysv/linux/arc/dl-static.c       |   84 +
>>  .../unix/sysv/linux/arc/fixup-asm-unistd.h    |   41 +
>>  sysdeps/unix/sysv/linux/arc/getcontext.S      |   64 +
>>  sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h  |    6 +
>>  sysdeps/unix/sysv/linux/arc/kernel-features.h |   27 +
>>  sysdeps/unix/sysv/linux/arc/kernel_stat.h     |   26 +
>>  sysdeps/unix/sysv/linux/arc/ld.abilist        |    5 +
>>  sysdeps/unix/sysv/linux/arc/ldconfig.h        |   27 +
>>  sysdeps/unix/sysv/linux/arc/ldsodefs.h        |   32 +
>>  .../sysv/linux/arc/libBrokenLocale.abilist    |    1 +
>>  sysdeps/unix/sysv/linux/arc/libanl.abilist    |    4 +
>>  sysdeps/unix/sysv/linux/arc/libc.abilist      | 2084 +++++++++++++++++
>>  sysdeps/unix/sysv/linux/arc/libcrypt.abilist  |    2 +
>>  sysdeps/unix/sysv/linux/arc/libdl.abilist     |    9 +
>>  sysdeps/unix/sysv/linux/arc/libm.abilist      |  699 ++++++
>>  .../unix/sysv/linux/arc/libpthread.abilist    |  213 ++
>>  sysdeps/unix/sysv/linux/arc/libresolv.abilist |   79 +
>>  sysdeps/unix/sysv/linux/arc/librt.abilist     |   35 +
>>  .../unix/sysv/linux/arc/libthread_db.abilist  |   40 +
>>  sysdeps/unix/sysv/linux/arc/libutil.abilist   |    6 +
>>  sysdeps/unix/sysv/linux/arc/localplt.data     |   12 +
>>  sysdeps/unix/sysv/linux/arc/makecontext.c     |   73 +
>>  sysdeps/unix/sysv/linux/arc/mmap_internal.h   |   27 +
>>  sysdeps/unix/sysv/linux/arc/setcontext.S      |   93 +
>>  sysdeps/unix/sysv/linux/arc/shlib-versions    |    7 +
>>  sysdeps/unix/sysv/linux/arc/sigaction.c       |   31 +
>>  sysdeps/unix/sysv/linux/arc/sigcontextinfo.h  |   28 +
>>  sysdeps/unix/sysv/linux/arc/sigrestorer.S     |   29 +
>>  sysdeps/unix/sysv/linux/arc/swapcontext.S     |   94 +
>>  sysdeps/unix/sysv/linux/arc/sys/cachectl.h    |   35 +
>>  sysdeps/unix/sysv/linux/arc/sys/ucontext.h    |   57 +
>>  sysdeps/unix/sysv/linux/arc/sys/user.h        |   31 +
>>  sysdeps/unix/sysv/linux/arc/syscall.S         |   33 +
>>  sysdeps/unix/sysv/linux/arc/syscalls.list     |    3 +
>>  sysdeps/unix/sysv/linux/arc/sysdep.c          |   33 +
>>  sysdeps/unix/sysv/linux/arc/sysdep.h          |  224 ++
>>  sysdeps/unix/sysv/linux/arc/ucontext-macros.h |   25 +
>>  sysdeps/unix/sysv/linux/arc/ucontext_i.sym    |   20 +
>>  sysdeps/unix/sysv/linux/arc/vfork.S           |   42 +
>>  121 files changed, 9146 insertions(+)
>>  create mode 100644 sysdeps/arc/Implies
>>  create mode 100644 sysdeps/arc/Makefile
>>  create mode 100644 sysdeps/arc/Versions
>>  create mode 100644 sysdeps/arc/__longjmp.S
>>  create mode 100644 sysdeps/arc/abort-instr.h
>>  create mode 100644 sysdeps/arc/atomic-machine.h
>>  create mode 100644 sysdeps/arc/bits/endianness.h
>>  create mode 100644 sysdeps/arc/bits/fenv.h
>>  create mode 100644 sysdeps/arc/bits/link.h
>>  create mode 100644 sysdeps/arc/bits/setjmp.h
>>  create mode 100644 sysdeps/arc/bsd-_setjmp.S
>>  create mode 100644 sysdeps/arc/bsd-setjmp.S
>>  create mode 100644 sysdeps/arc/configure
>>  create mode 100644 sysdeps/arc/configure.ac
>>  create mode 100644 sysdeps/arc/dl-machine.h
>>  create mode 100644 sysdeps/arc/dl-runtime.h
>>  create mode 100644 sysdeps/arc/dl-sysdep.h
>>  create mode 100644 sysdeps/arc/dl-tls.h
>>  create mode 100644 sysdeps/arc/dl-trampoline.S
>>  create mode 100644 sysdeps/arc/entry.h
>>  create mode 100644 sysdeps/arc/fpu/fclrexcpt.c
>>  create mode 100644 sysdeps/arc/fpu/fegetenv.c
>>  create mode 100644 sysdeps/arc/fpu/fegetmode.c
>>  create mode 100644 sysdeps/arc/fpu/fegetround.c
>>  create mode 100644 sysdeps/arc/fpu/feholdexcpt.c
>>  create mode 100644 sysdeps/arc/fpu/fesetenv.c
>>  create mode 100644 sysdeps/arc/fpu/fesetexcept.c
>>  create mode 100644 sysdeps/arc/fpu/fesetmode.c
>>  create mode 100644 sysdeps/arc/fpu/fesetround.c
>>  create mode 100644 sysdeps/arc/fpu/feupdateenv.c
>>  create mode 100644 sysdeps/arc/fpu/fgetexcptflg.c
>>  create mode 100644 sysdeps/arc/fpu/fraiseexcpt.c
>>  create mode 100644 sysdeps/arc/fpu/fsetexcptflg.c
>>  create mode 100644 sysdeps/arc/fpu/ftestexcept.c
>>  create mode 100644 sysdeps/arc/fpu/libm-test-ulps
>>  create mode 100644 sysdeps/arc/fpu/libm-test-ulps-name
>>  create mode 100644 sysdeps/arc/fpu/math-use-builtins.h
>>  create mode 100644 sysdeps/arc/fpu_control.h
>>  create mode 100644 sysdeps/arc/gccframe.h
>>  create mode 100644 sysdeps/arc/get-rounding-mode.h
>>  create mode 100644 sysdeps/arc/jmpbuf-offsets.h
>>  create mode 100644 sysdeps/arc/jmpbuf-unwind.h
>>  create mode 100644 sysdeps/arc/ldsodefs.h
>>  create mode 100644 sysdeps/arc/libc-tls.c
>>  create mode 100644 sysdeps/arc/machine-gmon.h
>>  create mode 100644 sysdeps/arc/math-tests-trap.h
>>  create mode 100644 sysdeps/arc/memusage.h
>>  create mode 100644 sysdeps/arc/nofpu/Implies
>>  create mode 100644 sysdeps/arc/nofpu/libm-test-ulps
>>  create mode 100644 sysdeps/arc/nofpu/libm-test-ulps-name
>>  create mode 100644 sysdeps/arc/nofpu/math-tests-exceptions.h
>>  create mode 100644 sysdeps/arc/nofpu/math-tests-rounding.h
>>  create mode 100644 sysdeps/arc/nptl/Makefile
>>  create mode 100644 sysdeps/arc/nptl/pthreaddef.h
>>  create mode 100644 sysdeps/arc/nptl/tcb-offsets.sym
>>  create mode 100644 sysdeps/arc/nptl/tls.h
>>  create mode 100644 sysdeps/arc/preconfigure
>>  create mode 100644 sysdeps/arc/setjmp.S
>>  create mode 100644 sysdeps/arc/sfp-machine.h
>>  create mode 100644 sysdeps/arc/sotruss-lib.c
>>  create mode 100644 sysdeps/arc/stackinfo.h
>>  create mode 100644 sysdeps/arc/start.S
>>  create mode 100644 sysdeps/arc/sysdep.h
>>  create mode 100644 sysdeps/arc/tininess.h
>>  create mode 100644 sysdeps/arc/tls-macros.h
>>  create mode 100644 sysdeps/arc/tst-audit.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/Implies
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/Makefile
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/Versions
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/arch-syscall.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/bits/procfs.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/bits/timesize.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/bits/types/__sigset_t.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/c++-types.data
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/clone.S
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/configure
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/configure.ac
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/dl-static.c
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/fixup-asm-unistd.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/getcontext.S
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/kernel-features.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/kernel_stat.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/ld.abilist
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/ldconfig.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/ldsodefs.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libanl.abilist
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libc.abilist
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libcrypt.abilist
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libdl.abilist
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libm.abilist
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libpthread.abilist
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libresolv.abilist
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/librt.abilist
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libthread_db.abilist
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/libutil.abilist
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/localplt.data
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/makecontext.c
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/mmap_internal.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/setcontext.S
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/shlib-versions
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sigaction.c
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sigcontextinfo.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sigrestorer.S
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/swapcontext.S
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sys/cachectl.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sys/ucontext.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sys/user.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/syscall.S
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/syscalls.list
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.c
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext-macros.h
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext_i.sym
>>  create mode 100644 sysdeps/unix/sysv/linux/arc/vfork.S
>>
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
