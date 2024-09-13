Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40598FC6175
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Sep 2024 20:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CuGL1yNfun4Mob/r5XBROeEVkq24FFhn5tkbUddFilU=; b=aDc4yzG0ilttNu
	KetM83g0YJwqcQ7cpEhslCZ6rlA2TZ4bUEfUVe7wvIbVoOnELR33vFE7ZgQAIzG51BvMFt0qVmLIQ
	WoIgox/0YrDwqoNctDMsHuCpIHlXHssOKSRw3rCNq9+S9DqCAXQ9dSBObSDeI0o2FZ5emZE/6Xl97
	IXtceWlBHNG4N9JwILirettzBNT2fqoJLdpf31VB6cjKMJd28SQfUvDW3JcLSzoPh7RdoR/FCJ4sk
	D72+VAlnQT3gVlBTjJRCuRJFPkUkmYSAGTgm9PEroyzSy4qcCf8ygis3dfnw6tJiHmaIuOZufotPs
	vi58odoKNSPIeZGyb8Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spCho-0000000H2Ym-2Isz;
	Fri, 13 Sep 2024 20:15:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spChj-0000000H2Tw-0Tve
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Sep 2024 20:15:45 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2068a7c9286so14624435ad.1
        for <linux-snps-arc@lists.infradead.org>; Fri, 13 Sep 2024 13:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726258542; x=1726863342; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w1FIyAVC28uVndIDT9MHoNGdB/uDnM+DRyhrjJeTBk0=;
        b=KyyLZPeI3Y2aqrhXdttEVhpHTdvatlTkCAu8NjHYJh7JNrXo3fA17QM59OTw+yh6nY
         tb/ymVimTxCnRtChvN5BqXsWM9K9lRIcLqOfXOwQubFc23zfQVC1TJ4Fytn461M188qt
         wcfoF8D9dyJAhWpuJPfBbflHnjsZO6BY0qkB6r8wJ4BFgVxDV+ENsKzeu/LrOyEUQDZW
         sSYmh/JzcZJxRX5c0CUIQFh1C+Sbpta1Iir2D6FmQbufU1p0EU4Y4+n0xwX/J17O7Ral
         htvfwz6RUEvD2Wtb6Qvb2NFeIJe34T+JnAYwWcfhxRntXA3CHCQtuqQQmARqOtobISGV
         VJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726258542; x=1726863342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1FIyAVC28uVndIDT9MHoNGdB/uDnM+DRyhrjJeTBk0=;
        b=nYGGcKHKb35X1ri7OSHp2mYofZkrXUs04tiFPtPgszDwqSPAoy72x7VxUCokSjwq+L
         TE6O2snNf8o413Hl40lIbyPq2AyqAl5yCY7tVuD3Un0wKpFYhKmLP1YHxqLFynuWbm9C
         0ZyXRlSFAXqc6JJUjrj5DpbOyOhTZl5IQa99f+TPNJxCwDD6pry+J+lletGshxDy3vhF
         7ORjbaWF6PqA4xuqMNhNPLZEPZ03KuQbLJpc9iZOXfWRcroxfEtHxj0rmUWI2UWf95Mc
         c9RhQ6lp3Dkw/LQsoL9+b7Tc06IMKzIbRVjW6l11bKEYUEnJBJ04k3ZhqdQMUWp6f2Sv
         Qpyw==
X-Forwarded-Encrypted: i=1; AJvYcCWP2DkdhnxH96s+FpSwkJCZ032rQiv2nvfWZF5xPxSEbpsGIOEB3e/3SJkEEaTMfH/uqU1tVYIdeK3c1sPM7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPEtWR7GP3BU2+VlUzGGDSrizeZsjR6jPKhNIS+77nCkWtiCan
	+BelxiaSzzZehm4EDD7M6Hqu534CM9Xmcq0fbNHtB/vj7tmHig2kQbYl8U1+358=
X-Google-Smtp-Source: AGHT+IF+aNQZr3gdahRoQqk9W7f54mB5JjUQKc3RHBzDdb3qrFRnfek72JEtbqkZMIR2o3KSJzgpeA==
X-Received: by 2002:a17:902:dad1:b0:205:8407:6321 with SMTP id d9443c01a7336-20781b4740dmr63844425ad.9.1726258541784;
        Fri, 13 Sep 2024 13:15:41 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945db10csm315195ad.53.2024.09.13.13.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 13:15:41 -0700 (PDT)
Date: Fri, 13 Sep 2024 13:15:35 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, guoren <guoren@kernel.org>,
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
Message-ID: <ZuSdZ2bi1JvLJVYe@ghost>
References: <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <ZuHfp0_tAQhaymdy@arm.com>
 <ZuKHpFB+uWuJe2xm@ghost>
 <ZuLIPZId9aHcAY2j@arm.com>
 <ZuNaD+zAXiAulc0n@ghost>
 <ZuQPF7Gbcqzq0U6N@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZuQPF7Gbcqzq0U6N@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_131543_453893_2097EC4C 
X-CRM114-Status: GOOD (  32.89  )
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

On Fri, Sep 13, 2024 at 11:08:23AM +0100, Catalin Marinas wrote:
> On Thu, Sep 12, 2024 at 02:15:59PM -0700, Charlie Jenkins wrote:
> > On Thu, Sep 12, 2024 at 11:53:49AM +0100, Catalin Marinas wrote:
> > > On Wed, Sep 11, 2024 at 11:18:12PM -0700, Charlie Jenkins wrote:
> > > > Opting-in to the higher address space is reasonable. However, it is not
> > > > my preference, because the purpose of this flag is to ensure that
> > > > allocations do not exceed 47-bits, so it is a clearer ABI to have the
> > > > applications that want this guarantee to be the ones setting the flag,
> > > > rather than the applications that want the higher bits setting the flag.
> > > 
> > > Yes, this would be ideal. Unfortunately those applications don't know
> > > they need to set a flag in order to work.
> > 
> > It's not a regression, the applications never worked (on platforms that
> > do not have this default). The 47-bit default would allow applications
> > that didn't work to start working at the cost of a non-ideal ABI. That
> > doesn't seem like a reasonable tradeoff to me.  If applications want to
> > run on new hardware that has different requirements, shouldn't they be
> > required to update rather than expect the kernel will solve their
> > problems for them?
> 
> That's a valid point but it depends on the application and how much you
> want to spend updating user-space. OpenJDK is fine, if you need a JIT
> you'll have to add support for that architecture anyway. But others are
> arch-agnostic, you just recompile to your target. It's not an ABI
> problem, more of an API one.

The arch-agnosticism is my hope with this personality flag, it can be
added arch-agnostic userspace code and allow the application to work
everywhere, but it does have the downside of requiring that change to
user-space code.

> 
> The x86 case (and powerpc/arm64) was different, the 47-bit worked for a
> long time before expanding it. So it made a lot of sense to keep the
> same default.

Yes it is very reasonable that this solution was selected for those
architectures since the support for higher address spaces evolved in the
manner that it did!

- Charlie

> 
> Anyway, the prctl() can go both ways, either expanding or limiting the
> default address space. So I'd be fine with such interface.
> 
> -- 
> Catalin

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
