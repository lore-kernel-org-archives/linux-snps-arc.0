Return-Path: <SRS0=BK+7=64=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57B9C433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 14 May 2020 13:10:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6D97206DA
	for <linux-snps-arc@archiver.kernel.org>; Thu, 14 May 2020 13:10:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RXyG16ao";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="j4jZnXQW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qbGdGI2f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6D97206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DGW7bELq58t3/b5wz61BtLip9gdXNs36+RAuCsXqI50=; b=RXyG16aoBcWRpb
	+KZHJ8c9WnKe9eSAM9WKeh+OeM4Tr79W+IHMTPz0HrrD7EWO6lFscGYIUhlbYWTmeMbNG6S1uvqsW
	KGuZB/bi7ZuTlhOVUAsyqlE6EkM6wi2P6AWqSatTHE4b6K3StVtqsJhK+KoWS8Efln93y5zJHQHJ+
	/TvuyTflSjNRkSg0uvMK4Q/XdS9CdfpVtU2G8a/+FRq2NN6EUOL26JHxb+4uuDij9uOBBG9PtmpfZ
	6zMfuQ3YyWNGZbRKKtceQ9BQXUaLaY0Nblovjsq+RNZAzqpz/DEPo0BaJbRHurx0QrNhfs0Gm+ysi
	NzoMFlJJoFR2cKfXHDYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZDcg-0002ZU-CY; Thu, 14 May 2020 13:10:02 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZDce-0002Yg-9Y
 for linux-snps-arc@lists.infradead.org; Thu, 14 May 2020 13:10:01 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7250AC0096;
 Thu, 14 May 2020 13:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1589461797; bh=PqY410pparINKO2Cwe0BlHT+uN+eXq5NOBzg5cEHjUA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=j4jZnXQWBh2PvJ0ak1QDbqShZzgCwwLW0bvfKtc26U9Tqml9/S1ER/9tlcGfcyqc9
 iz1Szr3uf60k8gNh2HxIQBsHCTRgK7yQRHY9j6hkgXOVEReoCRbJzhRgkLoxuP/Z81
 ivHsuTeK5crIl7QfpxZtyTSqYagmJc3jMjkVCfrpURkAdHN70WhfMyxa0bkJaeGiwP
 ZaQ/0CCZo7+3/HNi3kDC2PJLlGnOnVG1AaLQWKJvsAozChXj3EIpCcpCmop3Cl2HLp
 puWcgBUOFZX3C1BRWg7EQKOv2YB5JWpJH67C6gTgWxlKXUafrWqFEsDE/8+UcOvT21
 9NMIceb+Lv0QQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7F113A0071;
 Thu, 14 May 2020 13:09:54 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 14 May 2020 06:09:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 14 May 2020 06:09:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaONgcY9Gf67gWIjPFkxsc1BnUOa5S5ZYIlWPZxhZFu0v/Zj12x4Adx2tSKNJm9805A6qHbeXNxB/VDXkunaCGPBy1wLlXB89TKGBljtguTVhjDZJO1wqpmytkSUVfEff0y4IsTUB2w5Pq1OvYNmBhIewLxVIUL7kAZHtKmitzLPdTdZ5eqAWsuQOIgfP9tOejJBbAwSaDAMTmWj/joR9OcaVh2Bs3yAH9+8Z0sfmuVum+If2M+b62bS3jZPeRB5Ja7l0OuSkX4P/9ETi5iOUa/rHYostCmbz/dVJx9Gt3NcCxgjb5PcJAZLV0n1WUTAIzU8QVfn0QCL1NS9Nktxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUwIrsZFMQxmveJTY9Qdbs2HOo94xevG0fxqbrKQe7c=;
 b=XrxDSKfTIFG6AhlqRRemqiRL1W1iZQpyGLunHOPU1x28N9rlO0HZgYsj+Tr90TY8QzmXgATqZHdDlxD0KkcQjKStD/Yz60RSKI4qYOqbwGrgj1ffcnYd75+aq+A02HReB20hK9e+SwE8izcR9yBf1TF/Mqi4o49+pZ4e+pJezXkKajGfCD5XuHJhLTb1MVZi6UfWBnMCk15TI2lj2h72aGMGSoHua893pg8RN3Hg4EVdu9T5y6DWJw1ezmsASAi4S+JX4nFBM4UHcKK6UKSNIH4hgQtj/9fGmxCnlOcoGU/S1/UHpmJtmIrSrL3F3dGJff4YV/S8V2I04WirelxeMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUwIrsZFMQxmveJTY9Qdbs2HOo94xevG0fxqbrKQe7c=;
 b=qbGdGI2fLUIGKly8Qk+JfDbyfeF3MoDaaMvxilqUQAqplqnPs2SsIsJkkyJDJUVuGRj0AicjVm4tFAoYx+oiYUnx7ZXaNuvx2sxY8lnqUNfUu/81RGd2H7Eh5/Ju45oY3jgWgD2kV06f2bNk/pk6AVpO9UxBJCDFG67Lm0FDrGw=
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 (2603:10b6:910:1a::19) by CY4PR1201MB0053.namprd12.prod.outlook.com
 (2603:10b6:910:23::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Thu, 14 May
 2020 13:09:51 +0000
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::8d22:7d25:8892:a09]) by CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::8d22:7d25:8892:a09%8]) with mapi id 15.20.3000.022; Thu, 14 May 2020
 13:09:51 +0000
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Claudiu Zissulescu Ianculescu <claziss@gmail.com>
Subject: Re: [RFC] ARC: initial ftrace support
Thread-Topic: [RFC] ARC: initial ftrace support
Thread-Index: AQHWBFAKr4qHDPVDOEWWdR2Z3ElRlKhcrJAAgAhjooCAAHODgIAAZgeAgEHt42Y=
Date: Thu, 14 May 2020 13:09:51 +0000
Message-ID: <CY4PR1201MB01364BE5CD799059DF7B2257DEBC0@CY4PR1201MB0136.namprd12.prod.outlook.com>
References: <20200327155355.18668-1-Eugeniy.Paltsev@synopsys.com>
 <20200327131020.79e68313@gandalf.local.home>
 <fe7ae84c-745a-04b4-dcc0-5df8cc35ee0c@synopsys.com>
 <CAL0iMy3i5+_owqJcUKWzGNFakVV2P=oFdyAWCY2LP7YTusKP_Q@mail.gmail.com>,
 <CY4PR1201MB01207268EA87209A55C31D44A1C60@CY4PR1201MB0120.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR1201MB01207268EA87209A55C31D44A1C60@CY4PR1201MB0120.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [5.18.247.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fabca5f6-1469-48cd-876f-08d7f808167a
x-ms-traffictypediagnostic: CY4PR1201MB0053:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB005324386D1937F299257AB2DEBC0@CY4PR1201MB0053.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 040359335D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8ssKPxeiKZfZHXuOlxjpPfJr92bvu3W++LppK7HH6P/lj5Xuh78e+gX9BO2gREO8Dz/3UoKmNwQO1ACSLPTSC7XtbuwiViokHe5sXzaxl30fwiSMMP6ViH/XZwZAQMmJkJ4I/yyKrr429fpfOYm4btKgsEZix6PtyvqZ/kckmK6TvUn07y+4h4ln1qXegU2t6mEz+TS5aT67QCsNR7AoRhoMIt7BOfSvjc68QeTHRGoBW/CX80/e523RsjiMXc5QYvmQtSPRBCtrnEQ2UOdTQGcIHRd/oYCVCwaSLOIPHqDQboQKjG8P+UoDwSwUF8VPTIa9xOl38gbVE06TaiPMUGbDdMEkMN6HYNnusVD8di7aGhuXmH3XTcyALaXIKrlDZY7UIUcIO+hmrqA39tXyxqJ0554aSisjKuOhUcGTXyu15ZXbVLFfGY/4ZmwW6YRH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(376002)(346002)(366004)(396003)(136003)(86362001)(9686003)(55016002)(107886003)(71200400001)(33656002)(2906002)(4326008)(316002)(53546011)(478600001)(8936002)(5660300002)(8676002)(6506007)(66446008)(66476007)(52536014)(7696005)(66556008)(76116006)(91956017)(66946007)(54906003)(26005)(186003)(6916009)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: oY/aF912f9T8YMYzMteo6WUKRFUxleLFj+01ohpNUrPk5ZCyhYwyNREE3UJbpoi78u4kgQhCH8iNaExgSkfdrEnniJJfmn9Yh7UB5V9OSdHg/p16UIVQuEUZPtIoXKswwIloGujFr0WaqS51adnT1XAyZUj8hos+rNnAaxIG75jquvE4v6x1xrGMYB0QVbR3vGAr0Lq3L9KN/vOn640zRQLi65RF1jXDH9+0APY9006Dvhb3l5rMtMzh0AA0sC2Fdw84wesk6IilaF3sST+eJyDzDD4M2D+dOXDI+2U/veF7YbrjrMkCws6kizGNw3U/5aTQKzOSogcmDcVS6KrBBq8o+EUqOd2gYJUULTgGYS8MN7DDEB5QsbgDZGWISZ9mBG8+4bwPK6ywO+StsW8ymi+oCnaiyYnRtXNocswcik6kM0eV0RrUNOL03c0ow7mJfKcXKmWLcon4b1ZS4jl8J/F3aFJQGgBGo1GkI7CVrWk=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fabca5f6-1469-48cd-876f-08d7f808167a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2020 13:09:51.5820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3BVY9xR7MHrbASwkTfQTIXWoq2XuHggrE9draW8S0dWCC2E/vtGHzNB2KIx32MiB8ISn2bSsrV7L/KabPDz/LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0053
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_061000_468675_1D9A6AF6 
X-CRM114-Status: UNSURE (   9.35  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Claudiu,
ping!

Is is possible to switch between mcount modes (Linux-style <-> baremetal-style) via command-line options for ARC GCC?

>From: Alexey Brodkin <abrodkin@synopsys.com>
>Sent: Thursday, April 2, 2020 17:15
>To: Claudiu Zissulescu Ianculescu
>Cc: linux-kernel@vger.kernel.org; Steven Rostedt; Ingo Molnar; linux-snps-arc@lists.infradead.org; Eugeniy Paltsev; Vineet Gupta
>Subject: RE: [RFC] ARC: initial ftrace support
>
> Hi Claus,
>
>> -----Original Message-----
>> From: linux-snps-arc <linux-snps-arc-bounces@lists.infradead.org> On Behalf Of Claudiu Zissulescu
>> Ianculescu
>> Sent: Thursday, April 2, 2020 11:10 AM
>> To: Vineet Gupta <vgupta@synopsys.com>
>> Cc: Alexey Brodkin <abrodkin@synopsys.com>; linux-kernel@vger.kernel.org; Steven Rostedt
>> <rostedt@goodmis.org>; Ingo Molnar <mingo@redhat.com>; linux-snps-arc@lists.infradead.org; Eugeniy
>> Paltsev <paltsev@synopsys.com>
>> Subject: Re: [RFC] ARC: initial ftrace support
>>
>> Hi,
>>
>> ARC-gcc has two modes to call the mcount routines. When using elf32
>> configuration, the toolchain is set to use newlib mcount. When
>> configured for linux, gcc toolchain is using a library call to _mcall
>> (single underscore)  having blink as input argument.
>> So, using the proper linux toolchain, your patch should work.
>
>
> Is there a chance to switch to Linux-style mcount in Elf32 toolchain with a command-line
> option?
>
> Otherwise I guess we'll need to implement some warning which explicitly says why Elf32
> toolchain is not usable for building the Linux kernel... at least in case with ftrace enabled.
>
>-Alexey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
