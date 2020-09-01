Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D596C433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 06:25:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E05BA2071B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 06:25:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ETKs6q+R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="LCCu1f/2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E05BA2071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hZTx66RiHs0KApwp0xulr3U42XJmSKZ353+j/IWliAc=; b=ETKs6q+RqJRCmhrfdBBY8391D
	EuQVUMX1g0OBiUQdnxWwp98tc8erZdJ5hL8r7Ffkq5YuHuO45sZV+xWqLD7nuKjiuCjXrwo2vnq9t
	0p9tQryMGad2OTF6bQ6Z/bwSQxIkZZ9SE8L9bVXnnkuvTRdqvY3sZZfO0rqEXQJ7bkzZ6eN/sHtN7
	mmi/Q5xaZy5Wb3G7k7uxWoxdw/RVeNU4P1rUASFzJeRrNew0a7r+dzM7XLPcKgsONOMMEjWCPXswm
	i2XhQnTRHPuHqvElh65TbW5XwrwrsotXsNIlPxLtNCNaKZLqV+WApZCBuwSi2UVyn3wzkJUaG7lIh
	LCimTWwVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCzjs-0003je-5g; Tue, 01 Sep 2020 06:25:52 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCzjq-0003j2-Fm; Tue, 01 Sep 2020 06:25:51 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08163KjH068561; Tue, 1 Sep 2020 02:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kWRGaUdmPOig8wv+fxBxDzCZt/Nev1y+4PedObIDZgY=;
 b=LCCu1f/2m1SBE9woxkeLzE2deVGEBLRI+tHE6xi85De/BzUrcuLF9ALnfDfyKSpoNQvu
 oktELGYQtO26KSskVWlLKccYj2Ke45EmJZWazK98WtUySszoZ3624s0I1KwYUjIP3zW4
 XjzN0zd/qnPQOYtU4RRvh3mUoCMhBaUB5BwO1h+oYh8mW6Ty40ShgJ+pOUVpWswZLGL0
 3Xyk976NBJR0xzI9TIwt5iwo8f/ioT8Qqjk+f4emkpIHodU65zfcdc7jEKlRjE+SIMe2
 RiEUZPaPJ1vDwRMzcGmEsvNq3YUMEzX6eDZRy9P8B8xxYsd4JI5IOdi2a9PvDdYQIZvv jw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 339df3w19u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 02:25:39 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0816D5jf028190;
 Tue, 1 Sep 2020 06:25:37 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 337e9gu33b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 06:25:37 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0816PYt114090542
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Sep 2020 06:25:35 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC830AE051;
 Tue,  1 Sep 2020 06:25:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9018BAE055;
 Tue,  1 Sep 2020 06:25:31 +0000 (GMT)
Received: from [9.85.87.76] (unknown [9.85.87.76])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Sep 2020 06:25:31 +0000 (GMT)
Subject: Re: [PATCH v3 08/13] mm/debug_vm_pgtable/thp: Use page table
 depost/withdraw with THP
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-9-aneesh.kumar@linux.ibm.com>
 <e7877a8d-b433-0cb4-50a7-631de0022c24@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <9beaaf93-b2dd-6d56-7737-9f022760f246@linux.ibm.com>
Date: Tue, 1 Sep 2020 11:55:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e7877a8d-b433-0cb4-50a7-631de0022c24@arm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-01_04:2020-09-01,
 2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009010054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_022550_692814_44B3799D 
X-CRM114-Status: GOOD (  25.65  )
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, mpe@ellerman.id.au, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 9/1/20 8:52 AM, Anshuman Khandual wrote:
> 
> 
> On 08/27/2020 01:34 PM, Aneesh Kumar K.V wrote:
>> Architectures like ppc64 use deposited page table while updating the huge pte
>> entries.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/debug_vm_pgtable.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index f9f6358899a8..0ce5c6a24c5b 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -154,7 +154,7 @@ static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
>>   static void __init pmd_advanced_tests(struct mm_struct *mm,
>>   				      struct vm_area_struct *vma, pmd_t *pmdp,
>>   				      unsigned long pfn, unsigned long vaddr,
>> -				      pgprot_t prot)
>> +				      pgprot_t prot, pgtable_t pgtable)
>>   {
>>   	pmd_t pmd;
>>   
>> @@ -165,6 +165,8 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>>   	/* Align the address wrt HPAGE_PMD_SIZE */
>>   	vaddr = (vaddr & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE;
>>   
>> +	pgtable_trans_huge_deposit(mm, pmdp, pgtable);
>> +
>>   	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>>   	set_pmd_at(mm, vaddr, pmdp, pmd);
>>   	pmdp_set_wrprotect(mm, vaddr, pmdp);
>> @@ -193,6 +195,8 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>>   	pmdp_test_and_clear_young(vma, vaddr, pmdp);
>>   	pmd = READ_ONCE(*pmdp);
>>   	WARN_ON(pmd_young(pmd));
>> +
>> +	pgtable = pgtable_trans_huge_withdraw(mm, pmdp);
> 
> Should the call sites here be wrapped with __HAVE_ARCH_PGTABLE_DEPOSIT and
> __HAVE_ARCH_PGTABLE_WITHDRAW respectively. Though there are generic fallback
> definitions, wondering whether they are indeed essential for all platforms.
> 

No, because Any page table helpers operating on pmd level THP can expect 
a deposited page table.

__HAVE_ARCH_PGTABLE_DEPOSIT indicates that fallback to generic version.

>>   }
>>   
>>   static void __init pmd_leaf_tests(unsigned long pfn, pgprot_t prot)
>> @@ -373,7 +377,7 @@ static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot) { }
>>   static void __init pmd_advanced_tests(struct mm_struct *mm,
>>   				      struct vm_area_struct *vma, pmd_t *pmdp,
>>   				      unsigned long pfn, unsigned long vaddr,
>> -				      pgprot_t prot)
>> +				      pgprot_t prot, pgtable_t pgtable)
>>   {
>>   }
>>   static void __init pud_advanced_tests(struct mm_struct *mm,
>> @@ -1015,7 +1019,7 @@ static int __init debug_vm_pgtable(void)
>>   	pgd_clear_tests(mm, pgdp);
>>   
>>   	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>> -	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot);
>> +	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
>>   	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
>>   	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>>   
>>
> 
> There is a checkpatch.pl warning here.
> 
> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> #7:
> Architectures like ppc64 use deposited page table while updating the huge pte
> 
> total: 0 errors, 1 warnings, 40 lines checked
> 

I will ignore all these, because they are not really important IMHO.

-aneesh

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
