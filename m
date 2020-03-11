Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EEAC2BAEE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 20:58:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34C6A2074B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 20:58:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cGebNP0Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NkaJLzGh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="Z2FIPjfu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34C6A2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YA8TY3qW5InM57fSeQmSbnP90fbgNrtaB20jJEnlQAs=; b=cGebNP0Yuw8XOa
	7ZUTJ7PJevL9w1E8aRQU7XmcjpkoQaYPCgne6e/pHhnG9Kn6OsgYnxVv0kZ7C7rTmxlvKglVnEwnx
	g7ebCPciW66SSZXMJTK/SuMkNaRVIVtcFMP6gcux58o61qboUy4LjRnXD9npHfqL0y/mrBsdLBaGW
	MfnHH67aciIaoKuY4yQxKb4fS0FKtc/NTp0vVF4lmWJqEzSMfoiVgPrSUvzo6tmqYgwqf/gHIlrlR
	/fV8KgZv1F2fvcw+hRa+xpUyjdat/wfnbDfxsKgK5/Z7A7ykYgT9JeBR6k6bU/rQg8zaDP+Zir2e0
	/dagV+MT6F2Kk7CHhceQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC8R3-0006Py-4m; Wed, 11 Mar 2020 20:58:37 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC8R0-0006P9-3q
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 20:58:35 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 233AFC0F71;
 Wed, 11 Mar 2020 20:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583960308; bh=RD+d7RV6+v/1Va4YA/+qNQEtN8lG+sQTsu/lyFwY02k=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=NkaJLzGhLUcWke5LmwcMLKz0FUofyGOYhtWQZBpsyAfeMOKx6gacOFxPuwKJunDkh
 8XMSe0794yN4n25/0+SEy9OI6eQmB4lM6u7tsGjyNThZ8b147MD6wfm0Pk+W5mn8Dl
 MpRg6hH7FE4Q+syNgw0qEmgDEX81hZD2fdEun1y3FVbayAunmeK6+rC7LE64WAUqDx
 2zAXqWl0rLbC97c6TMOlcNZUklCXiGWHvIHa1iz1ChUXPl/PKCoa5waNNouyh2rumh
 AtfYKRApb8wiQT15b7GRygYITMN+ebYUzFWBI7I8lpTglnQMKKVf6JXgGOK0ye91ad
 lfxDbC3t9NT8w==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id AE35DA006A;
 Wed, 11 Mar 2020 20:58:27 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 11 Mar 2020 13:58:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 11 Mar 2020 13:58:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRC3NLVz1o6GPB/Ji5vmOBfRs3/ArvYBcJIJhxL/sk8bLlGyJx+FMVwz3+cUvhFgnkXe30RE7Sy7pknK/kjOyi2PiRvbsz4o1+gSzcqrw+Yb7wlYgk2VrR+h0QkzQnhePMNUs0FG/dRy6QvhTeunHODxfIzxyy1iAtsPKyrzpFlZdoUbMP3PAvK98NBCO3x/hF6JBAYCFUPBTqirsclNVmFUTMOi/3sTCLduwwnFrz7TeWdVWGAbUt+dVZa7jE9GWkiMct86AndlW8N076/r/rtOqsht8xlUy9Cj9VVgNwY/nfW7EvZYtN4CwgV+EV5xwuvx14FsAlZQNdAkRiTCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kb9tdOnqxgpA0HtpEEJGKN6131sq7lDi/t+wRTKebY8=;
 b=mIZh6BFoIVEW1AoJL3nJ5OWl7/n4XbFRzERF+a72L4LtCq89vov1JT1f0CcIA+0W/a7DiaDIyPkygo4mo+yQFlrKmanAGY5C5mNfAR4TC5+sdzkzAtv9alMlTBcRZdk6aJop1W4jPy0Mvng4dTlOG6QEXd0+fb/t1XtAnd7Mg+mU7ec2Hs/JBA374HhsrcE30NyyrqfjnZDrSkXIx9GnDHEGMUWeYPMzB9CyXR5fx0Fq0Qigd+s2x1pOra4vtLPbs43nyN3fvqb4ziW90rPw3oztWqNh8Z7iiU1Gi1EP8jdVlpTKqjFh5ml1L/hGI6hHUY1msWVShP4y+ocqoecjYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kb9tdOnqxgpA0HtpEEJGKN6131sq7lDi/t+wRTKebY8=;
 b=Z2FIPjfuvX3XwnJ7XwYntEnCZJk16fnK4bWt84ijGXG/y9ysXANvWuFdfw+aIoSehNTvd8qRpfWkjzfGHu6yZoTn/h9SK96bRU6FTBq89kQMHhWXTQochasFVwCRFc3jvWYFKWaRMe0dmm4t2H82THFllAXXpeVrm1Ud9ZxvzOs=
Received: from BY5PR12MB4034.namprd12.prod.outlook.com (2603:10b6:a03:205::9)
 by BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Wed, 11 Mar
 2020 20:58:14 +0000
Received: from BY5PR12MB4034.namprd12.prod.outlook.com
 ([fe80::3531:93d8:93db:207a]) by BY5PR12MB4034.namprd12.prod.outlook.com
 ([fe80::3531:93d8:93db:207a%5]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 20:58:14 +0000
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH 2/2] ARC: don't align ret_from_exception function
Thread-Topic: [PATCH 2/2] ARC: don't align ret_from_exception function
Thread-Index: AQHV98HujcRrFCa3G0K90e5pOjYelKhDqFKAgAAx9ms=
Date: Wed, 11 Mar 2020 20:58:14 +0000
Message-ID: <BY5PR12MB40348292DA303489C1DA2B66DEFC0@BY5PR12MB4034.namprd12.prod.outlook.com>
References: <20200311162644.7667-1-Eugeniy.Paltsev@synopsys.com>
 <20200311162644.7667-2-Eugeniy.Paltsev@synopsys.com>,
 <448ba208-56a5-d8b2-9675-7be03b872c23@synopsys.com>
In-Reply-To: <448ba208-56a5-d8b2-9675-7be03b872c23@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=paltsev@synopsys.com; 
x-originating-ip: [5.18.243.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10db636b-68e5-4f40-076e-08d7c5feea96
x-ms-traffictypediagnostic: BY5PR12MB4116:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4116E7B86AB2C69366511D8EDEFC0@BY5PR12MB4116.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(346002)(39860400002)(366004)(396003)(199004)(7696005)(54906003)(26005)(186003)(316002)(110136005)(8676002)(6506007)(52536014)(9686003)(81156014)(33656002)(55016002)(71200400001)(86362001)(8936002)(107886003)(4326008)(478600001)(66446008)(5660300002)(66556008)(76116006)(91956017)(66476007)(64756008)(81166006)(2906002)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR12MB4116;
 H:BY5PR12MB4034.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UcXWAPTouO03hsMReeDFu1aQEmQXaGXtzLCGSBkqO7RO14CgdL+ZTUhLjbdT8nehSji/9Xjvw+EnFywhfcqrwEht5afDpuVGNmaqR1x0/L6RMOU5L+A0fSMs4uAuSTTOo7D3ahyDS0eqFfLyqnE9cVNNDXm2H8BTeHOwtl5yYFg+h7UDRqLhJWOng9cyER2LTh7N4uGx+k/X2JUqC5/4rKtCrcGKzAhSfOlwsV9qH5ByYhVSZhviRrC6CM3kHNxv2p2tTzUkySWDABltFMazNOK4ZoBdpkyT4kdWeZuBwhalkZ9v53FmIve1vcbXZ/SujVlLOKCFpBldMf3caF1myUp/vmVnYmiVWVoBGx5flU7kCJMmqm9RlU0V4ScSkbBgrqk2q0Hjqk9+nuqVHKsuG0GgOnHaIL1Xbu+RGG63wb36A56OImR5aZdQ3BxN4k7V
x-ms-exchange-antispam-messagedata: 9FDC/y7xqGBiYkz1Wc21iIT9qC2uTMgaUC/A5K6CBByMiKS8bv0sGG9znZ/AoYqyPF9DUZ6jFae9sCMfYuDKUxi94JKQ6rSPFMWRR1FVbXbk5QJ4XSfRqNUwm+erJDhGnrnMSRuoHGhp/OEuifqMjQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 10db636b-68e5-4f40-076e-08d7c5feea96
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 20:58:14.3195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8UZ4rBgcxIolD2q/00Kqojx153uKIGWk4RzCZen7sbbxeRZBOpoPrTpLj/TPYCYK/dxNuRMJu1EsDdBAtdvGfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_135834_226611_75FBFE6F 
X-CRM114-Status: GOOD (  14.27  )
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
Cc: Alexey  Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

>From: Vineet Gupta <vgupta@synopsys.com>
>Sent: Wednesday, March 11, 2020 20:38
>To: Eugeniy Paltsev; linux-snps-arc@lists.infradead.org
>Cc: linux-kernel@vger.kernel.org; Alexey Brodkin
>Subject: Re: [PATCH 2/2] ARC: don't align ret_from_exception function
>
>On 3/11/20 9:26 AM, Eugeniy Paltsev wrote:
>> ARC have a tricky implemented ret_from_exception function.
>> It is written on ASM and can be called like regular function.
>> However it has another 'entry point' as it can be called as a
>> continuation of EV_Trap function.
>
>It is not really intended / needed to be called form outside ASM - but has to be
>spread across 2 asm files as it is mostly target isa independent, while the
>callers are in separate target isa specific files.
>The ENTRY/END annotations are simply for the dwarf unwinder to stop gracefully.
>
>> As we declare "ret_from_exception" using ENTRY macro it may align
>> "ret_from_exception" by 4 bytes by adding padding before it.
>> "ret_from_exception" doesn't require alignment by 4 bytes
>> (as it doesn't go to vector table, etc...) so let's avoid aligning
>> it by switch from ENTRY (which is alias for SYM_FUNC_START) to
>> SYM_FUNC_START_NOALIGN macro.
>
>I would like to keep it aligned.
>
>ARC700 definitely has penalty for unaligned branch targets, so it will definitely
>suffer there.

Do you know some exact numbers? I'm not an expert in ARC700 (fortunately =)

>
>For HS, unaligned branch targets have no penalty (for the general case atleast),
>but if it does get unaligned, the entire entry prologue code will be - i.e. each
>one of the subsequent 130 or so instructions. That doesn't seem like a good idea
>in general to me.

I really don't insist about applying this patch but I don't understand your
argumentation about ARC HS like at all. Could you please explain in more detail what
130 instructions you are talking about?

>What's weird is I never hit the original problem you ran into - are you using a
>toolchain with the branch relaxation stuff  ?

Looks like we just were lucky enough and didn't change this code a lot.
I faced with this issue when I was developing DSP-related stuff. Initially I
triggered it when I replaced 'mov r10, 0' instruction with 'mov_s r10, 0' and got
weird kernel crush.

It can be reproduced with any toolchain (it's not related to branch relaxation stuff).

>I faked it using a nop_s and the SYM_FUNC_START_NOALIGN( ) annotation and can see
>all instructions getting unaligned.

What is the problem with it? It's totally valid and fine for ARC HS to have instructions
aligned by 2 byte. Or are you talking about ARC700 again?

>Before;
>
>921238e4 <ret_from_exception>:
>921238e4:    ld    r8,[sp,124]
>921238e8:    bbit0.nt    r8,0x7,212
>...
>92123ac8:    rtie
>92123acc <debug_marker_ds>:
>92123acc:    ld    r2,[0x927d81d8]
>92123ad4:    add    r2,r2,0x1
>92123ad8:    st    r2,[0x927d81d8]
>92123ae0:    bmskn    r11,r10,0xf
>92123ae4:    sr    r11,[aux_irq_act]
>92123ae8:    b    -140    ;92123a5c
>
>After:
>
>9212393c:    nop_s
>9212393e <ret_from_exception>:
>9212393e:    ld    r8,[sp,124]
>92123942:    bbit0.nt    r8,0x7,214
>...
>92123b22:    rtie
>92123b26 <debug_marker_ds>:
>92123b26:    ld    r2,[0x927d81d8]
>92123b2e:    add    r2,r2,0x1
>92123b32:    st    r2,[0x927d81d8]
>92123b3a:    bmskn    r11,r10,0xf
>92123b3e:    sr    r11,[aux_irq_act]
>92123b42:    b    -138    ;92123ab6 <debug_marker_syscall>
>92123b46:    nop_s
>
>> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
>> ---
>>  arch/arc/kernel/entry-arcv2.S | 2 +-
>>  arch/arc/kernel/entry.S       | 3 +--
>>  2 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arc/kernel/entry-arcv2.S b/arch/arc/kernel/entry-arcv2.S
>> index 12d5f12d10d2..d482e1507f56 100644
>> --- a/arch/arc/kernel/entry-arcv2.S
>> +++ b/arch/arc/kernel/entry-arcv2.S
>> @@ -260,4 +260,4 @@ debug_marker_ds:
>>       sr      r11, [AUX_IRQ_ACT]
>>       b       .Lexcept_ret
>>
>> -END(ret_from_exception)
>> +SYM_FUNC_END(ret_from_exception)
>> diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
>> index 60406ec62eb8..79409b518a09 100644
>> --- a/arch/arc/kernel/entry.S
>> +++ b/arch/arc/kernel/entry.S
>> @@ -280,7 +280,7 @@ END(EV_Trap)
>>  ;
>>  ; If ret to user mode do we need to handle signals, schedule() et al.
>>
>> -ENTRY(ret_from_exception)
>> +SYM_FUNC_START_NOALIGN(ret_from_exception)
>>
>>       ; Pre-{IRQ,Trap,Exception} K/U mode from pt_regs->status32
>>       ld  r8, [sp, PT_status32]   ; returning to User/Kernel Mode
>> @@ -373,4 +373,3 @@ resume_kernel_mode:
>>       b       .Lrestore_regs
>>
>>  ##### DONT ADD CODE HERE - .Lrestore_regs actually follows in entry-<isa>.S
>> -
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
