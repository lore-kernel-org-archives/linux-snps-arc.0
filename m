Return-Path: <SRS0=TnUX=MM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57988C636C9
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Jul 2021 20:58:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AA74610A0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Jul 2021 20:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AA74610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQWvKoYz2GUnX5DUQB4gKA6DjWWbxMDF4f76pcYftE0=; b=bHZxH3ybuAXWRv
	p/qgoU95DlTI19ReFyIZ60acH6j1/MKCfclzMVoatmjyyZhWL+Y9teLjwbl0EQKlrwyBlD7wcNi61
	YzWapPzTOq8Qf3hRh9RVVLWJ5eNDfCXZl/i2twFJ1aiovckYU8m4QIKDUyazWWQJqIJAhcpevWm9v
	qwwl5NmWGFyhDhldoBuQXK03D5jG/edKBaqu+KuAj1yvIW1iifMDm7YxmjN284FLzaUcw72+O5y35
	d3DNA7Rm3QJI4fC3HO2DJNJb55maVY8dh+gcj15axRTWK8gsGMFjqQFXzCiuS4PM9+mZU6f4VXry4
	3mhrmGDtmCQAgStkODgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5won-00Dvrj-Iv; Tue, 20 Jul 2021 20:58:21 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5woj-00DvoT-Ol
 for linux-snps-arc@lists.infradead.org; Tue, 20 Jul 2021 20:58:19 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8C97EC378C;
 Tue, 20 Jul 2021 20:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1626814692; bh=zLQ2I6C/YUm1wJ18njXY0jHFDdykM8lQJRoiRj0s5qw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q7OcOZ0d3VvMa2QQ4bdGy3aSPXRHWQjHQBJjlzDdaGhaaDYlzVQFRXzw/NuNhq+Pf
 aQurMDtovxnd5+qpx6g8QPOr7aEFdkGnSI08SGSEkGxRdikmQ99vpkFaGo+IwuzdEj
 0NKz8aMlMC55+HCA4qzBpPc732x8g0Ga1wyTQCj2gipUy3oJDF3n0iQ64poXJk3fG4
 9iQC1X3T/N4chMqDMOgSPiGe8HeKffSkl49j4DWlhZX6MmlQJZiX9IdA33FqnQdqEg
 Olkki/3NfVwN/4Sly0I0zUHvCsNl9WSN03fmRWepHcQy2cmeNtZgcKmPLBd7GUDNFO
 sGqKg0Wt32K3A==
Received: from vineetg-Latitude-7400.internal.synopsys.com
 (snps-fugpbdpduq.internal.synopsys.com [10.202.17.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id BDDC7A026B;
 Tue, 20 Jul 2021 20:58:11 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Cc: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 2/2] ARC: elf: make type safe
Date: Tue, 20 Jul 2021 13:58:00 -0700
Message-Id: <20210720205800.1056218-3-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720205800.1056218-1-vgupta@synopsys.com>
References: <20210720205800.1056218-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_135817_908120_9976E369 
X-CRM114-Status: GOOD (  12.28  )
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

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 sysdeps/arc/dl-machine.h | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/sysdeps/arc/dl-machine.h b/sysdeps/arc/dl-machine.h
index 60b49af0d5ca..e6ce7f0ff6d9 100644
--- a/sysdeps/arc/dl-machine.h
+++ b/sysdeps/arc/dl-machine.h
@@ -86,7 +86,7 @@
 
 /* Return nonzero iff ELF header is compatible with the running host.  */
 static inline int
-elf_machine_matches_host (const Elf32_Ehdr *ehdr)
+elf_machine_matches_host (const ElfW(Ehdr) *ehdr)
 {
   return (ehdr->e_machine == EM_ARCV2		 /* ARC HS.  */
 	  || ehdr->e_machine == EM_ARC_COMPACT); /* ARC 700.  */
@@ -124,7 +124,7 @@ static inline int
 __attribute__ ((always_inline))
 elf_machine_runtime_setup (struct link_map *l, int lazy, int profile)
 {
-  extern void _dl_runtime_resolve (Elf32_Word);
+  extern void _dl_runtime_resolve (void);
 
   if (l->l_info[DT_JMPREL] && lazy)
     {
@@ -202,7 +202,7 @@ __start:								\n\
 /* A reloc type used for ld.so cmdline arg lookups to reject PLT entries.  */
 #define ELF_MACHINE_JMP_SLOT  R_ARC_JUMP_SLOT
 
-/* ARC uses Elf32_Rela relocations.  */
+/* ARC uses Rela relocations.  */
 #define ELF_MACHINE_NO_REL 1
 #define ELF_MACHINE_NO_RELA 0
 
@@ -211,19 +211,14 @@ __start:								\n\
 static inline ElfW(Addr)
 elf_machine_fixup_plt (struct link_map *map, lookup_t t,
 		       const ElfW(Sym) *refsym, const ElfW(Sym) *sym,
-		       const Elf32_Rela *reloc,
+		       const ElfW(Rela) *reloc,
 		       ElfW(Addr) *reloc_addr, ElfW(Addr) value)
 {
   return *reloc_addr = value;
 }
 
 /* Return the final value of a plt relocation.  */
-static inline ElfW(Addr)
-elf_machine_plt_value (struct link_map *map, const Elf32_Rela *reloc,
-                       ElfW(Addr) value)
-{
-  return value;
-}
+#define elf_machine_plt_value(map, reloc, value) (value)
 
 /* Names of the architecture-specific auditing callback functions.  */
 #define ARCH_LA_PLTENTER arc_gnu_pltenter
@@ -239,8 +234,9 @@ elf_machine_rela (struct link_map *map, const ElfW(Rela) *reloc,
                   const ElfW(Sym) *sym, const struct r_found_version *version,
                   void *const reloc_addr_arg, int skip_ifunc)
 {
+  ElfW(Addr) r_info = reloc->r_info;
+  const unsigned long int r_type = ELFW (R_TYPE) (r_info);
   ElfW(Addr) *const reloc_addr = reloc_addr_arg;
-  const unsigned int r_type = ELF32_R_TYPE (reloc->r_info);
 
   if (__glibc_unlikely (r_type == R_ARC_RELATIVE))
     *reloc_addr += map->l_addr;
@@ -334,11 +330,12 @@ elf_machine_lazy_rel (struct link_map *map, ElfW(Addr) l_addr,
                       const ElfW(Rela) *reloc, int skip_ifunc)
 {
   ElfW(Addr) *const reloc_addr = (void *) (l_addr + reloc->r_offset);
+  const unsigned int r_type = ELFW (R_TYPE) (reloc->r_info);
 
-  if (ELF32_R_TYPE (reloc->r_info) == R_ARC_JUMP_SLOT)
+  if (r_type == R_ARC_JUMP_SLOT)
     *reloc_addr += l_addr;
   else
-    _dl_reloc_bad_type (map, ELF32_R_TYPE (reloc->r_info), 1);
+    _dl_reloc_bad_type (map, r_type, 1);
 }
 
 #endif /* RESOLVE_MAP */
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
