Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B39CD4F21
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 19:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4fmkjI9GloK8lwE4lbOpQlSh43zNokxdnSckmjTW+M=; b=EldXpGD/eOKjOtf8W4DL/IDMW2
	9EcDX2Lc6vErXNRE6ea8w+IWLR1akfbkuHgiyDQFbCP587RJcXZLkcln5DwlZEwjU2sPkDjGZHtEg
	/p5nDD/aU0d4wtmajw0piPkP4SBpBVjZc+5pLQjbgAao02jBvIB82zZICVOKJhQ3YrneA43yCFHGQ
	EmnscW+XMgyI//TyeZtoXfFiPiGzwIrI9fZ/0P+tAFVKMMUZhAh4vunQuqy+4CdBIhqqm07CSo8k6
	GjyZoXdkJetmMSCfJGO8QA8iCXPm3jvNrn10sk93oFtAAa2U5Hwn2fZjkosGs65MkJskVeS4VbZin
	zuLV/QEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slvLc-00000005k2X-39UK;
	Wed, 04 Sep 2024 19:07:20 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slvLZ-00000005k19-3NfS
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 19:07:20 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7cd967d8234so4350763a12.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 04 Sep 2024 12:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725476837; x=1726081637; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o2U7wgEbLS4i4a8ingcWCBDQrhNmwXrz+ffgx64j+qE=;
        b=lEsrQvohUr/XwSlx85mB+79l9dqYPT9N78k1rHpUYZNviu3uj8KXv1FWe0M/vAFxnc
         JY/v8s6bcLml08QNyQgQ/G4iJnFIC7joTRXYAfhOcsi6eXdaTMZ43fIHoYNiqOB1DN2K
         aIxDCAUDe5roZfrwXMV65kMRIMj1BhzGqvnmTTWoY+3i8pwOCwxxg5Sb3sm8d6f6nnFf
         D7lYLQAGJ8lp23i3vDutv81vZA08QFs/NrwpY5mA+bYDKtNJRWTHAUz+k/GrmaZkePfI
         /l+PIwwAyxdP5VXh6OZNKj2YJnOhgjzt0jOtb/Mve7tkoJTP9NgdP5Ob/WXZEe7lRR8n
         MoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725476837; x=1726081637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2U7wgEbLS4i4a8ingcWCBDQrhNmwXrz+ffgx64j+qE=;
        b=UpPIbTlf2QCVpO6OzQ/KWcOlSD2R9XtsWdk6mHVge78Z70IDX42NjFNWkovJKEH2Jl
         tOF3m3NTr+Rg6JLH4+j1+1hiUxMlpd8gWWRCKqm+lh5C0hhGy26bDMTb9Ia/C+O32J9X
         lRiAU3FU7SilsKDGL2u4VfNmMndr6GvQrdGPihtw81E42rWDxbbb6ZUGzKspddbvn2ku
         bSgMzjkjUOOUDqjE7ADVvDrH9B/D5YJtY/4X0ZldBQNCM3pNHGPyx2fMaf/AjrLd0r/l
         02d6z07Sk3sXJHnvKQ+0LACh8sAL8ebnr3QNgP5+KKDaJ2YkqgYYdP+1aFxmHy5HHlFG
         +CLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSww3LesVLflH+vx7rTS3DkOstDiTYQiwSVFg3DnUoJqvJSypXw9fikluJ58WH19zR0hnuBlKyZTlT1cOj4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDZjzdm9zdahCty2STk0hD2OlfEDbgSPhrTq01MAn9T5Yd5TXt
	jVHmUEh+rLNmjuRJhfhj9LXfUGiJohHzYdpxe88A2xaeTGvDIBPghtgf316YTYg=
X-Google-Smtp-Source: AGHT+IGRXMFw8eODDeHuSZGixob1QmbWy894YR3dac/q8kTYt2afjYPzXJiDq5qdDnRm4AHLgT4d4Q==
X-Received: by 2002:a17:90b:300e:b0:2d8:27c3:87d7 with SMTP id 98e67ed59e1d1-2d893284ebdmr13545892a91.8.1725476836620;
        Wed, 04 Sep 2024 12:07:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2da53740084sm4858056a91.32.2024.09.04.12.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 12:07:16 -0700 (PDT)
Date: Wed, 4 Sep 2024 12:07:12 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
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
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-mm@kvack.org, Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 3/3] mm: Care about shadow stack guard gap when getting
 an unmapped area
Message-ID: <Ztiv4NtsIkKnyiLO@debug.ba.rivosinc.com>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>
 <is6ewj3bhtqy3zadj6lbdv6maupx4kmduvhny66ntifkji6hoj@xmhcf5jt4o66>
 <dbaf5653-df46-4e17-bce1-aec7fb168197@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dbaf5653-df46-4e17-bce1-aec7fb168197@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_120717_881058_973410EB 
X-CRM114-Status: GOOD (  12.25  )
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

On Tue, Sep 03, 2024 at 08:57:20PM +0100, Mark Brown wrote:
>On Tue, Sep 03, 2024 at 03:41:49PM -0400, Liam R. Howlett wrote:
>> * Mark Brown <broonie@kernel.org> [240902 15:09]:
>
>> > +static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
>> > +{
>> > +	if (vm_flags & VM_SHADOW_STACK)
>> > +		return PAGE_SIZE;
>
>> Is PAGE_SIZE is enough?
>
>It's what x86 currently uses so it'll be no worse off if it gets moved
>to the generic code (there's a comment in the arch code explaing what's
>needed there) and it's enough for arm64, we only do single record
>pushes/pops or (optionally) writes to unconstrained addresses.

It's enough for RISC-V too.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
