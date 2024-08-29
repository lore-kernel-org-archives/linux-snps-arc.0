Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ABFC87FC3
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Aug 2024 17:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=sOPo/pX/F5KwrbRivkRddr1k4z0vs0YpSwrudcBDJ6I=; b=zFhgR8XIKnbYJ8
	/H38qidi0pZKwZ/o3sGHvxVvzu6JkmDXbp6PzcJ+TidVJIF/TUfiWYdG5a2wJ3aDq6Own7hOZmCFN
	F3qrw+WgIRGvwWI9v5z56iJSnhrTnN1Dp61kPmtHVK3rjcJeCQKOCe4tCX759JAd5tofaTCwGoNxb
	H2YoJXZWuXsCBYe4ba7hxnBaBluRtPN/0mig59SRvnLgoKGfX9DUHI3mFuRPxBSvIpzZ2UduS8q2Y
	K9mA/8K6Ktut0aut71wqhbNJTLR5NOKEmrwJeyk4uBLFSsT1TzZRY0V4k0KeBYuRmMyHy++VXPxEf
	fDSef4VP8ekTpqpRdaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjiVy-00000002wpo-3LOQ;
	Thu, 29 Aug 2024 17:00:54 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjiVu-00000002wnW-06CO
	for linux-snps-arc@lists.infradead.org;
	Thu, 29 Aug 2024 17:00:52 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7142e002aceso759299b3a.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 29 Aug 2024 10:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1724950847; x=1725555647; darn=lists.infradead.org;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v6yVeKIAZdNlCjwxHunt8GrVJ/ApsEacIVWq6Y0ogzc=;
        b=PLQHFEd8gYgBk3xzB/ylPZG2GVd9aJTtdcX1+V0sKjneZWSfHChVxx3/uT7jw1EVJi
         B82TcNPf0pQ+7B1ENZfeYO0Ct8QtUVLCIrxfOVRkfVTeKjRqm1G1+wstTm0wRH1xupaP
         2ertIRxXsvlvZVizek0iR4VWyQm2tfkLLLQ9aLiCPWxe5AE5JC4WFvFmhZ1Vvy2daN+8
         WaLruqlFLqarU9sI48kFZvjUd9Pc8/vrYzvPBb0EM0wdNIg9pWFgbNONjRzXylS9roCN
         k8mZZ8Vw0j2O++oZe3jW12KLg8Tb6CuS7vDEDAQhPaOw+wWoCuJzGCJK/dVFQ3Ku+LDF
         vCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724950847; x=1725555647;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v6yVeKIAZdNlCjwxHunt8GrVJ/ApsEacIVWq6Y0ogzc=;
        b=P1UlQWa0SxS5EGlyVxZlfUVEMe/k7fXPjpEgAtBvkAZ3GEcqA05JSIYgAwScWNO3nf
         ulfZv0uyPX3BIxw1Si0E7XYZx9RWzYbnYmFY3oD3Lta+Rw9mmaY+Gd0E7dQ6tgikfXim
         v/wljWxT/hS8wMBjvpzh1rErGl98P/7+pL6goKy/qB5T3toaXcy6VRDsy4F9BF5d7C0B
         /RRsDF0aHm6e5S9iBS1Axo0AqZvv6O7E2O29OYEKG61DpnY/VDR+Faww4QUaHpnx9AZr
         3vYiYvz9065Hw6H8frsri6YT8Fv1evyM7mCTuMavkArGiUY0CHZ0kmIM1gz30LMfqRcD
         VItg==
X-Forwarded-Encrypted: i=1; AJvYcCUVQmJRBsbD4anjU6F0hpJ+vcwseXIRLap31AzgZwTj9iCK1mBxbfrZVMs2m9neP8gGgEEgQKsEjWheSp7AdA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx78au7QT1ce0in5+DEOxJSpgQhwo21o+tgJdvN9ZKyKvsyHGMK
	VatF3/clId4H21LxgSCrLCcxyjToKu/Fk0MY6pIc8PVOB8zUlh9/pilyPuDkF84=
X-Google-Smtp-Source: AGHT+IH3f6jrHjn3UecOjnnTSh7f1mjtosaBnqcvhiQTmwoBq2WfcZwsjSYUQZNm8240zpeF9tE3wA==
X-Received: by 2002:a05:6a00:91a0:b0:70d:2b1b:a37f with SMTP id d2e1a72fcca58-715dfc22895mr4520173b3a.24.1724950846693;
        Thu, 29 Aug 2024 10:00:46 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e77438dsm1466259a12.27.2024.08.29.10.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 10:00:45 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:00:45 -0700 (PDT)
X-Google-Original-Date: Thu, 29 Aug 2024 10:00:42 PDT (-0700)
Subject: Re: [PATCH RFC v2 0/4] mm: Introduce MAP_BELOW_HINT
In-Reply-To: <a048515e-f6e4-4d77-920b-6742529f3ca4@suse.cz>
CC: Charlie Jenkins <charlie@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
  Richard Henderson <richard.henderson@linaro.org>, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@kernel.org,
  linux@armlinux.org.uk, guoren@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
  tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com, deller@gmx.de, mpe@ellerman.id.au,
  npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, agordeev@linux.ibm.com,
  gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@linux.ibm.com,
  svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de,
  davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
  dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, peterz@infradead.org,
  muchun.song@linux.dev, akpm@linux-foundation.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
  shuah@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-arch@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
  linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org,
  linux-kselftest@vger.kernel.org, linux-api@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vbabka@suse.cz
Message-ID: <mhng-77a89c0b-bfdf-4a6f-bb6e-cee3ff1efbc6@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_100050_073461_932A5966 
X-CRM114-Status: GOOD (  34.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, 29 Aug 2024 02:02:34 PDT (-0700), vbabka@suse.cz wrote:
> Such a large recipient list and no linux-api. CC'd, please include it on
> future postings.
>
> On 8/29/24 09:15, Charlie Jenkins wrote:
>> Some applications rely on placing data in free bits addresses allocated
>> by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
>> address returned by mmap to be less than the 48-bit address space,
>> unless the hint address uses more than 47 bits (the 48th bit is reserved
>> for the kernel address space).
>>
>> The riscv architecture needs a way to similarly restrict the virtual
>> address space. On the riscv port of OpenJDK an error is thrown if
>> attempted to run on the 57-bit address space, called sv57 [1].  golang
>> has a comment that sv57 support is not complete, but there are some
>> workarounds to get it to mostly work [2].
>>
>> These applications work on x86 because x86 does an implicit 47-bit
>> restriction of mmap() address that contain a hint address that is less
>> than 48 bits.
>>
>> Instead of implicitly restricting the address space on riscv (or any
>> current/future architecture), a flag would allow users to opt-in to this
>> behavior rather than opt-out as is done on other architectures. This is
>> desirable because it is a small class of applications that do pointer
>> masking.
>
> I doubt it's desirable to have different behavior depending on architecture.
> Also you could say it's a small class of applications that need more than 47
> bits.

We're sort of stuck with the architeture-depending behavior here: for 
the first few years RISC-V only had 39-bit VAs, so the defato uABI ended 
up being that userspace can ignore way more bits.  While 48 bits might 
be enough for everyone, 39 doesn't seem to be -- or at least IIRC when 
we tried restricting the default to that, we broke stuff.  There's also 
some other wrinkles like arbitrary bit boundaries in pointer masking and 
vendor-specific paging formats, but at some point we just end up down a 
rabbit hole of insanity there...

FWIW, I think that userspace depending on just tossing some VA bits 
because some kernels happened to never allocate from them is just 
broken, but it seems like other ports worked around the 48->57 bit 
transition and we're trying to do something similar for 39->48 (and that 
works with 49->57, as we'll have to deal with that eventually).

So that's basically how we ended up with this sort of thing: trying to 
do something similar without a flag broke userspace because we were 
trying to jam too much into the hints.  I couldn't really figure out a 
way to satisfy all the userspace constraints by just implicitly 
retrofitting behavior based on the hints, so we figured having an 
explicit flag to control the behavior would be the sanest way to go.

That said: I'm not opposed to just saying "depending on 39-bit VAs is 
broken" and just forcing people to fix it.

>> This flag will also allow seemless compatibility between all
>> architectures, so applications like Go and OpenJDK that use bits in a
>> virtual address can request the exact number of bits they need in a
>> generic way. The flag can be checked inside of vm_unmapped_area() so
>> that this flag does not have to be handled individually by each
>> architecture.
>>
>> Link:
>> https://github.com/openjdk/jdk/blob/f080b4bb8a75284db1b6037f8c00ef3b1ef1add1/src/hotspot/cpu/riscv/vm_version_riscv.cpp#L79
>> [1]
>> Link:
>> https://github.com/golang/go/blob/9e8ea567c838574a0f14538c0bbbd83c3215aa55/src/runtime/tagptr_64bit.go#L47
>> [2]
>>
>> To: Arnd Bergmann <arnd@arndb.de>
>> To: Richard Henderson <richard.henderson@linaro.org>
>> To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
>> To: Matt Turner <mattst88@gmail.com>
>> To: Vineet Gupta <vgupta@kernel.org>
>> To: Russell King <linux@armlinux.org.uk>
>> To: Guo Ren <guoren@kernel.org>
>> To: Huacai Chen <chenhuacai@kernel.org>
>> To: WANG Xuerui <kernel@xen0n.name>
>> To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>> To: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
>> To: Helge Deller <deller@gmx.de>
>> To: Michael Ellerman <mpe@ellerman.id.au>
>> To: Nicholas Piggin <npiggin@gmail.com>
>> To: Christophe Leroy <christophe.leroy@csgroup.eu>
>> To: Naveen N Rao <naveen@kernel.org>
>> To: Alexander Gordeev <agordeev@linux.ibm.com>
>> To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
>> To: Heiko Carstens <hca@linux.ibm.com>
>> To: Vasily Gorbik <gor@linux.ibm.com>
>> To: Christian Borntraeger <borntraeger@linux.ibm.com>
>> To: Sven Schnelle <svens@linux.ibm.com>
>> To: Yoshinori Sato <ysato@users.sourceforge.jp>
>> To: Rich Felker <dalias@libc.org>
>> To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
>> To: David S. Miller <davem@davemloft.net>
>> To: Andreas Larsson <andreas@gaisler.com>
>> To: Thomas Gleixner <tglx@linutronix.de>
>> To: Ingo Molnar <mingo@redhat.com>
>> To: Borislav Petkov <bp@alien8.de>
>> To: Dave Hansen <dave.hansen@linux.intel.com>
>> To: x86@kernel.org
>> To: H. Peter Anvin <hpa@zytor.com>
>> To: Andy Lutomirski <luto@kernel.org>
>> To: Peter Zijlstra <peterz@infradead.org>
>> To: Muchun Song <muchun.song@linux.dev>
>> To: Andrew Morton <akpm@linux-foundation.org>
>> To: Liam R. Howlett <Liam.Howlett@oracle.com>
>> To: Vlastimil Babka <vbabka@suse.cz>
>> To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> To: Shuah Khan <shuah@kernel.org>
>> Cc: linux-arch@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-alpha@vger.kernel.org
>> Cc: linux-snps-arc@lists.infradead.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-csky@vger.kernel.org
>> Cc: loongarch@lists.linux.dev
>> Cc: linux-mips@vger.kernel.org
>> Cc: linux-parisc@vger.kernel.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-s390@vger.kernel.org
>> Cc: linux-sh@vger.kernel.org
>> Cc: sparclinux@vger.kernel.org
>> Cc: linux-mm@kvack.org
>> Cc: linux-kselftest@vger.kernel.org
>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>>
>> Changes in v2:
>> - Added much greater detail to cover letter
>> - Removed all code that touched architecture specific code and was able
>>   to factor this out into all generic functions, except for flags that
>>   needed to be added to vm_unmapped_area_info
>> - Made this an RFC since I have only tested it on riscv and x86
>> - Link to v1: https://lore.kernel.org/r/20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com
>>
>> ---
>> Charlie Jenkins (4):
>>       mm: Add MAP_BELOW_HINT
>>       mm: Add hint and mmap_flags to struct vm_unmapped_area_info
>>       mm: Support MAP_BELOW_HINT in vm_unmapped_area()
>>       selftests/mm: Create MAP_BELOW_HINT test
>>
>>  arch/alpha/kernel/osf_sys.c                  |  2 ++
>>  arch/arc/mm/mmap.c                           |  3 +++
>>  arch/arm/mm/mmap.c                           |  7 ++++++
>>  arch/csky/abiv1/mmap.c                       |  3 +++
>>  arch/loongarch/mm/mmap.c                     |  3 +++
>>  arch/mips/mm/mmap.c                          |  3 +++
>>  arch/parisc/kernel/sys_parisc.c              |  3 +++
>>  arch/powerpc/mm/book3s64/slice.c             |  7 ++++++
>>  arch/s390/mm/hugetlbpage.c                   |  4 ++++
>>  arch/s390/mm/mmap.c                          |  6 ++++++
>>  arch/sh/mm/mmap.c                            |  6 ++++++
>>  arch/sparc/kernel/sys_sparc_32.c             |  3 +++
>>  arch/sparc/kernel/sys_sparc_64.c             |  6 ++++++
>>  arch/sparc/mm/hugetlbpage.c                  |  4 ++++
>>  arch/x86/kernel/sys_x86_64.c                 |  6 ++++++
>>  arch/x86/mm/hugetlbpage.c                    |  4 ++++
>>  fs/hugetlbfs/inode.c                         |  4 ++++
>>  include/linux/mm.h                           |  2 ++
>>  include/uapi/asm-generic/mman-common.h       |  1 +
>>  mm/mmap.c                                    |  9 ++++++++
>>  tools/include/uapi/asm-generic/mman-common.h |  1 +
>>  tools/testing/selftests/mm/Makefile          |  1 +
>>  tools/testing/selftests/mm/map_below_hint.c  | 32 ++++++++++++++++++++++++++++
>>  23 files changed, 120 insertions(+)
>> ---
>> base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
>> change-id: 20240827-patches-below_hint_mmap-b13d79ae1c55

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
