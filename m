Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4219E7719C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jan 2025 19:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=i58kaPRgRYe81OuChCdSHGozZEG2O3FjiD/cyo948qo=; b=dfkOjDxyIQYYSi/Se2GPUKsWdT
	9wHO0taNMo9DORZnQfX7JuSXKOQfLhLHb1FR52ZVZZFfGVvlLH0m8fJigr+rCAHb5EGd342usdJNM
	ikkjcik/jTBThWOd1lYtE+rX0jG8kSFgiINt49Omj8GJPbkYiDA5adcJaAa0CjDUKloHgqi2LxkEd
	7kg14gz3hDTO/b3urnkkpwiTtXkapKeG7bP7OMcXv/cdEn5uWIh7+zzrHVTBCFsMDih+MzLN56hFV
	xDAeoLmLFdC893514YVVp5nt8zLVlZ9eeHS3tGerlegFvKT7UD76eer4vv2ETW1d9GIEI+UpwfqVd
	6CKxzaNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWL3y-0000000GonM-3C3P;
	Fri, 10 Jan 2025 19:52:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJwd-0000000GbYG-3FJo
	for linux-snps-arc@bombadil.infradead.org;
	Fri, 10 Jan 2025 18:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DqQy0/uo7rp5xt5hxwNN280PfwFL6RX7EFGPCdWY0es=; b=WUPJ+o4vpQi+h62UeAz3qJ6h52
	9K8ZXNPE6Hccw9rdUf0eCIFa6+kQIbSzauAaRdhgcHI2YSnUrauLtiqbVFe1D7mq3FtUV1zRV1Jv4
	bTDxcrxGvcs4TrWElqgr6A/7wRvq3cjVIwyUx/kEiQ/JGDHKBboxhOcCZX0JJGLerhjj1E5yzffW9
	GsdP8pMR1qisoldp2UDECbRDXyivmTDE0JPpu0V2mcjyaq3T4BuOeDm1RJ29hK0IDs1/6qGNcqKhE
	vmMsD8f5FxNhS/EkotVi/QL4569JxoQXQYrPVlIgTXNl1DXYpT7wcJcqn/sxv7Aj8ehvmclOg6GvE
	yJATqKxg==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJwa-0000000EBKG-1xY2
	for linux-snps-arc@lists.infradead.org;
	Fri, 10 Jan 2025 18:41:18 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43651b1ba8aso16457245e9.1
        for <linux-snps-arc@lists.infradead.org>; Fri, 10 Jan 2025 10:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534475; x=1737139275; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DqQy0/uo7rp5xt5hxwNN280PfwFL6RX7EFGPCdWY0es=;
        b=3VaJ1QNUVgChADY9F1sMg77acz9tvDKi30MSbMN8CSWpJ8QGyaTHauGT178xBBUeDo
         AuXaeCWbj1PEgGurbgdvJlKafxuVRfZWV+VNLUyXPTvKO6afx/x3x1WjHuuPwR+7tE84
         jsTaoXZ7bUUqSwV2DoqtGSuQO/V4tTFMlnmd4KRZf06fAi8KFtr3NVN/X1hdZMSnVotT
         qYR52rRQN1q3DabM10Hg0Ac+U+f71BUcIao/taUURtrXBcCKn+yy1CAyaRZzEQL5gKY7
         eZywMdFFsNk72ut2uKC50mGNvWd6EuoTAjs4eAKIPwK0P6kX8HOJ9OvLSdQrHRfLnlYZ
         kuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534475; x=1737139275;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqQy0/uo7rp5xt5hxwNN280PfwFL6RX7EFGPCdWY0es=;
        b=BZ+mysnVSN9ZkX6pRna99qE4N+mbqxVjkTTS7mDssPS10CAiuquNVWKh/4WISepeJC
         I3o+be6u5pIU7wu0PIgcrELfzpDvdpEipF2HOCOrCNGDLqMjGwMIOgwW5v0ZONNVlhls
         vJ0o8zeWFrGHC5U1zd3uGvXt2CBMwHqpUcq5qbQmmO+7qmaJplGLZAJSQUB2NYkGkvh6
         0m1/ZI8uxbE2krxpmLanyPh+wjS1LQ+U2Ul6dWq0znvm6kTCaL/WMrTpwd86f1dDs5aa
         ZQNrd2wQG6uGNldLIWFPUY7/06NGNEmhUOqF9Peb8IkFw4iM9ZJh7W0AbKOpEy6RhWcB
         90EA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ196nb8x5+j0qOeGrXW0qBQ4PWp+oP+zYyWHZDz0NHvXhWSSLpRSa4N6k1Qd0vqPaLXakcNLYzv6vk8BwJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTEQ7AwQAsB2q4qEQ6jxSnkYPvtgKfweRmjqFmu/1EGSsIv/pe
	LgCWyth6KSwmC3IIMdUm5nZm3hcl6JFOAqM6kd68OkK1w0+vOzrL5DDm7qklysY59U9/s5CyGbU
	ZC21qgVpOAw==
X-Google-Smtp-Source: AGHT+IEHMyjAf4Ii6uANDaoYyo5ZkF+D1/fwKOgm4kaaSXfegc+L5vVxTYn6WIEloGlJDmt93RFbSdb2jTZqKA==
X-Received: from wmbjt19.prod.google.com ([2002:a05:600c:5693:b0:435:4bd2:1dcd])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e44:b0:434:e9ee:c3d with SMTP id 5b1f17b1804b1-436e27070b1mr106983675e9.20.1736534474969;
 Fri, 10 Jan 2025 10:41:14 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:39 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-13-8419288bc805@google.com>
Subject: [PATCH RFC v2 13/29] mm: Add __PAGEFLAG_FALSE
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
X-CRM114-CacheID: sfid-20250110_184116_567360_3F205793 
X-CRM114-Status: GOOD (  12.97  )
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

__PAGEFLAG_FALSE is a non-atomic equivalent of PAGEFLAG_FALSE.

Checkpatch-args: --ignore=COMPLEX_MACRO
Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 include/linux/page-flags.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index cc839e4365c18223e68c35efd0f67e7650708e8b..7ee9a0edc6d21708fc93dfa8913dc1ae9478dee3 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -484,6 +484,10 @@ static inline int Page##uname(const struct page *page) { return 0; }
 FOLIO_SET_FLAG_NOOP(lname)						\
 static inline void SetPage##uname(struct page *page) {  }
 
+#define __SETPAGEFLAG_NOOP(uname, lname)					\
+static inline void __folio_set_##lname(struct folio *folio) { }		\
+static inline void __SetPage##uname(struct page *page) {  }
+
 #define CLEARPAGEFLAG_NOOP(uname, lname)				\
 FOLIO_CLEAR_FLAG_NOOP(lname)						\
 static inline void ClearPage##uname(struct page *page) {  }
@@ -506,6 +510,9 @@ static inline int TestClearPage##uname(struct page *page) { return 0; }
 #define TESTSCFLAG_FALSE(uname, lname)					\
 	TESTSETFLAG_FALSE(uname, lname) TESTCLEARFLAG_FALSE(uname, lname)
 
+#define __PAGEFLAG_FALSE(uname, lname) TESTPAGEFLAG_FALSE(uname, lname)		\
+	__SETPAGEFLAG_NOOP(uname, lname) __CLEARPAGEFLAG_NOOP(uname, lname)
+
 __PAGEFLAG(Locked, locked, PF_NO_TAIL)
 FOLIO_FLAG(waiters, FOLIO_HEAD_PAGE)
 FOLIO_FLAG(referenced, FOLIO_HEAD_PAGE)

-- 
2.47.1.613.gc27f4b7a9f-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
