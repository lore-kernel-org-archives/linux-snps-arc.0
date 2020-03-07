Return-Path: <SRS0=vrW9=4Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F6EC10F00
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:57:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AE3B206D7
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:57:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k+0EgQZr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZDL+J6Qr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="PjCXofWw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AE3B206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWUgfzB3OsMn0VAm9OCwvanZ+hz7xqRMHdM6et6FovE=; b=k+0EgQZrpd5M9D
	rBHJGFB0fQmspB9/zrAeev4NARJFY4uqTl9Icoohx96+m+6mWCLRcgt8Z1WwqnhLUI5t38qQAMZga
	HmTRSg+WD4K3Lkj8TwF+OVXQ5p87zxkLzPX69Ae0MUhVgG2tV6QBts2ncZpwOiZKGSAeW7sIKC+yt
	p6OJ15YppTzdswalMPNLctYgru2MvPgH6oV2xSMjuTmrDxeuQnGe8bOLwXnj9ys2TB5vyXbN9s6qM
	rCx3L0bzX1JVYFvQTRIVZVgI6MAWOOKqBaCornLZSJ8MKjN7wWfZCKyAc08FPIYm4WIZCqh0oTVjs
	e956UwqbVam5720PLMrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jANmb-0004ah-Kt; Sat, 07 Mar 2020 00:57:37 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jANmY-0004a2-GY
 for linux-snps-arc@lists.infradead.org; Sat, 07 Mar 2020 00:57:35 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 19433C00B0;
 Sat,  7 Mar 2020 00:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583542654; bh=iA7rkOu1uZqtOz5Be6vrs9R3oPSXqUBPBhJ679aTXfM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ZDL+J6QrUvm9pQacIJVD91l2mfk4xGN/hbDfYV3hQMBjV0FautPyX6Hz/cePnfbC+
 Hb8MSg9C3NN8S0KinUoDVMOLj8e9AnewFBmCySWXvHvGGktD9weu0/JKiiGHc96f53
 FSunPH5/efcnWEi20wXQqFYSHefB3e2R7JG/gOmrLy/Ne2WR5m4+f/KK6HY/UXxI1o
 O3DmevVR/t1vr0ZyPbvNXF15NO1Bv7vppFUlXbukAI8wXMXOKlyxwHsI39/sk2g/Db
 MqX9PSZr2b5h3RzktksUyfEQ3q6gqu9q3rwEw8Poan+278QEq3IdtrbnEwNkGe9vHZ
 +m/WWcVln0Tdw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 62038A0091;
 Sat,  7 Mar 2020 00:57:28 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 6 Mar 2020 16:57:23 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 6 Mar 2020 16:57:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsPWUMqGfkxsqR2TG1wqrd6t8G3pxCeZ3nxIN9S87Yx16/9fazKzSWFUNbzfRBfuUioO1ImURvbNZSijOr1BRtOyjOA+HCJNWPF0D9q9hqfNylS9LYSz1OfT6S9WV6sy/rKq0yDqbRLC6lvO7D5ezkYITn9eX8D5NM8QVEeBYcF3w5hHPzZjOr7+0UC4aHkfzuh3KBA9KoPPzWN3HZVqonTPyb9II7ARj3g3b6uzCYFKYCuOOFaRJGTSzHQsR/3/KSYGfiWVUp+xXqVKHXPyjCSClt3vzc6mgEUUPVSABY43Ll0HdJHYUAWbHaXdpF1YlfIekuGDHlyu2MmD5qK01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iA7rkOu1uZqtOz5Be6vrs9R3oPSXqUBPBhJ679aTXfM=;
 b=PcrBCTwwmVw1oY/Tv+QlIdmw1fgEkceb//ffFR3EXNFvkW6cWshgVhm7XzyIcFcF59b3VV0uKfTSAQHZRj9aqztOofvoH3nDKMsF6FUYENyA8vJjLt0Ajh0eM8vShy5x7+5AeJq33WytqtsgbIYbRyxEmh4s5PO6W5s5zyK7PILh6AgSK1WToncwq6a8lbEMd/Ykx2vZJxggxIS5mgzS58Wn3bAPpwqgrgJVTYsrMsLKzOQxqQRliS/DUxfiTjKwFDhCu3Dqh7esuVpr+KR4QiVXw9mESQ8Ia44XdYTN1KZ4G4pgY2FlRdRvkN9u/sFUk7XSwoH8ED9LxruMXaIvNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iA7rkOu1uZqtOz5Be6vrs9R3oPSXqUBPBhJ679aTXfM=;
 b=PjCXofWw33viUaOgCzv5+Q7LjbF9OxuPh+ubQp9I5IbICi65GDNWA0SPPr/7iRYSJyiU8kfnVq9O1zsi28aTIITrQmrOK35YKsRza+KtJMXlajneyqrYCP02W47QJ7uXnWMo4YRndu5VaVLObmTO0ikYSAvbwIGtvgGVlmRYthE=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3318.namprd12.prod.outlook.com (2603:10b6:a03:df::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Sat, 7 Mar
 2020 00:57:21 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Sat, 7 Mar 2020
 00:57:21 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v3 00/17] glibc port to ARC processors
Thread-Topic: [PATCH v3 00/17] glibc port to ARC processors
Thread-Index: AQHV8+SKFbj1Ab7BHEKnet7tWnF7XKg8RNKAgAAKGYA=
Date: Sat, 7 Mar 2020 00:57:21 +0000
Message-ID: <cc9d1b80-1568-f658-ce65-fdacad669956@synopsys.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003070020370.26274@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003070020370.26274@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e82a5924-1db6-4f2d-a7e7-08d7c2327de4
x-ms-traffictypediagnostic: BYAPR12MB3318:
x-microsoft-antispam-prvs: <BYAPR12MB33181294C4A71FF8DB3A552DB6E00@BYAPR12MB3318.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03355EE97E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10001)(10019020)(396003)(136003)(366004)(376002)(346002)(39860400002)(189003)(199004)(36756003)(478600001)(31696002)(2616005)(5660300002)(6486002)(6506007)(2906002)(71200400001)(4326008)(86362001)(31686004)(4744005)(6916009)(54906003)(316002)(8676002)(53546011)(66476007)(81166006)(8936002)(66556008)(81156014)(66446008)(64756008)(6512007)(26005)(186003)(66946007)(76116006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3318;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ux6XVDzNmnHPN+Cej0I5JNQz7xtVBo2upRLHfiG79Kb/YGESbsnQYHh5K2Qu5shh0en1y8zbYpS77qyYbqT8YXxsnoTdxt+hu/xQLuTrgTcEAy1IUbg9qMVyKtQt0VxMm/37Vo7MM6uc2fS5hPco5F6C+84blXFYgJCdu4f9gZ6Eggzc+l+RvcvS5Qp2dHLNzF0TpX+e3aXW6PZWvYUIFK7Lu+vJApXJS6iIr+sfgsoKMJgFidALrzW8Y82YVM70rxp7x6Vhpx3DNFD9+z/Gf6qpe3MUtMFUyNqbl1079iYD8qX9c20VMS0kDNeXisIBR8BBwhgTamWxHi4rkZGcmydBITyjgOy8eHHGA1DqKtA4Blgh3z5f4XsIzZGMovOgXzbUBStEOOBUstkf6MxYVfpIwbV73QPVr0105Q0XCUd8d4Emwi3Qfggd6FIrFykuLnoEkkoar2g50ZwzZAjIg1tBrfW75+uUbBBxW46TelSVCX051746GZeP6bX+lYDqDBEv+jod4O5lnpH1CsHmoR5kIKOR7Mk9hEht6+Vd64r7zkyiQ18lGA5BC/2KNcqrgzK0qkOyz14OjnInicZuqQ==
x-ms-exchange-antispam-messagedata: TwY9ZfWXtjNZXA+WHrJAoxf4fJOIQk4AyfXT1Y3kZ8Gt3OMvRztXI5ymbh9BjkVepB9rUmz2aY0wrzol0dGMC8nwTwkruX+mPP9grKtk/pEHinzJ5pGHeSfW9cum5k06MD6tK5jIvxGWTohtBK6Qbg==
x-ms-exchange-transport-forked: True
Content-ID: <910287AB75486D41BD4CD4F8A50E35DF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e82a5924-1db6-4f2d-a7e7-08d7c2327de4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2020 00:57:21.1185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xodq/zJXYl3t0aCNzayrrXOr61BoHLuG7hEFfDBDoK4aOMw/AI6iQV6eZbVpt4hYoAGxuxntyXuR49sxjrS/ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3318
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_165734_620169_DDAEE7B1 
X-CRM114-Status: UNSURE (   8.30  )
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

On 3/6/20 4:21 PM, Joseph Myers wrote:
> Please give details of what the entries would be for 
> <https://sourceware.org/glibc/wiki/ABIList> and 

ARC
   * 32-bit, hard-float, LE: /lib/ld-linux-arc.so.2
   * 32-bit, soft-float, LE: /lib/ld-linux-arc.so.2

(soft-float ABI is compatible with hardware-float builds in terms of calling
convention, register-file etc)

> <https://sourceware.org/glibc/wiki/PortStatus> for this port that you 
> intend to add once the port is in.

Last time I checked, static-pie doesn't work for ARC either ATM. There's nothing
else ARC specific, which needs calling out there.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
