Return-Path: <SRS0=p2sK=6B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF1EC2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:59:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A82E2076D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:59:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qwa6BZ62";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MwVXu8cF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZGgvyxbZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A82E2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwEj8voced5PFeJgvARiW17EPJILq8mGp1oDzAhWUtc=; b=Qwa6BZ62utnJts
	ZUG1Q6WP+SDPbw4Lpow8URN4LBTs40bDUZJs9iWW6KiqNXwYEVBizMHmZFQvWwwiOYcjEkK1yhB8+
	OT/jXg7RkevPS8H8VRqUaini1L2oSo89AUGZjS6c93BLbJnZLBoP6lEtEI3is8oVaVjVQviNuY5Hu
	SYv6X/tmlR6/7b5yD7aLUdWhO+ItlWU33GNXKn0aLkn8jd3wpO/LF4KCXxFl4MXu8yE+Rvb4Np9b8
	crFz79rG/AQc+/9muGA2lvlWufKUmEnahArC/LkeiblS5wnBXFiMjBr2v2JkUft6Gm+HqfwXat5Gp
	KdZmTA6XPk5eSMvVecpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPasw-0007B8-BA; Fri, 17 Apr 2020 23:59:02 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPast-0007AM-Up
 for linux-snps-arc@lists.infradead.org; Fri, 17 Apr 2020 23:59:01 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B7E7340387;
 Fri, 17 Apr 2020 23:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587167939; bh=m10m5ZhVpaJcABdWPnVU2FJacYI2bvtTRmMKCmMw40g=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=MwVXu8cFgDN2Y3DcHmFalMeEMnIftibbTbh6P9Y4sErD9xxLFcXeNmAq9aHoSoLkL
 dLnW5lgcI77jPgsXMfed9SkcWvMgGS681mXYTvaXwlWcgPebf7eVF8bjpkUJkjAf8f
 IR3KqvhMpA0+JJ7ndPAAe6LCCldeyRsNMggCPR1bXYQm5rbpSpStyXxBNJcRQ8M9Dn
 Hu18waOj9OuyGeiQI3bYB1BXgHvHGWJ8PX0EEiZEQrbQe8tPrecbECqC53S4pob41G
 zD386IwkNIeMaLUC0mTW/MUhqa9ICdIg9ABHBMtmNbCo6u8CgTxej1WnVu7qD0w+ze
 P5ZuFlUl0lj8Q==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A7718A0067;
 Fri, 17 Apr 2020 23:58:58 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 17 Apr 2020 16:58:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 17 Apr 2020 16:58:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MM9K5R5XoVQORMTNYzJiPY0kMtPM7cvaGTZQJ3QwjmJzU553MxCMPh7Zp08llISojGya5NrMkiXmhfVKIYhJSCJENAySXSgi/a/8JMN02fduEcH/AUKHrUIQtuI3yPDkAiL+za0mk74EHBVRFyIl6oRfvUzHtVqLrFpx40A2hqLvUaHhZnt6fFENqAsx0MWzWvSunoNSYWSvS+eY4dMNT2NSF4Hknhydm+3DOpp+JDfKu/XfrMPmJjpK0BuPQ3BPbne4pRPv7V+GWhRcg/1JFoygAvPL+j+b7aw+N20n+/tDSu9v3autmxsM/lchm6ajdjreCGVBOvs2FljtrtZ3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m10m5ZhVpaJcABdWPnVU2FJacYI2bvtTRmMKCmMw40g=;
 b=PwrpEbybSq/Absbcnjdx/Yal0yu/3/6sPaqWIxBNmYTj5x3moIBriTQQpnjJKHE1w5mNotobULRlnnxh/Lz/rypZfYdTPICj9J3FfTWaY2SIFhK3Rb/IvwGgzAxFPznQjq6nzVWJ5RkUZ4ObCX30ZaCgAcZKq9R4h5gvzQWtJDPMDfVhM+sCkA+zVm4GeZ9mbI7rB90Z9fLkh2nqnp1Aw+PXn79MdGNXs2Oqlwchu9u+zcUBS6dSB9y543tN2HX+N3x05SX77J/voyinR5rhgQYRNSayHONSM+gQEfgmbSVRVMrHXD2mv7aV2tVCbv1/yKcpTAnryPGunF6tdsd3dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m10m5ZhVpaJcABdWPnVU2FJacYI2bvtTRmMKCmMw40g=;
 b=ZGgvyxbZ53A8go1TQJU/1Sup/Yxi/FhacKZobhJ8qrMTME7lGxJy2J0AjRfGr+sbDYHigpwKsDPQE4E2/HuTsBKRBm5r+sxC4Z+OV5Y/A/uSEW6vbEqm0jbJzXoPYJmjpkhqFoZQB+Tu1kO71zuSBekYLHcfBsx5PhhMRTvHLr0=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3254.namprd12.prod.outlook.com (20.179.93.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.27; Fri, 17 Apr 2020 23:58:56 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 23:58:56 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v5 14/14] Documentation for ARC port
Thread-Topic: [PATCH v5 14/14] Documentation for ARC port
Thread-Index: AQHWDhqNZuqdj/dwyUC8XhpblcOQr6h9/3eAgAAMoYA=
Date: Fri, 17 Apr 2020 23:58:56 +0000
Message-ID: <21b4ed4b-3af8-b13c-d554-49bdbf8ea2d5@synopsys.com>
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-15-vgupta@synopsys.com>
 <alpine.DEB.2.21.2004172312430.1082@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2004172312430.1082@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: c63534b3-077f-4dd1-c702-08d7e32b4a41
x-ms-traffictypediagnostic: BYAPR12MB3254:
x-microsoft-antispam-prvs: <BYAPR12MB32549D2F2DC48FBD77D5A8D3B6D90@BYAPR12MB3254.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(136003)(346002)(376002)(396003)(39860400002)(316002)(64756008)(4326008)(478600001)(6916009)(66446008)(6512007)(6486002)(36756003)(66476007)(66556008)(76116006)(66946007)(54906003)(5660300002)(6506007)(2616005)(4744005)(2906002)(86362001)(186003)(31686004)(8936002)(8676002)(81156014)(71200400001)(53546011)(31696002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /OMn/Fp5c8WuOuvkpdJAlR59eYR+PU44pJrNMvFxofVyW70i+NpTJ+BPV9Meu/UjoxxBMfuqymVcMOr8TYDiNivXnwXdmqstsPd2GlYWfeRpLgQY636MKPiQys66HXzpGJvcjuat6BZux6C3c/hBhWGIQnUqUrLK6SG06W7Gt9NlqoRlSpAJsgr/szLz4L7r8Bxps+b+Bc9EE32sHaVzTPFIV8yAKGmSRlcnOvTJxdOz4DS1FffC3rZHKzlSFHrcaBN0wUb7hCC6CN0Xhg2kzmHohUXe+f5oYVjPRAMtppQj/7OMLlSzynnfjH4gDXqVTWeqZJvExNmsjBK/hLaubkBEUj6hIfFictfGO6avJibMu3ifrI15VCZLN0j2H3nFOTdQbBcJ8UBz9QBPv8ZhXV4Kp12D+ihjpfXWqFvnLwqx2iAlc0nMojWME+FeNPXj
x-ms-exchange-antispam-messagedata: qI17EtcgUwEhhwEDRXEAwfDH0bgCUq01LYWXbbXNBaAfvwUsYUgoWl0/qf1RULMCEFwvBF/hkU1nPdIivfjWyaQW4w+su3q6zvdoNu15oHRmPWY29AxASohBMyMv2h8NIgMEST9FS97QK4Jtbx+bF3Ns05A0Y8rRAuX8R8DhAC+JmBb0ApQ3EWT//xnhEbuCIaYgR6sI++aibP7nDcJDYQ==
x-ms-exchange-transport-forked: True
Content-ID: <43F490D755E56443BC0A56DB53414547@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c63534b3-077f-4dd1-c702-08d7e32b4a41
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 23:58:56.3928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9o2yLnGuU1NKB1aBx6wo30izFEVg/rZ2QqbgJqxMPXiwd4nHI7VOkWMJCgydZ9YyER1rnOSw8NqcYR47cX5Jdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3254
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_165859_999827_D98698E6 
X-CRM114-Status: UNSURE (   9.86  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 4/17/20 4:13 PM, Joseph Myers wrote:
> On Wed, 8 Apr 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> +* Support for Synpsys ARC HS cores (ARCv2 ISA) running Linux.
> 
> I think there's a missing 'o' there in Synopsys.

oops, fixed now.

> 
>> +  Port requires atleast
> 
> And a missing space in 'at least'.

Fixed.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
