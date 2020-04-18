Return-Path: <SRS0=LyzR=6C=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB853C2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Apr 2020 00:29:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66BC12076D
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Apr 2020 00:29:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QzJTftUm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fbDox+W5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Yoo0qDPy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66BC12076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9R+e7qVxxPo2K7nVaNI+1hp3N22CJRUMNy3/OcAkBg=; b=QzJTftUmA/Tkq/
	BN9VnOs9YfsPoWHksaFH29ofspYHJ16zBZd59TG/E8j6Z4wp9pKoiAV6nkPI1DQw5z1nLVRe8LaNg
	qvhSMuk3CD3w8gnVT2QzPp8+DtyoBRBLqPYwus9OTDVUClEkVVNh3oq37EG5qfQwu0zfcrle8VCtn
	5muHO4ULy2sSUGJgTa/TfIJ3BClOHsqiPwTZhpb2vAewPRsHrUhMFMoUX0cLxs2grtvzkDb2yjxY5
	QHmFGAfrMtdXqW9gZdYD7MPOyfKi6b5zSkN5Wu7ZhL6rLTkbObhol144/5iLaty4Ry9+7t9qb1Wdi
	HfXkJjnA8H/EPzRFV5oA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPbMK-0001uY-Ff; Sat, 18 Apr 2020 00:29:24 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPbMG-0001uB-BD
 for linux-snps-arc@lists.infradead.org; Sat, 18 Apr 2020 00:29:22 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EA4F8403CA;
 Sat, 18 Apr 2020 00:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587169758; bh=5NAqpkVYXeJfG1tZ5gU+3X+Fp1p0523pZZ2HUBBXwjs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=fbDox+W57cbO9Xcrq3GXSVXT7tN+4S0uWJPaLf4iOr73egy9zXAuvH2PFvj0nVZ5O
 1G3b6fD61UAxdHjxKrgJKJUMItGsAZqbm4REiTj6V/86tp7Z4yXfasmBDgEWdUgAFy
 6hDfnCL+kQ6MWSNXCgRmyZxoZn86ZDplsaqLzaUGXNo4MXMvmv3/kCFl9x6wqkxzCK
 TtZ8J0wHVqTJ8/KC1Czz5AXuBnnbfuAc7IJ33h5MWMyauTLpW8CfgoSBQUER/BpYbK
 TgejaVTRkrBPlw8FPKoy8TkZMUJ0+eb+q09dSBIEP6fQ7avGAHqWVvst8MeGP5IYUP
 tEpR//O6qbtPg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id AB149A00AC;
 Sat, 18 Apr 2020 00:29:18 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 17 Apr 2020 17:28:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 17 Apr 2020 17:28:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaWj8iifVPFW50ps5OK3MC9i0v+3Cc5YFUUD5asQvFF4iB3V9wvuJ0D1msPP/ZlCT4UtvuPNd995eyKKcFnTkjOwkDZviC91IKVGMol6Y3UZ3AdXOmRebfPwZfFmpwJ+sVI8Jr1QmoFEcU4c3XCT4adtCxWlTUUyyr19rtquuKa5Gazr8yJ2SSmhkEG9BU/evnjncDafSPk4moLZNUzSLTpX+PVwSTeqc0oMena9LSxHI+TzpjnAfidIf5Un7OzDflwvhQtUtj1bUhAYu0c0kJhugrVFLEx6paKS1utdkUZVgu0PG9tM/HWHXfvpYfWtAf6EF0UAcd+9FUg0AC9Prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NAqpkVYXeJfG1tZ5gU+3X+Fp1p0523pZZ2HUBBXwjs=;
 b=CJLgPx9UeDjaPhL1FwjC0yfkChUTanf0vxR0ptgGVRDxPClvtFW0UCrTxdsDbo0ln3Doi4zhKZMynxBeTxEPSXfv23zovhh/S722bfk6nFJcLfOM5jUgFbJvLqdYpQb/LiAn+u9p9P9ydpQ1wMMVfBftEtlKf6qUmCzoBON5Vhv4av3d0kJFxUuIbbYBkbuCs7b50uYVIqkIE4GNp2yEe1TjpxNBuqKW7toaEMy0BXI5LwfdWyNV755Lfou3k7lZ6hLn2OkES/nU4awLqvN9S5lJsW5RP6tSAlXRwJkYkLPk8r6sXk6AXc812ab3nhTVhJgFz3UrY15wHdCz9Jp95Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NAqpkVYXeJfG1tZ5gU+3X+Fp1p0523pZZ2HUBBXwjs=;
 b=Yoo0qDPyMGMzv0Z9DAGW/eGN4+5739i0Nb1lxdqy8VR1c12mcgMO/ODbFPssjwrsEtjZI0Su3qcORGO1vYxVM3h69Dh1H/uC3n54xJz6wdiW1nlt/yy276QVjEz/8GaexXSawoETeAQuyq8llZLzyDmT6584X82XDl0sm6TKU04=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3127.namprd12.prod.outlook.com (2603:10b6:a03:d8::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Sat, 18 Apr
 2020 00:28:30 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2921.027; Sat, 18 Apr 2020
 00:28:30 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>, "libc-alpha@sourceware.org"
 <libc-alpha@sourceware.org>
Subject: Re: [PATCH v3] Make any 32-bit time based syscalls unavailable for
 TIMESIZE==64
Thread-Topic: [PATCH v3] Make any 32-bit time based syscalls unavailable for
 TIMESIZE==64
Thread-Index: AQHWB6YXXY4j5+K2H0eFv1trJub2pqhsekUAgAsm9ICABoALgA==
Date: Sat, 18 Apr 2020 00:28:30 +0000
Message-ID: <46b17be4-da49-a6d3-3a07-accf406302b7@synopsys.com>
References: <20200312183325.594-1-vgupta@synopsys.com>
 <20200331214717.23902-1-vgupta@synopsys.com>
 <c87dd5b4-8be6-714f-3210-4cbfbe89a069@synopsys.com>
 <9eda9480-d0d5-07ec-3a99-83e61b076a2a@synopsys.com>
In-Reply-To: <9eda9480-d0d5-07ec-3a99-83e61b076a2a@synopsys.com>
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
x-ms-office365-filtering-correlation-id: a50ac3c6-978d-40cc-4e05-08d7e32f6bca
x-ms-traffictypediagnostic: BYAPR12MB3127:
x-microsoft-antispam-prvs: <BYAPR12MB312720FFECAAAC8626691D42B6D60@BYAPR12MB3127.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0377802854
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(366004)(396003)(39860400002)(136003)(376002)(2616005)(81156014)(186003)(86362001)(110136005)(316002)(36756003)(8936002)(6506007)(53546011)(8676002)(31686004)(66556008)(66476007)(66946007)(76116006)(6486002)(478600001)(5660300002)(4326008)(66446008)(31696002)(71200400001)(6512007)(2906002)(64756008);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fo8//v2W9HWeQAUHPgNZYX4d3pvSLTeQEkwb+wkblCUGk4xNi4CB+Ut2mRRVHXNFqv7a/MrIRtz7oXniYoSMhvjIq3zQLJ53rd+wk4C8BZWnqdffNLt+aikF5ol8jNVvwiPl+erjqfh7AkTPw4M4jX+p0TA0usy4ML2ShkUpoR2rJpzrEqKrZK+0PvMQbzJm5L5sibgJ2mBHzS2HLZ9Ya7p6iSvUKMbOF5Xyi/iJI92EtLf1ZL4WxFKBHonwZ8QWm1fSGd5Z8GmmpL26tieeInlYy6By1iRbJMDfRLTwaxlfwCvW4RylNfk30RXG+lwULgStlS/TlRZKRm4TYk5c7b9UXNle1TFzUTggYI0A3cSEwJNveHCXoVuRkgoCK1H4GNv+BQQ57cku5TNlRy9eKRgaOkES0B8sEIrv1wFTeuVb25AUfGNdxGLBH+BEI/OznZxRdm+h67x20iGQjwmNlGVHZGnG/HHWmOopI15bwXzhB4hQUQ4gHt7BXfSNPgke92sJXjC5nWffjcAATpIyCQ==
x-ms-exchange-antispam-messagedata: NbnIPCDbpwJk61fdMx/Y16aur1AUjF+U1Uvu/8n2QgUUDhKXQQKL5CEt+iIAOnsv4IEEsQFwhVXfh6HMQ7RWduwwtVTfQD3XauAVbHURDPUVJvFnR2eA1e8ILxaCZf4TFpoko3/PYksXrHl+R4H1bV+SZZ6thCTaN+mC7L4sS7WCY635I7jvM4GY6dYqP0pgVnEtAq5oajUHj3xJ/SufDQ==
x-ms-exchange-transport-forked: True
Content-ID: <EB7E0CF7AD58E943A760F1CED57F60CA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a50ac3c6-978d-40cc-4e05-08d7e32f6bca
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2020 00:28:30.6533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AAD4yNZ3GAEhwJ4ggh1ZETnZLoQ/GhcQNtxpQZZVN8uuzayBdI6dI505u3p3pTsB9Xuyuj1/Jq443u0SBmo6Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3127
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_172920_399311_5371EE6D 
X-CRM114-Status: GOOD (  12.83  )
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

On 4/13/20 2:12 PM, Vineet Gupta via Libc-alpha wrote:
> On 4/6/20 11:54 AM, Vineet Gupta wrote:
>> On 3/31/20 2:47 PM, Vineet Gupta via Libc-alpha wrote:
>>> From: Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
>>>
>>> An older asm-generic syscall ABI may have kernel provide 32-bit
>>> time syscalls, so undef them to not mix 32/64 in 64-bit time regime.
>>>
>>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
>>
>> ping !
> 
> ping ^2 !

If this is not suitable for common code, I'd still like to add this as part of ARC
port to safe guard against future snafus.

>>> ---
>>> Changes since v2
>>>   - Made x32 safe
>>>
>>> Changes since v1
>>>   - don't redirect these to 64-bit variants
>>> ---
>>>  sysdeps/unix/sysv/linux/generic/sysdep.h | 24 ++++++++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>>
>>> diff --git a/sysdeps/unix/sysv/linux/generic/sysdep.h b/sysdeps/unix/sysv/linux/generic/sysdep.h
>>> index 40b4b955ca1b..b83e17e1c9d1 100644
>>> --- a/sysdeps/unix/sysv/linux/generic/sysdep.h
>>> +++ b/sysdeps/unix/sysv/linux/generic/sysdep.h
>>> @@ -17,6 +17,7 @@
>>>     <https://www.gnu.org/licenses/>.  */
>>>  
>>>  #include <bits/wordsize.h>
>>> +#include <bits/timesize.h>
>>>  #include <kernel-features.h>
>>>  #include <sysdeps/unix/sysdep.h>
>>>  #include <sysdeps/unix/sysv/linux/sysdep.h>
>>> @@ -25,3 +26,26 @@
>>>  #ifdef __NR_llseek
>>>  # define __NR__llseek __NR_llseek
>>>  #endif
>>> +
>>> +#if (__TIMESIZE == 64 && __WORDSIZE == 32 \
>>> +     && (!defined __SYSCALL_WORDSIZE || __SYSCALL_WORDSIZE == 32))
>>> +
>>> +/* Don't provide 32-bit time syscalls even if the kernel ABI provides
>>> +   them (Older variants of asm-generic ABIs e.g. ARC).  */
>>> +
>>> +# undef __NR_futex
>>> +# undef __NR_rt_sigtimedwait
>>> +# undef __NR_ppoll
>>> +# undef __NR_utimensat
>>> +# undef __NR_pselect6
>>> +# undef __NR_recvmmsg
>>> +# undef __NR_semtimedop
>>> +# undef __NR_mq_timedreceive
>>> +# undef __NR_mq_timedsend
>>> +# undef __NR_clock_getres
>>> +# undef __NR_timerfd_settime
>>> +# undef __NR_timerfd_gettime
>>> +# undef __NR_sched_rr_get_interval
>>> +# undef __NR_clock_adjtime
>>> +
>>> +#endif
>>>
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
