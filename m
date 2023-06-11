Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA0CC77B7A
	for <linux-snps-arc@archiver.kernel.org>; Sun, 11 Jun 2023 15:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lif+BU13/nv16V6eHucoIw/+yWBrR/cwed5TJDir53E=; b=HJ2FKzccMVPpcf
	j3cEAYYj1rtiDQuZ1f//q9cyV5Q5DXdzFnXc40nT0LqOzUsW96HlYPm01KLUp5PiXK/SThtXoXled
	OPBkkuRMEaSNsgMRXUp8xC4JATCYHFn3dUbAcIe0i2JnWk3dQGsO0Axm4F5Rm+7ZOl4piLQV3n0gT
	4Nm+653oIqG3fPWxYscffBVeeB0PZSNw/FzAm42v1HRseEj2kl9ie1EoTCn8eiu7SEUnsH4KOiBG9
	ZDVHvYkjocmdw3sbeBCJSv529cA3KM/e8C5DYyD47NcbJO/mISHZBXADuxeU95nvI2qRq2J6dPxxE
	93XCcdMMAPGdtzY9oqCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NLX-001GMQ-2R;
	Sun, 11 Jun 2023 15:51:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NLU-001GKb-2a
	for linux-snps-arc@lists.infradead.org;
	Sun, 11 Jun 2023 15:51:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC47461C12;
	Sun, 11 Jun 2023 15:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD6AC4339C;
	Sun, 11 Jun 2023 15:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686498671;
	bh=PeeA52mxZTye5kjIQi5qNZYwJyG767bC4CRESc+UcmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rm4t4DvHrpS9Ui0En1xL7yQNszoFQrlLtLkrX9gcs19zIwZOP9jLYWti3tYbxjZpy
	 5sNNf7M4jw34AUPC7VDmD/MpCEmXB59pS/Up4w4JbAk5Xy0NgRdoADb1/bcz4vWCnK
	 frWFxIkmoFeuxSbJ6l6zeyO/9ewW2z4FHyuftiqPVvHVv0Foswro226YHH5/7rP7h8
	 FPCmqKhlrquuFCKvgBYMsZC8g5l63L1fQ/BG7OVtEZ2/r7CcB70BDHAdUoFXbJJ9Z2
	 hpLoj5upzA9QyVncXBQ5zcxQYjQOl/gxAteHNjnf/I92pw6F+hrd6GLT82CSUrp0BY
	 LDX0kBtY7BfDA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-snps-arc@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v9 02/11] modpost: pass struct module pointer to check_section_mismatch()
Date: Mon, 12 Jun 2023 00:50:51 +0900
Message-Id: <20230611155100.2553804-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611155100.2553804-1-masahiroy@kernel.org>
References: <20230611155100.2553804-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_085112_916541_B77A2116 
X-CRM114-Status: GOOD (  13.45  )
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

The next commit will use it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---


 scripts/mod/modpost.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 8decf04633bc..403ba4d923f5 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1211,7 +1211,7 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
 	}
 }
 
-static void check_section_mismatch(const char *modname, struct elf_info *elf,
+static void check_section_mismatch(struct module *mod, struct elf_info *elf,
 				   Elf_Sym *sym,
 				   unsigned int fsecndx, const char *fromsec,
 				   Elf_Addr faddr, Elf_Addr taddr)
@@ -1222,7 +1222,7 @@ static void check_section_mismatch(const char *modname, struct elf_info *elf,
 	if (!mismatch)
 		return;
 
-	default_mismatch_handler(modname, elf, mismatch, sym,
+	default_mismatch_handler(mod->name, elf, mismatch, sym,
 				 fsecndx, fromsec, faddr,
 				 tosec, taddr);
 }
@@ -1406,7 +1406,7 @@ static int addend_mips_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
 #define R_LARCH_SUB32		55
 #endif
 
-static void section_rela(const char *modname, struct elf_info *elf,
+static void section_rela(struct module *mod, struct elf_info *elf,
 			 Elf_Shdr *sechdr)
 {
 	Elf_Rela *rela;
@@ -1452,12 +1452,12 @@ static void section_rela(const char *modname, struct elf_info *elf,
 			break;
 		}
 
-		check_section_mismatch(modname, elf, elf->symtab_start + r_sym,
+		check_section_mismatch(mod, elf, elf->symtab_start + r_sym,
 				       fsecndx, fromsec, r.r_offset, r.r_addend);
 	}
 }
 
-static void section_rel(const char *modname, struct elf_info *elf,
+static void section_rel(struct module *mod, struct elf_info *elf,
 			Elf_Shdr *sechdr)
 {
 	Elf_Rel *rel;
@@ -1507,7 +1507,7 @@ static void section_rel(const char *modname, struct elf_info *elf,
 			fatal("Please add code to calculate addend for this architecture\n");
 		}
 
-		check_section_mismatch(modname, elf, elf->symtab_start + r_sym,
+		check_section_mismatch(mod, elf, elf->symtab_start + r_sym,
 				       fsecndx, fromsec, r.r_offset, r.r_addend);
 	}
 }
@@ -1524,19 +1524,19 @@ static void section_rel(const char *modname, struct elf_info *elf,
  * to find all references to a section that reference a section that will
  * be discarded and warns about it.
  **/
-static void check_sec_ref(const char *modname, struct elf_info *elf)
+static void check_sec_ref(struct module *mod, struct elf_info *elf)
 {
 	int i;
 	Elf_Shdr *sechdrs = elf->sechdrs;
 
 	/* Walk through all sections */
 	for (i = 0; i < elf->num_sections; i++) {
-		check_section(modname, elf, &elf->sechdrs[i]);
+		check_section(mod->name, elf, &elf->sechdrs[i]);
 		/* We want to process only relocation sections and not .init */
 		if (sechdrs[i].sh_type == SHT_RELA)
-			section_rela(modname, elf, &elf->sechdrs[i]);
+			section_rela(mod, elf, &elf->sechdrs[i]);
 		else if (sechdrs[i].sh_type == SHT_REL)
-			section_rel(modname, elf, &elf->sechdrs[i]);
+			section_rel(mod, elf, &elf->sechdrs[i]);
 	}
 }
 
@@ -1707,7 +1707,7 @@ static void read_symbols(const char *modname)
 					     sym_get_data(&info, sym));
 	}
 
-	check_sec_ref(modname, &info);
+	check_sec_ref(mod, &info);
 
 	if (!mod->is_vmlinux) {
 		version = get_modinfo(&info, "version");
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
