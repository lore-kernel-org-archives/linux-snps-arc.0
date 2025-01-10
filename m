Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA0BE7719C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jan 2025 18:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=v1djjHHmEZO80oFZBhGxCxwv5abfgyVLvuGBV9nOFT8=; b=kr9Nb93wnW3vu+eT2A+y0mhQiq
	lM4pPVj/PPEOgfeuIO2ghGvSgScDsZKPTOEVJKLUdX/aR4Ncy5yGIt/naITWBkGWacHYxsCEH0WOn
	jrTVG70byYw4yXft5sW4U/1ZemrisQZOL+Ai3GaPtWGTTtVuAX6PoIEkPBEE4iaQmu59i3HRuNaZh
	PX3pCNecMvvQbjcMLWtsvDxWza4yvk3rntKYLgkZzs0Z/FkqOOrFbDpRbP1DpeRrj013Mci9v2M5/
	s64lTDOqB10VDoyFYd/NsbhJJSnHt8NNTTYDHRsGb7DaBIl7LrH80xMjxUn8QtMVYvih1BAvU6/p5
	sTB1MNIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJyB-0000000GcQX-3wso;
	Fri, 10 Jan 2025 18:42:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJx0-0000000Gbtf-3EW3
	for linux-snps-arc@bombadil.infradead.org;
	Fri, 10 Jan 2025 18:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aGIlyFkOxdGIUAlLSc7B7HeTqLb/6yPSKg6NF5x4oeg=; b=jnyncBITSd8hvC0lFIheZO8SXL
	xk0T3sgf17Zx8zM+i7F5RS2CalHptKibk39wza6S/LROgsT9wWoXBhZAsqCZ7z2jG5Ckffw0TXvrj
	lHStfSVWNS4jgoaIcw4jiBFQybRijEpMq0+cd0qV9/IeSeTlkiNYqFJ7ZQY/Yd9a4G5GO0nh/GNzX
	J0Np99B3qngh5/MqVAWS7eHV2cdLA2F/qyHhkS3d4JuAVdZLtE2px9bWInex+YDlJ5ljiJ0MpCuSQ
	20JTUzF0mAM668/GcUsg/Ujt7VKe9oTMWjcvljL2RW3opm10P5HyPjo+C1Fj2IwECGNhnNv9icfG0
	EKOeceUQ==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJww-00000009so3-3Vmu
	for linux-snps-arc@lists.infradead.org;
	Fri, 10 Jan 2025 18:41:41 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4361a8fc3bdso12056705e9.2
        for <linux-snps-arc@lists.infradead.org>; Fri, 10 Jan 2025 10:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534497; x=1737139297; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aGIlyFkOxdGIUAlLSc7B7HeTqLb/6yPSKg6NF5x4oeg=;
        b=JIduXtwxAbfW+uj7qj57ptRN2EBQHb4sS8t9VXBvc36RYueKdmK/my5pOphTyHJ4en
         RaxzTdhRiPHVR1WH40wixXxWQCdF+x9fRgd+TT/PMHPb/V9as2Eu3zRSxUEbPtPX5Drm
         e4tW/RFDrJ38VFOBBcvfr0rNnZq+vd5MoHLgBdQAgF4B72URpt45gdN3ve1iTa6EnYg/
         tHECZSxCh6ouxt4R3JMih23iDeR7wTr/08HA1BEHV9GcVApd8U6Cdcg4V6uB6dB8x1C8
         YAqzYbxwYLOqNuYgPxS2Yw/Bx0Z5Wn3mNQHGqyyqZJIDlqHDb+b5rnKNhVNH/9oTIxQO
         uTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534497; x=1737139297;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aGIlyFkOxdGIUAlLSc7B7HeTqLb/6yPSKg6NF5x4oeg=;
        b=C5+GBuBgwz7i7kJDCWSQhG0NSpfr6MaXxlcIXhcjya0UnyrarEk6vOE5u3Ph5r+Irr
         yo4qtbCBEgF7jQvFG4GcqdK0NmkZm+DnDA6jnNVYp31r+xwppV3s0RIE+Qx3udmm+4Qa
         EQaJfHxkF6dyWHff9hQf3Z2avKQcOk/YHDGwmRqZPLoeZRx0e7v2qXTYAqtzJ1iFm5bJ
         rM4gSUkwn2cottEBTvXDi4TZlOlGdaNrNfpJ0YofUNWvAhHT3WRk6rEd28tetG6kjvGh
         jna/ZrPmzMuwwS+Hjs4nWIvpSWCAsAwgv/xyRsbEEYP5ZNhmOCNz7tOpAss8htquoU/r
         i6VA==
X-Forwarded-Encrypted: i=1; AJvYcCVPbr7M6zoA1cYOTihE7EcyppnK5AnF4CU46P1nuu1TLXwGH77if92z+viuVie05lSsjRgTo76wIEMzJEybfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZQDOjqHXtnVr0Dn3pncZ/WmlPNhVh1szJr0Ki7M/7DJj1B7H8
	VnpLvIb/+l8/LqC9Rj2HUs/ODPmruv701S9KI+6A/Wfmsrhj3Gx1H2JHnFpoQGj0q9qG6UdXPUa
	QewWI9uSQyA==
X-Google-Smtp-Source: AGHT+IFRy9/+C5CnBm/ma6a3ETfEwH3prKyhyhclEMfLJAYKbacCY4ZfacRZW3At4TIIMxUaqY38zEy/zVSAnQ==
X-Received: from wmdn10.prod.google.com ([2002:a05:600c:294a:b0:436:d819:e4eb])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5848:b0:436:f3f6:9582 with SMTP id 5b1f17b1804b1-436f3f695dfmr6272215e9.8.1736534497408;
 Fri, 10 Jan 2025 10:41:37 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:49 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-23-8419288bc805@google.com>
Subject: [PATCH RFC v2 23/29] mm: asi: exit ASI before suspend-like operations
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
	Brendan Jackman <jackmanb@google.com>, Yosry Ahmed <yosryahmed@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_184139_071127_815073E3 
X-CRM114-Status: GOOD (  23.05  )
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

From: Yosry Ahmed <yosryahmed@google.com>

During suspend-like operations (suspend, hibernate, kexec w/
preserve_context), the processor state (including CR3) is usually saved
and restored later.

In the kexec case, this only happens when KEXEC_PRESERVE_CONTEXT is
used to jump back to the original kernel. In relocate_kernel(), some
registers including CR3 are stored in VA_CONTROL_PAGE. If
preserve_context is set (passed into relocate_kernel() in RCX), after
running the new kernel the code under 'virtual_mapped' restores these
registers. This is similar to what happens in suspend and hibernate.

Note that even when KEXEC_PRESERVE_CONTEXT is not set, relocate_kernel()
still accesses CR3. It mainly reads and writes it to flush the TLB. This
could be problematic and cause improper ASI enters (see below), but it
is assumed to be safe because the kernel will essentially reboot in this
case anyway.

Saving and restoring CR3 in this fashion can cause a problem if the
suspend/hibernate/kexec is performed within an ASI domain. A restricted
CR3 will be saved, and later restored after ASI had potentially already
exited (e.g. from an NMI after CR3 is stored). This will cause an
_improper_ ASI enter, where code starts executing in a restricted
address space, yet ASI metadata (especially curr_asi) says otherwise.

Exit ASI early in all these paths by registering a syscore_suspend()
callback. syscore_suspend() is called in all the above paths (for kexec,
only with KEXEC_PRESERVE_CONTEXT) after IRQs are finally disabled before
the operation. This is not currently strictly required but is convenient
because when ASI gains the ability to persist across context switching,
there will be additional synchronization requirements simplified by
this.

Note: If the CR3 accesses in relocate_kernel() when
KEXEC_PRESERVE_CONTEXT is not set are concerning, they could be handled
by registering a syscore_shutdown() callback to exit ASI.
syscore_shutdown() is called in the kexec path where
KEXEC_PRESERVE_CONTEXT is not set starting commit 7bb943806ff6 ("kexec:
do syscore_shutdown() in kernel_kexec").

Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/mm/asi.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/x86/mm/asi.c b/arch/x86/mm/asi.c
index a9f9bfbf85eb47d16ef8d0bfbc7713f07052d3ed..c5073af1a82ded1c6fc467cd7a5d29a39d676bb4 100644
--- a/arch/x86/mm/asi.c
+++ b/arch/x86/mm/asi.c
@@ -6,6 +6,7 @@
 
 #include <linux/init.h>
 #include <linux/pgtable.h>
+#include <linux/syscore_ops.h>
 
 #include <asm/cmdline.h>
 #include <asm/cpufeature.h>
@@ -243,6 +244,32 @@ static int asi_map_percpu(struct asi *asi, void *percpu_addr, size_t len)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int asi_suspend(void)
+{
+	/*
+	 * Must be called after IRQs are disabled and rescheduling is no longer
+	 * possible (so that we cannot re-enter ASI before suspending.
+	 */
+	lockdep_assert_irqs_disabled();
+
+	/*
+	 * Suspend operations sometimes save CR3 as part of the saved state,
+	 * which is restored later (e.g. do_suspend_lowlevel() in the suspend
+	 * path, swsusp_arch_suspend() in the hibernate path, relocate_kernel()
+	 * in the kexec path). Saving a restricted CR3 and restoring it later
+	 * could leave to improperly entering ASI. Exit ASI before such
+	 * operations.
+	 */
+	asi_exit();
+	return 0;
+}
+
+static struct syscore_ops asi_syscore_ops = {
+	.suspend = asi_suspend,
+};
+#endif /* CONFIG_PM_SLEEP */
+
 static int __init asi_global_init(void)
 {
 	int err;
@@ -306,6 +333,10 @@ static int __init asi_global_init(void)
 	asi_clone_pgd(asi_global_nonsensitive_pgd, init_mm.pgd,
 		      VMEMMAP_START + (1UL << PGDIR_SHIFT));
 
+#ifdef CONFIG_PM_SLEEP
+	register_syscore_ops(&asi_syscore_ops);
+#endif
+
 	return 0;
 }
 subsys_initcall(asi_global_init)

-- 
2.47.1.613.gc27f4b7a9f-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
