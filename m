Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891B2C7EE23
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 13:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1A/uRtCP0NOldQPD02vMuhfzbDVafnbK20+k/QnEMw=; b=i4nOC6rvlTt3Db
	Ze14qtC4thDCoyl38CSiwVoAx+lGnmhoNUuqXd+P8R7BqzVU2K4QyjDVPudhxGybpoSKc01xyGPc+
	4MwHakg6DhPd7DvAyzJa7jiuvgN/G1x9fcCmtJIg8a0mjqE5l8iiKSPZgVuvq0wjk2leqbcK2RypI
	Ry6fnx77MyYBrTc6DxLWvVfIFsgAvjaDawBk13QR6Ks+He5PDb2eytVvh+UdUQ5GMYqyAU9NeG2b6
	kFFsoPkqDucvDqOE0t7WIRzhQSaFheduUpqhA1w9MeD6RJdVVjQLoPMtFh/knc80GnY53lIv+hk3L
	sq9kE/b0FbOd8U0W1e3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px5uu-008nKj-17;
	Thu, 11 May 2023 13:01:08 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4xc-008h7B-13
	for linux-snps-arc@lists.infradead.org;
	Thu, 11 May 2023 11:59:54 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f26f437b30so501111e87.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 11 May 2023 04:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683806388; x=1686398388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9HwjvVojH9hO+PcXlqtL0N9aNW9rB2MppMH77zfxVc=;
        b=h0huwFcuyufkrW22b7sSvhGB+Ccc6Lvo9LGZiN8vwcbnU3/n9iarupyO8uSUn0mH7F
         UImAdUl3W888BP2VJ8/y8hWeLPQaZrBrjm/Nu0uLf1rKtgfpgHOHOP3tTQ9zFsRYQoKI
         fGAtPet9xa7ZtgZBS/HBd67ncf+0PhGxnnIJLi+0TR3kFXVIwxrxsSsx9kN2u2S00z2X
         5KFPOq38DBsV6TYrMad4lE6aD4UesfNWsMyc8GuXrhIa7ASsSuoxihIooTid0hE5RsnF
         bNeaAbNDtKQlSprjkgw+hz3rwPgZB+BNN+D6bTWYVkWkC3zgqquZjKjZxaDyStXaw9xj
         elHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806388; x=1686398388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9HwjvVojH9hO+PcXlqtL0N9aNW9rB2MppMH77zfxVc=;
        b=VSFdSf9iXUFxi6GxDit00BXiZXW9pHlnen4i07UM9My1DYvgcxYz0RlF2acol+pJoK
         wlCMEndvBVKtD1NMeBeRYTgLvQqvxHd61QC6yOpuMLHS1XM2v+c4Wd+v2LLFu+5HGL7J
         VO6ZZNjIMgBTeraKWjq6o5HNU+rFWaA0VIljVEL1QcGuFh3NPOz7P5pZxOrkvsjV3p5O
         CY05AZlPJWJcSvCsx1l7iqGyJkp0vqH2sG/FzbABbrbajVOuLXhDsA/wJ/jOB9XSBw3R
         sRXn6slBAK123OkayD8RF8SviKRXLrLa2XE+ZH+E9voM6Wdb8WdgsfJZVV5J1uigfdTv
         WDpQ==
X-Gm-Message-State: AC+VfDxmkKIOSwBDe1YMsqQE10n99mO1SzfHwjmNaRcU/kIg4AjEI4r1
	iFT7t/7rGV+iL5bpnxu3pWir6g==
X-Google-Smtp-Source: ACHHUZ4qGS9xBErA7Vxmp86kEFbZREMrSwBsY/Yl8Ba5RFvn3cUSOtGcwzeX5nOwmTp3pnnJ0geHYA==
X-Received: by 2002:a19:f813:0:b0:4ec:a48a:28c0 with SMTP id a19-20020a19f813000000b004eca48a28c0mr2749652lff.25.1683806388439;
        Thu, 11 May 2023 04:59:48 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25090000000b004cb23904bd9sm1100841lfm.144.2023.05.11.04.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 04:59:48 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2023 13:59:19 +0200
Subject: [PATCH 02/12] m68k: Pass a pointer to virt_to_pfn() virt_to_page()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v1-2-6c4698dcf9c8@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Vineet Gupta <vgupta@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_045952_371311_108AF219 
X-CRM114-Status: GOOD (  15.09  )
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

Functions that work on a pointer to virtual memory such as
virt_to_pfn() and users of that function such as
virt_to_page() are supposed to pass a pointer to virtual
memory, ideally a (void *) or other pointer. However since
many architectures implement virt_to_pfn() as a macro,
this function becomes polymorphic and accepts both a
(unsigned long) and a (void *).

Fix up the offending calls in arch/m68k with explicit casts.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Add an extra parens around the page argument to the
  PD_PTABLE() macro, as is normally required.
---
 arch/m68k/mm/motorola.c | 4 ++--
 arch/m68k/mm/sun3mmu.c  | 2 +-
 arch/m68k/sun3/dvma.c   | 2 +-
 arch/m68k/sun3x/dvma.c  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 911301224078..c75984e2d86b 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -102,7 +102,7 @@ static struct list_head ptable_list[2] = {
 	LIST_HEAD_INIT(ptable_list[1]),
 };
 
-#define PD_PTABLE(page) ((ptable_desc *)&(virt_to_page(page)->lru))
+#define PD_PTABLE(page) ((ptable_desc *)&(virt_to_page((void *)(page))->lru))
 #define PD_PAGE(ptable) (list_entry(ptable, struct page, lru))
 #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
 
@@ -201,7 +201,7 @@ int free_pointer_table(void *table, int type)
 		list_del(dp);
 		mmu_page_dtor((void *)page);
 		if (type == TABLE_PTE)
-			pgtable_pte_page_dtor(virt_to_page(page));
+			pgtable_pte_page_dtor(virt_to_page((void *)page));
 		free_page (page);
 		return 1;
 	} else if (ptable_list[type].next != dp) {
diff --git a/arch/m68k/mm/sun3mmu.c b/arch/m68k/mm/sun3mmu.c
index b619d0d4319c..c5e6a23e0262 100644
--- a/arch/m68k/mm/sun3mmu.c
+++ b/arch/m68k/mm/sun3mmu.c
@@ -75,7 +75,7 @@ void __init paging_init(void)
 		/* now change pg_table to kernel virtual addresses */
 		pg_table = (pte_t *) __va ((unsigned long) pg_table);
 		for (i=0; i<PTRS_PER_PTE; ++i, ++pg_table) {
-			pte_t pte = pfn_pte(virt_to_pfn(address), PAGE_INIT);
+			pte_t pte = pfn_pte(virt_to_pfn((void *)address), PAGE_INIT);
 			if (address >= (unsigned long)high_memory)
 				pte_val (pte) = 0;
 			set_pte (pg_table, pte);
diff --git a/arch/m68k/sun3/dvma.c b/arch/m68k/sun3/dvma.c
index f15ff16b9997..83fcae6a0e79 100644
--- a/arch/m68k/sun3/dvma.c
+++ b/arch/m68k/sun3/dvma.c
@@ -29,7 +29,7 @@ static unsigned long dvma_page(unsigned long kaddr, unsigned long vaddr)
 	j = *(volatile unsigned long *)kaddr;
 	*(volatile unsigned long *)kaddr = j;
 
-	ptep = pfn_pte(virt_to_pfn(kaddr), PAGE_KERNEL);
+	ptep = pfn_pte(virt_to_pfn((void *)kaddr), PAGE_KERNEL);
 	pte = pte_val(ptep);
 //	pr_info("dvma_remap: addr %lx -> %lx pte %08lx\n", kaddr, vaddr, pte);
 	if(ptelist[(vaddr & 0xff000) >> PAGE_SHIFT] != pte) {
diff --git a/arch/m68k/sun3x/dvma.c b/arch/m68k/sun3x/dvma.c
index 08bb92113026..a6034ba05845 100644
--- a/arch/m68k/sun3x/dvma.c
+++ b/arch/m68k/sun3x/dvma.c
@@ -125,7 +125,7 @@ inline int dvma_map_cpu(unsigned long kaddr,
 			do {
 				pr_debug("mapping %08lx phys to %08lx\n",
 					 __pa(kaddr), vaddr);
-				set_pte(pte, pfn_pte(virt_to_pfn(kaddr),
+				set_pte(pte, pfn_pte(virt_to_pfn((void *)kaddr),
 						     PAGE_KERNEL));
 				pte++;
 				kaddr += PAGE_SIZE;

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
