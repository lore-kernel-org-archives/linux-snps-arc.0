Return-Path: <SRS0=LyzR=6C=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED17EC2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Apr 2020 00:04:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B835A214D8
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Apr 2020 00:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ra2tEVPe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ildsIH9z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="F3T94ndb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B835A214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DscwZLqQrMdrFugFMVRT5l5TMJpePUOl5G59qt4hIeg=; b=Ra2tEVPefXbaqz
	oifeFViJkl8fNU7Jg3e7gEBumZJN4eQmUiYmPASHgCconnZkJPa8Y+G8a0zow6qs5jd01KbtPyHDY
	KLsCwAALdclN2CvNsdu62E2umwx9DkHgG3gjYN8dZkZHZZvjO0NeYvYXOj0qiGO0YEKpD2Po5hLMt
	Cklywp3vLvJ4ypJN3GSgxP2jNGIfYsVHmLiX+S75dYoQTNiYM4RUUzu1tAC8R7WwVe+CNGT3CGkU8
	iTRA2vwvZnpCwXlHIadffhVVZOfOr40m8SoPxmA1ZOsUSSTZHqcpWfZjvx/QxXz2g9/8yOzd6cMmo
	uapbcOoHkRNGPrm7W+xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPayV-00027R-N7; Sat, 18 Apr 2020 00:04:47 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPayS-00026x-8D
 for linux-snps-arc@lists.infradead.org; Sat, 18 Apr 2020 00:04:45 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4E7B040387;
 Sat, 18 Apr 2020 00:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587168284; bh=P+r+N+E8jqFFz1bb4Tf3x1B12WamkLXEKVF5I73CqME=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ildsIH9zKsxGtBn+HgyBO1zAekgS5U1wbLadEji+EVtD0mV+eYI7iiTVBlob55bk/
 Ra2+vqWJYiddu7DTiGYDqBFYXjprkkLZtRhSTax9Czhl1Y3UQyL9lKEKK+2owwZxCc
 sGcikTiTiOmoRnXtZkDnynBC10TW8vKPT4syUav+5g8aqmOeXKgECW5kqtPpu0DGj7
 PTggOQf1KHQVrK33eUJfsiBsjpHZU4rJx9QMlwi/1yLF/xb49Sxc+QhUr8RazeNiWT
 onKgQIyaKTJ6qj5XjNIu4KMyVGFXGcrwVxh3up0iWYbFu2HsbCBREMB3pdUaes7QvX
 6QVhsITOqXm/A==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5A857A0067;
 Sat, 18 Apr 2020 00:04:39 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 17 Apr 2020 17:03:57 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 17 Apr 2020 17:03:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5LnHPhjjEXpZU5Bv2U/N7BJhEEucEPebqkkQQii4zg0R5OWI4/J2NQmSJYNVelEKn+czm1ju6/6mJFrAz0QhtkmW4azpWF9HVn8lY4TdW6dwqDuTTJhJ4kodDkuOSJaareJ7mabghpGAGrIgwV2dqDchVuXHHTquyl4mE3GMkV1uExoiZLfTJAbr5z6HOQcbl7OAiWMeyUI7o5vje0OxbxhTmG7jOmYaaM+7iF56t1orj6+sb6vRtSQkc4iN7JDAs3Y5N8W5xgaJCH66Qj5KhqW/yMQCNfO9h6P9YjOPaM7LCDI/VWOJ5zhWIkK/oI9l9aClvaHlHDKtAYPBqK7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+r+N+E8jqFFz1bb4Tf3x1B12WamkLXEKVF5I73CqME=;
 b=idHkUhM5sNNbTP034KA3srhc8UhObnccY7rpEicf/NkffC85zXocfI5fh1HvcorXM7MmEWh6MawfX3+9HGEI163mSTflc8v3JbL25FcUC4E0eKaAR2OgmtSfAYVpjZr0pKTfBidWn+ip9PTA0BJvPh4+YUgPwkiwC2rSwVGo1BoMpLyab3gjA3ZdkybLXIsQOzYQl73dLBd01Kap/6eU4QaF2CeNAw5qAHNkSvXq0WIK0zVCF5coycpcPBJlCpoP8o0weJQZT0rVdRYd4W2yyGtmoxN/HWnTW3/eLri5Ank+xUoCv/bMxHf0BO6e7VGP3tb2SVFCI3bIWOWrSMQAnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+r+N+E8jqFFz1bb4Tf3x1B12WamkLXEKVF5I73CqME=;
 b=F3T94ndb2VJL1lFYuBQq59FGEONA58VCEHSCUOau6CxgiTCh6KqG6i8iXMxaGQ9pmfWdsuoLCIHmauNjHYJcFqur8H7Bi9OLbA0HmR6cfUodWdpv7hWaSKilI4AlK/0CFVzijB8HDGhEDlDmnEAvTtVQ8aKIb5wdw9pj3xNR3NQ=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3254.namprd12.prod.outlook.com (20.179.93.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.27; Sat, 18 Apr 2020 00:03:56 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2921.027; Sat, 18 Apr 2020
 00:03:56 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v2] provide y2038 safe socket constants for
 default/asm-generic ABI
Thread-Topic: [PATCH v2] provide y2038 safe socket constants for
 default/asm-generic ABI
Thread-Index: AQHWFQ66YTbfA7IijUqRmITzYdB8aKh9/5WA
Date: Sat, 18 Apr 2020 00:03:56 +0000
Message-ID: <dd971c89-5d43-4e7f-c278-df3b0a5699f0@synopsys.com>
References: <alpine.DEB.2.21.2003312122350.30236@digraph.polyomino.org.uk>
 <20200331213208.22543-1-vgupta@synopsys.com>
 <alpine.DEB.2.21.2004172320030.1082@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2004172320030.1082@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: 345b17f4-c1f9-4b40-2c44-08d7e32bfcfa
x-ms-traffictypediagnostic: BYAPR12MB3254:
x-microsoft-antispam-prvs: <BYAPR12MB325454F157173E9D03F9DF7FB6D60@BYAPR12MB3254.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:178;
x-forefront-prvs: 0377802854
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(396003)(376002)(346002)(136003)(366004)(2616005)(6506007)(86362001)(2906002)(5660300002)(53546011)(8676002)(81156014)(71200400001)(31696002)(186003)(8936002)(31686004)(6916009)(66446008)(478600001)(36756003)(66476007)(6512007)(6486002)(316002)(64756008)(4326008)(54906003)(558084003)(66556008)(76116006)(66946007)(41533002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0kA+KPADUdky3vEzb2WGImMB+Sh8gTW/C3Vox8pSWWcNqGIDosAgAHnvuwhUZX6umcYqnsVSF9fsjW4FyDRz+PnpeVfVNfUsh/g1vKl/mYY1SroQXc6RNvHfdDu9DuXcLelKm9GYyBOtbUqi7xwJb4NOuaK2Tn/tNkWtq2MeP7jV/sJ/VzUexi0cScmiq8kdd/HsNBpHA45d81sM6R1dG2nmVHKXeJ8IaeVe0zVCnnB5VYp11zzdvE+iX0XkXjJc6GkbnEO0UcQkh929UgOtOBsryMvgGqFoPg9nbIQzjgxX4om9RoD/9+idQoeMhYZDsMLJHfK71zJP/zroqsBIkUBE++/7aBZX2fPswJiVKmOFRrs9q9VZ8r8B5c2shsBfMpQ0TX6fuNYLn8eH6K6SlzxKmP78aO8vTVnGJn+EvECQVgC+aHzMO5gGz3Yy37lVIzTrhznfh7KCkl/kB6R82o9culLdc7zourbNIMdTNjioIG+ncoMHELYOyUpS84fY
x-ms-exchange-antispam-messagedata: T7h5Ngi7W9lUNUU0hNVgz2GNyEjhk4EJIL5GeXbRb9/1Dl28DdKehjv+4LZOpJR3+NQt5cnBswmEuAQ/YRHQmXyQ5Mrrc4GmJFC2WCvEoiYsi2yI5sNRfQ4HgfADf59AIIZgMfTnMG2hEZ0qRF8KQ7dSXwBf0OXqv5b5VLwIE2L+XkNlS8OaRvnwGkICp43vbbA8ddoQNHIsipqaqAiQmA==
x-ms-exchange-transport-forked: True
Content-ID: <A0D93EF00E12024BB397CD6202CB347D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 345b17f4-c1f9-4b40-2c44-08d7e32bfcfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2020 00:03:56.1978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NSgmLcVFEeWD8a+PhzybB7Fy/ebNrtxoiFsyew/2wD36wy/A9kAP5PAXYZ4wTXLyS49Ce5RsQ48QyVXPvBx32w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3254
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_170444_307156_E8C1B6E0 
X-CRM114-Status: UNSURE (   8.75  )
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
Cc: Stepan Golosunov <stepan@golosunov.pp.ru>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 4/17/20 4:20 PM, Joseph Myers wrote:
> This patch is OK.

For commit now ?
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
