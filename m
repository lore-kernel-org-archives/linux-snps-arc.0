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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AEEC433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 06:21:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D534D2071B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 06:21:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zRZY5lF3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="KAHbI1Tb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D534D2071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SDqqHwrC+1ugTsvHOt5834T9Cm7dCdOwpSd0ikfNhuk=; b=zRZY5lF3f4vBMdstSTT36/25F
	JCSSTCDPsfy/tehTC7jUzWBYp4dc6dW4mwLVgSp4iPgoJQkaT1gNF8xyYTw5IIw06aDGxwFcUQT60
	fPTp/ylCtR8u9W9/e2cNMkj8tvnyNKEIXKzd+WrPN4g2Dc026/gVS6V4yoiaGfTxrX4TCsh6L5BcM
	Jb6wFpD1gCoKVuX1g/JI1gDH0LD/DxPEaen/B4fJEUWFfT2PkCQGTy8Py8tEn2KsvRn8FnOMycui+
	7Cz+tdjyIh7vnHGMt/Jvcgm1kuufxl1N0FooCvYMHd1ZYNZABfPjfcPsRsj3O5qVInb4bCARwYgG1
	n/Q82xIqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCzfe-00030S-6M; Tue, 01 Sep 2020 06:21:30 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCzfb-0002yu-Ql; Tue, 01 Sep 2020 06:21:28 +0000
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08162CVA067043; Tue, 1 Sep 2020 02:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=O9f/fWuu4G33f2RLfgee9yynMofZfxi/ALW4qnOIOxg=;
 b=KAHbI1Tbo7Z9LVWhKUalyBUAJdbZ3pl65VUG3feMBk0C6deQeXSm4v+TofciGpWXYx4q
 i9MovCFEywQ63YNuMHy0TfuLywq/lN8oq+wQuwnFzwaEv4+05Zd3QOlVVwTSSUoPrtkO
 /hpTfLXIlPVk0yMsq4unwlDOwAPG62lFJzn/5EG8RF6yKwzG0oRm6NuZjXVvOebZHlr5
 A/wRUG1+YtlrpXAhjisrw6HidxATAwlNQpp2X1ZHbNxreZAmW5ra5sShgd3rpKOrXWkA
 9/GpnW98r607bi7NoUBB5Te40un7fPrVKCGL0FuxXJW3w236HSUV7IVRUheQrKaclheA Pg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 339f8qjcgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 02:21:13 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0816Dcg1023854;
 Tue, 1 Sep 2020 06:21:12 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 337en831s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 06:21:11 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0816L9Ir15729146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Sep 2020 06:21:09 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1413AE053;
 Tue,  1 Sep 2020 06:21:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55346AE051;
 Tue,  1 Sep 2020 06:21:06 +0000 (GMT)
Received: from [9.85.87.76] (unknown [9.85.87.76])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Sep 2020 06:21:06 +0000 (GMT)
Subject: Re: [PATCH v3 03/13] mm/debug_vm_pgtable/ppc64: Avoid setting top
 bits in radom value
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-4-aneesh.kumar@linux.ibm.com>
 <3a0b0101-e6ec-26c5-e104-5b0bb95c3e51@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <1a8abe92-032b-f60f-1df1-52bb409b35a3@linux.ibm.com>
Date: Tue, 1 Sep 2020 11:51:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3a0b0101-e6ec-26c5-e104-5b0bb95c3e51@arm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-01_04:2020-09-01,
 2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=994
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009010049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_022127_921002_7B7971BF 
X-CRM114-Status: GOOD (  31.70  )
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

On 9/1/20 8:45 AM, Anshuman Khandual wrote:
> 
> 
> On 08/27/2020 01:34 PM, Aneesh Kumar K.V wrote:
>> ppc64 use bit 62 to indicate a pte entry (_PAGE_PTE). Avoid setting that bit in
>> random value.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/debug_vm_pgtable.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 086309fb9b6f..bbf9df0e64c6 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -44,10 +44,17 @@
>>    * entry type. But these bits might affect the ability to clear entries with
>>    * pxx_clear() because of how dynamic page table folding works on s390. So
>>    * while loading up the entries do not change the lower 4 bits. It does not
>> - * have affect any other platform.
>> + * have affect any other platform. Also avoid the 62nd bit on ppc64 that is
>> + * used to mark a pte entry.
>>    */
>> -#define S390_MASK_BITS	4
>> -#define RANDOM_ORVALUE	GENMASK(BITS_PER_LONG - 1, S390_MASK_BITS)
>> +#define S390_SKIP_MASK		GENMASK(3, 0)
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +#define PPC64_SKIP_MASK		GENMASK(62, 62)
>> +#else
>> +#define PPC64_SKIP_MASK		0x0
>> +#endif
> 
> Please drop the #ifdef CONFIG_PPC_BOOK3S_64 here. We already accommodate skip
> bits for a s390 platform requirement and can also do so for ppc64 as well. As
> mentioned before, please avoid adding any platform specific constructs in the
> test.
> 


that is needed so that it can be built on 32 bit architectures.I did 
face build errors with arch-linux

>> +#define ARCH_SKIP_MASK (S390_SKIP_MASK | PPC64_SKIP_MASK)
>> +#define RANDOM_ORVALUE (GENMASK(BITS_PER_LONG - 1, 0) & ~ARCH_SKIP_MASK)
>>   #define RANDOM_NZVALUE	GENMASK(7, 0)
> 
> Please fix the alignments here. Feel free to consider following changes after
> this patch.
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 122416464e0f..f969031152bb 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -48,14 +48,11 @@
>    * have affect any other platform. Also avoid the 62nd bit on ppc64 that is
>    * used to mark a pte entry.
>    */
> -#define S390_SKIP_MASK         GENMASK(3, 0)
> -#ifdef CONFIG_PPC_BOOK3S_64
> -#define PPC64_SKIP_MASK                GENMASK(62, 62)
> -#else
> -#define PPC64_SKIP_MASK                0x0
> -#endif
> -#define ARCH_SKIP_MASK (S390_SKIP_MASK | PPC64_SKIP_MASK)
> -#define RANDOM_ORVALUE (GENMASK(BITS_PER_LONG - 1, 0) & ~ARCH_SKIP_MASK)
> +#define S390_SKIP_MASK GENMASK(3, 0)
> +#define PPC64_SKIP_MASK        GENMASK(62, 62)
> +#define ARCH_SKIP_MASK (S390_SKIP_MASK | PPC64_SKIP_MASK)
> +#define RANDOM_ORVALUE (GENMASK(BITS_PER_LONG - 1, 0) & ~ARCH_SKIP_MASK)
> +
>   #define RANDOM_NZVALUE GENMASK(7, 0)
>   
>>   
>>   static void __init pte_basic_tests(unsigned long pfn, pgprot_t prot)
>>
> 
> Besides, there is also one checkpatch.pl warning here.
> 
> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> #7:
> ppc64 use bit 62 to indicate a pte entry (_PAGE_PTE). Avoid setting that bit in
> 
> total: 0 errors, 1 warnings, 20 lines checked
> 


These warnings are not valid. They are mostly long lines (upto 100) . or 
some details mentioned in the () as above.

-aneesh

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
