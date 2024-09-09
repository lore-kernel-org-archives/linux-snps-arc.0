Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C302ECE58C
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Sep 2024 23:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5p+IQsRxzQ8Qx4qXEceUPSqxmLNatZFca5YzC9sguU=; b=eILEODiRfHGDwC
	JogapB0OVi1iSeFRmDgROQLHS500TZ6Zz5AKtQlFJMX+5DLHhj6LJWueABohX0HWf9u9kmnrCVv/o
	vjj2qN19BuISnmqZkfxPygk83LusPMDNfZjQnrWSRl9ilz21McT89Ni3PM5BmZi0kf+ix2vd8LfHp
	qF69oyTFkzutCgg9ZF9Kp3pA8LEyv+A6/2sVy/nWORh46Y78V5gMiWGxWTJDSDMG3uuCPjgdMIbCC
	MAHY3M0GaFauIYsw+UJan89aOHW4E08V+8P7fpL/S1qZPmZn4DjYksuZ7cvCpEmQJbQImgQWkjdH9
	eI0mQ1a+bZNpj66HdWcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snnhy-00000003Z3C-3HG8;
	Mon, 09 Sep 2024 23:22:10 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snnhu-00000003Z1a-2Xp3
	for linux-snps-arc@lists.infradead.org;
	Mon, 09 Sep 2024 23:22:08 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-205722ba00cso41710895ad.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 09 Sep 2024 16:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725924126; x=1726528926; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vgysOd8aiDKhjc+ONWU9mJizPo8eq1lAJG8bEbfR9J4=;
        b=qklDugNS5Slg6iVDNxBaLbYJv0YGnU+NKsGrbEYrJO6d/Xr8YpUgim/HdafxU1zu8r
         Uhl7DE+gHr5nemf1MWTXPfryURdeTjS3P7/uZnKMIMqePJxdarg+M6ZICdL4Fi5HJea4
         570sA5d/o0KlWobcmJNNiumBZXxUHCz7tKqJ0yPd3jQJiO1aXNi3HUeswTUC659A8lpU
         DAtAU75qg+J2fVyKhilgZsGvZ0NFSYNfu0j6N+eywQFn/752Iy25Wyqd1tfCbE/ceegm
         kqSZ3YBHyBOMCMQBWkOwzOyQZqlXESMx/LTzzxlUGNdFrf7U3oBY344rgivzdy5bua5T
         IHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725924126; x=1726528926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgysOd8aiDKhjc+ONWU9mJizPo8eq1lAJG8bEbfR9J4=;
        b=gNbTstXP1Amj1z3glQ7Xmtz0/arVZEYUm9yFKeO8uC7nM8/vSzjXTmWiNv/TNwyhUz
         fOcCCFeDbBJygWGmbt+QhsBHFAFiysLRxDhgTrz+ozOpJeGIOLdjYiCiYePEnygT963M
         oLokK3LxwxgripBf7nItmMAUw/V4JJ8mBu16t/NX5rdhoxJPHFftrOILwzYx3ILaTOH8
         8ZYs8a6iWO8e8VZHaVts+m85yHrv0JGTOrkTuHiDPgUDnXZfeKDNegjG3vWM/vF3+fQ4
         PkamRWXiPi0oLE9h7tVijcW28YwA4JCAqb8iG8mEjJT7c/9GXnjIBJ/vOTXnayljuJY7
         EKRA==
X-Forwarded-Encrypted: i=1; AJvYcCXa27zC/zkNnP8EoBjQgJrOmX2wxWd2AuuOtWgLBypuIKA2BLU/WF/mM+BR8bE6H+yiW4JVifEMhXogR3h09g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrGOabSu7WfpE9wT9r0m8qd1qXeL38PbJxdt6KPcF05c4ZavoN
	qSEFpWMvm8QUwxDLRky9/eJtV4nUUjyh+xi7uivyBbq9zwWWUYCC3DDlZqEbVDc=
X-Google-Smtp-Source: AGHT+IG9NuFtuhb2UjO8QtL3roig2p+Iq+0iRU2PXdKFn/RkpU7K/aJcE1bC5gzUXkPWX2WgO7Qkcg==
X-Received: by 2002:a17:903:22c1:b0:1fd:5eab:8c76 with SMTP id d9443c01a7336-206f05e7881mr125620865ad.41.1725924125300;
        Mon, 09 Sep 2024 16:22:05 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e326d6sm38663045ad.66.2024.09.09.16.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 16:22:04 -0700 (PDT)
Date: Mon, 9 Sep 2024 16:22:00 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, guoren <guoren@kernel.org>,
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
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, shuah <shuah@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
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
Message-ID: <Zt+DGHZrHFxfq7xo@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <58f39d58-579e-4dd3-8084-baebf86f1ae0@lucifer.local>
 <7be08ea9-f343-42da-805f-e5f0d61bde26@app.fastmail.com>
 <016c7857-9ea8-4333-96e6-3ae3870f375f@lucifer.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <016c7857-9ea8-4333-96e6-3ae3870f375f@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_162206_725818_4DD5BD83 
X-CRM114-Status: GOOD (  58.13  )
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

On Fri, Sep 06, 2024 at 10:52:34AM +0100, Lorenzo Stoakes wrote:
> (Sorry having issues with my IPv6 setup that duplicated the original email...
> 
> On Fri, Sep 06, 2024 at 09:14:08AM GMT, Arnd Bergmann wrote:
> > On Fri, Sep 6, 2024, at 08:14, Lorenzo Stoakes wrote:
> > > On Fri, Sep 06, 2024 at 07:17:44AM GMT, Arnd Bergmann wrote:
> > >> On Thu, Sep 5, 2024, at 21:15, Charlie Jenkins wrote:
> > >> > Create a personality flag ADDR_LIMIT_47BIT to support applications
> > >> > that wish to transition from running in environments that support at
> > >> > most 47-bit VAs to environments that support larger VAs. This
> > >> > personality can be set to cause all allocations to be below the 47-bit
> > >> > boundary. Using MAP_FIXED with mmap() will bypass this restriction.
> > >> >
> > >> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > >>
> > >> I think having an architecture-independent mechanism to limit the size
> > >> of the 64-bit address space is useful in general, and we've discussed
> > >> the same thing for arm64 in the past, though we have not actually
> > >> reached an agreement on the ABI previously.
> > >
> > > The thread on the original proposals attests to this being rather a fraught
> > > topic, and I think the weight of opinion was more so in favour of opt-in
> > > rather than opt-out.
> >
> > You mean opt-in to using the larger addresses like we do on arm64 and
> > powerpc, while "opt-out" means a limit as Charlie suggested?
> 
> I guess I'm not using brilliant terminology here haha!
> 
> To clarify - the weight of opinion was for a situation where the address
> space is limited, except if you set a hint above that (you could call that
> opt-out or opt-in depending which way you look at it, so yeah ok very
> unclear sorry!).
> 
> It was against the MAP_ flag and also I think a _flexible_ per-process
> limit is also questionable as you might end up setting a limit which breaks
> something else, and this starts getting messy quick.
> 
> To be clear, the ADDR_LIMIT_47BIT suggestion is absolutely a compromise and
> practical suggestion.
> 
> >
> > >> > @@ -22,6 +22,7 @@ enum {
> > >> >  	WHOLE_SECONDS =		0x2000000,
> > >> >  	STICKY_TIMEOUTS	=	0x4000000,
> > >> >  	ADDR_LIMIT_3GB = 	0x8000000,
> > >> > +	ADDR_LIMIT_47BIT = 	0x10000000,
> > >> > };
> > >>
> > >> I'm a bit worried about having this done specifically in the
> > >> personality flag bits, as they are rather limited. We obviously
> > >> don't want to add many more such flags when there could be
> > >> a way to just set the default limit.
> > >
> > > Since I'm the one who suggested it, I feel I should offer some kind of
> > > vague defence here :)
> > >
> > > We shouldn't let perfect be the enemy of the good. This is a relatively
> > > straightforward means of achieving the aim (assuming your concern about
> > > arch_get_mmap_end() below isn't a blocker) which has the least impact on
> > > existing code.
> > >
> > > Of course we can end up in absurdities where we start doing
> > > ADDR_LIMIT_xxBIT... but again - it's simple, shouldn't represent an
> > > egregious maintenance burden and is entirely opt-in so has things going for
> > > it.
> >
> > I'm more confused now, I think most importantly we should try to
> > handle this consistently across all architectures. The proposed
> > implementation seems to completely block addresses above BIT(47)
> > even for applications that opt in by calling mmap(BIT(47), ...),
> > which seems to break the existing applications.
> 
> Hm, I thought the commit message suggested the hint overrides it still?
> 
> The intent is to optionally be able to run a process that keeps higher bits
> free for tagging and to be sure no memory mapping in the process will
> clobber these (correct me if I'm wrong Charlie! :)
> 
> So you really wouldn't want this if you are using tagged pointers, you'd
> want to be sure literally nothing touches the higher bits.

Various architectures handle the hint address differently, but it
appears that the only case across any architecture where an address
above 47 bits will be returned is if the application had a hint address
with a value greater than 47 bits and was using the MAP_FIXED flag.
MAP_FIXED bypasses all other checks so I was assuming that it would be
logical for MAP_FIXED to bypass this as well. If MAP_FIXED is not set,
then the intent is for no hint address to cause a value greater than 47
bits to be returned.

This does have the issue that if MAP_FIXED is used then an address can
be returned above 47-bits, but if an application does not want addresses
above 47-bits then they shouldn't ask for a fixed address above that
range.

> 
> >
> > If we want this flag for RISC-V and also keep the behavior of
> > defaulting to >BIT(47) addresses for mmap(0, ...) how about
> > changing arch_get_mmap_end() to return the limit based on
> > ADDR_LIMIT_47BIT and then make this default to enabled on
> > arm64 and powerpc but disabled on riscv?
> 
> But you wouldn't necessarily want all processes to be so restricted, I
> think this is what Charlie's trying to avoid :)
> 
> On the ohter hand - I'm not sure there are many processes on any arch
> that'd want the higher mappings.
> 
> So that'd push us again towards risc v just limiting to 48-bits and only
> mapping above this if a hint is provided like x86-64 does (and as you
> mentioned via irc - it seems risc v is an outlier in that
> DEFAULT_MAP_WINDOW == TASK_SIZE).
> 
> This would be more consistent vs. other arches.

Yes riscv is an outlier here. The reason I am pushing for something like
a flag to restrict the address space rather than setting it to be the
default is it seems like if applications are relying on upper bits to be
free, then they should be explicitly asking the kernel to keep them free
rather than assuming them to be free.

> 
> >
> > >> It's also unclear to me how we want this flag to interact with
> > >> the existing logic in arch_get_mmap_end(), which attempts to
> > >> limit the default mapping to a 47-bit address space already.
> > >
> > > How does ADDR_LIMIT_3GB presently interact with that?
> >
> > That is x86 specific and only relevant to compat tasks, limiting
> > them to 3 instead of 4 GB. There is also ADDR_LIMIT_32BIT, which
> > on arm32 is always set in practice to allow 32-bit addressing
> > as opposed to ARMv2 style 26-bit addressing (IIRC ARMv3 supported
> > both 26-bit and 32-bit addressing, while ARMv4 through ARMv7 are
> > 32-bit only.
> 
> OK, I understand what it's for, I missed it was arch-specific bit, urgh.
> 
> I'd say this limit should be min of the arch-specific limit vs. the 48-bit
> limit. If you have a 36-bit address space obviously it'd be rather unwise
> to try to provide 48 bit addresses..

In this patch I set the high limit to be the minimum of the provided
high limit and 47 bits so I think that should cover this case?

- Charlie

> 
> >
> >       Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
