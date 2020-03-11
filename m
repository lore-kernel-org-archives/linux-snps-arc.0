Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0033C2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 22:38:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A014F20739
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 22:38:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PjLipHfO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HBaHQVnD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="EkEXwGaj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A014F20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vsueT568r0uENVyQsJ+6hMEFNMz7Ec6pe6nWxkP1F7k=; b=PjLipHfOx1WRnY
	GOA5CvgAodKyq+MMQmyQA0RyEgxD9L0luXzPs+QjYKa9N0PIgIteBDeTxEDGm0mKdjPMiy8kZsR0s
	vZ5HZvTzkWYM6tvAmTdZCY0CAYuOp32g0vTfmv+Gl+RY4Qe4gs6NT/94q/NiUYXrucCXAJU+fbPxx
	JTeVAkcnIdNBosyFKQcJTmLCqDgm37ZbsRms3D/7oaJiv30kNmMblMoL5a+gqt/O3Z+lsPHZbTz00
	QgVD6Lj05XlMFX9hRB4CTenNs980czQWGJpJJbtLKbb1OB5mqfzIjZH7dFXf2i3vaQM916HNYht8T
	+n+sJ8EobrVHZwyYvXCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC9zw-00006H-4I; Wed, 11 Mar 2020 22:38:44 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC9zt-00005L-ID
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 22:38:42 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 54A2043B7F;
 Wed, 11 Mar 2020 22:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583966321; bh=rOpvbDKqlEaU79gMgi2KNY9h2mMgAJxBqFyCsVjd6WQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=HBaHQVnDuRvaAN/F3j2n3KcNbLwiK6SicjI7w2h4AQ97PTggO7JxNsk1p+bawAEOE
 jUf3KxxBXimmWQhPQoOEh6fymJKvSVyFymlLc6sKJhJqpQAPOvQd+6oxxXs8Kd0hgJ
 Z8ZhZLdvDD6qnZd4v3IHnMfYLUMhyNNoSKP9Q5IK5oKbMC/bnys/OjR84yzGscaJJw
 MN8RM2B7zziUn4tKn4yNseSpG3vMPqPUDySnOJT1V+GwbBxvSRpJQdWZXvoC0SxX7S
 K+Fd5KkmP4WS/2xFN3AnOcrWxpbO0ZDb+wntHe17uE8DacpFqycJWT4p+YL85qONBz
 4oROJhywAkh9g==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 38CCCA0091;
 Wed, 11 Mar 2020 22:38:41 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 11 Mar 2020 15:38:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 11 Mar 2020 15:38:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTbAQKZVwCCiqVcuNB7FNTySHIa6+zkx15hakMmjWwusrEMgPkRcSJ9aJs3xKErIVmX+hNK6RX1RowDtA0wn09jGLoVQLJqunmezk/rIK4cm6S+cy9HdlsND5iSwoSHS6xOwCr74vZvI0Va09zAVrU3/Ox884SNJMG+5j3Gl+BUlOx6OAX8VHLR/hus9RMBqUt77wBYjo3hrixLr32UIn+8qH17jHEEX1/Dk1eSBnjfqLtG7q+ezNVS0E3HiSOW+SvmHP89QEkECEGZBQnJyWvbbIB18j5Sw3DM3ywMUZWeg5yAhyGMbmKmiPI8PUzlwILXH3kqMsOZONdXTlvyAjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOpvbDKqlEaU79gMgi2KNY9h2mMgAJxBqFyCsVjd6WQ=;
 b=jQHdQr5E06NLakyelc0/ikQZQ7yRH3gxwvifFu8TFj2jlvMG9tEzNNEwxIm/yrBFq5rGB8a+I2dCCu9+eAKEFyVTo1byMWgbdqRc1xMeQuVq42Bjqqcq7rRaNkMtonA45AIfGNTpLeJFpfRpqPLYDfFkCo41Usv/50hzkh7LuuUKOhULnhZJ6qKCp6S0qzdKLcfSl9wWMz5g5cZijM+82KN1XWTVATQC1ph1bxOmqAHIZScSSLVOXkdq1ph6uZKa0eE5GHX2OVd0m9M+aQ05ccLA3pmVPRnYO2nfRFuYlWGe0lpZXQ1FWVZ4D9Abp1IKBbvbPVXSUrNGv2ZKtDM7nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOpvbDKqlEaU79gMgi2KNY9h2mMgAJxBqFyCsVjd6WQ=;
 b=EkEXwGajiwjxz0FQLcDwJF8Znl0Veq06bjgZ86OKZ4LGc1Fvq8cevzFabGwwCshkF22hXUO2eW9jcnc/pBJJLdCb0FUL73nv7AM95pc3s3pLw+tpW6jcfaAqV/Wef0XCYgBU8IIIxa/fpSyllUdz2pnMfiE2M8ENgduXIyVIiug=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2934.namprd12.prod.outlook.com (2603:10b6:a03:13b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14; Wed, 11 Mar
 2020 22:38:15 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 22:38:15 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: DJ Delorie <dj@redhat.com>
Subject: Re: How to elf/tst-ldconfig-* in cross test setup
Thread-Topic: How to elf/tst-ldconfig-* in cross test setup
Thread-Index: AQHV9/R629dkX7tSWkK2XcvKH3zd/KhD+5kA
Date: Wed, 11 Mar 2020 22:38:15 +0000
Message-ID: <4d6baa8e-2fd5-061f-68aa-eca6e11a3999@synopsys.com>
References: <e92a698d-1378-5990-d7f8-05c27c5bd689@synopsys.com>
 <xntv2u4jca.fsf@greed.delorie.com>
In-Reply-To: <xntv2u4jca.fsf@greed.delorie.com>
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
x-ms-office365-filtering-correlation-id: 9de9784a-cf0f-44ad-1a76-08d7c60ce364
x-ms-traffictypediagnostic: BYAPR12MB2934:
x-microsoft-antispam-prvs: <BYAPR12MB29346A79967D0FC8726A8DEEB6FC0@BYAPR12MB2934.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(136003)(396003)(366004)(346002)(199004)(6486002)(6512007)(316002)(2616005)(8936002)(36756003)(54906003)(6916009)(6506007)(71200400001)(53546011)(478600001)(31686004)(66946007)(4744005)(66556008)(26005)(81156014)(186003)(66446008)(81166006)(66476007)(86362001)(4326008)(76116006)(31696002)(8676002)(64756008)(5660300002)(2906002)(47845001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2934;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oAelrT1YUh6QNuoyUSNhCV0PlEeRuRR8lHvlfPGCkdsNclmer56cM4PeLdJZP2NtAubRR9DDavwE3syIFZmj0x8ESZcp2OGJwuteGNf5K+DzxGi618GSD0aOrc9ttZ5gL2/iZ2Q9Qs7pRKrHugrsodkVJ8sc0QvhTX1Kf0rzsu1h5juTYN6syT89W9TaZo4udW13LW1gUBjhtX3awZiHayBJdqU9755JNfevykWD7rjd0J5+g+fY/IqmdA0LNBRjwx5+6MTMILvxxblEQSp0qSTscF9cE8iwUYuKeygXxQ9v5p8cQdlSSFgHqWYPpDClL0orefBCSyf13P7VxWr06Gonmgw1zd92cYJv8ZaCGKGNcNP08lSw+9lsExfb+8rhbRsLtSbJWHp/xBr0EV7rK82liAhJLTgmgQ9g9F0ZOU8En/HdiITOi7X9Px5JJMqyJ3ylynESuhODK5iMD21c8f2uRbfzyXViBBJvaiw7pP8=
x-ms-exchange-antispam-messagedata: kmPSdxE+5UxSxtA51Vug922VT2BGBGhRNQtUZZhJ35VjDyRqIsbhKeOvjn1ZvB3D4uNPIH1W96OSwv2smJF0/lO3JFAgvnKHwNTVTiX1h1N2awJ5P3alVweS104o/NgUcMpip96DegeFoLs73xCI0g==
x-ms-exchange-transport-forked: True
Content-ID: <6CF1CEB4DAE73F44A84D3129D1863F1E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de9784a-cf0f-44ad-1a76-08d7c60ce364
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 22:38:15.2550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8COkxzp6CwohWkhs5vjLWAvxtgUTb83QgiZbTOM6GjxZmOShEalYoFm66qmUFHFWa1bNrCLBjlk+sWizNgOjlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2934
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_153841_618847_381ECD9C 
X-CRM114-Status: GOOD (  11.33  )
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

On 3/11/20 3:28 PM, DJ Delorie via Libc-alpha wrote:
> Vineet Gupta <Vineet.Gupta1@synopsys.com> writes:
>>> $ make test-wrapper='<full path
>>> to>/br/build/glibc-867196a7635/scripts/cross-test-ssh.sh root@192.168.0.20' xcheck
>>> subdirs=elf
>>
>> FWIW the original failures were here
>>
>>   lock_fd = open (concat (pristine_root_path, "/lock.fd", NULL),
>> 		 O_CREAT | O_TRUNC | O_RDWR, 0666);
>>   if (lock_fd < 0)
>>     FAIL_EXIT1 ("Cannot create testroot lock.\n");   <----
> 
> That's inside test-container.c and should be referring to the
> test-root's root (i.e. <full path to>/br/build/glibc-867196a7635/testroot.root/lock.fd
> 
> Is there a UID mismatch between the two systems?

Possibly because I'm vineetg on host and running testsuite on target as root.

>  Did you run a full
> "make check" at least once, to build the initial testroot?  It does a
> full "make install" into $build/testroot.pristine/ to use as the basis
> for the container's root.

I definitely did not do that - let me try that.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
