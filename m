Return-Path: <SRS0=radI=7K=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8072EC433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 May 2020 01:37:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16A54207BC
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 May 2020 01:37:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LVJP8fsV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="b2FqtTiy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VnvbIito"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16A54207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uNF7aFt8nk/8njLEO09uHrM9k/f4OQ2j7QkRe5bQHg8=; b=LVJP8fsVDt+Y1O
	DKsZSS5pDq/Jxjl4nDVqJNKD9UujongV7J2tc1f///ahIZXhwjRYAWRJGU1jV6Yxm1k4UHgEdBJKZ
	7WIWoy036JWGSYy/hB5k2ktP+de2epHl2alQ+yvCxc+c+TNfMhxXFj6lITmnMT9hDUm7X5lJB7mVG
	7yXUokNxzISkRz4BBgrOlwKyLpTUbv5o+NdhiOqwXVaBXt7IqSBdq8BJU3AmF2LWTD9kp2/+PHUgV
	1VIw2ZnVWqoKwq1S/ltfxLhCJF1UwT5qbKC9JBT8748Gqc7cYMSxlisNLd4tX/dgr+pomfPFIFEMG
	pK3otai8EEFXz1YRcFFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1je7UJ-0000sK-95; Thu, 28 May 2020 01:37:39 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1je7U2-0000fV-Mq
 for linux-snps-arc@lists.infradead.org; Thu, 28 May 2020 01:37:35 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E882440143;
 Thu, 28 May 2020 01:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590629841; bh=lphAkVJNE0LQbFiboHZzhH+99vU+Gh5ZeHfbBNPXaKg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=b2FqtTiyIZ/dJW5aEN31y5JL0Lb6MaeGN/DXbKwhyXw9Z2XvygPAM91e5Azfqs490
 ceMEsL80Xa0TiQAkqPHIpVKH+S+aEGrKdetVcyA7VOBqCgsr6R0qc9WttAflZ+Ct/Y
 HHi2bftfAGumu9sOivy54T2j/ZiUH9EzOtLOVy6Txzq86tojJpsMcMMVQm0OgK2A64
 d7oymacjyd4Ny575mDjwkP9lAntB9kObnQkUb56bUDXXPpau60WUvsFb+Qk6PvxnuC
 da+O941kg4Q9LTauR100GH10XWjWbGb8AT6s6T2sfTXlU3AeC26bcYwEFV4TjwaeZH
 5Es+Vmx/PzszA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 31766A0079;
 Thu, 28 May 2020 01:37:19 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 May 2020 18:36:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 27 May 2020 18:36:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9KepBKgTfRBPDvvai+fe+GN1lfiu1e5DVEhMDGvKz0pkbSkgb00Ge1jqV3g7jASfJwVLH0IuuLI6pyjtOmga0vLO0q19Peeu3xoL/bUNcsbeYBSM9ctV68C1gz3Vl/NUlCTPGHHUCdrJ0hoMQJPNxnx0E7ypcRkd9Of6rRm2RBDOABzviwmrkZ/dWfzTOQtAMP8h5pJi9aGmvHnZkKQfLcBT5a8EFHDVTxKajUG0BmEWGGv/h/987sHKJOgN0m6qvyqEVoBZgAqh1VzaJKi2g2Un2YFPZrPHFSTaV8hnNwEd564WzmkbVBxPNjWn7cmM/RVFE02kTEHiVr6L/hZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lphAkVJNE0LQbFiboHZzhH+99vU+Gh5ZeHfbBNPXaKg=;
 b=k++XCTAz6RCm3Y2O0xdZT5GlRbqw0un8VqFoR4Aoocwer3H7wcjjfeWW8YpqpQxzKwSpTOQaqKD7LM3XH8UbkIc3jdGpaXEF0TPYL9FIW++UUcDfyOtIZ072uWQZzcF4HJd/Nb7OuHCbE398xEg2gYvRYezR+hebTwpXK4UxLdw9ehMqowwK3Bzskm+DiL5NY+wF0wXiBLF0XC/FBbhEFgVIQoDUXAGXt/zuNKHUlV0D064sKjx82juZP2zWgL0tM7xh+qX20pvpJzmh3NUm6Mi5INczCiWvHhFfk61PMqOErbH22G1aTEjcQgA8oRv78DPljOjWE7yI2SiA3VLvjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lphAkVJNE0LQbFiboHZzhH+99vU+Gh5ZeHfbBNPXaKg=;
 b=VnvbIito4iUOkCoaSW8Te4UKAIL9/ixHSh2S9AQbNfAt38pgMvzHWWb4Cn5Qx/5NIUk8qd8zGaFQ1M93bIVXsUPhpnBAHkPeHpPYotxVT5CWuvrBIXF3hasxgLkJiRUSzC/rdNFp75X1FHCZcIvy2uOvSGFuyxir6QsBllwk2GI=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3208.namprd12.prod.outlook.com (2603:10b6:a03:13b::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Thu, 28 May
 2020 01:36:09 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 01:36:09 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v6 03/13] ARC: Thread Local Storage support
Thread-Topic: [PATCH v6 03/13] ARC: Thread Local Storage support
Thread-Index: AQHWNJBcswN+GiVsg0GSUGfjJtH3qw==
Date: Thu, 28 May 2020 01:36:09 +0000
Message-ID: <18a9ff31-baea-c916-4377-76b77976c169@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-4-vgupta@synopsys.com>
 <4f7a67fb-6f96-57e6-b827-d1ab5dd6733f@linaro.org>
In-Reply-To: <4f7a67fb-6f96-57e6-b827-d1ab5dd6733f@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02bc4240-cc65-45db-7d5a-08d802a77f88
x-ms-traffictypediagnostic: BYAPR12MB3208:
x-microsoft-antispam-prvs: <BYAPR12MB3208E8A8DFE2A972EDA330E1B68E0@BYAPR12MB3208.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SXpiMkw3gN9wK0xQg6gB87zjGRExSV0F8lJ5tttu/WA2oCuZXEJSvzZgKmstidDzOWhI4SKdkySbN5AWIEunBJHE6GVFk2Emqg8tNRp3F49CBKi4v9y+rDP9M+r02QjntmUvnMwKTz60eK2+SmWhM68euwovH8yif9hEmFN25zhhE2Y0koQqiDyLeuroBlcOw7d773SQ2dFl62NV6sZLPgDTAjKeJYNdAzYHRVZPmdvyocAdmziVq9HW10Lp1NOAe8IetcG1H0SqK4mgChOeyuKdwsx7X9B32ZL367xjmv07kLIFUhUVFIlYPKPDi8ArzDVQWASWniZL8MkftcrlsJv0w752lQW7A2qT2ATEduBULKwfLM/TDmrUXyM5bxSY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(366004)(396003)(346002)(376002)(39860400002)(66946007)(36756003)(71200400001)(8936002)(2616005)(8676002)(6486002)(6512007)(2906002)(110136005)(5660300002)(316002)(31686004)(478600001)(31696002)(53546011)(6506007)(76116006)(86362001)(66476007)(64756008)(66446008)(66556008)(4326008)(186003)(4744005)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: io1JoLZ0LVCkpBay4oBUOehI9RfvzK1De8Hz0TY97NPElf1d/hf8iXo1lMhaUN0enYWWMrEMpXEVB27nC4gUS4zrwRtNiFrC63y1J7JhRV/eSTz0QTbL9BjbTgBZxWdB+rjxEJs/Ex5wmnddEK139YVIheaeT1OoutUNYl1LbRq1q/YIp8lYrMRL77GEkpFAC2+0k0ljMm7FB+i8jlLikcMTKcp+8PsdIuGTn4Tgl708P/yMsroraAnbrgEgoD2RzroKVrjtId25hdXz/yihDAxxSJKzKP674/35jXgd1Gu1RB9VsiYT6UFPpcanZQOvtJdZ41UdFMXSae/Wl7rjpZXaWVz1bHtvymKCTNpqztWcDrbDXV2QLt/vV5P1rxkHxC9FMwPXdKEXP7xjJj0pnrl0AxTl4TxVJs8XMQUJdtFIgAujSa8RrY8x5jK3xDlPtRpRyKJ4aLVe7rsGNklJPa/QnYQ4CIhMAzm2iH/4CsSBYEgvZLuSR9Co3gnhGNSNwAEoOn3gyrB4un23/l/fWU7wwJ60gKWWeWGGcmdFcI7IRWBURg0IE3yIWlHAJUg0
x-ms-exchange-transport-forked: True
Content-ID: <4E6B229C466BB641B8E130910196D6BC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bc4240-cc65-45db-7d5a-08d802a77f88
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 01:36:09.3571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Si9FW0kneqTP+AHIcSMrlh3TCgzcYzNflcV6tSNKSjCPrpZvly11zCTCx9keYn0PrpyoB5qTLgdtsXOCY7UriA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3208
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_183722_833347_B945043A 
X-CRM114-Status: GOOD (  15.05  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 5/27/20 12:17 PM, Adhemerval Zanella via Libc-alpha wrote:
> 
> 
> On 22/04/2020 22:41, Vineet Gupta via Libc-alpha wrote:
>> This includes all 4 TLS addressing models
>>
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> 
> As prior patch we do not use DCO, but rather copyright assignment.
> 
> Looks ok in general, with some comments below.

>> +
>> +register struct pthread *__thread_self __asm__("r25");
> 
> This is used on other ports, but I am not sure if this is a valid definition
> for a global variable. 

Not valid from gcc implementation POV ? The syntax seems to work alright in ARC
linux kernel where we use r25 to cache the current task pointer.

> Usually the register specifier is used as an input 
> for inline assembly.  Do we really need this global on ARC port? Couldn't
> we replace it with __builtin_thread_pointer where applicable?

We do use __builtin_thread_pointer and actually __thread_self is not used in ARC
port :-) so I can just drop it

Many thx for reviewing.
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
