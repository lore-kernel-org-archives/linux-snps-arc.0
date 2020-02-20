Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D7DC5ACC4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 00:27:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFFBD207FD
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 00:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LXtmyK0a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="asmPa7po";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="Y9SF2eMk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFFBD207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x21N91NLfXWGhoJwXLxZTTzVss6eh026aO8EznLZWRw=; b=LXtmyK0az6f9hj
	nRpL+cE0ACYKT+og3Ift61cdEg0Vv2mwuFm6VfnPSzEi5aSpM4Zsl24ZWDshZn7y/tlu9WDu/9Se2
	xMZvLz8RYs4Ks/jGEfPbNVFPvkrGsMVM5NB89fwj4cIZKEVXQb9Q9+71uf0WCQ/XeNRx1sO9qMndA
	tsJfbcFuXy0nIo+i40g6RlN0harxabzl7Imfi8rCBBy/75EawPYRCSx3yxkuedN4iySizPwfzJ7Gt
	UyJwajb8aScrfQl6K8RNFz7+hLku8bQWLLlF36wtZly1+tiiVlzsEpC88PY9eVFV/L/fHkbZkArwE
	Iu7ZWSLBw+Q0f+fEkQ+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Zgb-0007w7-Cr; Thu, 20 Feb 2020 00:27:25 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4ZgZ-0007va-1t
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 00:27:24 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 368B0C08AC;
 Thu, 20 Feb 2020 00:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582158440; bh=kAmKq2IFSD5W4x9ePSIcW/KmTp/5pzdiBJwPzsrFiK0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=asmPa7porKIF8K9UqC4Fi77xGGSZvbXePjrT9hOphR+foNBCdFCdMPAstrNDlxV3K
 9k+hZS/nLvuT1cpokiepNDqikw3a5fQPJDJ43qNuM73IxEpHgaCZCpIfAUUA7c/xX0
 nm8tMydfNzJhOc+0U7Z3g1whKNwTfGxl64XJRGnQGZU/d54sUPs+A/1E1n9m9I2Ust
 EyECuJBcbE/S3I91vUrcALo7Iy2OBYeHmoELVJTpt/mgQ9sTkADmTxUZPPauZVbPFT
 iMjvgYsGdE8VVEMaAzikYpQmqrg6CDHC1UhkYjAmNqOt7SolWllHJO/93KyFbyKsl9
 007uF2iNt1wJw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9606DA0083;
 Thu, 20 Feb 2020 00:27:17 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 19 Feb 2020 16:26:20 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 19 Feb 2020 16:26:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKI+p4SxExnihQUQef5KlqGlv/JliHnRRD9iQsUwYH21gZoeb9Hyebj6NWdLKrRqpKCQXCPXeLvfJ3dKD6n05UbvN28f23CnQIvwZJX+TTyt48iD87h7lvAiObUTPtafyl8sgJHaMxoHixATUdVVE5XTgw1DCShmhcTZdntx5P4Jw16e5FQigEqqgE2jci3NXC3km8NETA3sQk+t/0StbBFbf06+12vua0VPgiUvAQn77O0t+OqfRs09waDJ/1UaiLaDTQGM1vnQNrL7esVvQP5Asmhtn7GLLFwb5Z6IMyiK1dOYzaup/lDseFUVg3aCGl3MALtJpteEcx+rI3c3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=radv2WN9lF7azjjmUlWI5gBd3mF+vtGZSaWc8MWfrmQ=;
 b=KbtODqMslXACv8zBGdQzb6k+qcb8QKiiU5yQs9fhOim4NlQdC9TrHRkvpiko9mHEr88ZtfRHmZ6l77Z6NEjUJWoLenFDxksJxC8A4OzqKx/fu/RM60++Gljg9MaYDfjeZVYGCByFt7ddGN5IoRqJ78l1zH9hisfl8KfshX6Sd2xNREXOLXWpwpWxJ2gbJMJaxhk6fkHCP4ZkYa3zyrCn68KC8Da7uhzt+1tqqFdIFgtPTTKfOGC2Rs3K7JsZWARHk9bx52weQirAr/jHj7NkoyHWy7hcbBXvVtXv21oKQysIMN92TzPn7dFL6M96mictxShcgsjaIYGg1itr08rNGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=radv2WN9lF7azjjmUlWI5gBd3mF+vtGZSaWc8MWfrmQ=;
 b=Y9SF2eMkMIwdJSaZ9NpSD8qYY7D8GBx8w93RligOiRrGM250wbniDy58+FIowWzM0EH5kIc15bJJnQDnRf8w+bTNmjtjwFjaD9Lw8Vc6cONZWnO5Rpnfj+g2kgP2oGJBrCKFNpU5ieT49PQNTunmNPBm5CtZCMLUDlD1ZXHpyuM=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3464.namprd12.prod.outlook.com (20.178.53.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Thu, 20 Feb 2020 00:26:18 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24%7]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 00:26:17 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
Thread-Topic: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
Thread-Index: AQHV5r98yBwAtZ909UCZTNuzjj/4mKghs08AgAAHuoCAAHWFaoAAqpGAgABNIwCAABL6gA==
Date: Thu, 20 Feb 2020 00:26:17 +0000
Message-ID: <de8f8e28-630f-7b87-1a96-6131588a0346@synopsys.com>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <67f2298c-30ab-1508-4a10-6ee285df7ad1@synopsys.com>
 <CAKmqyKO6u15cDbQQ644GrABi=6WWQsNLiCVLszrmDCdcWBnCPA@mail.gmail.com>
 <c9f11e9e-7c33-0000-e32c-346d425d7c69@synopsys.com> <mvmimk3567z.fsf@suse.de>
 <8239db87-d736-a6e2-913d-c1e5e937688f@synopsys.com>
 <20200220001822.703ee8a1@jawa>
In-Reply-To: <20200220001822.703ee8a1@jawa>
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
x-ms-office365-filtering-correlation-id: f6c32fb6-c938-4b7a-2e3d-08d7b59b809a
x-ms-traffictypediagnostic: BYAPR12MB3464:
x-microsoft-antispam-prvs: <BYAPR12MB34647CBDF79D0F7A206B0189B6130@BYAPR12MB3464.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(376002)(136003)(366004)(39860400002)(199004)(189003)(81156014)(8936002)(81166006)(8676002)(71200400001)(6916009)(86362001)(316002)(478600001)(54906003)(6486002)(2616005)(6512007)(7416002)(5660300002)(64756008)(66446008)(26005)(186003)(2906002)(31686004)(76116006)(66946007)(6506007)(4326008)(66476007)(66556008)(53546011)(36756003)(31696002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3464;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sJksab3UicMiSVSIvcHqja0SmQCBI3dct3p8gKRLzVL59ziiCXxBWzu2MxMZ1vaKicCufud70j1bEghxV5zwxAVYxHVoyS6mMF4r89IBAIhrbw+VVgsVxEvxNIRKKL2uvXTBTD3JqPrw3mqxzu4nBovK0kMjfQUOQKYWJdvFxVV+O6Qw69foxfCiPhNT66NUrFC8r9FCSWiOwfePNtvh8SS6XmkK+B/VPk30tim1rAmuHDvvk4rGveXs0u8/lihtJ+qP7oaOe5kmlOJQcAne16CpKUo/EH9TSDgB8E6gQJ8ZHSyDSNgy25t7eTnQ2iAMist0nyCzUkptbfMI6FsrII8rwMFX8wRb4LEBIwqp5ZbWol7nH4E5ui/QPwVQa+NNv9yJiuK8vVHB4HLFwzgqBMjOIhBHKapzhlHbz41MKLRvl22pO+h13UxnSA/iAHUi
x-ms-exchange-antispam-messagedata: x5/ohfXw4sWyKtn1RQXenUqnoUQPiVjlhv01j++G0YsiI7va03xuN6hn9QkGrswDP/VKnuuGDM1fWf7NEt/v3m15xwoOrsTu1e6+BncbtR1qmuLXULVxL7ZLooCAiTO4SCyYfRbjJGqo0vl9Gr7P/A==
x-ms-exchange-transport-forked: True
Content-ID: <439FCD14F7EFE04C8A1BDF24EF16EA59@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c32fb6-c938-4b7a-2e3d-08d7b59b809a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 00:26:17.6252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WEBkdyKy3eaG24kgWE0sIp8bIKgNlpbN7Sx+4fhAVJpI+SAt7kw+iJObqB3rJiq8GX1d4Dk3EUHtOuNG5xotdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3464
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_162723_221654_D4B81E08 
X-CRM114-Status: GOOD (  12.32  )
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
 "arnd@arndb.de" <arnd@arndb.de>, Andreas Schwab <schwab@suse.de>,
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

Hi Lukasz,

On 2/19/20 3:18 PM, Lukasz Majewski wrote:
> Please keep in mind that there are some architectures (like 32 bit
> ARM), which are NOT using asm-generic API.

Right understand that.

> Those archs also require support for 64 bit time. That is why Alistair
> put the [sg]etitimer conversion code into sysdeps/unix/sysv/linux/
> directory.
> 
> In that way all eligible archs could reuse the same conversion code.

Do note that the statx syscall to glibc stat64 interworking is already usable for
both cases as it is in sysdeps/unix/sysv/linux/statx_cp.*

Is see that for ARM32, following files are built:

sysdeps/unix/sysv/linux/arm/xstat.c
sysdeps/unix/sysv/linux/arm/fxstat.c
sysdeps/unix/sysv/linux/arm/lxstat.c
sysdeps/unix/sysv/linux/arm/fxstatat.c

sysdeps/unix/sysv/linux/xstat64.c
sysdeps/unix/sysv/linux/fxstat64.c
sysdeps/unix/sysv/linux/lxstat64.c
sysdeps/unix/sysv/linux/fxstatat64.c

My patch will switch the last 4 for ARM as well.

The first 4 will need more work as sym aliasing like
	strong_alias (__xstat64, __xstat)

will be needed in those ARM files (which in turn use i386).

Anyhow, let me test my patch and then we can take it from there !

Thx,
-Vineet



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
