Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE562CE7AA4
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Sep 2024 21:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GVLmaL+pLPQzBTtbCoqaQhhGbkJZ6++Nn36leMkUn1w=; b=ApCjnNjt7D018c
	QsjZqmVOFQQsnGzn/mYRlF9RYLjkfcM5kxFO0z9bXwF/g0Owbqmx4fTFeW+n5/8Ux1aSHBQHuWwrB
	02TeuU3Zs8jTXL9v/FKKS79xpdgSjXfIOQhCqN43dY3q/QjdcptoG8/sjF4EFFHEe2kHvFSnIfxvU
	lbPv0MlPhrulxqXWNZgiFbZk4k+IMvTb6+pGuuNuhFgpg/dbFpWGsyNbh69BYWZaYOXB4LheWoBVx
	evXGjVMTPSgiBduGtCYnaeAPtof28U6b2+rmFJgBV/FBm0weh0fKCcLmRnrmEkq+ns9iTITeY5x21
	rcCx8VC9DBijOHKsYWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smJq0-00000009r0h-1eCc;
	Thu, 05 Sep 2024 21:16:20 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smJpu-00000009qwQ-2vy8
	for linux-snps-arc@lists.infradead.org;
	Thu, 05 Sep 2024 21:16:18 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5df9542f3d8so864686eaf.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 05 Sep 2024 14:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725570972; x=1726175772; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h1RxVlhkB8p72E7vZJvb+Ijp4614DvwE9gm+Vso2ack=;
        b=d1NYWcQ+n5bGChnt5WT2LECmjUO1uOEB041LyVkLcLMy3yO3X5eHVbK5wNw7walLLq
         3yDlp4SSLfrxgV0/6CqGrd3HTSQDlyXk3LoD/W315qYEdoAJ8g58cpWxgArClMRtdgTG
         qe8kWsK5Yd/tFO6GEnrgr6cC69TPdB5F2h7anz8uOXlQDAB9xDpNzko+9dmNJQE5RdRo
         V1hTp4d2l1pMEWiK0riGInl2up9g3hI8T0dT0PAHZy4MbiSJoCLQVd0VmEjbfKg6YDGC
         jApLJL4ZBELx5+QjEYXDou2MJn6IJh05p3/JvI6PH9tfSukIL8DiPqstnz2eEVAvF125
         rdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725570972; x=1726175772;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1RxVlhkB8p72E7vZJvb+Ijp4614DvwE9gm+Vso2ack=;
        b=IeXGkr2SIPjtBIL7cwCzU7TAfnmiNWXVH3lrwpkzDkpGx5kSH2CA3z9zoRLPkxDM+D
         /NGUnAKm2yewjXx1yp8tFXgXi0di4ihyOx9uhPvkyQyGQ0bpoRz0cVjKMPoXIagQSRLZ
         HsybywckBo7jIQLOkRJM30zYXleDyQLK21lBcX3eEJqhOhAqRf9d7sjMc1NHEjAg0Htp
         kDojBXTu/ZLLVFJOfaw+jeqHesTiDpQr/eoQALCPzkNywznKbHGaU3Z89Knl/cQ4INC4
         Ty8V7KYYbm1LQJWFT2bOsnPe0xh+1rzHZIk68cIE3FwbwicDiZfea9llqjtjnHZ8ZQfs
         Tm1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGdOYbpDICquwvISt2tMCKOf8wDuOTOPPXEq/yV75ehuW+jWaCKkpHwi0LVMrGZpxpdYP5AsHS9rmor7ghXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfs+wSGrwHBDymryW35If3lvdCNLqOTHWCZzbvtmisLtkrac4H
	IgTu76QsH9QEfa4BV8dWPZvKmTiktvNkuiZPYZKXDFX4IPb7V4rvsLFX667vCKM=
X-Google-Smtp-Source: AGHT+IFUGglg1gI40db05Oyw57X6jum9/dYSwirPMN5y+AFduyw81mLgzW8++XC4iGt5jarfSGqHMg==
X-Received: by 2002:a05:6358:4709:b0:1b8:3498:5ab2 with SMTP id e5c5f4694b2df-1b8386e10e6mr71603755d.18.1725570972065;
        Thu, 05 Sep 2024 14:16:12 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbda7abesm3775746a12.61.2024.09.05.14.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 14:16:11 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH RFC v3 0/2] mm: Introduce ADDR_LIMIT_47BIT personality flag
Date: Thu, 05 Sep 2024 14:15:50 -0700
Message-Id: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIYf2mYC/4XNTQrCMBAF4KtI1kaS6b8rQfAAbkVKmk7NgG1KU
 qJSendDVyKIyzeP+d7MPDpCz/abmTkM5MkOMSTbDdNGDTfk1MbMQEAqSij4qCZt0PMG7/ZRGxq
 muu/VyBuZtEWlUOosY/F7dNjRc5Uv7Hw6sms8GvKTda91Lci1+gsHyQVP864DbCoB0B4cBetp0
 Dtt+5UN8ElVvymIVJ6UCsq2QoXii1qW5Q0BYjuXEQEAAA==
To: Arnd Bergmann <arnd@arndb.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>, 
 Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>, 
 "Kirill A. Shutemov" <kirill@shutemov.name>, 
 Chris Torek <chris.torek@gmail.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5488; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=8yDjUN3v9pzHbAJkU962KdEeNCXYhTKg/kSM+xczGS8=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9ot+f6nvpcl97tY5XM5HRGwunrS/1hN4Jrc4J63aWdPl
 kkz5fzoKGVhEONgkBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCIbvBgZfjQZPtnyo0T8l+3r
 pTc0r/6LOCzwZu3XBXX7mfYvU6k4cI2R4YF4V0iLZoGQYvmDbN1ZIvanHjMsmvbgwI2pnto/ozc
 e4gMA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_141615_059553_A42F0E80 
X-CRM114-Status: GOOD (  22.73  )
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

Some applications rely on placing data in free bits addresses allocated
by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
address returned by mmap to be less than the 48-bit address space,
unless the hint address uses more than 47 bits (the 48th bit is reserved
for the kernel address space).

The riscv architecture needs a way to similarly restrict the virtual
address space. On the riscv port of OpenJDK an error is thrown if
attempted to run on the 57-bit address space, called sv57 [1].  golang
has a comment that sv57 support is not complete, but there are some
workarounds to get it to mostly work [2].

These applications work on x86 because x86 does an implicit 47-bit
restriction of mmap() address that contain a hint address that is less
than 48 bits.

Instead of implicitly restricting the address space on riscv (or any
current/future architecture), provide a flag to the personality syscall
that can be used to ensure an application works in any arbitrary VA
space. A similar feature has already been implemented by the personality
syscall in ADDR_LIMIT_32BIT.

This flag will also allow seemless compatibility between all
architectures, so applications like Go and OpenJDK that use bits in a
virtual address can request the exact number of bits they need in a
generic way. The flag can be checked inside of vm_unmapped_area() so
that this flag does not have to be handled individually by each
architecture. 

Link:
https://github.com/openjdk/jdk/blob/f080b4bb8a75284db1b6037f8c00ef3b1ef1add1/src/hotspot/cpu/riscv/vm_version_riscv.cpp#L79
[1]
Link:
https://github.com/golang/go/blob/9e8ea567c838574a0f14538c0bbbd83c3215aa55/src/runtime/tagptr_64bit.go#L47
[2]

To: Arnd Bergmann <arnd@arndb.de>
To: Richard Henderson <richard.henderson@linaro.org>
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
To: Matt Turner <mattst88@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>
To: Russell King <linux@armlinux.org.uk>
To: Guo Ren <guoren@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
To: WANG Xuerui <kernel@xen0n.name>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
To: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Heiko Carstens <hca@linux.ibm.com>
To: Vasily Gorbik <gor@linux.ibm.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
To: Sven Schnelle <svens@linux.ibm.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
To: Rich Felker <dalias@libc.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: David S. Miller <davem@davemloft.net>
To: Andreas Larsson <andreas@gaisler.com>
To: Thomas Gleixner <tglx@linutronix.de>
To: Ingo Molnar <mingo@redhat.com>
To: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@linux.intel.com>
To: x86@kernel.org
To: H. Peter Anvin <hpa@zytor.com>
To: Andy Lutomirski <luto@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
To: Muchun Song <muchun.song@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
To: Liam R. Howlett <Liam.Howlett@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Shuah Khan <shuah@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
To: Michal Hocko <mhocko@suse.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Chris Torek <chris.torek@gmail.com>
Cc: linux-arch@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kselftest@vger.kernel.org
Cc: linux-abi-devel@lists.sourceforge.net
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Changes in v2:
- Added much greater detail to cover letter
- Removed all code that touched architecture specific code and was able
  to factor this out into all generic functions, except for flags that
  needed to be added to vm_unmapped_area_info
- Made this an RFC since I have only tested it on riscv and x86
- Link to v1: https://lore.kernel.org/r/20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com

Changes in v3:
- Use a personality flag instead of an mmap flag
- Link to v2: https://lore.kernel.org/r/20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com

---
Charlie Jenkins (2):
      mm: Add personality flag to limit address to 47 bits
      selftests/mm: Create ADDR_LIMIT_47BIT test

 include/uapi/linux/personality.h                   |  1 +
 mm/mmap.c                                          |  3 ++
 tools/testing/selftests/mm/.gitignore              |  1 +
 tools/testing/selftests/mm/Makefile                |  1 +
 tools/testing/selftests/mm/map_47bit_personality.c | 34 ++++++++++++++++++++++
 5 files changed, 40 insertions(+)
---
base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
change-id: 20240827-patches-below_hint_mmap-b13d79ae1c55
-- 
- Charlie


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
