Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750F1C0044D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 19:56:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7322320737
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 19:56:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I+m2BFEG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cbYbzK4m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="DM0dWXD9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7322320737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pRVRjkeFZbxKiCUeA/yRqlxwSQXwAWwBy/MZJaYDNJE=; b=I+m2BFEGi5sK+J
	j7FQZZyl2s6kr47yUt1E2gOmvJ+DaPD2jeqbGWxW+j5oKAsidYG+z5yPfdDdxD0DZbnm/fhZCa6Bn
	FzmuJOxItGsvEs/Q/MTep7sKsusCrRTXAWn1PH/w/5DYseDE5AghPndm9lmXMldsGs5U6+GUj3med
	X6ko1/31ho67XWPJG6KwzfFi08y+lL7YMU3b41WgCebzYS9EUoibGMUNRHe8KT7MZCKTCzJMtMVBa
	ajYRAttHgVUhn50D9RPEKXXZ7LsB7ZQSKUx7y8WFniZT/YYwE+K6XFdReTZKSUj6O85L6nr2rzpsu
	pCbSwkAUYTu17aSH4/Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC7TF-0000Ik-PS; Wed, 11 Mar 2020 19:56:49 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC7TC-0000HF-MV
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 19:56:48 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 58220C0F64;
 Wed, 11 Mar 2020 19:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583956604; bh=EL309WV4icd17UOmRgHhP/gU7imWCbcUsV6fcBTMo5U=;
 h=From:To:CC:Subject:Date:From;
 b=cbYbzK4m3XsqUGUmIIHEm5IIulQL764G7eIA+KQn+fAZl25aqbp8sWqpAmWPaoGE+
 AmqDJIYShci/JHgLYj9mCxojD9wKYi5UGEukaUB3jrcr5loXVz+mjeg1cDaAer/yD7
 hABoMcvaQgNOI16yOzBEiJzSMxsGS6f/zLIvGb4MGoIH8PA9fbqeAa2RQ4lmxA4ZOP
 zhygX//xh0FeYLNs+03wyUOrp5cPgEBncGFFJCUR6DN2x4UU2BdjBQQmSLTEHwLvON
 QygooJG5Ina/4ERV+7KOQnndu/z/GUhdV0EtvEO/TAAf80LfWBF6mYDOGb4I5c7rlW
 KG5nHHnylUdCw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8A979A0083;
 Wed, 11 Mar 2020 19:56:43 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 11 Mar 2020 12:56:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 11 Mar 2020 12:56:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvRw/G555iTnzs4XKnNBYTttV4GuFpvp+CUqt8Jg3nWNFb9n9LPxXbngV16/npw1u10aas7/3ggeqqsY9i1QrgitUiJ1JFCS2L52DDKrTawbnaK0W4lcsk/d8HWp/0Jf39H0L0r38cpaQiC6bPjgPb2vcaRlZg6zX4rqK6kU2Aer+aOGLkTo1ZptgevWJZcNko1pJlhKZb2JNJC2mWYXrj4PAr7hn+p7ojqgS0KwVeG+xk+rlUgchup5AFCJz5vEfcFaHMDArOPpr+3dYqSd1ndq3/PMrwcVhbveikOnahPVXCXuDYzTEe8PSDRTyp7EWtcSUQCfKxnl2UBbe1ofmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EL309WV4icd17UOmRgHhP/gU7imWCbcUsV6fcBTMo5U=;
 b=c7fQc0BUuqPzGQP/f/+HNqyoCIrwzph6vivZWOCeaCVjkdJgj6fLKMRAL/Cevnd2kn5iwmqbuO/KeZNEYdt8EUrEWOY3S9wxnfAE7tUEXvRUY+CZwocEgh3800c6Mi0aED6aSzbFaof/EYSdCTOx/78Q9l4CcRi32oIHX31Q1wyXKqlbIUb1DrP6/Ozk1NRAG2JoGMCHtuB+MgSHkBgrLt5/Me3t4mB9W6E5/Tu4HwnVb4qWdgeTPxQHyzwdmB1kjJ/1FGdr3S6b2qWi9wgdcZbKpWwpXrcJJr4Sm+QwIkTw5LmYXzhx/gE0erkS63j8jFM7BHpdYKrWNxwARUBS5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EL309WV4icd17UOmRgHhP/gU7imWCbcUsV6fcBTMo5U=;
 b=DM0dWXD9+HdNBGEBU9Rsbe65wVFF3eT0IkVoJSvardfLocGpFu8MC3mcoOzG5IwMsY3qe3jXwGCrm6RuBoyhyMaPXwD8TlQ6jj3GUF4MYKrFo76PbIPtxbtyY6CP04TSiRslNzZiHT+swouIRBghJEKPH8509H16tSKRTDIpJT4=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3191.namprd12.prod.outlook.com (2603:10b6:a03:133::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Wed, 11 Mar
 2020 19:56:21 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 19:56:21 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "libc-alpha @ sourceware . org" <libc-alpha@sourceware.org>
Subject: How to elf/tst-ldconfig-* in cross test setup
Thread-Topic: How to elf/tst-ldconfig-* in cross test setup
Thread-Index: AQHV998iiMh7774w/EyfVJxFxR9pKQ==
Date: Wed, 11 Mar 2020 19:56:21 +0000
Message-ID: <14513500-39f7-00a3-1d1c-4d8e4d6f24a3@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 81834d0a-11bc-43e8-2124-08d7c5f645bd
x-ms-traffictypediagnostic: BYAPR12MB3191:
x-microsoft-antispam-prvs: <BYAPR12MB319126B6D33D1B3F2050EA86B6FC0@BYAPR12MB3191.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(396003)(366004)(376002)(136003)(199004)(2616005)(4326008)(26005)(186003)(31686004)(6916009)(316002)(6486002)(76116006)(6512007)(54906003)(81166006)(66556008)(64756008)(478600001)(66446008)(66476007)(66946007)(71200400001)(86362001)(36756003)(5660300002)(8936002)(81156014)(6506007)(31696002)(4744005)(8676002)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3191;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pVCr0sEEX9kvnoCDaZdobBWwze5u2Ync2hX2ERnCOeEoWsRI/jRamEemUXpStq9LYeAIW2AYDfSspMntUwJVigozDEzpE2NcwWUG0H/mWbEIqWqxH/N5N8MfUi6guyCElSiZzySiU9/Iet7XkXeVTbZ8vwsCJPOduMa8ItVFtJlg/Jwp3zvo260bBysTO5JegFsbh35ps2y+fVIshK9nr9ZSB1eYJ54dyBkEzSzBiV+Eg2Lzrhd74pOOY9rnSf5GTDrCmUnIj2TQdk8xa931DcHnM94ssBz30zvU8i27hzNqDyt44bEOZHIo6guAY9VgmZ5kDrq2egTO49lHqcwVwQz5RLfA0RGAjw+FiOzPdW/9AxwZSEDzW5LyQn2ypL5XauNnLBLDr47obbjTL6Sc5QXVDdgBiXrZngLMvVG2WOcE3+jVrvjQPDQG8atqFlwy
x-ms-exchange-antispam-messagedata: Khyr3+woTw9j+oeL6xLlyRnECtv6dOjJeHNkXVX5BQWdkGP+hcXiQfB7tlCaaIrJFTx78Lcrj+bB/Kq2BdwTLMDeXhI/nugvf5GlYDmwnjeRjIT2wx0OvSSa3t9KHkgjkT/EVuyX+44AuAzgj3AbJQ==
x-ms-exchange-transport-forked: True
Content-ID: <84D674B34466CC4A90410678C03FF86C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 81834d0a-11bc-43e8-2124-08d7c5f645bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 19:56:21.7664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dW5srw97zBG9d1U7hPrPjVdPi9x01evPaEazt2Z5k+1PPNZvLnl91wxxymT8w0zLVbC4UjkL+nuN8kh31470jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3191
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_125646_806280_D3AC79E0 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 "ahajkova@redhat.com" <ahajkova@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

The following tests fail invariably on ARC cross testing setup

FAIL: elf/tst-dlopen-self-container
FAIL: elf/tst-dlopen-tlsmodid-container
FAIL: elf/tst-ldconfig-bad-aux-cache
FAIL: elf/tst-ldconfig-ld_so_conf-update
FAIL: elf/tst-pldd

This is despite having ldconfig on target.

The issue is expected src-path for dso.

| [pid   168] renameat(AT_FDCWD, "/usr/lib/tst-ldconfig-ld-mod.so", AT_FDCWD,
|     "/tmp/tst-ldconfig/libldconfig-ld-mod.so") = -1 EXDEV
|      (Invalid cross-device link)

In cross setup, /usr/lib needs to be the host path where test is built or the dso
needs to be copied over to target at the canonical location. I'm not sure what the
right approach is so any pointers would be great.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
