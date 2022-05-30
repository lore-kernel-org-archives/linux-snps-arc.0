Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02C0C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 May 2022 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lh2UmR0b+auOZMwKfuhdrULNApi6lT9iW7QTsLf4Zvs=; b=bthRnyzHqc4ur3
	xjECuTfJIwdMx9kcQC++7NyghQfEYl1zRZzI8wiz2daDRXIny/3wm/1F2F/NAZHOpcC6J+eoOCA6q
	ud1WB9saqDgQARBRO/Gixr8fTs39s3UNHFnAxBzjkeRNmRXRXBCnTb31Rt4xEBNX8Pdz2FwfCVn/U
	lzo4ne/ZJ+zrlktGt7cwf4XT1bJSq3pj9nap4NQccsgsm1Ir+ou6blI/KgJTJAV5Kon6qtd7Y0rTY
	nHQeIU/P8JQIplgbaNrPqYxw4qCa7vB1GDbiQyFlLohm1oWYPjlatMlNveqBhX2JUYVOV3EtY/GYD
	YEkN7xY5NunjV878TxAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvboe-0068k4-RN; Mon, 30 May 2022 09:36:00 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvboZ-0068hn-EE; Mon, 30 May 2022 09:35:56 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24U7eIp4014435;
	Mon, 30 May 2022 09:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZYzW3+GXOL8I0AfUdLsg5MVY8XGCNIfi5dgvNuU6uaU=;
 b=aJRxENPLxPxtJPLPMpZbZB6ZMNv3yb0g75x/iaJw7LwXznLfzcFFd+VhsSYa4DDin1Og
 h3EtEuduOMNJdyWcPGf8Bp6j8HIvSzuOxy/3v6U/k2EZA3ai81b28DfbzQAvyLegWbh1
 6JeeHGepvOgSmc7L30MoUcRt75rv2HhxbCLI6q4veiPA68Sc+ilz6QI6uDVuislGDiwl
 YeuRHaNHYRJKefnUIzx1TjXR7BhIi0QNPJjTPVc/RjJeQKBVl5otsnG/aMJgufq14x+Q
 SfzDBggiNkH6uIogm1bEat+ek9Ln35Wju1AiyyoOtoSpZv9Lk89aLEZ/3hCHMI9fbtzG Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gc21gt23u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 May 2022 09:35:22 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24U8YFtI001535;
	Mon, 30 May 2022 09:35:21 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gc21gt22j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 May 2022 09:35:21 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24U9ZEW5005489;
	Mon, 30 May 2022 09:35:18 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma01fra.de.ibm.com with ESMTP id 3gbcakhu93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 May 2022 09:35:18 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24U9KsWE50921746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 May 2022 09:20:54 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A464A4054;
	Mon, 30 May 2022 09:35:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55577A405B;
	Mon, 30 May 2022 09:35:11 +0000 (GMT)
Received: from [9.171.2.176] (unknown [9.171.2.176])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 30 May 2022 09:35:11 +0000 (GMT)
Message-ID: <33fd4731-9765-d78b-bdc3-f8243c98e81f@linux.ibm.com>
Date: Mon, 30 May 2022 11:35:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4] mm: Avoid unnecessary page fault retires on shared
 memory types
Content-Language: en-US
To: Heiko Carstens <hca@linux.ibm.com>, Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Will Deacon <will@kernel.org>, Matt Turner <mattst88@gmail.com>,
        linux-s390@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
        Brian Cain <bcain@quicinc.com>, Borislav Petkov <bp@alien8.de>,
        linux-alpha@vger.kernel.org, Alistair Popple <apopple@nvidia.com>,
        Jonas Bonn <jonas@southpole.se>, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        linux-snps-arc@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Rich Felker <dalias@libc.org>, sparclinux@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        David Hildenbrand <david@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
        Richard Henderson <rth@twiddle.net>, Guo Ren <guoren@kernel.org>,
        linux-parisc@vger.kernel.org, Andrea Arcangeli <aarcange@redhat.com>,
        Helge Deller <deller@gmx.de>, Al Viro <viro@zeniv.linux.org.uk>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-um@lists.infradead.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        openrisc@lists.librecores.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-hexagon@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
        Stafford Horne <shorne@gmail.com>, linux-csky@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org,
        Paul Mackerras <paulus@samba.org>,
        Alexander Gordeev
 <agordeev@linux.ibm.com>,
        Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        "David S . Miller"
 <davem@davemloft.net>,
        Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>,
        Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        linux-riscv@lists.infradead.org, Max Filippov <jcmvbkbc@gmail.com>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
        x86@kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Richard Weinberger <richard@nod.at>, Ingo Molnar <mingo@kernel.org>
References: <20220527193936.30678-1-peterx@redhat.com>
 <YpPYkzbrQmy4FjrI@osiris>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <YpPYkzbrQmy4FjrI@osiris>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 17H2zOn_Mc5hu2MUIDRxY-AXp5vXE9mJ
X-Proofpoint-ORIG-GUID: M8apowNso6iR-DwO9jx-r0DSHd-NwVxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-30_03,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1011 mlxlogscore=980 lowpriorityscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205300050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_023555_515899_3D6973E3 
X-CRM114-Status: GOOD (  23.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



Am 29.05.22 um 22:33 schrieb Heiko Carstens:
[...]
> 
> Guess the patch below on top of your patch is what we want.
> Just for clarification: if gmap is not NULL then the process is a kvm
> process. So, depending on the workload, this optimization makes sense.
> 
> diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
> index 4608cc962ecf..e1d40ca341b7 100644
> --- a/arch/s390/mm/fault.c
> +++ b/arch/s390/mm/fault.c
> @@ -436,12 +436,11 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>   
>   	/* The fault is fully completed (including releasing mmap lock) */
>   	if (fault & VM_FAULT_COMPLETED) {
> -		/*
> -		 * Gmap will need the mmap lock again, so retake it.  TODO:
> -		 * only conditionally take the lock when CONFIG_PGSTE set.
> -		 */
> -		mmap_read_lock(mm);
> -		goto out_gmap;
> +		if (gmap) {
> +			mmap_read_lock(mm);
> +			goto out_gmap;
> +		}
> +		goto out;

Yes, that makes sense. With that

Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
