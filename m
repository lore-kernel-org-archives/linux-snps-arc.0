Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4D6E7719D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jan 2025 18:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KplPxdVp/QpjVYYPWhfkvrhB8H2ZJ4UFeae+lBWc7Mk=; b=pCDgJ9uIZ1Aj0OXnzjNMvqZv+y
	gJeVCGWVRjzKovbW8tBVjPzL+fP9ejadsoyLBf71b0/NY1BPmh/v9YhHA4/vF5C0GfZjWTVlmO0Ba
	rwf0wMGtxbxKaZZ9bWB/yOvX2t2vz/AMzFH/4qV7AyPY3jL3EsulqaDioCzfXYRbtFgNVcQaWhKXv
	xjCoAgcAJo1Be9bEiT7CF9rKGGYk9q1IZaKB/emp7d2f8MW2YHiOdywWkUPdP6AVmzgGQUvnrB0wj
	lCNzn5y63xpjSGBJv/b+IZ8BluZRTd/G04XmLBaqu1Kn/CBmg3YPH5Aawm5l8txBxXlo8PkcED8H0
	7n3w8TrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJy8-0000000GcNW-2iTk;
	Fri, 10 Jan 2025 18:42:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJwv-0000000Gbp6-42K2
	for linux-snps-arc@bombadil.infradead.org;
	Fri, 10 Jan 2025 18:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z5b6fu2IPJ4vMWdeJyvKaXZwCsIFdjwPZGonrVH8VuY=; b=WHJFVT5toYGRAphc74jOVOXGNm
	CHVM3KJlrQEvO8LMJ1a4KCnsrNDt10BKcOjq8u1llYQrC6Z1Uhknsyv12YEcZ9dW7bhkvaodlX5Ht
	hQsCf5LoVcCBhdPyFzHvbcnLnbS+dmUGpI6zAtMxFpA3VQc5C/3jJKUyj2sg98kea6tpU7c2RkfUJ
	96s1stcYCuzmHwt7/eD6iiq6/df0r6JPtWbP1leK97KkfiYcfnpZEqHUsrDwdqRWPoHQyW/NoaOch
	oYY5zDYInBBzSJO/9XFgcwxxYZW7IAiyNHVHImffuy50tpo8XlBvOafXR7Vc6MP52YpJ8gl/2YC56
	wNF33lHg==;
Received: from mail-wr1-f74.google.com ([209.85.221.74])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJwr-00000009sk4-1M6y
	for linux-snps-arc@lists.infradead.org;
	Fri, 10 Jan 2025 18:41:36 +0000
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-38a9118c486so1465741f8f.1
        for <linux-snps-arc@lists.infradead.org>; Fri, 10 Jan 2025 10:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534491; x=1737139291; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z5b6fu2IPJ4vMWdeJyvKaXZwCsIFdjwPZGonrVH8VuY=;
        b=ZN72pOmq+KvqGOJhTcKfI5pjf3mieqcwagJZT5fndr69QSc+dVM39+0K0lrhFrc04g
         CzsSJ6Ns7fQNFHQ8GCAYDpXMwIMF3D2AhsI67rzHv2Vh/rR5NwXpZ6ESwkrSwSHnebLy
         p6TieOue9f1d0XuUSRXQWTYbTJ6jklvEvFbhXfljrIlWSwyOy4K/vUsBDwzAZdQ3kqDi
         dfNpOg39gu6ke8pCfd5PIe4yEMtp5fK7JZuEX/+67FNI8VslGyuPvHVWpmarafj2m85I
         uqYCKfPm9Yhcxx1BVkLIIzYVnbUZ7dDCTxDKN4pq+xTqhg1gOoOenoHRsj+LFrVrR9kC
         2X7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534491; x=1737139291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z5b6fu2IPJ4vMWdeJyvKaXZwCsIFdjwPZGonrVH8VuY=;
        b=pslXvD2+KHF3c1vZaUBTOkaWzQJ17oCHSiDqAd7i/GnBXydbVg2y11Iv8DwQ7898Qp
         r9btkOvcWEgnBFVZhwp81e9qcjX8NtdRRWVi2pR+m+xI6LQEmzE1ftFjvmyokrT+9EKT
         pGirUJHebIAxky8Y2uNbInbm7GOPWULGjnb2gcx/EAJCfoKdYwJP42aE9Nf6X9/k4Rj6
         TBlYi0Gh//fLWuClTHhTxnD0gqzyQD4zAFopfpshtvX0EA7G9MSkEfr65tzbBPtBI0+m
         7vxP5ibmPff8lhp0ctlA9UjeZK/trHBQofz6akc022es/b3msaOZqNpiUmzDJz4aRC4e
         DwZA==
X-Forwarded-Encrypted: i=1; AJvYcCUvl+VyibtBo4phREEe3XhQKlOspn9y41SW1XPMEzHxK7/xKRrsZETNAQSTdldoL4u93FvC31Q9owEkSTzffg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeNgmjJO7ribzOBygao4H5OYJg7ERH/4Iy9DQWxt2KGx7Z8QP7
	Vg+qALNKFqDzuvAfqZ+OJFDTNhHEVefq46fS6CWhLsSZ0ouw0OvIK6na8RskL45Y8vCWC4E0T6n
	bLE48Q6nOpQ==
X-Google-Smtp-Source: AGHT+IEE74PFwgraC6zRNOcME3rOW4swKtJd/bKE4AIl8MRowFtdpWNq19ZBTTKPz5sLGPxmEc1GHABVlwipiQ==
X-Received: from wmjv9.prod.google.com ([2002:a7b:cb49:0:b0:434:f173:a51])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a85:b0:38a:4184:1520 with SMTP id ffacd0b85a97d-38a872eb1eamr9947778f8f.27.1736534490587;
 Fri, 10 Jan 2025 10:41:30 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:46 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-20-8419288bc805@google.com>
Subject: [PATCH RFC v2 20/29] mm: asi: Make TLB flushing correct under ASI
From: Brendan Jackman <jackmanb@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_184133_452345_02C01863 
X-CRM114-Status: GOOD (  26.72  )
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

This is the absolute minimum change for TLB flushing to be correct under
ASI. There are two arguably orthogonal changes in here but they feel
small enough for a single commit.

.:: CR3 stabilization

As noted in the comment ASI can destabilize CR3, but we can stabilize it
again by calling asi_exit, this makes it safe to read CR3 and write it
back.

This is enough to be correct - we don't have to worry about invalidating
the other ASI address space (i.e. we don't need to invalidate the
restricted address space if we are currently unrestricted / vice versa)
because we currently never set the noflush bit in CR3 for ASI
transitions.

Even without using CR3's noflush bit there are trivial optimizations
still on the table here: on where invpcid_flush_single_context is
available (i.e. with the INVPCID_SINGLE feature) we can use that in lieu
of the CR3 read/write, and avoid the extremely costly asi_exit.

.:: Invalidating kernel mappings

Before ASI, with KPTI off we always either disable PCID or use global
mappings for kernel memory. However ASI disables global kernel mappings
regardless of factors. So we need to invalidate other address spaces to
trigger a flush when we switch into them.

Note that there is currently a pointless write of
cpu_tlbstate.invalidate_other in the case of KPTI and !PCID. We've added
another case of that (ASI, !KPTI and !PCID). I think that's preferable
to expanding the conditional in flush_tlb_one_kernel.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/mm/tlb.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index ce5598f96ea7a84dc0e8623022ab5bfbba401b48..07b1657bee8e4cf17452ea57c838823e76f482c0 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -231,7 +231,7 @@ static void clear_asid_other(void)
 	 * This is only expected to be set if we have disabled
 	 * kernel _PAGE_GLOBAL pages.
 	 */
-	if (!static_cpu_has(X86_FEATURE_PTI)) {
+	if (!static_cpu_has(X86_FEATURE_PTI) && !static_asi_enabled()) {
 		WARN_ON_ONCE(1);
 		return;
 	}
@@ -1040,7 +1040,6 @@ static void put_flush_tlb_info(void)
 noinstr u16 asi_pcid(struct asi *asi, u16 asid)
 {
 	return kern_pcid(asid) | ((asi->class_id + 1) << X86_CR3_ASI_PCID_BITS_SHIFT);
-	// return kern_pcid(asid) | ((asi->index + 1) << X86_CR3_ASI_PCID_BITS_SHIFT);
 }
 
 void asi_flush_tlb_range(struct asi *asi, void *addr, size_t len)
@@ -1192,15 +1191,19 @@ void flush_tlb_one_kernel(unsigned long addr)
 	 * use PCID if we also use global PTEs for the kernel mapping, and
 	 * INVLPG flushes global translations across all address spaces.
 	 *
-	 * If PTI is on, then the kernel is mapped with non-global PTEs, and
-	 * __flush_tlb_one_user() will flush the given address for the current
-	 * kernel address space and for its usermode counterpart, but it does
-	 * not flush it for other address spaces.
+	 * If PTI or ASI is on, then the kernel is mapped with non-global PTEs,
+	 * and __flush_tlb_one_user() will flush the given address for the
+	 * current kernel address space and, if PTI is on, for its usermode
+	 * counterpart, but it does not flush it for other address spaces.
 	 */
 	flush_tlb_one_user(addr);
 
-	if (!static_cpu_has(X86_FEATURE_PTI))
+	/* Nothing more to do if PTI and ASI are completely off. */
+	if (!static_cpu_has(X86_FEATURE_PTI) && !static_asi_enabled()) {
+		VM_WARN_ON_ONCE(static_cpu_has(X86_FEATURE_PCID) &&
+				!(__default_kernel_pte_mask & _PAGE_GLOBAL));
 		return;
+	}
 
 	/*
 	 * See above.  We need to propagate the flush to all other address
@@ -1289,6 +1292,16 @@ STATIC_NOPV void native_flush_tlb_local(void)
 
 	invalidate_user_asid(this_cpu_read(cpu_tlbstate.loaded_mm_asid));
 
+	/*
+	 * Restricted ASI CR3 is unstable outside of critical section, so we
+	 * couldn't flush via a CR3 read/write. asi_exit() stabilizes it.
+	 * We don't expect any flushes in a critical section.
+	 */
+	if (WARN_ON(asi_in_critical_section()))
+		native_flush_tlb_global();
+	else
+		asi_exit();
+
 	/* If current->mm == NULL then the read_cr3() "borrows" an mm */
 	native_write_cr3(__native_read_cr3());
 }

-- 
2.47.1.613.gc27f4b7a9f-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
