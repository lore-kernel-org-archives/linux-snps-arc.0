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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92AFC433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 06:39:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61EB62098B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 06:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YOWtRMvj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="mTpDm9WQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61EB62098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dml9GwmmcODAddoHXxyD7xYG1SwVcLpworp9AheMwSo=; b=YOWtRMvj6KMPGHEDWkkm8m4KQ
	n4k69gbMVcnYCgDzM0x0ukBX1tJ0sPBIdFp4j/Tm05jle7Z2ghyFoBnmwXxOQ8ovh2k04tX7fvqce
	xHlvoMp6fCgacT05WmNVxaM0EfgVQBOuU+ZrE/PE/54pwBPcYi+K7PP3ImmhWOtH3iAAiqQJSnayp
	GyjDV+d5+vCtr4FrnnFMluQKo8mzlIOseipKyj2OnKD8kCA3J1qAavuz0pIso402y694aL6FZvCi9
	v3LWE2UEla3//l9GVSPaGJz3R4eHaggDxNm8li/oEbkD4JAYSplcNo7cIWB+vtJVetjWu4PqU2SMF
	drgB54Pqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCzwf-0005fd-EH; Tue, 01 Sep 2020 06:39:05 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCzwd-0005ew-Ep; Tue, 01 Sep 2020 06:39:04 +0000
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0816DonD109404; Tue, 1 Sep 2020 02:38:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=j3xoZD4KOAjjzgIc1WyabDj3nv6jxkoOPqDehFiqpWk=;
 b=mTpDm9WQ0crtnvhZ4JZX8CFPo9oGWg60b5M49/OpnNUIDrOkhOuSFPTAfTPYJrIvpf5F
 rPC8E2CmdVeBVRoXYUdM6Qhk2rLdRVblTDykHyGXaFZ7zCaGFmc7Ex/qYA/J8IhqyaZW
 bvkMyFK+dg/4QzXU4mwsoSn/xPAIlqZb7eZDrfWFmAep/mqg1Wz/8IXeTtRTzZMFOOJS
 5NFclrhv1Ro73VrKIUhECqOdjlxmCslDJUnUg3h830GqwbznPz1dZ7yujRr8D+7P8OY9
 dDwDoeY2V2o0rC73Z/Q4ctD1XdyuAuvDR5wyDDXT+SRnrlAgiH53D8H32jC12OT6Z1+B Yg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 339gud8jj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 02:38:51 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0816XLAx012719;
 Tue, 1 Sep 2020 06:38:49 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 337e9gu3f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 06:38:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0816clJx26476806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Sep 2020 06:38:47 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CBFDAE045;
 Tue,  1 Sep 2020 06:38:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43172AE056;
 Tue,  1 Sep 2020 06:38:44 +0000 (GMT)
Received: from [9.85.87.76] (unknown [9.85.87.76])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Sep 2020 06:38:44 +0000 (GMT)
Subject: Re: [PATCH v3 09/13] mm/debug_vm_pgtable/locks: Move non page table
 modifying test together
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-10-aneesh.kumar@linux.ibm.com>
 <d0a0a50c-702b-c63a-edf2-263e4e7bd4a5@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <b6240372-4554-8c17-186a-cdc0b0a9089c@linux.ibm.com>
Date: Tue, 1 Sep 2020 12:08:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d0a0a50c-702b-c63a-edf2-263e4e7bd4a5@arm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-01_04:2020-09-01,
 2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2
 priorityscore=1501 adultscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009010054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_023903_625348_49449526 
X-CRM114-Status: GOOD (  33.00  )
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

On 9/1/20 9:11 AM, Anshuman Khandual wrote:
> 
> 
> On 08/27/2020 01:34 PM, Aneesh Kumar K.V wrote:
>> This will help in adding proper locks in a later patch
> 
> It really makes sense to classify these tests here as static and dynamic.
> Static are the ones that test via page table entry values modification
> without changing anything on the actual page table itself. Where as the
> dynamic tests do change the page table. Static tests would probably never
> require any lock synchronization but the dynamic ones will do.
> 
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/debug_vm_pgtable.c | 52 ++++++++++++++++++++++++-------------------
>>   1 file changed, 29 insertions(+), 23 deletions(-)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 0ce5c6a24c5b..78c8af3445ac 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -992,7 +992,7 @@ static int __init debug_vm_pgtable(void)
>>   	p4dp = p4d_alloc(mm, pgdp, vaddr);
>>   	pudp = pud_alloc(mm, p4dp, vaddr);
>>   	pmdp = pmd_alloc(mm, pudp, vaddr);
>> -	ptep = pte_alloc_map_lock(mm, pmdp, vaddr, &ptl);
>> +	ptep = pte_alloc_map(mm, pmdp, vaddr);
>>   
>>   	/*
>>   	 * Save all the page table page addresses as the page table
>> @@ -1012,33 +1012,12 @@ static int __init debug_vm_pgtable(void)
>>   	p4d_basic_tests(p4d_aligned, prot);
>>   	pgd_basic_tests(pgd_aligned, prot);
>>   
>> -	pte_clear_tests(mm, ptep, vaddr);
>> -	pmd_clear_tests(mm, pmdp);
>> -	pud_clear_tests(mm, pudp);
>> -	p4d_clear_tests(mm, p4dp);
>> -	pgd_clear_tests(mm, pgdp);
>> -
>> -	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>> -	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
>> -	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
>> -	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>> -
>>   	pmd_leaf_tests(pmd_aligned, prot);
>>   	pud_leaf_tests(pud_aligned, prot);
>>   
>> -	pmd_huge_tests(pmdp, pmd_aligned, prot);
>> -	pud_huge_tests(pudp, pud_aligned, prot);
>> -
>>   	pte_savedwrite_tests(pte_aligned, protnone);
>>   	pmd_savedwrite_tests(pmd_aligned, protnone);
>>   
>> -	pte_unmap_unlock(ptep, ptl);
>> -
>> -	pmd_populate_tests(mm, pmdp, saved_ptep);
>> -	pud_populate_tests(mm, pudp, saved_pmdp);
>> -	p4d_populate_tests(mm, p4dp, saved_pudp);
>> -	pgd_populate_tests(mm, pgdp, saved_p4dp);
>> -
>>   	pte_special_tests(pte_aligned, prot);
>>   	pte_protnone_tests(pte_aligned, protnone);
>>   	pmd_protnone_tests(pmd_aligned, protnone);
>> @@ -1056,11 +1035,38 @@ static int __init debug_vm_pgtable(void)
>>   	pmd_swap_tests(pmd_aligned, prot);
>>   
>>   	swap_migration_tests();
>> -	hugetlb_basic_tests(pte_aligned, prot);
>>   
>>   	pmd_thp_tests(pmd_aligned, prot);
>>   	pud_thp_tests(pud_aligned, prot);
>>   
>> +	/*
>> +	 * Page table modifying tests
>> +	 */
> 
> In this comment, please do add some more details about how these tests
> need proper locking mechanism unlike the previous static ones. Also add
> a similar comment section for the static tests that dont really change
> page table and need not require corresponding locking mechanism. Both
> comment sections will make this classification clear.
> 
>> +	pte_clear_tests(mm, ptep, vaddr);
>> +	pmd_clear_tests(mm, pmdp);
>> +	pud_clear_tests(mm, pudp);
>> +	p4d_clear_tests(mm, p4dp);
>> +	pgd_clear_tests(mm, pgdp);
>> +
>> +	ptep = pte_alloc_map_lock(mm, pmdp, vaddr, &ptl);
>> +	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>> +	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
>> +	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
>> +	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>> +
>> +
>> +	pmd_huge_tests(pmdp, pmd_aligned, prot);
>> +	pud_huge_tests(pudp, pud_aligned, prot);
>> +
>> +	pte_unmap_unlock(ptep, ptl);
>> +
>> +	pmd_populate_tests(mm, pmdp, saved_ptep);
>> +	pud_populate_tests(mm, pudp, saved_pmdp);
>> +	p4d_populate_tests(mm, p4dp, saved_pudp);
>> +	pgd_populate_tests(mm, pgdp, saved_p4dp);
>> +
>> +	hugetlb_basic_tests(pte_aligned, prot);
> 
> hugetlb_basic_tests() is a non page table modifying static test and
> should be classified accordingly.
> 
>> +
>>   	p4d_free(mm, saved_p4dp);
>>   	pud_free(mm, saved_pudp);
>>   	pmd_free(mm, saved_pmdp);
>>
> 
> Changes till this patch fails to boot on arm64 platform. This should be
> folded with the next patch.
> 
> [   17.080644] ------------[ cut here ]------------
> [   17.081342] kernel BUG at mm/pgtable-generic.c:164!
> [   17.082091] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
> [   17.082977] Modules linked in:
> [   17.083481] CPU: 79 PID: 1 Comm: swapper/0 Tainted: G        W         5.9.0-rc2-00105-g740e72cd6717 #14
> [   17.084998] Hardware name: linux,dummy-virt (DT)
> [   17.085745] pstate: 60400005 (nZCv daif +PAN -UAO BTYPE=--)
> [   17.086645] pc : pgtable_trans_huge_deposit+0x58/0x60
> [   17.087462] lr : debug_vm_pgtable+0x4dc/0x8f0
> [   17.088168] sp : ffff80001219bcf0
> [   17.088710] x29: ffff80001219bcf0 x28: ffff8000114ac000
> [   17.089574] x27: ffff8000114ac000 x26: 0020000000000fd3
> [   17.090431] x25: 0020000081400fd3 x24: fffffe00175c12c0
> [   17.091286] x23: ffff0005df04d1a8 x22: 0000f18d6e035000
> [   17.092143] x21: ffff0005dd790000 x20: ffff0005df18e1a8
> [   17.093003] x19: ffff0005df04cb80 x18: 0000000000000014
> [   17.093859] x17: 00000000b76667d0 x16: 00000000fd4e6611
> [   17.094716] x15: 0000000000000001 x14: 0000000000000002
> [   17.095572] x13: 000000000055d966 x12: fffffe001755e400
> [   17.096429] x11: 0000000000000008 x10: ffff0005fcb6e210
> [   17.097292] x9 : ffff0005fcb6e210 x8 : 0020000081590fd3
> [   17.098149] x7 : ffff0005dd71e0c0 x6 : ffff0005df18e1a8
> [   17.099006] x5 : 0020000081590fd3 x4 : 0020000081590fd3
> [   17.099862] x3 : ffff0005df18e1a8 x2 : fffffe00175c12c0
> [   17.100718] x1 : fffffe00175c1300 x0 : 0000000000000000
> [   17.101583] Call trace:
> [   17.101993]  pgtable_trans_huge_deposit+0x58/0x60
> [   17.102754]  do_one_initcall+0x74/0x1cc
> [   17.103381]  kernel_init_freeable+0x1d0/0x238
> [   17.104089]  kernel_init+0x14/0x118
> [   17.104658]  ret_from_fork+0x10/0x34
> [   17.105251] Code: f9000443 f9000843 f9000822 d65f03c0 (d4210000)
> [   17.106303] ---[ end trace e63471e00f8c147f ]---
> 

IIUC, this should happen even without the series right? This is

	assert_spin_locked(pmd_lockptr(mm, pmdp));


-aneesh

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
