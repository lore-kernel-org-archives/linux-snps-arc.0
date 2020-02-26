Return-Path: <SRS0=BbR1=4O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CF1C4BA21
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 20:05:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D0724653
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 20:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qJ9S6h3d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FugQsV+7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="mfXzX6SI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98D0724653
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NS3+2GtxwFgFdOUfxTXYU3CeUETjAsqKk3zWLYMqZ6k=; b=qJ9S6h3dFiyfee
	W0aLh5JfIk/i39rP7uVglCNWBQOgiX6KJWH3fVAAL+1iaSmBDNkPZjBS4q7a48GT8UZ97ANMMLjAy
	tNFEoZ4aLNxFei4Ycj2BsnKCQiuMVew2luwGzEuLSc30h4TIhkADJCHcQq2je/GjG+1VUUa6fSBuy
	R73ISidI9grUda3GKNMxYpIRN2scaDJlj6E4XGEQ+X/eebEHJ++rum70RCTvWPw9VIcHGWV3ylztH
	YlADK9ricxdKspcyr9br6DUJv/p3CIwH2rh8UoB0Ul0mxzkqkhI9LvoJ99CRrv4a+feC+cTKPQYgI
	qpS+b1mjAnoPAegXFYjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j72vW-0001yY-AB; Wed, 26 Feb 2020 20:05:02 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j72vU-0001wa-7Z
 for linux-snps-arc@lists.infradead.org; Wed, 26 Feb 2020 20:05:01 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C5BD243B4C;
 Wed, 26 Feb 2020 20:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582747499; bh=TMP23MqVrFYCGomTCpc3ieZt6KpmctXXK0+FLqRV+FQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=FugQsV+7gv+jnSyJSlJ/iVdGJd3hgEZhf+f/u2MbEHtwoovGJcjGjwszS3RTsaVwZ
 Bmb9lPhUtMYjOj9AsTdslYM/LvsoMXUvNsSVHQK2s0hYShDq96Efdv9/ghWIRcZ4s6
 4pdT4GWGpum356pQYnKDzJVpRab6V10Xa5sZRDwVgxc1A0EWvkWmX1Ktgm9DHPlVW4
 G823G5WxrFm67IyG4PurbPJTwP6yU8otIJGrR2cTu/MhdcufWY1IlQXbZ9TBKCEHDL
 ifTtRUWKUAyiiEaNPw5xUv+2Xoh+z+ICPScvYxdAVYFFkpWMuywEQugJqmwpOHYb6H
 MlFm/JwVqoNIA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id DE228A0083;
 Wed, 26 Feb 2020 20:04:52 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 26 Feb 2020 12:04:52 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 26 Feb 2020 12:02:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lv81WQRIH1oZeWhNnc5XS5kwmwsvKqpkUqNUUpt6iHeHp0zwMlP4nIDte2C+HCDf8ymwNWlRpU46dej+xbjFxGck6dBI4dLi3tcnAc5BBxKfLfpOLMWKVDSlj4XPk0F0WbEY0mW3YM4I0Suz87ouVod7NffWGhJphEdUC92ASZh3b3xGacV12fZnS5R973/AVUsjlQ6mf7vIJVybWjPADgBwhmuv6DXY9vpLISHdHFsI6RXTlS8LYesefdns4bkveRa1eW2IUBnHWAviYN6ElBg/RW0r3+gWeQKpnQMo+7j6yux4Z3sCtgudM267WAnQU/l+/5xPLuQ8Wqraz7rxNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMP23MqVrFYCGomTCpc3ieZt6KpmctXXK0+FLqRV+FQ=;
 b=ejOvHHYUsHRLC6UCPkE10KfT2h0OY0ADEopPouQqV+xq3Uc7aKUwPa3NV8LACypq9o18SE2aFB3u6myL0TQx0jcDfhUI70eD2oOD4wZcG1AeW1SkmYLGklYXfYp1BaMaZtgTBeOflYwozj+I28Z9RVBCD9UnWTbftoXtKUjrPTRFRqi+HdWn+BodiHwMgE8mHQSgnYwQKPDsFYgmDvOTOoAepMj2nKzWhmWb4+VZjXHZcGqYRBoIh8JQ37XmpRjpJbIn5UMr7UueG6LTtF2J0s70GGn3MYQOs/uaeiu/DTGcyFcEOyZrEscnEvMCss8pwkxtnJ8RRnj1tJmbdZsElg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMP23MqVrFYCGomTCpc3ieZt6KpmctXXK0+FLqRV+FQ=;
 b=mfXzX6SIobW10J91UkrSf/rG4bpu2t+zXL+l0LXKzEMeaGD/GZ7Va5aw8dNZe68TCMfOAj7GLxeB3neov9U6dLKJeaCyjarrL2mum+dqXOJWrT4RCaMniuSG7+FbnIB9XK8vj+8w2nlr5EdyBuLojflI99bWxpXZhUKrbf2FehE=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3175.namprd12.prod.outlook.com (2603:10b6:a03:13a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Wed, 26 Feb
 2020 20:02:16 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 20:02:16 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: ELF_INITFINI for ARC (was Re: [PATCH] Introduce <elf-initfini.h>
 and ELF_INITFINI for all architectures)
Thread-Topic: ELF_INITFINI for ARC (was Re: [PATCH] Introduce <elf-initfini.h>
 and ELF_INITFINI for all architectures)
Thread-Index: AQHV7NhheSYc9Glqj0C1TUWkO6c+D6gt3CpagAAJbYA=
Date: Wed, 26 Feb 2020 20:02:16 +0000
Message-ID: <0982c2d8-c8cc-2969-2846-2d1f39fdc4b0@synopsys.com>
References: <87zhfngjot.fsf@oldenburg2.str.redhat.com>
 <mvm36b51ahf.fsf@suse.de> <871rqpfc07.fsf@oldenburg2.str.redhat.com>
 <mvmmu9dyyi8.fsf@suse.de> <87r1ypdrhj.fsf@oldenburg2.str.redhat.com>
 <cc69bcb6-526a-469d-f78a-035208645ae9@synopsys.com>
 <87y2sp174p.fsf@oldenburg2.str.redhat.com>
In-Reply-To: <87y2sp174p.fsf@oldenburg2.str.redhat.com>
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
x-ms-office365-filtering-correlation-id: 5ecc8f12-34f5-4b28-f085-08d7baf6c738
x-ms-traffictypediagnostic: BYAPR12MB3175:
x-microsoft-antispam-prvs: <BYAPR12MB317508D378FF812DB0523F24B6EA0@BYAPR12MB3175.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0325F6C77B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10001)(10019020)(366004)(189003)(199004)(76116006)(6512007)(86362001)(36756003)(31696002)(4326008)(53546011)(6916009)(64756008)(66476007)(66946007)(66556008)(498600001)(5660300002)(8936002)(966005)(66446008)(31686004)(81166006)(81156014)(71200400001)(8676002)(26005)(186003)(6486002)(54906003)(6506007)(2906002)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3175;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zd8r754+/2e5q0AuHD2H5b1jb+32Bia1ykt+Nh9cH4qBJA5ezOsKUerqns9y2T3RgucxLAOTXWpv/aDXA8mnqQauUPH8ISMuyMbfDg3GL2IaSatLC9KZtyU6RNnecpYhkw+icy9D7Vv4qIevzy0NdEdWqjXVdrX6dMMQ13iWZD9UUbtgdjMx9QP0Kj97fZjPGa0F+Mk2zlFyJMdpGGouVw80XjE9O5MtD4QRcVPQD9UWxnVSD0R7Msjjc9WJjrZtTvekfRyI6S+A/iNDYwqpg5TBGtN413aNGDa4pw1Iq3YaVrU7xXgo7fxQOeiG6ufP5ITWfj9suO2AeGdM7pDnlLOQEoiroCBXWB1QLdmcNQLuLKX7D8ucOkZelq+CXLOG8YVacxo4s/GSSTo6OGBwrbl/ALjWHN1Z6Lxc5APOVxghyMWsGJZxwTJNF6Kp3PO3+syC9rkuszCjpXsTg0DI2nf8pMOo6P40gKklv50xR3HuKP86D0kJf6u5pXOxdndqlA3jEKqo7aqiFhiNXMAncPC8af/46ccAuCtvdx+5tsUOoxtjZLoGI5maNHsUe/UOQZWsd7fYv2aVSpE+ndowLSYGMAydt21Up7bRJFxvkNUVi5Ir+fvgjUcUBbGn1PAR
x-ms-exchange-antispam-messagedata: QT2COq+MIo9ML3sQxJ7HtUrCWUp73T3PfMDW9EjNhCbanL+8/Eq9j6RqWxJsYCP3BpUjqSnEQCGW97WKIymtyKYPUVSlZR+4fUxJbJp5MocfTako+RQhOQvU2U6juR3W1K48fcGknPmDSpb6d6IcgQ==
x-ms-exchange-transport-forked: True
Content-ID: <935A6FCA1EDDAB4FB395062E3AF9236A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ecc8f12-34f5-4b28-f085-08d7baf6c738
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2020 20:02:16.1614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3W6UGzTPuolZYLO9gc8LrqGArlGatr152RGeBCzADZiFb2eOETYss0pyo4iEb0JhnbNvmhsKYDzEaABJ95HEuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3175
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_120500_283855_FE8A2B2A 
X-CRM114-Status: GOOD (  12.99  )
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
Cc: Andreas Schwab <schwab@suse.de>,
 Alistair Francis <alistair.francis@wdc.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2/26/20 11:27 AM, Florian Weimer wrote:

> I haven't followed the ARC contribution process closely, sorry.  Do you
> plan to contribute the port with a GLIBC_2.32 ABI baseline, or do you
> want to support older binaries for an earlier non-upstream port,
> backdating the baseline?

No we don't need to support old binaries: 2.32 will be baseline

> This matters because in the GLIBC_2.32 case, old binaries will not work
> anyway, so we may as well require that they are rebuilt without
> DT_INIT/DT_FINI.  In this case, the glibc master defaults should work.

Understood !

> If you want to support old binaries (which use older symbol versions
> such as GLIBC_2.17), it may make sense to keep DT_INIT/DT_FINI support
> as well.  To achieve this, you need to add an <elf-initifini.h> header
> file with
> 
> /* Enable DT_INIT/DT_FINI support.  */
> #define ELF_INITFINI 1
> 
> and keep the crti.S and crtn.S files you already have.

Per the review comments on ARC port last year [1], I was advised to remove the ARC
specific crt*.S so those are anyhow gone.

[1] https://sourceware.org/ml/libc-alpha/2019-01/msg00654.html
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
