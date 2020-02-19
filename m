Return-Path: <SRS0=t4uf=4H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE46C34056
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 18:42:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D9A24670
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 18:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WxbopQTq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YabdjXLA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="JP6iWAch"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8D9A24670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQb5NGqHqr8ivTIyoDMnk7mnOi7I4hd+dsnMrbf3oeA=; b=WxbopQTqnYW7v1
	LGDMfSsbud0zWkeZqIeu0LLPQqMOHm7qCr+KoFPP+s9yvyJQ3F6FX70JB/f4ITvSd3SfqVUutyb1r
	wfehrb5pIYYaDcWEmPvaKBH1pfjfOrvrzEITBruIcdPx6wlQZBI3ExtJ0fyOHwvlsYKR+cpRK+csz
	CyB1OUiR8nkYqegAZCxMOs7DN8Rtr0GpybYui+wTOzmDiW3d1+3q6opvaxy6Ugtuc8uhJLQMa7ccH
	NWSKNoyfzoHPXMAKcmiljAAEwSo1bZBgqP63k58LN/0AGgDbAhR3Y9I3D9vgGyQ0+j58BINRDNArZ
	xH8Xf9O+BeFpt/f7aJ6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4UIu-0006Ix-FD; Wed, 19 Feb 2020 18:42:36 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4UIs-0006I8-5M
 for linux-snps-arc@lists.infradead.org; Wed, 19 Feb 2020 18:42:35 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2C83DC068B;
 Wed, 19 Feb 2020 18:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582137753; bh=+c27kLE0BVRK1Ub2dMBqDTCi1nw8iw4W8vMjqraNoBo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=YabdjXLAureIniJ9KYnOy9xfw5xn8JuYx6vzoJoOwyeo7CoZ+Wto0Mc4LTU64Z87M
 nyM8mKbtRG0/mAcdUt1H7OKA5rNIA0iVdjbcxzmRKBEU1yHru+w3YBKWn0Ao9p6u8K
 g/4tR3z7V9NdUBDn1bu7K0aLTFwk2Qt/+GgHaYOAmsseSRJM5vWQDGUOUMyYiGXcjg
 Kif6yVsuX/gRkk0B3bA1STg02Q5EUIaMjK4F+YYNXU/hOyku7AwnboS09rwz1UJwnr
 /mPRadF0qyJVRnWYBS3AeAlaAmX5wXThcx0H9dKY3rJ1eoDY6hSX355FqUDi/ZxOdn
 Wd05zL7n0zdKw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3C23EA00B1;
 Wed, 19 Feb 2020 18:42:21 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 19 Feb 2020 10:42:20 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 19 Feb 2020 10:42:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnIyJJ/zsMPiu3Vg77OYIMTWyX7JYhmLSYbbY8DU1gf9Dux7bAA6Fu2OLx4X8+i3b1rScCJueW+OJz75XFovgEZNevUFRvuutIv8y6BjVs/Uz03jcHq7vQGY3XnzW8shxYNjOiB0FlYL7EdJJRo32WuYM55iIITyD8wWUjITdVbTIfLrQ7zif8li8JsDW7ZgXipJXMbg2K2bhu8/uPOIii2Y8m4EWTsk8rH2UwIla1wgk50V60yGzTa4aizE92VszFlTH3hW0Q/ngW1wZnht9W7Jn2YdvDypZe1R0NjfMhJVUk2xLFITT0L4bhNpF8iTynBiThPVOVxONANoK6tTQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+c27kLE0BVRK1Ub2dMBqDTCi1nw8iw4W8vMjqraNoBo=;
 b=lNv3y2FEEg1GG2/csKoyhbM+uvUO8Y8pbqAuX/HlIjpU8TQfGfS193Q50UEMRzRMw7oarNsCSr3a5P6IoCfrF0pHcQLdLBqK8sRAYwMTIiPiYxC7cmyp2UjWHMFltfDivkwnZfl14GAsROOLz9BBKWAlin4NbIsF5e1+bPgUEn1kbd/49FVNyKKTsvek3TpWgvgGgouOZw28gItrB/vI7e1xcbekhcaGUPL5sOgd7SYtnGQX+3UQRPVDLmceQFNdB77jKRMqsX1EdMkuBstaqyuiF+KjI9HGhaG8slq0q2MiK3O3HSDNFiIQxn0EWW6smPHX/ZnxH5aOwBvIRIVEdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+c27kLE0BVRK1Ub2dMBqDTCi1nw8iw4W8vMjqraNoBo=;
 b=JP6iWAchT9hzA06uLGySOA3LmV5xvLX2o6Kn0k6rbmTs+phboJaGcdvIf2NiA8YXPtGOUSkPtmIImZ2KTma2k5a7IEewLQIhBw1tgzyU3GgoCXN/rzjCZzbhWekJIxv36vAMF0u/cSF/yJflaqt6y+BhR8jyVBQOSYqZGUqgBcY=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB2679.namprd12.prod.outlook.com (20.177.126.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17; Wed, 19 Feb 2020 18:42:18 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24%7]) with mapi id 15.20.2729.033; Wed, 19 Feb 2020
 18:42:18 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
Thread-Topic: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
Thread-Index: AQHV5r98yBwAtZ909UCZTNuzjj/4mKghs08AgAAHuoCAAHWFaoAAqpGA
Date: Wed, 19 Feb 2020 18:42:18 +0000
Message-ID: <8239db87-d736-a6e2-913d-c1e5e937688f@synopsys.com>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <67f2298c-30ab-1508-4a10-6ee285df7ad1@synopsys.com>
 <CAKmqyKO6u15cDbQQ644GrABi=6WWQsNLiCVLszrmDCdcWBnCPA@mail.gmail.com>
 <c9f11e9e-7c33-0000-e32c-346d425d7c69@synopsys.com> <mvmimk3567z.fsf@suse.de>
In-Reply-To: <mvmimk3567z.fsf@suse.de>
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
x-ms-office365-filtering-correlation-id: 201433b1-4f75-47cf-5063-08d7b56b72d5
x-ms-traffictypediagnostic: BYAPR12MB2679:
x-microsoft-antispam-prvs: <BYAPR12MB267912C8E2A56CC5390770DBB6100@BYAPR12MB2679.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(6916009)(86362001)(31696002)(6506007)(6512007)(7416002)(478600001)(6486002)(316002)(54906003)(53546011)(71200400001)(186003)(4744005)(26005)(5660300002)(66446008)(76116006)(36756003)(2906002)(66556008)(2616005)(31686004)(64756008)(4326008)(66476007)(8676002)(81166006)(81156014)(66946007)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2679;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bWzT4ad56vSWwSEh2jL5f2Q8qjCIBeRHY9DzFrlExhi2kVC4B62TC6N/w6mDXwTLod8m+bWXCFJKRQ970cnfAxBrqSFmygFh/OecnBF1z87UVdKbE8v1Ww93VQgCgnRyV8lejLCw0/QINdi6FEV4bdpWCmGUmmqrACLrXklV5puUmzjzk9KOIdD34Ify4hqkOSRl3rYO6xmPbOd+jX8FQPNbm6Yxr9GFNKx6esGlWGJZkYzsxJzz6DrlYTQ0u+y7fTQCBSA8qwzdZ7bnz/VDg6+C//fia1y44cE949OwuvZYDd4aCdePjQEfUA6sh16VsN310DjUiYRERACcpljT6x1F7ZoSNy6wjLVUcmmvudPutUTXbTBM8bPJevtQUqETwz5Q6n7BNi9unHo3FmRogRrN/sk1WI7gDd8i2gFRKs2taO71+rvLyFw6k0RglOTd
x-ms-exchange-antispam-messagedata: Y9NAYQBTv2AAa9ud1paICSM38r9XXhq5EdiryQYlqldYJhXoudo5n4Dd/A0VlTMfeIGNWwiPkl/v1QDv11hKVwCqazX7dNqh5JH3IXXstTcQMe4/gxu+BXhcQrbJUxcyPisPiccvdrZhl/5/gJdt1w==
x-ms-exchange-transport-forked: True
Content-ID: <41D624CFF3B0BD48B30B1D66BDA50957@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 201433b1-4f75-47cf-5063-08d7b56b72d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 18:42:18.7275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XafBXbmfmo8g85vwHmBx4CinptZXrCDSEB/9sQva2VKsdbEVWxmYb9yv1i4XnpLYPXJHAhCpY3WNZhxSATlAVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2679
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_104234_322031_A7CB4272 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: "fweimer@redhat.com" <fweimer@redhat.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "palmerdabbelt@google.com" <palmerdabbelt@google.com>,
 "zongbox@gmail.com" <zongbox@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "adhemerval.zanella@linaro.org" <adhemerval.zanella@linaro.org>,
 "macro@wdc.com" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "joseph@codesourcery.com" <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2/19/20 12:30 AM, Andreas Schwab wrote:
> On Feb 19 2020, Vineet Gupta wrote:
> 
>> On 2/18/20 5:03 PM, Alistair Francis wrote:
>>>>> +#define STAT_IS_KERNEL_STAT 1
>>>> Isn't this irrelevant: seems to be only used for legacy __NR_stat/__NR_stat64
>>>> syscalls based__xstat()/__xstat64().
>>> Is it? It seems to be used in a few places, including:
>>>
>>> sysdeps/unix/sysv/linux/fxstatat.c
>>> sysdeps/unix/sysv/linux/xstatconv.c
>> AFAIK that is not part of the asm-generic syscall ABI which ARC, RISCV et al use !
>
> The latter is still included by everyone, though.

Correct, although it only builds a "dummy" struct for #ifdef STAT_IS_KERNEL_STAT
i.e. for either values of this define - we might as well move that dummy out and
make the rest of code ifndef.

Rest of code in that function __xstat_conv is not meant for asm-generic syscall
ABI  anyways.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
