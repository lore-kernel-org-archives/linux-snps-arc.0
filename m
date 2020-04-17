Return-Path: <SRS0=p2sK=6B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D07DC2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:58:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0167B20732
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:58:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DMbi9iW6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Akk9Vm+I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="tVfHnN6d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0167B20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4H5roUrtKaWMrVSApZRmoVirOrJwXKhsGAm44VamUI=; b=DMbi9iW6d3P36A
	bSmic5L7lwLT/5L4jwuQj02YQ9xMj3EznpPX9d1FqUm3elGDwquavpmVwph4A9T2YUWMENj/iZfwr
	GyY4Lpz3peWZgCmojEtjOAQW2hE5VJGp5EyFjR3Q32DaGq1iwLf4/G44xfMic8Rxwulk27I8ChrT3
	XQaDT2g7EVIXo+p01CP49h3QKYSiLU5RPn+s3OQWqvd+AxzW16wkIo0ayftfE98TaiX0vnJ+Z/VMU
	VIv+mDwAqiJ91sEFlx7d76teafkMVbw0ceIT20EX0Oc6tNVip6k9VWhzD6J9PDkklwyaQLcSG1MfD
	+402iDjyij4wBIfeXtcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPas8-00075r-27; Fri, 17 Apr 2020 23:58:12 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPas5-00075L-6T
 for linux-snps-arc@lists.infradead.org; Fri, 17 Apr 2020 23:58:10 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CAC1FC033E;
 Fri, 17 Apr 2020 23:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587167888; bh=ANI4H7xjDYns6faee4IczlBjtyWhsw3fyCU/J/tmVsI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Akk9Vm+IqsVXgOWTWZJNq9Hq4l4krW7EvvKFuy3JGdKIkeaz6lk/leFhFD5jYJNnP
 MFwULRY3IpfZh7Z8z+hboGU//ItYqOtVewxPF7VpzfQ4FaZAyhVqTcDFUILwLY9ezE
 9Tdb2LDW/+jKCylE1dKEjJxhqyuC2zlTTPHVFvxyG2yhZq7/m8ALnXZpwtDMb2NMF9
 lBkM790nXE6HMIAZVFJ2be9w4rFjUsbzBdVOloUVXa11C/0jCNcMKfKefJUGsfrNT0
 2UtlvGfxY/fB3YzuyhOCoIp9S3roWxW4AwuO9v2trfHEeRcKBznEd9C4J7MAFqqbPK
 jdGXvZclVYb1g==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9EFFDA008A;
 Fri, 17 Apr 2020 23:58:08 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 17 Apr 2020 16:57:21 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 17 Apr 2020 16:57:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhdvhxwtZNgAsBy9T74isEBIJAqvS9HpmPlbIqCq4GQHy7S5phwAU3IkvDpgr08vLYKajZuea2z3Zol9VMHq4XQeBLYtb5mURkyGjgZMgAB1AwQ2vs81UcxUpx5IPx8hLWqoQB+hpmNQX2mCUfa3LclZbUfMJgce1IK9YrolvEQBbkcNAOvMcTmoQI2O6NeAzjs/8pVzZBW1FpcyWx2vBlX9ZlEWKaQ72pZARlfFN1vSDXFix64kr7yDyfQTao4Jl9cuqmgxCo6ORqPexx8fJJbCxN7F7V5OZgqCtGz5DJTyU+k5bgCoDE2qL1ZI8dRq/6f5bStDDgJiQ5JIlOwW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANI4H7xjDYns6faee4IczlBjtyWhsw3fyCU/J/tmVsI=;
 b=P2kVdn/ijgCDNhQhSYoC40E2OksTBNco5Pzqu2jZanIfHjYfxshY7PQkSa3RdwwF6ZRPa/8E+nnBo5xcYCjbz5+eAFaSOr5g/icbCPdUbkQ6HuPlZ4KReDal4mIDfAiAH/RKCrFd3/76HDvbfXGg+wJtKUSb39KtHsGmJA8SIFuoNUYU68LhEcqKif8JrtJEzH6kgo6CDpfFqHxzw6AGEfu3Shjv6Asf1c5rRNdQDS50CRtTeNlnuhzfEYz7STDwUN5uSv14zwhaZKKbkQMe3xgH+oBTX6ZWgZMjOL7UbDWKL31id/8FRMwjb0wcMOv3ZtOsk35mTi/S4gn9oNlWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANI4H7xjDYns6faee4IczlBjtyWhsw3fyCU/J/tmVsI=;
 b=tVfHnN6dulKAoBTQaZ1A1ICxZMlja0d2fY1xl3BK254xZqCvUmOragCChntnnR0MXcuTLlcTKNvOPokr7X5rQHiGo7cnMg5QZnzEH4RvV+AyTQucAKYosla7vCSsk0sOYvwt0Uj2wLHx3bWKd9AsZAzXgopK7ZAsEUB3IDt9tEE=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3367.namprd12.prod.outlook.com (2603:10b6:a03:d7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Fri, 17 Apr
 2020 23:57:19 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 23:57:19 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v5 13/14] build-many-glibcs.py: Enable ARC builds
Thread-Topic: [PATCH v5 13/14] build-many-glibcs.py: Enable ARC builds
Thread-Index: AQHWDhqNkZhc3NbWSEClJz3pQZWCGah9/xGAgAAMlAA=
Date: Fri, 17 Apr 2020 23:57:19 +0000
Message-ID: <33ee556c-a1e4-89be-46a8-a3fb45ffc22d@synopsys.com>
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-14-vgupta@synopsys.com>
 <alpine.DEB.2.21.2004172311280.1082@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2004172311280.1082@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: 658ee710-893c-48bb-93d8-08d7e32b1053
x-ms-traffictypediagnostic: BYAPR12MB3367:
x-microsoft-antispam-prvs: <BYAPR12MB33678E5078B99F67BF3F8F58B6D90@BYAPR12MB3367.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(136003)(366004)(376002)(396003)(39860400002)(36756003)(6486002)(316002)(5660300002)(71200400001)(186003)(6512007)(4744005)(31686004)(478600001)(54906003)(4326008)(86362001)(6916009)(76116006)(64756008)(53546011)(66446008)(6506007)(81156014)(8676002)(66946007)(66476007)(8936002)(2616005)(66556008)(31696002)(2906002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AqyjgKFmRJTnoi7YkH/2PlnKrYHMJMe2bx2ILWIQ4gvUHQgmSeszg5s2RK1r4KfRN8cW7/u+NrLAmipOpc6y+rqEtxFVp28It3vVxccBBbFIvlID6fyRf96XA90cx4bbDnmxbSHzob5o6YehkwYASWMJ5oxDDufGiBvPBH048FIT7C+AmOxHsHIWP78FZfaoiIeroqXmaKaWzbe9GdSh6DSE9IX3VjJSHnYNodA8Z5i+VD118CxdPZ6iZVFza4e4gHW4PpEdmXjnLZATjbkibBD2YMECwMvADN23PNgsoU4VJ8/yKJ7S5vA4GxmHSC9QR+6M8DQT0Gh5DHx1m2LUnlEva9jqHhpwZwPG0g24JtftQw6UQDlNjxH5elLsqs/iFl/oYsUCvcldo9rb/Y5Z9tM62ezVlvTmchRabRqtg/hGflH2NbNamQs4sD319+mj
x-ms-exchange-antispam-messagedata: FMrefokyTdhzNTTbJgQGArG3PKezeeoktU6XMilD/rR8e0+bnREWHm7KEWt8oYgtNaFyfdHFl+p13ET5BfD/0+NN6RsMJJENey2y0OrlknEt3w8V5JkyniqRAw4n96WF8Ow8J8GvGmtcrEsX549twDlFuHz+e1ApwxMZZZHrEbKKNas6/P2aLF+6DkRevWnrxnw5JgUH+wQfhdqrm8m79Q==
x-ms-exchange-transport-forked: True
Content-ID: <23117774EBC57E4A9543DE94AB70B00D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 658ee710-893c-48bb-93d8-08d7e32b1053
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 23:57:19.1677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LRgmlE2RV32ryannaMpa9c/YgjRxsZTj6SdVKxk4yuajrycXFBILQFSlNj3ZD+83UOf4otR+85zeYo9CV4KT0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3367
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_165809_304117_EC7AC7EC 
X-CRM114-Status: GOOD (  13.60  )
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

On 4/17/20 4:12 PM, Joseph Myers wrote:
> On Wed, 8 Apr 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> diff --git a/scripts/build-many-glibcs.py b/scripts/build-many-glibcs.py
>> index 64a836c52ea9..77b686d34cea 100755
>> --- a/scripts/build-many-glibcs.py
>> +++ b/scripts/build-many-glibcs.py
>> @@ -1248,6 +1248,7 @@ def install_linux_headers(policy, cmdlist):
>>      """Install Linux kernel headers."""
>>      arch_map = {'aarch64': 'arm64',
>>                  'alpha': 'alpha',
>> +                'arc': 'arc',
>>                  'arm': 'arm',
>>                  'csky': 'csky',
>>                  'hppa': 'parisc',
> 
> The description of this patch seems a bit confused (the actual enabling of 
> the ARC builds is in a previous patch, this one is just adding some 
> configuration required to do so).  Anyway, this patch is OK with a better 
> description.

Sorry that was a snafu in moving code around, so some bits from this moved into
build patch. Fixed now.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
