Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D2FC02184
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jan 2025 18:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EXAvPydOn4JGbMzCcPQDZ0C086egqpbYq4onzoG7rVw=; b=2QPhiIP2I+VxVNWn7psUNU9+Ps
	vvnGFNuguruVJpfej3PWG29gTR3lqyaAVeoG5qY5vG9MfRv+fmrXXYjLtEjxYupxwMIfX7DnGHswU
	ppKxPgh4SA/BTAXF24BnZoD5TWN7GxqHfikyF6Zv9SaMkSbVcY+y0q8WrSdatiDc/+FnAJDEoTNqn
	9Sg16W9cq2sn2Uk2bTOJ1qOAImxPIbgWL3DaX9zAQGnpjztQ0PCR1kE4mnz9MjZL90Cl82TloNyaB
	9lWQ8xQ1K8sU00kQq2G0U+a9i2tbi9luJN7YsCZvW6um/yTDYyZ7zbTPcIPVve7OcsHYsa0ugDpd4
	wUakMX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJyE-0000000GcT9-0OYt;
	Fri, 10 Jan 2025 18:42:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJxF-0000000Gc3s-13sX
	for linux-snps-arc@bombadil.infradead.org;
	Fri, 10 Jan 2025 18:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t56obMWOlMyKyO7q6Si1cnEbfn2qyXwrpnzxR+4ONcI=; b=hSpQDkQDGOjfdvifojSIiuY5Bd
	aBJQfDre1afrujOxRCuEeaU2+UonPEYUiO9nr72pC8vq1GenE0SVBfYypYc14xZ3GyAwnFkaf2AlI
	tz0//v/wpD4g16GUGyjiNRLhXPxn+gBiGuxJvp0S7ru2khz5WZVqhi7N6sRmVfNtlz8k3QvjeDTlc
	A0QBGdn9zjIICLmflhULluIrZlKBdVTu0HTC09CGeTZQ/EtCWWVZkpYIVB4GZo6r4zg3hT2gFzbmM
	/JlFvzGv3bVyVlkCjljBnubA2qp4poGUd7oh18HCmNiuFJoInVe/ZbSQ+H3tIRtLRH5nzrPMX23tx
	2v0VF28A==;
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJxB-0000000EBY6-0XTk
	for linux-snps-arc@lists.infradead.org;
	Fri, 10 Jan 2025 18:41:56 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-38a35a65575so1747298f8f.1
        for <linux-snps-arc@lists.infradead.org>; Fri, 10 Jan 2025 10:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534511; x=1737139311; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t56obMWOlMyKyO7q6Si1cnEbfn2qyXwrpnzxR+4ONcI=;
        b=iqgBYshtD8GWwIf/nvQbEXu9FOquhQvGgiUyDKZPcTaANtqEfE/JbmfWixMhPeUkBp
         sjxAYT3AwkTEPDVE4wk8uZUv7libglHHgUULBFoKlhDZeQ0wLGDyJIqAi30+ivj1RPWo
         9muoA4/OnERlgJVLCgD3q7cJR5gqYJMgolIM50tcOldkG9ob5dJpB5NS3ei+JRQu78nv
         yDYSkAyBHSaKhiB6yOOxSY74MnqisrYRE0kJC9FQbz/aAfK4qA4uGbs4V8TQQXnZL7VW
         a4fyjppmYkOjpfW/LYcZECxRO/1fRAXGgKFbQhmNaFyVh9oNPMoZoFvUKZv3lCx4eis4
         3hZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534511; x=1737139311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t56obMWOlMyKyO7q6Si1cnEbfn2qyXwrpnzxR+4ONcI=;
        b=FladOIkLv1R48MYMkITkj897xqJmhC25aJp6xLhgN+DEp8Qc6CNYACkJr2ZlO6gPyZ
         NbOR/MwGmt/AkK2K+79denEiQOVMGmRSIgmQyxRZC06+Sroto9wUU+cm/uLkpQFK18oX
         L3O+QVka5y96En8HqU0DZvp1FrhthCdQNde44l0LnpJYiKJVBjuZn2KnNRCc/HkvwQik
         AOml0SJY1fiMip3wXog5FHI6K4pmCeGFzL4g5eYL/p72vGboUL4/YLGmT8jcYbuduwps
         RUeFqGraA+Thpvc5rPRInz+6Nd8Zz8rsmmlDq58K3Tl7DRyYZ+O4Ck21kKQ4scsEODNw
         Frag==
X-Forwarded-Encrypted: i=1; AJvYcCUTcjpCmCIAfGXnaY6+mdZ3GuAhmWbpkSSVxiSZZiNMFtJxXVQAF9t2EgvzFC/196NoC7Q93uruvNetW23RDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhuauFDKT3RzXbH5u04trkwTXv209SEWaOC1kldgNBPT8LCvS+
	M7tKy9dDNE3JcZUUQuDZ3t1oZWg79POCKNWAf7DKpNJS1AcibuVrpNlgcXwYT5ZqTBeN+qx9Rf0
	5LIvwovYyKw==
X-Google-Smtp-Source: AGHT+IHNze04KHr3mNrPu4oWzk1uJr6kUgfUG8uUPvBwU8SZTj2uxyjbDaOwELGdGilpgEGrHE3bExV1JNVQyA==
X-Received: from wmba16.prod.google.com ([2002:a05:600c:6dd0:b0:434:f350:9fc])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:70a:b0:38a:4184:1519 with SMTP id ffacd0b85a97d-38a873051e1mr10550801f8f.23.1736534511095;
 Fri, 10 Jan 2025 10:41:51 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:55 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-29-8419288bc805@google.com>
Subject: [PATCH RFC v2 29/29] mm: asi: Stop ignoring asi=on cmdline flag
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
X-CRM114-CacheID: sfid-20250110_184153_178683_FFAEAA47 
X-CRM114-Status: GOOD (  15.39  )
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

At this point the minimum requirements are in place for the kernel to
operate correctly with ASI enabled.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/mm/asi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/asi.c b/arch/x86/mm/asi.c
index f10f6614b26148e5ba423d8a44f640674573ee40..3e3956326936ea8550308ad004dbbb3738546f9f 100644
--- a/arch/x86/mm/asi.c
+++ b/arch/x86/mm/asi.c
@@ -207,14 +207,14 @@ void __init asi_check_boottime_disable(void)
 		pr_info("ASI disabled through kernel command line.\n");
 	} else if (ret == 2 && !strncmp(arg, "on", 2)) {
 		enabled = true;
-		pr_info("Ignoring asi=on param while ASI implementation is incomplete.\n");
+		pr_info("ASI enabled through kernel command line.\n");
 	} else {
 		pr_info("ASI %s by default.\n",
 			enabled ? "enabled" : "disabled");
 	}
 
 	if (enabled)
-		pr_info("ASI enablement ignored due to incomplete implementation.\n");
+		setup_force_cpu_cap(X86_FEATURE_ASI);
 }
 
 /*

-- 
2.47.1.613.gc27f4b7a9f-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
