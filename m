Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CC6C43331
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 04:36:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67ED920705
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 04:36:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UXHubIlD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Y9DdOywI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="oWF7kYPj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67ED920705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTANpPiKUxjV3MxGKikcBlyq1NcCrKAFSaOQR3/ds0g=; b=UXHubIlDyhkYuv
	f1jm7ngHk8Cd/3aJy0GtuxuPvTB6hPDvX9YQ5hbkiiIvdSVEYDkEjxga6SNYfyuKxbFMZT3mMg5AU
	cmKAMfRu6uEOU+CGLcL6pz5IGypWmkBuLai+aXJfnoh7Ubyjuejo+o+TsHSsJaOhS49iRFf+lOhA0
	gqK3PwalWaVmDv3z1ff2ZYeBk/zIJbfTRiV2bQujDobD2lmVik/VKCOB//d8zrEiRP9sKp8cmtLRd
	PfTu1G8JBCorGz4JxeupfxZdMHGzZtoFDrL7Yn29F8J8i3o6vy5t8zGi+kTdF2lv/06iMQGVB29e+
	rtdwhiujCQRHVHgLkW4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHgjO-0001Si-E5; Fri, 27 Mar 2020 04:36:30 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHgjM-0001SE-D3
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 04:36:29 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3DD63C0F8F;
 Fri, 27 Mar 2020 04:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585283787; bh=JGDNxRVemfmgky6OIb+99twOJtpnw/mjDNJU58QXmeY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Y9DdOywInlimg0CuH0hEOhdelaqE4JIt8AEmfSmWXOdSexzxuGjYE3z5WgXvsFswH
 8vVVjBiO0/LKOC8rh/pJ1t8MB/tnfSKKkkE+G0SNz5Q9EPIv0F1wuwauV5b0fwvoLH
 uv1IUKB5Jps/PmngU+uKfTlXxMvV7i7qwO0E0tigSwWnT26kraM5EenJOS0YeaXXUX
 42YlcKSstIY0wnHZkICYQipHLjoX+jEg18BdiGdAKZDU+T5Vcdb4HG4aZMwwDjCWm5
 6nWjA9WhprPHpsptpjUPBD0jJSTNhZaMexIAqc/MDW+5IvvlNtk9wMv54sBhpwq3ED
 ryTUtT6Y8ExDA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B8855A008A;
 Fri, 27 Mar 2020 04:36:21 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 26 Mar 2020 21:36:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 26 Mar 2020 21:36:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgetS5SqAbDGKv3GJUdPjQIS8OAUZDdKkwrAGz0FFvJ/RYI3tfX+GIRqQrL8esjF7RyG1Q2jPiI3vk7LfKQR2alYPP3OyIAEe+Fszg4qRSHzULSTxGqETc0aMRmMXW4ogfepyGHtjhWBS5VSAKkoO55mM9n0vyjrqOIxILSeKD4+o4mWdXvOC2z1Qgx0vJpbxtth/dS8CwvmdLnaG4ewZnCtUyHl88xRJuXn4/eUXOUPOvhvY8yVFDP0SSBRBNd8TBQWTw1CFCc7wHXI6PnCGGI2PWdZ6A0pIX4ZX2wXlmmRIrrLY1J82EBKnjcHQ4J8yHhbmZ8BqKTgICffRknYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGDNxRVemfmgky6OIb+99twOJtpnw/mjDNJU58QXmeY=;
 b=b9TCF/iGkp0sLQHOCtEBmHdL+ZhvUfST+0aWZPQ1HvEssSvAE8vczHIdK0xms6ynhoPnKGC/qjqsB7LArM7+f850lSH7UV4rY8EgVDbibI0UYvsR1nDXwB2QOxJmiaNizHovkfmDTkaVh53aZMu0Bxwy02ZxMGGJaPTQrczk8hWaXVvyqJZoXTaSePx09xL3/Z0y8S64PXavlT6e0gwxa2INP7rbw827RUSo5EXaO/FD0qaGXNucOr6YoTYdrZpD1mMQBuZL0FnVz+xv7mc5GTG6N0Oluiozu4Y88iqmEbwDPaAC4Tj8dXGZj+bygnlVCfgegS8J+D2mw3u4rUFoyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGDNxRVemfmgky6OIb+99twOJtpnw/mjDNJU58QXmeY=;
 b=oWF7kYPjbSJm0mRST1qR2Y9XGz/2KBWJgXSpakWXmZ70LQ7VuNJ26ykKyiKiyhWVNcP+Mmaw96HY8rVJ5x9qsGfhUnUj6SqELcveYyNRHq0yaAfndjolzYsZ3RMhGUgfFdGQKjIQXTgu+EtIurz9E3xbQkLX5n4THilW+T9Ejfg=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3221.namprd12.prod.outlook.com (2603:10b6:a03:135::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Fri, 27 Mar
 2020 04:36:09 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 04:36:08 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v4 11/15] ARC: ABI lists
Thread-Topic: [PATCH v4 11/15] ARC: ABI lists
Thread-Index: AQHWA9BhwxgpKZ9Hp0urfPs3EKbVXKhb2tYA
Date: Fri, 27 Mar 2020 04:36:08 +0000
Message-ID: <96e4c23d-d81c-6622-b7f1-6fe8e9bb06ed@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-12-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003270039380.24611@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003270039380.24611@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:24c5:8a14:3f19:e6c8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b061df69-3261-472f-5a89-08d7d2085ee1
x-ms-traffictypediagnostic: BYAPR12MB3221:
x-microsoft-antispam-prvs: <BYAPR12MB32219720AA96CC52891CDD14B6CC0@BYAPR12MB3221.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(396003)(136003)(39860400002)(366004)(54906003)(6506007)(66446008)(64756008)(6512007)(36756003)(186003)(6486002)(66476007)(316002)(76116006)(4326008)(53546011)(4744005)(66946007)(6916009)(66556008)(86362001)(2616005)(31696002)(71200400001)(5660300002)(31686004)(8676002)(2906002)(81166006)(478600001)(8936002)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3221;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9/utdb1ERJkSu9Oh/NaW5W8FtTUqYnakmanAhsuur8OeD4Z4lycg9naOqCVZ8jlT/tg2P0rQ9jOkuSVSaDyDc1tWJYR47RMeP6xTXAKu1bPqOjBop8/aCGxmValmFMbDws+ecD4maEDqrdJZd2kqhJelCmQkvPgQxvgZtd3OvLtcfOmuH15RpPnY0cZdiOLu0hK1GdtpZvvuFIpuGkewq+oUbXy6BER1+R8xy6QIjBh/lXyyFucjNvHPN+Uie0XjcH1Zw8Oy3yppB4bdezC64wgbwumMToIhMSo62FsMlL53SnLZUadPXacEi0ow330E0rgCqEfyZP3lKGbgSpj29j/70Yc6YHOJXe+7FdZii5RrX5JokCNYFbYih3D08pcEOjl9LQrQt5N8cu+bMEDJhE5AAon3mGwDL+Y6an72C1yucyuW9GbLSjQ8eMQLBEeQ
x-ms-exchange-antispam-messagedata: DwbTrWrrl620b0OqjZCJscuaUlkkbLisbnWpAb9przqgNXln2YGblirQXeYtXljloQrAhe1t2F2IIFXoyYy4WHUSeWY/MW9dNX5II178TxCWw7cHiAscP06uXJPvxE7BoispzbATklbC4zYO/tvQ/Q/A28mBXmLJ1sLX1/2glHvLjzFdDRSwNaqoMC+tcWgyLzHa0mBc0Kq2CfFS7BdEsg==
x-ms-exchange-transport-forked: True
Content-ID: <EFA320C6BD80054389EC9502DC6714A5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b061df69-3261-472f-5a89-08d7d2085ee1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 04:36:08.8643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDxxYXcsdYdBzxPS0yGVHxfzfxeO8nNL4mduKmmqRJ+oyeFdpRTnV3dMF4G4AQR0j8EQsHa7Ur5Txo/CFgjRiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3221
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_213628_508679_CA52AD56 
X-CRM114-Status: GOOD (  12.00  )
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

On 3/26/20 5:40 PM, Joseph Myers wrote:
> On Thu, 12 Mar 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> diff --git a/sysdeps/arc/nofpu/libm-test-ulps b/sysdeps/arc/nofpu/libm-test-ulps
>> new file mode 100644
>> index 000000000000..0e8ef313fa94
>> --- /dev/null
>> +++ b/sysdeps/arc/nofpu/libm-test-ulps
>> @@ -0,0 +1,390 @@
>> +# Begin of automatic generation
>> +
>> +# Maximal error of functions:
>> +Function: "acos":
>> +float: 1
>> +ifloat: 1
> 
> This file also needs regenerating to reflect that there are no longer 
> "ifloat" and "idouble" ulps / tests.

Done now. FWIW regen-ulps simply barfs so these need to be hand edited.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
