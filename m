Return-Path: <SRS0=/nRw=AM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C69C433DF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 20:10:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 470F32082F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 20:10:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3JRUDQJe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gGOyu/D6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dg2tnT5T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 470F32082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cx98MPfS1EoePDkmLY4ryk/jsMLMNxZhJzZfAVFnd7M=; b=3JRUDQJeJJzpIN3jFmKOY519Qc
	S9sXcFDOf555pbgCIvqJEmO8RB46Y7kMIXRE8LUNuLo8hQLqQkyJP+Wp2cg+43OI5moeJdce9oazM
	YMRaJYJW9gi47Lc2tEp9V9DT0JdrCELt7xMzKQO+6dDmXHqf8jaRipvj4jzgnIsxno85zUgKXaU9M
	Q0mFzfD9npT31y0gBffqqbQaGHdqGYMwjAbu3nl7N4CX+I9kP+gQCIn9RBJ44W0YzdlbiwYjJSlsc
	XrHtqKADei503exEJObK/HOXIbb0CxxfG8aRZ+T24G+24CmVm3woMlLbRpLCgaMv0ULgbBgNTu50E
	uPm8zijw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqj3T-0001qt-HP; Wed, 01 Jul 2020 20:10:03 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqj3R-0001qM-E6
 for linux-snps-arc@lists.infradead.org; Wed, 01 Jul 2020 20:10:02 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 47CA2406A5
 for <linux-snps-arc@lists.infradead.org>; Wed,  1 Jul 2020 20:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593634200; bh=kCc0CVYOz0RQvm3odMx0k54rvwgf+jCJ1blcGJ75LkM=;
 h=From:To:Subject:Date:From;
 b=gGOyu/D6Un5qMpfAOXulE/jAvPElSE6IBR1UYphobborkHUDgpig/cCkutAi0aNiq
 FFjOtM/RJL9TtmIJjzXRjf28bPCgARckQnrYfOIWLNkNtL9mtQ6dXL1r1XkJrjjj06
 RJ3WpRpmB1YLdWhh4/oGnP4ewsP4AhZl7BTJ3k8CkqbyWhRc4EnJBqFIrsvhC3tFih
 H3e3vVptA2aRA2w3yxyH+kLfGyKQV7MUo/7Vftc2f6WM6vtyUbrvjB/WV5IPz1bhT3
 9cJFMFkd41zRNrV0MHzC0Uvjf/fM/WFYocc6x5pBkIGaWe7m8mB1X0admdx6H0S1us
 v/LpQZu6byPsg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id EF8F2A0077
 for <linux-snps-arc@lists.infradead.org>; Wed,  1 Jul 2020 20:09:59 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2057.outbound.protection.outlook.com [104.47.36.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 57AD08111C
 for <linux-snps-arc@lists.infradead.org>; Wed,  1 Jul 2020 20:09:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="dg2tnT5T";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EniV9aghwkKaUd6lop+Ut8OXFGd/UYbNqVUWKXYExb13HlXgp08MBVURE8nHz6gFbi6hJr4jYaVz8a65s3Urk6cYS7C0SQrkzyePjMyr7aw7OXFuMeZoCEvxHlg576QCxEarwRcCrBzeDcNtNa+fQtBeBnQ0teXKQq/gVvHEjs/lxqyXwf02gDln0yzJ6IpJYdABjfwNGAi9gYEaPkbd/yFFezz4S4Q04qPJGOdWdDJ+za/e6vy1cjmgNxsO8IK9a6O8jZgov0FffEIwAw3zUSFA3Sk251lhFA8RQaGkKSYVKi2Ph3CcfDV27dbui8jg4PCqtZDXVVJ37NAgafEeqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCc0CVYOz0RQvm3odMx0k54rvwgf+jCJ1blcGJ75LkM=;
 b=oCDHlVKv1iNphjr1cZUanEJF0R5O3KqzTTWnsG/N5woQqxDRuQzL3FrM23KihhVFpBw+xCfL19A4nGzWsFjigIGZ15wNU+PrDRQg1p6fzaPvKypP9IXS7H9gxafUh3LgA7kpqH/2sJA4mX76Vf3vzX77pls2WxXBqgG2SbMmbkXA6ltDfRk7I8ChpIvlMSKguy8Z2NaW2tLXqpqMUZlnU6EHVP2USAm1uIlSloFx/Ej5Tv0XHYJfXqnTWPxnTcDcEa6Vtwmv8wEu96uzQeO/yRe5bJ5V5vmDsmlQJ4/QzVrZAm3zLNJ2ABDYa1VbZx9cGEp776Pcks0xUbD/OW2LxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCc0CVYOz0RQvm3odMx0k54rvwgf+jCJ1blcGJ75LkM=;
 b=dg2tnT5T9F8TpndQ3WRK0KxbFbN/zNhxWPv4i4eM4+wmtKkW0uTchU8Gii5Z98pAKskUW/LBwrLL9TjAvL/FKbSk0Chf2H+7/vYev27A2Hks3pkSaQpeoSmpOsSG4Acofi59AIslEAEJD7DePAnFwlNMb3YosF8MNV8HR6OlfaY=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB3938.namprd12.prod.outlook.com (2603:10b6:a03:1af::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Wed, 1 Jul
 2020 20:09:55 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3153.020; Wed, 1 Jul 2020
 20:09:55 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: arcml <linux-snps-arc@lists.infradead.org>
Subject: list messages lost due to disk failure
Thread-Topic: list messages lost due to disk failure
Thread-Index: AQHWT+OWmk5Kn2DRHky8deZFMPOv8Q==
Date: Wed, 1 Jul 2020 20:09:55 +0000
Message-ID: <e8229fd5-3ef1-112b-fe0c-1daf8a4ec785@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be3ad521-ae3c-4e05-e47f-08d81dfab90a
x-ms-traffictypediagnostic: BY5PR12MB3938:
x-microsoft-antispam-prvs: <BY5PR12MB39383E983ED0E0171704D5BEB66C0@BY5PR12MB3938.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8/FPKQhPM8PN/VM7dmyXU3fHYFgDRXoJVfGadXs7ph72CoP5h20ltrF2hgxP+faqQ40zy/jRuCgKXBiRCsZSzBAct+4YMKkHFnKx45dZgps16F8x+tJ+ZCWuB/6A8pVqKsIHp7zwNlnzB6pm2JaJXCPMFdZlkyF/FUnQYzbTWL3LYyBzftFsznIUkEcLoJnj15Mc4+lm2eMPCMq2WGKMJW1CMcaZiKbxi0N6lHpuv04TZJGJWlVvAW1yWNYTD9fDeX5eArp8z+kvM5doaA3FKITUhMuNBTB5cSHl/R0geaNspwnOVfbjRCaIAq/U13hbdesy9TEKJsof3IZzNL6Y9FQwLtUMYfABFJES3hx5tAYLr3Qx5lK06JDi1Yfm+bVA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(376002)(39860400002)(396003)(366004)(136003)(186003)(83380400001)(31686004)(31696002)(8676002)(8936002)(86362001)(478600001)(316002)(6512007)(6916009)(4744005)(2906002)(6506007)(36756003)(15650500001)(6486002)(2616005)(66446008)(76116006)(66556008)(64756008)(5660300002)(66476007)(66946007)(71200400001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: zSa3Nl+EqpiLehdu/FHy/eDx39P25+57CqBY6doHps/nZjcNAN9A0oiZ1IGyxfm6S7EnX45hQ2zoR6Iv/hGkobZv7D/VNRhYIZfGmTywdX1OpkIpe6fuUCOn94vOGL8/PW0oJK44N5gs9VqtvS4nR1DXDo4jxR2tsqUuHViIrOFdOkV0InBL/lv0ixFusVHUpZQmWCBURWJBqsR1HQSVsMM/aPs5aF677xzOO2udWbqk69NP718B3matJGUfSyUqaX2HTbF6jrF4afzsxVt2lu3ogd/AZGVi8v656p3QrEcDtfwPMm/zRBPVB74I+oi/BufkzUrZz7MDa5DI7nEUDwiEnG7bEmGHoCD2gR4wynej7VpWHb8frBLdB/zDwqGdKrOcdD9CunUUYwYXlFkVYjtA+wJoWeWEdFzxU/SRFFuS7Y50IU0nTSJ0VYZ7Ku2glIeGfQVbDpEZrwZrHuMu9YsELG39Bt7mpden2UfZz7ye/UQLXdm1trlsQB9Ti8X98xA2ARRuTKJedaJNmOKLCQ8bmwO4mIbcxNjx0eBhzCRsChjlrtb3rqPdpLxY9uzz
x-ms-exchange-transport-forked: True
Content-ID: <C9345D7293F95E4F9D36E9912E1974EB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be3ad521-ae3c-4e05-e47f-08d81dfab90a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 20:09:55.5873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xKPCZrhPQac5YT7vkAK0deya0AkojExW2CbrO+dfspHMbKduY0+1h2BsuUIpLDM2nJE9su+6X2JZNlikJ0P9sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3938
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_161001_752186_75DA484E 
X-CRM114-Status: UNSURE (   8.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

The machine hosting lists.infradead.org suffered a total disk failure last weekend
and a new machine has been drafted into service, unfortunately using the latest
backup from May 2018. I've provided the missing messages to site maintainers so
things should be back to normal in near future.

Also anyone who has subscribed or unsubscribed since then will need to do so
again, and the list archives are missing.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
