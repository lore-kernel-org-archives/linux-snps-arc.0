Return-Path: <SRS0=EH8H=7O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140F1C433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 18:12:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC2CD20776
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 18:12:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="svvyoAca";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GX3DL0fR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DdvJNcr/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC2CD20776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80o2BRbq+wd9rO9h/LswunPzXZMQTVtSH5vhqtdWEBA=; b=svvyoAca488sQL
	SxrIv/Ql597gNEEDzvBZjaeStx1plvTbdMEPf+moa0uI+AZpJSA0hBSSeRbueSapsRu1Na57WuZin
	zDCGOgymn5+5axpowE/XZC+YlLGdVRODbkYPwHkYTNKP2BVEe3MnmdFQ7jqlZ9+s7X5ZiVuSrrFjk
	+CPHzduabUMJGdNgICxPeqN+sB72mQzz3QbKQ0Xuc/N1D1k9i93eZTr71haNI07WlkLaBYn5OfpKc
	/6pppySqQbns/BxSEpJUnbDPI+Ptl1pMpEevwHK916+BKPnlKsamBwX0CN/AbTk9j4HPnIDSRhmls
	YeH0rdJI1zrileMKH7eA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfovB-0001KR-9I; Mon, 01 Jun 2020 18:12:25 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfov7-0001Jq-RE
 for linux-snps-arc@lists.infradead.org; Mon, 01 Jun 2020 18:12:23 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C723840104;
 Mon,  1 Jun 2020 18:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591035138; bh=9EBOSOWy+SaTKsWacalq15DJb6FHGZiPuKQ6F/pD/g0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=GX3DL0fRr7AQtUphm4s0r279Wd0m+qGhIpqTBkrg+UZz/cqABML9RcEpVl7lRxGE9
 XvUg9JA6CM/rCrSaoyqcuqW9vS3gfThC/wROVcugplxP/OVjiBmrHQQqO3ExaNwiyI
 ivInDGJT+ZGm4L+6uaAP9aaiOgCnLY5u5SAovxb19juVI9BX84qp/bZNqI30Zr7tkw
 ksbntCyWHvi+27R4l69h+79aILRvD3erAAeOiwwDO9BwH9jEAXivmnncuYRT5YAzQg
 Omvu1j58THiocOPCby0jKP9QWvLyOq89B4Qcfqp6H3VNze6qOedLM22wIG5H4XCxs+
 0crLPugJI7cqQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 026ACA0071;
 Mon,  1 Jun 2020 18:12:12 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 1 Jun 2020 11:12:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Mon, 1 Jun 2020 11:12:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlAdm9EfxhNXnxaSOh8dYCMnjD5pntTGNWoZjB7sPUGveE4UBPcDN0fOoVLPb+EzXngwqn7t7GO8N8kaM+cwwxktQTAfVav+mGu6B0p29T7ox2dDVQEBDRPEFARLYUbQqvwNI0D0zyCjbGSicd+4hLDL9mkrGpEsMfYTpvk55JtpFd+juuPSFIXC+JW5Dr/eMAKyzfvNfKP1vM3tLR9CCVpvb0v+auXyqO39TXezhTxzNCpYt35ur2F2hiFejUt5YeII7ZzEbVbSWONt3ed/5Ai5sY4H/FIBLDEMJbIEa2VV5i7+BpAztolTm8WdP6zqm9K2pZncPePFvIRjSoPvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EBOSOWy+SaTKsWacalq15DJb6FHGZiPuKQ6F/pD/g0=;
 b=EwGj9elwJvXde9BMhfcxWueesXVGjdB1Z2a/LB7l9M3TVu40a/TVwdYAmnZVmemlxhh+ta3S78gfSN6MtRiRlKxyT3ggKDDSrg6hYnA8ImZs08LRkeKSDK0V7scokRnIC2neEQl43b+i/F+8wCwV+KnpOWxUwnLDphmAbpamyHnISmeq42blRkvFCbejJ8LqIUjW/PTZolVJQDa6WxfL5zUqrF5edWpZ5L8AnnbcP48NVO0Qw60D6XrzwC2StQMg/7tFann38/B+kuxRYxjE3jqPv5CduM0RJVDmWEIblhB42+LRBTezhFBWNHgNiNl7Yma57WbhbdeD3262ENqHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EBOSOWy+SaTKsWacalq15DJb6FHGZiPuKQ6F/pD/g0=;
 b=DdvJNcr/HosunZgike8DOnCN1W/C6tRtIgRNmx0q+dUvCKIIejnyr2Unc6M/EhMVqwbSWBeY8B71CDSDVK0QtRY5kjZPdwUiRqMC9GhmWGg0+pp3LfV9L3HDrx9au4uX/9S0BvirSRTfoSZId+wo+BGTJ6aiJizF5SxRshEVHOg=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2743.namprd12.prod.outlook.com (2603:10b6:a03:61::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.22; Mon, 1 Jun
 2020 18:12:11 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Mon, 1 Jun 2020
 18:12:11 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH 2/5] iee754: prvoide gcc builtins based generic sqrt
 functions
Thread-Topic: [PATCH 2/5] iee754: prvoide gcc builtins based generic sqrt
 functions
Thread-Index: AQHWNiY9GLXczNbRUEKgmTtm//wKWajD0VaAgAAIAQCAADqxAA==
Date: Mon, 1 Jun 2020 18:12:11 +0000
Message-ID: <6dc09d6c-e957-eeb5-34e7-089d3d608cd8@synopsys.com>
References: <20200530020047.5490-1-vgupta@synopsys.com>
 <20200530020047.5490-3-vgupta@synopsys.com>
 <1f8c98ba-481c-1463-29ff-c0dec7add324@linaro.org>
 <45540801-e568-54ef-ad29-c3c2130eddb5@linaro.org>
In-Reply-To: <45540801-e568-54ef-ad29-c3c2130eddb5@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd7b94da-232b-49ea-2de7-08d806574e12
x-ms-traffictypediagnostic: BYAPR12MB2743:
x-microsoft-antispam-prvs: <BYAPR12MB274306EC6DB28508AA940A8DB68A0@BYAPR12MB2743.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0421BF7135
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7N02wk0E+zVjS6C6L0UKdeoKbcDCWepZoidSl3glW9ZxfFaUdopbvt/MX/IWJLdVcYYklpmzZ1Zwh42iLF4fRNCokhAFa3c0d0wmYpM5LD3c9lh5Y8voyKTJ99PCpCJ55tBlHR7ms0Zup+BJyArxXX4UzK7jnPMA86mVxY5AmNIyTapcRgUDsgbQvGXUW/ULa9CBMtg84kwDztm0v5a8u0O4Kqj86D7f+jcAmV1lPS4AeRGCHHr2UtehYEyp4oQL4gfxQdiAbvGSCTl39oVZO2NLF+jG5dPun8XnL6yKp04gKRK8Iha4Y5wHj1u9AS9vM26ApzeD+EP0HThcf1zi3ZFxIXwh7vjhUGK9SVagublmTbQysJVRZkP/YvrGcbmpB89JLUayUy/BmSrTm4/4NQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(396003)(39860400002)(346002)(136003)(366004)(5660300002)(66556008)(66476007)(4744005)(66446008)(64756008)(76116006)(66946007)(2616005)(6506007)(71200400001)(186003)(83380400001)(6486002)(2906002)(53546011)(8676002)(8936002)(86362001)(31696002)(4326008)(316002)(110136005)(478600001)(6512007)(36756003)(31686004)(41533002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: FPCizacY5PsXMdtv5FEY4RWq4UWh9pd0k1QtHOIWHQDC8Qvq2wXKs+lQk+coCMJhV2wmwc7vN7oPOFIN3Pf8a8/vwz+BWIIYoNHtveWpBkGXvywD86C+Ggtbk5jAVOkRCJqqcWuJ9yRQCDH2buvVRIoYyfJGHdPsy6Mk/Gsj0r84gJaCGk0ixD4RRiqHZYMCIXVWpebmIwWVARjuJ82Kho0ovn1RXCwGk7G8P3FdilHlC2RAZLauPiuTojZVZM9uAs7I0AnjlzYhoGWGsTZllXE/5FgofY8ob1Cn0nEgxWsf2+AcLux7HIRnkxpe23t6NwwXUR0XjblVMYOrzHu1jxfE/HyNp+cGP5h/qMgY1yMVZ4F2KYgtC5/byCCQ/FeDRhHY6wQ1J8FvvfNN1FcUvthmpbg6h6x1XAJQ1n4Y8EVR/z0wxx2Va0nBJtc73x3/yFtXPD3Nta9+osVpFz5hgV4aQSiixU1R1r4oZ9XlCWYlYIOSH9mZ8QKEZgajvvN7oyjjYSRZ7LGxm09RJpAD8GpuRwS1TXNF7GB0GEDyfEXBWuWdE/Zni+wRdhu/rwgz
x-ms-exchange-transport-forked: True
Content-ID: <B853F8447DD4FC44904181802351F52A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7b94da-232b-49ea-2de7-08d806574e12
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2020 18:12:11.3401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W+l7FeqrtDjTK8m772SgVFJPTMdFnVgMMErMmcaD6X1eAHdf+VhwNymscAHMQihuCdoaEHsMOvGSIqYY7go8jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2743
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_111221_919959_6529E0C1 
X-CRM114-Status: UNSURE (   9.34  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/1/20 7:42 AM, Adhemerval Zanella via Libc-alpha wrote:
> You will need to move this definitions inside the !USE_SQRTF_BUILTIN
> to avoid defined by not used warnings.  Current practice is to just
> open code the constants and let compiler optimize the constant pool:

Won't it be better to keep the const variable and trust the compiler to subsume it
instead of open coding in multiple places. Makes it more readable ?

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
