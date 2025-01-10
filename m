Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FE3E7719E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jan 2025 19:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/6wxFX7G5b25WkgwVfNID9uWaUOh7Rt7lMO4moPZgzs=; b=NpW+xkYAAqKIpkqDUCncOvyqDh
	DSSegfAXj+K+2aJT5DJ+LKXd0Iy5/xP/44eZZzkEUuUwoQEjULU5zzDbGHF4PqqKz1OoAHOKFQCvV
	bQKHJEa16n5+/qQTcGGI4Tw9OroLz67n4D0fH3+a/rqINNH9z2k8BLQfan7TRn6gIYqSiLgiRkWgV
	okr9kl2R3pj/kJbokRiX4yusVg0UwOLfPoiXkgcGNtZrvtefmo/tNTbLDtDekV2j4GB7zcS+tRhSV
	xRWmP7/BVFl67nIgzlHd6gSvMgchUowX6wnzfqKrSPPj056iZyXr7XBqzn3mXNo/C3X5Z7duHuO8r
	I+VujLEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWL3s-0000000Goh7-0OKh;
	Fri, 10 Jan 2025 19:52:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJwT-0000000GbPJ-3X7t
	for linux-snps-arc@bombadil.infradead.org;
	Fri, 10 Jan 2025 18:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NdZ1cQRVb5G6t/AzbRzOJmiK1PmEXn2j4H5pJNPFFDE=; b=e0pCAiubKz45dKSDEo8kl6ig/G
	IyZPBwVlQCaAycCTdiflZNT/u4rU/UuGyOaSbgQdBKWnr/8t3GSzAcyL2CxnGzvfzZG5aN+jvY5NQ
	vqTK/yHm3YCb2aCWd2XfBiiV0yKCOxZRURx9ULMK829tfVud+/Wp3djMzsEap8iPj6n2TPYA4zsyz
	XrcqaHxN/LR/ignAs3wgdJ6n8WcJ+MOdGmnhojbJZXt4M+gamBFIqnIplJpr438t/2SR9/YFYAt43
	P7oOav8QTS6pPJNoVP9g7xxHwtIjKCmLEiAhuGsRJ7U7Bkouih695ozrw1sUnmieis7RMJGsg/v9+
	5VCM33+w==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJwP-00000009sOW-1FTN
	for linux-snps-arc@lists.infradead.org;
	Fri, 10 Jan 2025 18:41:08 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4362b9c1641so11437785e9.3
        for <linux-snps-arc@lists.infradead.org>; Fri, 10 Jan 2025 10:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534464; x=1737139264; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NdZ1cQRVb5G6t/AzbRzOJmiK1PmEXn2j4H5pJNPFFDE=;
        b=CJa5CHVoG9yWsZBCnnBg0j9DoM3daJVSXSYRzTYOePTn81FrIGdKoJ6J72urks7mJr
         LnUnI8whUQnfeA6FxKnSojy4s8jBpDyT4s9uuBMuoTRTjxo5nbh2FzHOnmywLoXXgjHV
         TGIRRA1DI/D9TAyPmym2BU6HQPgB8Hg54hiTx8DRf6pFk6k1y6jxIyMGh6ioAAmnZRA5
         eOLKF7FV/+HcJIqeGAyAVKch684Xp6Jy/M7smH2fdeW0aEFK708o4Ano4e2fUxSEoHGC
         s2XElWf8OXVGWZSb9D8PaQn/3kHupp0Hi2DKyHcK9icjmZ4L0t+B6pbWv/lI0jbz6WxV
         hItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534464; x=1737139264;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NdZ1cQRVb5G6t/AzbRzOJmiK1PmEXn2j4H5pJNPFFDE=;
        b=KOM329Uwk56JmrKYbkMcq/qhlpgqgJrJLAcqx/wmJ/NSR1K8TPqlOM+BvSUdkrgcvp
         ScvaDmGGcK2okTwSCNfrjVCK4lZy6/VfKkx8N3DbvjZw3TV083frt6ksWYuOY3adZNFp
         St60xVnG787VkZZaFmDvI4Ar32eBC/+5QFpUYefbMIzBwzP4FuuDcTyDBVznYgDO7yPU
         Hb4MRlUy552XnJXsD/UBGLGMKeWhRLUrH/5W0TkVA+FmfBeLPfy5BiFfAyIoVy3IPf86
         a8DvyghT42/vsXkiqYz0YV5Bb2DvAqNrAw6H7BudwvRylaE280hMsJbvnH3PbDBNj4aH
         kyHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW/AJkmYwHEQ27HWYtV2lcOhlBL6Quzce9HOhX6B1/kobhSygiEhh5h862Xi1oAUEcXvBM5D5HrThFJ1OzIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPQ7KD0ywwbAsZk37kO6buPwRKKci5G+4Jk3V08sAVNL4Xj2M1
	CM/7SEq/co2WykOpzwHu+ON8cwUgeBuwO2zTilmSeA2E8QaVIdkfq73Lnpr/zfCtI0DVIzrTGVm
	ugT8lawh0dw==
X-Google-Smtp-Source: AGHT+IHOqPqFuZt9UmOoUeA2JDIFLsGLn/JF5TCYjoXI0XK4RQVEWWzyMiwW2MB3CIHY3dySJS8wD0E+4CgsAA==
X-Received: from wmgg11.prod.google.com ([2002:a05:600d:b:b0:434:ff52:1c7])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ed3:b0:434:f7e3:bfbd with SMTP id 5b1f17b1804b1-436e26dda8cmr98320145e9.23.1736534463780;
 Fri, 10 Jan 2025 10:41:03 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:34 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-8-8419288bc805@google.com>
Subject: [PATCH RFC v2 08/29] mm: asi: Avoid warning from NMI userspace
 accesses in ASI context
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
	Brendan Jackman <jackmanb@google.com>, Junaid Shahid <junaids@google.com>, 
	Yosry Ahmed <yosryahmed@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_184106_261041_FE88FBAE 
X-CRM114-Status: GOOD (  18.82  )
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

nmi_uaccess_okay() emits a warning if current CR3 != mm->pgd.
Limit the warning to only when ASI is not active.

Co-developed-by: Junaid Shahid <junaids@google.com>
Signed-off-by: Junaid Shahid <junaids@google.com>
Co-developed-by: Yosry Ahmed <yosryahmed@google.com>
Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/mm/tlb.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index b2a13fdab0c6454c1d9d4e3338801f3402da4191..c41e083c5b5281684be79ad0391c1a5fc7b0c493 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1340,6 +1340,22 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 	put_cpu();
 }
 
+static inline bool cr3_matches_current_mm(void)
+{
+	struct asi *asi = asi_get_current();
+	pgd_t *pgd_asi = asi_pgd(asi);
+	pgd_t *pgd_cr3;
+
+	/*
+	 * Prevent read_cr3_pa -> [NMI, asi_exit] -> asi_get_current,
+	 * otherwise we might find CR3 pointing to the ASI PGD but not
+	 * find a current ASI domain.
+	 */
+	barrier();
+	pgd_cr3 = __va(read_cr3_pa());
+	return pgd_cr3 == current->mm->pgd || pgd_cr3 == pgd_asi;
+}
+
 /*
  * Blindly accessing user memory from NMI context can be dangerous
  * if we're in the middle of switching the current user task or
@@ -1355,10 +1371,10 @@ bool nmi_uaccess_okay(void)
 	VM_WARN_ON_ONCE(!loaded_mm);
 
 	/*
-	 * The condition we want to check is
-	 * current_mm->pgd == __va(read_cr3_pa()).  This may be slow, though,
-	 * if we're running in a VM with shadow paging, and nmi_uaccess_okay()
-	 * is supposed to be reasonably fast.
+	 * The condition we want to check that CR3 points to either
+	 * current_mm->pgd or an appropriate ASI PGD. Reading CR3 may be slow,
+	 * though, if we're running in a VM with shadow paging, and
+	 * nmi_uaccess_okay() is supposed to be reasonably fast.
 	 *
 	 * Instead, we check the almost equivalent but somewhat conservative
 	 * condition below, and we rely on the fact that switch_mm_irqs_off()
@@ -1367,7 +1383,7 @@ bool nmi_uaccess_okay(void)
 	if (loaded_mm != current_mm)
 		return false;
 
-	VM_WARN_ON_ONCE(current_mm->pgd != __va(read_cr3_pa()));
+	VM_WARN_ON_ONCE(!cr3_matches_current_mm());
 
 	return true;
 }

-- 
2.47.1.613.gc27f4b7a9f-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
