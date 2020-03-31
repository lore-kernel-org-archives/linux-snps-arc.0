Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9607DC43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 01:44:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69A582072A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 01:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uAeNt8e3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="esWvfnK1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wavDflmJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69A582072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRnuQwwq64QyFAtedMgqAR1d+/jTDhhSpC1sHXFigtU=; b=uAeNt8e3UEEqM0
	FQpUhZDTueEif8OPV5s34CTenlumjiro9bO8SWM1dL1HxXSTF3uXMt1XTtbzBp/BficKaTnkqVg8B
	8/ZBDI0c/OVue7oDxlV+4/xJhktUYmnm/ToNfrmZV7bZicac2KP6m+TVQvec+Zii2D5EinfHL3WhR
	aPpmdWxRbN2Y10hXjIEmHjXjK6FeJv6qN99YlA3h4nymW6ezh+LNc7tsrxlmsfe7gbzk7Yqd0oCJu
	TZZKldMcTnNjenBeHRSZsJWdThAtkxgSGqaympSTBJ6wBfLT8MpsQCsANdhyVpZ2OCseSTCIxto9J
	TAb235cIC4bTSYeb84lQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ5wi-0006NI-Ui; Tue, 31 Mar 2020 01:44:04 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ5wg-0006Ms-Qx
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 01:44:04 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AE369C0FDE;
 Tue, 31 Mar 2020 01:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585619039; bh=+JYwxjmNrGYe+FIxr1oRwnWUOSmki7yaI2j2Ch6XPXU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=esWvfnK15aiaoYccxOYShAFDBFkXq0g92CgGjZAptlUnDhda0SqeUnof0RPvA2r1r
 rKG3vZZEV+j7tQ+C9rEfi9fKGY8+InuVKcNDhGGwdQlBhdkO64apGIVPgGh6Y2F4th
 FXsCHwg/xg8kglIQNGO3Scj0ZumqzHeXAGR93YZMVN1O3mSbVLbYyEykePJzRGrZwc
 uAUN4o34AwergCVT9cwOzfDZh8E/KdeZvc5ATlpEc8OnX+GrYKPNXwlXj0c/KhZ5bH
 r4VHE5isgHOnIMpz2b5Bx2YWjaIX8rGV0kOeMg5UDeKHHhBNI0bgkoQpnV6t83KNFZ
 xdpqTM1q+qmAQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 05FABA00AE;
 Tue, 31 Mar 2020 01:43:57 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 30 Mar 2020 18:43:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 30 Mar 2020 18:43:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZuDVHVepN3yu0tCOo55Xi9Nw9hzJ3NvKeDOZlrKNGAWADwtgm2H9kIfFw+JgR+lS00t5sn5R0GW2K2pPnd1uIFe10s4/8VteYKrHk9XJeFeVtWXYtWncPWmynkGzY8jkBiyFJ0nwl3boWbMxFmJxR34gPJnpd+5ZCIbMFls4bHseE6KdNGMMzjruG2miqLRGQVHzl7ihFP+WbZ8oSqG6rJJwJtx+LuDU1MVMmewN2MEJn7TuNYQb7rEaWbzkLayCjKMTX9cktHQ5THLQRdmZ8WIbgBsFYRmdN3o1z0VHDDRIesUFdA0qpwJBxoeQFG5PL5fehfuD6G5zCFuoZncfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JYwxjmNrGYe+FIxr1oRwnWUOSmki7yaI2j2Ch6XPXU=;
 b=BVOsIh1Nhb4DlX9aHDFGOVqko7aXLXjKrA8sKDE3y4aJpxDtunCR3g6wxCD3glYAAvpt8np334d5cRwJnOE6AmNPd/IVjvSPLs5EWnsrEkCv81V049IJT7BSz0/hC0P81i5pgeW03JWgfrQMf6fepqTq/+018VWRokxASGMfYKymV/85XryC75ipM62dwQ8dOLW3ULf2vcWlviczS46syQ7x4SAGw0lIDY+ibGbbWqJRKo+Fi3GvcsPVrx6iKZSqialvG3ThmVDwTXCqYTc3qs+QctCIyhZ5JF5ezh9Kf9IZOrQlmmV4wudlPxevVlxFh0bSxz17z/v3fF970Qg67w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JYwxjmNrGYe+FIxr1oRwnWUOSmki7yaI2j2Ch6XPXU=;
 b=wavDflmJ/XlH+YuVruOS8hCqtvuz+Lc9iVTHI+csco9G5qOGJtb69exnPC14533PuO6BYuGujSnruio0pfbLWHY4pncWGOPzHVJjoFtyaHk/TSV+6AQk2EkVVxgr0f/nA16SN8Rtbn4/6ecvw4ux4v+G5YyhLlFk7OaJVSQLDkI=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3447.namprd12.prod.outlook.com (2603:10b6:a03:a9::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 01:43:50 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 01:43:50 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Guenter Roeck <linux@roeck-us.net>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v5.6
Thread-Topic: Build regressions/improvements in v5.6
Thread-Index: AQHWBpcvcUuu+ZudzU+b+A9JmGkSJahhl0cwgAAMygCAAEU6AIAABSyA
Date: Tue, 31 Mar 2020 01:43:49 +0000
Message-ID: <8abe0bd7-d665-8625-ac4b-517f341fe0d3@synopsys.com>
References: <20200330085854.19774-1-geert@linux-m68k.org>
 <CAHp75Vc1gW2FnRpTNm6uu4gY3bSmccSkCFkAKqYraLincK29yA@mail.gmail.com>
 <CAMuHMdXDBtOo_deXsmX=zA9_va0O5j8XydxoigmS35+Tj7xDDA@mail.gmail.com>
 <CAHp75VfsfBD7djyB=S8QtQPdKTkpU5gFzyRYr8FshavoWgT0CA@mail.gmail.com>
 <CY4PR1201MB01204FB968A6661FB8B295ACA1CB0@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <c8447243-98c6-d545-9766-e6b3f33f4d13@synopsys.com>
 <a5e8ec79-2eff-7517-4b90-38d5cb366f45@roeck-us.net>
In-Reply-To: <a5e8ec79-2eff-7517-4b90-38d5cb366f45@roeck-us.net>
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
x-ms-office365-filtering-correlation-id: 978016bd-f6d0-463c-b7f5-08d7d514f608
x-ms-traffictypediagnostic: BYAPR12MB3447:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3447855CD2C14545F43D0E4FB6C80@BYAPR12MB3447.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(376002)(346002)(136003)(396003)(39860400002)(36756003)(6506007)(71200400001)(8676002)(81166006)(81156014)(31696002)(4744005)(6512007)(107886003)(4326008)(53546011)(86362001)(2616005)(110136005)(316002)(66556008)(76116006)(66946007)(64756008)(66476007)(66446008)(5660300002)(478600001)(6486002)(54906003)(2906002)(26005)(8936002)(31686004)(186003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OjdsIno10Va6s7E+9sTZzS0Y6BGMzfLcMUOvxQF/9BR0Q+Cpt07ODWm0HRJ2J32SnqaIOkYAk+9FtONQva1j7g5kSuGL5voraXkPuxp16znWqhBT9BMBaTe0BR4c+omhixuXbvfFisGl6dcX0F4xtVAJumZCEVLLIbgRU9nqfo2dIYrRF1+JMXeYYnXHToCNcHsgHEstO+jAfV/7b1Xb0P15kA3nArZ5v1u7J716wQftRHOQMe8T8AR5I7SBmFWlfr6YWyY9khA4mHx3eQlCcC0kGUVOa9boVP5A/CvvbIVVcIxydA1HNG+r+HGvTxnKpf7Q19nubxeqq8zGDQAHhbf0aCGFhL77Ht06cELKOeNxy5FhyM1rmcjDv/111wUFCdL9YWM8uQLK5gbiMGW9Mr2WjE0922F0wpOQH0dgu3xQjx7DLz3CDwzhtotRXL3G
x-ms-exchange-antispam-messagedata: x0c+IKJAM4Qnngtagkc7u9zFLuxIpIIl/FiyIwe0AKlFloDLjy/uZPwU79ezBv0QOZjnwE6ibBYxgz5cvS4+bchVL1/WcCkK4wg+aHhoHDbqLg3sHqV5/eC/1DPOhsk/dBztMUj6Iakr/5Sd+G8EbA==
Content-ID: <8F90019EAF54A04CA15F67A870A62860@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 978016bd-f6d0-463c-b7f5-08d7d514f608
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 01:43:49.8074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X3in3FpbYwNyphsV5CaGRhQmC9deHKboDPm2Wg3slAaJyMB5SxY4VdMk8v/vJQ8sT91/QIb4s9gEJ0gtEr+Mug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3447
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_184402_968514_4A4EA7CB 
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/30/20 6:25 PM, Guenter Roeck wrote:
> 
> I am currently using vanilla gcc 9.2.0 to build arc and arcv2 images. Are you saying
> that I need to update to gcc 9.3.0 ? gcc 9.3.0 was released only a couple of weeks
> ago. I don't usually jump onto new compiler releases that quickly because each
> release tends to have regressions.
> 
> [ Never mind, I just noticed Geert's reply. Still.... ]

No you are good. The issue was Micheal's toolchain from 2016 sources.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
