Return-Path: <SRS0=RZv2=45=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925FAC0044D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Mar 2020 00:53:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83B00206F7
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Mar 2020 00:53:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pZULjCKF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gk5zQRAT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="py5lZJmX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83B00206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zJLGi9I32JLLDbssRczjRBcTYo/+K14WcC8GJjuVQ0=; b=pZULjCKFY9Mhst
	o3YNZNGzMFyc3y8srETcSgPkAqq7iQkuam5DG8ibVTaruygGsv3/gO+iF1Apq0QQD5AUC+2OTNMOT
	2MD3UDrfgv8ewyQ5ylRJPypTDfSsZQF+WweXOKPfZRg/pLo6pGTc2JMBcEEdQ7JNZleA/Y/3GVr4K
	fWgYH/kS65pIsPLRsSM8IqYFYbllB9F+3OC6p++0shkXs3T58wD9e5RUT+Seud/5bsHYcUd9CLslA
	mNMLXSfqTuGsJ++SD3CiVjwTCLYP5cItFTPe9KZgwdZhQUnUW3OwLFL5QAZSYUAMi2m8zGf/84N+S
	xsz/zeGnJisC24DjG2jA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCC6M-0005ga-Ax; Thu, 12 Mar 2020 00:53:30 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCC6J-0005fy-Mr
 for linux-snps-arc@lists.infradead.org; Thu, 12 Mar 2020 00:53:29 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B34B843B6F;
 Thu, 12 Mar 2020 00:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583974404; bh=IyMpdOT1RrD+Zb90EXGF9uufozKyCDFTxdvWkcX7H7g=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=gk5zQRATcraHoEL9YfJivtpEuUTXRSyUGWWNA/P6ro2Tr0MTigQrcPcCtMYp7PD1o
 cmRqI0vmSI20EpKWTt4QUQmAfStvTaDpz61/LgJuM41wrhSlO3L5OkIlDKlxJxHQ5G
 F8EAysVwBWNzVCaQQexbcbkHd0x+K1dAc6PQbkwJ/enqJCNGPL26e20re14S1yLzz6
 JMnSX/p3kmJs0f226jc3ywENWJC7sCsPzN7DvtPn+cYKxFFL4fCUFxdB2qZ5hV/WXE
 bXpTP7S/tAxbIiCTAXr8kuyjktSKdXE7l8q4hK90/QB99ucfu+RoSYSvFLHQw5cQ1p
 zkkbtWI6cCl0g==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3B13FA0085;
 Thu, 12 Mar 2020 00:53:24 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 11 Mar 2020 17:53:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 11 Mar 2020 17:53:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkZlsE012E/xAoD0aoRzJW6x7VqjFh+UB/puj2ePWF8a1mZSwKhDN7JeHsMKHpEo/fNvBelHF45SEDAsvTx/mRAG+DFM8EzA3Xby4+jOYI1vDe3PhR0+n0hkuGksxqpxbJWyibtn45tnyTMdpz7b8yTgZg4rjGcCLI2d0F532rGhVIvQ4uYZSVu9Ginu/KWSKZLYkkFszbWnBR3VdpBxFKNmhsWjr8tInt1fgLVt2u8nxlWyoL240HawDLIjogA7rWzBKBoCLVSbuFCosy+fCBQ8PHkxJ5uv3+Q9Ntyz+ioTwE95oTqvTw61JIHfl7wXlx6wBCqRs5Wnu4PAy3VcpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyMpdOT1RrD+Zb90EXGF9uufozKyCDFTxdvWkcX7H7g=;
 b=hPnHchzFWh1Kq3JuAEl+236TUvX+rFF9CKkxDh6Qm0RTS5T8ZVg83riTrdFNOfGHHLR9u4m5fchSzZbbrviukpKIvjv7kWiBoECM35ub9HmfH9agye6VtiZBHsn5FbiiJn1jvaN5tAKF7JlrGYeSDrwLrrCIqt917VKJpVnufHCrLRRG9wsVB8irJP4nK6cUqFRGuLTKSvai6LOVOTptN1uroMuAGyEJBKGOWrBOX8zCICKz5jCEh9IMI7B3nCvHIJQF8yVZ08/gjLQpyyv8Olch3MygrsyuqAxgrdj2xR3dSQFeMMIC4LWL0ZKSxliM4+Tc0GzBU4uZ1LyxsXQBxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyMpdOT1RrD+Zb90EXGF9uufozKyCDFTxdvWkcX7H7g=;
 b=py5lZJmXKJak+vD/oX7hgeauXC+QTITTIX/aGEehWFkrSLDM7a1fWdBzx6hDy3y4q5ciQeoB9zOnZDm4YMySga8ahkXK96GG/pnkXQSHkwiCylT4E1GEOfMQ+5rvPzw1uGWJByxaqY2Zt9BbV4WDSWZjd618Dt8d1/DMi9f44lA=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3046.namprd12.prod.outlook.com (2603:10b6:a03:aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Thu, 12 Mar
 2020 00:53:09 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Thu, 12 Mar 2020
 00:53:09 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: DJ Delorie <dj@redhat.com>
Subject: Re: How to elf/tst-ldconfig-* in cross test setup
Thread-Topic: How to elf/tst-ldconfig-* in cross test setup
Thread-Index: AQHV9/R629dkX7tSWkK2XcvKH3zd/KhD+5kAgAAFAoCAACCwgA==
Date: Thu, 12 Mar 2020 00:53:09 +0000
Message-ID: <e760821e-6989-272a-8e0e-30d125fef3cc@synopsys.com>
References: <e92a698d-1378-5990-d7f8-05c27c5bd689@synopsys.com>
 <xntv2u4jca.fsf@greed.delorie.com>
 <4d6baa8e-2fd5-061f-68aa-eca6e11a3999@synopsys.com>
 <ae672720-ff2d-c6b9-3e48-7ab4b465b1d9@synopsys.com>
In-Reply-To: <ae672720-ff2d-c6b9-3e48-7ab4b465b1d9@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 20db9d4a-0e41-4d8a-0c8e-08d7c61fbbec
x-ms-traffictypediagnostic: BYAPR12MB3046:
x-microsoft-antispam-prvs: <BYAPR12MB304613C9FD60DE55FDA794ADB6FD0@BYAPR12MB3046.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(346002)(376002)(396003)(366004)(199004)(6506007)(8936002)(5660300002)(76116006)(36756003)(66946007)(64756008)(2906002)(81156014)(66556008)(4326008)(86362001)(66446008)(6512007)(54906003)(186003)(66476007)(81166006)(53546011)(6486002)(8676002)(31686004)(71200400001)(2616005)(478600001)(26005)(31696002)(6916009)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3046;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FR2HrYguQuPckRh8bQ9kKGXs4m2/73sySdZtqLI4SIygv3Ws52tvuI5y8+O9HcQiD/f+DmtDx5P52IDz7KvlLSTqyNW9lwm8PcEnKetQMuZsfhA7jyWOXmRfsb2GJtgWP5WDdqpLJnSoPIBsyW1Y8C61biTTgWguZZ9Q3bIOCtallrK0i6a/D7p7Zp9mQW43mOv9ygCkJn13wz7Vf+8RScPTYLOaQ6zGdSHsIRUT/CuOnd7lLW9Cc9YaS3eITEF5x2SbyOFapuJW9m2UoPUps5Q40BUNHN1utlNa54BPigt5II2BXV20pW6QmtQXrx9VI889ttwOaysjI6rpUHH2wfndqjblSsh/iLD/Ria58a5DqyYhXkaLCAUJDInitX7YIde9kQ48sdtzKiQTX/vmYVKWOOHwLTLCjpVmfcIZOplJrAeJvmpka9mhhaYTbBoc
x-ms-exchange-antispam-messagedata: OzieMI+5UY4sNrdLgJdjh2/yRDAaL2WC1L2ENc4CHNxn+3OpPsVKndvsohRHROQaOgmZfLq2mABQ6k7W6zN93y0mAI4YygQTVGr89qYAuUdk+5BwuaXd59eACWFQ0azbhVsJ1ZSQVaZx4pjgbOpXmA==
x-ms-exchange-transport-forked: True
Content-ID: <26AA8A0A97514340A747C67B2EE63E39@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 20db9d4a-0e41-4d8a-0c8e-08d7c61fbbec
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 00:53:09.4140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b9704DtwhtuAM7bE7Avr306EZYSh0QIkbVJD4fZ4zrXNnL6/eTrBwPsVoEfciDDbIwh2eKeeDoLUqTLcxNS8zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3046
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_175327_814647_24421A7E 
X-CRM114-Status: GOOD (  10.53  )
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
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "ahajkova@redhat.com" <ahajkova@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/11/20 3:56 PM, Vineet Gupta via Libc-alpha wrote:
>>>  Did you run a full
>>> "make check" at least once, to build the initial testroot?  It does a
>>> full "make install" into $build/testroot.pristine/ to use as the basis
>>> for the container's root.
>> I definitely did not do that - let me try that.
> That helps, atleast they no longer FAIL :-)
> 
> UNSUPPORTED: elf/tst-ldconfig-bad-aux-cache
> UNSUPPORTED: elf/tst-ldconfig-ld_so_conf-update

After enabling the full namespace support in kernel

> CONFIG_UTS_NS=y
> CONFIG_USER_NS=y
> CONFIG_PID_NS=y

there's just one failure left.

PASS: elf/tst-dlopen-self-container
PASS: elf/tst-dlopen-tlsmodid-container
PASS: elf/tst-ldconfig-bad-aux-cache
PASS: elf/tst-pldd
FAIL: elf/tst-ldconfig-ld_so_conf-update

I enabled verbose output in test-container, but don't see any obvious issue except
it failing in the very last step.

| error: tst-ldconfig-ld_so_conf-update.c:112: not true: dlopen (DSO, RTLD_NOW |
| RTLD_GLOBAL) != NULL

I'll rerun the whole suite tomorrow. Thx much for you help.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
