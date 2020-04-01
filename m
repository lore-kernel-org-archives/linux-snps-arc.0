Return-Path: <SRS0=CVFw=5R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398F0C43331
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Apr 2020 00:53:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E80A5208E4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Apr 2020 00:53:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hfsn3dQw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ds7YwcP6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ODclt6bQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E80A5208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AMDnQgBchIzjT7Reji8qpGjEPzM7HAt0VdREelAF1s=; b=hfsn3dQwKtREsM
	UrD6qVx07sudaeMmQW4wXcZCvdyzKG27QRsq+iU85Z9B+rYpBPaWDTxtrz0YNyxAU7SB/p/epnN7z
	+xcEdF7otFE5/8b8VMqpUyzW1GlDK2/BH/a5aDnKUDTLew2o915GUWo1Of2u8f/uck3e/OFqSMcEc
	K6yr38deMH4s+PaVQeS1+qa/O3UYshrWTjy1lsaaO20236JlEhgwPnMB8MRyunAascEjRdyiF57d5
	sFu6dQ/rLFcTDq1Q1XO0yXHHNZFFGIA/RujjC8YUx0RmdYZHFvDFOhEsHyi+9W0IT5dqb09zonkC3
	F+5ZPrFKcdyjvgsNyJbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJRcv-0001WK-Lo; Wed, 01 Apr 2020 00:53:05 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJRcs-0001Vp-QC
 for linux-snps-arc@lists.infradead.org; Wed, 01 Apr 2020 00:53:04 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D58E6C0FE6;
 Wed,  1 Apr 2020 00:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585702381; bh=qJiESRP/tMlyaHvtesJpnGm2GpW/7eEBMNztfivy890=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Ds7YwcP6iNm3dgCcHjVZ4nwIUCYcOqEw5QMC0/bl+xSTvSRKUIixMhw5f+JY42Oxe
 GhrmftlgTiAH0aTIwlkkxTO1gS0BPfGjcsQw360Xb7liJwkIMUNs8LVyZo7ZqG0e0d
 VsjxBOGL9/jqAjj4qN4ntUFPRid8wbHhuQgehiJqHJY2r6inYniwKdDGqvhE9JHMBe
 loTf+V1nvtO8h8LfW27cscK4HM5SX8irgxgV0BWhHxYd0zR2AfMpJNQIAJiZ/8Nud7
 dp3g6Y7LBeD4jgBsgw10dap7eTg4k0Sqh3LwkIwp0kAue/t+VP3g9RXognKYyTSbUu
 uEGhF2HblGwWg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2C4D5A01CD;
 Wed,  1 Apr 2020 00:53:01 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 31 Mar 2020 17:52:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 31 Mar 2020 17:52:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4k3T85/Ryc+J1duEVXqmP0WlV27deLkc93syVMvMcqeFrqO+qtYI3Zy5Skxgs6N8K6pgT1VGKQH8LNvK6dnk8CjzHncmBrwSsoe9gpt2Zqy7shH4T3cDUvY6VoWXIHEO95sePIffYM8oLMez2jQEPeHWy+Em+ZU81hh8bomBKCt8B2Cbh61htIM++c2ZWgJZ9DwqnCsno03wPbj9mtlg6aZL0WJXnU1zpAex4Dy9+xy53AhchnQVbxzblFmz8PVWrkIbvtztPlsp56OWRbV8a/J0tLH/q2UJ2P+zqIk1/MomKBV3BR2yaCutNCx88rX9W6J4+HyXOwURLziDopasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJiESRP/tMlyaHvtesJpnGm2GpW/7eEBMNztfivy890=;
 b=lGqbjQ9xF3jNCMym+5KAqkdO72+YwUUV6y5NYG5w2PPJuYBEKzFtrayjRR0fUFXz92pJNs43utjHlWOSCSFpU/ChoMCjNVn0PJvqC6yhTIgvOubr3eW0pcdMWiVJqogk6xIOqu5u5/QhIVZGGs1B8gu8SSW1wFRONL5jliLhiNLqMuxSSYxtw/jd1B0zQOcPhYvesidMP+gkraO+zN+3yujDu/X2P26C/Pmm3phkDVuWmFaCSRgLkCclwVFG26FPF41ZdM84+z1DWQgw171Hc4NOb1w9hVVsb0b//TDMx0jpI/8Pqq1RWySRHI6zw+jRcjAj68DssyQx+aECSyahQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJiESRP/tMlyaHvtesJpnGm2GpW/7eEBMNztfivy890=;
 b=ODclt6bQ0A0AbKKOj2rFAd3fna9By2CpmEc2aMCRioa6h42zdm1W3RfIJi/4jc/uUx4a/ZlhfWDmvG0HQuIhoWN2rYMYLOM8wP+L9ubHBMaXoAKTmgiWmK6AOcVVnWgV8cJ0dfawPeqoK9uqczixyjvODJLSBpMFBXPP2bMJpJg=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.23; Wed, 1 Apr 2020 00:52:26 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 00:52:26 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Claudiu Zissulescu Ianculescu <claziss@gmail.com>
Subject: Re: [PATCH] [ARC] Allow more ABIs in GLIBC_DYNAMIC_LINKER
Thread-Topic: [PATCH] [ARC] Allow more ABIs in GLIBC_DYNAMIC_LINKER
Thread-Index: AQHWBV3Xyr4b4o2+F0mAj752BCtP1ahifWKAgABqKoCAABl5gIAAc92A
Date: Wed, 1 Apr 2020 00:52:26 +0000
Message-ID: <b7351d97-59b5-0fcc-5204-8dccd53c2d42@synopsys.com>
References: <20200329000503.27897-1-vgupta@synopsys.com>
 <CAL0iMy0f0tt6UtBRyT1hn=FsvF5tBYVKmcxHq57rDbc9YEtO0A@mail.gmail.com>
 <CY4PR1201MB012004563CBA85075C153D99A1C80@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <73641424-e286-c4af-de31-4fd0c751804e@synopsys.com>
In-Reply-To: <73641424-e286-c4af-de31-4fd0c751804e@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [24.7.46.224]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d62e5a0-dbf1-43d9-7210-08d7d5d6f28f
x-ms-traffictypediagnostic: BYAPR12MB3560:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3560EB99637ED1F37AD23AF2B6C90@BYAPR12MB3560.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:230;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(39860400002)(376002)(366004)(346002)(136003)(66556008)(316002)(71200400001)(26005)(5660300002)(36756003)(8676002)(107886003)(81156014)(81166006)(186003)(53546011)(54906003)(4326008)(31696002)(6486002)(66476007)(66946007)(66446008)(76116006)(86362001)(6512007)(2906002)(31686004)(478600001)(8936002)(966005)(110136005)(64756008)(2616005)(6506007);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rl06QZfkaODXyhc8HT8dcOHCAjT/sBKKGVDE4s1Sm7grPjT3y2Lq7o2OXOT8hJWnyfsb/sj1RQJLBjdhLIAMiwzwxIXz3xSihXv3P3E3ImZcDnyoc72KLla2pYQsF5rBuq8Xo6UIyIfO9CfKBxtJ+qPhYKcoDNmWyPMj+6YpQJJV/FhNjS7L5N0OadyF/+c5ZAZ9E+Jn2cd82g6wy18alQ8uI5fbjT0DsDN6PG5Ae/+nWTTzp8i6sFOb7VHPdXruYEJJszZqzufS4z2g8ecrBj+AKs+zgtUp6r9ny6D4r/7B1Bk2FKiMGpHabfSXAz1WOpzY5Co6x+BhABGe0o9s9gAfhZE9Nhg+HUNM8xLuOHZbXc/WdJAoiyaIuIqpB9rIqNjLjj2Q0ZEIHE35FxnerZ4NN0aCDZrkSNn+tn0ByGZIRnDImNd7HFgBVUF9BOChohi+noeAO9doM10N8Cg9j4SjyP267C75/u3j21EftAP861GGZgTNjjEQh/PsFPoeEvSQr6XorSw6OgcWQEBEkA==
x-ms-exchange-antispam-messagedata: I63f5A5YU+1FOkoRJQHstwHGWxtSLF7UJXUralEBuVwt6IMtutqQektEC201kT2X6Yt3s3xQD00QKimrvqJ1MgZ91UuAk0j+zYVpXOKB+S4moXgMCKjg2AHPnnYhDfqmn824iGlXHbvliea9vSWObQ==
Content-ID: <5C8554B929218F439EA4C9EA9F386ED4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d62e5a0-dbf1-43d9-7210-08d7d5d6f28f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 00:52:26.4589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7l2NCgU6fkc0ssAWTMK2xyZkKvS1Cikja3zlNySib95JLAamhF0CqpXcljzaRH6auZ6LAKCWj9wz1pLowiDk1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3560
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_175302_919884_5E2944E8 
X-CRM114-Status: GOOD (  10.99  )
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
 "gcc-patches@gcc.gnu.org" <gcc-patches@gcc.gnu.org>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

FWIW this change needs a pairing glibc change so must NOT be included for upcoming
2020.x release which still has old version of glibc !

-Vineet


On 3/31/20 10:57 AM, Vineet Gupta wrote:
> Well its a hard requirement considering glibc is still using gcc-9 !
>
> Thx,
> -Vineet
>
> On 3/31/20 9:26 AM, Alexey Brodkin wrote:
>> Hi Claus,
>>
>>> -----Original Message-----
>>> From: linux-snps-arc <linux-snps-arc-bounces@lists.infradead.org> On Behalf Of Claudiu Zissulescu
>>> Ianculescu
>>> Sent: Tuesday, March 31, 2020 1:07 PM
>>> To: Vineet Gupta <vgupta@synopsys.com>
>>> Cc: linux-snps-arc@lists.infradead.org; gcc-patches@gcc.gnu.org; Claudiu Zissulescu
>>> <claziss@synopsys.com>
>>> Subject: Re: [PATCH] [ARC] Allow more ABIs in GLIBC_DYNAMIC_LINKER
>>>
>>> Pushed.
>> Is this one eligible for being back-ported to older GCCs?
>> At least GCC 9.x would be really good.
>>
>> -Alexey
>>  
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_mailman_listinfo_linux-2Dsnps-2Darc&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=c14YS-cH-kdhTOW89KozFhBtBJgs1zXscZojEZQ0THs&m=xnl4FBxLN70UDZIvD2NTxyfPAenrfQsdij0DBuPImCI&s=YnG2GxYtFIbUU0FesR19TV7fz0ILe8xncKLnRiqBhOc&e= 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
