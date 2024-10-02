Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75539CF6D2C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Oct 2024 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QtxiaY4LtMdkF0Q0WhxWxfaEL9R+gM8y2V0lFF3UM6A=; b=fvOc6wr5NvEZGB
	0l1pyDQjLGseCusHDkJdIt9hcnA1yZ2eRJRuVM6c8j6HWswg5zNyEILdBVog4av+ANrxd25+pKSTI
	cKpSTWdg2ojhRh/c6oDbLRRd9aatGe/nm2K3KimLeytkqfRe5Qqj9meM+BdH4T6Wscm64L/O+Cbs1
	s4Jddw4lR7IRbvxZV4Ds+ZvwyGOijV1yZ7uf7+jeHgLAIhVJceaSvajcZUeK+I7+7AHoWn5kWswYe
	O9BQdUsNm1rROXhJRbVxHOBrNE42+XXpjky+rHtMudjDTcZGJPlGoCTsIS2r3dyvltlvCYv9MKGyW
	xf8QnJkAVIOVQj6I2+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw0JL-00000006NYT-0lZo;
	Wed, 02 Oct 2024 14:26:39 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw0JH-00000006NWY-35SO
	for linux-snps-arc@lists.infradead.org;
	Wed, 02 Oct 2024 14:26:37 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7db238d07b3so5565251a12.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 02 Oct 2024 07:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1727879194; x=1728483994; darn=lists.infradead.org;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uOcXAMjC7XDZjDd/akc0amsyLu8m5OVtpNVeGFczMRY=;
        b=KleRyKXYCpRFPkSVnNYB/nux+MZamaRKRtylbpyIkTc53YB0WOvMBanBXOcvC4oZWF
         t5AEdHkqfr8A0C+TMXFyu2K1GTKV9B223ujgangobkq3Uvu4MzEnBFOG9XUbY/XxBxMS
         UOhJBXy/g+Y7hF4rU/QZ6ZrZnnRcCpbnslG0izTreoemuajSEFNdGldroxlY+Erd64qH
         Qgysp4LGwojz+KoczDlq0/xYAm5dwGuQi3yGyJJV0VVxJ5ODlxqzTuKXbHnVAHmkNrti
         c2mOxn+bv5rm6mA4xFO9vi9kXF2TQ8++JKMHhwGjnSkBqv4whdgXbSX8tSfRycBopxIy
         WmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727879194; x=1728483994;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uOcXAMjC7XDZjDd/akc0amsyLu8m5OVtpNVeGFczMRY=;
        b=LxH0ZJPvEMCi65SsPSRv1D7U7Z5WdPcJU5lZpi1+6Uwh7FZRQayuhdwAy+OTJAyWJL
         P/O9FSLq7w9Wpx80KQVfBJDX6qdW1NNkcN4qf2h3qFfLsqvOIsyRf09msMiucnTCfPIT
         NEEfNMiGeKWhXN4FUH3nwVVrlWkzstJP3s+elQWwmUtXe6PWm7uKJrp8IX0y0SnHEk59
         3GggesNUF1FGfZY+sZwcZQdACm4F3rJRu3OY4SuYR0iRaowULaVgPNFOh69cwBgL/DJq
         AF/B2lpMgl+gCFGmwCbD6GT8UKs79D1Ujnu2uQZPBO5e5P+2QdBNWf55DLPlu+MWs1TI
         qNEg==
X-Forwarded-Encrypted: i=1; AJvYcCXXGSdJ0VFc2p8ixG85dB+euk89RrAg1yKMbL9l2CNtwLhTeBkJ6boTe+1L0iUc90sMVTXOTLlEN/T6THA9vw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUzCT6FEOpPf29OgUP2wy1yqsoUD8Le0X6S6huM5Q0IUNGg8mr
	CrFrQkebUnCdCTMgO3q80uVBvxPmwb7Z1nY4XCbBMZQ4dI51tuOMIONO4virXww=
X-Google-Smtp-Source: AGHT+IHNNKdcu5kwdDsRcpptaNSlsD6gvL0I++M5UX28lY+Nyv67bj3x07yZ+LRvd6o8h2+EV/Ug6A==
X-Received: by 2002:a17:90a:be10:b0:2e0:7b2b:f76 with SMTP id 98e67ed59e1d1-2e18468cc49mr4757443a91.19.1727879193916;
        Wed, 02 Oct 2024 07:26:33 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e18f79bb04sm1615137a91.30.2024.10.02.07.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 07:26:32 -0700 (PDT)
Date: Wed, 02 Oct 2024 07:26:32 -0700 (PDT)
X-Google-Original-Date: Wed, 02 Oct 2024 07:26:31 PDT (-0700)
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to 47 bits
In-Reply-To: <ZuSoxh5U3Kj1XgGq@ghost>
CC: Catalin Marinas <catalin.marinas@arm.com>, Liam.Howlett@oracle.com,
  Arnd Bergmann <arnd@arndb.de>, guoren@kernel.org, Richard Henderson <richard.henderson@linaro.org>,
  ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@kernel.org, linux@armlinux.org.uk,
  chenhuacai@kernel.org, kernel@xen0n.name, tsbogend@alpha.franken.de,
  James.Bottomley@hansenpartnership.com, deller@gmx.de, mpe@ellerman.id.au, npiggin@gmail.com,
  christophe.leroy@csgroup.eu, naveen@kernel.org, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
  hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
  ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net,
  andreas@gaisler.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
  dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, peterz@infradead.org,
  muchun.song@linux.dev, akpm@linux-foundation.org, vbabka@suse.cz, shuah@kernel.org,
  Christoph Hellwig <hch@infradead.org>, mhocko@suse.com, kirill@shutemov.name, chris.torek@gmail.com,
  linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
  linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
  loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
  sparclinux@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
  linux-abi-devel@lists.sourceforge.net
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Charlie Jenkins <charlie@rivosinc.com>, lorenzo.stoakes@oracle.com
Message-ID: <mhng-411f66df-5f86-4aeb-b614-a6f64587549c@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_072636_007447_78A9238D 
X-CRM114-Status: GOOD (  65.13  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0668297686644452480=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============0668297686644452480==
Content-Type: text/plain

On Fri, 13 Sep 2024 14:04:06 PDT (-0700), Charlie Jenkins wrote:
> On Fri, Sep 13, 2024 at 08:41:34AM +0100, Lorenzo Stoakes wrote:
>> On Wed, Sep 11, 2024 at 11:18:12PM GMT, Charlie Jenkins wrote:
>> > On Wed, Sep 11, 2024 at 07:21:27PM +0100, Catalin Marinas wrote:
>> > > On Tue, Sep 10, 2024 at 05:45:07PM -0700, Charlie Jenkins wrote:
>> > > > On Tue, Sep 10, 2024 at 03:08:14PM -0400, Liam R. Howlett wrote:
>> > > > > * Catalin Marinas <catalin.marinas@arm.com> [240906 07:44]:
>> > > > > > On Fri, Sep 06, 2024 at 09:55:42AM +0000, Arnd Bergmann wrote:
>> > > > > > > On Fri, Sep 6, 2024, at 09:14, Guo Ren wrote:
>> > > > > > > > On Fri, Sep 6, 2024 at 3:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
>> > > > > > > >> It's also unclear to me how we want this flag to interact with
>> > > > > > > >> the existing logic in arch_get_mmap_end(), which attempts to
>> > > > > > > >> limit the default mapping to a 47-bit address space already.
>> > > > > > > >
>> > > > > > > > To optimize RISC-V progress, I recommend:
>> > > > > > > >
>> > > > > > > > Step 1: Approve the patch.
>> > > > > > > > Step 2: Update Go and OpenJDK's RISC-V backend to utilize it.
>> > > > > > > > Step 3: Wait approximately several iterations for Go & OpenJDK
>> > > > > > > > Step 4: Remove the 47-bit constraint in arch_get_mmap_end()
>> > >
>> > > Point 4 is an ABI change. What guarantees that there isn't still
>> > > software out there that relies on the old behaviour?
>> >
>> > Yeah I don't think it would be desirable to remove the 47 bit
>> > constraint in architectures that already have it.
>> >
>> > >
>> > > > > > > I really want to first see a plausible explanation about why
>> > > > > > > RISC-V can't just implement this using a 47-bit DEFAULT_MAP_WINDOW
>> > > > > > > like all the other major architectures (x86, arm64, powerpc64),
>> > > > > >
>> > > > > > FWIW arm64 actually limits DEFAULT_MAP_WINDOW to 48-bit in the default
>> > > > > > configuration. We end up with a 47-bit with 16K pages but for a
>> > > > > > different reason that has to do with LPA2 support (I doubt we need this
>> > > > > > for the user mapping but we need to untangle some of the macros there;
>> > > > > > that's for a separate discussion).
>> > > > > >
>> > > > > > That said, we haven't encountered any user space problems with a 48-bit
>> > > > > > DEFAULT_MAP_WINDOW. So I also think RISC-V should follow a similar
>> > > > > > approach (47 or 48 bit default limit). Better to have some ABI
>> > > > > > consistency between architectures. One can still ask for addresses above
>> > > > > > this default limit via mmap().
>> > > > >
>> > > > > I think that is best as well.
>> > > > >
>> > > > > Can we please just do what x86 and arm64 does?
>> > > >
>> > > > I responded to Arnd in the other thread, but I am still not convinced
>> > > > that the solution that x86 and arm64 have selected is the best solution.
>> > > > The solution of defaulting to 47 bits does allow applications the
>> > > > ability to get addresses that are below 47 bits. However, due to
>> > > > differences across architectures it doesn't seem possible to have all
>> > > > architectures default to the same value. Additionally, this flag will be
>> > > > able to help users avoid potential bugs where a hint address is passed
>> > > > that causes upper bits of a VA to be used.
>> > >
>> > > The reason we added this limit on arm64 is that we noticed programs
>> > > using the top 8 bits of a 64-bit pointer for additional information.
>> > > IIRC, it wasn't even openJDK but some JavaScript JIT. We could have
>> > > taught those programs of a new flag but since we couldn't tell how many
>> > > are out there, it was the safest to default to a smaller limit and opt
>> > > in to the higher one. Such opt-in is via mmap() but if you prefer a
>> > > prctl() flag, that's fine by me as well (though I think this should be
>> > > opt-in to higher addresses rather than opt-out of the higher addresses).
>> >
>> > The mmap() flag was used in previous versions but was decided against
>> > because this feature is more useful if it is process-wide. A
>> > personality() flag was chosen instead of a prctl() flag because there
>> > existed other flags in personality() that were similar. I am tempted to
>> > use prctl() however because then we could have an additional arg to
>> > select the exact number of bits that should be reserved (rather than
>> > being fixed at 47 bits).
>>
>> I am very much not in favour of a prctl(), it would require us to add state
>> limiting the address space and the timing of it becomes critical. Then we
>> have the same issue we do with the other proposals as to - what happens if
>> this is too low?
>>
>> What is 'too low' varies by architecture, and for 32-bit architectures
>> could get quite... problematic.
>>
>> And again, wha is the RoI here - we introducing maintenance burden and edge
>> cases vs. the x86 solution in order to... accommodate things that need more
>> than 128 TiB of address space? A problem that does not appear to exist in
>> reality?
>>
>> I suggested the personality approach as the least impactful compromise way
>> of this series working, but I think after what Arnd has said (and please
>> forgive me if I've missed further discussion have been dipping in and out
>> of this!) - adapting risc v to the approach we take elsewhere seems the
>> most sensible solution to me.

There's one wrinkle here: RISC-V started out with 39-bit VAs by default, 
and we've had at least one report of userspace breaking when moving to 
48-bit addresses.  That was just address sanitizer, so maybe nobody 
cares, but we're still pretty early in the transition to 48-bit systems 
(most of the HW is still 39-bit) so it's not clear if that's going to be 
the only bug.

So we're sort of in our own world of backwards compatibility here.  
39-bit vs 48-bit is just an arbitrary number, but "38 bits are enough 
for userspace" doesn't seem as sane a "47 bits are enough for 
userspace".  Maybe the right answer here is to just say the 38-bit 
userspace is broken and that it's a Linux-ism that 64-bit sytems have 
47-bit user addresses by default.

>> This remains something we can revisit in future if this turns out to be
>> egregious.
>>
>
> I appreciate Arnd's comments, but I do not think that making 47-bit the
> default is the best solution for riscv. On riscv, support for 48-bit
> address spaces was merged in 5.17 and support for 57-bit address spaces
> was merged in 5.18 without changing the default addresses provided by
> mmap(). It could be argued that this was a mistake, however since at the
> time there didn't exist hardware with larger address spaces it wasn't an
> issue. The applications that existed at the time that relied on the
> smaller address spaces have not been able to move to larger address
> spaces. Making a 47-bit user-space address space default solves the
> problem, but that is not arch agnostic, and can't be since of the
> varying differences in page table sizes across architectures, which is
> the other part of the problem I am trying to solve.
>
>> >
>> > Opting-in to the higher address space is reasonable. However, it is not
>> > my preference, because the purpose of this flag is to ensure that
>> > allocations do not exceed 47-bits, so it is a clearer ABI to have the
>> > applications that want this guarantee to be the ones setting the flag,
>> > rather than the applications that want the higher bits setting the flag.
>>
>> Perfect is the enemy of the good :) and an idealised solution may not end
>> up being something everybody can agree on.
>
> Yes you are totally right! Although this is not my ideal solution, it
> sufficiently accomplishes the goal so I think it is reasonable to
> implement this as a personality flag.
>
>>
>> >
>> > - Charlie
>> >
>> > >
>> > > --
>> > > Catalin
>> >
>> >
>> >


--===============0668297686644452480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============0668297686644452480==--
