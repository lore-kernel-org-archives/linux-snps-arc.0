Return-Path: <SRS0=Ntev=CS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD92C433E2
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2020 06:09:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D99E207DE
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2020 06:09:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1B25i3uI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="OdWjVyYy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D99E207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sLA1jt8ckxpSeoyPXrcEgDpVEnG2y+6jLGocDvxIqI0=; b=1B25i3uIifxXe+AJB6BWLb1Hv
	Mc2ZRG0L6WggWn+3fic/59rLOT0Q2fXPkKpwSIv+ddX0NE7pZi3ZXBLwc0NfnWITDG31ucooDbbj/
	9J71SZUmfIlDbYAdu7wkA8unaPrLmPtTd7xQCOKXizQyUrB34WcIWUGLk2lzi+6/AC87QAMD6laNy
	csQ74dkkQ2+eaLx5fFfsif8f9ksVov9eTHOUKYnnnTm5vSB68NoBCmK7aS9lmIgM8ihFLhqWzFrWT
	9WNomn00RxLd8/cRktIlBfkV/ymbCBGyqDl5L8yQja0u0YRi+nu5UHXseHA7r+3i3ysLk4kC5o0D/
	Ny0dm6kXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFtHv-0004EF-8d; Wed, 09 Sep 2020 06:08:59 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFtHs-0004DL-EE; Wed, 09 Sep 2020 06:08:57 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08962X2c188595; Wed, 9 Sep 2020 02:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=WqrCyLM1kSjdkdfEaU09HhZXBemvwNp0cxXzy5AGdTc=;
 b=OdWjVyYyeVISErs1wyJfVmJtGw1jtxgHWUSI2mw/7V4oeH1wkFC7jmuzZoGa65enlK22
 m1prurgC/8iMl+q3MIZHNO4GJUo+ygZVOOOc7jvaheiWwyFjBKtivX4k15Fdeqy52J+Z
 1tM7JAq/AhGrbGM+GTYhf+rNccEHH8hj+OOuJHeLi7mjEVIKPMR0rJ5RP0G1DCgK1iZD
 +fqv0RlHUXUebrKRWXf3XdMwO9WKXZjzjY39wrVHmMBQHdWIT4E6sE9PmeP728fJM127
 8RTr31DKNMVKcW2jSwDyQ41IkzSdJWfQv9Yc9MHuXVDyEf3jodYV6EmmTLGqb3jxBz4H bw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33eqtpajas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 02:08:46 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 089688KK030482;
 Wed, 9 Sep 2020 06:08:46 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 33c2a9c90g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 06:08:46 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08968jOD15270742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Sep 2020 06:08:45 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34D2DAC05B;
 Wed,  9 Sep 2020 06:08:45 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3568AC059;
 Wed,  9 Sep 2020 06:08:41 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.95.249])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Sep 2020 06:08:41 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 00/13] mm/debug_vm_pgtable fixes
In-Reply-To: <20200908173906.30fffaa0@thinkpad>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <bb0f3427-e2bd-f713-3ea8-d264be0e690b@arm.com>
 <20200904172647.002113d3@thinkpad> <20200904180115.07ee5f00@thinkpad>
 <20200908173906.30fffaa0@thinkpad>
Date: Wed, 09 Sep 2020 11:38:39 +0530
Message-ID: <87wo134h3s.fsf@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_03:2020-09-08,
 2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 mlxlogscore=956 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_020856_592342_B8A04CBD 
X-CRM114-Status: GOOD (  18.56  )
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 mpe@ellerman.id.au, linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 akpm@linux-foundation.org,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Gerald Schaefer <gerald.schaefer@linux.ibm.com> writes:

> On Fri, 4 Sep 2020 18:01:15 +0200
> Gerald Schaefer <gerald.schaefer@linux.ibm.com> wrote:
>
> [...]
>> 
>> BTW2, a quick test with this change (so far) made the issues on s390
>> go away:
>> 
>> @@ -1069,7 +1074,7 @@ static int __init debug_vm_pgtable(void)
>>         spin_unlock(ptl);
>> 
>>  #ifndef CONFIG_PPC_BOOK3S_64
>> -       hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>> +       hugetlb_advanced_tests(mm, vma, (pte_t *) pmdp, pmd_aligned, vaddr, prot);
>>  #endif
>> 
>>         spin_lock(&mm->page_table_lock);
>> 
>> That would more match the "pte_t pointer" usage for hugetlb code,
>> i.e. just cast a pmd_t pointer to it. Also changed to pmd_aligned,
>> but I think the root cause is the pte_t pointer.
>> 
>> Not entirely sure though if that would really be the correct fix.
>> I somehow lost whatever little track I had about what these tests
>> really want to check, and if that would still be valid with that
>> change.
>
> Uh oh, wasn't aware that this (or some predecessor) already went
> upstream, and broke our debug kernel today.

Not sure i followed the above. Are you finding that s390 kernel crash
after this patch series or the original patchset? As noted in my patch
the hugetlb test is broken and we should fix that. A quick fix is to
comment out that test for s390 too as i have done for PPC64.


-aneesh

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
