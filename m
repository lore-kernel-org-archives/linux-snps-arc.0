Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93288CD8CBD
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Sep 2024 17:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xi7FtNPo97yXFRYcmkmgl+S445u/1hrDkuLoDuwAou8=; b=3Z34tIhI2o5JIG
	rbQp8u6E9GWGyneQj5M780RUrtNjAL3eJXjDtcbqFc8LyW2hTT/5+CNMs9HznQVkFOpXEd6knKrYN
	F9IWBhnIeEcRivnvUo/UrPU2FD2NZlGUULAV0urFxzvLNQ+TC9dRivFqFbRUT0KeKbognPsg+4nvj
	5tb8rNpxz7zqvw6bBJSWO3/ektUBbDTY4EIAbduLHES9ELlqZqGHTzuMNGahe0FrQ7Y5aDhq2eJC6
	oxyZVCU2Jk4tW7L0iRvQZRzUQBAXQ9Nat0XS29PtvVr6jlZT2CJTU9MNNebTj6E3lNtMOtRVCEtPW
	Vj9gvvICpSn2QDpvwU4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smGG7-00000009I1G-0fiR;
	Thu, 05 Sep 2024 17:27:03 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smGG3-00000009Hzv-40rS
	for linux-snps-arc@lists.infradead.org;
	Thu, 05 Sep 2024 17:27:01 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2d8818337a5so1648198a91.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 05 Sep 2024 10:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725557218; x=1726162018; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TzHtjVKsvMG2J+VEdT3JJ4mY+8euHciuRxZ037YJyIs=;
        b=3KH7i6spm9rrYRUA+zWN7x3Za2Ipwc1pbCZWingEKsSjFdRcZNnPyrHqlENiUBJBtL
         9sBpsbMA/vPxM4r2o96DgLTLYH1ogdXxJe93lKjD7OkLlefQY4M44xjx87WHIJvPz37U
         UeM7qmsdrB2X1acovhN0BX9MgFOuWbzK897wh75KAkBjRgrUXils4ZG6T9oty5Y88fLM
         o3tg9wI96k6cYmE3HWu0ou8weA6KT8Zz4evaOWYADLOwDqcnAB1Grc8slzRy4Sw3bSZU
         fkfzJCBhoemeKEfu15TA/vJnuKbISqXUBGjFAlxDmZe9F0oYfV450FIHkpAe9LgeQ848
         DkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725557218; x=1726162018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzHtjVKsvMG2J+VEdT3JJ4mY+8euHciuRxZ037YJyIs=;
        b=dDSfEQX9nbR5EvyQyU1CWz00EQb26FJZwFuYEpLKmblbVmQjqpsSNCcipZJpwXBLoy
         kBtbQreCuayP9o50v8f8h0yhqi/x4ZzSWWkF+eFDP5iVekFCCOtLpS8+qmfcgiMVg7Wz
         W0RwvfZdBfex9N9wO+/0gbjMEGAAtJK6Yhg2xlWdEYRyiuwo1xF9DQjc1sqmtFenQjsp
         b64ZBkT491iXBrvkLhcfsMJ+mAJOxO3jV3EFXse/ipSRPIQGRvGXHyIL4/5uCaov6TT3
         uonF+6pH6gxWaCFSAdaUeTLIpku/Y0PVovILxl+l2LItFPsuhbHyE/AcCk6KcH5j2c2p
         bUCg==
X-Forwarded-Encrypted: i=1; AJvYcCXEWsJ4R+nP8xgXq0mXjfesHSiT+Td4lwZb2fqCJFz4zeK+N9qMDvOjH641XfTz0OM8EbeEYXm1l1MqHCOxtA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgrjccLDYZCfRXtzVLP1Q2fxaqXEt6HIaeT68nYHsnVgX34SNY
	KvrMOI/HqgAjj+P0+bCmV93mVI3kTFJO8DquZLMZBsEIfrsZgAt/dlGLXgsh6gg=
X-Google-Smtp-Source: AGHT+IFxrgWNtdxCWG0RBGHbyeqfO4T1K/TMURzEB4vAspGF/eaSh/6stCCkbbdo5V+yBGPBQxqCJA==
X-Received: by 2002:a17:90b:3d2:b0:2d8:9fbe:6727 with SMTP id 98e67ed59e1d1-2dad4f0e4damr67155a91.4.1725557218097;
        Thu, 05 Sep 2024 10:26:58 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2da5932d1ecsm6506552a91.43.2024.09.05.10.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 10:26:57 -0700 (PDT)
Date: Thu, 5 Sep 2024 10:26:52 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
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
Message-ID: <Ztnp3OAIRz/daj7s@ghost>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <yu7um2tcxg2apoz372rmzpkrfgbb42ndvabvrsp4usb2e3bkrf@huaucjsp5vlj>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yu7um2tcxg2apoz372rmzpkrfgbb42ndvabvrsp4usb2e3bkrf@huaucjsp5vlj>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_102700_169650_2B718FE7 
X-CRM114-Status: GOOD (  34.05  )
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

On Thu, Sep 05, 2024 at 09:47:47AM +0300, Kirill A. Shutemov wrote:
> On Thu, Aug 29, 2024 at 12:15:57AM -0700, Charlie Jenkins wrote:
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
> This argument looks broken to me.
> 
> The "small class of applications" is going to be broken unless they got
> patched to use your new mmap() flag. You are asking for bugs.
> 
> Consider the case when you write, compile and validate a piece of software
> on machine that has <=47bit VA. The binary got shipped to customers.
> Later, customer gets a new shiny machine that supports larger address
> space and your previously working software is broken. Such binaries might
> exist today.
> 
> It is bad idea to use >47bit VA by default. Most of software got tested on
> x86 with 47bit VA.
> 
> We can consider more options to opt-in into wider address space like
> personality or prctl() handle. But opt-out is no-go from what I see.
> 
> -- 
>   Kiryl Shutsemau / Kirill A. Shutemov

riscv is in an interesting state in regards to this because the software
ecosystem is much less mature than other architectures. The existing
riscv hardware supports either 38 or 47 bit userspace VAs, but a lot of
people test on QEMU which defaults to 56 bit. As a result, a lot of
code is tested with the larger address space. Applications that don't
work on the larger address space, like OpenJDK, currently throw an error
and exit.

Since riscv does not currently have the address space default to 47
bits, some applications just don't work on 56 bits. We could change the
kernel so that these applications start working without the need for
them to change their code, but that seems like the kernel is
overstepping and fixing binaries rather than providing users tools to
fix the binaries themselves.

This mmap flag was an attempt to provide a tool for these applications
that work on the existing 47 bit VA hardware to also work on different
hardware that supports a 56 bit VA space. After feedback, it looks like
a better solution than the mmap flag is to use the personality syscall
to set a process wide restriction to 47 bits instead, which matches the
32 bit flag that already exists.

- Charlie


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
