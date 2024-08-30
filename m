Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFF1CA0ECC
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Aug 2024 01:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZCK2QQ4yR570cvkezPwti5nbh73slqxL+p4OkjyqbKs=; b=w9/IwkohWJIVyY
	alZMBKY9sCb+08hK9ESPmKnoyWYCPGEG+V7fEAv9WSmoAbke8ixtUjERLbF8ZMfqt0Rhek52OFTbD
	XQ4ZEVEvezE1A6W8XxMAN6uRTga07Bxn/ct9FDuphfpwOHOonrVFdWawgDJiUHV+TdxM7b1wDJylw
	B2whKokpzkesG9StIlbXogZJqKn51x7Y9CvT43aY028ac8mH07RhHJruov1yvKkImZGay/CeOyXC4
	186KNiNG9fIu9SRphYKJlm/USPW8xbgR2YgHZPtusDDlDeKzGge+XYhPLe5gJrfRjASQ1zOu2qURA
	Yeooo0Zf+XF8myGKjk2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjqAj-00000004FsM-09pD;
	Fri, 30 Aug 2024 01:11:29 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjqAd-00000004FpQ-0TkG
	for linux-snps-arc@lists.infradead.org;
	Fri, 30 Aug 2024 01:11:26 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-714262f1bb4so1066363b3a.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 29 Aug 2024 18:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724980282; x=1725585082; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tq7LnGnCY31W8p33KfA4sDocR34ueQ+QZ1h3PRF4p6w=;
        b=BTDt43WXhUngBr41IjMlZCNTeXj8GKOL7q2z9KyF+1JvUk8+P+YZ5sSJU7DaeCuDkA
         ahUEInTLzft5vyGVEPQW1urzOGdDEk/0VT1dElD5CPdAkhlQzI1mehgUHK0lU5TPK2Q2
         EtUzRFO/MeJyCY1/0iQcOFQ+z9iiLK8Tejng+mjMN4lrOyzYlHYd+2FSlVrutPkcDCAq
         1JyNbDRKlN+VMp5oKqPJ/D043LDs9KnYDACwADHZ8fg+CnPhk5jtSQLKBz8yHHlJDYZX
         15s5cuqntyu3H6BpUTfoE+ndfNe1pH1CQRB7I147wx4RDn6ZJeeaYbx5ACbAlDAzu6jK
         GOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724980282; x=1725585082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tq7LnGnCY31W8p33KfA4sDocR34ueQ+QZ1h3PRF4p6w=;
        b=ZUppcs1bGyi+ovdOrhw3leztV3UsENZXjeqbS2+qyzjSHtFS33hrHWgMhl9onBmhrf
         11w8PZojc6E8Fut0kRHXp6bY+Lvcop4CbU5iBNge1//gll9wdJUPzCp2qvQTxWuDy/nf
         6nrhSF2EXdtyrQWCUI9CD5Kx4fvvSB4SveC2kdsTwyOdrcrX8PqGppaKtoJKW2e15GTL
         d/2J8guFTy1K1ZGRvI/3ZGJsiR0h93wskvZApGHrWD3k5m5j8HdMNm/OwJlXvjccfKkG
         n23YykIut+FI19FITHKgeaZSTkZ7UNBskghqaa9GuFV7wZ+/kTQumfSOGNlmn9EY/c5z
         xp0w==
X-Forwarded-Encrypted: i=1; AJvYcCV0G6jcwwQM0NLfAGr9dvPC7ift9OCGiZ88oGHRrh7pFacvj8AzEN582jtGx+Pr0NqJd1T0kHB1rWWMN2SiZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yya2r/z9AfA8LaQbLTR00BRRtpstLkN0pc+aOEjEdBPAOijr8oy
	x2CCqGL8UHEewfuaqP6jV8WEYja+008j6PYvyVa61ZyKI/pSdeMkI7du7BKGRG8=
X-Google-Smtp-Source: AGHT+IE/hxSbHJa0ey/qUAU4qMZr2Egy89hZiorh32Md7TMXE2itSwqfJ21BnW0A2NKOMSU/XYMAJQ==
X-Received: by 2002:a05:6a20:c78e:b0:1c0:e49a:6900 with SMTP id adf61e73a8af0-1cce0fea52bmr4390650637.7.1724980281696;
        Thu, 29 Aug 2024 18:11:21 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445e8f72sm4900654a91.20.2024.08.29.18.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:11:21 -0700 (PDT)
Date: Thu, 29 Aug 2024 18:11:17 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Shuah Khan <shuah@kernel.org>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/4] mm: Add hint and mmap_flags to struct
 vm_unmapped_area_info
Message-ID: <ZtEcNfNMfNTzkHEF@ghost>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <20240829-patches-below_hint_mmap-v2-2-638a28d9eae0@rivosinc.com>
 <0454187e-3e01-4af7-b193-07468ffa8934@lucifer.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0454187e-3e01-4af7-b193-07468ffa8934@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_181123_168815_015714A3 
X-CRM114-Status: GOOD (  16.22  )
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

On Thu, Aug 29, 2024 at 09:48:44AM +0100, Lorenzo Stoakes wrote:
> On Thu, Aug 29, 2024 at 12:15:59AM GMT, Charlie Jenkins wrote:
> 
> [snip]
> 
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index d0dfc85b209b..34ba0db23678 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -1796,6 +1796,9 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
> >  	struct vm_unmapped_area_info info = {};
> >  	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
> >
> > +	info.hint = addr;
> > +	info.mmap_flags = flags;
> > +
> >  	if (len > mmap_end - mmap_min_addr)
> >  		return -ENOMEM;
> >
> > @@ -1841,6 +1844,9 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
> >  	struct vm_unmapped_area_info info = {};
> >  	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
> >
> > +	info.hint = addr;
> > +	info.mmap_flags = flags;
> > +
> >  	/* requested length too big for entire address space */
> >  	if (len > mmap_end - mmap_min_addr)
> >  		return -ENOMEM;
> >
> 
> These line numbers suggest you're working against Linus's tree, mm/mmap.c
> has changed a lot recently, so to avoid conflicts please base your changes
> on mm-unstable in Andrew's tree (if looking to go through that) or at least
> -next.

I will make sure that I base off of mm-unstable for future revisions.

- Charlie

> 
> > --
> > 2.45.0
> >

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
