Return-Path: <SRS0=Ntev=CS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C669C433E2
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2020 11:10:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8F51207DE
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2020 11:10:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lgePJYwC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="n0WYgDx4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8F51207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0dgQ1HnhUCr801vmEnsU2/tgLdMAuqbcwsws0cTUDy4=; b=lgePJYwCcpd/ITmWA3SEblo2m
	VKJScJCsdydFZvTrrGEyKZIf9JPOZ1a+XpXUU/FLFeoesF+eLsjqPDtH4OAU9cqfy+FgQ6BQewmU2
	/LgsnyxP8EBmO+wEsjVhia6H4Z5p8IUEAH7sMY22mH8cuw+NsFnCapEWBF2aDOR+YNNF7y0wMnzqt
	45N/aEB7mEoirASuUISHwdtagFqawv4z0G97//RZSUZcdniVbFxgGBe8qW2ongnf04b/5EIoeHoaS
	NBhJuvonjdHHVUuc2CYa2u2edALm7P41wM7ptDMy4MHPFK/5wIwVX/Hwwj9Z3ycpaj6SOxhU4LoKh
	wwUA/Kz8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFxzX-0003uT-7k; Wed, 09 Sep 2020 11:10:19 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFxzV-0003tZ-UF; Wed, 09 Sep 2020 11:10:18 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089B2lLN092037; Wed, 9 Sep 2020 07:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=sCHf8+v1z0J9ln9975zsHf4Oi+ryxNbRmCK/IUzVPlo=;
 b=n0WYgDx4uS2LNO7C+UIA2TZ22DbWM1GT9lLU8O+eGJ8EkiyNNal6g/0ThLsc/C6Rmzfe
 lpgpyDs5PNaThrXdsyVpAm07LWFOOJ62tOp0GvkOg+zng8xQcVRHLOREBohB3ON4UHe8
 GBfS82XxbRWbJ/LSmkLeWlQLMPucHolgawl2glM4CU+v/C82dRTbQqek2bVf+xHHDNu4
 zXm7fgSNIjYOOonwco9THzE2MlHGB8mcmrL82poROQ01AFon74J7fKmcRBRlv0jUBSLj
 Fd8zfv3DF6qXZYHkfBzceUAEgcW/fKsVWu4MgKMfdd4N7TSoNB3hqFKG+iFK/UHma7f1 5w== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33ewhcgtxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 07:10:08 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 089B8GXS032086;
 Wed, 9 Sep 2020 11:10:06 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 33cm5hj7b0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 11:10:06 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 089BA3eJ64881038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Sep 2020 11:10:03 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7C8EAE055;
 Wed,  9 Sep 2020 11:10:03 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33122AE053;
 Wed,  9 Sep 2020 11:10:03 +0000 (GMT)
Received: from thinkpad (unknown [9.171.79.102])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  9 Sep 2020 11:10:03 +0000 (GMT)
Date: Wed, 9 Sep 2020 13:10:01 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 00/13] mm/debug_vm_pgtable fixes
Message-ID: <20200909131001.7b733b3e@thinkpad>
In-Reply-To: <ac85fd77-bca1-3318-de0e-eea40558cbbd@arm.com>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <bb0f3427-e2bd-f713-3ea8-d264be0e690b@arm.com>
 <20200904172647.002113d3@thinkpad>
 <20200904180115.07ee5f00@thinkpad>
 <ac85fd77-bca1-3318-de0e-eea40558cbbd@arm.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_06:2020-09-08,
 2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 mlxlogscore=627 bulkscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009090095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_071018_038466_6B4DAA9D 
X-CRM114-Status: GOOD (  21.07  )
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

On Wed, 9 Sep 2020 13:45:48 +0530
Anshuman Khandual <anshuman.khandual@arm.com> wrote:

[...]
> > 
> > That would more match the "pte_t pointer" usage for hugetlb code,
> > i.e. just cast a pmd_t pointer to it. Also changed to pmd_aligned,
> > but I think the root cause is the pte_t pointer.
> 
> Ideally, the pte_t pointer used here should be from huge_pte_alloc()
> not from pte_alloc_map_lock() as the case currently.

Ah, good point. I assumed that this would also always return casted
pmd etc. pointers, and never pte pointers. Unfortunately, that doesn't
seem to be true for all architectures, e.g. ia64, parisc, (some) powerpc,
where they really do a pte_alloc_map() for some reason.

I guess that means you cannot simply cast the pmd pointer, as suggested,
although I really do not understand how any architecture can work with
real ptes for hugepages. But that's fair, s390 also does some things that
nobody would expect or understand for other architectures...

So, for using huge_pte_alloc() you'd also need some size, maybe
iterating over hstates with for_each_hstate() could be an option,
if they are already initialized at that point. Then you have the
size(s) with huge_page_size(hstate) and can actually call the
hugetlb tests for all supported sizes, and with proper pointer
from huge_pte_alloc().

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
