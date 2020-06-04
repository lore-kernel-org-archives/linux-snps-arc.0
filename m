Return-Path: <SRS0=KRsc=7R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E96BC433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 19:08:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53FAA206A2
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 19:08:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I8NkjqsH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="atMhUOYe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hWqG4laz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53FAA206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnc+JyXDVD8N97M/JHFpsr/qEZrO6ZyQ6S0Aa2vXadw=; b=I8NkjqsHH8cKDN
	hSZIKkY5WkNnXlM+BMmWtK8eIZOdX9CGHKCRGhxSAE7nmuwNTIBZDPO9rS3p3C26g+L08igIQVwl/
	kcD+64mZ58P7btOEbz3DxelIXRDhNNbqS/29wl4XxLZ1Ose0LTkwWMVSUxmUSAwd5w01HBQQsmTZt
	jX0OIxXCUJwyoQYvn/MKNYrdBm+yrOnDMhadouH3MpeMhboEGwCFpnIl1wMi0OyHM5UPklJxBqJzC
	iZabzn++4B8YyUokgEc2olPe2GYLaq0nHT0ZB1cUAiMCH9Ul2mEAxCynZESbL05NowvmHMfo6MQCx
	XKBshnTeRN4y8wDl6Z4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgvEK-0006WA-1r; Thu, 04 Jun 2020 19:08:44 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgvEH-0006VV-E1
 for linux-snps-arc@lists.infradead.org; Thu, 04 Jun 2020 19:08:42 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 41EBB40084;
 Thu,  4 Jun 2020 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591297720; bh=uKcqbZg8NTaZ5Ntfov3tKXBBC8yb7VAEeoePTUYjWok=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=atMhUOYeo4iZrcbzBuHkKWB8tJ1gTGm9TYZNyHE6V+8RJQd84tgYxicGL3pRTKVNS
 jktxgfH3i2M7wfL58lCoZQlM/biVhnAVtDtkXoBPHxCiBPfku6t59a2P9FU3WDpCDw
 8Asgs7UQ2pOoiT/ee4blGzQW7VsHTqCk0A1fkm4Zt9DOEC2j/y+OLf4JRs6iaMniF1
 Ff0uVfELNMCbLwe+kxIWtC3CIrbWv6+V9lmFBobKS7BOiCt6ypR7XA1i5Fmz/52Mvu
 5mJIaQIfsD39/CkHMDtTKrKQnvwzU6Bq2YjLfrLW9eM+594FeOB+MvluiTxXchTHiq
 VcSAeKFliKOig==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 1655EA0071;
 Thu,  4 Jun 2020 19:08:39 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 4 Jun 2020 12:08:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 4 Jun 2020 12:08:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJ2yUeJPzCW8+FxVGByNpcTcDysZbzUWFMNVTwL+AT+wERq+nwK9mQyElrP7n0+oVPplRznAspZ0xMIT8qv7X9I3ZXvZdV/TCuFxw97y8QTjyEaa9g2SUTt7Rkq3yYN/2omydCAH0bBCUj12EK6pp5kBMXRS13QsPjMmAHiacrgGZCqC2qK36bLTQQLkSp0q2gvNDhfiZL4MhqM55GjPbzo6Hkl48jFeUc+71phMp8yWNUr8Vg4VL3a9PxGNXXHvp3gL1nz+a+XX29BpFZd9x1F3I35kPT2sMusBbVj60PGY9RH/V4Hi2JOZwbTZKDPF5dYSr+vM7UI/SB2jcEBweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKcqbZg8NTaZ5Ntfov3tKXBBC8yb7VAEeoePTUYjWok=;
 b=KNkZtzYTzW6dhvAiQTs1t9YStj0Lx/wG4B14nepBn7sWvzsQlG9wGLorFfEs5BDhsjAOoUzCSVgW/KG8FI1GloFCYHBgzaTUUqnEENGWt+C7sMWB76Sy6aOWnjqjjatEE49J9OBG12v2O+Rf/vHvFdjR/2y1uU3Nt7o2O2E2f9skkFBCvNk6V8uECETktLBW6knwnhKQohOQuPsrmMhb4jLQBL+8z4tQe8PxfBhBa2r81PuiNenByJ+BxL7npqZpRRW7s0V9EezImRoWmzutLjhG6DpxcZoWiay+HjSvy4v0zJWPHaIp0e+lLuFoJJqpkdH5XNAvQzbdM4h7HrBTpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKcqbZg8NTaZ5Ntfov3tKXBBC8yb7VAEeoePTUYjWok=;
 b=hWqG4laz65Iip0eErVflHqOaIPexZTDdVeXajja+QFbS/s4eZbwVZRH904Q89/FdXYI7hQYgT/Z84DW7iW552yvbtpISQl+2VFFhgtZ0BIKJ+opPegxUovXQzvvjk4pnq2CJoR0Rm6y39me5cebJk4Q8qfWsAm99bVYVwRr8tpM=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3255.namprd12.prod.outlook.com (2603:10b6:a03:12e::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Thu, 4 Jun
 2020 19:08:38 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Thu, 4 Jun 2020
 19:08:38 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v2] ieee754/dbl-64: Reduce the scope of temporary storage
 variables
Thread-Topic: [PATCH v2] ieee754/dbl-64: Reduce the scope of temporary storage
 variables
Thread-Index: AQHWOIYggmcgEJtCX0+23+xG83+AoKjFoswAgAAlqgCAAw2XgA==
Date: Thu, 4 Jun 2020 19:08:38 +0000
Message-ID: <115b2236-e994-cdfd-d96e-2e8d354b7fde@synopsys.com>
References: <alpine.DEB.2.21.1911112247180.30786@digraph.polyomino.org.uk>
 <20200602023223.13823-1-vgupta@synopsys.com>
 <alpine.DEB.2.21.2006021814210.3673@digraph.polyomino.org.uk>
 <d38b8dfe-5caa-5884-8843-0a845afbbb67@synopsys.com>
In-Reply-To: <d38b8dfe-5caa-5884-8843-0a845afbbb67@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: codesourcery.com; dkim=none (message not signed)
 header.d=none;codesourcery.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0cd6eaa-2f41-4a36-b251-08d808bab03b
x-ms-traffictypediagnostic: BYAPR12MB3255:
x-microsoft-antispam-prvs: <BYAPR12MB32550773CAC8E1AB08258DECB6890@BYAPR12MB3255.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BTmfXGkRONDsFXLOUbmABud2V5S+hju/u91WoTRFEe5hexZQV8XVLr9wIg7Pxe83+fX47DZHhL/zf/Si8drYJkTWrPkJpcbosWqJQBfN3sXjRF9dLbLBqGiWABb8pJhvm7RMOgn6hvDRYxNID1F0fHDdpHhS9V7hFyMC7dc57e0TjGM+o9RSR/TH5yBK2vrXqW3ln4diHzyHSqTQQKhlhENN+OgtPlPha+YxpdSVPn12TtYwc6Z1RbJSCUJ38u1HuBlfTlVPTYgXe6QzvCb5mhPZmnAOnpyuXLX5guQED31zfk+3Cwa9q+rTCWkLX8hFBDVFILQukhgANFvt073Owt/i+LlZZ/QesVyu3n2JupPl2mOe3jSs06rCSEvL3QNr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(396003)(366004)(39860400002)(346002)(376002)(4326008)(71200400001)(36756003)(31696002)(86362001)(2616005)(478600001)(76116006)(5660300002)(66446008)(64756008)(66946007)(31686004)(2906002)(66556008)(8936002)(66476007)(8676002)(6916009)(186003)(54906003)(316002)(6486002)(53546011)(6512007)(6506007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: IGYMRV6z6vg/8HsgNq+r7NI5xCDOKjYz0x82oKmJ/HNwT36rSE43zd7mmogW5UVRPeFtDnnKSI0R7Op+zNb9z/mnzuvfZY/3G/rY1f2rQE7D3fHdtgkaguvjV7Xm+HwhHTCAfpwgUYkxr0m1LhPulEQ8oAp2ENLnokqj+f2D18VIC8GEkmaKgI6yZe8IA163f96hYekYTF41lvt9M74vJa2NFYrHSee7jFxYhd06rye8lhZmb0A1LT3PHs3iB+2DgGdJnqyqKuDgH0l2A+xQc1BU6TDCu+je3HRM6sQrcxaNxqI2e035IZZmMyduYffvJK7Hn2J0prKOmEof6lmNRdVHvlN7/VrcvA7vFCSVYzH3FJvdCrZ9IiQlEgMo1eUS8/uVOT+PGCL1/kPlLDQpqZ+fez7IVqGdhVWOBiqxy5nl6iRT5ltfLI03XBDtE7Kf88UHoa7xP1nTh2h+msxsZWXttnEiloIgkXjTI3IezA56sOn/wpFDR1KSFq8qVK/GzVN9IFLbBPUEc5jPL0+uekzI2c9TISni/9q3Ld6s4glpaQwlgmRFXY13BIM+DEQ3
x-ms-exchange-transport-forked: True
Content-ID: <2CEFAF9CA0C48E40B755EF8CC36308F6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a0cd6eaa-2f41-4a36-b251-08d808bab03b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 19:08:38.4657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FurLIbJkUAYM4spuMHR/ln709e9HJd3sxH+Py8eyAQT/4Vv++laxR5DKe1QUHGlySjSankeIiGnoci1Dwhp0GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3255
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_120841_485131_046AA036 
X-CRM114-Status: GOOD (  11.89  )
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

On 6/2/20 1:31 PM, Vineet Gupta via Libc-alpha wrote:
> On 6/2/20 11:16 AM, Joseph Myers wrote:
>> On Mon, 1 Jun 2020, Vineet Gupta via Libc-alpha wrote:
>>
>>> Also as suggested by Joseph [1] used --strip and compared the libs with
>>> and w/o patch and their sizes are exactly same (with gcc 9).
>>
>> My suggestion was to compare the *contents* of the libraries, not just 
>> their sizes.  Either they should be byte-for-byte identical, or if there 
>> are other differences (register allocation, line numbers in assertions, 
>> etc.) a more detailed investigation will be needed.
>>
> 
> Here's my diff of the 2 --strip builds
> 
> for i in `find . -name libm-2.31.9000.so`; do echo $i; diff $i
> /SCRATCH/vgupta/gnu2/install/glibcs/$i ; echo $?; done
> 
> ./aarch64-linux-gnu/lib64/libm-2.31.9000.so
> 0
> ./arm-linux-gnueabi/lib/libm-2.31.9000.so
> 0
> ./x86_64-linux-gnu/lib64/libm-2.31.9000.so
> 0
> ./arm-linux-gnueabihf/lib/libm-2.31.9000.so
> 0
> ./riscv64-linux-gnu-rv64imac-lp64/lib64/lp64/libm-2.31.9000.so
> 0
> ./riscv64-linux-gnu-rv64imafdc-lp64/lib64/lp64/libm-2.31.9000.so
> 0
> ./powerpc-linux-gnu/lib/libm-2.31.9000.so
> 0
> ./microblaze-linux-gnu/lib/libm-2.31.9000.so
> 0
> ./nios2-linux-gnu/lib/libm-2.31.9000.so
> 0
> ./hppa-linux-gnu/lib/libm-2.31.9000.so
> 0
> ./s390x-linux-gnu/lib64/libm-2.31.9000.so
> 0

Is this sufficient for comparison ?

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
