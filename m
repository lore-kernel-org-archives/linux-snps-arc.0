Return-Path: <SRS0=5Nd8=ER=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F40C388F9
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 03:56:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 183B520825
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 03:56:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NTltGi00";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UIhKQTh/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="N+Qo0CP1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 183B520825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V5pCbOGRG25ookmrUiTa+YnLYZHDQ2q4Qfk7kyEs4e4=; b=NTltGi00qbhpenwjCbGPAIsQY
	8gSOXHYStqidrfBDGXwytzvB8BAXZwU2cuxQxKcm4W7x6LHebu5D172K4jT/+64CTVUrnVclGE20H
	ynoTTtbhxUI05pkXD4GqXjqoiHrO2b62k0eq3DJ2IlieUtsk3qQVltQsRFXRi/ubRhmZJQGqBY4Q3
	gJOyIeFv/zvBK944vW75/SC7/a3yTX/6smDBAWDfUa9Fp27OM6qPhURacmEhFpMLOw5h5cc5kWiy+
	v7njrdisRG3Tz7wNY1bJ0dvim7YZcHTQOYysr3Wdptz+kCWwFvb0zh1AxoLwZcrVDm/XGVZg1QxYn
	1941byxmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kchFY-0000Z5-6n; Wed, 11 Nov 2020 03:56:48 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kchFV-0000Ye-M9
 for linux-snps-arc@lists.infradead.org; Wed, 11 Nov 2020 03:56:47 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AA28BC0090;
 Wed, 11 Nov 2020 03:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1605067004; bh=z8HubOSXbqQaPi+NXseTo9n72Z9VUVVXc+N195koxZQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=UIhKQTh/zcdwoICisv35rOWrmmR6BO/SQRHbknwr13jXTv3+ZLxPOdwg5XVOGaMjO
 0hK7OEXiWgG3hWU2gGAyESiwUwrg0qAt+fdxDP9N+7z18m5XQL4RiPpaMJjDpNX7bv
 UMkj5IeiFj7ZSLYeKKcl8w0nA3kP46XuEh9a0DQc1JgZC37EoKdXcs26IZeki30pro
 Z5eQw1GzAeg9Cz8P++AHSWnNTDUoT1B40MK/PZlgra6NqyPWgrYAdN5q2zEBRm8DrP
 QeW908iSjBAORM/6H1OhRFM8bATy8+xYl6JGcBS3UztfJxaWehUUzRPNM0Nr7yCsad
 5EXJKpcPWxArg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7A7C3A0099;
 Wed, 11 Nov 2020 03:56:41 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2053.outbound.protection.outlook.com [104.47.36.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4636E80256;
 Wed, 11 Nov 2020 03:56:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="N+Qo0CP1";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXG8s02OdqKPEjnL3ZK3QsN45WUmzlBU8nawag2+cuM+Z1Fb0MkDsid2bf834jhUTM4LAXDdAEHUuTe4TxlocmxD65xW7c4a+IwlewFxMCesXGbCJQKsErsKLDWChCXbt7HLatBnBID4WDKrYUtrpW7M9aPHCxlpaw0v/bVMJwvJAySoksJRVqNFQKG74cUc9uPvhcvm/yL7k/fDCfIpDFTkYCDHiy4OXFazY0OcX5g/JGFbec+91mIbO1Ukc4Wvq1cW8lfRzBJYqMTS6wvEeK90j8pVKseiSKNLKG1XN6wkzB0eNPPa4ZqRPFO/2JYRQ+dEXkKX3YM1KlUDahI25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8HubOSXbqQaPi+NXseTo9n72Z9VUVVXc+N195koxZQ=;
 b=FUkIW28WSmEf3oHw4FF1bgoumt0K/3qhIRfPKgGa1UMi8mxJWSnwCr5NdK8zHJTeQleAobXDc+8HfQPlbC7umIi0jVZtU/cGI29CrrHLsKy93UwyYFpOxUUL1Yr+H34ne0t6I8M9oQtf54k8EwBUx1ZfOoC1d4fiACfpuU/aV8RbMeeIJHOw+skL3q6QM05JURNYcfDSRunFqeH/uiVh0RbM9YzIqu4pNUW3xCyRZRjgqrWl/2vGRJ5t/aY6Jd130GbDopsIZrHMxiwDohY/4NH5cvMDRPszY5rG+q7X0pYCsazpA9YAkyIxmluEhZLsiv9VyIKhvFodKsHTBpoh2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8HubOSXbqQaPi+NXseTo9n72Z9VUVVXc+N195koxZQ=;
 b=N+Qo0CP1btQx7zMpK7QmPM6JoDmOCQEwnG9+SX2M/idZ2lBWBiUUavA70HsZVGxJrDa4x8QwEsx7416Z22W7pQpczjsHBybwVNJajCK6OFb8nFmUCxFlSDleFE7/kgxbhyenGLpWXMrpbfW3sJ0D/MVmVaYdLekDJQXzZESq/qo=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4082.namprd12.prod.outlook.com (2603:10b6:a03:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Wed, 11 Nov
 2020 03:56:38 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31%6]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 03:56:38 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH] ARC: mm: fix spelling mistakes
Thread-Topic: [PATCH] ARC: mm: fix spelling mistakes
Thread-Index: AQHWtptYkvqc3DTOMU+gcOmdAjskKanCUBYA
Date: Wed, 11 Nov 2020 03:56:37 +0000
Message-ID: <79388ce9-f589-692e-1d8c-11cd7eb1b3a8@synopsys.com>
References: <20201109132130.34555-1-f.suligoi@asem.it>
In-Reply-To: <20201109132130.34555-1-f.suligoi@asem.it>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: asem.it; dkim=none (message not signed)
 header.d=none;asem.it; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40791a5c-5e67-43c3-bba9-08d885f5ca60
x-ms-traffictypediagnostic: BY5PR12MB4082:
x-microsoft-antispam-prvs: <BY5PR12MB4082DE7432C33CD4F7C9E627B6E80@BY5PR12MB4082.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gqoaWK7J/6db6CpOjLL6AdMzFvEKIumIdLgW0XUhIp/7VDdlVTSfgEfBHgpwDo156mId5f/tSp+GtYrDWLujnZliG2yJ8W37S3KNJvpwgtSJ5WVfY9HRHmZj0k1jWokfBptwGoM6wbjvcoZH8hWGMpvBdxpVpUHIWavBlNvWcUJ+Yhh80J7LA8HOVdzJe+katJWfqGHJ2ziBqDTjjn9h3Ixp3cpsVlNZXc7SLZM47/k3KXk1JucEXtb7s6BMOudu87MqO56wEAJGv5ED2fclKZRIABaMAoy+R8guSQnMKOwJZzceu3D7g8sTEApbYZYgyqXlpZBXtYKqPqlBvVVsWLcbUnD8Qm8Cs9rxuPQYIEo+7ZDW8DaJzMrGIa5SQPLy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(76116006)(2616005)(6486002)(316002)(4326008)(31686004)(478600001)(66556008)(66946007)(53546011)(8676002)(31696002)(186003)(54906003)(86362001)(5660300002)(66446008)(64756008)(26005)(6512007)(8936002)(36756003)(83380400001)(6506007)(6916009)(2906002)(71200400001)(66476007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: THHvuQvQt8cPgjtcwNN0Yl7YF2oTKYj8aqPOtyfh7XFyLe+islokZLh4CRNcGeF2Dhg88aCOfyNzGJFJDIPpz1NQ8IIrWen0fckBiTjGaiZ+MJdkg5xo6BFUzzIciEupIY3WWa5aqVfinpGxPTRneb9LK8xdS4BFQgjsShub+y7w8Qv0evrJRDnHd0AMU/CcGP2/dY9O1a00DyKFnq4dt7+Rr0NfgVvtefRlHWjEM5ZEvwLVc0mhF3TDTJ8X7CezqxgJNuxNWmge/USkgZ7iVH+hjVh9exGuEvrwJCs1HCC556JjkgkNHqRbYzw2WElLrUj7KcEDQPevOgiSumTG7+Hg8Mfrk2kJLgLMGckBdc1PQurbTYb5ySUt0cUOMieymQOhkYedyVnJi9QR7Np0XigDyfwrRzmbbGANm5ZJTQifCJX8A8mrgzb4kXjT1pzCO1IEesSObVv2lz4mGvXRvr+b4g7PH7+B1jM8xkCxHNKpcxsp/NBB/0y7cnYyO6Yx1gBvVRYnm4yuaQysC8utnbFu4++1WLD4JUe7u068rRWHJle8/8heCX+EAu/KsTZGy4dWKSt+1ka3/trXEDn0Fz9/xO2ztIHZwQoLL4fqUxZ0gipRCXvfjy6VaQNYXLR5w5fHeV5mUwcZ/bfaYabeZw==
x-ms-exchange-transport-forked: True
Content-ID: <4B14257285AD7546BB1F4CC29EC2B8CE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40791a5c-5e67-43c3-bba9-08d885f5ca60
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 03:56:38.0434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B3k/l+f+DhE6APCqJUqlfHLonspq0XGJzL7EE1rCTXIKW0tiQYbKXlEsaObNP4jy0feZSPsrfavCZnGSwTmT8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_225646_200816_A05D9ED2 
X-CRM114-Status: GOOD (  27.88  )
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 11/9/20 5:21 AM, Flavio Suligoi wrote:
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>

Thx, applied to for-curr !

-Vineet

> ---
>   arch/arc/mm/tlb.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
> index c340acd989a0..9bb3c24f3677 100644
> --- a/arch/arc/mm/tlb.c
> +++ b/arch/arc/mm/tlb.c
> @@ -30,14 +30,14 @@
>    *  -Changes related to MMU v2 (Rel 4.8)
>    *
>    * Vineetg: Aug 29th 2008
> - *  -In TLB Flush operations (Metal Fix MMU) there is a explict command to
> + *  -In TLB Flush operations (Metal Fix MMU) there is a explicit command to
>    *    flush Micro-TLBS. If TLB Index Reg is invalid prior to TLBIVUTLB cmd,
>    *    it fails. Thus need to load it with ANY valid value before invoking
>    *    TLBIVUTLB cmd
>    *
>    * Vineetg: Aug 21th 2008:
>    *  -Reduced the duration of IRQ lockouts in TLB Flush routines
> - *  -Multiple copies of TLB erase code seperated into a "single" function
> + *  -Multiple copies of TLB erase code separated into a "single" function
>    *  -In TLB Flush routines, interrupt disabling moved UP to retrieve ASID
>    *       in interrupt-safe region.
>    *
> @@ -66,7 +66,7 @@
>    *
>    * Although J-TLB is 2 way set assoc, ARC700 caches J-TLB into uTLBS which has
>    * much higher associativity. u-D-TLB is 8 ways, u-I-TLB is 4 ways.
> - * Given this, the thrasing problem should never happen because once the 3
> + * Given this, the thrashing problem should never happen because once the 3
>    * J-TLB entries are created (even though 3rd will knock out one of the prev
>    * two), the u-D-TLB and u-I-TLB will have what is required to accomplish memcpy
>    *
> @@ -127,7 +127,7 @@ static void utlb_invalidate(void)
>   	 * There was however an obscure hardware bug, where uTLB flush would
>   	 * fail when a prior probe for J-TLB (both totally unrelated) would
>   	 * return lkup err - because the entry didn't exist in MMU.
> -	 * The Workround was to set Index reg with some valid value, prior to
> +	 * The Workaround was to set Index reg with some valid value, prior to
>   	 * flush. This was fixed in MMU v3
>   	 */
>   	unsigned int idx;
> @@ -272,7 +272,7 @@ noinline void local_flush_tlb_all(void)
>   }
>   
>   /*
> - * Flush the entrie MM for userland. The fastest way is to move to Next ASID
> + * Flush the entire MM for userland. The fastest way is to move to Next ASID
>    */
>   noinline void local_flush_tlb_mm(struct mm_struct *mm)
>   {
> @@ -303,7 +303,7 @@ noinline void local_flush_tlb_mm(struct mm_struct *mm)
>    * Difference between this and Kernel Range Flush is
>    *  -Here the fastest way (if range is too large) is to move to next ASID
>    *      without doing any explicit Shootdown
> - *  -In case of kernel Flush, entry has to be shot down explictly
> + *  -In case of kernel Flush, entry has to be shot down explicitly
>    */
>   void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>   			   unsigned long end)
> @@ -620,7 +620,7 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long vaddr_unaligned,
>    * Super Page size is configurable in hardware (4K to 16M), but fixed once
>    * RTL builds.
>    *
> - * The exact THP size a Linx configuration will support is a function of:
> + * The exact THP size a Linux configuration will support is a function of:
>    *  - MMU page size (typical 8K, RTL fixed)
>    *  - software page walker address split between PGD:PTE:PFN (typical
>    *    11:8:13, but can be changed with 1 line)
> @@ -698,7 +698,7 @@ void local_flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>   
>   #endif
>   
> -/* Read the Cache Build Confuration Registers, Decode them and save into
> +/* Read the Cache Build Configuration Registers, Decode them and save into
>    * the cpuinfo structure for later use.
>    * No Validation is done here, simply read/convert the BCRs
>    */
> @@ -803,13 +803,13 @@ void arc_mmu_init(void)
>   	pr_info("%s", arc_mmu_mumbojumbo(0, str, sizeof(str)));
>   
>   	/*
> -	 * Can't be done in processor.h due to header include depenedencies
> +	 * Can't be done in processor.h due to header include dependencies
>   	 */
>   	BUILD_BUG_ON(!IS_ALIGNED((CONFIG_ARC_KVADDR_SIZE << 20), PMD_SIZE));
>   
>   	/*
>   	 * stack top size sanity check,
> -	 * Can't be done in processor.h due to header include depenedencies
> +	 * Can't be done in processor.h due to header include dependencies
>   	 */
>   	BUILD_BUG_ON(!IS_ALIGNED(STACK_TOP, PMD_SIZE));
>   
> @@ -881,7 +881,7 @@ void arc_mmu_init(void)
>    *      the duplicate one.
>    * -Knob to be verbose abt it.(TODO: hook them up to debugfs)
>    */
> -volatile int dup_pd_silent; /* Be slient abt it or complain (default) */
> +volatile int dup_pd_silent; /* Be silent abt it or complain (default) */
>   
>   void do_tlb_overlap_fault(unsigned long cause, unsigned long address,
>   			  struct pt_regs *regs)
> @@ -948,7 +948,7 @@ void do_tlb_overlap_fault(unsigned long cause, unsigned long address,
>   
>   /***********************************************************************
>    * Diagnostic Routines
> - *  -Called from Low Level TLB Hanlders if things don;t look good
> + *  -Called from Low Level TLB Handlers if things don;t look good
>    **********************************************************************/
>   
>   #ifdef CONFIG_ARC_DBG_TLB_PARANOIA

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
