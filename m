Return-Path: <SRS0=s8S7=MO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A95C63793
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:37:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A14456135F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A14456135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=474ghdufVOgaUuyKxp0Tg8BjKqOGAIdgEIOsTnF9G5Y=; b=l3NUpepX87ta2R
	YgE0uaN1GBUi+8zxbGDkN/f4kAO4ti7o/d0mwMDfuzLVfPHQYGko1g72fSP7mwomhxZbqZGOUCfF9
	FaeJ5XNOONhq0wlVbYgrEPhoBy4rce7gg8tfpqXDJO4TIRnXxb+vwRyGgDVrAQNn+4HPBwu6BbYo0
	RBOC0JwU2dr7TbsKyjDWYOLPtepcEkepvo4c5lASv83wmjMLm2cEMwjrvdEg+T88Xgl6plMgpg8/Q
	4290VUXe+SWJpNWDU3zg4LVXWtpxq82d11qqoSzitdyuIY5sOLEHx7HsVqb2jh6VwLdBmtOt2Z68T
	8SSHfUZ/z4RlUET/x0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Ytb-001hb2-Ti; Thu, 22 Jul 2021 13:37:51 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Yet-001duz-M2
 for linux-snps-arc@lists.infradead.org; Thu, 22 Jul 2021 13:22:41 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A2D6A407CD;
 Thu, 22 Jul 2021 13:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1626960155; bh=unEHu/ZH5lIfTBmPdNJpMXwLTKglW367knbk584tfVw=;
 h=From:To:Cc:Subject:Date:From;
 b=A1XyC5nQ4zkEo6rkd9Nx7x8DxDu4IcnObjdZ3F7K9PfvSGm+d/KW/C5bi1R7eJ0fx
 FAgsQ+G4QTPgXmwVUYSWjzSOWjSoWvI8qkgrLZYP0rAfAPGvhLGHTs8lwkVO7SQuF3
 DGLkZDLQ1atuOp2zqj62k2/TJ0iJTO2s1LhhZ/AIZGRAQXfvVIfeh5dOY6zpJLeHjl
 hcMWWrfjFDEiK5bue/at+6eQ4/+bd9apLQSi0+Kek4bByoiFnNVZ0onuJmbXWQZ/25
 PnaCM1bpMRUt1vm/I/8C9L3rec5CT8qVOiDZnKmXkq/hKJ2zcX+wF0eoeFIXViZZXL
 J7AMeZQ9zTRFw==
Received: from isaev-debian.internal.synopsys.com (unknown [10.121.15.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 70EBEA005D;
 Thu, 22 Jul 2021 13:22:31 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vladimir Isaev <Vladimir.Isaev@synopsys.com>
To: libc-alpha@sourceware.org
Cc: linux-snps-arc@lists.infradead.org,
 Vladimir Isaev <Vladimir.Isaev@synopsys.com>,
 Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH] elf: _dl_fixup*: make @reloc_arg 64-bit safe
Date: Thu, 22 Jul 2021 16:22:00 +0300
Message-Id: <20210722132200.43895-1-isaev@synopsys.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_062239_795503_8396BD48 
X-CRM114-Status: GOOD (  13.70  )
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

This came up during arc64 glibc bringup on qemu usermode.

On ARC, lazy rezolver calls _dl_fixup() with 2nd argument as PC of the
PLT entry beiing fixed up. Thus this needs to be full 64-bit value for
arc64, however _dl_fixup() defines @reloc_arg as ElfW(Word) which maps
to Elf64_Word -> uint32_t causing gcc to truncate the value to 32-bits.

This problem show on 64-bit ARC and not other arches likely due to the
semantics of @reloc_arg. On ARC it is the runtime PC of PLT entry whereas for
others it might be the index or something similar which doesn't need
more than 32-bits.

Reported-by: Cupertino Miranda <cmiranda@synopsys.com>
Signed-off-by: Vladimir Isaev <isaev@synopsys.com>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 elf/dl-runtime.c          | 6 +++---
 sysdeps/hppa/dl-fptr.c    | 2 +-
 sysdeps/i386/dl-machine.h | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/elf/dl-runtime.c b/elf/dl-runtime.c
index 9d0d941000..6099a44ffb 100644
--- a/elf/dl-runtime.c
+++ b/elf/dl-runtime.c
@@ -56,7 +56,7 @@ _dl_fixup (
 # ifdef ELF_MACHINE_RUNTIME_FIXUP_ARGS
 	   ELF_MACHINE_RUNTIME_FIXUP_ARGS,
 # endif
-	   struct link_map *l, ElfW(Word) reloc_arg)
+	   struct link_map *l, uintptr_t reloc_arg)
 {
   const ElfW(Sym) *const symtab
     = (const void *) D_PTR (l, l_info[DT_SYMTAB]);
@@ -152,7 +152,7 @@ _dl_profile_fixup (
 #ifdef ELF_MACHINE_RUNTIME_FIXUP_ARGS
 		   ELF_MACHINE_RUNTIME_FIXUP_ARGS,
 #endif
-		   struct link_map *l, ElfW(Word) reloc_arg,
+		   struct link_map *l, uintptr_t reloc_arg,
 		   ElfW(Addr) retaddr, void *regs, long int *framesizep)
 {
   void (*mcount_fct) (ElfW(Addr), ElfW(Addr)) = _dl_mcount;
@@ -484,7 +484,7 @@ _dl_profile_fixup (
 #include <stdio.h>
 void
 ARCH_FIXUP_ATTRIBUTE
-_dl_call_pltexit (struct link_map *l, ElfW(Word) reloc_arg,
+_dl_call_pltexit (struct link_map *l, uintptr_t reloc_arg,
 		  const void *inregs, void *outregs)
 {
 #ifdef SHARED
diff --git a/sysdeps/hppa/dl-fptr.c b/sysdeps/hppa/dl-fptr.c
index 62ef68b62b..bcab1bf100 100644
--- a/sysdeps/hppa/dl-fptr.c
+++ b/sysdeps/hppa/dl-fptr.c
@@ -321,7 +321,7 @@ _dl_unmap (struct link_map *map)
   map->l_mach.fptr_table = NULL;
 }
 
-extern ElfW(Addr) _dl_fixup (struct link_map *, ElfW(Word)) attribute_hidden;
+extern ElfW(Addr) _dl_fixup (struct link_map *, uintptr_t) attribute_hidden;
 
 static inline Elf32_Addr
 elf_machine_resolve (void)
diff --git a/sysdeps/i386/dl-machine.h b/sysdeps/i386/dl-machine.h
index 590b41d8d7..8f73e0efda 100644
--- a/sysdeps/i386/dl-machine.h
+++ b/sysdeps/i386/dl-machine.h
@@ -130,10 +130,10 @@ elf_machine_runtime_setup (struct link_map *l, int lazy, int profile)
 #define ARCH_FIXUP_ATTRIBUTE __attribute__ ((regparm (3), stdcall, unused))
 
 extern ElfW(Addr) _dl_fixup (struct link_map *l,
-			     ElfW(Word) reloc_offset)
+			     uintptr_t reloc_offset)
      ARCH_FIXUP_ATTRIBUTE;
 extern ElfW(Addr) _dl_profile_fixup (struct link_map *l,
-				     ElfW(Word) reloc_offset,
+				     uintptr_t reloc_offset,
 				     ElfW(Addr) retaddr, void *regs,
 				     long int *framesizep)
      ARCH_FIXUP_ATTRIBUTE;
-- 
2.32.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
