Return-Path: <SRS0=1c7k=AE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42C4C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Jun 2020 17:14:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7313020780
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Jun 2020 17:14:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ke0w6YMc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KBZtlcVG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RbyTYHcV";
	dkim=neutral (0-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Tfy2HBwP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7313020780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WW6rtGVpk1/EBGhe31NyQfXFNZZM1LM6/RFSMBUmdok=; b=ke0w6YMcznZTHF/x+taKkm38u
	1F73KOiT5LLK4PK1ABcUnVYBjj8mijgk2ZEroki9PEt0ByqWbBw14520g9p8OvOPLU0mkkTYcScJc
	QfbG/oyYRfZ3RtSYxhpyRiEjto3H3ijMj4eliGG4LY33mrOj8LLjj/jKWoFabyOMoi0Ltf1an/RWJ
	WDMr4WKU4QAFKtqej37P1ebtd2CfOB4AhVXHSqzg1MEOuHGIQ82JSCJQguxhrv8Wywy5uOoQn1Y6C
	9YrmpY1uVJMuEOly9x0AQktdEN1jHBKPmVmVhXsT5MTqed95WeYIwzWswbKvrBjLzQdLjRxcQKag5
	/ELE7S8Pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnmVQ-00051k-IY; Tue, 23 Jun 2020 17:14:44 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnmEq-00041x-Q2
 for linux-snps-arc@merlin.infradead.org; Tue, 23 Jun 2020 16:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:
 From:Sender:Reply-To:Content-Description;
 bh=gEU0ssrL191eSBovrjTssTSc8vNVACBg1cKQwii5k9A=; b=KBZtlcVGpOU8Yom/Oocwvlw09e
 ccg/EUSltuDLoP1OGlUM6ut+qD0YLTLsjP3M0mwgjcLPRHypWWN67lDTwkJy3+TlRyoSpx3Csjma1
 klbt7gSv4IaQ+woMogKRExOBWjb9Q+O8RQuDN21V0101AlkjXBs/LH+zP9q5j6+DW3UljGocn+gFK
 UtqCMnlOUc5dJtf/iafpVT29q2MraqvOrvgp0lklp9Pk4AAuPTVLzyUVHD5zPbGAzUgrd8tUv5QtX
 qP8eZyDtObnWsvpoIRr9SS8Cp1Jjbtv+KkwCUQo99LQmVX04sJGIliZAIoUX7cJOUjR9pSYuxx6g6
 mSSTQbvg==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnmEk-0003dR-Ou
 for linux-snps-arc@lists.infradead.org; Tue, 23 Jun 2020 16:57:35 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 368D040120;
 Tue, 23 Jun 2020 16:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1592931430; bh=gEU0ssrL191eSBovrjTssTSc8vNVACBg1cKQwii5k9A=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=RbyTYHcV3S0U7icCp88JTw9Bq7G/BsZZHJR7kH4T9uz2LV3m0BY58RrBjIsD/kgv7
 H2//dSdjdqa90RDHRxB92cTVqnr300+okqvjj0qScF44Umevpk9IyDq/i3kTNsk0Ve
 8lQDcN8iTbiNZ4WaV5MPsmGZKLiYoWcWgHEGjqiXWyTSt/RMlhzTFvLo4RbRo3glka
 IUvnwsxy89xACqmDr+DJ/RSaGtbzVOF+x/vbkyY+cfIEX90mwbzW5I5O6GI8F1YRL3
 E3bHCbtLmwCQdog6d3OCuo60ii7XW/lyRXe9ZVwQc+PfuENNkSfPcUNILo2gGX7/md
 rnHbtwGek7bTQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7B63DA025D;
 Tue, 23 Jun 2020 16:57:06 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id F128A80234;
 Tue, 23 Jun 2020 16:57:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Tfy2HBwP";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4CL0BKHlEHYoZv3UdZ7Ixd/szhU0qYh51DyfOIuLA3f/GF2vBfWhfqoTWATo1HbeaAgo3fLWguS7JUScmg2nL8ztYbbBUvE9Bx6/uaDhTiOR2jL6S5zk4xG+Mek6iCQfzgdtqnP3YDByPuCaLeU3sO8zY9QwhMhB70HqVb04wBNLNDFwY/zmSi+3ex8G+uv5bQdKMc+3uDsXzW/bve6gjX+Fk/T0d9/xdPZeyTRli01AUhy5ruNZ3UBKKkMnktcn7Uzxb8NIzsRhyVtd2pLR7ltnhLFB1Wgx4UR07uml6I6Y7rCcOkhb/ggjP3TPGvaJz+BXeUkqVIJBavRs96+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEU0ssrL191eSBovrjTssTSc8vNVACBg1cKQwii5k9A=;
 b=BWahffuE0gIzVckg4VLKrOv4kI4+SgKzhAGOYI7fF+RteUMLEAjOCuz0ApV1mTRmFx8CeTNTD1Q3Gy14txFz0cchmw2dJn/tnzJmMc2YzZv8ZiPcC/yVRgR35pPjAkzEKkmgwoUwwz+3UkZLYJzkWYsk7Bct3ohv49wp8HROkeqTN1M3EQyO6vE1H7P5Xy5eZBQERwH/V3slgV67olbH3e1PjpFFbMMfW5WxZZKu+QOYK4kgqXMG9CLrX46ORe6tY82R+UtqVvlGOWeNaehfXMYqJmvGyXtNItJtyBW3Cp9SQpavde8BKBmlYAx/xla2VmWBndlpvl0x+3JyGK1ogA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEU0ssrL191eSBovrjTssTSc8vNVACBg1cKQwii5k9A=;
 b=Tfy2HBwP1tNoAxo38UHqiRt1ycI53Nk4LVZbJ8e+hM+qjM9qfDbCpOjEH7n/ZEmQzFknA0XNFD1iAf2mgaO3HZ1AYCCxrE/6HXsDXcvBmVT7zE+tnFGVc+xFBRYT3kiPO/U7EaRb0keb2sCL57122qNezwqcHwoYa8OB1WoY4js=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4209.namprd12.prod.outlook.com (2603:10b6:a03:20d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Tue, 23 Jun
 2020 16:56:59 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 16:56:59 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v7 00/13] glibc port to ARC processors
Thread-Topic: [PATCH v7 00/13] glibc port to ARC processors
Thread-Index: AQHWQ1GeklaUAiSDSUCBHd2p+jv0I6jmd/kA
Date: Tue, 23 Jun 2020 16:56:59 +0000
Message-ID: <c5edd9af-9dc6-d572-4779-6897e43c0a31@synopsys.com>
References: <20200615201441.31820-1-vgupta@synopsys.com>
In-Reply-To: <20200615201441.31820-1-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9cfa2b1-9e3d-4e4f-11bb-08d8179671e8
x-ms-traffictypediagnostic: BY5PR12MB4209:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4209304B400EBAE3E377D069B6940@BY5PR12MB4209.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o6MEpYxT2wwom+XdPZLq7vUcwr8nENZ77dphk9p6UOIvcCZo9lKP0fGjtBSLgn1cjSG02fSEZpw/4xPoixto70jCdLnlOyTHFtj3cslGzzFgBbyVdvBuO0tE7mcjETNzG6lWY52C7K8bG8gHkYAX7LWxUXRzNQHNyI3MD9bOQdMH65em/CiVWMEF2SzyhWEUNj5S/LHKoBMegN5M1a6FvBQoa9pJkEf1Lj+iKnHQoGPd9HxWia2Kj7IOUGvYcj4+n3CT/seN3XUIAGmL8PC+njPxNcShUU5rp470MJFn09TcqAQIsZxLAksJwRzjeyyeAiq8V7dhDMgDFpZNTUclj50G7vbwPXIIw18Fw6VWU428xlsO2d8wqCqDIukcuQFsmfFRqCpj5FxgU2djoux2vdB/ZrPNFhhqZKU+MEvYL6I/A0dV3ncscjLY3hyi8VhEWlWPskwAOMgTTTbKAwBung==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(396003)(346002)(39860400002)(366004)(31686004)(2616005)(8936002)(53546011)(71200400001)(186003)(4326008)(6506007)(110136005)(8676002)(36756003)(2906002)(5660300002)(31696002)(6486002)(86362001)(478600001)(966005)(316002)(66446008)(6512007)(66476007)(66556008)(64756008)(83380400001)(30864003)(76116006)(16799955002)(66946007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: oBrE9iD5pLG8FdGtMExgHI2SbV9w8ronHSxoiVTRnuyfdzAMJl4DwPWq7dmA1k8bkzPpnE4amGcQEeq4XokYFjxg5Xs76N5pD5cpNJ9AYvWl+aJk93+aLlUm5sqRNLj5om3cxMKqnhWH+4xXwde+0GzZNhrB2g61+PQ6M20m4RPQ734PYcNfmv0vIhPI60w0M2cjGETK5/yfC0llVSAZePl8mpB7q7nBaXvRC/oqRz7iwEfIvLFzpUpcsAqSsc4EiIwWsndiVAhTdhxnUoLNaYNjP8Kt0wEeR6gNV/IvrmMFSmGGa3OTk+IEyvM3D8rMNff8MzcMUvfp5HGmKtA35Iub08rlLxvVQWgrwXOrSHqEx3Jr52oPCzSeVoNhKmcyeXqzvUdinQZFeX2Vy0jhmys4lrlgPpZYeV2D1eFUjyeGr5rJYdFmUKeTYBOM1bfu1t7r79rBkvhRX+XtHJvOveBZpZJ3+C2ZGuBXEkQ4WMVP0AtHdE4NdZHvK8UwlhToubiXQMbwd7kMGJvk60imIuYYiB61Lj+WGyXZQRRk0caVaJlsFSvPz43HAKTP5WkY
Content-ID: <AFFFB181CEDEC24D8C509AF9FE91ACA2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9cfa2b1-9e3d-4e4f-11bb-08d8179671e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 16:56:59.5463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: un9rxxCdkk51UNV3c4zMV5ZxKJ5tTS3Unl1gwWziMVPnO7Z5/WU08LZakR0KuB1SNTFzqxb708PefWCkhfZtcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200623_175731_382838_3F608233 
X-CRM114-Status: GOOD (  22.65  )
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

On 6/15/20 1:14 PM, Vineet Gupta wrote:
> Hi,
> 
> This patchset implements glibc port to ARC HS48x processor from Synopsys.

ping !

> 
> git@github.com:foss-for-synopsys-dwc-arc-processors/glibc.git  upstream-v7
> 
> v7:
>    * Addresses review comments from Adhemerval Zanella and Florian
>      Weimer (many thx to you both)
>    * Dropped ARC specific semaphore.h (following upstream 1270fbaaeebe)
>    * ARC specific dl-runtime.h (following upstream 8dbb7a08ec52)
>    * ARC specific math-use-builtins.h and dropped ARC specific sqrt/fma
>      routines (math-use-builtins.h will be disintegrated once done upstream)
>    * setjmp/longjmp to save GP, no need to save r25 (thread pointer)
>    * makecontext/startcontext use r14/r15 (vs. r13/r14)
>    * flatten out register file in mcontext_t (remove scratch/callee)
>    * Use of 'C' comments in asm code, LDR/STR macros
>    * Use of L (..) in asm code
>    * Dropped asm global register r25 specification for thread pointer
>      and rely on __builtin_thread_pointer
>    * NEWS update rewording
>    * Sweeping update of Copyright year 2020
> v6:
>    * Dropped 11/14: merged upstream
>    * _FPU_SETS() inline asm reworked
>    * Introduce fixup-asm-unistd.h to elide 32-bit time, offset syscalls and
>      regenerate arch-syscall.h
>    * Fix snafu in updating build-many-glibcs for ARC
>    * More code sytle fixes flagged by Joseph
> v5:
>    * Big Endian formally supported as multi-ABI
>    * Removed code for ARC700 processors
>    * Hard-float code updates: fegetmode, fesetround, feupdateenv
>    * socket-constant.h update for 64-bit ABI spun off as standalone patch
>    * __syscall_error made glibc_private
>    * math ulps regen
>    * gmp-mparam.h removed
>    * lint fixes as flagged by Joseph
> v4:
>    * Dropped 1/17: Merged upstream
>    * Dropped 17/17:
>        - 64-bit time/offset code chunked up into respective patches
>    * sysctl removed
>    * Updated README for arc gnu triplet
>    * Updated install files for ARC gcc/binutils requirements
>    * Updated NEWS with brief ISA/ABI info
> 
> v3:
>    * Support for Hardware Floating Point
>    * 64-bit time and offsets ABI (although all such changes are confined
>      to a single patch)
> 
> v5: https://sourceware.org/pipermail/libc-alpha/2020-April/112657.html
> v4: https://sourceware.org/pipermail/libc-alpha/2020-March/111855.html
> v3: https://sourceware.org/legacy-ml/libc-alpha/2020-03/msg00167.html
> v2: https://sourceware.org/legacy-ml/libc-alpha/2019-01/msg00681.html
> v1: https://sourceware.org/legacy-ml/libc-alpha/2018-12/msg00678.html
> 
> Documentation:
> --------------
> 
> (a) ABI doc:
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/wiki/files/ARCv2_ABI.pdf
> 
> (b) Programmer's Reference Manual (PRM) : needs a download request to be filled
> https://www.synopsys.com/dw/ipdir.php?ds=arc-hs44-hs46-hs48
> https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-HS.pdf
> 
> Test Results:
> --------------
> (a) build-many-glibcs.py
> 
> | Summary of test results:
> |   1251 PASS
> |     15 XFAIL
> 
> 
> (b) Full testsuite ran in a cross compile setup using buildroot on HSDK development
>     platform. Bulk of failures come from cross testing setup and I
>     intend to improve things with native testing going forward.
> 
> | Summary of test results:
> |     30 FAIL   (-3)
> |
> | FAIL: csu/test-as-const-tcb-offsets
> + FAIL: elf/tst-audit14
> + FAIL: elf/tst-audit15
> + FAIL: elf/tst-audit16
> | FAIL: elf/tst-ldconfig-ld_so_conf-update # not true: dlopen
> | FAIL: iconv/test-iconvconfig		# Needs gconv installed
> - FAIL: iconv/tst-gconv-init-failure
> | FAIL: io/ftwtest			# Requires execution by non-root
> - FAIL: io/tst-futimesat
> | FAIL: io/tst-lockf
> | FAIL: libio/tst-wfile-sync
> | FAIL: locale/tst-C-locale
> | FAIL: locale/tst-duplocale
> | FAIL: locale/tst-locale-locpath
> | FAIL: locale/tst-locname
> | FAIL: localedata/sort-test
> | FAIL: nptl/test-cond-printers		# needs Python3 and target GDB on target
> | FAIL: nptl/test-condattr-printers	#    ditto
> | FAIL: nptl/test-mutex-printers	#    ditto
> | FAIL: nptl/test-mutexattr-printers	#    ditto
> | FAIL: nptl/test-rwlock-printers	#    ditto
> | FAIL: nptl/test-rwlockattr-printers	#    ditto
> | FAIL: nptl/tst-umask1			# passes if run natively on target (NFS ACLv3 support needed)
> | FAIL: nss/bug-erange
> | FAIL: nss/tst-nss-files-hosts-getent	# Timed out
> | FAIL: nss/tst-nss-files-hosts-multi	# Timed out
> | FAIL: posix/bug-ga2			# DNS issue: google DNS vs. SNPS
> | FAIL: posix/globtest			# require same user on target and host
> | FAIL: posix/tst-getaddrinfo5		# passes outside corporate network
> - FAIL: resolv/tst-resolv-basic
> - FAIL: resolv/tst-resolv-edns
> - FAIL: resolv/tst-resolv-rotate
> - FAIL: resolv/tst-resolv-search
> | FAIL: stdio-common/bug22		# Needs more RAM: 2 GB memory
> | FAIL: sunrpc/bug20790			# missing cpp on target
> | FAIL: timezone/tst-tzset		# passes outside corporate network
> 
> 
> kindly review.
> 
> Thx,
> -Vineet
> 
> Vineet Gupta (13):
>   ARC: ABI Implementation
>   ARC: startup and dynamic linking code
>   ARC: Thread Local Storage support
>   ARC: Atomics and Locking primitives
>   ARC: math soft float support
>   ARC: hardware floating point support
>   ARC: Linux Syscall Interface
>   ARC: Linux ABI
>   ARC: Linux Startup and Dynamic Loading
>   ARC: ABI lists
>   ARC: Build Infrastructure
>   build-many-glibcs.py: Enable ARC builds
>   Documentation for ARC port
> 
>  NEWS                                          |   11 +
>  README                                        |    1 +
>  config.h.in                                   |    3 +
>  manual/install.texi                           |    4 +
>  scripts/build-many-glibcs.py                  |   10 +
>  sysdeps/arc/Implies                           |    3 +
>  sysdeps/arc/Makefile                          |   21 +
>  sysdeps/arc/Versions                          |    8 +
>  sysdeps/arc/__longjmp.S                       |   49 +
>  sysdeps/arc/abort-instr.h                     |    2 +
>  sysdeps/arc/atomic-machine.h                  |   69 +
>  sysdeps/arc/bits/endianness.h                 |   15 +
>  sysdeps/arc/bits/fenv.h                       |   78 +
>  sysdeps/arc/bits/link.h                       |   52 +
>  sysdeps/arc/bits/setjmp.h                     |   26 +
>  sysdeps/arc/bsd-_setjmp.S                     |    1 +
>  sysdeps/arc/bsd-setjmp.S                      |    1 +
>  sysdeps/arc/configure                         |  182 ++
>  sysdeps/arc/configure.ac                      |   26 +
>  sysdeps/arc/dl-machine.h                      |  341 +++
>  sysdeps/arc/dl-runtime.h                      |   42 +
>  sysdeps/arc/dl-sysdep.h                       |   25 +
>  sysdeps/arc/dl-tls.h                          |   30 +
>  sysdeps/arc/dl-trampoline.S                   |   72 +
>  sysdeps/arc/entry.h                           |    5 +
>  sysdeps/arc/fpu/fclrexcpt.c                   |   36 +
>  sysdeps/arc/fpu/fegetenv.c                    |   37 +
>  sysdeps/arc/fpu/fegetmode.c                   |   31 +
>  sysdeps/arc/fpu/fegetround.c                  |   32 +
>  sysdeps/arc/fpu/feholdexcpt.c                 |   43 +
>  sysdeps/arc/fpu/fesetenv.c                    |   48 +
>  sysdeps/arc/fpu/fesetexcept.c                 |   32 +
>  sysdeps/arc/fpu/fesetmode.c                   |   40 +
>  sysdeps/arc/fpu/fesetround.c                  |   40 +
>  sysdeps/arc/fpu/feupdateenv.c                 |   51 +
>  sysdeps/arc/fpu/fgetexcptflg.c                |   31 +
>  sysdeps/arc/fpu/fraiseexcpt.c                 |   39 +
>  sysdeps/arc/fpu/fsetexcptflg.c                |   38 +
>  sysdeps/arc/fpu/ftestexcept.c                 |   33 +
>  sysdeps/arc/fpu/libm-test-ulps                | 1140 +++++++++
>  sysdeps/arc/fpu/libm-test-ulps-name           |    1 +
>  sysdeps/arc/fpu/math-use-builtins.h           |   70 +
>  sysdeps/arc/fpu_control.h                     |  106 +
>  sysdeps/arc/gccframe.h                        |   21 +
>  sysdeps/arc/get-rounding-mode.h               |   38 +
>  sysdeps/arc/jmpbuf-offsets.h                  |   22 +
>  sysdeps/arc/jmpbuf-unwind.h                   |   47 +
>  sysdeps/arc/ldsodefs.h                        |   43 +
>  sysdeps/arc/libc-tls.c                        |   27 +
>  sysdeps/arc/machine-gmon.h                    |   35 +
>  sysdeps/arc/math-tests-trap.h                 |   27 +
>  sysdeps/arc/memusage.h                        |   23 +
>  sysdeps/arc/nofpu/Implies                     |    1 +
>  sysdeps/arc/nofpu/libm-test-ulps              |  270 +++
>  sysdeps/arc/nofpu/libm-test-ulps-name         |    1 +
>  sysdeps/arc/nofpu/math-tests-exceptions.h     |   27 +
>  sysdeps/arc/nofpu/math-tests-rounding.h       |   27 +
>  sysdeps/arc/nptl/Makefile                     |   22 +
>  sysdeps/arc/nptl/pthreaddef.h                 |   32 +
>  sysdeps/arc/nptl/tcb-offsets.sym              |   11 +
>  sysdeps/arc/nptl/tls.h                        |  148 ++
>  sysdeps/arc/preconfigure                      |   14 +
>  sysdeps/arc/setjmp.S                          |   66 +
>  sysdeps/arc/sfp-machine.h                     |   70 +
>  sysdeps/arc/sotruss-lib.c                     |   50 +
>  sysdeps/arc/stackinfo.h                       |   33 +
>  sysdeps/arc/start.S                           |   74 +
>  sysdeps/arc/sysdep.h                          |   53 +
>  sysdeps/arc/tininess.h                        |    1 +
>  sysdeps/arc/tls-macros.h                      |   47 +
>  sysdeps/arc/tst-audit.h                       |   23 +
>  sysdeps/unix/sysv/linux/arc/Implies           |    3 +
>  sysdeps/unix/sysv/linux/arc/Makefile          |   29 +
>  sysdeps/unix/sysv/linux/arc/Versions          |   16 +
>  sysdeps/unix/sysv/linux/arc/arch-syscall.h    |  303 +++
>  sysdeps/unix/sysv/linux/arc/bits/procfs.h     |   35 +
>  sysdeps/unix/sysv/linux/arc/bits/timesize.h   |   21 +
>  .../sysv/linux/arc/bits/types/__sigset_t.h    |   12 +
>  sysdeps/unix/sysv/linux/arc/c++-types.data    |   67 +
>  sysdeps/unix/sysv/linux/arc/clone.S           |   93 +
>  sysdeps/unix/sysv/linux/arc/configure         |    4 +
>  sysdeps/unix/sysv/linux/arc/configure.ac      |    4 +
>  sysdeps/unix/sysv/linux/arc/dl-static.c       |   84 +
>  .../unix/sysv/linux/arc/fixup-asm-unistd.h    |   41 +
>  sysdeps/unix/sysv/linux/arc/getcontext.S      |   64 +
>  sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h  |    6 +
>  sysdeps/unix/sysv/linux/arc/kernel-features.h |   27 +
>  sysdeps/unix/sysv/linux/arc/kernel_stat.h     |   26 +
>  sysdeps/unix/sysv/linux/arc/ld.abilist        |    5 +
>  sysdeps/unix/sysv/linux/arc/ldconfig.h        |   27 +
>  sysdeps/unix/sysv/linux/arc/ldsodefs.h        |   32 +
>  .../sysv/linux/arc/libBrokenLocale.abilist    |    1 +
>  sysdeps/unix/sysv/linux/arc/libanl.abilist    |    4 +
>  sysdeps/unix/sysv/linux/arc/libc.abilist      | 2084 +++++++++++++++++
>  sysdeps/unix/sysv/linux/arc/libcrypt.abilist  |    2 +
>  sysdeps/unix/sysv/linux/arc/libdl.abilist     |    9 +
>  sysdeps/unix/sysv/linux/arc/libm.abilist      |  699 ++++++
>  .../unix/sysv/linux/arc/libpthread.abilist    |  213 ++
>  sysdeps/unix/sysv/linux/arc/libresolv.abilist |   79 +
>  sysdeps/unix/sysv/linux/arc/librt.abilist     |   35 +
>  .../unix/sysv/linux/arc/libthread_db.abilist  |   40 +
>  sysdeps/unix/sysv/linux/arc/libutil.abilist   |    6 +
>  sysdeps/unix/sysv/linux/arc/localplt.data     |   12 +
>  sysdeps/unix/sysv/linux/arc/makecontext.c     |   73 +
>  sysdeps/unix/sysv/linux/arc/mmap_internal.h   |   27 +
>  sysdeps/unix/sysv/linux/arc/setcontext.S      |   93 +
>  sysdeps/unix/sysv/linux/arc/shlib-versions    |    7 +
>  sysdeps/unix/sysv/linux/arc/sigaction.c       |   31 +
>  sysdeps/unix/sysv/linux/arc/sigcontextinfo.h  |   28 +
>  sysdeps/unix/sysv/linux/arc/sigrestorer.S     |   29 +
>  sysdeps/unix/sysv/linux/arc/swapcontext.S     |   94 +
>  sysdeps/unix/sysv/linux/arc/sys/cachectl.h    |   35 +
>  sysdeps/unix/sysv/linux/arc/sys/ucontext.h    |   57 +
>  sysdeps/unix/sysv/linux/arc/sys/user.h        |   31 +
>  sysdeps/unix/sysv/linux/arc/syscall.S         |   33 +
>  sysdeps/unix/sysv/linux/arc/syscalls.list     |    3 +
>  sysdeps/unix/sysv/linux/arc/sysdep.c          |   33 +
>  sysdeps/unix/sysv/linux/arc/sysdep.h          |  224 ++
>  sysdeps/unix/sysv/linux/arc/ucontext-macros.h |   25 +
>  sysdeps/unix/sysv/linux/arc/ucontext_i.sym    |   20 +
>  sysdeps/unix/sysv/linux/arc/vfork.S           |   42 +
>  121 files changed, 9146 insertions(+)
>  create mode 100644 sysdeps/arc/Implies
>  create mode 100644 sysdeps/arc/Makefile
>  create mode 100644 sysdeps/arc/Versions
>  create mode 100644 sysdeps/arc/__longjmp.S
>  create mode 100644 sysdeps/arc/abort-instr.h
>  create mode 100644 sysdeps/arc/atomic-machine.h
>  create mode 100644 sysdeps/arc/bits/endianness.h
>  create mode 100644 sysdeps/arc/bits/fenv.h
>  create mode 100644 sysdeps/arc/bits/link.h
>  create mode 100644 sysdeps/arc/bits/setjmp.h
>  create mode 100644 sysdeps/arc/bsd-_setjmp.S
>  create mode 100644 sysdeps/arc/bsd-setjmp.S
>  create mode 100644 sysdeps/arc/configure
>  create mode 100644 sysdeps/arc/configure.ac
>  create mode 100644 sysdeps/arc/dl-machine.h
>  create mode 100644 sysdeps/arc/dl-runtime.h
>  create mode 100644 sysdeps/arc/dl-sysdep.h
>  create mode 100644 sysdeps/arc/dl-tls.h
>  create mode 100644 sysdeps/arc/dl-trampoline.S
>  create mode 100644 sysdeps/arc/entry.h
>  create mode 100644 sysdeps/arc/fpu/fclrexcpt.c
>  create mode 100644 sysdeps/arc/fpu/fegetenv.c
>  create mode 100644 sysdeps/arc/fpu/fegetmode.c
>  create mode 100644 sysdeps/arc/fpu/fegetround.c
>  create mode 100644 sysdeps/arc/fpu/feholdexcpt.c
>  create mode 100644 sysdeps/arc/fpu/fesetenv.c
>  create mode 100644 sysdeps/arc/fpu/fesetexcept.c
>  create mode 100644 sysdeps/arc/fpu/fesetmode.c
>  create mode 100644 sysdeps/arc/fpu/fesetround.c
>  create mode 100644 sysdeps/arc/fpu/feupdateenv.c
>  create mode 100644 sysdeps/arc/fpu/fgetexcptflg.c
>  create mode 100644 sysdeps/arc/fpu/fraiseexcpt.c
>  create mode 100644 sysdeps/arc/fpu/fsetexcptflg.c
>  create mode 100644 sysdeps/arc/fpu/ftestexcept.c
>  create mode 100644 sysdeps/arc/fpu/libm-test-ulps
>  create mode 100644 sysdeps/arc/fpu/libm-test-ulps-name
>  create mode 100644 sysdeps/arc/fpu/math-use-builtins.h
>  create mode 100644 sysdeps/arc/fpu_control.h
>  create mode 100644 sysdeps/arc/gccframe.h
>  create mode 100644 sysdeps/arc/get-rounding-mode.h
>  create mode 100644 sysdeps/arc/jmpbuf-offsets.h
>  create mode 100644 sysdeps/arc/jmpbuf-unwind.h
>  create mode 100644 sysdeps/arc/ldsodefs.h
>  create mode 100644 sysdeps/arc/libc-tls.c
>  create mode 100644 sysdeps/arc/machine-gmon.h
>  create mode 100644 sysdeps/arc/math-tests-trap.h
>  create mode 100644 sysdeps/arc/memusage.h
>  create mode 100644 sysdeps/arc/nofpu/Implies
>  create mode 100644 sysdeps/arc/nofpu/libm-test-ulps
>  create mode 100644 sysdeps/arc/nofpu/libm-test-ulps-name
>  create mode 100644 sysdeps/arc/nofpu/math-tests-exceptions.h
>  create mode 100644 sysdeps/arc/nofpu/math-tests-rounding.h
>  create mode 100644 sysdeps/arc/nptl/Makefile
>  create mode 100644 sysdeps/arc/nptl/pthreaddef.h
>  create mode 100644 sysdeps/arc/nptl/tcb-offsets.sym
>  create mode 100644 sysdeps/arc/nptl/tls.h
>  create mode 100644 sysdeps/arc/preconfigure
>  create mode 100644 sysdeps/arc/setjmp.S
>  create mode 100644 sysdeps/arc/sfp-machine.h
>  create mode 100644 sysdeps/arc/sotruss-lib.c
>  create mode 100644 sysdeps/arc/stackinfo.h
>  create mode 100644 sysdeps/arc/start.S
>  create mode 100644 sysdeps/arc/sysdep.h
>  create mode 100644 sysdeps/arc/tininess.h
>  create mode 100644 sysdeps/arc/tls-macros.h
>  create mode 100644 sysdeps/arc/tst-audit.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/Implies
>  create mode 100644 sysdeps/unix/sysv/linux/arc/Makefile
>  create mode 100644 sysdeps/unix/sysv/linux/arc/Versions
>  create mode 100644 sysdeps/unix/sysv/linux/arc/arch-syscall.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/bits/procfs.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/bits/timesize.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/bits/types/__sigset_t.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/c++-types.data
>  create mode 100644 sysdeps/unix/sysv/linux/arc/clone.S
>  create mode 100644 sysdeps/unix/sysv/linux/arc/configure
>  create mode 100644 sysdeps/unix/sysv/linux/arc/configure.ac
>  create mode 100644 sysdeps/unix/sysv/linux/arc/dl-static.c
>  create mode 100644 sysdeps/unix/sysv/linux/arc/fixup-asm-unistd.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/getcontext.S
>  create mode 100644 sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/kernel-features.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/kernel_stat.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/ld.abilist
>  create mode 100644 sysdeps/unix/sysv/linux/arc/ldconfig.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/ldsodefs.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
>  create mode 100644 sysdeps/unix/sysv/linux/arc/libanl.abilist
>  create mode 100644 sysdeps/unix/sysv/linux/arc/libc.abilist
>  create mode 100644 sysdeps/unix/sysv/linux/arc/libcrypt.abilist
>  create mode 100644 sysdeps/unix/sysv/linux/arc/libdl.abilist
>  create mode 100644 sysdeps/unix/sysv/linux/arc/libm.abilist
>  create mode 100644 sysdeps/unix/sysv/linux/arc/libpthread.abilist
>  create mode 100644 sysdeps/unix/sysv/linux/arc/libresolv.abilist
>  create mode 100644 sysdeps/unix/sysv/linux/arc/librt.abilist
>  create mode 100644 sysdeps/unix/sysv/linux/arc/libthread_db.abilist
>  create mode 100644 sysdeps/unix/sysv/linux/arc/libutil.abilist
>  create mode 100644 sysdeps/unix/sysv/linux/arc/localplt.data
>  create mode 100644 sysdeps/unix/sysv/linux/arc/makecontext.c
>  create mode 100644 sysdeps/unix/sysv/linux/arc/mmap_internal.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/setcontext.S
>  create mode 100644 sysdeps/unix/sysv/linux/arc/shlib-versions
>  create mode 100644 sysdeps/unix/sysv/linux/arc/sigaction.c
>  create mode 100644 sysdeps/unix/sysv/linux/arc/sigcontextinfo.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/sigrestorer.S
>  create mode 100644 sysdeps/unix/sysv/linux/arc/swapcontext.S
>  create mode 100644 sysdeps/unix/sysv/linux/arc/sys/cachectl.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/sys/ucontext.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/sys/user.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/syscall.S
>  create mode 100644 sysdeps/unix/sysv/linux/arc/syscalls.list
>  create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.c
>  create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext-macros.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext_i.sym
>  create mode 100644 sysdeps/unix/sysv/linux/arc/vfork.S
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
