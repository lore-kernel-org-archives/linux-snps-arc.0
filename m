Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B51CE7AE0
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Sep 2024 07:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OwPA8SzWfLv6HJhGBjLE1pAnOtPhIC5K0whn3HLCpXI=; b=ikrX68+aWI7EMVp9TIWOoQCr1T
	MooVWJUtlL52uihYwfyHCUSSExdAymJfhFyjM3xUgGXUyf1Z577wRqqfQUALch8Oje0pv3/5EeCPz
	m3nhyKBBteuurIyxJd7U7NxM9qM5LwPVyHV10oiRZCf78zba+KIivfxAB6Ocdu1wdUFcrrQw6vhjD
	yUIboA7GW+OgOazDBfwwPQHWdGnuslDVSk0Pha0jYUQMg0R7c0ghVeQnxhzyeOr33ZCJbgSdEHg2w
	yI+PH/eKbqx9ncRQSCt5+JUBH6FYDU8QTLILIEx/HFJlyEdz0dsKVbs86zciRlNuNeKYPVqz8vF6E
	7Qs2EFfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smTPA-0000000B5Br-3Mtc;
	Fri, 06 Sep 2024 07:29:16 +0000
Received: from flow1-smtp.messagingengine.com ([103.168.172.136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smTEP-0000000B3Kb-0kUX;
	Fri, 06 Sep 2024 07:18:10 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id E698B2002CB;
	Fri,  6 Sep 2024 03:18:07 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 06 Sep 2024 03:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725607087;
	 x=1725614287; bh=v3KUbqaJkdY70T8W1uPjXNY2qtbx3TSnJ5p4uWowLhw=; b=
	aLq1/tQMzmLulGgoq1JTbuWQ4lSo6PtfGwXy1aA73MEfseBN97Y+UmeAAjHfyg/5
	jUbmy+yH4P6nI7XZUXIJ1fG6Cexa4OKSy8o2PK9JUPEoPIcA5o18rcnBgyp54w0j
	2J8HZhcPE5rKzsA2DhQEFHocMDIE73Q4lMwekiiRSf3QhtOaMbo0leRXV/N0UEdy
	TX61xKsIdM76ba7PDckxmgH6aYJo4Ou5x/SHcQtxwK/poLKsJ6Tt+8HVdGUlRJlv
	xKtQPovCqqn/VszCPDR9Vwn6wIYfV/BLj4wFFTd9FY1pLuiBxOlfJ0R7ifNJ/oov
	cEh7czryvx5BZskI5QQnUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725607087; x=
	1725614287; bh=v3KUbqaJkdY70T8W1uPjXNY2qtbx3TSnJ5p4uWowLhw=; b=o
	2QCm3RUBkvdyIc0G6rV/KlX5op/78YryYTFHh+oWZtXUPin2BDjVFk3IE6vP9veB
	l1Qbfba0iQxH5dD906hjINFvCE4HARQyl2AFsCXjJwAXKdqH80qfAJiZZ+e9t1xc
	/S+a6hP4Se7CKsKjopgkM2LD04E44C4dQii9oUE5P/T/aWv4eDrHBVz9C/vn0ERj
	IdHM5EvzCq9heAtXxhs1ZvyZxgE7JWx/Vs4MHe3pNPNcOqPNJ2zXyD+Rb2Okgu3t
	1auhr89onDdcWYwo/aykRC/NWJt7dwj7B/GpNH40FTxRpvPvRAJkuqlrHh2sgBIU
	sQ3zk2hwxSi+MW78Hmx+w==
X-ME-Sender: <xms:rKzaZt5PUx2awmbvkLlPn1QnBtbVF79QfYME7xJL0tjtTTBBxExbCw>
    <xme:rKzaZq6R2ML2ByKU5dFHXJWnqNZIlkfNq_Qw9_HTFNQNz4yK_avaOOWHRIj8vz038
    kstsUHtBi-0YZObKdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeitddguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeh
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpd
    hrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgt
    phhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheptg
    hhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegu
    rghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhhpvgesvghllhgvrh
    hmrghnrdhiugdrrghupdhrtghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtgho
    mhdprhgtphhtthhopegthhhrihhsrdhtohhrvghksehgmhgrihhlrdgtohhmpdhrtghpth
    htohepmhgrthhtshhtkeeksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:rKzaZkez4LA7tX9hpcEB8D9J8BRBU7hdAy_-dxVzqgTW3TLpWq-U3g>
    <xmx:rKzaZmKLFU2eWg80ImcEkx9_a8GMHJ46iO2onMEowq5enIahZloO2w>
    <xmx:rKzaZhIpAuSbbsH3org--1LUAk0dAT6rezieBcnRKofjTIlaF8HO8A>
    <xmx:rKzaZvxEUP-4UOlB4rgdIuaaEnQO1PjOxXxM57Y6bUSNFWDtErzcYg>
    <xmx:r6zaZnZCpuO_FJUglH9u5W_GV8xg0dvGTBq8eZ4ASwuda2wXiCUWanxI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 99D14222006F; Fri,  6 Sep 2024 03:18:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 06 Sep 2024 07:17:44 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Charlie Jenkins" <charlie@rivosinc.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Matt Turner" <mattst88@gmail.com>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>, guoren <guoren@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Gerald Schaefer" <gerald.schaefer@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Andy Lutomirski" <luto@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Muchun Song" <muchun.song@linux.dev>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, shuah <shuah@kernel.org>,
 "Christoph Hellwig" <hch@infradead.org>,
 "Michal Hocko" <mhocko@suse.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 "Chris Torek" <chris.torek@gmail.com>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Message-Id: <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
In-Reply-To: <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to 47 bits
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_001809_324331_88ADDF7E 
X-CRM114-Status: GOOD (  14.91  )
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

On Thu, Sep 5, 2024, at 21:15, Charlie Jenkins wrote:
> Create a personality flag ADDR_LIMIT_47BIT to support applications
> that wish to transition from running in environments that support at
> most 47-bit VAs to environments that support larger VAs. This
> personality can be set to cause all allocations to be below the 47-bit
> boundary. Using MAP_FIXED with mmap() will bypass this restriction.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

I think having an architecture-independent mechanism to limit the size
of the 64-bit address space is useful in general, and we've discussed
the same thing for arm64 in the past, though we have not actually
reached an agreement on the ABI previously.

> @@ -22,6 +22,7 @@ enum {
>  	WHOLE_SECONDS =		0x2000000,
>  	STICKY_TIMEOUTS	=	0x4000000,
>  	ADDR_LIMIT_3GB = 	0x8000000,
> +	ADDR_LIMIT_47BIT = 	0x10000000,
> };

I'm a bit worried about having this done specifically in the
personality flag bits, as they are rather limited. We obviously
don't want to add many more such flags when there could be
a way to just set the default limit.

It's also unclear to me how we want this flag to interact with
the existing logic in arch_get_mmap_end(), which attempts to
limit the default mapping to a 47-bit address space already.

For some reason, it appears that the arch_get_mmap_end()
logic on RISC-V defaults to the maximum address
space for the 'addr==0' case which is inconsistentn with
the other architectures, so we should probably fix that
part first, possibly moving more of that logic into a
shared implementation.

      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
