Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882D5C7EE23
	for <linux-snps-arc@archiver.kernel.org>; Sun, 11 Jun 2023 15:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NNZJrm+fQMJumhVIdIhDxPJjHB6wr647njhchPoBa9c=; b=kzsWkmILgsM1pA
	EwnqAo1yRyoqU5SAcYHFGzXRSy6omkWnqAVNBVqSP4UgEO2glYE279NWxXJ0/bSJ/5mLEk85RYY0+
	3N+YMnggigepZ0SXYayzqIlUm7Rwb6ndf4fQx1J18egzqQYuRXKnfWdfON0Ywgb17quWfEyEmYk4x
	S7xWhXAenzt1TE0zZ+3G9of7QEFeCvc0xMFXqKG7DfwaesQaRRus6uZC/bkCpCEAp/QwTuXFNDB96
	sH92/kdly+d9BDirjzXdyBNTciGUVBgwvDtHo9bTFYMPpYi4oecd+Jd4Agzn3ksrqtWkRY6jcg8i4
	K8tmPbIFdxpWJxtnchBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NLX-001GLz-1U;
	Sun, 11 Jun 2023 15:51:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NLS-001GJg-3D
	for linux-snps-arc@lists.infradead.org;
	Sun, 11 Jun 2023 15:51:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C74D7611B6;
	Sun, 11 Jun 2023 15:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82E1C433EF;
	Sun, 11 Jun 2023 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686498667;
	bh=M3P3Tt70oSF0U8/09BUo6OTsoFwqdfvzt/GIo8FG5HI=;
	h=From:To:Cc:Subject:Date:From;
	b=n+W+kqhgipjQhbBWZzfaqidf3aqKOK/oETi8tjadKHGBAAYVrtcswAgyfd0GlKAeA
	 NfWQRlr+Xo5ueNaRQnJYa78jPB7639OIk9K4yL07oIJkeCQI+icCHSt+lQrCgAchJC
	 7AiTvTdVnvYCFp7VLbNdW4n2EO8M9d/uZOrtEKJCw950095tH4AU7OQxwyjDuZ6Wbl
	 v19QKzLpcMk6aWyaYhOr89oP7E12h4gx9FAbVaKqvaK/42AjI2Pvtj4Gh2ezllTmIy
	 1FjZALS2Ij4XN8eQ9cIZmg8VbSl2QBuXZGXesINi11iHYuKXzj4qdtCwlKyBi06YSx
	 b8oWhgxfqHqtQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-snps-arc@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v9 00/11] Unify <linux/export.h> and <asm/export.h>, remove EXPORT_DATA_SYMBOL(), faster TRIM_UNUSED_KSYMS
Date: Mon, 12 Jun 2023 00:50:49 +0900
Message-Id: <20230611155100.2553804-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_085111_109181_35A8A00A 
X-CRM114-Status: GOOD (  12.43  )
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


My goals:

 - Refactors EXPORT_SYMBOL, <linux/export.h> and <asm/export.h>.
   You can still put EXPORT_SYMBOL() in *.S file, very close to the definition,
   but you do not need to care about whether it is a function or a data.
   This removes EXPORT_DATA_SYMBOL().

 - Re-implement TRIM_UNUSED_KSYMS in one-pass.
   This makes the building faster.

 - Move the static EXPORT_SYMBOL check to modpost.
   This also makes the building faster.

This patch set is applicable to linux-next 20230609.

Previous version
v8: https://lore.kernel.org/linux-kbuild/CAK7LNARBVqdWgsPOwGJu87AKNVZvnWjL-bBJ3xJ-2w+fpidZZA@mail.gmail.com/T/#t
v7: https://lore.kernel.org/linux-kbuild/20230608142428.256985-1-masahiroy@kernel.org/T/#mbaddcee18c9a8cf0a9b1f3fc562d09526cb69540
v6: https://lore.kernel.org/linux-kbuild/CAK7LNARjzGnj+sYX=_5yQ+8qoOQ2KB5N-_Ye53Ru3=XicezTYw@mail.gmail.com/T/#t
v5: https://lore.kernel.org/linux-kbuild/CAK7LNARBiOywrMLbR=9N35sk19U0QM3xcPy7d1WqV-eyb4W23w@mail.gmail.com/T/#t
v4: https://lore.kernel.org/linux-kbuild/CAK7LNASDzy9RERN6+q6WgR4ROYZQue=SBqgbcoYuVePByHtk6Q@mail.gmail.com/T/#t
v3: https://lore.kernel.org/all/20220928063947.299333-1-masahiroy@kernel.org/



Masahiro Yamada (11):
  ARC: define ASM_NL and __ALIGN(_STR) outside #ifdef __ASSEMBLY__ guard
  modpost: pass struct module pointer to check_section_mismatch()
  kbuild: generate KSYMTAB entries by modpost
  ia64,export.h: replace EXPORT_DATA_SYMBOL* with EXPORT_SYMBOL*
  modpost: check static EXPORT_SYMBOL* by modpost again
  modpost: squash sym_update_namespace() into sym_add_exported()
  modpost: use null string instead of NULL pointer for default namespace
  kbuild: implement CONFIG_TRIM_UNUSED_KSYMS without recursion
  modpost: merge two similar section mismatch warnings
  modpost: show offset from symbol for section mismatch warnings
  linux/export.h: rename 'sec' argument to 'license'

 .gitignore                        |   2 -
 Makefile                          |  22 +--
 arch/arc/include/asm/linkage.h    |   8 +-
 arch/ia64/include/asm/Kbuild      |   1 +
 arch/ia64/include/asm/export.h    |   3 -
 arch/ia64/kernel/head.S           |   2 +-
 arch/ia64/kernel/ivt.S            |   2 +-
 include/asm-generic/export.h      |  83 +---------
 include/asm-generic/vmlinux.lds.h |   1 +
 include/linux/export-internal.h   |  49 ++++++
 include/linux/export.h            | 128 ++++------------
 include/linux/pm.h                |  10 +-
 kernel/module/internal.h          |  12 ++
 scripts/Makefile.build            |  27 +---
 scripts/Makefile.modpost          |   7 +
 scripts/adjust_autoksyms.sh       |  73 ---------
 scripts/basic/fixdep.c            |   3 +-
 scripts/check-local-export        |  70 ---------
 scripts/gen_autoksyms.sh          |  62 --------
 scripts/gen_ksymdeps.sh           |  30 ----
 scripts/mod/modpost.c             | 242 +++++++++++++++++++-----------
 scripts/mod/modpost.h             |   1 +
 scripts/remove-stale-files        |   4 +
 23 files changed, 283 insertions(+), 559 deletions(-)
 delete mode 100644 arch/ia64/include/asm/export.h
 delete mode 100755 scripts/adjust_autoksyms.sh
 delete mode 100755 scripts/check-local-export
 delete mode 100755 scripts/gen_autoksyms.sh
 delete mode 100755 scripts/gen_ksymdeps.sh

-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
