Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AB3C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 May 2022 18:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPIiVz4o60OPidZHJJ0ORJpHVtPFUhXM7mJyycqgE0E=; b=lrtmCY1JN+DnFD
	r+keWgaH6gyjgRBfhvR/si35Wk9a9ogSWXo8ZG7EL51tKf/A8B1kEUxmrDvDPJCfNXXCE4Pj78T/S
	R33uwikAk1HEqtvTcC3sjziH3wgDn0xTRHoSK9fejwi/b33kLNwlTRZDeBC/UNA5FpeUpnjvjqo6U
	EbH41grYmp/LB2NAax/iXRP5F+DYglqR+5xkzwEi44bNdUuAiFsKolX2QFFhIHbF7xgcCJyPIFc4J
	u/W1iN54HeAMhG9T54o9Grw5i62Ia9OOatJ13UJX/T2jkCrDPAdGiGiJcvsiMxQSaZafzriugupAe
	XDRS7vP1AGwd6Ju1ZivQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvk9S-007rRB-AP; Mon, 30 May 2022 18:30:02 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5] helo=mx0a-001b2d01.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvk9L-007rM5-21; Mon, 30 May 2022 18:29:56 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24UIM0H1024517;
	Mon, 30 May 2022 18:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=J3XEFiqlO85yR0rlrt+0Ucb3kcbo/uXfSzDk57v+UvI=;
 b=sK08a5JRQZv/pRZYSijJfgzCNWcnImFCMS1209YIqfs77/e2+DqGCKxKlBXdJgBmlco8
 lBUxmyGoc+OLGeLWYBYYR26O3FsvegFajhqOddNqC68LJDao5jNt43AilvT83QFtIU09
 ymysBZ+7yYvC1vU7jJWa8h114YLyiWf0mvxibmh4UXnXn2YZzAzo8CIdHOnqkmFzsY1r
 B+BMFqTlkhhhT5CMeGiBcg1sFURj8WmM61cUPcqTMXIorBEaBI5LTzeO9gIr7HvJfINf
 FIjGzFOAKcrEWvMA8wWWcaPvQrckVA5zWZJHRK+ah1+o9L5zMidx1M1UKYE9RYi3B87E oA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gd34y82yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 May 2022 18:29:40 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24UIQonu010446;
	Mon, 30 May 2022 18:29:39 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gd34y82y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 May 2022 18:29:39 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24UIM2B8011304;
	Mon, 30 May 2022 18:29:37 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06fra.de.ibm.com with ESMTP id 3gbcb7j9t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 May 2022 18:29:37 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24UITYUm39059828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 May 2022 18:29:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12CBA5204F;
	Mon, 30 May 2022 18:29:34 +0000 (GMT)
Received: from [9.171.42.121] (unknown [9.171.42.121])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D9F875204E;
	Mon, 30 May 2022 18:29:30 +0000 (GMT)
Message-ID: <58b163b1-22ec-7634-dcd3-5a0a54adec45@linux.ibm.com>
Date: Mon, 30 May 2022 20:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4] mm: Avoid unnecessary page fault retires on shared
 memory types
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Will Deacon <will@kernel.org>,
        Matt Turner <mattst88@gmail.com>, linux-s390@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
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
 <33fd4731-9765-d78b-bdc3-f8243c98e81f@linux.ibm.com>
 <YpToVpjXmdFqGOpY@xz-m1.local> <YpTqNKMTt8PoA41n@xz-m1.local>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <YpTqNKMTt8PoA41n@xz-m1.local>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BcnqcIajExbqAnGujS-ZUqcYMX48oxDt
X-Proofpoint-ORIG-GUID: iK5fU7K0gq48iA5OulnJebFyFFDVydua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-30_07,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205300096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_112955_298424_78E705FB 
X-CRM114-Status: GOOD (  24.09  )
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



Am 30.05.22 um 18:00 schrieb Peter Xu:
> On Mon, May 30, 2022 at 11:52:54AM -0400, Peter Xu wrote:
>> On Mon, May 30, 2022 at 11:35:10AM +0200, Christian Borntraeger wrote:
>>>
>>>
>>> Am 29.05.22 um 22:33 schrieb Heiko Carstens:
>>> [...]
>>>>
>>>> Guess the patch below on top of your patch is what we want.
>>>> Just for clarification: if gmap is not NULL then the process is a kvm
>>>> process. So, depending on the workload, this optimization makes sense.
>>>>
>>>> diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
>>>> index 4608cc962ecf..e1d40ca341b7 100644
>>>> --- a/arch/s390/mm/fault.c
>>>> +++ b/arch/s390/mm/fault.c
>>>> @@ -436,12 +436,11 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>>>>    	/* The fault is fully completed (including releasing mmap lock) */
>>>>    	if (fault & VM_FAULT_COMPLETED) {
>>>> -		/*
>>>> -		 * Gmap will need the mmap lock again, so retake it.  TODO:
>>>> -		 * only conditionally take the lock when CONFIG_PGSTE set.
>>>> -		 */
>>>> -		mmap_read_lock(mm);
>>>> -		goto out_gmap;
>>>> +		if (gmap) {
>>>> +			mmap_read_lock(mm);
>>>> +			goto out_gmap;
>>>> +		}
>>>> +		goto out;
> 
> Hmm, right after I replied I found "goto out" could be problematic, since
> all s390 callers of do_exception() will assume it an error condition (side
> note: "goto out_gmap" contains one step to clear "fault" to 0).  I'll
> replace this with "return 0" instead if it looks good to both of you.
> 
> I'll wait for a confirmation before reposting.  Thanks,

Yes, that sounds good and thank you for double checking.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
