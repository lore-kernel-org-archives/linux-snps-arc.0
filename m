Return-Path: <SRS0=FVqi=CR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33256C433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Sep 2020 16:29:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB922206B8
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Sep 2020 16:29:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jpiAQPTT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Hsc7CUzP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB922206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O/uXj/hxpVBwr8pkUglxD407fQj7gk0INW5f7TA9QwY=; b=jpiAQPTTHQZmTNVixffpOS2ut
	eqb0c1xbJcIQG5ywinBML/X6isCK25GowwS+/D7ZY5QKtzASwfZZ8jnJ93vsitsmhbL2w/5KL4hem
	jhR1rKBV2Q2p2FqYXj+d+sVpRgR7QpQooqLFNxVh1vtXQBA8FPI3hlFKJPHEFdXlZTbJHtB7rI7eo
	vB2kyrIOjqsUeQovuAt4TrvGWOo/Luqb1IwQRZekQgpcrpz6tITKwmli6+rvEOqwWdyb/Lh0FY29P
	3Xyrfl4Ayfl+lYTCw5OXfLe7NY4CdnILa8XSQWx5Qtz4xgkkG4W9JzU3yZW79DFrrCs82363FN1RQ
	sZ40L4zWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFfiV-0006NR-Dv; Tue, 08 Sep 2020 15:39:31 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFfiT-0006MM-EN; Tue, 08 Sep 2020 15:39:30 +0000
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 088FWpHb171716; Tue, 8 Sep 2020 11:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZE+1EhFZPApaQ3SkZgij3eeFLeg8ZYl8QKvXMOibk88=;
 b=Hsc7CUzPcbzMB449ZNIyiwu7auIacUK/KbK57QmebxNxhUTWMsMygOWglxZtDXj+0i1y
 XFXY0irNoWjh4N6uPI59bbRUPSGcYoLJoYvnEm3IYo8E5MNPxj200xVqAqfLFukbblef
 uqyobHXmKZZoCfNzPOu562aVBVbHkmLnfTdo8+bqck8tZ99zVFcT0ZvJcOQ4SCgQQayF
 7DMEaQFZe2eZSI8PPdKcl4JON2SkPif+vx2CaGvcO3+OvnKrbAhlg5zakqh5hsyraTow
 Mpm6JF2rPq+tCf7fr9oiOMziws4rejNcMEUcXi+4qzVkD6/d1NtTQAoUue0+4KnUvZuA Iw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33ecjvre0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 11:39:13 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 088FcDbR023147;
 Tue, 8 Sep 2020 15:39:11 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 33c2a8bkja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 15:39:11 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 088Fd8vA32965056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Sep 2020 15:39:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 687F611C05C;
 Tue,  8 Sep 2020 15:39:08 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7B1F11C04A;
 Tue,  8 Sep 2020 15:39:07 +0000 (GMT)
Received: from thinkpad (unknown [9.171.25.197])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Sep 2020 15:39:07 +0000 (GMT)
Date: Tue, 8 Sep 2020 17:39:06 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 00/13] mm/debug_vm_pgtable fixes
Message-ID: <20200908173906.30fffaa0@thinkpad>
In-Reply-To: <20200904180115.07ee5f00@thinkpad>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <bb0f3427-e2bd-f713-3ea8-d264be0e690b@arm.com>
 <20200904172647.002113d3@thinkpad>
 <20200904180115.07ee5f00@thinkpad>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-08_08:2020-09-08,
 2020-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 spamscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009080148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_113929_611943_B23E02B9 
X-CRM114-Status: GOOD (  27.67  )
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
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, mpe@ellerman.id.au,
 akpm@linux-foundation.org,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, 4 Sep 2020 18:01:15 +0200
Gerald Schaefer <gerald.schaefer@linux.ibm.com> wrote:

[...]
> 
> BTW2, a quick test with this change (so far) made the issues on s390
> go away:
> 
> @@ -1069,7 +1074,7 @@ static int __init debug_vm_pgtable(void)
>         spin_unlock(ptl);
> 
>  #ifndef CONFIG_PPC_BOOK3S_64
> -       hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> +       hugetlb_advanced_tests(mm, vma, (pte_t *) pmdp, pmd_aligned, vaddr, prot);
>  #endif
> 
>         spin_lock(&mm->page_table_lock);
> 
> That would more match the "pte_t pointer" usage for hugetlb code,
> i.e. just cast a pmd_t pointer to it. Also changed to pmd_aligned,
> but I think the root cause is the pte_t pointer.
> 
> Not entirely sure though if that would really be the correct fix.
> I somehow lost whatever little track I had about what these tests
> really want to check, and if that would still be valid with that
> change.

Uh oh, wasn't aware that this (or some predecessor) already went
upstream, and broke our debug kernel today.

I found out now what goes (horribly) wrong on s390, see below for
more details. In short, using hugetlb primitives with ptep pointers
that do _not_ point to a pmd or pud entry will not work on s390.
It also seems to make no sense to verify / test such a thing in general,
as it would also be a severe bug if any kernel code would do that.
After all, with hugepages, there are no pte tables, only pmd etc.
tables.

My change above would fix the issue for s390, but I can still not
completely judge if that would not break other things for your
tests. In general, for normal kernel code, much of what you do would
be very broken, but I guess your tests are doing such "special" things
because they can. E.g. because they operate on some "sandbox" mm
and page tables, and you also do not need properly populated page
tables for some exit / free cleanup, you just throw them away
explicitly with pXd_free at the end. So it might just be "the right
thing" to pass a casted pmd pointer to hugetlb_advanced_tests(),
to simulate and test (proper) usage of the hugetlb primitives.
I also see no other way to make this work for s390, than using a
proper pmd/pud pointer. If not possible, please add us to the
#ifndef.

So, for all those interested, here is what goes wrong on s390.
huge_ptep_get_and_clear() uses the "idte" instruction for the
clearing (and TLB invalidation) part. That instruction expects
a "region or segment table" origin, which is a pmd/pud/p4d/pgd,
but not a pte table. Even worse, when we calculate the table
origin from the given ptep (which *should* not point to a pte),
due to different table sizes for pte / pXd tables, we end up
at some place before the given pte table.

The "idte" instruction also gets the virtual address, and does
corresponding index addition to the given table origin. Depending
on the pmd_index we now end up either within the pte table again,
in which case we see a panic because idte complains about seeing
a pte value. If we are unlucky, then we end up outside the pte
table, and depending on the content of that memory location, idte
might succeed, effectively corrupting that memory.

That explains why we only see the panic sometimes, depending on
random vaddr, other symptoms other times, and probably completely
silent memory corruption for the rest...

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
