Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0237DC433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 May 2022 10:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqRAtz25g/azeP71VIUqtR3Bkc/T9LZS5NvlSbJXe20=; b=r+riSwQCUzhm6X
	pX9lLLWcre7Wt18unRg5Mc85VwbZ2yLP7D1GjhzH8x5jhi7LQhqdyYT7HZ3FJEtWsEOZIN87ylA3U
	zGIsloUH60Q0hW/cKrM/uU6lf2Okcxnw+YJRs1WHzvsMkI3UrLGhBhfi8BcGIebtk2uzSsmJ2rVJq
	V63dQnG5dETng1ql0Z+KDIGflB3T+pfMtVCHRZmvd1nL1Z+MF5dRVm4/7PxpPz7RtpVb+27PvIpfX
	zPjUA92nnM8LzDF0dZCGmOpIQ2vxhrieAbkqgu0K44uOr+hARMDmVs0XgPlVqbCHJuIe6YJuT2Tqj
	Te4JzHKhheTAoqQSsF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuXUR-00HPiC-Uh; Fri, 27 May 2022 10:46:43 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuXUN-00HPfp-Gr; Fri, 27 May 2022 10:46:40 +0000
Received: by mail-ej1-x62f.google.com with SMTP id wh22so7995268ejb.7;
        Fri, 27 May 2022 03:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VEAekRrz/FSY4pk4QnV3m6H5QVjhz8BFDYr0EcpVw1E=;
        b=nXTl96gpCDbYy3bbmZHUFxanwBKanpTD5T3ye91nNt0S5DzRS50X+C3V5calou/Tbd
         W3tp+Pa5ui5nyk/J9IilzxqUhKzX+QyGcukjZk0ELfa/RtKrZMaq9i+yE1j0RcYeHGEH
         V+4RtLXDWPxnAymJMfcVpu0JZEZoxenwNXkmgyYKMQXGnN1Ls7NkOSx9TgW4IEazH0HS
         TOy4lNsQjFRd71dz5D/Ux8BGGU+UgNurAc7P2zcBMC8bJFwbS5pJWekOq461oc+DsRDd
         eh87WbfBiCTIu2NxwA+S3LoC7J0WxrnESI1Jt77XHjKjToAke3bka2tT28oXpFfiDYxk
         GFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=VEAekRrz/FSY4pk4QnV3m6H5QVjhz8BFDYr0EcpVw1E=;
        b=B7yvlizxxGdscbxbCZNgrEwpXJj8CN4ylDF+qduTpURDhsERDkxIByYwyivkB/fzS/
         sqs6Cj/+j9EpE6dRWbwtBhPI9Osb/5jyUOfsjNJuFTIhfl7l+hm9Ic+0nyT64nFHwO89
         6/1wukOgpoqTBxbzN8RgCoe5aFxmLmpW3XHhUYnYZRmIJ4IZKqSZ3C16gdckIogoV6ML
         Wve1ucyV6pB7xDwOOoPP9ByrAjWpEoEOn0d6hhZLb2kutwg9Weon6Dj2li8vXmVD6Bfc
         ZImTcPnUHgOCEnz+Af2ElS6ZOQIf4i/7oRgrPyhojJ9RZyCJyAZCa2SKmhjhdhpf0MRu
         JRHA==
X-Gm-Message-State: AOAM531Ie6o5fSn+bBKRBc8uA9/lkbD7VOsjy7LbZ4PDdQWO7sd0JRxj
	B8qdASJdZvWcWsUsqgXdLKk=
X-Google-Smtp-Source: ABdhPJyWn7wVchQLELsEVq6TA/gUzEaBn19VUAXtFTYBInhQr0sSQqMx29HcpQwhBHqmmOM8Z+iT0g==
X-Received: by 2002:a17:907:7baa:b0:6fe:b3dc:2378 with SMTP id ne42-20020a1709077baa00b006feb3dc2378mr30766036ejc.266.1653648395645;
        Fri, 27 May 2022 03:46:35 -0700 (PDT)
Received: from gmail.com (563BA16F.dsl.pool.telekom.hu. [86.59.161.111])
        by smtp.gmail.com with ESMTPSA id i20-20020a17090639d400b006fec1a73e48sm1320742eje.64.2022.05.27.03.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 03:46:34 -0700 (PDT)
Date: Fri, 27 May 2022 12:46:31 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Richard Henderson <rth@twiddle.net>,
	David Hildenbrand <david@redhat.com>,
	Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Michal Simek <monstr@monstr.eu>,
	Russell King <linux@armlinux.org.uk>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	linux-riscv@lists.infradead.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jonas Bonn <jonas@southpole.se>, Will Deacon <will@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	openrisc@lists.librecores.org, linux-s390@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>, linux-m68k@lists.linux-m68k.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>, Chris Zankel <chris@zankel.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Alistair Popple <apopple@nvidia.com>, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Thomas Gleixner <tglx@linutronix.de>, sparclinux@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Stafford Horne <shorne@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Mackerras <paulus@samba.org>,
	linux-arm-kernel@lists.infradead.org,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-xtensa@linux-xtensa.org, Nicholas Piggin <npiggin@gmail.com>,
	linux-sh@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
	Borislav Petkov <bp@alien8.de>, linux-mips@vger.kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>, Helge Deller <deller@gmx.de>,
	Vineet Gupta <vgupta@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-um@lists.infradead.org, linux-alpha@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-ia64@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dinh Nguyen <dinguyen@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-snps-arc@lists.infradead.org, Hugh Dickins <hughd@google.com>,
	Rich Felker <dalias@libc.org>, Andy Lutomirski <luto@kernel.org>,
	Richard Weinberger <richard@nod.at>, linuxppc-dev@lists.ozlabs.org,
	Brian Cain <bcain@quicinc.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	linux-parisc@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <YpCsBwFArieTpvg2@gmail.com>
References: <20220524234531.1949-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220524234531.1949-1-peterx@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_034639_598366_A074BA1C 
X-CRM114-Status: GOOD (  18.98  )
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


* Peter Xu <peterx@redhat.com> wrote:

> This patch provides a ~12% perf boost on my aarch64 test VM with a simple
> program sequentially dirtying 400MB shmem file being mmap()ed and these are
> the time it needs:
>
>   Before: 650.980 ms (+-1.94%)
>   After:  569.396 ms (+-1.38%)

Nice!

>  arch/x86/mm/fault.c           |  4 ++++

Reviewed-by: Ingo Molnar <mingo@kernel.org>

Minor comment typo:

> +		/*
> +		 * We should do the same as VM_FAULT_RETRY, but let's not
> +		 * return -EBUSY since that's not reflecting the reality on
> +		 * what has happened - we've just fully completed a page
> +		 * fault, with the mmap lock released.  Use -EAGAIN to show
> +		 * that we want to take the mmap lock _again_.
> +		 */

s/reflecting the reality on what has happened
 /reflecting the reality of what has happened

>  	ret = handle_mm_fault(vma, address, fault_flags, NULL);
> +
> +	if (ret & VM_FAULT_COMPLETED) {
> +		/*
> +		 * NOTE: it's a pity that we need to retake the lock here
> +		 * to pair with the unlock() in the callers. Ideally we
> +		 * could tell the callers so they do not need to unlock.
> +		 */
> +		mmap_read_lock(mm);
> +		*unlocked = true;
> +		return 0;

Indeed that's a pity - I guess more performance could be gained here, 
especially in highly parallel threaded workloads?

Thanks,

	Ingo

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
