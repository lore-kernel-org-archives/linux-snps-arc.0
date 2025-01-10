Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34ADE77188
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jan 2025 18:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ACx8sdYvqt4y66oBnN9arfMKoXHvu3S8TfEFWCs+VTo=; b=bA20qITjj//ma6CFyZ/fXxLiH8
	mkAoOwHw71NbiEk+6xCy8objMQ4Gk9wrok9Simq2zgpdghqF6mJuerNecx5YQgPo6Xn3fy4CavhCP
	tXSTjBFs5/Vgt/WYIzRMXoUSx5N8LSyEriqs32lunLZjv3Ay9FgY6wTn3FbAkuBLX/WVPYA39hjmB
	sv9r3eujIpj4m8aUyZqlsjWmgT1rycKsheP9FfXai5yc8foY4yr+GSdf70ZcuULJgblbvWrK5ke5K
	ZmqZFpN62SIEApPjWSJsAxhU6FrBnpltWWIJeVcFrjpin/etpdKmoC2f+aMRZFlhdHt9jij3oNyiA
	WEXlBNPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJy6-0000000GcLf-2KoF;
	Fri, 10 Jan 2025 18:42:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJws-0000000Gbl1-2plN
	for linux-snps-arc@bombadil.infradead.org;
	Fri, 10 Jan 2025 18:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lgAtsH7tF25YqHAENGvYLMvhBopdecMcg5W9s6t9Qm4=; b=TP5VEjc1mX2wWxicPPswZERaG2
	Msakl1A6zExiHzAF6FzcJ/cp8OIdtnM9f9vdWLO7nIuK/KYMiJ/ZAKawy35DMObLfZ5xVJNDZJ4gr
	6s2hUeqk48GrpglIoDLF7Ihssy6zIUUJ5PTdncvXdzmMblGtFgBrgy6PzQEl1U83ZkUGs/HQnsn4I
	hfT8ftc1quI0Y/U5Ch2zmg0UxYoUBWIVG7vwu0hWGrdKgoIxPCNvx9VvSlPBFZE8qifgkZZOpT+FY
	iw9rsDY56d7amnhnr3VJEtLGjAgMWWcRJ5olDuLRz6ZTYrY/NHng7DZ/9891iaHCXlG725+wPUpDC
	WM6C81+A==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJwn-00000009sga-3r1Y
	for linux-snps-arc@lists.infradead.org;
	Fri, 10 Jan 2025 18:41:33 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4361ac8b25fso12663715e9.2
        for <linux-snps-arc@lists.infradead.org>; Fri, 10 Jan 2025 10:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534489; x=1737139289; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lgAtsH7tF25YqHAENGvYLMvhBopdecMcg5W9s6t9Qm4=;
        b=bfCO4nDbQMSDPYlPBMOy+6exWhsmiyWjOcEvtmGXjIh2YhgHb3DnFM7QYDhgedb678
         uvdJZaETnoKxK4QuxmVAFN/ESWbBJ6lT22mRLtXRNQ0g790+gdXTzYlCl9P5smuX5ic7
         Uw4YnEtiuNp8I6lbARbXtRMGQ+vj1FLcwOcqI7cHANdrTr9UJuwxCGK+yQqZ/87ZQOc3
         kXZYYkgPXUEEzJ4hStw80bON8w3A/zgkjm4z7TsxsLVvAySVkWHP9scYLKmSNJ+BKF6p
         iR/ktuQJdko2cRRbkLLzdLhhTsA3lzM+zlWUIra7R4AJ4XfTH/L79kbC2ghiMoH14ZbV
         tYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534489; x=1737139289;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgAtsH7tF25YqHAENGvYLMvhBopdecMcg5W9s6t9Qm4=;
        b=Y4MWf+ZkHXoHcL0G3zdt/Bqf22aEHUDwynQBkquFA5g1xInZ4cSokOOl752Zmz/buo
         P4GyfzLRjp8q/SOvjOClv/BwdRxaUl3HU+RobqiXKe6JB1GBaOYIdeMX5n02Fvtrb2Kw
         hcB1AVVfLmcdZoi6qf5QawLwZUHE2rv4pErZHK/L5PC7825mzZoEGuzoahpg+E+njDuF
         s3fWDAK0xzksiRRU4BX8/bAs4xBmgxr2hWoUyt3hKTYiayEYYsmnjcwHGKemg0IRX90N
         3X52dBaGatzCWw4H6nL5U/460oVNTKq5Cs00tDOSEB3r18BSrpYeQP5H1oGSogqyAp6L
         ngiw==
X-Forwarded-Encrypted: i=1; AJvYcCUMsjvOTrERRGEc+uWTiTFEFtWgp9dtqKIMD++tZXADsRSlw9bGs8OFV5tjmRokpdb67rdTo7u0D+9v/FUdnw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8qATL0MB3Ucpx9+YA4S91ZyCcizrcJqBVtUprKoW8BUjnp19V
	Ddak1m54ND+emxnpTVzT9aWw/g7J6hmf+DoJeSuATztJiYiW7QSYw6ZKgl+cs9FzWzdFWwRyGEM
	sVv2DudQ/2Q==
X-Google-Smtp-Source: AGHT+IFeKlzdEnxlsx468YN6J+lzj2fJ2REIK9m1LE7fZOV2UV2JrR/PAzf48/PWmJ/jsXO7ZyblIN12CqtAPQ==
X-Received: from wmqa17.prod.google.com ([2002:a05:600c:3491:b0:434:fa72:f1bf])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4586:b0:434:9e1d:7626 with SMTP id 5b1f17b1804b1-436e26f4b91mr97248925e9.25.1736534488470;
 Fri, 10 Jan 2025 10:41:28 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:45 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-19-8419288bc805@google.com>
Subject: [PATCH RFC v2 19/29] mm: asi: Stabilize CR3 in switch_mm_irqs_off()
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
X-CRM114-CacheID: sfid-20250110_184130_138575_3AC20CB0 
X-CRM114-Status: GOOD (  13.38  )
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

An ASI-restricted CR3 is unstable as interrupts can cause ASI-exits.
Although we already unconditionally ASI-exit during context-switch, and
before returning from the VM-run path, it's still possible to reach
switch_mm_irqs_off() in a restricted context, because KVM code updates
static keys, which requires using a temporary mm.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/mm/tlb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index c55733e144c7538ce7f97b74ea2b1b9c22497c32..ce5598f96ea7a84dc0e8623022ab5bfbba401b48 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -546,6 +546,9 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 	bool need_flush;
 	u16 new_asid;
 
+	/* Stabilize CR3, before reading or writing CR3 */
+	asi_exit();
+
 	/* We don't want flush_tlb_func() to run concurrently with us. */
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING))
 		WARN_ON_ONCE(!irqs_disabled());

-- 
2.47.1.613.gc27f4b7a9f-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
