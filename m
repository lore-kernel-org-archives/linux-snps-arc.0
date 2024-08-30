Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81F0CA0ECC
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Aug 2024 01:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nu+r8VL3MkR/vbNSNRKHG2whPpdUlxam/+eGnmvRr6Y=; b=TlpyAlsN72Tld6
	5TQLVdY0ENZFqawNQEbcNpvWStJyIaUdA0LIIH881ET7ZD1ZIiRdHU2VaaOpz/R1runWlJN5jaBmW
	8ZHNPZsvwLq6WxZXRsYhEZYQ1tn3oLEKrQ17q9iSvOn+IqABdcAli+6/vVuQPhZI1XBMC0mLjNUnz
	GFGWCnhUsyCuDwq01VmVWvEi73hj4te1uVOvDLwZbHWwfAcMWaTUYHRN6JMXwcVV32lYF8aUi9h7Q
	37MB0LEOOJXt6GhBoeNfPb9YFTBdGhqZJsZQlAHTn+19wObkHDHzIiXbTPlBBkUYz1iwKa8mGoQ1c
	nTzfkEw32DC1ddhPUNLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjqFx-00000004GLz-1s9H;
	Fri, 30 Aug 2024 01:16:53 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjqFt-00000004GKT-0pQP
	for linux-snps-arc@lists.infradead.org;
	Fri, 30 Aug 2024 01:16:51 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5df9a9f7fe2so770410eaf.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 29 Aug 2024 18:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724980607; x=1725585407; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7xDP+Z9ioGU1Ej/VigLqskETGN0WUiHvrKI/4LF5a8=;
        b=wdgvwHBhduWPjMCLFXaEMubDvnTz2UDrzXd3iukmhOSiR7jLSxmSesCuXu7A+SjbCw
         pqU/AfQGeMsrlEJYMNJ4F/Jv++qve7MsouNwqFr8sbAQ2CpcfISRswHckWukvc8JkfxS
         2uSr5Erj/penA0k4xuqDCQKYwNPrzDcu2fR2lVT8oXEpYP5k0F8i2VWvMJMf7R3a8S2v
         t7vuVwWSFJfJnrm0mYlYeyWP1fOWk9V7haem9juS8jwEmQsiao6Xrk3H9rijrPxS9WDf
         srM011ZK8ztv+rAgx0L8WXv/ODfBb04UH3wmBG2TjAHgOyn5hULo29AAM2J5KbCk1Lyn
         3vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724980607; x=1725585407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7xDP+Z9ioGU1Ej/VigLqskETGN0WUiHvrKI/4LF5a8=;
        b=RwbbjkbKQr2/WsARDlP9mSRNhbWHTWo+yZWkhmF1QOVJq9XOJR3vrBkDPqJ+Ns1Bd3
         dfD4oJ+DWwgI9w5gtds0hvtjLIvkL84jaqjTV7vhqYnEGKXC+U9VVLItBpTe4ScXS7Nr
         ICbYIfNroeiHDXRUB9FhG3Mj5Ls2dv4jJrFsXA/a+pzhoryJQHXLCXAozLA6vhLP7AEy
         PvedkLwcMDxlAz5eXhCrBEkmZqP2I9xTvhHEZM360mH1fCaH+QWKzU1ZaCYR9Vtp57sC
         F7JT4IGREPHl/9okF+gPNUHLnv3SrHX4ReoOnq05pgDVZVcED3CJQRuA3zCfSekl9J5V
         zAMw==
X-Forwarded-Encrypted: i=1; AJvYcCUt/A26rhYZ8r8byAnh3MtpociOZgh+r8LtKhhg2yRnz1OSu1QoHF9rjy59gYBISlzY4MifiUnh7/l/GvavcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxROtnl9TNOMaa5m++bTbTBE80aOsZ+6dsI0RZciAdilwymjVbi
	HCaCWWTBIa+4Dut0f5RCiLxvyHW7pdNgkEYNZCjT/6fef5/l2yrBASH4NtZ59s4=
X-Google-Smtp-Source: AGHT+IH958S4ePdwDnUiHubyspadJoOLZkUZCeioopGjkAA0KkZUXlfkSz3mG+kkmopghBfnyH6A6g==
X-Received: by 2002:a05:6358:2803:b0:1ac:f109:e248 with SMTP id e5c5f4694b2df-1b603c00435mr551866655d.2.1724980607523;
        Thu, 29 Aug 2024 18:16:47 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a5961sm1734132b3a.63.2024.08.29.18.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:16:46 -0700 (PDT)
Date: Thu, 29 Aug 2024 18:16:42 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
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
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/4] mm: Add MAP_BELOW_HINT
Message-ID: <ZtEdevUWzplteQWv@ghost>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <20240829-patches-below_hint_mmap-v2-1-638a28d9eae0@rivosinc.com>
 <87mskvenum.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mskvenum.fsf@mail.lhotse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_181649_255468_067A35BB 
X-CRM114-Status: GOOD (  24.89  )
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

On Thu, Aug 29, 2024 at 06:26:41PM +1000, Michael Ellerman wrote:
> Charlie Jenkins <charlie@rivosinc.com> writes:
> > Some applications rely on placing data in free bits addresses allocated
> > by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> > address returned by mmap to be less than the 48-bit address space,
> > unless the hint address uses more than 47 bits (the 48th bit is reserved
> > for the kernel address space).
> >
> > To make this behavior explicit and more versatile across all
> > architectures, define a mmap flag that allows users to define an
> > arbitrary upper limit on addresses returned by mmap.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  include/uapi/asm-generic/mman-common.h       | 1 +
> >  tools/include/uapi/asm-generic/mman-common.h | 1 +
>   
> You're not meant to update the headers in tools/ directly. There's a
> mail somewhere from acme somewhere describing the proper process, but
> the tldr is leave it up to him.

Oh okay, thank you.

> 
> > diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
> > index 6ce1f1ceb432..03ac13d9aa37 100644
> > --- a/include/uapi/asm-generic/mman-common.h
> > +++ b/include/uapi/asm-generic/mman-common.h
> > @@ -32,6 +32,7 @@
> >  
> >  #define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
> >  					 * uninitialized */
> > +#define MAP_BELOW_HINT	  0x8000000	/* give out address that is below (inclusive) hint address */
> 
> IMHO the API would be clearer if this actually forced the address to be
> below the hint. That's what the flag name implies after all.
> 
> It would also mean the application doesn't need to take into account the
> length of the mapping when passing the hint.
> 
> cheers

That's a good point. The reason I did it this way was to allow mmap the
possibility of returning the same address as the hint. If it must be
strictly less than the hint then the hint address can never be returned.
Maybe that doesn't matter though.

- Charlie


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
