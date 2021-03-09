Return-Path: <SRS0=4gPu=IH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A59C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  9 Mar 2021 10:12:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E4BF6525B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  9 Mar 2021 10:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E4BF6525B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fxfPwoWdY7VjW4IK3wN2BdlmfmoB0ZrYtpbpRXOsAn0=; b=OjhW0+yi57GSEQimeeYrLVHRr
	/rkq/644K9HbfImr8Ae/UrRXDiQL2SCP85aQVyYjyaetmixnNjXGC4UNB0EG5BA7e3yfU2Xb4tddb
	3umV/Ji11/CGo1Aq0ZanmZ0ufwQ/BIwH1s9Kqibl4ECO3uH6FNoeHIpaNK1a9vQpgl8/Hoc2Zdv9b
	9VHKOzCmHd6tJ3QAtqJPr30RvCG1nQTGfXgGHBx8VKKvC9dUUXOJpSY4NIrXzxXzpK29I3id8hQrP
	hBnof5spykIbY9rMRwDRS7nfWHlUccsFQspZGwgSntOJv9JlGIdamBywBSGASSGUul2G4/S3RUKAN
	OBMA17+8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJZM9-004BIC-Tz; Tue, 09 Mar 2021 10:12:50 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJZM5-004BFb-6k; Tue, 09 Mar 2021 10:12:47 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129A3Tn8126439; Tue, 9 Mar 2021 05:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=VLXXREKt32lTGhx5VSlCqI/r3ad7QYovQBLESPlSg1g=;
 b=JHoTDLey4dg5DpogyA3aPdDBsgtJ9oQbVxU0yNqHH6AxCs0k/hLqbURN9Pp05W9dCjIV
 oJ3IQOmpnHGG/+L0cyuvbVIVjqYPp4JhtXdlNoJNniwZtAR1tkcz/SbR3hpJUPhzVNjt
 Tvi/cR7xZXoRqWMR9g5Fri5UwreL+QHDXQyvSXCCG4F7b7xcBaUtc9pok+hBvRJumV8O
 O67FUpPgItTWV5Q3smsqawuz2HxZNmYtl9TT3HRmU7KZDIm97OxDHREAp3hOYIQ/zlYQ
 RScq9gC3nQkMxAe2cugXHyC9dedDDRUmoojbo3F3j6rNOgbx4OYe0uxkJEJD5yj1Hj3m AQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3762wqy07d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 05:12:33 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1299rlpi009357;
 Tue, 9 Mar 2021 10:12:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3741c8jmw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 10:12:31 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 129ACSuw48300516
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Mar 2021 10:12:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BADF8A405F;
 Tue,  9 Mar 2021 10:12:28 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A6C8A4065;
 Tue,  9 Mar 2021 10:12:28 +0000 (GMT)
Received: from osiris (unknown [9.171.41.99])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  9 Mar 2021 10:12:28 +0000 (GMT)
Date: Tue, 9 Mar 2021 11:12:26 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] mm: some config cleanups
Message-ID: <YEdKCvxlFQa4noI8@osiris>
References: <1615278790-18053-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615278790-18053-1-git-send-email-anshuman.khandual@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_09:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1011
 mlxlogscore=465 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_101246_064959_4BB392B1 
X-CRM114-Status: GOOD (  18.00  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Mar 09, 2021 at 02:03:04PM +0530, Anshuman Khandual wrote:
> This series contains config cleanup patches which reduces code duplication
> across platforms and also improves maintainability. There is no functional
> change intended with this series. This has been boot tested on arm64 but
> only build tested on some other platforms.
> 
> This applies on 5.12-rc2
> 
> Cc: x86@kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-sh@vger.kernel.org
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> 
> Anshuman Khandual (6):
>   mm: Generalize ARCH_HAS_CACHE_LINE_SIZE
>   mm: Generalize SYS_SUPPORTS_HUGETLBFS (rename as ARCH_SUPPORTS_HUGETLBFS)
>   mm: Generalize ARCH_ENABLE_MEMORY_[HOTPLUG|HOTREMOVE]
>   mm: Drop redundant ARCH_ENABLE_[HUGEPAGE|THP]_MIGRATION
>   mm: Drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK
>   mm: Drop redundant HAVE_ARCH_TRANSPARENT_HUGEPAGE
> 
>  arch/arc/Kconfig                       |  9 ++------
>  arch/arm/Kconfig                       | 10 ++-------
>  arch/arm64/Kconfig                     | 30 ++++++--------------------
>  arch/ia64/Kconfig                      |  8 ++-----
>  arch/mips/Kconfig                      |  6 +-----
>  arch/parisc/Kconfig                    |  5 +----
>  arch/powerpc/Kconfig                   | 11 ++--------
>  arch/powerpc/platforms/Kconfig.cputype | 16 +++++---------
>  arch/riscv/Kconfig                     |  5 +----
>  arch/s390/Kconfig                      | 12 +++--------
>  arch/sh/Kconfig                        |  7 +++---
>  arch/sh/mm/Kconfig                     |  8 -------
>  arch/x86/Kconfig                       | 29 ++++++-------------------
>  fs/Kconfig                             |  5 ++++-
>  mm/Kconfig                             |  9 ++++++++
>  15 files changed, 48 insertions(+), 122 deletions(-)

for the s390 bits:
Acked-by: Heiko Carstens <hca@linux.ibm.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
