Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19774E7719E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jan 2025 19:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LTFeN/33F4dHeFzVlwkqeSOzNTJy7JVDYzp9O9UOuTg=; b=K9oQvAcfjbQq/mr/WOdRhUHNML
	Hj0SAldQoDOzEij2qwlhQcnvWO+ca9G57EElBOITAlLQ35dwRTCtKuqUfLE3b2RfOxBtgoZwt0Y64
	IbUzF8zGvAGg9Oe2JE3qtdenGIMCrj3z0Ams+tRj+waGrOZWdFp0WztcELdrK5IWprYz7Jdgb6aRH
	GCmOxIloRkZ3btQ39Yq+Cu5bseCZa5oSq6sfOykLGZHreqcCB0XmVhxtXfinNTGJp7ZChF7RqVOLs
	oyR2sZogPcBdcBXgoYY2NQhBOgd5YqtIJKepGhdvm7lEeki9GmX7bDKe9iTwXrxzTPOnYKdG875MU
	mfUrrmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWL3l-0000000Goc0-3dWy;
	Fri, 10 Jan 2025 19:52:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJwM-0000000GbGl-1g1d
	for linux-snps-arc@bombadil.infradead.org;
	Fri, 10 Jan 2025 18:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2/DwiwuishkWohq1Selw9AVX00i6WMTVrJEAuBvDTaE=; b=aq4ftzleEzxBlOmdWdhLRzwYMs
	kiepR7md764ktW0twHZQ4axGqR5m0b/O6zoKViqLe8FI+NUL4aHe+r2aDzr8ivmpdveNOBvu4zAgc
	EV9jKzS2ebl4PdoclL/1fWJ7L1yfiSkji0TV+weGd6ATMgodOOPwGK+bcmAVJmbtl3+1KZg7S0KYl
	bWIb8p08MwCxzsLfcKzEhhpbx158QLnEMyQvveVv5qCbkP71pgxmB1qXO/H4j6kPvO3BdgEB8jsjw
	ZykJtXagm0/LpGMVpR53eR2CzEAs1Y53+Q1YwzVoHON9u3jE85CUSbT0lUjH53S5zg9GuCIrNyoza
	q8BOXW+w==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJwH-00000009sIQ-0h9S
	for linux-snps-arc@lists.infradead.org;
	Fri, 10 Jan 2025 18:41:01 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-436248d1240so11542325e9.0
        for <linux-snps-arc@lists.infradead.org>; Fri, 10 Jan 2025 10:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534455; x=1737139255; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2/DwiwuishkWohq1Selw9AVX00i6WMTVrJEAuBvDTaE=;
        b=qZkOWdWsYTtUGRPAQfXhRfOdq1ptn50xpusVVF1jaEroucu0MBgM4NqPPuhTupBO7b
         eGF++7hDVfJsIrVJU20dhiUnBf0umQNsRfXkB+zKbu3wNquBgOej7bxMcV6GuqnoDAEJ
         q3YYTC0DulUGTH+XjOlAuKnHnbkoRj4iu9xhA2bizea3czra0/di6pOFsLd7vd1Ca7fJ
         bpKwEydMo0mF/nMoSoXmzCoQfR707ZbryVOg8huEOUmp6t5Tt/3nrZ+3cK828HTw8n5j
         YtAGH5JoNwzf5OfUMvzJzIApoU5IhDra/E5Qd9vs7C+qqSy7cYTYPvs4GOOyPy/+CpaI
         YPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534455; x=1737139255;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/DwiwuishkWohq1Selw9AVX00i6WMTVrJEAuBvDTaE=;
        b=JosdhIZ3of1uk30452nMcoIxUZCSwhoTn24YpQxjhEGfmukfIrEkPB4DzurjB1/SXw
         hM6Cx06Lu6Wn8PbhrM7nmYROy/YmTT+86UTJaT/iebUOWFGERqKhWr6Ak+MIrpFGR3jK
         CfjX79aV1tX/fVf0RsDCRAInYW+iNZEXiL8Pe3DW/oemVbbQTCidubSiQA583AcgdEqL
         2BiO3ZGeOye8s492kbUVek5e5lFbk0ipnLkoY822U6Cwhham6n47L4ddnrFNTSKSaZXr
         rWZTOXoOwKljx/HUKoGZgIkLwJW7Z18XMP0c0v19y/SkYYSCNKB2S7tr+xGFHgtAIW0p
         33Tw==
X-Forwarded-Encrypted: i=1; AJvYcCU0Op79cuXUNw0ANnIsauSJQr4pnnLJ8FAwOG/Tz8l85Ajm1HC2DF66jCFw9UaFDHwo6D5Ye6uuJZ/P+Ey4gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxInpa9ML0aqG2EIIYQ1137c242YGbqBDMrWWlx/08j8gqF4YxC
	Pz7RGg7yr8tMmSiMteCPWPiOe97Dg481umQM6YZphQdzAN9CMjeJpBQ1jdA+fa424uNuVODVPI7
	DTPJ+/qIV0w==
X-Google-Smtp-Source: AGHT+IFG2gVbYjLEgd+rVsDr92xsiDXdhg3a2JRtZbNVmnh3EgFoUPLrUSfZq6jOhgEgZFCkNrLAplfHg1IQBQ==
X-Received: from wmqa17.prod.google.com ([2002:a05:600c:3491:b0:434:fa72:f1bf])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d14:b0:436:5fc9:309d with SMTP id 5b1f17b1804b1-436e26f6d81mr55448175e9.30.1736534454514;
 Fri, 10 Jan 2025 10:40:54 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:30 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-4-8419288bc805@google.com>
Subject: [PATCH RFC v2 04/29] mm: asi: Add infrastructure for boot-time enablement
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
X-CRM114-CacheID: sfid-20250110_184057_281087_B671AB45 
X-CRM114-Status: GOOD (  30.89  )
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

Add a boot time parameter to control the newly added X86_FEATURE_ASI.
"asi=on" or "asi=off" can be used in the kernel command line to enable
or disable ASI at boot time. If not specified, ASI enablement depends
on CONFIG_ADDRESS_SPACE_ISOLATION_DEFAULT_ON, which is off by default.
asi_check_boottime_disable() is modeled after
pti_check_boottime_disable().

The boot parameter is currently ignored until ASI is fully functional.

Once we have a set of ASI features checked in that we have actually
tested, we will stop ignoring the flag. But for now let's just add the
infrastructure so we can implement the usage code.

Ignoring checkpatch.pl CONFIG_DESCRIPTION because the _DEFAULT_ON
Kconfig is trivial to explain.

Checkpatch-args: --ignore CONFIG_DESCRIPTION
Co-developed-by: Junaid Shahid <junaids@google.com>
Signed-off-by: Junaid Shahid <junaids@google.com>
Co-developed-by: Yosry Ahmed <yosryahmed@google.com>
Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/Kconfig                         |  9 +++++
 arch/x86/include/asm/asi.h               | 19 ++++++++--
 arch/x86/include/asm/cpufeatures.h       |  1 +
 arch/x86/include/asm/disabled-features.h |  8 ++++-
 arch/x86/mm/asi.c                        | 61 +++++++++++++++++++++++++++-----
 arch/x86/mm/init.c                       |  4 ++-
 include/asm-generic/asi.h                |  4 +++
 7 files changed, 92 insertions(+), 14 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5a50582eb210e9d1309856a737d32b76fa1bfc85..1fcb52cb8cd5084ac3cef04af61b7d1653162bdb 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2533,6 +2533,15 @@ config MITIGATION_ADDRESS_SPACE_ISOLATION
 	  there are likely to be unhandled cases, in particular concerning TLB
 	  flushes.
 
+
+config ADDRESS_SPACE_ISOLATION_DEFAULT_ON
+	bool "Enable address space isolation by default"
+	default n
+	depends on MITIGATION_ADDRESS_SPACE_ISOLATION
+	help
+	  If selected, ASI is enabled by default at boot if the asi=on or
+	  asi=off are not specified.
+
 config MITIGATION_RETPOLINE
 	bool "Avoid speculative indirect branches in kernel"
 	select OBJTOOL if HAVE_OBJTOOL
diff --git a/arch/x86/include/asm/asi.h b/arch/x86/include/asm/asi.h
index 7cc635b6653a3970ba9dbfdc9c828a470e27bd44..b9671ef2dd3278adceed18507fd260e21954d574 100644
--- a/arch/x86/include/asm/asi.h
+++ b/arch/x86/include/asm/asi.h
@@ -8,6 +8,7 @@
 
 #include <asm/pgtable_types.h>
 #include <asm/percpu.h>
+#include <asm/cpufeature.h>
 #include <asm/processor.h>
 
 #ifdef CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
@@ -66,6 +67,8 @@
  * the N ASI classes.
  */
 
+#define static_asi_enabled() cpu_feature_enabled(X86_FEATURE_ASI)
+
 /*
  * ASI uses a per-CPU tainting model to track what mitigation actions are
  * required on domain transitions. Taints exist along two dimensions:
@@ -131,6 +134,8 @@ struct asi {
 
 DECLARE_PER_CPU_ALIGNED(struct asi *, curr_asi);
 
+void asi_check_boottime_disable(void);
+
 void asi_init_mm_state(struct mm_struct *mm);
 
 int asi_init_class(enum asi_class_id class_id, struct asi_taint_policy *taint_policy);
@@ -155,7 +160,9 @@ void asi_exit(void);
 /* The target is the domain we'll enter when returning to process context. */
 static __always_inline struct asi *asi_get_target(struct task_struct *p)
 {
-	return p->thread.asi_state.target;
+	return static_asi_enabled()
+	       ? p->thread.asi_state.target
+	       : NULL;
 }
 
 static __always_inline void asi_set_target(struct task_struct *p,
@@ -166,7 +173,9 @@ static __always_inline void asi_set_target(struct task_struct *p,
 
 static __always_inline struct asi *asi_get_current(void)
 {
-	return this_cpu_read(curr_asi);
+	return static_asi_enabled()
+	       ? this_cpu_read(curr_asi)
+	       : NULL;
 }
 
 /* Are we currently in a restricted address space? */
@@ -175,7 +184,11 @@ static __always_inline bool asi_is_restricted(void)
 	return (bool)asi_get_current();
 }
 
-/* If we exit/have exited, can we stay that way until the next asi_enter? */
+/*
+ * If we exit/have exited, can we stay that way until the next asi_enter?
+ *
+ * When ASI is disabled, this returns true.
+ */
 static __always_inline bool asi_is_relaxed(void)
 {
 	return !asi_get_target(current);
diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 913fd3a7bac6506141de65f33b9ee61c615c7d7d..d6a808d10c3b8900d190ea01c66fc248863f05e2 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -474,6 +474,7 @@
 #define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* BHI_DIS_S HW control enabled */
 #define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* Clear branch history at vmexit using SW loop */
 #define X86_FEATURE_FAST_CPPC		(21*32 + 5) /* AMD Fast CPPC */
+#define X86_FEATURE_ASI			(21*32+6) /* Kernel Address Space Isolation */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/include/asm/disabled-features.h b/arch/x86/include/asm/disabled-features.h
index c492bdc97b0595ec77f89dc9b0cefe5e3e64be41..c7964ed4fef8b9441e1c0453da587787d8008d9d 100644
--- a/arch/x86/include/asm/disabled-features.h
+++ b/arch/x86/include/asm/disabled-features.h
@@ -50,6 +50,12 @@
 # define DISABLE_PTI		(1 << (X86_FEATURE_PTI & 31))
 #endif
 
+#ifdef CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
+# define DISABLE_ASI		0
+#else
+# define DISABLE_ASI		(1 << (X86_FEATURE_ASI & 31))
+#endif
+
 #ifdef CONFIG_MITIGATION_RETPOLINE
 # define DISABLE_RETPOLINE	0
 #else
@@ -154,7 +160,7 @@
 #define DISABLED_MASK17	0
 #define DISABLED_MASK18	(DISABLE_IBT)
 #define DISABLED_MASK19	(DISABLE_SEV_SNP)
-#define DISABLED_MASK20	0
+#define DISABLED_MASK20	(DISABLE_ASI)
 #define DISABLED_MASK21	0
 #define DISABLED_MASK_CHECK BUILD_BUG_ON_ZERO(NCAPINTS != 22)
 
diff --git a/arch/x86/mm/asi.c b/arch/x86/mm/asi.c
index 105cd8b43eaf5c20acc80d4916b761559fb95d74..5baf563a078f5b3a6cd4b9f5e92baaf81b0774c4 100644
--- a/arch/x86/mm/asi.c
+++ b/arch/x86/mm/asi.c
@@ -4,6 +4,7 @@
 #include <linux/percpu.h>
 #include <linux/spinlock.h>
 
+#include <linux/init.h>
 #include <asm/asi.h>
 #include <asm/cmdline.h>
 #include <asm/cpufeature.h>
@@ -29,6 +30,9 @@ static inline bool asi_class_id_valid(enum asi_class_id class_id)
 
 static inline bool asi_class_initialized(enum asi_class_id class_id)
 {
+	if (!boot_cpu_has(X86_FEATURE_ASI))
+		return 0;
+
 	if (WARN_ON(!asi_class_id_valid(class_id)))
 		return false;
 
@@ -51,6 +55,9 @@ EXPORT_SYMBOL_GPL(asi_init_class);
 
 void asi_uninit_class(enum asi_class_id class_id)
 {
+	if (!boot_cpu_has(X86_FEATURE_ASI))
+		return;
+
 	if (!asi_class_initialized(class_id))
 		return;
 
@@ -66,10 +73,36 @@ const char *asi_class_name(enum asi_class_id class_id)
 	return asi_class_names[class_id];
 }
 
+void __init asi_check_boottime_disable(void)
+{
+	bool enabled = IS_ENABLED(CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION_DEFAULT_ON);
+	char arg[4];
+	int ret;
+
+	ret = cmdline_find_option(boot_command_line, "asi", arg, sizeof(arg));
+	if (ret == 3 && !strncmp(arg, "off", 3)) {
+		enabled = false;
+		pr_info("ASI disabled through kernel command line.\n");
+	} else if (ret == 2 && !strncmp(arg, "on", 2)) {
+		enabled = true;
+		pr_info("Ignoring asi=on param while ASI implementation is incomplete.\n");
+	} else {
+		pr_info("ASI %s by default.\n",
+			enabled ? "enabled" : "disabled");
+	}
+
+	if (enabled)
+		pr_info("ASI enablement ignored due to incomplete implementation.\n");
+}
+
 static void __asi_destroy(struct asi *asi)
 {
-	lockdep_assert_held(&asi->mm->asi_init_lock);
+	WARN_ON_ONCE(asi->ref_count <= 0);
+	if (--(asi->ref_count) > 0)
+		return;
 
+	free_pages((ulong)asi->pgd, PGD_ALLOCATION_ORDER);
+	memset(asi, 0, sizeof(struct asi));
 }
 
 int asi_init(struct mm_struct *mm, enum asi_class_id class_id, struct asi **out_asi)
@@ -79,6 +112,9 @@ int asi_init(struct mm_struct *mm, enum asi_class_id class_id, struct asi **out_
 
 	*out_asi = NULL;
 
+	if (!boot_cpu_has(X86_FEATURE_ASI))
+		return 0;
+
 	if (WARN_ON(!asi_class_initialized(class_id)))
 		return -EINVAL;
 
@@ -122,7 +158,7 @@ void asi_destroy(struct asi *asi)
 {
 	struct mm_struct *mm;
 
-	if (!asi)
+	if (!boot_cpu_has(X86_FEATURE_ASI) || !asi)
 		return;
 
 	if (WARN_ON(!asi_class_initialized(asi->class_id)))
@@ -134,11 +170,7 @@ void asi_destroy(struct asi *asi)
 	 * to block concurrent asi_init calls.
 	 */
 	mutex_lock(&mm->asi_init_lock);
-	WARN_ON_ONCE(asi->ref_count <= 0);
-	if (--(asi->ref_count) == 0) {
-		free_pages((ulong)asi->pgd, PGD_ALLOCATION_ORDER);
-		memset(asi, 0, sizeof(struct asi));
-	}
+	__asi_destroy(asi);
 	mutex_unlock(&mm->asi_init_lock);
 }
 EXPORT_SYMBOL_GPL(asi_destroy);
@@ -255,6 +287,9 @@ static noinstr void __asi_enter(void)
 
 noinstr void asi_enter(struct asi *asi)
 {
+	if (!static_asi_enabled())
+		return;
+
 	VM_WARN_ON_ONCE(!asi);
 
 	/* Should not have an asi_enter() without a prior asi_relax(). */
@@ -269,8 +304,10 @@ EXPORT_SYMBOL_GPL(asi_enter);
 
 noinstr void asi_relax(void)
 {
-	barrier();
-	asi_set_target(current, NULL);
+	if (static_asi_enabled()) {
+		barrier();
+		asi_set_target(current, NULL);
+	}
 }
 EXPORT_SYMBOL_GPL(asi_relax);
 
@@ -279,6 +316,9 @@ noinstr void asi_exit(void)
 	u64 unrestricted_cr3;
 	struct asi *asi;
 
+	if (!static_asi_enabled())
+		return;
+
 	preempt_disable_notrace();
 
 	VM_BUG_ON(this_cpu_read(cpu_tlbstate.loaded_mm) ==
@@ -310,6 +350,9 @@ EXPORT_SYMBOL_GPL(asi_exit);
 
 void asi_init_mm_state(struct mm_struct *mm)
 {
+	if (!boot_cpu_has(X86_FEATURE_ASI))
+		return;
+
 	memset(mm->asi, 0, sizeof(mm->asi));
 	mutex_init(&mm->asi_init_lock);
 }
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index de4227ed5169ff84d0ce80b677caffc475198fa6..ded3a47f2a9c1f554824d4ad19f3b48bce271274 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -28,6 +28,7 @@
 #include <asm/text-patching.h>
 #include <asm/memtype.h>
 #include <asm/paravirt.h>
+#include <asm/asi.h>
 
 /*
  * We need to define the tracepoints somewhere, and tlb.c
@@ -251,7 +252,7 @@ static void __init probe_page_size_mask(void)
 	__default_kernel_pte_mask = __supported_pte_mask;
 	/* Except when with PTI where the kernel is mostly non-Global: */
 	if (cpu_feature_enabled(X86_FEATURE_PTI) ||
-	    IS_ENABLED(CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION))
+	    cpu_feature_enabled(X86_FEATURE_ASI))
 		__default_kernel_pte_mask &= ~_PAGE_GLOBAL;
 
 	/* Enable 1 GB linear kernel mappings if available: */
@@ -754,6 +755,7 @@ void __init init_mem_mapping(void)
 	unsigned long end;
 
 	pti_check_boottime_disable();
+	asi_check_boottime_disable();
 	probe_page_size_mask();
 	setup_pcid();
 
diff --git a/include/asm-generic/asi.h b/include/asm-generic/asi.h
index 6b84202837605fa57e4a910318c8353b3f816f06..eedc961ee916a9e1da631ca489ea4a7bc9e6089f 100644
--- a/include/asm-generic/asi.h
+++ b/include/asm-generic/asi.h
@@ -65,6 +65,10 @@ static inline pgd_t *asi_pgd(struct asi *asi) { return NULL; }
 
 static inline void asi_handle_switch_mm(void) { }
 
+#define static_asi_enabled() false
+
+static inline void asi_check_boottime_disable(void) { }
+
 #endif /* !CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
 
 #endif  /* !_ASSEMBLY_ */

-- 
2.47.1.613.gc27f4b7a9f-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
