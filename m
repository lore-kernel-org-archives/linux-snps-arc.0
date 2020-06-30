Return-Path: <SRS0=1csx=AL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790E1C433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Jun 2020 21:33:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E5902072D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Jun 2020 21:33:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ld3SRAq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="amzAl/CX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AKo2C5/y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E5902072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TJHB0ceRHjlxWhtHD2a1yay9YcmufyPf12WJIHWlylY=; b=2ld3SRAqNVqXUNc4gJYZl/Kop
	8SbSu08QCUVRTyHal1npL6ZC6AbpgXJxRNSGrHVQTLpSH6PyIyjG3DQSXUOLChHlzIrzQj26WI2pu
	Xt5zlPbu9HS9DczndYRVbMksTrSxmTTxLY8PmEyk0J2MQsutjwZP1VbBXc4mt1TQy2VO4y79bXvU9
	FykEviSk6nyH3hujUOZETU7RhE8fZ6BZ33n22Sw7HrakfhDItTMc4yqRwskoq3v75PEuku3IvXhTq
	b15lRpradVHjLxjKn7i6qqLKTbGtlG8uErgqyp4RAroNqVP+OEV2Ax4ZxO6E8VXtg/UH7telrB3+Q
	l3YZVfnfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqNsS-0000PE-8M; Tue, 30 Jun 2020 21:33:16 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqNsP-0000Nv-H6
 for linux-snps-arc@lists.infradead.org; Tue, 30 Jun 2020 21:33:15 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 311C04009B;
 Tue, 30 Jun 2020 21:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593552790; bh=ZFBqTzqQAm7H1tB/ym+tX7XAhm0thm+ba+N+EWhxnTw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=amzAl/CXJk0OadTPFzYDzpFaOy47Ru17bSxyGqpPoENzFxuuHMoM8IxAR3U8fwUZh
 n3d+PLnHM2Dmb0y1zMd+ZLliLr8/2fHVUwmxOnrXvp6eDupNyq+mQUWW1r7Z47TiE6
 ZRog4dtDd1JUVeGnmdOgos6461qWTCRiwrKTDxalq2IXCkmpQJTIAu/9TmN7D2MBx6
 8haA0FwQIV7wOcGHbTfrfSvbAxGCsy12mZ7BX8mqZoM6KwQPlIqNjHef1lAyZUBm4J
 ZdkAhQh976rX7BsSTIdmUeo7bu4IP8ljgiUacBAoKuiXhZhPStrwn/FNgU0u/hCImq
 1ZRI8ljTQsdzA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 78C1AA0096;
 Tue, 30 Jun 2020 21:32:54 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id E9B69400BA;
 Tue, 30 Jun 2020 21:32:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="AKo2C5/y";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPZUMy/MuKPP9E5tGe4XU2lb4oIu7g1CV/EwJEfyB7l8JsGXfU2plS3KEJCbY2y2nijhVIGMrG37q1znDXL/vtbmyAko6Uv4tKSlcGm471xUq/4vgxlYDxY9WVjXlgkmwSjVcsuuDwONxq2HFQnJ6xKshhj7NzhKqlhj4vf4FS+N54B+r/e12XzS1dYACcSSTMVDBjvvQHuYeI+kzSAjqHG9qzxb2jzJ5Wlf0c24a5Aegp75pm5Z59ubgK7QiWx7w4Q4EQPz7w9pFxVvTIayKeu4w5UTcDMcTF5pQV9sdO6ZB6EC0arYQCKg7NDjmqNnJTg8PluhdijDMBmCL1XfgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFBqTzqQAm7H1tB/ym+tX7XAhm0thm+ba+N+EWhxnTw=;
 b=WZb6NmPMW9ABnLAd5WK1yQohZYChO49gUBrJf6755u+dwgIWv0DYiS3qVcAxk6/MuJzIIGCuzSbGAilc0x3ICsbp4I+Yr1b5yhI7ClX+tOUH40nKnE6Wr/DSp//FwoepjZrlrmxrEDFzisATnweBsLhkPjbP4jUs30Fqi5S9eecmwGWiO2QgljBC6G7rfFZlhEdBXngf4y1PmI2IWp5jElLHLMa2RznyCNJIcJDnsHBRZCWZTLOFsQl2RtBkuwN9IgIvf28iO39Coe2gUA239wY5Ie/j0w/EFIejc8EEY9xlUlmLN3CLTgU5hlIm3J4muIo4OQGQp8uJT+dKGwsApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFBqTzqQAm7H1tB/ym+tX7XAhm0thm+ba+N+EWhxnTw=;
 b=AKo2C5/ymf/uM9cJBDpHAY9oYSLtyW/T0ITOeuPfBnxE8FoiUju1Jhl4XaDZa3H+q7bQOa3OrT2eQImQK4kXh2jwbPHhBT49Vb1tAkg9d5Gt5wuDSoEfwrPiQZwBcm0wg/+9XccPNKC0rRV3AvN1wo4JzV7i1I1i43nQh0sGkFE=
Received: from MN2PR12MB3487.namprd12.prod.outlook.com (2603:10b6:208:c7::18)
 by MN2PR12MB3279.namprd12.prod.outlook.com (2603:10b6:208:105::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26; Tue, 30 Jun
 2020 21:32:47 +0000
Received: from MN2PR12MB3487.namprd12.prod.outlook.com
 ([fe80::748b:e3eb:f289:3e48]) by MN2PR12MB3487.namprd12.prod.outlook.com
 ([fe80::748b:e3eb:f289:3e48%3]) with mapi id 15.20.3131.028; Tue, 30 Jun 2020
 21:32:47 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>
Subject: Re: [PATCH V3 0/4] mm/debug_vm_pgtable: Add some more tests
Thread-Topic: [PATCH V3 0/4] mm/debug_vm_pgtable: Add some more tests
Thread-Index: AQHWQsZtxFAI6wDeMUW+Q5gt/DsivKjnJToAgAl5R4CAASfvAA==
Date: Tue, 30 Jun 2020 21:32:47 +0000
Message-ID: <9009877d-6f59-a4d5-1c7c-29719dc50e5c@synopsys.com>
References: <1592192277-8421-1-git-send-email-anshuman.khandual@arm.com>
 <70ddc7dd-b688-b73e-642a-6363178c8cdd@arm.com>
 <1ed72a76-9f20-0169-4c16-c1d8808690eb@arm.com>
In-Reply-To: <1ed72a76-9f20-0169-4c16-c1d8808690eb@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f044252e-0d78-495e-d9a0-08d81d3d2222
x-ms-traffictypediagnostic: MN2PR12MB3279:
x-microsoft-antispam-prvs: <MN2PR12MB3279C859DE8990CC7963925EB66F0@MN2PR12MB3279.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VMnqUjVT7Ki4rsKJv3U6XCR/GVnHuPfbFfP5whpw0T4wOo3kNv/e/MP7EmJ3j8hHHDmF3PEuJQBqTfS8Q8ao4P8NtFNmLPbsnJn9WyKfH7aQA6oFudk7nJtjHbwxWsgaDPFBuUlDgWz+AQbxEmNg5vShHGamPISlkJWMMHz9GmUeF5oFVXzkPQWr8HNLk3khR3L/2w77LYESAxdKuaRI4v9IWzdQd3wZiLL8w1PMaWg1Upk6/GqV0Sk4s6qjyS0+8isVvTxu/cPXX1ulNi0fmE+WXKTRIWyX7rNC4lIq6jGqEGM63A9dWuGI6Sm4Y6ZvqUO7jr81FXFSYRgUt0pVApgHwrZkN8RG2vPabUa4RjhbMSy19T3MYSCokAFANXe+UfXKgePoi+ZM0KZfY46Nzcdr9KygAqEXGAkJL0jAe9//mdZ9Dh9gXAaV4jY3CQKfuq0JOTEmMLHCwsDgKct9JA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3487.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(39860400002)(346002)(136003)(396003)(366004)(6486002)(31686004)(8676002)(76116006)(478600001)(2616005)(8936002)(6506007)(6512007)(186003)(5660300002)(71200400001)(4326008)(316002)(83380400001)(7416002)(66446008)(110136005)(31696002)(36756003)(2906002)(66946007)(54906003)(86362001)(53546011)(66556008)(64756008)(66476007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: hnmCTo+hthQjTR8JJdY5hCgTEkv1D1sZzse5ZVj3HslLEJLW57I98piIdGA9PR29Cnev2QVz8ELFgIjDhG9eGrZ/tSUowRhu8Xg3VPO8nuVLwkkV72A28ZXK9NOO5jxeHhtugYsIB7JFBKxI1kshhrhGPDkI4Py2AGnaXtfrk8FznPeN901w3VpqB7tQRQvbWjI+8exz+Z8nTMovPqVm13dX1QblhFSnkbZmoizh7AwAp2tEbuGMHajGMcdGCn63Omj5UOejhTUD8U+UCq0V1wbS8ud61kIb1PjrVaBsYyEYbxU6QihgkXvK2TMTKUKCPTvl6Ws22JwGZCnQys7CviDc38Kl7ngQKapkHR2UQNN3c7RnSM90Rtt9Aa8IF2qDDHFd/4zm6am32aTzSF+n+WoQpMNQgGJqWRC3CmK+2u/AMUIRTRTaWj9q2oMYCwB1uMEE1Ne+7v43pw3X0EiwuIQ8/VSN9TY+8nPG5/axtybn1eso/tCYlABxM6P2mctz8a7OqM9e62fy3JpecKfDhELSuOMntFIvzAgfZcttP7zlNoSxzWDPXZmRINDyIFqg
x-ms-exchange-transport-forked: True
Content-ID: <81031D7DF0D6A84C8AD447D66154AF9C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3487.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f044252e-0d78-495e-d9a0-08d81d3d2222
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 21:32:47.3776 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nDPqJTE/Vbxn4yVKFv1lwH1z1BFwMoBWVyazGQftROWvkjqj5a0I4C1qsYBkQHpnQZ1B0qhqcG1TOjAtfDo4Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_173313_896183_DB92E2E8 
X-CRM114-Status: GOOD (  20.56  )
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
Cc: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>,
 arcml <linux-snps-arc@lists.infradead.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 "H. Peter  Anvin" <hpa@zytor.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "ziy@nvidia.com" <ziy@nvidia.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>,
 Paul Walmsley <paul.walmsley@synopsys.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "gerald.schaefer@de.ibm.com" <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/29/20 8:53 PM, Anshuman Khandual wrote:
> 
> 
> On 06/24/2020 08:43 AM, Anshuman Khandual wrote:
>>
>>
>> On 06/15/2020 09:07 AM, Anshuman Khandual wrote:
>>> This series adds some more arch page table helper validation tests which
>>> are related to core and advanced memory functions. This also creates a
>>> documentation, enlisting expected semantics for all page table helpers as
>>> suggested by Mike Rapoport previously (https://lkml.org/lkml/2020/1/30/40).
>>>
>>> There are many TRANSPARENT_HUGEPAGE and ARCH_HAS_TRANSPARENT_HUGEPAGE_PUD
>>> ifdefs scattered across the test. But consolidating all the fallback stubs
>>> is not very straight forward because ARCH_HAS_TRANSPARENT_HUGEPAGE_PUD is
>>> not explicitly dependent on ARCH_HAS_TRANSPARENT_HUGEPAGE.
>>>
>>> Tested on arm64, x86 platforms but only build tested on all other enabled
>>> platforms through ARCH_HAS_DEBUG_VM_PGTABLE i.e powerpc, arc, s390. The
>>> following failure on arm64 still exists which was mentioned previously. It
>>> will be fixed with the upcoming THP migration on arm64 enablement series.
>>>
>>> WARNING .... mm/debug_vm_pgtable.c:860 debug_vm_pgtable+0x940/0xa54
>>> WARN_ON(!pmd_present(pmd_mkinvalid(pmd_mkhuge(pmd))))
>>>
>>> This series is based on v5.8-rc1.
>>>
>>> Changes in V3:
>>>
>>> - Replaced HAVE_ARCH_SOFT_DIRTY with MEM_SOFT_DIRTY
>>> - Added HAVE_ARCH_HUGE_VMAP checks in pxx_huge_tests() per Gerald
>>> - Updated documentation for pmd_thp_tests() per Zi Yan
>>> - Replaced READ_ONCE() with huge_ptep_get() per Gerald
>>> - Added pte_mkhuge() and masking with PMD_MASK per Gerald
>>> - Replaced pte_same() with holding pfn check in pxx_swap_tests()
>>> - Added documentation for all (#ifdef #else #endif) per Gerald
>>> - Updated pmd_protnone_tests() per Gerald
>>> - Updated HugeTLB PTE creation in hugetlb_advanced_tests() per Gerald
>>> - Replaced [pmd|pud]_mknotpresent() with [pmd|pud]_mkinvalid()
>>> - Added has_transparent_hugepage() check for PMD and PUD tests
>>> - Added a patch which debug prints all individual tests being executed
>>> - Updated documentation for renamed [pmd|pud]_mkinvalid() helpers
>>
>> Hello Gerald/Christophe/Vineet,
>>
>> It would be really great if you could give this series a quick test
>> on s390/ppc/arc platforms respectively. Thank you.
> 
> Thanks Alexander, Gerald and Christophe for testing this out on s390
> and ppc32 platforms. Probably Vineet and Qian (any other volunteers)
> could help us with arc and ppc64 platforms, which I would appreciate.

Tested-by: Vineet Gupta <vgupta@synopsys.com>

Apologies for the delay in getting to this. Works fine on ARC

I have following enabled:

# CONFIG_DEBUG_VM_RB is not set
# CONFIG_DEBUG_VM_PGFLAGS is not set
CONFIG_DEBUG_VM_PGTABLE=y

And this boots fine

NET: Registered protocol family 17
NET: Registered protocol family 15
debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table
helpers
Warning: unable to open an initial console.
Freeing unused kernel memory: 18840K
This architecture does not have kernel memory protection.
Run /init as init process
  with arguments:
    /init
  with environment:
    HOME=/
    TERM=linux
...
***********************************************************************
			Welcome to ARCLinux
***********************************************************************
[ARCLinux]#

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
