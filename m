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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A2EC433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 06:37:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65FC92087D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 06:37:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TCOpkQ23";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="h4DZwTps"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65FC92087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2zMdFQ9hunrGw2wbNn3gQsjxyBiAJ+A3SPFHamgq3Cc=; b=TCOpkQ23/LqScJGyuRzSAm4p4
	pgGr/fAj+UNo8y1Vl55BpQ1UkOQh1VIuU1a5V2AJOqHulGD3uxKySPxkvXmQ4YYXsPEd3EcgtodMm
	39P8AdfwcVx5D5jrbFh5KfnOYgIHVoM87cof4JS5L4zldmVJmtm6NsEpcPowPTo32SykXrP8UtWBo
	+brO8BVZe5bloF/lctHLyA1/A0U0jC8ezQqleYOxxwYfdkhx67fEDCHcW7YG/Jg2SsL5H6PGfLANw
	9Pwx/k/PBym962e7371u9QQ+PcuvY9L7vYZgKEkM/wrLimFe2WWA9QZVUmS0/oSk1zawNc7NmFRGd
	hF41M1PVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCzvC-0005Ne-6d; Tue, 01 Sep 2020 06:37:34 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCzv9-0005Md-RE; Tue, 01 Sep 2020 06:37:32 +0000
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0816Wfjo069254; Tue, 1 Sep 2020 02:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YtdPI6/fB0GdusGku2/EajXv40zbpjVw/gvBrLw0yes=;
 b=h4DZwTpsAX3Ay4+Zjm8ppYpX8ezKLGhR8I6IQmu98dR4Xl20ACRosTetE4bYXXqxr4iz
 2tJdWjiNDR/zJvQoKjRySL3kcuZSJr9+i1FoSyUk6EjzHo4lCaWwLM5+f/LEYb4UD+bC
 ZaJPhb1OdCuCubv4CsaByP3DaNNhb1Tu9Fe15tk5SFsIt/Sn+ibVjGPZ4of+FQfZNojD
 cRR5bJlH3uJVQ0cuL8xO6SwF5kMGw9jBpj8VVtxgELD2dZioelAFjob44JycSVTgDb+S
 Bi+yHsdzbXCMD2XSVCGgN6VTKmtbKaEe9zGJ6rHApD8IdG0NMklRDweJ6ITRrLINH2A2 iA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 339g8j9hgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 02:37:18 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0816XZY6028712;
 Tue, 1 Sep 2020 06:37:16 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 337e9h1vac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 06:37:16 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0816bEUq34210056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Sep 2020 06:37:14 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED2AAAE053;
 Tue,  1 Sep 2020 06:37:13 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDE6FAE056;
 Tue,  1 Sep 2020 06:37:10 +0000 (GMT)
Received: from [9.85.87.76] (unknown [9.85.87.76])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Sep 2020 06:37:10 +0000 (GMT)
Subject: Re: [PATCH v3 13/13] mm/debug_vm_pgtable: populate a pte entry before
 fetching it
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-14-aneesh.kumar@linux.ibm.com>
 <edc68223-7f8a-13df-68eb-9682f585adb8@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <abef1791-8779-6b34-3178-3bf3ab36d42b@linux.ibm.com>
Date: Tue, 1 Sep 2020 12:07:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <edc68223-7f8a-13df-68eb-9682f585adb8@arm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-01_04:2020-09-01,
 2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009010057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_023731_994970_94F9538B 
X-CRM114-Status: GOOD (  32.67  )
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

On 9/1/20 8:55 AM, Anshuman Khandual wrote:
> 
> 
> On 08/27/2020 01:34 PM, Aneesh Kumar K.V wrote:
>> pte_clear_tests operate on an existing pte entry. Make sure that is not a none
>> pte entry.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/debug_vm_pgtable.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 21329c7d672f..8527ebb75f2c 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -546,7 +546,7 @@ static void __init pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp,
>>   static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep,
>>   				   unsigned long vaddr)
>>   {
>> -	pte_t pte = ptep_get(ptep);
>> +	pte_t pte =  ptep_get_and_clear(mm, vaddr, ptep);
> 
> Seems like ptep_get_and_clear() here just clears the entry in preparation
> for a following set_pte_at() which otherwise would have been a problem on
> ppc64 as you had pointed out earlier i.e set_pte_at() should not update an
> existing valid entry. So the commit message here is bit misleading.
> 

and also fetch the pte value which is used further.


>>   
>>   	pr_debug("Validating PTE clear\n");
>>   	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
>> @@ -944,7 +944,7 @@ static int __init debug_vm_pgtable(void)
>>   	p4d_t *p4dp, *saved_p4dp;
>>   	pud_t *pudp, *saved_pudp;
>>   	pmd_t *pmdp, *saved_pmdp, pmd;
>> -	pte_t *ptep;
>> +	pte_t *ptep, pte;
>>   	pgtable_t saved_ptep;
>>   	pgprot_t prot, protnone;
>>   	phys_addr_t paddr;
>> @@ -1049,6 +1049,8 @@ static int __init debug_vm_pgtable(void)
>>   	 */
>>   
>>   	ptep = pte_alloc_map_lock(mm, pmdp, vaddr, &ptl);
>> +	pte = pfn_pte(pte_aligned, prot);
>> +	set_pte_at(mm, vaddr, ptep, pte);
> 
> Not here, creating and populating an entry must be done in respective
> test functions itself. Besides, this seems bit redundant as well. The
> test pte_clear_tests() with the above change added, already
> 
> - Clears the PTEP entry with ptep_get_and_clear()

and fetch the old value set previously.

> - Creates and populates the PTEP with set_pte_at()
> - Clears with pte_clear()
> - Checks for pte_none()
> 
> If the objective is to clear the PTEP entry before calling set_pte_at(),
> then only the first chunk is required and it should also be merged with
> a previous patch.
> 
> [PATCH v3 07/13] mm/debug_vm_pgtable/set_pte/pmd/pud: Don't use set_*_at to update an existing pte entry
> 
> 
>>   	pte_clear_tests(mm, ptep, vaddr);
>>   	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>>   	pte_unmap_unlock(ptep, ptl);
>>
> 
> There is a checkpatch.pl warning here.
> 
> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> #7:
> pte_clear_tests operate on an existing pte entry. Make sure that is not a none
> 
> total: 0 errors, 1 warnings, 24 lines checked
> 
> There is also a build failure on x86 reported from kernel test robot.
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
