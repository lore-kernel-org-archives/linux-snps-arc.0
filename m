Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7C2CEE345
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Oct 2024 20:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htvey6gIGiNVeL+BtgqjkMvmDc2ekl+kQg4N4nEFrOk=; b=jLXSigLz90n6S8
	UWweMLLU/MbdVH1e409HE/gu40F6HXEmlzO93Bzyx4E/SuRxbth7KJkJBsvRzN8VL01ET5d12AR+B
	JJXifIoN4B2D2NfL5ygQCS6bla8wCHTg9tRE4lVG9OGMU9EzA4NG0ZCc0ho5yeB9CfXz6uHqvsdR/
	b6i/M5Uceh13llbNhOkznp3/gML6WlFli2ITx2E2EgKfblWPzV2mcjzEwul02mU2KsYjY7ZaJ/0GK
	Tvn7D4miRhsyuYuuAgYkPPMSgkftIbrHFKVn47M9aKaayrhYixP0c8oUdUMHbKsEOk4M1hybiyBni
	xnD+F6y3BM2doAQX0suA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syd0B-0000000AZXn-04dJ;
	Wed, 09 Oct 2024 20:09:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syb9Y-0000000ALaY-0vS7;
	Wed, 09 Oct 2024 18:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pivIpmPrEiNkGS0zm1hicx+P3hpfRXHzQg0zuVaSO98=; b=oUc2DbHmx+pL1TudrN2xuQih7W
	jw58gx6cd6CnkdpnYMD9DsDWLkqMgBp5G1JloyerFfkUit1SbsctrMoPmxOgppxg2EgaufYgcrlz8
	gw0Ktcs9LsKTcBd8v+BRNxcvimQkaZNEq3sgBP4xEkdwxLvCIPO35fuU5dfLDjxuyUCd4HA4fRI+L
	IlXxDW9EYdtF8teaJnqY3nFz8rlgyrtvGG2KsaCFLL0bsPs9mhT4O5GHN6X69UyYVLlhNOY490xW0
	4ErngupBB6x4NM+3MrT7WSqsJ2zEv0EoDpKLri8FBjyQoWnji6TSeCAX6pKNx7Q0iuAAKnZx875aJ
	Ba9ayXsA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syb9V-0000000555X-228Y;
	Wed, 09 Oct 2024 18:11:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9107FA443E5;
	Wed,  9 Oct 2024 18:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215B8C4CEDA;
	Wed,  9 Oct 2024 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728497471;
	bh=l7egSUNcilONf7gTBq0Hjl37ut+S55vwboWjXSdFWe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FXfE/sHay4UZzDr2fpnc2NuqlQrUe5ZOPEV5kEcagzZ0+u19ui7qjj9bE1VRxKdth
	 HK0scPDe/IbicUr5P2sGxdhPwk1RBpTZ7icvH77x5GnWU6n2AisPsAppJtYaR6HA/B
	 yrnCX892KuWofTmdMZr6iBJfSTtBiwbSCAxY8SdlcP/cDPEDF7eiF/JmfWrX9bU8lW
	 uz1YgvDXn1ZSA+CKqUDRLlC1GmUJ6GAdx984jhOmJa8UXqqtCdb2/vX9bKBQO8vUoY
	 OjXKfML4r0Z+EYFSa65S7pOq3b9au06CuhQHuRmk3ThCkxIILj5O5faywuz3zNJF9A
	 Ns2wf4ETdE7+A==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v5 8/8] x86/module: enable ROX caches for module text
Date: Wed,  9 Oct 2024 21:08:16 +0300
Message-ID: <20241009180816.83591-9-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009180816.83591-1-rppt@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_191113_738721_28F7286C 
X-CRM114-Status: GOOD (  13.87  )
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Enable execmem's cache of PMD_SIZE'ed pages mapped as ROX for module
text allocations.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/init.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index eb503f53c319..a0ec99fb9385 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -1053,6 +1053,15 @@ unsigned long arch_max_swapfile_size(void)
 #ifdef CONFIG_EXECMEM
 static struct execmem_info execmem_info __ro_after_init;
 
+static void execmem_fill_trapping_insns(void *ptr, size_t size, bool writeable)
+{
+	/* fill memory with INT3 instructions */
+	if (writeable)
+		memset(ptr, INT3_INSN_OPCODE, size);
+	else
+		text_poke_set(ptr, INT3_INSN_OPCODE, size);
+}
+
 struct execmem_info __init *execmem_arch_setup(void)
 {
 	unsigned long start, offset = 0;
@@ -1063,8 +1072,23 @@ struct execmem_info __init *execmem_arch_setup(void)
 	start = MODULES_VADDR + offset;
 
 	execmem_info = (struct execmem_info){
+		.fill_trapping_insns = execmem_fill_trapping_insns,
 		.ranges = {
-			[EXECMEM_DEFAULT] = {
+			[EXECMEM_MODULE_TEXT] = {
+				.flags	= EXECMEM_KASAN_SHADOW | EXECMEM_ROX_CACHE,
+				.start	= start,
+				.end	= MODULES_END,
+				.pgprot	= PAGE_KERNEL_ROX,
+				.alignment = MODULE_ALIGN,
+			},
+			[EXECMEM_KPROBES ... EXECMEM_BPF] = {
+				.flags	= EXECMEM_KASAN_SHADOW,
+				.start	= start,
+				.end	= MODULES_END,
+				.pgprot	= PAGE_KERNEL,
+				.alignment = MODULE_ALIGN,
+			},
+			[EXECMEM_MODULE_DATA] = {
 				.flags	= EXECMEM_KASAN_SHADOW,
 				.start	= start,
 				.end	= MODULES_END,
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
