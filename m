Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C1AECE564
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Sep 2024 09:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wFaGTWD2y/UbhrYvV9DZ9opN/+PIXpebp4q4KlL2m5M=; b=zT+jCNY4v3GrwDp3wkEczBeD+e
	WSQgPGkIj380hP5VCaHXQprEPxJxS75h8dM1WEADL/ZhONAN30M5FaBkJl9mouIM7XecFfbq3MRtZ
	THMzKHwvF4lDN0UNr2dUeB3TUqeqDNsaeO9AwFuvvtjvYLE5qINqOQagjJsfX2IWkREtMpb1cjxiy
	oqTBPs32h7R/lTb2n588libeF8sMPpctkfAK+8+GzF6VxKvbi0Hx5+CWTAKA6Iuh2TOUIh2NkU/vy
	i+dtkmht/GncoXgLhkUrk3GS11LnKt/HAu9A4UzBM0Qk61URCFiSVuwgyPZkFXuWoHs0lWBZntA8C
	2qLy7ojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwxB-00000004y2J-0se6;
	Tue, 10 Sep 2024 09:14:29 +0000
Received: from flow3-smtp.messagingengine.com ([103.168.172.138])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwx7-00000004y0T-1Wrn;
	Tue, 10 Sep 2024 09:14:27 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id 72BC5200351;
	Tue, 10 Sep 2024 05:14:21 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 10 Sep 2024 05:14:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1725959661;
	 x=1725966861; bh=0bAs8GYS7XnporkOcRS5T4HRjTKpKe/QReainQI38Rk=; b=
	gDz+28EpjBqcJxXIpE07fsC74DAIbGxqo+wO/HvSw2cBjD0C4R6ZpUDaWI8whYgB
	Uou5tC2Ba2wAK+EqftPNq2n28JERnlqyobUzsSO7FOGcG9ZiHwpfeJASHNlk/d4X
	5WiSttpIB5Eir9pgs0kvpEK0oEXGwRcZGRDrgUdP8vFhxfezO3ZRebg6KxQY8DB+
	Uhf5KhhI6mL50jLO0daKWiHfpjmqkQas8EX/yg3llN0VUKg/Stthb0rDw6zcxqPY
	hlQQwIDg5uokWvMGZ5nIpVqoej/xmK+OuzWbc01t+AIEgASbJhDVMG1M0JMEeFDW
	72pPfdCEMdc8thjma5PNPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725959661; x=
	1725966861; bh=0bAs8GYS7XnporkOcRS5T4HRjTKpKe/QReainQI38Rk=; b=r
	Wap/EB3CA7vwicHILWXH6WMegg0FjR1Y0PbkSlHz6bdN930Oik8Wzk0mX3oX3Dcf
	mgJex09u2n+JG/FORnOd62+EaW184geOkclWYSUlgQn8nU841vhkp+eh4R+ZLYk7
	DrXAGb6hkGTp5ublWeGD9m4c/xVj/Mak9mwuU7MvtygsYDeDF+kcsBRlQbRYQPY8
	fUF+xTxPfulNUbAFbGAzpDkalWbBpwaOe3FDeFX0A25/64tjJrpUw5GkeufjRD7V
	NNqgO+ua3k+FdgEB7he2co98A/HrB++MPt6MD+fMHIqTQJpQcTBj2Aey7tX4yR1y
	Qda9OdbsMwbeGeP9pgQAw==
X-ME-Sender: <xms:6w3gZtSNigwJbM4kq3Ho3lz6Oyxs7tmCSsiSxXHZ1gWG3xLgjltsRg>
    <xme:6w3gZmz30LEeOyALW1olDfDteOenIRlWDAxhJJLR8EqdfxeQSGx_mOP6lWh8qZwIG
    mGAzeEUWvS9rB01ltA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiledguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegthh
    hrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepuggr
    vhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmphgvsegvlhhlvghrmh
    grnhdrihgurdgruhdprhgtphhtthhopegrnhgurhgvrghssehgrghishhlvghrrdgtohhm
    pdhrtghpthhtoheptghhrhhishdrthhorhgvkhesghhmrghilhdrtghomhdprhgtphhtth
    hopehmrghtthhsthekkeesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:6w3gZi25NCuMYsHvF4JPJ5-Hsx2gk93DZNkK5pJU4nxaCreHeSGRXw>
    <xmx:6w3gZlCyMMRfwGGvEKVgxWZ3M-1Ey3cenNfMfzJzIgKOfMHnT6AIrA>
    <xmx:6w3gZmiQ80aB7sHrPICA36rJejIl4DPGoBMWO4CM1C6uPQJRJXf-MA>
    <xmx:6w3gZpqIONrFxQiuso8dhcouvVRtfzvSTIDT18bekI9WMbAHfJmS_g>
    <xmx:7Q3gZqx1eEmFAKZo4yINUBS6CDSl30x6UdV96JYbm1dLqVF0ba9ZAB3I>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 02253222006F; Tue, 10 Sep 2024 05:14:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 10 Sep 2024 09:13:33 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Charlie Jenkins" <charlie@rivosinc.com>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>
Cc: "Richard Henderson" <richard.henderson@linaro.org>,
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
 "Vlastimil Babka" <vbabka@suse.cz>, shuah <shuah@kernel.org>,
 "Christoph Hellwig" <hch@infradead.org>,
 "Michal Hocko" <mhocko@suse.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 "Chris Torek" <chris.torek@gmail.com>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Message-Id: <89d21669-8daa-4225-b6d2-33d439ebd746@app.fastmail.com>
In-Reply-To: <Zt+DGHZrHFxfq7xo@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <58f39d58-579e-4dd3-8084-baebf86f1ae0@lucifer.local>
 <7be08ea9-f343-42da-805f-e5f0d61bde26@app.fastmail.com>
 <016c7857-9ea8-4333-96e6-3ae3870f375f@lucifer.local> <Zt+DGHZrHFxfq7xo@ghost>
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to 47 bits
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_021425_821570_E4957FA6 
X-CRM114-Status: GOOD (  25.98  )
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

On Mon, Sep 9, 2024, at 23:22, Charlie Jenkins wrote:
> On Fri, Sep 06, 2024 at 10:52:34AM +0100, Lorenzo Stoakes wrote:
>> On Fri, Sep 06, 2024 at 09:14:08AM GMT, Arnd Bergmann wrote:
>> The intent is to optionally be able to run a process that keeps higher bits
>> free for tagging and to be sure no memory mapping in the process will
>> clobber these (correct me if I'm wrong Charlie! :)
>> 
>> So you really wouldn't want this if you are using tagged pointers, you'd
>> want to be sure literally nothing touches the higher bits.

My understanding was that the purpose of the existing design
is to allow applications to ask for a high address without having
to resort to the complexity of MAP_FIXED.

In particular, I'm sure there is precedent for applications that
want both tagged pointers (for most mappings) and untagged pointers
(for large mappings). With a per-mm_struct or per-task_struct
setting you can't do that.

> Various architectures handle the hint address differently, but it
> appears that the only case across any architecture where an address
> above 47 bits will be returned is if the application had a hint address
> with a value greater than 47 bits and was using the MAP_FIXED flag.
> MAP_FIXED bypasses all other checks so I was assuming that it would be
> logical for MAP_FIXED to bypass this as well. If MAP_FIXED is not set,
> then the intent is for no hint address to cause a value greater than 47
> bits to be returned.

I don't think the MAP_FIXED case is that interesting here because
it has to work in both fixed and non-fixed mappings.

>> This would be more consistent vs. other arches.
>
> Yes riscv is an outlier here. The reason I am pushing for something like
> a flag to restrict the address space rather than setting it to be the
> default is it seems like if applications are relying on upper bits to be
> free, then they should be explicitly asking the kernel to keep them free
> rather than assuming them to be free.

Let's see what the other architectures do and then come up with
a way that fixes the pointer tagging case first on those that are
broken. We can see if there needs to be an extra flag after that.
Here is what I found:

- x86_64 uses DEFAULT_MAP_WINDOW of BIT(47), uses a 57 bit
  address space when an addr hint is passed.
- arm64 uses DEFAULT_MAP_WINDOW of BIT(47) or BIT(48), returns
  higher 52-bit addresses when either a hint is passed or
  CONFIG_EXPERT and CONFIG_ARM64_FORCE_52BIT is set (this
  is a debugging option)
- ppc64 uses a DEFAULT_MAP_WINDOW of BIT(47) or BIT(48),
  returns 52 bit address when an addr hint is passed
- riscv uses a DEFAULT_MAP_WINDOW of BIT(47) but only uses
  it for allocating the stack below, ignoring it for normal
  mappings
- s390 has no DEFAULT_MAP_WINDOW but tried to allocate in
  the current number of pgtable levels and only upgrades to
  the next level (31, 42, 53, 64 bits) if a hint is passed or
  the current level is exhausted.
- loongarch64 has no DEFAULT_MAP_WINDOW, and a default VA
  space of 47 bits (16K pages, 3 levels), but can support
  a 55 bit space (64K pages, 3 levels).
- sparc has no DEFAULT_MAP_WINDOW and up to 52 bit VA space.
  It may allocate both positive and negative addresses in
  there. (?)
- mips64, parisc64 and alpha have no DEFAULT_MAP_WINDOW and
  at most 48, 41 or 39 address bits, respectively.

I would suggest these changes:

- make riscv enforce DEFAULT_MAP_WINDOW like x86_64, arm64
   and ppc64, leave it at 47

- add DEFAULT_MAP_WINDOW on loongarch64 (47/48 bits
  based on page size), sparc (48 bits) and s390 (unsure if
  42, 53, 47 or 48 bits)

- leave the rest unchanged.

       Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
