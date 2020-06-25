Return-Path: <SRS0=7Buk=AG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B7DC433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 25 Jun 2020 01:08:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D827820706
	for <linux-snps-arc@archiver.kernel.org>; Thu, 25 Jun 2020 01:08:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IqdgXnF2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TYrEBww9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gnSrOCNm";
	dkim=neutral (0-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="d+4Lf1tz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D827820706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:To:
	From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ri01DqA9zxKxtJHZSnH8bQMcu6QUs05y59h+7hZAVBA=; b=IqdgXnF2Uj1BL+aZeMOK0WKDRk
	FqANtjBKvqo7ghlG3t1/OhZaoDrO2UsKXnuk+4H7OxIgsaJWDkYPDjBAqR8tXXowsvUJt3lenM39y
	8Xi+uYp3VfP/pY196OcRvtg/vJLLyoZ93w5chtGyQ5jNb+UPAZyBeH+YyrzRuGSC9TxQ2m0STwWau
	zYJl2cm5Uc7KWoy8b4nr3z1VCO+hJPE3yjqNtorXugvUvl3YfcBn3Is9Rg9Cn5YM5KuUSVvTmS09i
	RxWEHI4P2/bSV+8c3NU6ACKEbwmiWNZEVYXb/7wy8r8TyehuESSs+fbdqL8sSeIeOJ5e/xkp9AITP
	5GbO55+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joGNr-0000ku-4Y; Thu, 25 Jun 2020 01:08:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joGNp-0000Oy-9j; Thu, 25 Jun 2020 01:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:In-Reply-To:References;
 bh=yCaaK6Pfuvgv8qGAW3z6C8fFKBkxBwsP+SJXQCeuVrQ=; b=TYrEBww9irpWoU2LiW1y6M+EAh
 Z2GmNVBsvXYGKi/57AiU4iJoXnGMVYL5y7GkWpcDhsS5ODUw/xFxFC9E0+J3ob4s15L/BpKNv+5PW
 W5dl42nbxKHJyt4n94fZAYmuIcAjPxIWv27ZMZxi+bjBJEDJhmTm1k6sp9oSSPLdxUxiIVq9dfPuJ
 MRCtLEUMvfNItCbY8ndzIrpo+AB1iqqEQer1p6GjWZ0hrx7mBBGAeRZJvgyPbeLk9rGwgfGfGHDXJ
 52u4dRePmiV3bhz7OFT+qQTs1hb9MIoGC+/3CLNW77lnLaJQyO9i6KdRBSnxdaUkHx1af93MXD1QH
 TmQ3dToA==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joGBK-0006O5-AV; Thu, 25 Jun 2020 00:56:01 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E063940164;
 Thu, 25 Jun 2020 00:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593046542; bh=yCaaK6Pfuvgv8qGAW3z6C8fFKBkxBwsP+SJXQCeuVrQ=;
 h=From:To:CC:Subject:Date:From;
 b=gnSrOCNmNxHFnJI3EQzTD8WNmtwLTdsnTVkvlx6+H9aw6hod6cNT3y0OPaMKqtjxw
 09GagtMp6O9QATcOUsgPUKYWNv2FHL6VaFL2nw5Ey+Z6y+fZbD4XTLfH0VMwgq+VmU
 XzMRKYqPOzN8XgvVKECjTZ5JwqQ+Qq8g0FJTOpcrayowIwaZZcVoO9Ie/IxFOlxPxl
 Qimqb5ct17CCUF9oiC5j5EVXtbSiIgQfIawFgEJg8uFRaVpE7lisJZIO3XVAQog8Nf
 MjCLVrJnCnKGhMlT+GC4f+NoQpkfnC1xzRTP1Q+KRU3QrJiUgQS12a8djPQGash3/5
 lsMzPnUrElEdg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6AFECA0096;
 Thu, 25 Jun 2020 00:55:40 +0000 (UTC)
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2050.outbound.protection.outlook.com [104.47.45.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id DEB5F400E8;
 Thu, 25 Jun 2020 00:55:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="d+4Lf1tz";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tt2lgOpCImzwnNKKO9QVDRT1djnzd48FVOD48oZOfGQ2TkKugf75fxMBpjIPSrlU2il+WnSneIwRBcOuKIxea23DSUwT/OM54fI42ys8yTElhqJyJ7Id/dnZ6uAC47VO6le3gvlgXZOCNsquW1bLBgq0yErjVrhIW5ox8wKiKNtQrjxQAI3JdoLXnZs6C47Z3bD7++7nUf19am3UlG+mGxCEHV5JvsC8Q66vGQ+YEs21uHOTyeHJEQoh6Up7paK21jszsbfzhnIDvlRqENPaRoxAK9i+U2MKk+kSRPUjJrFO/MjWnzGDqxHNUU/IQgqfST9S3BxcenkmNGsmsUJ+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCaaK6Pfuvgv8qGAW3z6C8fFKBkxBwsP+SJXQCeuVrQ=;
 b=FM7awDSV5KHanUcq9+JmczoP4qpLArt0gueij9/B1tthZurv+Zj68G8jnnf6RlXj9pJ4BdqV/yWDhIOOvx6lgnv2/ffkn3NU1cLlt92YYjCxvmPnFHgeNAP1FnHwkwzKpgjeNMN4FPa0X87KZSAXyAUiD1nNtZGoG4B/oAZ4hzYZMGndRPAgIf8/4+PolSVeYNyvaJxtw9F1nWAkVy9xYVpDuELXtwifyNVhz85Ar6rQNZCoPtHvcdGDziFqQvwLdImz/miJ5p1wyEvG13dK4FzYosxKjvZw+guqe2WnXFu+bHitGBP4eueRYBsKnu4374NY/FOmwv1TDtVOo6fO3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCaaK6Pfuvgv8qGAW3z6C8fFKBkxBwsP+SJXQCeuVrQ=;
 b=d+4Lf1tzEykEFFrS9QcoUyeo0rg9YL6dXgzjsbI5EwaB2MFwptO5bJ6pl7xcevYESydkauSBuqf5qupCkrz8cfiemJHpJnQ+dxR8e45Cai3nnV7c0rh20veM47dhomsdcy15PwKbOsSmIWBqOPGoDbjFjKc4zaj/Ohos3jmxhBw=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2741.namprd12.prod.outlook.com (2603:10b6:a03:62::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Thu, 25 Jun
 2020 00:55:35 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3131.021; Thu, 25 Jun 2020
 00:55:35 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "mailman@lists.infradead.org" <mailman@lists.infradead.org>
Subject: Repost: linux-snps-arc list msgs truncated ?
Thread-Topic: Repost: linux-snps-arc list msgs truncated ?
Thread-Index: AQHWSotVda26tV6mgU+ESp03RDwnCw==
Date: Thu, 25 Jun 2020 00:55:35 +0000
Message-ID: <0ede24b8-8d9e-4b23-0979-c366eed17df6@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3467315-4f3e-4793-dbf3-08d818a2788b
x-ms-traffictypediagnostic: BYAPR12MB2741:
x-microsoft-antispam-prvs: <BYAPR12MB2741EB85B71F3AA81416E846B6920@BYAPR12MB2741.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0445A82F82
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8RBKZwuzTt//v5d8fJWb7XM7yGf1dewSdLE3yYZcstFYZvKSt3dBzHRFtt7aRotUuMWwocAnHwZwyqnYyvfn1KRcZt71HBiyb2kXWzcMovhuHvfO5Wtnl5UwNikwdCNnC4eG4Tr5dZ5vWZOfTfAfALo8R9C5hG3KbmENDIkG0zgJSD4IzsBDZGJHTXTcpaHFCDL7qDZ1BnXOOnCMWoP/1JZg1UNzhkkgVNZQMVkv/P7NQ30/bBH8rFHaMa8Epk7oOxBq4vX+Gu0CapmRl+4t7n9c3J8UxPu3E/FcrhQ6qyPlsh23TR8kTOXyEoJD343oe2gyDTZjk/n57zv1/mSVtCtL8Clbp2aqch4qCTfVguUcDd6TZC6JUaX2jV+dNBK/DcUp+V6nNW4AiiUhTRIqB0DxhDHhXW1EDBzRfERnyRzRg8vv9iN+EJao4NFDL2QDV9f6dCAHyMOHJd3JfpE2d8Wa0TBPDKoQlt8MwboybcY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(346002)(136003)(366004)(396003)(376002)(6506007)(26005)(450100002)(71200400001)(316002)(31686004)(478600001)(2906002)(83380400001)(186003)(4326008)(36756003)(6486002)(966005)(5660300002)(4744005)(6512007)(86362001)(31696002)(6916009)(8676002)(8936002)(76116006)(66446008)(64756008)(66556008)(66476007)(66946007)(2616005)(43740500002)(15302535012);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: xi762RW7GFWQ3Rib6RF6XjnkaTOXjTLpK0BCeYnzH/WgxuMaYBzeOeYj8Ylybq/r1IL2FqJ9PSB2QHHCBJcFTGhnN16xpBBeJRSHlX7JOfvyvsty6JXzXc/ZhqfufEARHUX4qP2bckwkt69Xqkk53E/aOLOuL/fblX2ojvM3qUSfb6VZBliMXVvu0HPfibUCn5oDpqzS/JDgup5ARctrutnk6uFDdUlNIgSH1OKQhwaMal7shXCLR7jY6ivR12+nWEHvAtxirGw4J2J5auukCchKZAhuHbLgYjxYB4C/MYo7f1fFcixnwKnfdOK4G2lAnGuzZxyPCntstwWBSxryxuLhxkxwxSt+Muhc8M1waKf7RRbqv6W4WB1E/PcfPzZxAuMqNrKBnzl3OEDqHhl/fxlTpnBELBUFxt58Jq5uWNnjsomtjPRDzpUwTkjQ7wyRhIiYuYtKBRQIJGqkIoAuvr/zdBAzy9Mjgyip/oUbrvU=
x-ms-exchange-transport-forked: True
Content-ID: <341C9DBBBEE4A54F85431268D7FF0198@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3467315-4f3e-4793-dbf3-08d818a2788b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2020 00:55:35.7516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H4YNnyLOTNULhqyNkhQ1+kAD08cgxULAdAkR+gjiPK5nARpMFd9uvAFpnqg/qJhuDKgznKHZk1iRZnBLPOnfgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200625_015558_863771_98FC7C5F 
X-CRM114-Status: GOOD (  10.73  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGksDQoNCklzIHRoZXJlIHNvbWUgZGF0YWJhc2UgY29ycnVwdGlvbiBvciBzb21lIHN1Y2guIFRo
ZSBtc2dzIGZvciBsaW51eC1zbmFwLWFyYyBzZWVtDQp0byBoYXZlIGJlZW4gdHJ1bmNhdGVkLiBQ
bGVhc2Ugc2VlIHRoZSBtYWluIHBhZ2UgYmVsb3cgd2hlcmUgZW50cmllcyBmb3IgSnVuZS0yMDE4
DQp0aHJ1IE1heSAyMDIwIGFyZSBnb25lLiBUaGlzIG11c3QgYmUgYSByZWNlbnQgYnJlYWthZ2Ug
YXMgdGhpbmdzIHVzZWQgdG8gd29yayB1cA0KdW50aWwgcmVjZW50bHkuDQrCoA0KaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LXNucHMtYXJjLw0KDQoNClRJQSwNCi1W
aW5lZXQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1z
bnBzLWFyYwo=
