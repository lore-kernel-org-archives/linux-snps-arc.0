Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2059C87FCD
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Aug 2024 17:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jbweqm3dhhF9n8VTM16Zk/Wp9J+SG5VcN3xnq+PYXSo=; b=jYVyXu+K3stQhU
	4Y1h9wJKK6i6uP10/OIWs5MYFiAHEKIfv4/vmdup7obfWZPJ51SzXHR1pL0aSqFFgfUAQBtGAlWtj
	uTS26iDc2yd4fxbbOvb0Nr9H7g9vUwjX0fHmHWAxzZ6bAtzWdWtHUWxVElUL0+HyxI1sj/76dtfT7
	OPyWr0mvQvTrwEhc6wOqqSwGopOt9CQqUGhVIjmlclQLWToe6LrgZzIoqNdwUrADSvpsEjF9vb9ne
	Bl0u+W453Xt3dYBzHeC7uQyAWc6ONmxUIsoAv2h4lMZ7i7UxfLTCuFcWVCi71N0geQOIv4yM2cK0c
	U6W2Mwv6mtk23S48VlDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjj1Z-000000031nK-1Hvt;
	Thu, 29 Aug 2024 17:33:33 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjj1W-000000031lv-2l5K
	for linux-snps-arc@lists.infradead.org;
	Thu, 29 Aug 2024 17:33:32 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so627503a12.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 29 Aug 2024 10:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724952809; x=1725557609; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ShOV+xhv6/I7AhDzzz24YoQnvepxBGugrDU9V6pmXjY=;
        b=b9F2cKe9NLa3fAdp6rwLUjqdnTIM+T14tiKbuR+xF77Bu7ZPWHt4p34Zjfc4rF0pdy
         t/Q+JvaeVW5HfncAV3YRkfkEsLBKGU5pvgtqsa5l3ah/r0VRDHSDjZMQUY6nMx0h5vPm
         8TDmTaINTOUOl6ioycRbUaaC3vd41+xvK6H5+XjS76t0p8/pM9drzcjBrmT1fjpvpHLZ
         W2lFO1WjdUebX92C9Rg1sBS2s7eepJFQH/Hp56gUHxLQqpF2pThns2cry7gjkoJa6Wzw
         VzklVBl+20mU27Xh05FDScoe44IJNTO4g/sJM8cFI8qFYkp2PCOu9mJiGTSjjG26unIw
         WB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724952809; x=1725557609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShOV+xhv6/I7AhDzzz24YoQnvepxBGugrDU9V6pmXjY=;
        b=xNWEKw1THV11Aro8fDHZVS5i3bdnFZiYXPvao2mZo8anUHrjxGnkLal0a2kslqEynP
         fQxQcIq2FYPNr9TSM+xdDbh+SjDKPPGgU0Xbw2sEwC+c3q8XKGLSFV16gXnIQZLvaxno
         8WtjU2YgFswAhUSHKVMb8lYvlaj87/RoTDGm6Xxy1mhW+cSKwyM9qSkTelehH5MKA0Oc
         eWRu0wxLKdYxIW/xvoqXfEk7h34QYHHqtTgICz914X8RnXHElCbUnrBcdUF3w+TqCoBH
         msyIGRJYY3EmIcYahWakGP87eIwgryZlxxnbr+kNdq4bvlN7MUQP08is2ive/mckl6Sn
         E1og==
X-Forwarded-Encrypted: i=1; AJvYcCVelWPRzj8JcBr5efHdns2ADJ0fXebpmG/NAgSeQWZW5ARbSe4hWw7m+UNyMupfI1nSLEf5lHVnOiDsqQsGsw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4/BBeAG5ReTgCDco5FAieyqQF5cuvSJ6z9WvIIobyqDgIub+U
	iJNkxdmf758Ks3JUB1jy4oEAoDWDdhFvFxxMXx/WDRChC1br+DSxznd2agNSiic=
X-Google-Smtp-Source: AGHT+IEMMPSZiUHtBfNuQb92KkzHdlzWvSIVDrDVVbnqmIDING28StXdegl4Q9VHUGwvTGBDq12VFQ==
X-Received: by 2002:a17:90b:524a:b0:2d3:90e1:41c7 with SMTP id 98e67ed59e1d1-2d85638414emr3575500a91.31.1724952808963;
        Thu, 29 Aug 2024 10:33:28 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:c81:fe51:78cb:fc02])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b0fdf44sm1949050a91.6.2024.08.29.10.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 10:33:28 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:33:22 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Michal Hocko <mhocko@suse.com>
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
Subject: Re: [PATCH RFC v2 0/4] mm: Introduce MAP_BELOW_HINT
Message-ID: <ZtCw4vgonbJzV1xs@ghost>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <ZtAxwJFH_hAh1BPG@tiehlicka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZtAxwJFH_hAh1BPG@tiehlicka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_103330_750299_8C37C8C3 
X-CRM114-Status: GOOD (  28.37  )
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

On Thu, Aug 29, 2024 at 10:30:56AM +0200, Michal Hocko wrote:
> On Thu 29-08-24 00:15:57, Charlie Jenkins wrote:
> > Some applications rely on placing data in free bits addresses allocated
> > by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> > address returned by mmap to be less than the 48-bit address space,
> > unless the hint address uses more than 47 bits (the 48th bit is reserved
> > for the kernel address space).
> > 
> > The riscv architecture needs a way to similarly restrict the virtual
> > address space. On the riscv port of OpenJDK an error is thrown if
> > attempted to run on the 57-bit address space, called sv57 [1].  golang
> > has a comment that sv57 support is not complete, but there are some
> > workarounds to get it to mostly work [2].
> > 
> > These applications work on x86 because x86 does an implicit 47-bit
> > restriction of mmap() address that contain a hint address that is less
> > than 48 bits.
> > 
> > Instead of implicitly restricting the address space on riscv (or any
> > current/future architecture), a flag would allow users to opt-in to this
> > behavior rather than opt-out as is done on other architectures. This is
> > desirable because it is a small class of applications that do pointer
> > masking.
> 
> IIRC this has been discussed at length when 5-level page tables support
> has been proposed for x86. Sorry I do not have a link handy but lore
> should help you. Linus was not really convinced and in the end vetoed it
> and prefer that those few applications that benefit from greater address
> space would do that explicitly than other way around.

I believe I found the conversation you were referring to. Ingo Molnar
recommended a flag similar to what I have proposed [1]. Catalin
recommended to make 52-bit opt-in on arm64 [2]. Dave Hansen brought up
MPX [3].

However these conversations are tangential to what I am proposing. arm64
and x86 decided to have the default address space be 48 bits. However
this was done on a per-architecture basis with no way for applications
to have guarantees between architectures. Even this behavior to restrict
to 48 bits does not even appear in the man pages, so would require
reading the kernel source code to understand that this feature is
available. Then to opt-in to larger address spaces, applications have to
know to provide a hint address that is greater than 47 bits, mmap() will
then return an address that contains up to 56 bits on x86 and 52 bits on
arm64. This difference of 4 bits causes inconsistency and is part of the
problem I am trying to solve with this flag.

I am not proposing to change x86 and arm64 away from using their opt-out
feature, I am instead proposing a standard ABI for applications that
need some guarantees of the bits used in pointers.

- Charlie

Link: https://lore.kernel.org/lkml/20161209050130.GC2595@gmail.com/ [1]
Link: https://lore.kernel.org/lkml/20161209105120.GA3705@e104818-lin.cambridge.arm.com/
[2]
Link:
https://lore.kernel.org/lkml/a2f86495-b55f-fda0-40d2-242c45d3c1f3@intel.com/
[3]

> 
> -- 
> Michal Hocko
> SUSE Labs

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
