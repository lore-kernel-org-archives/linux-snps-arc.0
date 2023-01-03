Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B665C3DA7D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Jan 2023 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Jao15peMDSrmRO+0FQL8KweUaUZdrJDMPpAlzEG58g=; b=dvdx2HUYx9Iv1b
	5t38gG0KsWqDQcFtSayixyq+stiGmEZCMq35UflrKKa2JULhImcbPDsEh5f/ssSxQBKsTO8eQoM6D
	4QT9btKNbX2ZyDp4dsMf0janCyXHL5vFmF1lFwyxZ5ouOBDG7Y+7KqsO3Ehf2xw70/YOqIxGj/wxh
	BB7SAyZNuJkvsH4xOqRd+xZSw3cRIxm80K6JqKVMCHTzmNrWlbMlaDKaWaglufvSKpj5gzkr/ZCu8
	ObZIs0y96W5QsQTor/sWydXQGY5skTgBNVgvZ19jYTkH/N8RkW7YdPaIpcpcmnBe5erg5yfyS4x4p
	GsE8tjvwet3saF3JcCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCeZs-000j4k-VA; Tue, 03 Jan 2023 10:31:29 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCeAr-000bz2-Hj; Tue, 03 Jan 2023 10:05:39 +0000
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3037hcSP015068;
	Tue, 3 Jan 2023 10:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=dMHVtFosqWThDyY5SftMoOPjqDlLusCntZAFShOz2mY=;
 b=KQ8gHflm592WlbRAgwdQmZyTRlHDWh9M3ZAPFV+EMcsIOXJ461PiMpCp5cUVt9BL1e6j
 zqllDR5Fb/gxAm41jRkoRbn7AyAsUGSUMf7knMuu/spo09IOUdLrV2GM4nc+OlkQbkE7
 IJzG4uvffHGaWIteJBPi+B7FHAqQUQN3AtsThHUAZCqJQIQDHXbgZuAeeqSo9WeDmPJj
 eEQnkInKW+xzSa/aKKaqEDcmxJK5+xsGNpjiHiXPohV0tqVjzNS2xI1QFRZv2I9KIldN
 wQ9mkHaOJ5pKdofCP9qAqPj5s8umAAK+tXrV9dZ+20maLxpkr4T38HkHLw9ablzK3SFk /w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvbt6xp9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jan 2023 10:02:20 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3039LwDp027251;
	Tue, 3 Jan 2023 10:02:19 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvbt6xp8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jan 2023 10:02:19 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 302CL8aj017444;
	Tue, 3 Jan 2023 10:02:16 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3mtcq6tmts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jan 2023 10:02:16 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 303A2EKB49938694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Jan 2023 10:02:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B14420071;
	Tue,  3 Jan 2023 10:02:14 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F230A20069;
	Tue,  3 Jan 2023 10:02:12 +0000 (GMT)
Received: from osiris (unknown [9.171.83.23])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  3 Jan 2023 10:02:12 +0000 (GMT)
Date: Tue, 3 Jan 2023 11:02:09 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Arnd Bergmann <arnd@arndb.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3] arch: rename all internal names __xchg to __arch_xchg
Message-ID: <Y7P9IcR7/jgYWMcq@osiris>
References: <202212300642.6pdgegGO-lkp@intel.com>
 <20221230141552.128508-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221230141552.128508-1-andrzej.hajda@intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JUKgavQnlJumrUvi-CztUW8Qob9IZFEg
X-Proofpoint-GUID: 0ZquoQ4B0WHjt8os5pwnxRNooiQSYFH8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_01,2023-01-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=712 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301030088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_020537_643434_26937A87 
X-CRM114-Status: GOOD (  21.05  )
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

On Fri, Dec 30, 2022 at 03:15:52PM +0100, Andrzej Hajda wrote:
> __xchg will be used for non-atomic xchg macro.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: squashed all arch patches into one
> v3: fixed alpha/xchg_local, thx to lkp@intel.com
> ---
...
>  arch/s390/include/asm/cmpxchg.h      | 4 ++--
> diff --git a/arch/s390/include/asm/cmpxchg.h b/arch/s390/include/asm/cmpxchg.h
> index 84c3f0d576c5b1..efc16f4aac8643 100644
> --- a/arch/s390/include/asm/cmpxchg.h
> +++ b/arch/s390/include/asm/cmpxchg.h
> @@ -14,7 +14,7 @@
>  
>  void __xchg_called_with_bad_pointer(void);
>  
> -static __always_inline unsigned long __xchg(unsigned long x,
> +static __always_inline unsigned long __arch_xchg(unsigned long x,
>  					    unsigned long address, int size)

Please adjust the alignment of the second line.

> @@ -77,7 +77,7 @@ static __always_inline unsigned long __xchg(unsigned long x,
>  	__typeof__(*(ptr)) __ret;					\
>  									\
>  	__ret = (__typeof__(*(ptr)))					\
> -		__xchg((unsigned long)(x), (unsigned long)(ptr),	\
> +		__arch_xchg((unsigned long)(x), (unsigned long)(ptr),	\
>  		       sizeof(*(ptr)));					\

Same here.

The same is true for a couple of other architectures - not sure if
they care however.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
