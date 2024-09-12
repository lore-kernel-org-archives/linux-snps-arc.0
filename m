Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C391EE6454
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Sep 2024 07:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87jjPDxVi6b/M36Zn73rlVoOETEMVJwPUzYPB3937iA=; b=uPE47WTWecA0v7
	rTXPcPR7wwKUFHfmPOW5KxCqhMLYWSo0dDVh8rpLxHzizn2Jpv4Yqt1+0DCmHjhF3zQEany5gRIpB
	KxJQ7aA2s6jvx9Q1RCJ5pSYIRxG5oBDXH9lgEz3ZGsSoyUWN18QL3fekmC7bh6kY+TTj/u0KRzI3p
	cON8nymZP2vGYqn0zbzC468Fj9/lqbxw09Ujc3OcC8toGqF+v1dE3kYEDiQnv/bzaynBngBm6P5U+
	vhvzNrim38+Z8mLdeQLzA89d18fJ0iqndSFuE25Im8HKmWqVRbCF4aX/EdbbvUsFbTZD7DI2DS/FZ
	376iCy31o6e1BsBwW7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soe3P-0000000C8Qd-0e5J;
	Thu, 12 Sep 2024 07:15:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1socyr-0000000ByCH-0gE6
	for linux-snps-arc@bombadil.infradead.org;
	Thu, 12 Sep 2024 06:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UDJaA5Y9npfkWPEOnJeHdGlQ/o0X1HQ/Q2gtdhbnZuk=; b=dFSL5CfQG2hePTxD33mHOuRA75
	yZ7hlUBLv44gPIqlDCQFkiucBKaxHzRPhkVO21Bh3avLPYEAGi/vtNa7c4mkPmkufTAroaoZV0I7h
	WwcyBxAVZuyNLRrkS+I5REPc+Nx1VqQ5NVaSDpK9fmrhQN74a7sZK5q72Jr3wPCnWwjDLjNazCBgx
	Zghoxdg62QZeoqHqawuFaoB31MJtnbpwuXtrvRkFPUCrbr/NsAsX+xcyChGGPrc5BOPyI1tsg+MlH
	abl03NAFNeDDhcs5GR2OGTkG6ZMTep7nFeNrHwSpk6Ed3cDv2qvV5GMWJ4rSNTHOU+sHtSN6K90i0
	Aiv6sgEA==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1socym-00000000Mhz-07GS
	for linux-snps-arc@lists.infradead.org;
	Thu, 12 Sep 2024 06:06:59 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2055136b612so8467965ad.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 11 Sep 2024 23:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726121213; x=1726726013; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UDJaA5Y9npfkWPEOnJeHdGlQ/o0X1HQ/Q2gtdhbnZuk=;
        b=Wagi+HUC/tyZAUZRDnJElPPI6FBDiAUGszh1LdGRTzzyfnpe0y3didpF6I1w7B/Unc
         ni/3OzcpjC2AmNaHs2sM0KHCgZKsi1+Ux+D8VJIssTXl9KzOZtSVfbONfZ/nD5CYwCAK
         IygXOP4D+jyJRPQ1ef5jgtAnu1Sb5t64pOv9g7/lDyscr6/7QL0eOgqRiU1ojS/eG8M4
         6ez9UGJYRQL7KW7UGtXwgtuNLMZmobmMaF0CpQZ5xtbK4omyt3J8Ro7arZJJpBUHOadL
         QULUzT3hYR+1FLS/U+5sZtHvHEfu5yRxnmYohkiza943B1XjD37pBuVj9yIXWfncKcnF
         3o8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726121213; x=1726726013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDJaA5Y9npfkWPEOnJeHdGlQ/o0X1HQ/Q2gtdhbnZuk=;
        b=q1igGfsaRIWrIINNH4n/9GhAMahyWePdMDUOOl9kLJMjkshoMb1UzuDdhrixSFo+lt
         TObnDEHaKNrFs7gtwDY1UEEU50TA/jBFiYEB4e2hn4jamqaNZDArrZ2I/YuE3APZQXOA
         cj4lJ3vBX2C4sKtuwH8C3QqZ9MZFh8ZmlveXvTho4KyHUxsvwTf7no/NhfDVEdJuWtvK
         7FwdMZPP4RIGIEUb8vb1byLMcG6GpsLZJ57jd/3/+qz4zmrsFGi6cfu26i/jG15AcMFl
         nRJBWAItecM4k1d9hDANJlhp4OewFZabWywoqEHGg74Z9+H74LLrk08WhbAGdZ3Kv6MU
         N45w==
X-Forwarded-Encrypted: i=1; AJvYcCXEcdjAOqsYkE4AyH+yx6AY/LPYHPI+DGT5sHbqauZjMH+pPn1kEORJUojXZDsf0z0PQAQtIEVLcliRxf9BGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyICOKQHEhvVI2HZuHoksTgVzpAwZINhx0Zw/NUcWq9NjpX28uL
	VfBucqWU4WW44w0a/VKNH3MOgSVFdSH6depHgYXCSlRnK+pDOHz4p2SIkHfZY4w=
X-Google-Smtp-Source: AGHT+IGKXy/6JapHeAVjChHUI6qH3tbjA0GPIxSDVxSa+LImRNXpcKvZ6AKB4gkH/Tg4GRKQ5PFIHQ==
X-Received: by 2002:a17:902:d2ca:b0:206:c2f4:afb7 with SMTP id d9443c01a7336-2076e36db8cmr23914475ad.26.1726121212752;
        Wed, 11 Sep 2024 23:06:52 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:7acc:9910:2c1d:4e65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076b01a39esm8052185ad.287.2024.09.11.23.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 23:06:52 -0700 (PDT)
Date: Wed, 11 Sep 2024 23:06:46 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	guoren <guoren@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
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
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	shuah <shuah@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <ZuKE9nnNGR/5fHh/@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <8130e50c-01e2-45c3-a516-45f5499311f2@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8130e50c-01e2-45c3-a516-45f5499311f2@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_070656_357832_FF8748EA 
X-CRM114-Status: GOOD (  30.66  )
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

On Wed, Sep 11, 2024 at 07:25:08AM +0000, Arnd Bergmann wrote:
> On Wed, Sep 11, 2024, at 00:45, Charlie Jenkins wrote:
> > On Tue, Sep 10, 2024 at 03:08:14PM -0400, Liam R. Howlett wrote:
> >
> > I responded to Arnd in the other thread, but I am still not convinced
> > that the solution that x86 and arm64 have selected is the best solution.
> > The solution of defaulting to 47 bits does allow applications the
> > ability to get addresses that are below 47 bits. However, due to
> > differences across architectures it doesn't seem possible to have all
> > architectures default to the same value. Additionally, this flag will be
> > able to help users avoid potential bugs where a hint address is passed
> > that causes upper bits of a VA to be used.
> >
> > The other issue I have with this is that if there is not a hint address
> > specified to be greater than 47 bits on x86, then mmap() may return an
> > address that is greater than 47-bits. The documentation in
> > Documentation/arch/x86/x86_64/5level-paging.rst says:
> >
> > "If hint address set above 47-bit, but MAP_FIXED is not specified, we try
> > to look for unmapped area by specified address. If it's already
> > occupied, we look for unmapped area in *full* address space, rather than
> > from 47-bit window."
> 
> This is also in the commit message of b569bab78d8d ("x86/mm: Prepare
> to expose larger address space to userspace"), which introduced it.
> However, I don't actually see the fallback to the full address space,
> instead the actual behavior seems to be the same as arm64.
> 
> Am I missing something in the x86 implementation, or do we just
> need to update the documentation?
> 
>       Arnd

Yeah I guess it is incorrect documentation then? It seems more
reasonable to me to have a hint address fall back onto the larger
address space because otherwise the "hint" address can cause allocations
to fail even if there is space above the 47-bit limit. This is another
reason I wanted to avoid having this default behavior on riscv, to not
have this abuse of the hint address.

- Charlie


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
