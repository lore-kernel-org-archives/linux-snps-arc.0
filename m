Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B57AC433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 19:15:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C831206E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 19:15:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I7pei/tw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JFl/veJo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hnw46gnW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C831206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYQv7ffD0LYaNWvIzY156+AhN/mhIxqqdeeRWeViJMM=; b=I7pei/twiZ5iEU
	H343SCTUTVlDQNAExqSBtYXemtkp5MbCsGVs2FFRRxheukIczDbErfSahltbgRapx6G2pQo/JWWYa
	PA6U4YoR0v7H/BYVWnLZCX2lzmq2bou3FBLKC+ooz9VeC9yAbG2N23p/tq2fdEWYRVZtQnBXV4dt9
	NxvpSjkYB06ADly5Mnk18uxtgT2IvtWCMZrLCiRHy8ylkLjp0STpW7GNmvBUgVwqBh9SX/cdDRis6
	G18qkMaR5BkSRWz/SaXn2MuM/jebpKwD8be8q+RFx1Af06CxppkM2tb3F6lF2XvN7F0Shx9jlLJPB
	k2dWj4LWm4HK0uwEJZww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgCNH-0002gB-I9; Tue, 02 Jun 2020 19:14:59 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgCNE-0002fb-IG
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 19:14:58 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 54A72C03D6;
 Tue,  2 Jun 2020 19:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591125294; bh=NFgMtTK6CBIJPVXHiiadsp7lF/59KxZSTubU/evvEYo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=JFl/veJoKlZ/jCIsq0xTCT2OsEYpRLM1gPfK6M3he3pMmIEWkJVEmb/3y762ld+rP
 5sscrYqktqy6PC/O7oBdGr2uNq1PbtRGJOrE+lmBLbQwFdS+zW2MVzwH+tDb3QUvv0
 YvpDEF2meYNrg00fdBZ7BQw8iwzIUlTj7fdA48h8p1e7hyv8Ib0fWSKxDycrWoBREB
 4H3NZOEANKNZR7OcVtgWWHbP0x3GAtH3jgSImSeuQgvRlDgIreVpkudY2I1B8iyKyD
 yyp+rRLB4iuusxdFVHkjR5F97vsYO6oLwa6Z2v4qjhMVCHGOfE3tNfp0llnraGareJ
 crRW9eoCVuRzw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 09B80A0071;
 Tue,  2 Jun 2020 19:14:51 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 2 Jun 2020 12:14:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Tue, 2 Jun 2020 12:14:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P21r6IMjIlXq2VEb/QHqxRMEb5mJAE6mX39xAGfkA3coJzdOiBPE5G7DV5WwLe5cUzLX4hdku3hSIbKRVD6JkdBWjYGQtQH1O6PmJGUSxCpKihsz0g05X0xVBKEH73Jb9NF97B1D0tCxBo0JJ/L9wCqEwhk1y7bVcjJvcs0fPpmxzEEBaP7ffTM3U8XcvA1YAUeYcx9gdLfKLAJDuarGbR4ous9s92Gdb7dDj1B/1VHKfu2QgaPMCCtRXTyYm6Bm97fXTNMEEiodwG1sJfieGFm36H162DC5GXMQXxiucTAZIw/K+rKqfPaLPqTszS3bYJQjCEeVss8r2ZNdUT53RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFgMtTK6CBIJPVXHiiadsp7lF/59KxZSTubU/evvEYo=;
 b=c12RezkVSkSM3Fe4/qwzWs35NxYcV1dDA+KdhmSuKgxhIqht+TQHWCelyWAoJ/K01uB30feXNekA9yjMJFLg3RWC+/l5ts3FAilgznDLF4VHY/DF6mMFKwGZyVFjtLCCt8c1CcjoiTWa2ZIiymT4vYaUq8ZWPl/bquoMUI9izlem+FjsqplQhrE7+yRb0mmEptEG2aBjXfaZoidW3N1AiADSfh2XMvUZqse/TeVXgAdFNOrdFjNQNoRAh2JC9IWAoFGoWZ7JtC8eHkP5vTRGgPUf642cpnH+PKOJKw0/HXk/9p9WeAX31aBk6iLvsbx44TYu3u7dqhEZEam72w+W2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFgMtTK6CBIJPVXHiiadsp7lF/59KxZSTubU/evvEYo=;
 b=hnw46gnWVfST6Ca4W2x0Zzt9zVaxFz2hXIq7wvwM8VzoO872tKpnN8DrKmJAjSv37pBP5XvZxXy6ctlFD+W5KGPnVao+YmM107bN0RnqKQ4KLu2J2x2T5Vw6cSd8A5cp05WGg/GgLWbqKKDFofCEXtivvurU10zalh6vDhZWpuk=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3526.namprd12.prod.outlook.com (2603:10b6:a03:13d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Tue, 2 Jun
 2020 19:14:49 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 19:14:49 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v2 3/4] aarch/fpu: use generic builtins based math
 functions
Thread-Topic: [PATCH v2 3/4] aarch/fpu: use generic builtins based math
 functions
Thread-Index: AQHWOHXZiBHsTFfYP0CKuA5ZsZMG26jFlmeAgAAc1QA=
Date: Tue, 2 Jun 2020 19:14:49 +0000
Message-ID: <0f807abe-654b-ffbb-c494-aa47656324bc@synopsys.com>
References: <20200602003541.21005-1-vgupta@synopsys.com>
 <20200602003541.21005-4-vgupta@synopsys.com>
 <b885b731-dbae-ebbc-6561-71267138bbdf@linaro.org>
In-Reply-To: <b885b731-dbae-ebbc-6561-71267138bbdf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9479d109-6a22-4750-44b5-08d807293888
x-ms-traffictypediagnostic: BYAPR12MB3526:
x-microsoft-antispam-prvs: <BYAPR12MB3526EC16F49BEA21BD9B8CC4B68B0@BYAPR12MB3526.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0422860ED4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aA3cis3RF17d0A/+P2Xl3gkloOJoBOo64ztsDo816vGBoCCjIxL3/x0sDidp2T7z3YmN1B7f8oH4XuuxkwN6aXNcAHZfVFD3iCcEqkIE5snL+n3fMyOZOJwAqBTIGEB3oGQHpOZrrQ/E+nyT1lLljMYn3xSisA9k+D4zPJReLbrWnyIGerqrbBxdStZrMqTCqvpDHzJ6W4nnkFk2pgFVq0/PlKNaIy/34ldkSvSMPCfEF36bn1j4/yJ/LLZcNR9dtoT/J2i06xJz+ELipFqp2WUQYzlaCG/FTUExHlhvY+BBEHRx2LWCxeUuJge+GpWUahd38RjAeyBg6MQK9KjUi5G48n/y4YBisOSUNUA02EljkY/1pFB11aBXw7+YxCeFDXGiVKhkP3A/aHbzt0/KjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(36756003)(4744005)(86362001)(8936002)(110136005)(5660300002)(66946007)(66556008)(6512007)(186003)(64756008)(66476007)(66446008)(498600001)(2906002)(76116006)(71200400001)(6486002)(31686004)(31696002)(53546011)(6506007)(26005)(2616005)(4326008)(8676002)(41533002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: FiWumC5CivwTlCGM39ws6DJlFK6XuNtl0d1YFA8+Dmj7BDWvj6gxiCEB1NcDJVpITnCjjRJNDpqW5Bl70kb0TzhG9LR82K1sun1LdLDPY8PCyHxfpEpbuY9WpvZ0sByUhUmCpcU7D/5O4GVIiWN6zADpKKWmN1HvlCeIDbqMAG/xk4IXD/43WdGWLgBYSUuvVzh5aPe7A4dp+tSvl957ICZF+oVoc08SdE1o5OwMbe9LLlFyUX6wO+ceVNEvkHNw+uOrEHhmGSkt92HLSllYVNbvjRFZcv+LEVQN8PBd1t1gj2IRqliyP5jgiO9HZ5CvaosOgnTFADFc/QYUSMKuLJ35PcKe//UpbO0sK1OLLkrX1D81XrGGkvkFSK8zsRCCrYb3lpGTtm7A7+NCcyjHjk1cKK5UjNRkfQc72szfVVt3RKCIXJv0v7Opmn1CiInmYrkb8OJC58d1zAnqiMBPDf/J25HFwBAI8Hmy2Y6vsW8=
x-ms-exchange-transport-forked: True
Content-ID: <34709D050DBEE240A1F2F8FC3763A055@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9479d109-6a22-4750-44b5-08d807293888
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2020 19:14:49.4374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vShz1dtSovXTxIJ2l4y6sz7JBPFjS2r3MztGnsibiq2Ot9wKLEyv/sbMRiidYhs8aRL3poeJ33/n94ffzOrJkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3526
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_121456_744076_1F349DE9 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/2/20 10:31 AM, Adhemerval Zanella via Libc-alpha wrote:
> 
> 
> On 01/06/2020 21:35, Vineet Gupta wrote:
>> introduce sysdep header math-use-builtins.h to replace aarch64
>> impementations with corresponding generic ones
> 
> s/impementations/implementations and missing ':'.

Fixed.

>>  - newly inroduced generic sqrt{,f}, fma{,f}
>>  - existing floor{,f}, nearbyint{,f}, rint{,f}, round{,f}, trunc{,f}
>>  - Note that generic copysign was already enabled (via generic
>>    math-use-builtins.h) now thru sysdep header
>>
>> This is supposed to be a non functional change
>> Passes build-many for aarch64-linux-gnu
> 
> LGTM (just double check if the objects generated by the removed 
> implementations did not changed).

I will add the diff output to v3.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
