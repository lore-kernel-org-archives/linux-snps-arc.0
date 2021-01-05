Return-Path: <SRS0=DkXR=GI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC66EC433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Jan 2021 05:07:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F1122256F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Jan 2021 05:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F1122256F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gF5G/S6mcc/8q84e+AET+o/ldfKDNDsG82RzYq13y4Q=; b=XeNeTVNcQalwWXA89fYEGbKvt
	oJOqurBEMlQUwT+HvkQkS67wCKFEsrCPBn+PUtFKgKhOZhJ+JHZMiewxJGqFhfrgHvzUSobC1M6dF
	WBkoQ7iCmoCkxWhGz1OrymJaOmmecrGh+EGterMKdLzZH4NGH7HToxklbJoSnnCzfHHRYWGF8wFze
	3Xe2FkFXMS2mn6mZ27y9bjDOZ2l1XV1hZkq40d/hPNa8wXFqJBhvZUCs1YM5TJdALZoVrRDgSWiIF
	JoW8Wkt9btFhjqsZFQ+knl8HavgbvYMIPLvZBCEx7KBkLYsDe6T7cLC/D8qy/gy+/eY3guzBCH9J3
	cI9I3SnuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kweYv-0001Cr-GC; Tue, 05 Jan 2021 05:07:17 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kweYs-0001C3-K6
 for linux-snps-arc@lists.infradead.org; Tue, 05 Jan 2021 05:07:16 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 09C41C0091;
 Tue,  5 Jan 2021 05:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1609823233; bh=Ak7v+pljvwgmkCRkPQgXYQSoEcv0eiBbTuu6sJqVb1A=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=mZ9sR8+ijE7/ZKz8n+iVlOP2ve6tE10LGnfXTVOjvYESrv4arHhve87lyGnN61uaf
 NLWQxgK5ySJEpKd3CoYfPvgipcy0Li0cYNuYGzj/KsWCMu23J0oXB8re9lwkCBeTen
 o0Bc7nxy9GXRY8R1U9sskpwWhEzD8sVaRaeQyL8M9mMDSRlvc0NcpcKCL9jLnhxK6S
 LjfRYgut8Jx5kCugYADwriS6PLtTYer0eBVOqKeB2nNwVLsVHSzNxQmVbUIY8S9FuB
 2wPpA3WIREWMgjqnv4odqTxyYMt3USnezHlNr2Om7ZH1kHa6I0Dj8dKupm5mwMc6mv
 2ozF8wBbyqLdw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2BA90A0071;
 Tue,  5 Jan 2021 05:07:09 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7DBC7800C1;
 Tue,  5 Jan 2021 05:07:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="c/sjXhuV";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBm5SAHQbxrHRXR+BmUbGtkvJAE0pd88gcdtucdjeUfiwYEugAT+LzG9QevssbrYsgPzxZKyctXELJsFqQxH0QT5cyl/HmRo3vMPjic7tGGro9cBoOJsASOTIKSxfUUf8jqe8tbcHGjLPfIJ7oVEOQYPOL6O+G5hK+slpr2veNx2VXNrFP6NNfC1fZv34SCcRa87zSVh7g6GLpnsbBKnQPIheN6Q9jfXUjL8uwGYIfUppXHdDvMJ1se8RGdv3nAVB9NQt1uoYSGBBAUYo3Uii0zh+rQwsTb3GAiepM8WPGiOiDQ2MS56CkVTHTp4arVld2KRYAafqBklo3Sl/VmcwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ak7v+pljvwgmkCRkPQgXYQSoEcv0eiBbTuu6sJqVb1A=;
 b=JHtbK1GjP5Z2B8QZckXP+uTcnWnURBzScY8bk3zDIPX+215iH7/jXxyWLOIRXdvhtsywW1mNgGQ1LeVR1Bv0a1zVjQTmvRGQQ1iHuyyuxCMmAbmD2ymXjGUPeAaUvZmWDH1/CAUyWrcHr0zmQE7svvgP8DbnbNPwSBxIW5fvJ/y37JHHfkjDSlv4vc1avbOvRa/ZYkrXv1RHLOx+8JbPs7pBdd5K8DQyGyg9NR0BoaKufDSG4TSw3AcFIlPgQ7xQAopdQlpqS4Ebd+4LLmOE9dudOr/nDWHro8cUBrPO5e+ZCkr/JdbIbhiTB/uH0wVE70AUt61N7bhYtp8JkUnEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ak7v+pljvwgmkCRkPQgXYQSoEcv0eiBbTuu6sJqVb1A=;
 b=c/sjXhuV1qWd/VE52o4WG3dwK+3AHQwhWLN+Eo1+S3TV2sAjgrbdVBsnCPF2Ql3MAKCuOnaKAvEM0ZAeW1J0O5WaiIJjdeGia603kENaf155ydOPugcX9XiebVfWlUdqkQ/4Biaxc9UEkE0yh1kUk/KBvTpHSxN0xzNvSXe9voU=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3254.namprd12.prod.outlook.com (2603:10b6:a03:137::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Tue, 5 Jan
 2021 05:07:05 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c0e3:82e9:33d2:9981]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c0e3:82e9:33d2:9981%6]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 05:07:05 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] arch/arc: add copy_user_page() to <asm/page.h> to fix
 build error on ARC
Thread-Topic: [PATCH v3] arch/arc: add copy_user_page() to <asm/page.h> to fix
 build error on ARC
Thread-Index: AQHW4xWINHlmzpy9lE+McOvZMOuaoKoYewsA
Date: Tue, 5 Jan 2021 05:07:05 +0000
Message-ID: <503084f4-b082-edc7-1d11-c3d712a5b4b5@synopsys.com>
References: <20210105034453.12629-1-rdunlap@infradead.org>
In-Reply-To: <20210105034453.12629-1-rdunlap@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org; dmarc=none action=none header.from=synopsys.com; 
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed38f42f-74f9-421f-acda-08d8b137bec1
x-ms-traffictypediagnostic: BYAPR12MB3254:
x-microsoft-antispam-prvs: <BYAPR12MB32548CA255AF3794B5146155B6D10@BYAPR12MB3254.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GwK/kRD3rbp4yVV1AusCDLjdm/c9c3//QV2muooG8HY6gygrZRbZrmktENkOY2qsiv2et0i/gCRdl82gk2q/9sNzSsgl8GNVb7mNPxzJEk4TDEo8fLwOIRTAloDHrVDkfzVCcTCUcsPH1ncr7W80b8x5O3mUO3N56G50cKF1YrD8K+qsz9VPIiwFIWNYXS/yaL3CeoArjaEUCg0FZAdxSMO//v/NPMB7eR+oCjjnol40YaRgHcCgdsSjPiRXDgGweDQgBkUWWMqTNewQUrAUxnLWoTPMfau03cEoUPgKLcKgL8BXFCetk9WuR88/Obf1YpuZehN6zvcFuHveXbiBPsb/9BE7ouxvcWJDHJ5Y0SCpBqNKTMbftgPS0Zj9mMXUnlV5/49iiTa6s/jObGfw63obsKXhd4HUA6tyliPmn5LpHqwtSUozZmdC9jQYOr9uDwI3BPZgT6YpeOAbRavfveEuw6we4+nAb3NKQkCo6gg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(376002)(366004)(346002)(136003)(31696002)(36756003)(186003)(54906003)(316002)(110136005)(26005)(6506007)(53546011)(8936002)(71200400001)(64756008)(76116006)(66946007)(66446008)(4326008)(2906002)(86362001)(2616005)(66476007)(31686004)(7416002)(478600001)(5660300002)(8676002)(6486002)(6512007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SGhHWE44ZVhBTGZxTUZtUk83eFJIZzB3WExIeHc2alprTEZvc3ZTMVFCWTJW?=
 =?utf-8?B?Y1JuK1hreFM5L0V1a2FudER3TWlIdkFBZm5RZnBUWHY4V01ZOHBrbi9HdkRo?=
 =?utf-8?B?THNCMHRTNWtiZS9QRm5VWnNzaUhaVmhuN0tEWWltQVFTdEg4cm43c24rNjhD?=
 =?utf-8?B?S0taQXZnQmJDZW00N0ZwM1RCbjNsQWRvOXllOFlLL0E0dnl4R09Oc3lTVXdD?=
 =?utf-8?B?VmNFZWlrdi9rdTRWZEN3OGQxdVMyem9xK2pRQVJoRHhKWXl6YUd6bjBzdHpT?=
 =?utf-8?B?cW9SUkVLMFR6K1hTU2djUjBJRlMxclZGY3JUV1JYYmxjd0EwSHVZdWl5TkJO?=
 =?utf-8?B?bFEwNWJ3a2QySFlKMFJJN1pYdWdoMDBLcG12UHRyblg5M3AxU29Zd3FmajhZ?=
 =?utf-8?B?dW1WT2E5YTlUa2JEVDQwT21UbXM2S2wxM2pTbDZnbTNGcDB1MXNNUFZ6VnpI?=
 =?utf-8?B?Q1hPUjB0NlFWTTNRRGsvWVlnWXBTbDVSTHFKdUsrSE1PSStZNkRQWGNtcGxz?=
 =?utf-8?B?VkNQa2IrbzZEMUxxNlpsWHdSSk4rQzFnQ3NHRzRGeXJHd3pRY3AyVi9qYkJG?=
 =?utf-8?B?TWpOTnFWVkJoY0p1SGZSVERVNkdjbis0anZMT0V6aUkyWEdqTFNrakdSMys3?=
 =?utf-8?B?K0lSQTBGRFVsQmp6MkRRT09kSkhZNEQwT1pJWHZxMW15MUdteEhIYk10WTZv?=
 =?utf-8?B?ZnhnZUFieVpOdXVqMUNGalBYQk92VjQyYndXU2thU2xJSW5WQ1hISWgvWGt4?=
 =?utf-8?B?YmRPdGtseElVV0x0WGpNNHV3M2hVK0sxRjlqSzRvSllrUVBUeVZ6b2NrYUVj?=
 =?utf-8?B?dVRUMzZ0dmNuZWlPNjBKT3dacUN3VGxRV0ZldHdsTEFNUHhGb2ZtYVBnTjF5?=
 =?utf-8?B?NWZ0UEhhV0xxc0JlbldwYWVWU25aVzFqbFA4YVRXZkU1NFRWQ2ZLVE9jR0Na?=
 =?utf-8?B?SUtKMmpuMGVVMm1wOWFJT1h5TjJkbEloZGp0WG13VGpJZ0ZRT2NFK2NWSjVi?=
 =?utf-8?B?UW1VenpkT1NCODhiVE9mL0ZSbVBzRjFLVmVRNXJEdHhEdmhJVlkvOS9mQU1Z?=
 =?utf-8?B?UC9VMzd5WFo1S3NiM3M3ay9aV3REVGZ4d21JVGdPcCthTS9TMmFpZUxLVit6?=
 =?utf-8?B?Nng3L3M0akJrNFlVNVhwZjNzVVJuVXNlVTlxUlhEODZidVdMY0UvVGw3VVBR?=
 =?utf-8?B?bXdGcVVEQ201TjZNSFZIeHlvWHdIVnBTQndaMlhsNXBzUW1wMC9yZ3AxSXAx?=
 =?utf-8?B?QSs2WmY3NUU0QUxabzdRL2c3QzNFZ2NaNDUwcFRqdnZnRitzV2g5bGhud1pO?=
 =?utf-8?Q?dzfE25dWElQgs=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <895D86CCCCA3BF40998EEAF54ED487E2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed38f42f-74f9-421f-acda-08d8b137bec1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2021 05:07:05.3007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hsMkOMkQf9kKkEMsyoXUfcoFerp2tLOIu2zTVfXKM4twJLPGWhL7jC8VJQ6u7pWkUwp1AdtDgdkmblOIsb/KEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_000715_059418_F466E94C 
X-CRM114-Status: GOOD (  16.68  )
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
Cc: Jan Kara <jack@suse.cz>, kernel test robot <lkp@intel.com>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 Matthew Wilcox <willy@infradead.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/4/21 7:44 PM, Randy Dunlap wrote:
> fs/dax.c uses copy_user_page() but ARC does not provide that interface,
> resulting in a build error.
> 
> Provide copy_user_page() in <asm/page.h>.
> 
> ../fs/dax.c: In function 'copy_cow_page_dax':
> ../fs/dax.c:702:2: error: implicit declaration of function 'copy_user_page'; did you mean 'copy_to_user_page'? [-Werror=implicit-function-declaration]
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: Dan Williams <dan.j.williams@intel.com>
> #Acked-by: Vineet Gupta <vgupta@synopsys.com> # v1
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Jan Kara <jack@suse.cz>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-nvdimm@lists.01.org
> #Reviewed-by: Ira Weiny <ira.weiny@intel.com> # v2

Added to arc #for-curr.

Thx,
-Vineet

> ---
> v2: rebase, add more Cc:
> v3: add copy_user_page() to arch/arc/include/asm/page.h
> 
>   arch/arc/include/asm/page.h |    1 +
> 
> --- lnx-511-rc1.orig/arch/arc/include/asm/page.h
> +++ lnx-511-rc1/arch/arc/include/asm/page.h
> @@ -10,6 +10,7 @@
>   #ifndef __ASSEMBLY__
>   
>   #define clear_page(paddr)		memset((paddr), 0, PAGE_SIZE)
> +#define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
>   #define copy_page(to, from)		memcpy((to), (from), PAGE_SIZE)
>   
>   struct vm_area_struct;
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
